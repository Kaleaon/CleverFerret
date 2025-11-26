.class public final enum Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;
.super Ljava/lang/Enum;
.source "MemberAddV2Result.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/MemberAddV2Result;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Tag"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

.field public static final enum DUPLICATE_EXTERNAL_MEMBER_ID:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

.field public static final enum DUPLICATE_MEMBER_PERSISTENT_ID:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

.field public static final enum FREE_TEAM_MEMBER_LIMIT_REACHED:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

.field public static final enum OTHER:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

.field public static final enum PERSISTENT_ID_DISABLED:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

.field public static final enum SUCCESS:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

.field public static final enum TEAM_LICENSE_LIMIT:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

.field public static final enum USER_ALREADY_ON_TEAM:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

.field public static final enum USER_ALREADY_PAIRED:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

.field public static final enum USER_CREATION_FAILED:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

.field public static final enum USER_MIGRATION_FAILED:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

.field public static final enum USER_ON_ANOTHER_TEAM:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;


# direct methods
.method static constructor <clinit>()V
    .locals 25

    .line 45
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    const-string v1, "TEAM_LICENSE_LIMIT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->TEAM_LICENSE_LIMIT:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    .line 49
    new-instance v1, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    const-string v3, "FREE_TEAM_MEMBER_LIMIT_REACHED"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->FREE_TEAM_MEMBER_LIMIT_REACHED:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    .line 55
    new-instance v3, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    const-string v5, "USER_ALREADY_ON_TEAM"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->USER_ALREADY_ON_TEAM:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    .line 61
    new-instance v5, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    const-string v7, "USER_ON_ANOTHER_TEAM"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->USER_ON_ANOTHER_TEAM:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    .line 65
    new-instance v7, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    const-string v9, "USER_ALREADY_PAIRED"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->USER_ALREADY_PAIRED:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    .line 69
    new-instance v9, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    const-string v11, "USER_MIGRATION_FAILED"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->USER_MIGRATION_FAILED:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    .line 74
    new-instance v11, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    const-string v13, "DUPLICATE_EXTERNAL_MEMBER_ID"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v11, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->DUPLICATE_EXTERNAL_MEMBER_ID:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    .line 79
    new-instance v13, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    const-string v15, "DUPLICATE_MEMBER_PERSISTENT_ID"

    const/16 v16, 0x0

    const/4 v2, 0x7

    invoke-direct {v13, v15, v2}, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v13, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->DUPLICATE_MEMBER_PERSISTENT_ID:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    .line 84
    new-instance v15, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    const/16 v17, 0x7

    const-string v2, "PERSISTENT_ID_DISABLED"

    const/16 v18, 0x1

    const/16 v4, 0x8

    invoke-direct {v15, v2, v4}, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v15, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->PERSISTENT_ID_DISABLED:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    .line 88
    new-instance v2, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    const/16 v19, 0x8

    const-string v4, "USER_CREATION_FAILED"

    const/16 v20, 0x2

    const/16 v6, 0x9

    invoke-direct {v2, v4, v6}, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->USER_CREATION_FAILED:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    .line 92
    new-instance v4, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    const/16 v21, 0x9

    const-string v6, "SUCCESS"

    const/16 v22, 0x3

    const/16 v8, 0xa

    invoke-direct {v4, v6, v8}, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->SUCCESS:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    .line 101
    new-instance v6, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    const/16 v23, 0xa

    const-string v8, "OTHER"

    const/16 v24, 0x4

    const/16 v10, 0xb

    invoke-direct {v6, v8, v10}, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v6, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->OTHER:Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    const/16 v8, 0xc

    .line 41
    new-array v8, v8, [Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    aput-object v0, v8, v16

    aput-object v1, v8, v18

    aput-object v3, v8, v20

    aput-object v5, v8, v22

    aput-object v7, v8, v24

    aput-object v9, v8, v12

    aput-object v11, v8, v14

    aput-object v13, v8, v17

    aput-object v15, v8, v19

    aput-object v2, v8, v21

    aput-object v4, v8, v23

    aput-object v6, v8, v10

    sput-object v8, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->$VALUES:[Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 41
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;
    .locals 1

    .line 41
    const-class v0, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;
    .locals 1

    .line 41
    sget-object v0, Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->$VALUES:[Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/team/MemberAddV2Result$Tag;

    return-object v0
.end method
