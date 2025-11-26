.class public final enum Lcom/dropbox/core/v2/teamlog/WatermarkingPolicy;
.super Ljava/lang/Enum;
.source "WatermarkingPolicy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/WatermarkingPolicy$Serializer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/teamlog/WatermarkingPolicy;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/teamlog/WatermarkingPolicy;

.field public static final enum DISABLED:Lcom/dropbox/core/v2/teamlog/WatermarkingPolicy;

.field public static final enum ENABLED:Lcom/dropbox/core/v2/teamlog/WatermarkingPolicy;

.field public static final enum OTHER:Lcom/dropbox/core/v2/teamlog/WatermarkingPolicy;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 24
    new-instance v0, Lcom/dropbox/core/v2/teamlog/WatermarkingPolicy;

    const-string v1, "DISABLED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/teamlog/WatermarkingPolicy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/teamlog/WatermarkingPolicy;->DISABLED:Lcom/dropbox/core/v2/teamlog/WatermarkingPolicy;

    .line 25
    new-instance v1, Lcom/dropbox/core/v2/teamlog/WatermarkingPolicy;

    const-string v3, "ENABLED"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/teamlog/WatermarkingPolicy;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/teamlog/WatermarkingPolicy;->ENABLED:Lcom/dropbox/core/v2/teamlog/WatermarkingPolicy;

    .line 33
    new-instance v3, Lcom/dropbox/core/v2/teamlog/WatermarkingPolicy;

    const-string v5, "OTHER"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/teamlog/WatermarkingPolicy;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/teamlog/WatermarkingPolicy;->OTHER:Lcom/dropbox/core/v2/teamlog/WatermarkingPolicy;

    const/4 v5, 0x3

    .line 22
    new-array v5, v5, [Lcom/dropbox/core/v2/teamlog/WatermarkingPolicy;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    sput-object v5, Lcom/dropbox/core/v2/teamlog/WatermarkingPolicy;->$VALUES:[Lcom/dropbox/core/v2/teamlog/WatermarkingPolicy;

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

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/WatermarkingPolicy;
    .locals 1

    .line 22
    const-class v0, Lcom/dropbox/core/v2/teamlog/WatermarkingPolicy;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/teamlog/WatermarkingPolicy;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/teamlog/WatermarkingPolicy;
    .locals 1

    .line 22
    sget-object v0, Lcom/dropbox/core/v2/teamlog/WatermarkingPolicy;->$VALUES:[Lcom/dropbox/core/v2/teamlog/WatermarkingPolicy;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/teamlog/WatermarkingPolicy;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/teamlog/WatermarkingPolicy;

    return-object v0
.end method
