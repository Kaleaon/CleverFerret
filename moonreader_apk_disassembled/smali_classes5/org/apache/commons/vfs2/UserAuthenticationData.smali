.class public Lorg/apache/commons/vfs2/UserAuthenticationData;
.super Ljava/lang/Object;
.source "UserAuthenticationData.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/vfs2/UserAuthenticationData$Type;
    }
.end annotation


# static fields
.field public static final DOMAIN:Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

.field public static final PASSWORD:Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

.field public static final USERNAME:Lorg/apache/commons/vfs2/UserAuthenticationData$Type;


# instance fields
.field private final authenticationData:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lorg/apache/commons/vfs2/UserAuthenticationData$Type;",
            "[C>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 86
    new-instance v0, Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    const-string v1, "username"

    invoke-direct {v0, v1}, Lorg/apache/commons/vfs2/UserAuthenticationData$Type;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/commons/vfs2/UserAuthenticationData;->USERNAME:Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    .line 89
    new-instance v0, Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    const-string v1, "password"

    invoke-direct {v0, v1}, Lorg/apache/commons/vfs2/UserAuthenticationData$Type;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/commons/vfs2/UserAuthenticationData;->PASSWORD:Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    .line 92
    new-instance v0, Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    const-string v1, "domain"

    invoke-direct {v0, v1}, Lorg/apache/commons/vfs2/UserAuthenticationData$Type;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/commons/vfs2/UserAuthenticationData;->DOMAIN:Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 95
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/vfs2/UserAuthenticationData;->authenticationData:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public cleanup()V
    .locals 5

    .line 129
    iget-object v0, p0, Lorg/apache/commons/vfs2/UserAuthenticationData;->authenticationData:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 130
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 131
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [C

    if-eqz v1, :cond_0

    .line 132
    array-length v2, v1

    if-gez v2, :cond_1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 136
    :goto_1
    array-length v4, v1

    if-ge v3, v4, :cond_0

    .line 137
    aput-char v2, v1, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 141
    :cond_2
    iget-object v0, p0, Lorg/apache/commons/vfs2/UserAuthenticationData;->authenticationData:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    return-void
.end method

.method public getData(Lorg/apache/commons/vfs2/UserAuthenticationData$Type;)[C
    .locals 1

    .line 121
    iget-object v0, p0, Lorg/apache/commons/vfs2/UserAuthenticationData;->authenticationData:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [C

    return-object p1
.end method

.method public setData(Lorg/apache/commons/vfs2/UserAuthenticationData$Type;[C)V
    .locals 1

    .line 111
    iget-object v0, p0, Lorg/apache/commons/vfs2/UserAuthenticationData;->authenticationData:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
