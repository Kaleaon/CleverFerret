.class public final enum Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue$Tag;
.super Ljava/lang/Enum;
.source "HasTeamSharedDropboxValue.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Tag"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue$Tag;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue$Tag;

.field public static final enum HAS_TEAM_SHARED_DROPBOX:Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue$Tag;

.field public static final enum OTHER:Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue$Tag;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 41
    new-instance v0, Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue$Tag;

    const-string v1, "HAS_TEAM_SHARED_DROPBOX"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue$Tag;->HAS_TEAM_SHARED_DROPBOX:Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue$Tag;

    .line 50
    new-instance v1, Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue$Tag;

    const-string v3, "OTHER"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue$Tag;->OTHER:Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue$Tag;

    const/4 v3, 0x2

    .line 37
    new-array v3, v3, [Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue$Tag;

    aput-object v0, v3, v2

    aput-object v1, v3, v4

    sput-object v3, Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue$Tag;->$VALUES:[Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue$Tag;

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

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue$Tag;
    .locals 1

    .line 37
    const-class v0, Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue$Tag;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue$Tag;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue$Tag;
    .locals 1

    .line 37
    sget-object v0, Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue$Tag;->$VALUES:[Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue$Tag;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue$Tag;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue$Tag;

    return-object v0
.end method
