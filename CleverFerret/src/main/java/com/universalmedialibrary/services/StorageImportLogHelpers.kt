package com.universalmedialibrary.services

import android.content.Context

fun listImportLogs(context: Context): List<ImportLogInfo> {
    return try {
        val dir = File(context.filesDir, "import_logs")
        if (!dir.exists()) return emptyList()
        dir.listFiles { f -> f.isFile && f.name.endsWith(".json") }?.sortedByDescending { it.lastModified() }?.mapNotNull { file ->
            runCatching {
                val parsed = importLogJson.decodeFromString<ImportTransactionLog>(file.readText())
                ImportLogInfo(
                    fileName = file.name,
                    importId = parsed.importId,
                    startedAt = parsed.startedAt,
                    finishedAt = parsed.finishedAt,
                    moveFiles = parsed.moveFiles,
                    operationCount = parsed.operations.size,
                    failedCount = parsed.operations.count { it.status == ImportOperationStatus.FAILED }
                )
            }.getOrNull()
        } ?: emptyList()
    } catch (_: Exception) {
        emptyList()
    }
}

fun readImportLog(context: Context, fileName: String): ImportTransactionLog? {
    return runCatching {
        val file = File(File(context.filesDir, "import_logs"), fileName)
        if (!file.exists()) return null
        importLogJson.decodeFromString<ImportTransactionLog>(file.readText())
    }.getOrNull()
}

internal fun writeImportLog(context: Context, log: ImportTransactionLog) {
    runCatching {
        val dir = File(context.filesDir, "import_logs")
        if (!dir.exists()) dir.mkdirs()
        val file = File(dir, "import_${log.importId}.json")
        file.writeText(importLogJson.encodeToString(log))
    }
}

