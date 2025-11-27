.class public Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;
.super Lorg/apache/commons/vfs2/FileSystemConfigBuilder;
.source "FtpFileSystemConfigBuilder.java"


# static fields
.field private static final BUILDER:Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;

.field private static final CONNECT_TIMEOUT:Ljava/lang/String;

.field private static final DATA_TIMEOUT:Ljava/lang/String;

.field private static final DEFAULT_DATE_FORMAT:Ljava/lang/String;

.field private static final ENCODING:Ljava/lang/String;

.field private static final FACTORY_KEY:Ljava/lang/String;

.field private static final FILE_TYPE:Ljava/lang/String;

.field private static final PASSIVE_MODE:Ljava/lang/String;

.field private static final PROXY:Ljava/lang/String;

.field private static final RECENT_DATE_FORMAT:Ljava/lang/String;

.field private static final REMOTE_VERIFICATION:Ljava/lang/String;

.field private static final SERVER_LANGUAGE_CODE:Ljava/lang/String;

.field private static final SERVER_TIME_ZONE_ID:Ljava/lang/String;

.field private static final SHORT_MONTH_NAMES:Ljava/lang/String;

.field private static final SO_TIMEOUT:Ljava/lang/String;

.field private static final USER_DIR_IS_ROOT:Ljava/lang/String;

.field private static final _PREFIX:Ljava/lang/String; = "org.apache.commons.vfs2.provider.ftp.FtpFileSystemConfigBuilder"


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 30
    const-class v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 32
    new-instance v1, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;

    invoke-direct {v1}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;-><init>()V

    sput-object v1, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->BUILDER:Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;

    .line 34
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".CONNECT_TIMEOUT"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->CONNECT_TIMEOUT:Ljava/lang/String;

    .line 35
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".DATA_TIMEOUT"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->DATA_TIMEOUT:Ljava/lang/String;

    .line 36
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".DEFAULT_DATE_FORMAT"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->DEFAULT_DATE_FORMAT:Ljava/lang/String;

    .line 37
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".ENCODING"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->ENCODING:Ljava/lang/String;

    .line 38
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-class v2, Lorg/apache/commons/net/ftp/parser/FTPFileEntryParserFactory;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".KEY"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->FACTORY_KEY:Ljava/lang/String;

    .line 39
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".FILE_TYPE"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->FILE_TYPE:Ljava/lang/String;

    .line 40
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".PASSIVE"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->PASSIVE_MODE:Ljava/lang/String;

    .line 41
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".PROXY"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->PROXY:Ljava/lang/String;

    .line 42
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".RECENT_DATE_FORMAT"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->RECENT_DATE_FORMAT:Ljava/lang/String;

    .line 43
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".REMOTE_VERIFICATION"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->REMOTE_VERIFICATION:Ljava/lang/String;

    .line 44
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".SERVER_LANGUAGE_CODE"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->SERVER_LANGUAGE_CODE:Ljava/lang/String;

    .line 45
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".SERVER_TIME_ZONE_ID"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->SERVER_TIME_ZONE_ID:Ljava/lang/String;

    .line 46
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".SHORT_MONTH_NAMES"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->SHORT_MONTH_NAMES:Ljava/lang/String;

    .line 47
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".SO_TIMEOUT"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->SO_TIMEOUT:Ljava/lang/String;

    .line 48
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ".USER_DIR_IS_ROOT"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->USER_DIR_IS_ROOT:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 51
    const-string v0, "ftp."

    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 61
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public static getInstance()Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;
    .locals 1

    .line 70
    sget-object v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->BUILDER:Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;

    return-object v0
.end method


# virtual methods
.method protected getConfigClass()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "+",
            "Lorg/apache/commons/vfs2/FileSystem;",
            ">;"
        }
    .end annotation

    .line 75
    const-class v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystem;

    return-object v0
.end method

