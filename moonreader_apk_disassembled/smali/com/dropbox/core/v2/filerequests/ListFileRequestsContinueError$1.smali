.class synthetic Lcom/dropbox/core/v2/filerequests/ListFileRequestsContinueError$1;
.super Ljava/lang/Object;
.source "ListFileRequestsContinueError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/filerequests/ListFileRequestsContinueError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$dropbox$core$v2$filerequests$ListFileRequestsContinueError:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 49
    invoke-static {}, Lcom/dropbox/core/v2/filerequests/ListFileRequestsContinueError;->values()[Lcom/dropbox/core/v2/filerequests/ListFileRequestsContinueError;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/dropbox/core/v2/filerequests/ListFileRequestsContinueError$1;->$SwitchMap$com$dropbox$core$v2$filerequests$ListFileRequestsContinueError:[I

    :try_start_0
    sget-object v1, Lcom/dropbox/core/v2/filerequests/ListFileRequestsContinueError;->DISABLED_FOR_TEAM:Lcom/dropbox/core/v2/filerequests/ListFileRequestsContinueError;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/filerequests/ListFileRequestsContinueError;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :try_start_1
    sget-object v0, Lcom/dropbox/core/v2/filerequests/ListFileRequestsContinueError$1;->$SwitchMap$com$dropbox$core$v2$filerequests$ListFileRequestsContinueError:[I

    sget-object v1, Lcom/dropbox/core/v2/filerequests/ListFileRequestsContinueError;->OTHER:Lcom/dropbox/core/v2/filerequests/ListFileRequestsContinueError;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/filerequests/ListFileRequestsContinueError;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :try_start_2
    sget-object v0, Lcom/dropbox/core/v2/filerequests/ListFileRequestsContinueError$1;->$SwitchMap$com$dropbox$core$v2$filerequests$ListFileRequestsContinueError:[I

    sget-object v1, Lcom/dropbox/core/v2/filerequests/ListFileRequestsContinueError;->INVALID_CURSOR:Lcom/dropbox/core/v2/filerequests/ListFileRequestsContinueError;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/filerequests/ListFileRequestsContinueError;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    :catch_2
    return-void
.end method
