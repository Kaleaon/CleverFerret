.class public final enum Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;
.super Ljava/lang/Enum;
.source "AdminAlertGeneralStateEnum.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum$Serializer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;

.field public static final enum ACTIVE:Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;

.field public static final enum DISMISSED:Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;

.field public static final enum IN_PROGRESS:Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;

.field public static final enum NA:Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;

.field public static final enum OTHER:Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;

.field public static final enum RESOLVED:Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;


# direct methods
.method static constructor <clinit>()V
    .locals 13

    .line 24
    new-instance v0, Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;

    const-string v1, "ACTIVE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;->ACTIVE:Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;

    .line 25
    new-instance v1, Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;

    const-string v3, "DISMISSED"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;->DISMISSED:Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;

    .line 26
    new-instance v3, Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;

    const-string v5, "IN_PROGRESS"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;->IN_PROGRESS:Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;

    .line 27
    new-instance v5, Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;

    const-string v7, "NA"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;->NA:Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;

    .line 28
    new-instance v7, Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;

    const-string v9, "RESOLVED"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;->RESOLVED:Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;

    .line 36
    new-instance v9, Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;

    const-string v11, "OTHER"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;->OTHER:Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;

    const/4 v11, 0x6

    .line 22
    new-array v11, v11, [Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;

    aput-object v0, v11, v2

    aput-object v1, v11, v4

    aput-object v3, v11, v6

    aput-object v5, v11, v8

    aput-object v7, v11, v10

    aput-object v9, v11, v12

    sput-object v11, Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;->$VALUES:[Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;

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

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;
    .locals 1

    .line 22
    const-class v0, Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;
    .locals 1

    .line 22
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;->$VALUES:[Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;

    return-object v0
.end method
