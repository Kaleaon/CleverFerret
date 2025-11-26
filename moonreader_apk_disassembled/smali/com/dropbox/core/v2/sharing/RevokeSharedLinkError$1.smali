.class synthetic Lcom/dropbox/core/v2/sharing/RevokeSharedLinkError$1;
.super Ljava/lang/Object;
.source "RevokeSharedLinkError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/sharing/RevokeSharedLinkError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$dropbox$core$v2$sharing$RevokeSharedLinkError:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 56
    invoke-static {}, Lcom/dropbox/core/v2/sharing/RevokeSharedLinkError;->values()[Lcom/dropbox/core/v2/sharing/RevokeSharedLinkError;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/dropbox/core/v2/sharing/RevokeSharedLinkError$1;->$SwitchMap$com$dropbox$core$v2$sharing$RevokeSharedLinkError:[I

    :try_start_0
    sget-object v1, Lcom/dropbox/core/v2/sharing/RevokeSharedLinkError;->SHARED_LINK_NOT_FOUND:Lcom/dropbox/core/v2/sharing/RevokeSharedLinkError;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/sharing/RevokeSharedLinkError;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :try_start_1
    sget-object v0, Lcom/dropbox/core/v2/sharing/RevokeSharedLinkError$1;->$SwitchMap$com$dropbox$core$v2$sharing$RevokeSharedLinkError:[I

    sget-object v1, Lcom/dropbox/core/v2/sharing/RevokeSharedLinkError;->SHARED_LINK_ACCESS_DENIED:Lcom/dropbox/core/v2/sharing/RevokeSharedLinkError;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/sharing/RevokeSharedLinkError;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :try_start_2
    sget-object v0, Lcom/dropbox/core/v2/sharing/RevokeSharedLinkError$1;->$SwitchMap$com$dropbox$core$v2$sharing$RevokeSharedLinkError:[I

    sget-object v1, Lcom/dropbox/core/v2/sharing/RevokeSharedLinkError;->UNSUPPORTED_LINK_TYPE:Lcom/dropbox/core/v2/sharing/RevokeSharedLinkError;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/sharing/RevokeSharedLinkError;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    :catch_2
    :try_start_3
    sget-object v0, Lcom/dropbox/core/v2/sharing/RevokeSharedLinkError$1;->$SwitchMap$com$dropbox$core$v2$sharing$RevokeSharedLinkError:[I

    sget-object v1, Lcom/dropbox/core/v2/sharing/RevokeSharedLinkError;->OTHER:Lcom/dropbox/core/v2/sharing/RevokeSharedLinkError;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/sharing/RevokeSharedLinkError;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    :catch_3
    :try_start_4
    sget-object v0, Lcom/dropbox/core/v2/sharing/RevokeSharedLinkError$1;->$SwitchMap$com$dropbox$core$v2$sharing$RevokeSharedLinkError:[I

    sget-object v1, Lcom/dropbox/core/v2/sharing/RevokeSharedLinkError;->SHARED_LINK_MALFORMED:Lcom/dropbox/core/v2/sharing/RevokeSharedLinkError;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/sharing/RevokeSharedLinkError;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_4

    :catch_4
    return-void
.end method
