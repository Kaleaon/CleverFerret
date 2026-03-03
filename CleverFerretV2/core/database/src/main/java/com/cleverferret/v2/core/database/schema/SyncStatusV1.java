package com.cleverferret.v2.core.database.schema;

public enum SyncStatusV1 {
    CLEAN,
    DIRTY_LOCAL,
    DIRTY_REMOTE,
    CONFLICT,
    SYNCING,
    FAILED
}
