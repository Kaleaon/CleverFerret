.class public final enum Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;
.super Ljava/lang/Enum;
.source "SharedFolderAccessError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/sharing/SharedFolderAccessError$Serializer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

.field public static final enum EMAIL_UNVERIFIED:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

.field public static final enum INVALID_ID:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

.field public static final enum INVALID_MEMBER:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

.field public static final enum NOT_A_MEMBER:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

.field public static final enum OTHER:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

.field public static final enum UNMOUNTED:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;


# direct methods
.method static constructor <clinit>()V
    .locals 13

    .line 27
    new-instance v0, Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    const-string v1, "INVALID_ID"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;->INVALID_ID:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    .line 31
    new-instance v1, Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    const-string v3, "NOT_A_MEMBER"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;->NOT_A_MEMBER:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    .line 35
    new-instance v3, Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    const-string v5, "INVALID_MEMBER"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;->INVALID_MEMBER:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    .line 39
    new-instance v5, Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    const-string v7, "EMAIL_UNVERIFIED"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;->EMAIL_UNVERIFIED:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    .line 43
    new-instance v7, Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    const-string v9, "UNMOUNTED"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;->UNMOUNTED:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    .line 51
    new-instance v9, Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    const-string v11, "OTHER"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;->OTHER:Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    const/4 v11, 0x6

    .line 22
    new-array v11, v11, [Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    aput-object v0, v11, v2

    aput-object v1, v11, v4

    aput-object v3, v11, v6

    aput-object v5, v11, v8

    aput-object v7, v11, v10

    aput-object v9, v11, v12

    sput-object v11, Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;->$VALUES:[Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 22
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;
    .locals 1

    .line 22
    const-class v0, Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;
    .locals 1

    .line 22
    sget-object v0, Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;->$VALUES:[Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/sharing/SharedFolderAccessError;

    return-object v0
.end method
