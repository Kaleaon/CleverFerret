.class synthetic Lcom/dropbox/core/v2/team/TokenGetAuthenticatedAdminError$1;
.super Ljava/lang/Object;
.source "TokenGetAuthenticatedAdminError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/TokenGetAuthenticatedAdminError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$dropbox$core$v2$team$TokenGetAuthenticatedAdminError:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 52
    invoke-static {}, Lcom/dropbox/core/v2/team/TokenGetAuthenticatedAdminError;->values()[Lcom/dropbox/core/v2/team/TokenGetAuthenticatedAdminError;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/dropbox/core/v2/team/TokenGetAuthenticatedAdminError$1;->$SwitchMap$com$dropbox$core$v2$team$TokenGetAuthenticatedAdminError:[I

    :try_start_0
    sget-object v1, Lcom/dropbox/core/v2/team/TokenGetAuthenticatedAdminError;->MAPPING_NOT_FOUND:Lcom/dropbox/core/v2/team/TokenGetAuthenticatedAdminError;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/TokenGetAuthenticatedAdminError;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :try_start_1
    sget-object v0, Lcom/dropbox/core/v2/team/TokenGetAuthenticatedAdminError$1;->$SwitchMap$com$dropbox$core$v2$team$TokenGetAuthenticatedAdminError:[I

    sget-object v1, Lcom/dropbox/core/v2/team/TokenGetAuthenticatedAdminError;->ADMIN_NOT_ACTIVE:Lcom/dropbox/core/v2/team/TokenGetAuthenticatedAdminError;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/team/TokenGetAuthenticatedAdminError;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    return-void
.end method
