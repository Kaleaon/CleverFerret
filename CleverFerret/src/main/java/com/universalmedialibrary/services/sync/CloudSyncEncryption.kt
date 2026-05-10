package com.universalmedialibrary.services.sync

internal fun encryptData(item: SyncItem): SyncItem {
    try {
        // Serialize data to JSON
        val jsonData = serializeToJson(item.data)

        // Encrypt using AES-GCM
        val cipher = getCipher()
        val secretKey = getOrCreateSecretKey()
        cipher.init(javax.crypto.Cipher.ENCRYPT_MODE, secretKey)

        val iv = cipher.iv
        val encrypted = cipher.doFinal(jsonData.toByteArray())
        val combined = iv + encrypted
        val encryptedString = android.util.Base64.encodeToString(combined, android.util.Base64.DEFAULT)

        // Return item with encrypted data
        return item.copy(
            data = mapOf("encrypted" to encryptedString)
        )
    } catch (e: Exception) {
        // Fallback to unencrypted if encryption fails
        return item
    }
}

internal fun decryptData(item: SyncItem): SyncItem {
    try {
        val encryptedString = item.data["encrypted"] as? String ?: return item

        // Decrypt using AES-GCM
        val cipher = getCipher()
        val secretKey = getOrCreateSecretKey()

        val decoded = android.util.Base64.decode(encryptedString, android.util.Base64.DEFAULT)
        val iv = decoded.copyOfRange(0, 12)
        val ciphertext = decoded.copyOfRange(12, decoded.size)

        val gcmSpec = javax.crypto.spec.GCMParameterSpec(128, iv)
        cipher.init(javax.crypto.Cipher.DECRYPT_MODE, secretKey, gcmSpec)

        val decrypted = cipher.doFinal(ciphertext)
        val jsonData = String(decrypted)

        // Deserialize JSON back to map
        val originalData = deserializeFromJson(jsonData)

        return item.copy(data = originalData)
    } catch (e: Exception) {
        // Return original if decryption fails
        return item
    }
}

internal fun getOrCreateSecretKey(): javax.crypto.SecretKey {
    val keyStore = java.security.KeyStore.getInstance("AndroidKeyStore")
    keyStore.load(null)

    val alias = "cleverferret_sync_key"

    if (!keyStore.containsAlias(alias)) {
        val keyGenerator = javax.crypto.KeyGenerator.getInstance(
            android.security.keystore.KeyProperties.KEY_ALGORITHM_AES,
            "AndroidKeyStore"
        )

        val keyGenParameterSpec = android.security.keystore.KeyGenParameterSpec.Builder(
            alias,
            android.security.keystore.KeyProperties.PURPOSE_ENCRYPT or
            android.security.keystore.KeyProperties.PURPOSE_DECRYPT
        )
            .setBlockModes(android.security.keystore.KeyProperties.BLOCK_MODE_GCM)
            .setEncryptionPaddings(android.security.keystore.KeyProperties.ENCRYPTION_PADDING_NONE)
            .build()

        keyGenerator.init(keyGenParameterSpec)
        return keyGenerator.generateKey()
    }

    return keyStore.getKey(alias, null) as javax.crypto.SecretKey
}

internal fun getCipher(): javax.crypto.Cipher {
    return javax.crypto.Cipher.getInstance(
        android.security.keystore.KeyProperties.KEY_ALGORITHM_AES + "/" +
        android.security.keystore.KeyProperties.BLOCK_MODE_GCM + "/" +
        android.security.keystore.KeyProperties.ENCRYPTION_PADDING_NONE
    )
}

