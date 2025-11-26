.class public final Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;
.super Ljava/lang/Object;
.source "UserAuthenticatorUtils.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static authenticate(Lorg/apache/commons/vfs2/FileSystemOptions;[Lorg/apache/commons/vfs2/UserAuthenticationData$Type;)Lorg/apache/commons/vfs2/UserAuthenticationData;
    .locals 1

    .line 62
    invoke-static {}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemConfigBuilder;->getInstance()Lorg/apache/commons/vfs2/impl/DefaultFileSystemConfigBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemConfigBuilder;->getUserAuthenticator(Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/UserAuthenticator;

    move-result-object p0

    .line 63
    invoke-static {p0, p1}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->authenticate(Lorg/apache/commons/vfs2/UserAuthenticator;[Lorg/apache/commons/vfs2/UserAuthenticationData$Type;)Lorg/apache/commons/vfs2/UserAuthenticationData;

    move-result-object p0

    return-object p0
.end method

.method public static authenticate(Lorg/apache/commons/vfs2/UserAuthenticator;[Lorg/apache/commons/vfs2/UserAuthenticationData$Type;)Lorg/apache/commons/vfs2/UserAuthenticationData;
    .locals 0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 79
    :cond_0
    invoke-interface {p0, p1}, Lorg/apache/commons/vfs2/UserAuthenticator;->requestAuthentication([Lorg/apache/commons/vfs2/UserAuthenticationData$Type;)Lorg/apache/commons/vfs2/UserAuthenticationData;

    move-result-object p0

    return-object p0
.end method

.method public static cleanup(Lorg/apache/commons/vfs2/UserAuthenticationData;)V
    .locals 0

    if-nez p0, :cond_0

    return-void

    .line 106
    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/UserAuthenticationData;->cleanup()V

    return-void
.end method

.method public static getData(Lorg/apache/commons/vfs2/UserAuthenticationData;Lorg/apache/commons/vfs2/UserAuthenticationData$Type;[C)[C
    .locals 0

    if-eqz p2, :cond_0

    return-object p2

    :cond_0
    if-nez p0, :cond_1

    const/4 p0, 0x0

    return-object p0

    .line 50
    :cond_1
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/UserAuthenticationData;->getData(Lorg/apache/commons/vfs2/UserAuthenticationData$Type;)[C

    move-result-object p0

    return-object p0
.end method

.method public static toChar(Ljava/lang/String;)[C
    .locals 0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 93
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object p0

    return-object p0
.end method

.method public static toString([C)Ljava/lang/String;
    .locals 1

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 120
    :cond_0
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p0}, Ljava/lang/String;-><init>([C)V

    return-object v0
.end method
