.class public final enum Lcom/dropbox/core/v2/sharing/SharedLinkSettingsError;
.super Ljava/lang/Enum;
.source "SharedLinkSettingsError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/sharing/SharedLinkSettingsError$Serializer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/sharing/SharedLinkSettingsError;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/sharing/SharedLinkSettingsError;

.field public static final enum INVALID_SETTINGS:Lcom/dropbox/core/v2/sharing/SharedLinkSettingsError;

.field public static final enum NOT_AUTHORIZED:Lcom/dropbox/core/v2/sharing/SharedLinkSettingsError;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 28
    new-instance v0, Lcom/dropbox/core/v2/sharing/SharedLinkSettingsError;

    const-string v1, "INVALID_SETTINGS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/sharing/SharedLinkSettingsError;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/sharing/SharedLinkSettingsError;->INVALID_SETTINGS:Lcom/dropbox/core/v2/sharing/SharedLinkSettingsError;

    .line 35
    new-instance v1, Lcom/dropbox/core/v2/sharing/SharedLinkSettingsError;

    const-string v3, "NOT_AUTHORIZED"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/sharing/SharedLinkSettingsError;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/sharing/SharedLinkSettingsError;->NOT_AUTHORIZED:Lcom/dropbox/core/v2/sharing/SharedLinkSettingsError;

    const/4 v3, 0x2

    .line 19
    new-array v3, v3, [Lcom/dropbox/core/v2/sharing/SharedLinkSettingsError;

    aput-object v0, v3, v2

    aput-object v1, v3, v4

    sput-object v3, Lcom/dropbox/core/v2/sharing/SharedLinkSettingsError;->$VALUES:[Lcom/dropbox/core/v2/sharing/SharedLinkSettingsError;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 19
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/SharedLinkSettingsError;
    .locals 1

    .line 19
    const-class v0, Lcom/dropbox/core/v2/sharing/SharedLinkSettingsError;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/sharing/SharedLinkSettingsError;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/sharing/SharedLinkSettingsError;
    .locals 1

    .line 19
    sget-object v0, Lcom/dropbox/core/v2/sharing/SharedLinkSettingsError;->$VALUES:[Lcom/dropbox/core/v2/sharing/SharedLinkSettingsError;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/sharing/SharedLinkSettingsError;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/sharing/SharedLinkSettingsError;

    return-object v0
.end method
