.class public final enum Lcom/dropbox/core/v2/teamlog/SharedLinkVisibility;
.super Ljava/lang/Enum;
.source "SharedLinkVisibility.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/SharedLinkVisibility$Serializer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/teamlog/SharedLinkVisibility;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/teamlog/SharedLinkVisibility;

.field public static final enum NO_ONE:Lcom/dropbox/core/v2/teamlog/SharedLinkVisibility;

.field public static final enum OTHER:Lcom/dropbox/core/v2/teamlog/SharedLinkVisibility;

.field public static final enum PASSWORD:Lcom/dropbox/core/v2/teamlog/SharedLinkVisibility;

.field public static final enum PUBLIC:Lcom/dropbox/core/v2/teamlog/SharedLinkVisibility;

.field public static final enum TEAM_ONLY:Lcom/dropbox/core/v2/teamlog/SharedLinkVisibility;


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 24
    new-instance v0, Lcom/dropbox/core/v2/teamlog/SharedLinkVisibility;

    const-string v1, "NO_ONE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/teamlog/SharedLinkVisibility;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/teamlog/SharedLinkVisibility;->NO_ONE:Lcom/dropbox/core/v2/teamlog/SharedLinkVisibility;

    .line 25
    new-instance v1, Lcom/dropbox/core/v2/teamlog/SharedLinkVisibility;

    const-string v3, "PASSWORD"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/teamlog/SharedLinkVisibility;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/teamlog/SharedLinkVisibility;->PASSWORD:Lcom/dropbox/core/v2/teamlog/SharedLinkVisibility;

    .line 26
    new-instance v3, Lcom/dropbox/core/v2/teamlog/SharedLinkVisibility;

    const-string v5, "PUBLIC"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/teamlog/SharedLinkVisibility;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/teamlog/SharedLinkVisibility;->PUBLIC:Lcom/dropbox/core/v2/teamlog/SharedLinkVisibility;

    .line 27
    new-instance v5, Lcom/dropbox/core/v2/teamlog/SharedLinkVisibility;

    const-string v7, "TEAM_ONLY"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/dropbox/core/v2/teamlog/SharedLinkVisibility;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/dropbox/core/v2/teamlog/SharedLinkVisibility;->TEAM_ONLY:Lcom/dropbox/core/v2/teamlog/SharedLinkVisibility;

    .line 35
    new-instance v7, Lcom/dropbox/core/v2/teamlog/SharedLinkVisibility;

    const-string v9, "OTHER"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/dropbox/core/v2/teamlog/SharedLinkVisibility;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/dropbox/core/v2/teamlog/SharedLinkVisibility;->OTHER:Lcom/dropbox/core/v2/teamlog/SharedLinkVisibility;

    const/4 v9, 0x5

    .line 22
    new-array v9, v9, [Lcom/dropbox/core/v2/teamlog/SharedLinkVisibility;

    aput-object v0, v9, v2

    aput-object v1, v9, v4

    aput-object v3, v9, v6

    aput-object v5, v9, v8

    aput-object v7, v9, v10

    sput-object v9, Lcom/dropbox/core/v2/teamlog/SharedLinkVisibility;->$VALUES:[Lcom/dropbox/core/v2/teamlog/SharedLinkVisibility;

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

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/SharedLinkVisibility;
    .locals 1

    .line 22
    const-class v0, Lcom/dropbox/core/v2/teamlog/SharedLinkVisibility;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/teamlog/SharedLinkVisibility;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/teamlog/SharedLinkVisibility;
    .locals 1

    .line 22
    sget-object v0, Lcom/dropbox/core/v2/teamlog/SharedLinkVisibility;->$VALUES:[Lcom/dropbox/core/v2/teamlog/SharedLinkVisibility;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/teamlog/SharedLinkVisibility;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/teamlog/SharedLinkVisibility;

    return-object v0
.end method
