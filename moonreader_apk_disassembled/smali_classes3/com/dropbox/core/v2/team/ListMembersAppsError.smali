.class public final enum Lcom/dropbox/core/v2/team/ListMembersAppsError;
.super Ljava/lang/Enum;
.source "ListMembersAppsError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/ListMembersAppsError$Serializer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/team/ListMembersAppsError;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/team/ListMembersAppsError;

.field public static final enum OTHER:Lcom/dropbox/core/v2/team/ListMembersAppsError;

.field public static final enum RESET:Lcom/dropbox/core/v2/team/ListMembersAppsError;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 30
    new-instance v0, Lcom/dropbox/core/v2/team/ListMembersAppsError;

    const-string v1, "RESET"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/team/ListMembersAppsError;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/team/ListMembersAppsError;->RESET:Lcom/dropbox/core/v2/team/ListMembersAppsError;

    .line 38
    new-instance v1, Lcom/dropbox/core/v2/team/ListMembersAppsError;

    const-string v3, "OTHER"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/team/ListMembersAppsError;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/team/ListMembersAppsError;->OTHER:Lcom/dropbox/core/v2/team/ListMembersAppsError;

    const/4 v3, 0x2

    .line 23
    new-array v3, v3, [Lcom/dropbox/core/v2/team/ListMembersAppsError;

    aput-object v0, v3, v2

    aput-object v1, v3, v4

    sput-object v3, Lcom/dropbox/core/v2/team/ListMembersAppsError;->$VALUES:[Lcom/dropbox/core/v2/team/ListMembersAppsError;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 23
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/team/ListMembersAppsError;
    .locals 1

    .line 23
    const-class v0, Lcom/dropbox/core/v2/team/ListMembersAppsError;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/team/ListMembersAppsError;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/team/ListMembersAppsError;
    .locals 1

    .line 23
    sget-object v0, Lcom/dropbox/core/v2/team/ListMembersAppsError;->$VALUES:[Lcom/dropbox/core/v2/team/ListMembersAppsError;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/team/ListMembersAppsError;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/team/ListMembersAppsError;

    return-object v0
.end method
