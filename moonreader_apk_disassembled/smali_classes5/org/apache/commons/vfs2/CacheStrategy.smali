.class public final enum Lorg/apache/commons/vfs2/CacheStrategy;
.super Ljava/lang/Enum;
.source "CacheStrategy.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/apache/commons/vfs2/CacheStrategy;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/apache/commons/vfs2/CacheStrategy;

.field public static final enum MANUAL:Lorg/apache/commons/vfs2/CacheStrategy;

.field public static final enum ON_CALL:Lorg/apache/commons/vfs2/CacheStrategy;

.field public static final enum ON_RESOLVE:Lorg/apache/commons/vfs2/CacheStrategy;


# instance fields
.field private final realName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 26
    new-instance v0, Lorg/apache/commons/vfs2/CacheStrategy;

    const-string v1, "manual"

    const-string v2, "MANUAL"

    const/4 v3, 0x0

    invoke-direct {v0, v2, v3, v1}, Lorg/apache/commons/vfs2/CacheStrategy;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/apache/commons/vfs2/CacheStrategy;->MANUAL:Lorg/apache/commons/vfs2/CacheStrategy;

    .line 31
    new-instance v1, Lorg/apache/commons/vfs2/CacheStrategy;

    const-string v2, "onresolve"

    const-string v4, "ON_RESOLVE"

    const/4 v5, 0x1

    invoke-direct {v1, v4, v5, v2}, Lorg/apache/commons/vfs2/CacheStrategy;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lorg/apache/commons/vfs2/CacheStrategy;->ON_RESOLVE:Lorg/apache/commons/vfs2/CacheStrategy;

    .line 37
    new-instance v2, Lorg/apache/commons/vfs2/CacheStrategy;

    const-string v4, "oncall"

    const-string v6, "ON_CALL"

    const/4 v7, 0x2

    invoke-direct {v2, v6, v7, v4}, Lorg/apache/commons/vfs2/CacheStrategy;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v2, Lorg/apache/commons/vfs2/CacheStrategy;->ON_CALL:Lorg/apache/commons/vfs2/CacheStrategy;

    const/4 v4, 0x3

    .line 22
    new-array v4, v4, [Lorg/apache/commons/vfs2/CacheStrategy;

    aput-object v0, v4, v3

    aput-object v1, v4, v5

    aput-object v2, v4, v7

    sput-object v4, Lorg/apache/commons/vfs2/CacheStrategy;->$VALUES:[Lorg/apache/commons/vfs2/CacheStrategy;

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

    .line 44
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 45
    iput-object p3, p0, Lorg/apache/commons/vfs2/CacheStrategy;->realName:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/apache/commons/vfs2/CacheStrategy;
    .locals 1

    .line 22
    const-class v0, Lorg/apache/commons/vfs2/CacheStrategy;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lorg/apache/commons/vfs2/CacheStrategy;

    return-object p0
.end method

.method public static values()[Lorg/apache/commons/vfs2/CacheStrategy;
    .locals 1

    .line 22
    sget-object v0, Lorg/apache/commons/vfs2/CacheStrategy;->$VALUES:[Lorg/apache/commons/vfs2/CacheStrategy;

    invoke-virtual {v0}, [Lorg/apache/commons/vfs2/CacheStrategy;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/apache/commons/vfs2/CacheStrategy;

    return-object v0
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    .line 64
    iget-object v0, p0, Lorg/apache/commons/vfs2/CacheStrategy;->realName:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 55
    iget-object v0, p0, Lorg/apache/commons/vfs2/CacheStrategy;->realName:Ljava/lang/String;

    return-object v0
.end method
