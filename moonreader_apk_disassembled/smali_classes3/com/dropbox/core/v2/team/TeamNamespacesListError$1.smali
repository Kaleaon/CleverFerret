.class synthetic Lcom/dropbox/core/v2/team/TeamNamespacesListError$1;
.super Ljava/lang/Object;
.source "TeamNamespacesListError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/TeamNamespacesListError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$dropbox$core$v2$team$TeamNamespacesListError:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 42
    invoke-static {}, Lcom/dropbox/core/v2/team/TeamNamespacesListError;->values()[Lcom/dropbox/core/v2/team/TeamNamespacesListError;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/dropbox/core/v2/team/TeamNamespacesListError$1;->$SwitchMap$com$dropbox$core$v2$team$TeamNamespacesListError:[I

    :try_start_0
    sget-object v1, Lcom/dropbox/core/v2/team/TeamNamespacesListError;->INVALID_ARG:Lcom/dropbox/core/v2/team/TeamNamespacesListError;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/TeamNamespacesListError;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method
