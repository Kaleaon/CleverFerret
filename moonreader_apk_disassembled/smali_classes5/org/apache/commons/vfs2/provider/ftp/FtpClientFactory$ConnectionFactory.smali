.class public abstract Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory;
.super Ljava/lang/Object;
.source "FtpClientFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "ConnectionFactory"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<C:",
        "Lorg/apache/commons/net/ftp/FTPClient;",
        "B:",
        "Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final ANON_CHAR_ARRAY:[C

.field private static final BUFSZ:I = 0x28


# instance fields
.field protected builder:Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TB;"
        }
    .end annotation
.end field

.field private final log:Lorg/apache/commons/logging/Log;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 81
    const-string v0, "anonymous"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory;->ANON_CHAR_ARRAY:[C

    return-void
.end method

.method protected constructor <init>(Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TB;)V"
        }
    .end annotation

    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory;->log:Lorg/apache/commons/logging/Log;

    .line 88
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory;->builder:Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;

    return-void
.end method

.method static synthetic access$100(Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory;)Lorg/apache/commons/logging/Log;
    .locals 0

    .line 80
    iget-object p0, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory;->log:Lorg/apache/commons/logging/Log;

    return-object p0
.end method

.method private configureClient(Lorg/apache/commons/vfs2/FileSystemOptions;Lorg/apache/commons/net/ftp/FTPClient;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/vfs2/FileSystemOptions;",
            "TC;)V"
        }
    .end annotation

    .line 216
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory;->builder:Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;

    invoke-virtual {v0, p1}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->getEntryParser(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_7

    .line 218
    new-instance v1, Lorg/apache/commons/net/ftp/FTPClientConfig;

    invoke-direct {v1, v0}, Lorg/apache/commons/net/ftp/FTPClientConfig;-><init>(Ljava/lang/String;)V

    .line 220
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory;->builder:Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;

    invoke-virtual {v0, p1}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->getServerLanguageCode(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 222
    invoke-virtual {v1, v0}, Lorg/apache/commons/net/ftp/FTPClientConfig;->setServerLanguageCode(Ljava/lang/String;)V

    .line 224
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory;->builder:Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;

    invoke-virtual {v0, p1}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->getDefaultDateFormat(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 226
    invoke-virtual {v1, v0}, Lorg/apache/commons/net/ftp/FTPClientConfig;->setDefaultDateFormatStr(Ljava/lang/String;)V

    .line 228
    :cond_1
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory;->builder:Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;

    invoke-virtual {v0, p1}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->getRecentDateFormat(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 230
    invoke-virtual {v1, v0}, Lorg/apache/commons/net/ftp/FTPClientConfig;->setRecentDateFormatStr(Ljava/lang/String;)V

    .line 232
    :cond_2
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory;->builder:Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;

    invoke-virtual {v0, p1}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->getServerTimeZoneId(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 234
    invoke-virtual {v1, v0}, Lorg/apache/commons/net/ftp/FTPClientConfig;->setServerTimeZoneId(Ljava/lang/String;)V

    .line 236
    :cond_3
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory;->builder:Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;

    invoke-virtual {v0, p1}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->getShortMonthNames(Lorg/apache/commons/vfs2/FileSystemOptions;)[Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_6

    .line 238
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v2, 0x28

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 239
    array-length v2, p1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_5

    aget-object v4, p1, v3

    .line 240
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-lez v5, :cond_4

    .line 241
    const-string v5, "|"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 243
    :cond_4
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 245
    :cond_5
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Lorg/apache/commons/net/ftp/FTPClientConfig;->setShortMonthNames(Ljava/lang/String;)V

    .line 248
    :cond_6
    invoke-virtual {p2, v1}, Lorg/apache/commons/net/ftp/FTPClient;->configure(Lorg/apache/commons/net/ftp/FTPClientConfig;)V

    :cond_7
    return-void
.end method


# virtual methods
.method protected abstract createClient(Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/net/ftp/FTPClient;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/vfs2/FileSystemOptions;",
            ")TC;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation
.end method

.method public createConnection(Ljava/lang/String;I[C[CLjava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/net/ftp/FTPClient;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I[C[C",
            "Ljava/lang/String;",
            "Lorg/apache/commons/vfs2/FileSystemOptions;",
            ")TC;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    if-nez p3, :cond_0

    .line 95
    sget-object p3, Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory;->ANON_CHAR_ARRAY:[C

    :cond_0
    if-nez p4, :cond_1

    .line 99
    sget-object p4, Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory;->ANON_CHAR_ARRAY:[C

    :cond_1
    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 103
    :try_start_0
    invoke-virtual {p0, p6}, Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory;->createClient(Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object v2

    .line 105
    iget-object v3, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v3}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 106
    new-instance v3, Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory$1;

    const/16 v4, 0x400

    invoke-direct {v3, p0, v4}, Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory$1;-><init>(Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory;I)V

    .line 118
    new-instance v4, Lorg/apache/commons/net/PrintCommandListener;

    new-instance v5, Ljava/io/PrintWriter;

    invoke-direct {v5, v3}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    invoke-direct {v4, v5}, Lorg/apache/commons/net/PrintCommandListener;-><init>(Ljava/io/PrintWriter;)V

    invoke-virtual {v2, v4}, Lorg/apache/commons/net/ftp/FTPClient;->addProtocolCommandListener(Lorg/apache/commons/net/ProtocolCommandListener;)V

    .line 121
    :cond_2
    invoke-direct {p0, p6, v2}, Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory;->configureClient(Lorg/apache/commons/vfs2/FileSystemOptions;Lorg/apache/commons/net/ftp/FTPClient;)V

    .line 123
    iget-object v3, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory;->builder:Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;

    invoke-virtual {v3, p6}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->getEntryParserFactory(Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/net/ftp/parser/FTPFileEntryParserFactory;

    move-result-object v3

    if-eqz v3, :cond_3

    .line 125
    invoke-virtual {v2, v3}, Lorg/apache/commons/net/ftp/FTPClient;->setParserFactory(Lorg/apache/commons/net/ftp/parser/FTPFileEntryParserFactory;)V

    .line 128
    :cond_3
    iget-object v3, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory;->builder:Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;

    invoke-virtual {v3, p6}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->getRemoteVerification(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/Boolean;

    move-result-object v3

    if-eqz v3, :cond_4

    .line 130
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-virtual {v2, v3}, Lorg/apache/commons/net/ftp/FTPClient;->setRemoteVerificationEnabled(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 135
    :cond_4
    :try_start_1
    iget-object v3, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory;->builder:Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;

    invoke-virtual {v3, p6}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->getConnectTimeout(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/Integer;

    move-result-object v3

    if-eqz v3, :cond_5

    .line 137
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v2, v3}, Lorg/apache/commons/net/ftp/FTPClient;->setDefaultTimeout(I)V

    .line 140
    :cond_5
    iget-object v3, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory;->builder:Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;

    invoke-virtual {v3, p6}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->getControlEncoding(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_6

    .line 142
    invoke-virtual {v2, v3}, Lorg/apache/commons/net/ftp/FTPClient;->setControlEncoding(Ljava/lang/String;)V

    .line 145
    :cond_6
    iget-object v3, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory;->builder:Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;

    invoke-virtual {v3, p6}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->getProxy(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/net/Proxy;

    move-result-object v3

    if-eqz v3, :cond_7

    .line 147
    invoke-virtual {v2, v3}, Lorg/apache/commons/net/ftp/FTPClient;->setProxy(Ljava/net/Proxy;)V

    .line 150
    :cond_7
    invoke-virtual {v2, p1, p2}, Lorg/apache/commons/net/ftp/FTPClient;->connect(Ljava/lang/String;I)V

    .line 152
    invoke-virtual {v2}, Lorg/apache/commons/net/ftp/FTPClient;->getReplyCode()I

    move-result p2

    .line 153
    invoke-static {p2}, Lorg/apache/commons/net/ftp/FTPReply;->isPositiveCompletion(I)Z

    move-result p2

    if-eqz p2, :cond_11

    .line 158
    invoke-static {p3}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->toString([C)Ljava/lang/String;

    move-result-object p2

    .line 159
    invoke-static {p4}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->toString([C)Ljava/lang/String;

    move-result-object p4

    .line 158
    invoke-virtual {v2, p2, p4}, Lorg/apache/commons/net/ftp/FTPClient;->login(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_10

    .line 164
    iget-object p2, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory;->builder:Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;

    invoke-virtual {p2, p6}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->getFileType(Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;

    move-result-object p2

    if-nez p2, :cond_8

    .line 166
    sget-object p2, Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;->BINARY:Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;

    .line 169
    :cond_8
    invoke-virtual {p2}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;->getValue()I

    move-result p3

    invoke-virtual {v2, p3}, Lorg/apache/commons/net/ftp/FTPClient;->setFileType(I)Z

    move-result p3

    if-eqz p3, :cond_f

    .line 174
    iget-object p2, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory;->builder:Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;

    invoke-virtual {p2, p6}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->getDataTimeout(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/Integer;

    move-result-object p2

    if-eqz p2, :cond_9

    .line 176
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-virtual {v2, p2}, Lorg/apache/commons/net/ftp/FTPClient;->setDataTimeout(I)V

    .line 179
    :cond_9
    iget-object p2, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory;->builder:Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;

    invoke-virtual {p2, p6}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->getSoTimeout(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/Integer;

    move-result-object p2

    if-eqz p2, :cond_a

    .line 181
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-virtual {v2, p2}, Lorg/apache/commons/net/ftp/FTPClient;->setSoTimeout(I)V

    .line 184
    :cond_a
    iget-object p2, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory;->builder:Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;

    invoke-virtual {p2, p6}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->getUserDirIsRoot(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/Boolean;

    move-result-object p2

    if-eqz p5, :cond_d

    if-eqz p2, :cond_b

    .line 185
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-nez p2, :cond_d

    .line 186
    :cond_b
    invoke-virtual {v2, p5}, Lorg/apache/commons/net/ftp/FTPClient;->changeWorkingDirectory(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_c

    goto :goto_0

    .line 187
    :cond_c
    new-instance p2, Lorg/apache/commons/vfs2/FileSystemException;

    const-string p3, "vfs.provider.ftp/change-work-directory.error"

    invoke-direct {p2, p3, p5}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw p2

    .line 192
    :cond_d
    :goto_0
    iget-object p2, p0, Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory;->builder:Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;

    invoke-virtual {p2, p6}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->getPassiveMode(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/Boolean;

    move-result-object p2

    if-eqz p2, :cond_e

    .line 193
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_e

    .line 194
    invoke-virtual {v2}, Lorg/apache/commons/net/ftp/FTPClient;->enterLocalPassiveMode()V

    .line 197
    :cond_e
    invoke-virtual {p0, v2, p6}, Lorg/apache/commons/vfs2/provider/ftp/FtpClientFactory$ConnectionFactory;->setupOpenConnection(Lorg/apache/commons/net/ftp/FTPClient;Lorg/apache/commons/vfs2/FileSystemOptions;)V

    return-object v2

    .line 170
    :cond_f
    new-instance p3, Lorg/apache/commons/vfs2/FileSystemException;

    const-string p4, "vfs.provider.ftp/set-file-type.error"

    invoke-direct {p3, p4, p2}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw p3

    .line 160
    :cond_10
    new-instance p2, Lorg/apache/commons/vfs2/FileSystemException;

    const-string p4, "vfs.provider.ftp/login.error"

    .line 161
    invoke-static {p3}, Lorg/apache/commons/vfs2/util/UserAuthenticatorUtils;->toString([C)Ljava/lang/String;

    move-result-object p3

    const/4 p5, 0x2

    new-array p5, p5, [Ljava/lang/Object;

    aput-object p1, p5, v0

    aput-object p3, p5, v1

    invoke-direct {p2, p4, p5}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    throw p2

    .line 154
    :cond_11
    new-instance p2, Lorg/apache/commons/vfs2/FileSystemException;

    const-string p3, "vfs.provider.ftp/connect-rejected.error"

    invoke-direct {p2, p3, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw p2
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    :catch_0
    move-exception p2

    .line 199
    :try_start_2
    invoke-virtual {v2}, Lorg/apache/commons/net/ftp/FTPClient;->isConnected()Z

    move-result p3

    if-eqz p3, :cond_12

    .line 200
    invoke-virtual {v2}, Lorg/apache/commons/net/ftp/FTPClient;->disconnect()V

    .line 202
    :cond_12
    throw p2
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    :catch_1
    move-exception p2

    .line 207
    new-instance p3, Lorg/apache/commons/vfs2/FileSystemException;

    new-array p4, v1, [Ljava/lang/Object;

    aput-object p1, p4, v0

    const-string p1, "vfs.provider.ftp/connect.error"

    invoke-direct {p3, p1, p2, p4}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;[Ljava/lang/Object;)V

    throw p3
.end method

.method protected abstract setupOpenConnection(Lorg/apache/commons/net/ftp/FTPClient;Lorg/apache/commons/vfs2/FileSystemOptions;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TC;",
            "Lorg/apache/commons/vfs2/FileSystemOptions;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
