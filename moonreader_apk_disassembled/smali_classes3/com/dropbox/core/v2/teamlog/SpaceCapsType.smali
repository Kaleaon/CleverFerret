.class public final enum Lcom/dropbox/core/v2/teamlog/SpaceCapsType;
.super Ljava/lang/Enum;
.source "SpaceCapsType.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/SpaceCapsType$Serializer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/teamlog/SpaceCapsType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/teamlog/SpaceCapsType;

.field public static final enum HARD:Lcom/dropbox/core/v2/teamlog/SpaceCapsType;

.field public static final enum OFF:Lcom/dropbox/core/v2/teamlog/SpaceCapsType;

.field public static final enum OTHER:Lcom/dropbox/core/v2/teamlog/SpaceCapsType;

.field public static final enum SOFT:Lcom/dropbox/core/v2/teamlog/SpaceCapsType;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 24
    new-instance v0, Lcom/dropbox/core/v2/teamlog/SpaceCapsType;

    const-string v1, "HARD"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/teamlog/SpaceCapsType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/teamlog/SpaceCapsType;->HARD:Lcom/dropbox/core/v2/teamlog/SpaceCapsType;

    .line 25
    new-instance v1, Lcom/dropbox/core/v2/teamlog/SpaceCapsType;

    const-string v3, "OFF"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/teamlog/SpaceCapsType;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/teamlog/SpaceCapsType;->OFF:Lcom/dropbox/core/v2/teamlog/SpaceCapsType;

    .line 26
    new-instance v3, Lcom/dropbox/core/v2/teamlog/SpaceCapsType;

    const-string v5, "SOFT"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/teamlog/SpaceCapsType;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/teamlog/SpaceCapsType;->SOFT:Lcom/dropbox/core/v2/teamlog/SpaceCapsType;

    .line 34
    new-instance v5, Lcom/dropbox/core/v2/teamlog/SpaceCapsType;

    const-string v7, "OTHER"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/dropbox/core/v2/teamlog/SpaceCapsType;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/dropbox/core/v2/teamlog/SpaceCapsType;->OTHER:Lcom/dropbox/core/v2/teamlog/SpaceCapsType;

    const/4 v7, 0x4

    .line 22
    new-array v7, v7, [Lcom/dropbox/core/v2/teamlog/SpaceCapsType;

    aput-object v0, v7, v2

    aput-object v1, v7, v4

    aput-object v3, v7, v6

    aput-object v5, v7, v8

    sput-object v7, Lcom/dropbox/core/v2/teamlog/SpaceCapsType;->$VALUES:[Lcom/dropbox/core/v2/teamlog/SpaceCapsType;

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

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/SpaceCapsType;
    .locals 1

    .line 22
    const-class v0, Lcom/dropbox/core/v2/teamlog/SpaceCapsType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/teamlog/SpaceCapsType;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/teamlog/SpaceCapsType;
    .locals 1

    .line 22
    sget-object v0, Lcom/dropbox/core/v2/teamlog/SpaceCapsType;->$VALUES:[Lcom/dropbox/core/v2/teamlog/SpaceCapsType;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/teamlog/SpaceCapsType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/teamlog/SpaceCapsType;

    return-object v0
.end method
