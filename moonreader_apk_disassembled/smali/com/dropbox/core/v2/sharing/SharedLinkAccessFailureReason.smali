.class public final enum Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;
.super Ljava/lang/Enum;
.source "SharedLinkAccessFailureReason.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason$Serializer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;

.field public static final enum EMAIL_VERIFY_REQUIRED:Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;

.field public static final enum LOGIN_REQUIRED:Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;

.field public static final enum OTHER:Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;

.field public static final enum OWNER_ONLY:Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;

.field public static final enum PASSWORD_REQUIRED:Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;

.field public static final enum TEAM_ONLY:Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;


# direct methods
.method static constructor <clinit>()V
    .locals 13

    .line 24
    new-instance v0, Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;

    const-string v1, "LOGIN_REQUIRED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;->LOGIN_REQUIRED:Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;

    .line 30
    new-instance v1, Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;

    const-string v3, "EMAIL_VERIFY_REQUIRED"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;->EMAIL_VERIFY_REQUIRED:Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;

    .line 34
    new-instance v3, Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;

    const-string v5, "PASSWORD_REQUIRED"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;->PASSWORD_REQUIRED:Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;

    .line 38
    new-instance v5, Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;

    const-string v7, "TEAM_ONLY"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;->TEAM_ONLY:Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;

    .line 42
    new-instance v7, Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;

    const-string v9, "OWNER_ONLY"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;->OWNER_ONLY:Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;

    .line 50
    new-instance v9, Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;

    const-string v11, "OTHER"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;->OTHER:Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;

    const/4 v11, 0x6

    .line 19
    new-array v11, v11, [Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;

    aput-object v0, v11, v2

    aput-object v1, v11, v4

    aput-object v3, v11, v6

    aput-object v5, v11, v8

    aput-object v7, v11, v10

    aput-object v9, v11, v12

    sput-object v11, Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;->$VALUES:[Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;

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

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;
    .locals 1

    .line 19
    const-class v0, Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;
    .locals 1

    .line 19
    sget-object v0, Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;->$VALUES:[Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/sharing/SharedLinkAccessFailureReason;

    return-object v0
.end method
