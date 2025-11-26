.class public final enum Lcom/dropbox/core/v2/teamlog/FedAdminRole;
.super Ljava/lang/Enum;
.source "FedAdminRole.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/FedAdminRole$Serializer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/teamlog/FedAdminRole;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/teamlog/FedAdminRole;

.field public static final enum ENTERPRISE_ADMIN:Lcom/dropbox/core/v2/teamlog/FedAdminRole;

.field public static final enum NOT_ENTERPRISE_ADMIN:Lcom/dropbox/core/v2/teamlog/FedAdminRole;

.field public static final enum OTHER:Lcom/dropbox/core/v2/teamlog/FedAdminRole;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 21
    new-instance v0, Lcom/dropbox/core/v2/teamlog/FedAdminRole;

    const-string v1, "ENTERPRISE_ADMIN"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/teamlog/FedAdminRole;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/teamlog/FedAdminRole;->ENTERPRISE_ADMIN:Lcom/dropbox/core/v2/teamlog/FedAdminRole;

    .line 22
    new-instance v1, Lcom/dropbox/core/v2/teamlog/FedAdminRole;

    const-string v3, "NOT_ENTERPRISE_ADMIN"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/teamlog/FedAdminRole;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/teamlog/FedAdminRole;->NOT_ENTERPRISE_ADMIN:Lcom/dropbox/core/v2/teamlog/FedAdminRole;

    .line 30
    new-instance v3, Lcom/dropbox/core/v2/teamlog/FedAdminRole;

    const-string v5, "OTHER"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/teamlog/FedAdminRole;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/teamlog/FedAdminRole;->OTHER:Lcom/dropbox/core/v2/teamlog/FedAdminRole;

    const/4 v5, 0x3

    .line 19
    new-array v5, v5, [Lcom/dropbox/core/v2/teamlog/FedAdminRole;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    sput-object v5, Lcom/dropbox/core/v2/teamlog/FedAdminRole;->$VALUES:[Lcom/dropbox/core/v2/teamlog/FedAdminRole;

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

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/FedAdminRole;
    .locals 1

    .line 19
    const-class v0, Lcom/dropbox/core/v2/teamlog/FedAdminRole;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/teamlog/FedAdminRole;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/teamlog/FedAdminRole;
    .locals 1

    .line 19
    sget-object v0, Lcom/dropbox/core/v2/teamlog/FedAdminRole;->$VALUES:[Lcom/dropbox/core/v2/teamlog/FedAdminRole;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/teamlog/FedAdminRole;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/teamlog/FedAdminRole;

    return-object v0
.end method
