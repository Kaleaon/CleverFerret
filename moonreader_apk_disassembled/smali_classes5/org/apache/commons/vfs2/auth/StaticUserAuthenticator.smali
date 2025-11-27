.class public Lorg/apache/commons/vfs2/auth/StaticUserAuthenticator;
.super Ljava/lang/Object;
.source "StaticUserAuthenticator.java"

# interfaces
.implements Lorg/apache/commons/vfs2/UserAuthenticator;
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/apache/commons/vfs2/UserAuthenticator;",
        "Ljava/lang/Comparable<",
        "Lorg/apache/commons/vfs2/auth/StaticUserAuthenticator;",
        ">;"
    }
.end annotation


# static fields
.field private static final LOG:Lorg/apache/commons/logging/Log;


# instance fields
.field private final domain:Ljava/lang/String;

.field private final password:Ljava/lang/String;

.field private final username:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 29
    const-class v0, Lorg/apache/commons/vfs2/auth/StaticUserAuthenticator;

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/vfs2/auth/StaticUserAuthenticator;->LOG:Lorg/apache/commons/logging/Log;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p2, p0, Lorg/apache/commons/vfs2/auth/StaticUserAuthenticator;->username:Ljava/lang/String;

    .line 42
    iput-object p3, p0, Lorg/apache/commons/vfs2/auth/StaticUserAuthenticator;->password:Ljava/lang/String;

    .line 43
    iput-object p1, p0, Lorg/apache/commons/vfs2/auth/StaticUserAuthenticator;->domain:Ljava/lang/String;

    return-void
.end method

