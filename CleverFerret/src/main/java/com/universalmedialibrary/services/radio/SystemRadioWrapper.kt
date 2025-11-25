package com.universalmedialibrary.services.radio

import android.content.Context
import android.os.Handler
import android.os.Looper
import android.util.Log
import java.lang.reflect.InvocationHandler
import java.lang.reflect.Method
import java.lang.reflect.Proxy
import java.util.ArrayList

/**
 * Wrapper for android.hardware.radio.* APIs using Reflection.
 * This allows the app to compile against standard SDKs while utilizing
 * the RadioManager System API on devices that support it.
 */
class SystemRadioWrapper(private val context: Context) {

    private val TAG = "SystemRadioWrapper"

    // Reflection Classes
    private var radioManagerClass: Class<*>? = null
    private var radioTunerClass: Class<*>? = null
    private var modulePropertiesClass: Class<*>? = null
    private var programSelectorClass: Class<*>? = null
    private var programInfoClass: Class<*>? = null
    private var radioMetadataClass: Class<*>? = null
    
    // API Instances
    private var radioManager: Any? = null
    private var radioTuner: Any? = null
    private var fmModule: Any? = null

    init {
        try {
            radioManagerClass = Class.forName("android.hardware.radio.RadioManager")
            radioTunerClass = Class.forName("android.hardware.radio.RadioTuner")
            modulePropertiesClass = Class.forName("android.hardware.radio.RadioManager\$ModuleProperties")
            programSelectorClass = Class.forName("android.hardware.radio.ProgramSelector")
            programInfoClass = Class.forName("android.hardware.radio.RadioManager\$ProgramInfo")
            radioMetadataClass = Class.forName("android.hardware.radio.RadioMetadata")
        } catch (e: ClassNotFoundException) {
            Log.e(TAG, "Radio System APIs not found on this device", e)
        }
    }

    fun isSupported(): Boolean {
        return radioManagerClass != null
    }

    fun init(): Boolean {
        if (radioManagerClass == null) return false
        
        try {
            // Get RadioManager service
            // Context.RADIO_SERVICE constant is "radio"
            radioManager = context.getSystemService("radio")
            if (radioManager == null) return false

            // List Modules
            val modules = ArrayList<Any>()
            val listModulesMethod = radioManagerClass!!.getMethod("listModules", List::class.java)
            val result = listModulesMethod.invoke(radioManager, modules) as Int
            
            if (result != 0) return false // STATUS_OK = 0
            
            if (modules.isEmpty()) return false
            
            // Find FM Module
            // We iterate through modules to find one with FM band
            // For simplicity in this wrapper, we'll take the first one 
            // or try to inspect bands if necessary. 
            // Most devices with FM only have one relevant module.
            fmModule = modules[0]
            
            return true
        } catch (e: Exception) {
            Log.e(TAG, "Error initializing RadioManager", e)
            return false
        }
    }

    fun openTuner(callback: RadioTunerCallback): Boolean {
        if (radioManager == null || fmModule == null) return false

        try {
            val callbackClass = Class.forName("android.hardware.radio.RadioTuner\$Callback")
            
            val proxy = Proxy.newProxyInstance(
                callbackClass.classLoader,
                arrayOf(callbackClass),
                object : InvocationHandler {
                    override fun invoke(proxy: Any, method: Method, args: Array<out Any>?): Any? {
                        try {
                            when (method.name) {
                                "onProgramInfoChanged" -> {
                                    val info = args?.get(0)
                                    if (info != null) handleProgramInfo(info, callback)
                                }
                                "onSignalStrength" -> {
                                    val strength = args?.get(0) as Int
                                    callback.onSignalStrength(strength)
                                }
                                "onError" -> {
                                    val status = args?.get(0) as Int
                                    callback.onError(status)
                                }
                            }
                        } catch (e: Exception) {
                            Log.e(TAG, "Error in callback proxy", e)
                        }
                        return null
                    }
                }
            )

            val getIdMethod = modulePropertiesClass!!.getMethod("getId")
            val id = getIdMethod.invoke(fmModule) as Int

            val openTunerMethod = radioManagerClass!!.getMethod(
                "openTuner",
                Int::class.javaPrimitiveType, // moduleId
                Class.forName("android.hardware.radio.RadioManager\$BandConfig"), // config
                Boolean::class.javaPrimitiveType, // withAudio
                callbackClass, // callback
                Handler::class.java // handler
            )

            radioTuner = openTunerMethod.invoke(radioManager, id, null, true, proxy, Handler(Looper.getMainLooper()))
            return radioTuner != null

        } catch (e: Exception) {
            Log.e(TAG, "Error opening tuner", e)
            return false
        }
    }

