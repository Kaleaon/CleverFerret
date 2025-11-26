.class public final Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;
.super Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;
.source "FtpsFileSystemConfigBuilder.java"


# static fields
.field private static final BUILDER:Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;

.field private static final FTPS_MODE:Ljava/lang/String;

.field private static final KEY_MANAGER:Ljava/lang/String;

.field private static final PROT:Ljava/lang/String;

.field private static final TRUST_MANAGER:Ljava/lang/String;

.field private static final _PREFIX:Ljava/lang/String; = "org.apache.commons.vfs2.provider.ftps.FtpsFileSystemConfigBuilder"


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 32
    const-class v0, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 34
    new-instance v1, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;

    invoke-direct {v1}, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;-><init>()V

    sput-object v1, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;->BUILDER:Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;

    .line 36
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".FTPS_MODE"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;->FTPS_MODE:Ljava/lang/String;

    .line 37
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".PROT"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;->PROT:Ljava/lang/String;

    .line 38
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".KEY_MANAGER"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;->KEY_MANAGER:Ljava/lang/String;

    .line 39
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ".TRUST_MANAGER"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;->TRUST_MANAGER:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 42
    const-string v0, "ftps."

    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public static getInstance()Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;
    .locals 1

    .line 51
    sget-object v0, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;->BUILDER:Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;

    return-object v0
.end method


# virtual methods
.method public getDataChannelProtectionLevel(Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/provider/ftps/FtpsDataChannelProtectionLevel;
    .locals 2

    .line 132
    const-class v0, Lorg/apache/commons/vfs2/provider/ftps/FtpsDataChannelProtectionLevel;

    sget-object v1, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;->PROT:Ljava/lang/String;

    invoke-virtual {p0, v0, p1, v1}, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;->getEnum(Ljava/lang/Class;Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p1

    check-cast p1, Lorg/apache/commons/vfs2/provider/ftps/FtpsDataChannelProtectionLevel;

    return-object p1
.end method

.method public getFtpsMode(Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/provider/ftps/FtpsMode;
    .locals 3

    .line 80
    const-class v0, Lorg/apache/commons/vfs2/provider/ftps/FtpsMode;

    sget-object v1, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;->FTPS_MODE:Ljava/lang/String;

    sget-object v2, Lorg/apache/commons/vfs2/provider/ftps/FtpsMode;->EXPLICIT:Lorg/apache/commons/vfs2/provider/ftps/FtpsMode;

    invoke-virtual {p0, v0, p1, v1, v2}, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;->getEnum(Ljava/lang/Class;Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Enum;)Ljava/lang/Enum;

    move-result-object p1

    check-cast p1, Lorg/apache/commons/vfs2/provider/ftps/FtpsMode;

    return-object p1
.end method

.method public getFtpsType(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/String;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 120
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;->getFtpsMode(Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/provider/ftps/FtpsMode;

    move-result-object p1

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/ftps/FtpsMode;->name()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getKeyManager(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljavax/net/ssl/KeyManager;
    .locals 1

    .line 156
    sget-object v0, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;->KEY_MANAGER:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;->getParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljavax/net/ssl/KeyManager;

    return-object p1
.end method

.method public getTrustManager(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljavax/net/ssl/TrustManager;
    .locals 2

    .line 185
    sget-object v0, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;->TRUST_MANAGER:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;->hasParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 186
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;->getParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljavax/net/ssl/TrustManager;

    return-object p1

    .line 188
    :cond_0
    invoke-static {}, Lorg/apache/commons/net/util/TrustManagerUtils;->getValidateServerCertificateTrustManager()Ljavax/net/ssl/X509TrustManager;

    move-result-object p1

    return-object p1
.end method

.method public setDataChannelProtectionLevel(Lorg/apache/commons/vfs2/FileSystemOptions;Lorg/apache/commons/vfs2/provider/ftps/FtpsDataChannelProtectionLevel;)V
    .locals 1

    .line 144
    sget-object v0, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;->PROT:Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setFtpsMode(Lorg/apache/commons/vfs2/FileSystemOptions;Lorg/apache/commons/vfs2/provider/ftps/FtpsMode;)V
    .locals 1

    .line 69
    sget-object v0, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;->FTPS_MODE:Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setFtpsType(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    if-eqz p2, :cond_1

    .line 100
    invoke-virtual {p2}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/vfs2/provider/ftps/FtpsMode;->valueOf(Ljava/lang/String;)Lorg/apache/commons/vfs2/provider/ftps/FtpsMode;

    move-result-object v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 102
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Not a proper FTPS mode: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    const/4 v0, 0x0

    .line 107
    :goto_0
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;->setFtpsMode(Lorg/apache/commons/vfs2/FileSystemOptions;Lorg/apache/commons/vfs2/provider/ftps/FtpsMode;)V

    return-void
.end method

.method public setKeyManager(Lorg/apache/commons/vfs2/FileSystemOptions;Ljavax/net/ssl/KeyManager;)V
    .locals 1

    .line 168
    sget-object v0, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;->KEY_MANAGER:Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setTrustManager(Lorg/apache/commons/vfs2/FileSystemOptions;Ljavax/net/ssl/TrustManager;)V
    .locals 1

    .line 202
    sget-object v0, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;->TRUST_MANAGER:Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/ftps/FtpsFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method
