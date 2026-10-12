package com.universalmedialibrary.api.plugin.grpc

import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test

class PluginPermissionValidatorTest {

    private lateinit var validator: PluginPermissionValidator

    @Before
    fun setUp() {
        validator = PluginPermissionValidator(context = null)
    }

    @Test
    fun `validatePluginPackage returns success for allowed package prefix`() {
        val result = validator.validatePluginPackage("com.universalmedialibrary.plugin.test")
        assertTrue("Expected validation success for valid package prefix", result.isSuccess)
    }

    @Test
    fun `validatePluginPackage returns failure for untrusted external package`() {
        val result = validator.validatePluginPackage("com.untrusted.maliciousplugin")
        assertTrue("Expected validation failure for untrusted package", result.isFailure)
        assertTrue("Expected SecurityException", result.exceptionOrNull() is SecurityException)
    }
}