.method private compareStringOrNull(Ljava/lang/String;Ljava/lang/String;)I
    .locals 0

    if-nez p1, :cond_0

    if-eqz p2, :cond_2

    const/4 p1, -0x1

    return p1

    :cond_0
    if-nez p2, :cond_1

    const/4 p1, 0x1

    return p1

    .line 142
    :cond_1
    invoke-virtual {p1, p2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result p1

    if-eqz p1, :cond_2

    return p1

    :cond_2
    const/4 p1, 0x0

    return p1
.end method

.method private equalsNullsafe(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    const/4 v0, 0x0

    if-nez p1, :cond_0

    if-eqz p2, :cond_1

    return v0

    .line 112
    :cond_0
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    return v0

    :cond_1
    const/4 p1, 0x1

    return p1
.end method


# virtual methods
.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 28
    check-cast p1, Lorg/apache/commons/vfs2/auth/StaticUserAuthenticator;

    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/auth/StaticUserAuthenticator;->compareTo(Lorg/apache/commons/vfs2/auth/StaticUserAuthenticator;)I

    move-result p1

    return p1
.end method

.method public compareTo(Lorg/apache/commons/vfs2/auth/StaticUserAuthenticator;)I
    .locals 2

    .line 125
    iget-object v0, p0, Lorg/apache/commons/vfs2/auth/StaticUserAuthenticator;->domain:Ljava/lang/String;

    iget-object v1, p1, Lorg/apache/commons/vfs2/auth/StaticUserAuthenticator;->domain:Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lorg/apache/commons/vfs2/auth/StaticUserAuthenticator;->compareStringOrNull(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    .line 126
    iget-object v0, p0, Lorg/apache/commons/vfs2/auth/StaticUserAuthenticator;->username:Ljava/lang/String;

    iget-object v1, p1, Lorg/apache/commons/vfs2/auth/StaticUserAuthenticator;->username:Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lorg/apache/commons/vfs2/auth/StaticUserAuthenticator;->compareStringOrNull(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    :cond_0
    if-nez v0, :cond_1

    .line 127
    iget-object v0, p0, Lorg/apache/commons/vfs2/auth/StaticUserAuthenticator;->password:Ljava/lang/String;

    iget-object p1, p1, Lorg/apache/commons/vfs2/auth/StaticUserAuthenticator;->password:Ljava/lang/String;

    invoke-direct {p0, v0, p1}, Lorg/apache/commons/vfs2/auth/StaticUserAuthenticator;->compareStringOrNull(Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    return p1

    :cond_1
    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 98
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_2

    return v1

    .line 102
    :cond_2
    check-cast p1, Lorg/apache/commons/vfs2/auth/StaticUserAuthenticator;

    .line 103
    iget-object v2, p0, Lorg/apache/commons/vfs2/auth/StaticUserAuthenticator;->domain:Ljava/lang/String;

    iget-object v3, p1, Lorg/apache/commons/vfs2/auth/StaticUserAuthenticator;->domain:Ljava/lang/String;

    invoke-direct {p0, v2, v3}, Lorg/apache/commons/vfs2/auth/StaticUserAuthenticator;->equalsNullsafe(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lorg/apache/commons/vfs2/auth/StaticUserAuthenticator;->username:Ljava/lang/String;

    iget-object v3, p1, Lorg/apache/commons/vfs2/auth/StaticUserAuthenticator;->username:Ljava/lang/String;

    invoke-direct {p0, v2, v3}, Lorg/apache/commons/vfs2/auth/StaticUserAuthenticator;->equalsNullsafe(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lorg/apache/commons/vfs2/auth/StaticUserAuthenticator;->password:Ljava/lang/String;

    iget-object p1, p1, Lorg/apache/commons/vfs2/auth/StaticUserAuthenticator;->password:Ljava/lang/String;

    .line 104
    invoke-direct {p0, v2, p1}, Lorg/apache/commons/vfs2/auth/StaticUserAuthenticator;->equalsNullsafe(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_3

    return v0

    :cond_3
    return v1
.end method

.method public hashCode()I
    .locals 4

    .line 76
    iget-object v0, p0, Lorg/apache/commons/vfs2/auth/StaticUserAuthenticator;->domain:Ljava/lang/String;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_0
    const/16 v2, 0x25

    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x25

    .line 77
    iget-object v3, p0, Lorg/apache/commons/vfs2/auth/StaticUserAuthenticator;->password:Ljava/lang/String;

    if-nez v3, :cond_1

    const/4 v3, 0x0

    goto :goto_1

    :cond_1
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_1
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x25

    .line 78
    iget-object v2, p0, Lorg/apache/commons/vfs2/auth/StaticUserAuthenticator;->username:Ljava/lang/String;

    if-nez v2, :cond_2

    goto :goto_2

    :cond_2
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_2
    add-int/2addr v0, v1

    return v0
.end method

.method public requestAuthentication([Lorg/apache/commons/vfs2/UserAuthenticationData$Type;)Lorg/apache/commons/vfs2/UserAuthenticationData;
    .locals 7

    .line 48
    new-instance v0, Lorg/apache/commons/vfs2/UserAuthenticationData;

    invoke-direct {v0}, Lorg/apache/commons/vfs2/UserAuthenticationData;-><init>()V

    .line 49
    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_4

    aget-object v3, p1, v2

    .line 50
    sget-object v4, Lorg/apache/commons/vfs2/UserAuthenticationData;->DOMAIN:Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    if-ne v3, v4, :cond_0

    .line 51
    sget-object v3, Lorg/apache/commons/vfs2/UserAuthenticationData;->DOMAIN:Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    iget-object v4, p0, Lorg/apache/commons/vfs2/auth/StaticUserAuthenticator;->domain:Ljava/lang/String;

    invoke-static {v4}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->toChar(Ljava/lang/String;)[C

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lorg/apache/commons/vfs2/UserAuthenticationData;->setData(Lorg/apache/commons/vfs2/UserAuthenticationData$Type;[C)V

    goto :goto_1

    .line 52
    :cond_0
    sget-object v4, Lorg/apache/commons/vfs2/UserAuthenticationData;->USERNAME:Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    if-ne v3, v4, :cond_1

    .line 53
    sget-object v3, Lorg/apache/commons/vfs2/UserAuthenticationData;->USERNAME:Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    iget-object v4, p0, Lorg/apache/commons/vfs2/auth/StaticUserAuthenticator;->username:Ljava/lang/String;

    invoke-static {v4}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->toChar(Ljava/lang/String;)[C

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lorg/apache/commons/vfs2/UserAuthenticationData;->setData(Lorg/apache/commons/vfs2/UserAuthenticationData$Type;[C)V

    goto :goto_1

    .line 54
    :cond_1
    sget-object v4, Lorg/apache/commons/vfs2/UserAuthenticationData;->PASSWORD:Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    if-ne v3, v4, :cond_2

    .line 55
    sget-object v3, Lorg/apache/commons/vfs2/UserAuthenticationData;->PASSWORD:Lorg/apache/commons/vfs2/UserAuthenticationData$Type;

    iget-object v4, p0, Lorg/apache/commons/vfs2/auth/StaticUserAuthenticator;->password:Ljava/lang/String;

    invoke-static {v4}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->toChar(Ljava/lang/String;)[C

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lorg/apache/commons/vfs2/UserAuthenticationData;->setData(Lorg/apache/commons/vfs2/UserAuthenticationData$Type;[C)V

    goto :goto_1

    .line 57
    :cond_2
    sget-object v4, Lorg/apache/commons/vfs2/auth/StaticUserAuthenticator;->LOG:Lorg/apache/commons/logging/Log;

    invoke-interface {v4}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 58
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "StaticUserAuthenticator does not support authentication data type \'"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, "\'; authentication request for this type ignored."

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    :cond_3
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_4
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 158
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 159
    iget-object v1, p0, Lorg/apache/commons/vfs2/auth/StaticUserAuthenticator;->domain:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 160
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x5c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 162
    :cond_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/auth/StaticUserAuthenticator;->username:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 163
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 165
    :cond_1
    const-string v1, "(null)"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    :goto_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/auth/StaticUserAuthenticator;->password:Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 168
    const-string v1, ":***"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
