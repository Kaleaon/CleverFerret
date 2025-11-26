.class public final enum Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;
.super Ljava/lang/Enum;
.source "CreateFileRequestError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/filerequests/CreateFileRequestError$Serializer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;

.field public static final enum APP_LACKS_ACCESS:Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;

.field public static final enum DISABLED_FOR_TEAM:Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;

.field public static final enum EMAIL_UNVERIFIED:Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;

.field public static final enum INVALID_LOCATION:Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;

.field public static final enum NOT_A_FOLDER:Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;

.field public static final enum NOT_FOUND:Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;

.field public static final enum NO_PERMISSION:Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;

.field public static final enum OTHER:Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;

.field public static final enum RATE_LIMIT:Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;

.field public static final enum VALIDATION_ERROR:Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;


# direct methods
.method static constructor <clinit>()V
    .locals 21

    .line 27
    new-instance v0, Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;

    const-string v1, "DISABLED_FOR_TEAM"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;->DISABLED_FOR_TEAM:Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;

    .line 35
    new-instance v1, Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;

    const-string v3, "OTHER"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;->OTHER:Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;

    .line 39
    new-instance v3, Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;

    const-string v5, "NOT_FOUND"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;->NOT_FOUND:Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;

    .line 43
    new-instance v5, Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;

    const-string v7, "NOT_A_FOLDER"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;->NOT_A_FOLDER:Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;

    .line 48
    new-instance v7, Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;

    const-string v9, "APP_LACKS_ACCESS"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;->APP_LACKS_ACCESS:Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;

    .line 52
    new-instance v9, Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;

    const-string v11, "NO_PERMISSION"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;->NO_PERMISSION:Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;

    .line 58
    new-instance v11, Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;

    const-string v13, "EMAIL_UNVERIFIED"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;-><init>(Ljava/lang/String;I)V

    sput-object v11, Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;->EMAIL_UNVERIFIED:Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;

    .line 63
    new-instance v13, Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;

    const-string v15, "VALIDATION_ERROR"

    const/16 v16, 0x0

    const/4 v2, 0x7

    invoke-direct {v13, v15, v2}, Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;-><init>(Ljava/lang/String;I)V

    sput-object v13, Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;->VALIDATION_ERROR:Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;

    .line 67
    new-instance v15, Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;

    const/16 v17, 0x7

    const-string v2, "INVALID_LOCATION"

    const/16 v18, 0x1

    const/16 v4, 0x8

    invoke-direct {v15, v2, v4}, Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;-><init>(Ljava/lang/String;I)V

    sput-object v15, Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;->INVALID_LOCATION:Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;

    .line 72
    new-instance v2, Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;

    const/16 v19, 0x8

    const-string v4, "RATE_LIMIT"

    const/16 v20, 0x2

    const/16 v6, 0x9

    invoke-direct {v2, v4, v6}, Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;->RATE_LIMIT:Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;

    const/16 v4, 0xa

    .line 22
    new-array v4, v4, [Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;

    aput-object v0, v4, v16

    aput-object v1, v4, v18

    aput-object v3, v4, v20

    aput-object v5, v4, v8

    aput-object v7, v4, v10

    aput-object v9, v4, v12

    aput-object v11, v4, v14

    aput-object v13, v4, v17

    aput-object v15, v4, v19

    aput-object v2, v4, v6

    sput-object v4, Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;->$VALUES:[Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;

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

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;
    .locals 1

    .line 22
    const-class v0, Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;
    .locals 1

    .line 22
    sget-object v0, Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;->$VALUES:[Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/filerequests/CreateFileRequestError;

    return-object v0
.end method
