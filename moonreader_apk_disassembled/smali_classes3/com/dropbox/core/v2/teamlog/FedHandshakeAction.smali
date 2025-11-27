.class public final enum Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;
.super Ljava/lang/Enum;
.source "FedHandshakeAction.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/FedHandshakeAction$Serializer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;

.field public static final enum ACCEPTED_INVITE:Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;

.field public static final enum CANCELED_INVITE:Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;

.field public static final enum INVITED:Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;

.field public static final enum INVITE_EXPIRED:Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;

.field public static final enum OTHER:Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;

.field public static final enum REJECTED_INVITE:Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;

.field public static final enum REMOVED_TEAM:Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;


# direct methods
.method static constructor <clinit>()V
    .locals 15

    .line 21
    new-instance v0, Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;

    const-string v1, "ACCEPTED_INVITE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;->ACCEPTED_INVITE:Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;

    .line 22
    new-instance v1, Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;

    const-string v3, "CANCELED_INVITE"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;->CANCELED_INVITE:Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;

    .line 23
    new-instance v3, Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;

    const-string v5, "INVITE_EXPIRED"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;->INVITE_EXPIRED:Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;

    .line 24
    new-instance v5, Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;

    const-string v7, "INVITED"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;->INVITED:Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;

    .line 25
    new-instance v7, Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;

    const-string v9, "REJECTED_INVITE"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;->REJECTED_INVITE:Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;

    .line 26
    new-instance v9, Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;

    const-string v11, "REMOVED_TEAM"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;->REMOVED_TEAM:Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;

    .line 34
    new-instance v11, Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;

    const-string v13, "OTHER"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;-><init>(Ljava/lang/String;I)V

    sput-object v11, Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;->OTHER:Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;

    const/4 v13, 0x7

    .line 19
    new-array v13, v13, [Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;

    aput-object v0, v13, v2

    aput-object v1, v13, v4

    aput-object v3, v13, v6

    aput-object v5, v13, v8

    aput-object v7, v13, v10

    aput-object v9, v13, v12

    aput-object v11, v13, v14

    sput-object v13, Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;->$VALUES:[Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;

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

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;
    .locals 1

    .line 19
    const-class v0, Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;
    .locals 1

    .line 19
    sget-object v0, Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;->$VALUES:[Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/teamlog/FedHandshakeAction;

    return-object v0
.end method