.method public getConnectTimeout(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/Integer;
    .locals 1

    .line 86
    sget-object v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->CONNECT_TIMEOUT:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->getInteger(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method public getControlEncoding(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/String;
    .locals 1

    .line 95
    sget-object v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->ENCODING:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->getString(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getDataTimeout(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/Integer;
    .locals 1

    .line 104
    sget-object v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->DATA_TIMEOUT:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->getInteger(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method public getDefaultDateFormat(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/String;
    .locals 1

    .line 115
    sget-object v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->DEFAULT_DATE_FORMAT:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->getString(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getEntryParser(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/String;
    .locals 1

    .line 124
    sget-object v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->FACTORY_KEY:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->getString(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getEntryParserFactory(Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/net/ftp/parser/FTPFileEntryParserFactory;
    .locals 1

    .line 133
    const-class v0, Lorg/apache/commons/net/ftp/parser/FTPFileEntryParserFactory;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->getParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/commons/net/ftp/parser/FTPFileEntryParserFactory;

    return-object p1
.end method

.method public getFileType(Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;
    .locals 2

    .line 144
    const-class v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;

    sget-object v1, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->FILE_TYPE:Ljava/lang/String;

    invoke-virtual {p0, v0, p1, v1}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->getEnum(Ljava/lang/Class;Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p1

    check-cast p1, Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;

    return-object p1
.end method

.method public getPassiveMode(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/Boolean;
    .locals 1

    .line 153
    sget-object v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->PASSIVE_MODE:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->getBoolean(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method public getProxy(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/net/Proxy;
    .locals 1

    .line 164
    sget-object v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->PROXY:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->getParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/net/Proxy;

    return-object p1
.end method

.method public getRecentDateFormat(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/String;
    .locals 1

    .line 174
    sget-object v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->RECENT_DATE_FORMAT:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->getString(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getRemoteVerification(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/Boolean;
    .locals 1

    .line 184
    sget-object v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->REMOTE_VERIFICATION:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->getBoolean(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method public getServerLanguageCode(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/String;
    .locals 1

    .line 195
    sget-object v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->SERVER_LANGUAGE_CODE:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->getString(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getServerTimeZoneId(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/String;
    .locals 1

    .line 205
    sget-object v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->SERVER_TIME_ZONE_ID:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->getString(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getShortMonthNames(Lorg/apache/commons/vfs2/FileSystemOptions;)[Ljava/lang/String;
    .locals 1

    .line 215
    sget-object v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->SHORT_MONTH_NAMES:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->getParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    check-cast p1, [Ljava/lang/String;

    return-object p1
.end method

.method public getSoTimeout(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/Integer;
    .locals 1

    .line 225
    sget-object v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->SO_TIMEOUT:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->getInteger(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method public getUserDirIsRoot(Lorg/apache/commons/vfs2/FileSystemOptions;)Ljava/lang/Boolean;
    .locals 2

    .line 238
    sget-object v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->USER_DIR_IS_ROOT:Ljava/lang/String;

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->getBoolean(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method public setConnectTimeout(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/Integer;)V
    .locals 1

    .line 251
    sget-object v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->CONNECT_TIMEOUT:Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setControlEncoding(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)V
    .locals 1

    .line 262
    sget-object v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->ENCODING:Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setDataTimeout(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/Integer;)V
    .locals 1

    .line 274
    sget-object v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->DATA_TIMEOUT:Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setDefaultDateFormat(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)V
    .locals 1

    .line 285
    sget-object v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->DEFAULT_DATE_FORMAT:Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setEntryParser(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)V
    .locals 1

    .line 298
    sget-object v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->FACTORY_KEY:Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setEntryParserFactory(Lorg/apache/commons/vfs2/FileSystemOptions;Lorg/apache/commons/net/ftp/parser/FTPFileEntryParserFactory;)V
    .locals 1

    .line 308
    const-class v0, Lorg/apache/commons/net/ftp/parser/FTPFileEntryParserFactory;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setFileType(Lorg/apache/commons/vfs2/FileSystemOptions;Lorg/apache/commons/vfs2/provider/ftp/FtpFileType;)V
    .locals 1

    .line 319
    sget-object v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->FILE_TYPE:Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setPassiveMode(Lorg/apache/commons/vfs2/FileSystemOptions;Z)V
    .locals 1

    .line 329
    sget-object v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->PASSIVE_MODE:Ljava/lang/String;

    if-eqz p2, :cond_0

    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0

    :cond_0
    sget-object p2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    :goto_0
    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setProxy(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/net/Proxy;)V
    .locals 1

    .line 342
    sget-object v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->PROXY:Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setRecentDateFormat(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)V
    .locals 1

    .line 352
    sget-object v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->RECENT_DATE_FORMAT:Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setRemoteVerification(Lorg/apache/commons/vfs2/FileSystemOptions;Z)V
    .locals 1

    .line 362
    sget-object v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->REMOTE_VERIFICATION:Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Z)V

    return-void
.end method

.method public setServerLanguageCode(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)V
    .locals 1

    .line 373
    sget-object v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->SERVER_LANGUAGE_CODE:Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setServerTimeZoneId(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)V
    .locals 1

    .line 383
    sget-object v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->SERVER_TIME_ZONE_ID:Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setShortMonthNames(Lorg/apache/commons/vfs2/FileSystemOptions;[Ljava/lang/String;)V
    .locals 3

    if-eqz p2, :cond_0

    .line 395
    array-length v0, p2

    new-array v0, v0, [Ljava/lang/String;

    .line 396
    array-length v1, p2

    const/4 v2, 0x0

    invoke-static {p2, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 399
    :goto_0
    sget-object p2, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->SHORT_MONTH_NAMES:Ljava/lang/String;

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setSoTimeout(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/Integer;)V
    .locals 1

    .line 412
    sget-object v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->SO_TIMEOUT:Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setUserDirIsRoot(Lorg/apache/commons/vfs2/FileSystemOptions;Z)V
    .locals 1

    .line 422
    sget-object v0, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->USER_DIR_IS_ROOT:Ljava/lang/String;

    if-eqz p2, :cond_0

    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0

    :cond_0
    sget-object p2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    :goto_0
    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/provider/ftp/FtpFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method
