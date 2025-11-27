.class public final enum Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;
.super Ljava/lang/Enum;
.source "ContextLogInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/ContextLogInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Tag"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

.field public static final enum ANONYMOUS:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

.field public static final enum NON_TEAM_MEMBER:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

.field public static final enum ORGANIZATION_TEAM:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

.field public static final enum OTHER:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

.field public static final enum TEAM:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

.field public static final enum TEAM_MEMBER:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

.field public static final enum TRUSTED_NON_TEAM_MEMBER:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;


# direct methods
.method static constructor <clinit>()V
    .locals 15

    .line 41
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    const-string v1, "ANONYMOUS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;->ANONYMOUS:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    .line 45
    new-instance v1, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    const-string v3, "NON_TEAM_MEMBER"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;->NON_TEAM_MEMBER:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    .line 49
    new-instance v3, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    const-string v5, "ORGANIZATION_TEAM"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;->ORGANIZATION_TEAM:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    .line 53
    new-instance v5, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    const-string v7, "TEAM"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;->TEAM:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    .line 57
    new-instance v7, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    const-string v9, "TEAM_MEMBER"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;->TEAM_MEMBER:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    .line 61
    new-instance v9, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    const-string v11, "TRUSTED_NON_TEAM_MEMBER"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;->TRUSTED_NON_TEAM_MEMBER:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    .line 70
    new-instance v11, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    const-string v13, "OTHER"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v11, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;->OTHER:Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    const/4 v13, 0x7

    .line 37
    new-array v13, v13, [Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    aput-object v0, v13, v2

    aput-object v1, v13, v4

    aput-object v3, v13, v6

    aput-object v5, v13, v8

    aput-object v7, v13, v10

    aput-object v9, v13, v12

    aput-object v11, v13, v14

    sput-object v13, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;->$VALUES:[Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 37
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;
    .locals 1

    .line 37
    const-class v0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;
    .locals 1

    .line 37
    sget-object v0, Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;->$VALUES:[Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/teamlog/ContextLogInfo$Tag;

    return-object v0
.end method
