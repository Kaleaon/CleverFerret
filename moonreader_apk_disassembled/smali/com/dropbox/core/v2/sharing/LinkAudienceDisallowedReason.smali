.class public final enum Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;
.super Ljava/lang/Enum;
.source "LinkAudienceDisallowedReason.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason$Serializer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;

.field public static final enum DELETE_AND_RECREATE:Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;

.field public static final enum OTHER:Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;

.field public static final enum PERMISSION_DENIED:Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;

.field public static final enum RESTRICTED_BY_SHARED_FOLDER:Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;

.field public static final enum RESTRICTED_BY_TEAM:Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;

.field public static final enum USER_ACCOUNT_TYPE:Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;

.field public static final enum USER_NOT_ON_TEAM:Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;


# direct methods
.method static constructor <clinit>()V
    .locals 15

    .line 27
    new-instance v0, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;

    const-string v1, "DELETE_AND_RECREATE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;->DELETE_AND_RECREATE:Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;

    .line 33
    new-instance v1, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;

    const-string v3, "RESTRICTED_BY_SHARED_FOLDER"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;->RESTRICTED_BY_SHARED_FOLDER:Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;

    .line 37
    new-instance v3, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;

    const-string v5, "RESTRICTED_BY_TEAM"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;->RESTRICTED_BY_TEAM:Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;

    .line 41
    new-instance v5, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;

    const-string v7, "USER_NOT_ON_TEAM"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;->USER_NOT_ON_TEAM:Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;

    .line 45
    new-instance v7, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;

    const-string v9, "USER_ACCOUNT_TYPE"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;->USER_ACCOUNT_TYPE:Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;

    .line 49
    new-instance v9, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;

    const-string v11, "PERMISSION_DENIED"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;->PERMISSION_DENIED:Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;

    .line 57
    new-instance v11, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;

    const-string v13, "OTHER"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;-><init>(Ljava/lang/String;I)V

    sput-object v11, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;->OTHER:Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;

    const/4 v13, 0x7

    .line 21
    new-array v13, v13, [Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;

    aput-object v0, v13, v2

    aput-object v1, v13, v4

    aput-object v3, v13, v6

    aput-object v5, v13, v8

    aput-object v7, v13, v10

    aput-object v9, v13, v12

    aput-object v11, v13, v14

    sput-object v13, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;->$VALUES:[Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 21
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;
    .locals 1

    .line 21
    const-class v0, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;
    .locals 1

    .line 21
    sget-object v0, Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;->$VALUES:[Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/sharing/LinkAudienceDisallowedReason;

    return-object v0
.end method
