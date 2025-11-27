.class synthetic Lcom/dropbox/core/v2/async/PollError$1;
.super Ljava/lang/Object;
.source "PollError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/async/PollError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$dropbox$core$v2$async$PollError:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 51
    invoke-static {}, Lcom/dropbox/core/v2/async/PollError;->values()[Lcom/dropbox/core/v2/async/PollError;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/dropbox/core/v2/async/PollError$1;->$SwitchMap$com$dropbox$core$v2$async$PollError:[I

    :try_start_0
    sget-object v1, Lcom/dropbox/core/v2/async/PollError;->INVALID_ASYNC_JOB_ID:Lcom/dropbox/core/v2/async/PollError;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/async/PollError;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :try_start_1
    sget-object v0, Lcom/dropbox/core/v2/async/PollError$1;->$SwitchMap$com$dropbox$core$v2$async$PollError:[I

    sget-object v1, Lcom/dropbox/core/v2/async/PollError;->INTERNAL_ERROR:Lcom/dropbox/core/v2/async/PollError;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/async/PollError;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    return-void
.end method
