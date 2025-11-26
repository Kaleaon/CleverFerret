.class public final enum Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;
.super Ljava/lang/Enum;
.source "AddPaperDocUserResult.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/paper/AddPaperDocUserResult$Serializer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;

.field public static final enum DAILY_LIMIT_REACHED:Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;

.field public static final enum FAILED_USER_DATA_RETRIEVAL:Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;

.field public static final enum OTHER:Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;

.field public static final enum PERMISSION_ALREADY_GRANTED:Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;

.field public static final enum SHARING_OUTSIDE_TEAM_DISABLED:Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;

.field public static final enum SUCCESS:Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;

.field public static final enum UNKNOWN_ERROR:Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;

.field public static final enum USER_IS_OWNER:Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;


# direct methods
.method static constructor <clinit>()V
    .locals 17

    .line 24
    new-instance v0, Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;

    const-string v1, "SUCCESS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;->SUCCESS:Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;

    .line 29
    new-instance v1, Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;

    const-string v3, "UNKNOWN_ERROR"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;->UNKNOWN_ERROR:Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;

    .line 33
    new-instance v3, Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;

    const-string v5, "SHARING_OUTSIDE_TEAM_DISABLED"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;->SHARING_OUTSIDE_TEAM_DISABLED:Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;

    .line 38
    new-instance v5, Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;

    const-string v7, "DAILY_LIMIT_REACHED"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;->DAILY_LIMIT_REACHED:Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;

    .line 42
    new-instance v7, Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;

    const-string v9, "USER_IS_OWNER"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;->USER_IS_OWNER:Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;

    .line 46
    new-instance v9, Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;

    const-string v11, "FAILED_USER_DATA_RETRIEVAL"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;->FAILED_USER_DATA_RETRIEVAL:Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;

    .line 50
    new-instance v11, Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;

    const-string v13, "PERMISSION_ALREADY_GRANTED"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;-><init>(Ljava/lang/String;I)V

    sput-object v11, Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;->PERMISSION_ALREADY_GRANTED:Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;

    .line 58
    new-instance v13, Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;

    const-string v15, "OTHER"

    const/16 v16, 0x0

    const/4 v2, 0x7

    invoke-direct {v13, v15, v2}, Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;-><init>(Ljava/lang/String;I)V

    sput-object v13, Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;->OTHER:Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;

    const/16 v15, 0x8

    .line 19
    new-array v15, v15, [Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;

    aput-object v0, v15, v16

    aput-object v1, v15, v4

    aput-object v3, v15, v6

    aput-object v5, v15, v8

    aput-object v7, v15, v10

    aput-object v9, v15, v12

    aput-object v11, v15, v14

    aput-object v13, v15, v2

    sput-object v15, Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;->$VALUES:[Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;

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

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;
    .locals 1

    .line 19
    const-class v0, Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;
    .locals 1

    .line 19
    sget-object v0, Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;->$VALUES:[Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/paper/AddPaperDocUserResult;

    return-object v0
.end method
