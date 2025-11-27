.class public final enum Lcom/dropbox/core/TokenAccessType;
.super Ljava/lang/Enum;
.source "TokenAccessType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/TokenAccessType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/TokenAccessType;

.field public static final enum OFFLINE:Lcom/dropbox/core/TokenAccessType;

.field public static final enum ONLINE:Lcom/dropbox/core/TokenAccessType;


# instance fields
.field private string:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 12
    new-instance v0, Lcom/dropbox/core/TokenAccessType;

    const-string v1, "online"

    const-string v2, "ONLINE"

    const/4 v3, 0x0

    invoke-direct {v0, v2, v3, v1}, Lcom/dropbox/core/TokenAccessType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/dropbox/core/TokenAccessType;->ONLINE:Lcom/dropbox/core/TokenAccessType;

    .line 16
    new-instance v1, Lcom/dropbox/core/TokenAccessType;

    const-string v2, "offline"

    const-string v4, "OFFLINE"

    const/4 v5, 0x1

    invoke-direct {v1, v4, v5, v2}, Lcom/dropbox/core/TokenAccessType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lcom/dropbox/core/TokenAccessType;->OFFLINE:Lcom/dropbox/core/TokenAccessType;

    const/4 v2, 0x2

    .line 8
    new-array v2, v2, [Lcom/dropbox/core/TokenAccessType;

    aput-object v0, v2, v3

    aput-object v1, v2, v5

    sput-object v2, Lcom/dropbox/core/TokenAccessType;->$VALUES:[Lcom/dropbox/core/TokenAccessType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 20
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 21
    iput-object p3, p0, Lcom/dropbox/core/TokenAccessType;->string:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/TokenAccessType;
    .locals 1

    .line 8
    const-class v0, Lcom/dropbox/core/TokenAccessType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/TokenAccessType;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/TokenAccessType;
    .locals 1

    .line 8
    sget-object v0, Lcom/dropbox/core/TokenAccessType;->$VALUES:[Lcom/dropbox/core/TokenAccessType;

    invoke-virtual {v0}, [Lcom/dropbox/core/TokenAccessType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/TokenAccessType;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 26
    iget-object v0, p0, Lcom/dropbox/core/TokenAccessType;->string:Ljava/lang/String;

    return-object v0
.end method
