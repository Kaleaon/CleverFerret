package com.universalmedialibrary.services.radio

import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import okhttp3.Request
import org.json.JSONObject
import java.util.Locale
import java.util.regex.Pattern
import javax.inject.Inject
import javax.inject.Singleton
import com.universalmedialibrary.core.logging.AppLogger

/**
 * Service to fetch FM/DAB station metadata using RadioDNS.
 * 
 * How it works:
 * 1. Constructs FQDN from station parameters (PI Code, Frequency, GCC).
 * 2. Performs DNS SRV lookup (via Google Public DNS API) to find the station's IP service endpoint.
 * 3. Fetches Service Information (SI) to get logos and metadata.
 */
@Singleton
class RadioDnsService @Inject constructor(
    private val okHttpClient: OkHttpClient
) {

    data class StationMetadata(
        val name: String,
        val shortName: String? = null,
        val logoUrl: String? = null,
        val description: String? = null,
        val streamUrl: String? = null
    )

    /**
     * Lookup station metadata using FM parameters.
     * 
     * @param piCode Program Identification code (hex string, e.g. "C686")
     * @param frequency Frequency in MHz (e.g. 88.5)
     * @param ecc Extended Country Code (hex string, e.g. "E1")
     */
    suspend fun lookupFmStation(piCode: String, frequency: Double, ecc: String = "CE1"): StationMetadata? = withContext(Dispatchers.IO) {
        try {
            // 1. Construct FQDN
            // Format: <freq>.<pi>.<gcc>.<cc>.fm.radiodns.org
            // Freq: 08850 (for 88.5) -> 5 digits
            val freqStr = String.format(Locale.US, "%05d", (frequency * 100).toInt())
            val fqdn = "$freqStr.$piCode.$ecc.fm.radiodns.org".lowercase()

            // 2. Perform SRV Lookup using Google Public DNS API (DoH)
            // Target: _radioepg._tcp.<fqdn>
            val srvTarget = "_radioepg._tcp.$fqdn"
            
            val dnsUrl = "https://dns.google/resolve?name=$srvTarget&type=SRV"
            val request = Request.Builder().url(dnsUrl).build()
            
            val response = okHttpClient.newCall(request).execute()
            if (!response.isSuccessful) return@withContext null
            
            val jsonStr = response.body?.string() ?: return@withContext null
            val json = JSONObject(jsonStr)
            
            if (!json.has("Answer")) return@withContext null
            
            val answers = json.getJSONArray("Answer")
            if (answers.length() == 0) return@withContext null
            
            // Parse SRV record: priority weight port target
            // Google DNS returns data as string: "0 100 80 radio.example.com."
            val srvData = answers.getJSONObject(0).getString("data").split(" ")
            if (srvData.size < 4) return@withContext null
            
            val port = srvData[2].toIntOrNull() ?: 80
            val target = srvData[3].trimEnd('.') // Remove trailing dot
            
            // 3. Fetch Service Information (SI)
            return@withContext fetchServiceInformation(target, port)

        } catch (e: Exception) {
            AppLogger.error("RadioDnsService", "Unhandled exception", e)
            null
        }
    }
    
    /**
     * Fetch Service Information (SI) XML from the resolved host.
     */
    private fun fetchServiceInformation(host: String, port: Int): StationMetadata? {
        try {
            // RadioDNS SI endpoint: /radiodns/spi/3.1/SI.xml
            val url = "http://$host:$port/radiodns/spi/3.1/SI.xml"
            val request = Request.Builder().url(url).build()
            
            val response = okHttpClient.newCall(request).execute()
            if (!response.isSuccessful) return null
            
            val xml = response.body?.string() ?: return null
            
            // Simple Regex parsing to avoid heavy XML setup for just a logo/name
            // Look for <mediaDescription> block with <multimedia>
            
            // Find Name (ShortName or MediumName)
            // <shortName>Station</shortName>
            val nameMatcher = Pattern.compile("<mediumName[^>]*>([^<]+)</mediumName>").matcher(xml)
            val name = if (nameMatcher.find()) nameMatcher.group(1) else {
                val shortMatcher = Pattern.compile("<shortName[^>]*>([^<]+)</shortName>").matcher(xml)
                if (shortMatcher.find()) shortMatcher.group(1) else "Unknown Station"
            }
            
            // Find Logo
            // <multimedia url="http://..." ...>
            val logoMatcher = Pattern.compile("<multimedia[^>]*url=\"([^\"]+)\"[^>]*>").matcher(xml)
            val logoUrl = if (logoMatcher.find()) logoMatcher.group(1) else null
            
            // Find Description
            val descMatcher = Pattern.compile("<description[^>]*>([^<]+)</description>").matcher(xml)
            val description = if (descMatcher.find()) descMatcher.group(1) else null

            // Find IP Bearer (Stream URL)
            // Look for <bearer> with id starting with http/https
            // <bearer id="http://example.com/stream" cost="10" mimeType="audio/mpeg"/>
            // OR for older specs, might be in <onDemand> or similar, but Hybrid Radio uses bearers.
            val bearerMatcher = Pattern.compile("<bearer[^>]*id=\"(http[s]?://[^\"]+)\"[^>]*>").matcher(xml)
            var streamUrl: String? = null
            if (bearerMatcher.find()) {
                streamUrl = bearerMatcher.group(1)
            }
            
            return StationMetadata(
                name = name,
                shortName = name, // Simplify
                logoUrl = logoUrl,
                description = description,
                streamUrl = streamUrl
            )
            
        } catch (e: Exception) {
            AppLogger.error("RadioDnsService", "Unhandled exception", e)
            return null
        }
    }
}
