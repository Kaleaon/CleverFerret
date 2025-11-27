.class public final enum Lcom/dropbox/core/v2/team/MembersListContinueError;
.super Ljava/lang/Enum;
.source "MembersListContinueError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/MembersListContinueError$Serializer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/team/MembersListContinueError;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/team/MembersListContinueError;

.field public static final enum INVALID_CURSOR:Lcom/dropbox/core/v2/team/MembersListContinueError;

.field public static final enum OTHER:Lcom/dropbox/core/v2/team/MembersListContinueError;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 24
    new-instance v0, Lcom/dropbox/core/v2/team/MembersListContinueError;

    const-string v1, "INVALID_CURSOR"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/team/MembersListContinueError;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/team/MembersListContinueError;->INVALID_CURSOR:Lcom/dropbox/core/v2/team/MembersListContinueError;

    .line 32
    new-instance v1, Lcom/dropbox/core/v2/team/MembersListContinueError;

    const-string v3, "OTHER"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/team/MembersListContinueError;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/team/MembersListContinueError;->OTHER:Lcom/dropbox/core/v2/team/MembersListContinueError;

    const/4 v3, 0x2

    .line 19
    new-array v3, v3, [Lcom/dropbox/core/v2/team/MembersListContinueError;

    aput-object v0, v3, v2

    aput-object v1, v3, v4

    sput-object v3, Lcom/dropbox/core/v2/team/MembersListContinueError;->$VALUES:[Lcom/dropbox/core/v2/team/MembersListContinueError;

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

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MembersListContinueError;
    .locals 1

    .line 19
    const-class v0, Lcom/dropbox/core/v2/team/MembersListContinueError;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/team/MembersListContinueError;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/team/MembersListContinueError;
    .locals 1

    .line 19
    sget-object v0, Lcom/dropbox/core/v2/team/MembersListContinueError;->$VALUES:[Lcom/dropbox/core/v2/team/MembersListContinueError;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/team/MembersListContinueError;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/team/MembersListContinueError;

    return-object v0
.end method
