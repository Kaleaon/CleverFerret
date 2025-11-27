.class synthetic Lcom/dropbox/core/v2/files/GetThumbnailBatchError$1;
.super Ljava/lang/Object;
.source "GetThumbnailBatchError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/files/GetThumbnailBatchError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$dropbox$core$v2$files$GetThumbnailBatchError:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 42
    invoke-static {}, Lcom/dropbox/core/v2/files/GetThumbnailBatchError;->values()[Lcom/dropbox/core/v2/files/GetThumbnailBatchError;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/dropbox/core/v2/files/GetThumbnailBatchError$1;->$SwitchMap$com$dropbox$core$v2$files$GetThumbnailBatchError:[I

    :try_start_0
    sget-object v1, Lcom/dropbox/core/v2/files/GetThumbnailBatchError;->TOO_MANY_FILES:Lcom/dropbox/core/v2/files/GetThumbnailBatchError;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/files/GetThumbnailBatchError;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method