    fun tune(freqKhz: Int): Boolean {
        if (radioTuner == null) return false
        try {
            // RadioManager.BAND_FM constant
            val bandFmField = radioManagerClass!!.getField("BAND_FM")
            val bandFm = bandFmField.getInt(null)

            val createMethod = programSelectorClass!!.getMethod("createAmFmSelector", Int::class.javaPrimitiveType, Int::class.javaPrimitiveType)
            val selector = createMethod.invoke(null, bandFm, freqKhz)

            val tuneMethod = radioTunerClass!!.getMethod("tune", programSelectorClass)
            tuneMethod.invoke(radioTuner, selector)
            return true
        } catch (e: Exception) {
            Log.e(TAG, "Error tuning", e)
            return false
        }
    }

    fun setMute(muted: Boolean): Boolean {
        if (radioTuner == null) return false
        try {
            val setMuteMethod = radioTunerClass!!.getMethod("setMute", Boolean::class.javaPrimitiveType)
            val result = setMuteMethod.invoke(radioTuner, muted) as Int
            return result == 0
        } catch (e: Exception) {
            Log.e(TAG, "Error setting mute", e)
            return false
        }
    }

    fun scan(up: Boolean) {
        if (radioTuner == null) return
        try {
            // RadioTuner.DIRECTION_UP / DOWN
            val directionUpField = radioTunerClass!!.getField("DIRECTION_UP")
            val directionDownField = radioTunerClass!!.getField("DIRECTION_DOWN")
            
            val direction = if (up) directionUpField.getInt(null) else directionDownField.getInt(null)
            
            val scanMethod = radioTunerClass!!.getMethod("scan", Int::class.javaPrimitiveType, Boolean::class.javaPrimitiveType)
            scanMethod.invoke(radioTuner, direction, true) // skipSubChannel = true
        } catch (e: Exception) {
            Log.e(TAG, "Error scanning", e)
        }
    }

    fun close() {
        if (radioTuner == null) return
        try {
            val closeMethod = radioTunerClass!!.getMethod("close")
            closeMethod.invoke(radioTuner)
        } catch (e: Exception) {
             Log.e(TAG, "Error closing tuner", e)
        } finally {
            radioTuner = null
        }
    }

    private fun handleProgramInfo(info: Any, callback: RadioTunerCallback) {
        try {
            // Extract primary ID (frequency)
            val getSelectorMethod = programInfoClass!!.getMethod("getSelector")
            val selector = getSelectorMethod.invoke(info)
            
            val getPrimaryIdMethod = programSelectorClass!!.getMethod("getPrimaryId")
            val freq = (getPrimaryIdMethod.invoke(selector) as Long).toInt()
            
            // Extract Metadata
            val getMetadataMethod = programInfoClass!!.getMethod("getMetadata")
            val metadata = getMetadataMethod.invoke(info)
            
            var name: String? = null
            var text: String? = null
            var pi: Int = 0
            
            if (metadata != null) {
                // RDS Keys are typically in RadioMetadata
                // Need to find constants METADATA_KEY_RDS_PS, METADATA_KEY_RDS_RT
                val psKeyField = radioMetadataClass!!.getField("METADATA_KEY_RDS_PS")
                val rtKeyField = radioMetadataClass!!.getField("METADATA_KEY_RDS_RT")
                val psKey = psKeyField.get(null) as String
                val rtKey = rtKeyField.get(null) as String
                
                val getStringMethod = radioMetadataClass!!.getMethod("getString", String::class.java)
                name = getStringMethod.invoke(metadata, psKey) as? String
                text = getStringMethod.invoke(metadata, rtKey) as? String
                
                // PI code
                 val piKeyField = radioMetadataClass!!.getField("METADATA_KEY_RDS_PI")
                 val piKey = piKeyField.get(null) as String
                 val getIntMethod = radioMetadataClass!!.getMethod("getInt", String::class.java)
                 pi = getIntMethod.invoke(metadata, piKey) as Int
            }
            
            callback.onProgramInfoChanged(freq, name, text, pi)

        } catch (e: Exception) {
            Log.e(TAG, "Error parsing ProgramInfo", e)
        }
    }

    interface RadioTunerCallback {
        fun onProgramInfoChanged(freq: Int, name: String?, text: String?, pi: Int)
        fun onSignalStrength(strength: Int)
        fun onError(status: Int)
    }
}
