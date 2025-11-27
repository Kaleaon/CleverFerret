.class public final enum Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;
.super Ljava/lang/Enum;
.source "UserSelectorArg.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/UserSelectorArg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Tag"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

.field public static final enum EMAIL:Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

.field public static final enum EXTERNAL_ID:Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

.field public static final enum TEAM_MEMBER_ID:Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 36
    new-instance v0, Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

    const-string v1, "TEAM_MEMBER_ID"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;->TEAM_MEMBER_ID:Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

    .line 37
    new-instance v1, Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

    const-string v3, "EXTERNAL_ID"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;->EXTERNAL_ID:Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

    .line 38
    new-instance v3, Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

    const-string v5, "EMAIL"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;->EMAIL:Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

    const/4 v5, 0x3

    .line 35
    new-array v5, v5, [Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    sput-object v5, Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;->$VALUES:[Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 35
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;
    .locals 1

    .line 35
    const-class v0, Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;
    .locals 1

    .line 35
    sget-object v0, Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;->$VALUES:[Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/team/UserSelectorArg$Tag;

    return-object v0
.end method
