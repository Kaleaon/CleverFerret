.class public Lcom/flyersoft/components/cloud/Ftp;
.super Lcom/flyersoft/components/cloud/Cloud;
.source "Ftp.java"


# static fields
.field static final MAX_TRY_AGAIN:I = 0x2

.field static ftpRootPath:Ljava/lang/String; = null

.field static ftpUrl:Ljava/lang/String; = null

.field static ok:Ljava/lang/Boolean; = null

.field static pass:Ljava/lang/String; = null

.field static port:I = 0x15

.field static user:Ljava/lang/String;


# instance fields
.field public busy:Z

.field private createTime:J

.field ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

.field public initedPaths:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field isReTryDownload:Z

.field public startTime:J


# direct methods
.method static bridge synthetic -$$Nest$mavailableName(Lcom/flyersoft/components/cloud/Ftp;Ljava/lang/String;)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/components/cloud/Ftp;->availableName(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$mcreateFtpClient(Lcom/flyersoft/components/cloud/Ftp;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/components/cloud/Ftp;->createFtpClient()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mdealParentPath(Lcom/flyersoft/components/cloud/Ftp;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/components/cloud/Ftp;->dealParentPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mftpReady(Lcom/flyersoft/components/cloud/Ftp;Lio/reactivex/rxjava3/core/ObservableEmitter;)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/components/cloud/Ftp;->ftpReady(Lio/reactivex/rxjava3/core/ObservableEmitter;)Z

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$mgetFtpFileSize(Lcom/flyersoft/components/cloud/Ftp;Ljava/lang/String;)J
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/components/cloud/Ftp;->getFtpFileSize(Ljava/lang/String;)J

    move-result-wide p0

    return-wide p0
.end method

.method static bridge synthetic -$$Nest$mgetPath(Lcom/flyersoft/components/cloud/Ftp;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/components/cloud/Ftp;->getPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$misCacheSameFileSize(Lcom/flyersoft/components/cloud/Ftp;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/components/cloud/Ftp;->isCacheSameFileSize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mrootPath(Lcom/flyersoft/components/cloud/Ftp;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/components/cloud/Ftp;->rootPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mverifyFtp(Lcom/flyersoft/components/cloud/Ftp;Landroid/content/Context;Lcom/flyersoft/components/cloud/Cloud$AfterLogin;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/components/cloud/Ftp;->verifyFtp(Landroid/content/Context;Lcom/flyersoft/components/cloud/Cloud$AfterLogin;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 46
    invoke-direct {p0}, Lcom/flyersoft/components/cloud/Cloud;-><init>()V

    return-void
.end method

.method private availableName(Ljava/lang/String;)Z
    .locals 1

    if-eqz p1, :cond_0

    .line 976
    const-string v0, "."

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, ".."

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private createFtpClient()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 68
    iget-wide v0, p0, Lcom/flyersoft/components/cloud/Ftp;->createTime:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/flyersoft/components/cloud/Ftp;->createTime:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x5

    invoke-static {v2, v3}, Lcom/flyersoft/tools/T;->minute(J)J

    move-result-wide v2

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    .line 69
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/Ftp;->disconnect()V

    .line 70
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lorg/apache/commons/net/ftp/FTPClient;->isAvailable()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    .line 71
    invoke-virtual {v0}, Lorg/apache/commons/net/ftp/FTPClient;->getReplyCode()I

    move-result v0

    invoke-static {v0}, Lorg/apache/commons/net/ftp/FTPReply;->isPositiveCompletion(I)Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    .line 74
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/flyersoft/components/cloud/Ftp;->createTime:J

    .line 75
    new-instance v0, Lorg/apache/commons/net/ftp/FTPClient;

    invoke-direct {v0}, Lorg/apache/commons/net/ftp/FTPClient;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    .line 79
    const-string v1, "UTF-8"

    invoke-virtual {v0, v1}, Lorg/apache/commons/net/ftp/FTPClient;->setControlEncoding(Ljava/lang/String;)V

    .line 80
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    sget-object v1, Lcom/flyersoft/components/cloud/Ftp;->ftpUrl:Ljava/lang/String;

    sget v2, Lcom/flyersoft/components/cloud/Ftp;->port:I

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/net/ftp/FTPClient;->connect(Ljava/lang/String;I)V

    .line 81
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    invoke-virtual {v0}, Lorg/apache/commons/net/ftp/FTPClient;->enterLocalPassiveMode()V

    .line 82
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    sget-object v1, Lcom/flyersoft/components/cloud/Ftp;->user:Ljava/lang/String;

    sget-object v2, Lcom/flyersoft/components/cloud/Ftp;->pass:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/net/ftp/FTPClient;->login(Ljava/lang/String;Ljava/lang/String;)Z

    .line 83
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lorg/apache/commons/net/ftp/FTPClient;->setFileType(I)Z

    .line 85
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    invoke-virtual {v0}, Lorg/apache/commons/net/ftp/FTPClient;->printWorkingDirectory()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/cloud/Ftp;->ftpRootPath:Ljava/lang/String;

    .line 86
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "ftp connected, root path: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lcom/flyersoft/components/cloud/Ftp;->ftpRootPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    return-void
.end method

.method private dealParentPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1167
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p1, ""

    :cond_0
    return-object p1
.end method

.method private ftpReady(Lio/reactivex/rxjava3/core/ObservableEmitter;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/rxjava3/core/ObservableEmitter<",
            "Ljava/lang/Object;",
            ">;)Z"
        }
    .end annotation

    .line 91
    :try_start_0
    invoke-direct {p0}, Lcom/flyersoft/components/cloud/Ftp;->createFtpClient()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 p1, 0x1

    return p1

    :catchall_0
    move-exception v0

    .line 94
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 95
    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/flyersoft/components/cloud/Ftp;->errorMsg:Ljava/lang/String;

    if-eqz p1, :cond_0

    .line 97
    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private getFtpFileSize(Ljava/lang/String;)J
    .locals 2

    .line 999
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    invoke-virtual {v0}, Lorg/apache/commons/net/ftp/FTPClient;->enterLocalPassiveMode()V

    .line 1000
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    invoke-direct {p0, p1}, Lcom/flyersoft/components/cloud/Ftp;->rootPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lorg/apache/commons/net/ftp/FTPClient;->listFiles(Ljava/lang/String;)[Lorg/apache/commons/net/ftp/FTPFile;

    move-result-object p1

    .line 1001
    array-length v0, p1

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    aget-object v1, p1, v0

    invoke-virtual {v1}, Lorg/apache/commons/net/ftp/FTPFile;->isFile()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1002
    aget-object p1, p1, v0

    invoke-virtual {p1}, Lorg/apache/commons/net/ftp/FTPFile;->getSize()J

    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    :catch_0
    move-exception p1

    .line 1005
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_0
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method private getPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 980
    sget-object v0, Lcom/flyersoft/tools/A;->FTP_TAG:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 981
    sget-object v0, Lcom/flyersoft/tools/A;->FTP_TAG:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 982
    :cond_0
    const-string v0, "//"

    const-string v1, "/"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 983
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    return-object v1

    :cond_1
    return-object p1
.end method

.method private isCacheSameFileSize(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .line 1160
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1161
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-eqz v5, :cond_1

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/flyersoft/components/cloud/Ftp;->mFileLen:J

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    goto :goto_0

    :cond_0
    return-object p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method private makeDirs(Ljava/lang/String;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 557
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 558
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    invoke-virtual {v1, v0}, Lorg/apache/commons/net/ftp/FTPClient;->changeWorkingDirectory(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 559
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    invoke-virtual {v0, p1}, Lorg/apache/commons/net/ftp/FTPClient;->makeDirectory(Ljava/lang/String;)Z

    move-result p1

    return p1

    .line 560
    :cond_0
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_2

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    sget-object v3, Lcom/flyersoft/components/cloud/Ftp;->ftpRootPath:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/flyersoft/components/cloud/Ftp;->ftpRootPath:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    .line 562
    :cond_1
    invoke-direct {p0, v0}, Lcom/flyersoft/components/cloud/Ftp;->makeDirs(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 563
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    invoke-virtual {v0, p1}, Lorg/apache/commons/net/ftp/FTPClient;->makeDirectory(Ljava/lang/String;)Z

    move-result p1

    return p1

    :cond_2
    :goto_0
    return v2
.end method

.method private rootPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 989
    sget-object v0, Lcom/flyersoft/tools/A;->FTP_TAG:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 990
    sget-object v0, Lcom/flyersoft/tools/A;->FTP_TAG:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 991
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/flyersoft/components/cloud/Ftp;->ftpRootPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 992
    const-string v0, "///"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "//"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public static showLoginResult(Landroid/content/Context;ZLjava/lang/String;)V
    .locals 1

    .line 516
    const-string v0, "UNDO"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    if-eqz p1, :cond_1

    .line 519
    sget p1, Lcom/flyersoft/moonreaderp/R$string;->login_success:I

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void

    .line 520
    :cond_1
    invoke-static {p2}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_2

    .line 521
    sget p1, Lcom/flyersoft/moonreaderp/R$string;->login_failed:I

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, p2}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    return-void

    .line 523
    :cond_2
    sget p1, Lcom/flyersoft/moonreaderp/R$string;->login_failed:I

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void
.end method

.method private verifyFtp(Landroid/content/Context;Lcom/flyersoft/components/cloud/Cloud$AfterLogin;)V
    .locals 1

    .line 478
    const-string v0, "/"

    sput-object v0, Lcom/flyersoft/tools/A;->lastFtpPath:Ljava/lang/String;

    .line 479
    new-instance v0, Lcom/flyersoft/components/cloud/Ftp$8;

    invoke-direct {v0, p0, p1, p2}, Lcom/flyersoft/components/cloud/Ftp$8;-><init>(Lcom/flyersoft/components/cloud/Ftp;Landroid/content/Context;Lcom/flyersoft/components/cloud/Cloud$AfterLogin;)V

    .line 512
    invoke-virtual {v0}, Lcom/flyersoft/components/cloud/Ftp$8;->start()V

    return-void
.end method


# virtual methods
.method changeWorkingDirectory(Ljava/lang/String;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 568
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    invoke-direct {p0, p1}, Lcom/flyersoft/components/cloud/Ftp;->rootPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/commons/net/ftp/FTPClient;->changeWorkingDirectory(Ljava/lang/String;)Z

    move-result v0

    .line 569
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "target:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "print:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    invoke-virtual {v3}, Lorg/apache/commons/net/ftp/FTPClient;->printWorkingDirectory()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/Object;

    const-string v4, "changeWorkingDirectory"

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const/4 v4, 0x1

    aput-object v1, v3, v4

    const/4 v1, 0x2

    aput-object p1, v3, v1

    const/4 p1, 0x3

    aput-object v2, v3, p1

    invoke-static {v3}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    return v0
.end method

.method public copy(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 577
    invoke-static {p2}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 579
    :cond_0
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/components/cloud/Ftp;->fileCount:I

    .line 580
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/Ftp;->beforeStart()V

    if-nez p3, :cond_1

    .line 582
    sget-object p3, Lcom/flyersoft/tools/A;->lastFtpPath:Ljava/lang/String;

    .line 583
    :cond_1
    invoke-direct {p0, p3}, Lcom/flyersoft/components/cloud/Ftp;->getPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lcom/flyersoft/components/cloud/Ftp;->mPath:Ljava/lang/String;

    .line 584
    sget p3, Lcom/flyersoft/moonreaderp/R$string;->copy:I

    invoke-virtual {p1, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p0, p1, p3}, Lcom/flyersoft/components/cloud/Ftp;->createProgressDialog(Landroid/content/Context;Ljava/lang/String;)Landroid/app/ProgressDialog;

    .line 586
    new-instance p3, Lcom/flyersoft/components/cloud/Ftp$9;

    invoke-direct {p3, p0, p2}, Lcom/flyersoft/components/cloud/Ftp$9;-><init>(Lcom/flyersoft/components/cloud/Ftp;Ljava/util/ArrayList;)V

    invoke-static {p3}, Lio/reactivex/rxjava3/core/Observable;->create(Lio/reactivex/rxjava3/core/ObservableOnSubscribe;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p3

    .line 622
    new-instance v0, Lcom/flyersoft/components/cloud/Ftp$10;

    invoke-direct {v0, p0, p1, p2}, Lcom/flyersoft/components/cloud/Ftp$10;-><init>(Lcom/flyersoft/components/cloud/Ftp;Landroid/content/Context;Ljava/util/ArrayList;)V

    .line 641
    invoke-static {}, Lio/reactivex/rxjava3/schedulers/Schedulers;->newThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p1

    invoke-virtual {p3, p1}, Lio/reactivex/rxjava3/core/Observable;->subscribeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 642
    invoke-static {}, Lio/reactivex/rxjava3/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/reactivex/rxjava3/core/Observable;->observeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 643
    invoke-virtual {p1, v0}, Lio/reactivex/rxjava3/core/Observable;->subscribe(Lio/reactivex/rxjava3/functions/Consumer;)Lio/reactivex/rxjava3/disposables/Disposable;

    return-void
.end method

.method public delete(Landroid/content/Context;Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 752
    invoke-static {p2}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 754
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/Ftp;->beforeStart()V

    .line 755
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/components/cloud/Ftp;->fileCount:I

    .line 756
    sget v0, Lcom/flyersoft/moonreaderp/R$string;->delete:I

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/components/cloud/Ftp;->createProgressDialog(Landroid/content/Context;Ljava/lang/String;)Landroid/app/ProgressDialog;

    .line 758
    new-instance v0, Lcom/flyersoft/components/cloud/Ftp$15;

    invoke-direct {v0, p0, p2}, Lcom/flyersoft/components/cloud/Ftp$15;-><init>(Lcom/flyersoft/components/cloud/Ftp;Ljava/util/ArrayList;)V

    invoke-static {v0}, Lio/reactivex/rxjava3/core/Observable;->create(Lio/reactivex/rxjava3/core/ObservableOnSubscribe;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object v0

    .line 781
    new-instance v1, Lcom/flyersoft/components/cloud/Ftp$16;

    invoke-direct {v1, p0, p1, p2}, Lcom/flyersoft/components/cloud/Ftp$16;-><init>(Lcom/flyersoft/components/cloud/Ftp;Landroid/content/Context;Ljava/util/ArrayList;)V

    .line 800
    invoke-static {}, Lio/reactivex/rxjava3/schedulers/Schedulers;->newThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p1

    invoke-virtual {v0, p1}, Lio/reactivex/rxjava3/core/Observable;->subscribeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 801
    invoke-static {}, Lio/reactivex/rxjava3/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/reactivex/rxjava3/core/Observable;->observeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 802
    invoke-virtual {p1, v1}, Lio/reactivex/rxjava3/core/Observable;->subscribe(Lio/reactivex/rxjava3/functions/Consumer;)Lio/reactivex/rxjava3/disposables/Disposable;

    return-void
.end method

.method public dir(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 873
    invoke-virtual {p0, p1, p2, v0}, Lcom/flyersoft/components/cloud/Ftp;->dir(Landroid/content/Context;Ljava/lang/String;Lcom/flyersoft/tools/T$OnResult;)V

    return-void
.end method

.method public dir(Landroid/content/Context;Ljava/lang/String;Lcom/flyersoft/tools/T$OnResult;)V
    .locals 2

    .line 878
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/Ftp;->beforeStart()V

    .line 879
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_3

    if-nez p3, :cond_0

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    if-nez p3, :cond_1

    .line 882
    sput-object p2, Lcom/flyersoft/tools/A;->lastFtpPath:Ljava/lang/String;

    .line 883
    :cond_1
    invoke-direct {p0, p2}, Lcom/flyersoft/components/cloud/Ftp;->getPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/cloud/Ftp;->mPath:Ljava/lang/String;

    if-nez p3, :cond_2

    .line 885
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/flyersoft/tools/A;->FTP_TAG:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Ftp;->mPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/components/cloud/Ftp;->createProgressDialog(Landroid/content/Context;Ljava/lang/String;)Landroid/app/ProgressDialog;

    .line 887
    :cond_2
    new-instance v0, Lcom/flyersoft/components/cloud/Ftp$19;

    invoke-direct {v0, p0, p2, p3}, Lcom/flyersoft/components/cloud/Ftp$19;-><init>(Lcom/flyersoft/components/cloud/Ftp;Ljava/lang/String;Lcom/flyersoft/tools/T$OnResult;)V

    invoke-static {v0}, Lio/reactivex/rxjava3/core/Observable;->create(Lio/reactivex/rxjava3/core/ObservableOnSubscribe;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p2

    .line 919
    new-instance v0, Lcom/flyersoft/components/cloud/Ftp$20;

    invoke-direct {v0, p0, p3, p1}, Lcom/flyersoft/components/cloud/Ftp$20;-><init>(Lcom/flyersoft/components/cloud/Ftp;Lcom/flyersoft/tools/T$OnResult;Landroid/content/Context;)V

    .line 970
    invoke-static {}, Lio/reactivex/rxjava3/schedulers/Schedulers;->newThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p1

    invoke-virtual {p2, p1}, Lio/reactivex/rxjava3/core/Observable;->subscribeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 971
    invoke-static {}, Lio/reactivex/rxjava3/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/reactivex/rxjava3/core/Observable;->observeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 972
    invoke-virtual {p1, v0}, Lio/reactivex/rxjava3/core/Observable;->subscribe(Lio/reactivex/rxjava3/functions/Consumer;)Lio/reactivex/rxjava3/disposables/Disposable;

    :cond_3
    :goto_0
    return-void
.end method

.method public disconnect()V
    .locals 1

    .line 103
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    if-eqz v0, :cond_0

    .line 105
    :try_start_0
    invoke-virtual {v0}, Lorg/apache/commons/net/ftp/FTPClient;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 106
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    invoke-virtual {v0}, Lorg/apache/commons/net/ftp/FTPClient;->logout()Z

    .line 107
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    invoke-virtual {v0}, Lorg/apache/commons/net/ftp/FTPClient;->disconnect()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 110
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_0
    :goto_0
    const/4 v0, 0x0

    .line 113
    iput-object v0, p0, Lcom/flyersoft/components/cloud/Ftp;->ftpClient:Lorg/apache/commons/net/ftp/FTPClient;

    return-void
.end method

.method public download(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;ZLcom/flyersoft/tools/T$OnResult;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Z",
            "Lcom/flyersoft/tools/T$OnResult;",
            ")V"
        }
    .end annotation

    .line 1012
    invoke-static {p2}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 1014
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/Ftp;->beforeStart()V

    .line 1015
    invoke-direct {p0, p3}, Lcom/flyersoft/components/cloud/Ftp;->getPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lcom/flyersoft/components/cloud/Ftp;->mPath:Ljava/lang/String;

    .line 1016
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p3

    iput p3, p0, Lcom/flyersoft/components/cloud/Ftp;->fileCount:I

    .line 1017
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->download:I

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " ["

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/flyersoft/components/cloud/Ftp;->fileCount:I

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "] "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p0, p1, p3}, Lcom/flyersoft/components/cloud/Ftp;->createProgressDialog(Landroid/content/Context;Ljava/lang/String;)Landroid/app/ProgressDialog;

    .line 1019
    new-instance p3, Lcom/flyersoft/components/cloud/Ftp$21;

    invoke-direct {p3, p0, p2, p1, p4}, Lcom/flyersoft/components/cloud/Ftp$21;-><init>(Lcom/flyersoft/components/cloud/Ftp;Ljava/util/ArrayList;Landroid/content/Context;Z)V

    invoke-static {p3}, Lio/reactivex/rxjava3/core/Observable;->create(Lio/reactivex/rxjava3/core/ObservableOnSubscribe;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p3

    .line 1104
    new-instance v0, Lcom/flyersoft/components/cloud/Ftp$22;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/flyersoft/components/cloud/Ftp$22;-><init>(Lcom/flyersoft/components/cloud/Ftp;Landroid/content/Context;Ljava/util/ArrayList;ZLcom/flyersoft/tools/T$OnResult;)V

    .line 1154
    invoke-static {}, Lio/reactivex/rxjava3/schedulers/Schedulers;->newThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p1

    invoke-virtual {p3, p1}, Lio/reactivex/rxjava3/core/Observable;->subscribeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 1155
    invoke-static {}, Lio/reactivex/rxjava3/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/reactivex/rxjava3/core/Observable;->observeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 1156
    invoke-virtual {p1, v0}, Lio/reactivex/rxjava3/core/Observable;->subscribe(Lio/reactivex/rxjava3/functions/Consumer;)Lio/reactivex/rxjava3/disposables/Disposable;

    return-void
.end method

.method public downloadToOutputStream(Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterDownload;Z)V
    .locals 1

    .line 349
    new-instance v0, Lcom/flyersoft/components/cloud/Ftp$6;

    invoke-direct {v0, p0, p1, p2}, Lcom/flyersoft/components/cloud/Ftp$6;-><init>(Lcom/flyersoft/components/cloud/Ftp;Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterDownload;)V

    if-eqz p3, :cond_0

    const/4 p1, 0x1

    .line 426
    invoke-virtual {v0, p1}, Ljava/lang/Thread;->setPriority(I)V

    .line 427
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public getBackupList(Landroid/content/Context;Lcom/flyersoft/components/cloud/Cloud$OnGetBackupList;)V
    .locals 2

    .line 1271
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/Ftp;->beforeStart()V

    .line 1272
    sget-object v0, Lcom/flyersoft/tools/A;->FTP_TAG:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/components/cloud/Ftp;->createProgressDialog(Landroid/content/Context;Ljava/lang/String;)Landroid/app/ProgressDialog;

    .line 1274
    new-instance v0, Lcom/flyersoft/components/cloud/Ftp$25;

    invoke-direct {v0, p0}, Lcom/flyersoft/components/cloud/Ftp$25;-><init>(Lcom/flyersoft/components/cloud/Ftp;)V

    invoke-static {v0}, Lio/reactivex/rxjava3/core/Observable;->create(Lio/reactivex/rxjava3/core/ObservableOnSubscribe;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object v0

    .line 1301
    new-instance v1, Lcom/flyersoft/components/cloud/Ftp$26;

    invoke-direct {v1, p0, p1, p2}, Lcom/flyersoft/components/cloud/Ftp$26;-><init>(Lcom/flyersoft/components/cloud/Ftp;Landroid/content/Context;Lcom/flyersoft/components/cloud/Cloud$OnGetBackupList;)V

    .line 1317
    invoke-static {}, Lio/reactivex/rxjava3/schedulers/Schedulers;->newThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p1

    invoke-virtual {v0, p1}, Lio/reactivex/rxjava3/core/Observable;->subscribeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 1318
    invoke-static {}, Lio/reactivex/rxjava3/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/reactivex/rxjava3/core/Observable;->observeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 1319
    invoke-virtual {p1, v1}, Lio/reactivex/rxjava3/core/Observable;->subscribe(Lio/reactivex/rxjava3/functions/Consumer;)Lio/reactivex/rxjava3/disposables/Disposable;

    return-void
.end method

.method public initConfig(Z)Z
    .locals 2

    .line 54
    sget-object v0, Lcom/flyersoft/components/cloud/Ftp;->ok:Ljava/lang/Boolean;

    if-eqz v0, :cond_0

    if-nez p1, :cond_0

    .line 55
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    return p1

    .line 56
    :cond_0
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, "ftp"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    .line 57
    const-string v0, "ok"

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/cloud/Ftp;->ok:Ljava/lang/Boolean;

    .line 58
    const-string v0, "url"

    const-string v1, ""

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/cloud/Ftp;->ftpUrl:Ljava/lang/String;

    .line 59
    const-string v0, "user"

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/cloud/Ftp;->user:Ljava/lang/String;

    .line 60
    const-string v0, "pass"

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->mySimpleDecript(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/cloud/Ftp;->pass:Ljava/lang/String;

    .line 61
    const-string v0, "port"

    const/16 v1, 0x15

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    sput p1, Lcom/flyersoft/components/cloud/Ftp;->port:I

    .line 62
    sget-object p1, Lcom/flyersoft/components/cloud/Ftp;->ok:Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    return p1
.end method

.method public declared-synchronized initPaths(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    const-string v0, "ERROR: "

    monitor-enter p0

    .line 529
    :try_start_0
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 530
    monitor-exit p0

    return-object v2

    .line 531
    :cond_0
    :try_start_1
    const-string v1, "/"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    sget-object v1, Lcom/flyersoft/components/cloud/Ftp;->ftpRootPath:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/flyersoft/components/cloud/Ftp;->ftpRootPath:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "/"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    .line 533
    :cond_1
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Ftp;->initedPaths:Ljava/util/ArrayList;

    if-nez v1, :cond_2

    .line 534
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/flyersoft/components/cloud/Ftp;->initedPaths:Ljava/util/ArrayList;

    .line 535
    :cond_2
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Ftp;->initedPaths:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-eqz v1, :cond_3

    .line 536
    monitor-exit p0

    return-object v2

    .line 537
    :cond_3
    :try_start_2
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNetworkConnecting(Landroid/content/Context;)Z

    move-result v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-nez v1, :cond_4

    .line 538
    monitor-exit p0

    return-object v2

    .line 541
    :cond_4
    :try_start_3
    invoke-virtual {p0, p1}, Lcom/flyersoft/components/cloud/Ftp;->changeWorkingDirectory(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_6

    .line 542
    invoke-direct {p0, p1}, Lcom/flyersoft/components/cloud/Ftp;->rootPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/flyersoft/components/cloud/Ftp;->makeDirs(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 543
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp;->initedPaths:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 544
    monitor-exit p0

    return-object v2

    .line 546
    :cond_5
    :try_start_4
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    monitor-exit p0

    return-object p1

    .line 548
    :cond_6
    :try_start_5
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp;->initedPaths:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 549
    monitor-exit p0

    return-object v2

    :catchall_0
    move-exception p1

    .line 551
    :try_start_6
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 552
    invoke-static {p1}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    monitor-exit p0

    return-object p1

    .line 532
    :cond_7
    :goto_0
    monitor-exit p0

    return-object v2

    :catchall_1
    move-exception p1

    :try_start_7
    monitor-exit p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    throw p1
.end method

.method public isLogin()Z
    .locals 1

    const/4 v0, 0x0

    .line 139
    invoke-virtual {p0, v0}, Lcom/flyersoft/components/cloud/Ftp;->initConfig(Z)Z

    move-result v0

    return v0
.end method

.method public move(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 649
    invoke-static {p2}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 651
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/Ftp;->beforeStart()V

    if-nez p3, :cond_1

    .line 653
    sget-object p3, Lcom/flyersoft/tools/A;->lastFtpPath:Ljava/lang/String;

    .line 654
    :cond_1
    invoke-direct {p0, p3}, Lcom/flyersoft/components/cloud/Ftp;->getPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lcom/flyersoft/components/cloud/Ftp;->mPath:Ljava/lang/String;

    .line 655
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p3

    iput p3, p0, Lcom/flyersoft/components/cloud/Ftp;->fileCount:I

    .line 656
    sget p3, Lcom/flyersoft/moonreaderp/R$string;->move:I

    invoke-virtual {p1, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p0, p1, p3}, Lcom/flyersoft/components/cloud/Ftp;->createProgressDialog(Landroid/content/Context;Ljava/lang/String;)Landroid/app/ProgressDialog;

    .line 658
    new-instance p3, Lcom/flyersoft/components/cloud/Ftp$11;

    invoke-direct {p3, p0, p2}, Lcom/flyersoft/components/cloud/Ftp$11;-><init>(Lcom/flyersoft/components/cloud/Ftp;Ljava/util/ArrayList;)V

    invoke-static {p3}, Lio/reactivex/rxjava3/core/Observable;->create(Lio/reactivex/rxjava3/core/ObservableOnSubscribe;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p3

    .line 683
    new-instance v0, Lcom/flyersoft/components/cloud/Ftp$12;

    invoke-direct {v0, p0, p1, p2}, Lcom/flyersoft/components/cloud/Ftp$12;-><init>(Lcom/flyersoft/components/cloud/Ftp;Landroid/content/Context;Ljava/util/ArrayList;)V

    .line 702
    invoke-static {}, Lio/reactivex/rxjava3/schedulers/Schedulers;->newThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p1

    invoke-virtual {p3, p1}, Lio/reactivex/rxjava3/core/Observable;->subscribeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 703
    invoke-static {}, Lio/reactivex/rxjava3/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/reactivex/rxjava3/core/Observable;->observeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 704
    invoke-virtual {p1, v0}, Lio/reactivex/rxjava3/core/Observable;->subscribe(Lio/reactivex/rxjava3/functions/Consumer;)Lio/reactivex/rxjava3/disposables/Disposable;

    return-void
.end method

.method releaseBusy()V
    .locals 2

    const/4 v0, 0x0

    .line 133
    iput-boolean v0, p0, Lcom/flyersoft/components/cloud/Ftp;->busy:Z

    const-wide/16 v0, 0x0

    .line 134
    iput-wide v0, p0, Lcom/flyersoft/components/cloud/Ftp;->startTime:J

    return-void
.end method

.method public rename(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 709
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/Ftp;->beforeStart()V

    .line 710
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->rename_file:I

    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/components/cloud/Ftp;->createProgressDialog(Landroid/content/Context;Ljava/lang/String;)Landroid/app/ProgressDialog;

    .line 712
    new-instance v0, Lcom/flyersoft/components/cloud/Ftp$13;

    invoke-direct {v0, p0, p2, p3}, Lcom/flyersoft/components/cloud/Ftp$13;-><init>(Lcom/flyersoft/components/cloud/Ftp;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0}, Lio/reactivex/rxjava3/core/Observable;->create(Lio/reactivex/rxjava3/core/ObservableOnSubscribe;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p2

    .line 730
    new-instance p3, Lcom/flyersoft/components/cloud/Ftp$14;

    invoke-direct {p3, p0, p1}, Lcom/flyersoft/components/cloud/Ftp$14;-><init>(Lcom/flyersoft/components/cloud/Ftp;Landroid/content/Context;)V

    .line 745
    invoke-static {}, Lio/reactivex/rxjava3/schedulers/Schedulers;->newThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p1

    invoke-virtual {p2, p1}, Lio/reactivex/rxjava3/core/Observable;->subscribeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 746
    invoke-static {}, Lio/reactivex/rxjava3/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/reactivex/rxjava3/core/Observable;->observeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 747
    invoke-virtual {p1, p3}, Lio/reactivex/rxjava3/core/Observable;->subscribe(Lio/reactivex/rxjava3/functions/Consumer;)Lio/reactivex/rxjava3/disposables/Disposable;

    return-void
.end method

.method public search(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 807
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/Ftp;->beforeStart()V

    if-nez p2, :cond_0

    .line 809
    sget-object p2, Lcom/flyersoft/tools/A;->lastFtpPath:Ljava/lang/String;

    .line 810
    :cond_0
    invoke-direct {p0, p2}, Lcom/flyersoft/components/cloud/Ftp;->getPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Ftp;->mPath:Ljava/lang/String;

    .line 811
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->search:I

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ": "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/components/cloud/Ftp;->createProgressDialog(Landroid/content/Context;Ljava/lang/String;)Landroid/app/ProgressDialog;

    .line 813
    new-instance p2, Lcom/flyersoft/components/cloud/Ftp$17;

    invoke-direct {p2, p0}, Lcom/flyersoft/components/cloud/Ftp$17;-><init>(Lcom/flyersoft/components/cloud/Ftp;)V

    invoke-static {p2}, Lio/reactivex/rxjava3/core/Observable;->create(Lio/reactivex/rxjava3/core/ObservableOnSubscribe;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p2

    .line 832
    new-instance v0, Lcom/flyersoft/components/cloud/Ftp$18;

    invoke-direct {v0, p0, p1, p3}, Lcom/flyersoft/components/cloud/Ftp$18;-><init>(Lcom/flyersoft/components/cloud/Ftp;Landroid/content/Context;Ljava/lang/String;)V

    .line 866
    invoke-static {}, Lio/reactivex/rxjava3/schedulers/Schedulers;->newThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p1

    invoke-virtual {p2, p1}, Lio/reactivex/rxjava3/core/Observable;->subscribeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 867
    invoke-static {}, Lio/reactivex/rxjava3/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/reactivex/rxjava3/core/Observable;->observeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 868
    invoke-virtual {p1, v0}, Lio/reactivex/rxjava3/core/Observable;->subscribe(Lio/reactivex/rxjava3/functions/Consumer;)Lio/reactivex/rxjava3/disposables/Disposable;

    return-void
.end method

.method public showLogin(Landroid/content/Context;ZLcom/flyersoft/components/cloud/Cloud$AfterLogin;)V
    .locals 18

    move-object/from16 v1, p0

    .line 149
    invoke-static/range {p1 .. p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v2, Lcom/flyersoft/moonreaderp/R$layout;->webdav_options:I

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 150
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->button1:I

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 151
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->syncReadingProgress:I

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    move-object v6, v3

    check-cast v6, Landroid/widget/CheckBox;

    .line 152
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->syncShelf:I

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    move-object v7, v3

    check-cast v7, Landroid/widget/CheckBox;

    .line 153
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->syncShowMessage:I

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    move-object v8, v3

    check-cast v8, Landroid/widget/CheckBox;

    .line 154
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->syncButtonOnly:I

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    move-object v9, v3

    check-cast v9, Landroid/widget/CheckBox;

    .line 155
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->syncViaMenuOnly:I

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    move-object v10, v3

    check-cast v10, Landroid/widget/CheckBox;

    .line 156
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->syncWifiOnly:I

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    move-object v11, v3

    check-cast v11, Landroid/widget/CheckBox;

    .line 157
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->path:I

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    move-object v12, v3

    check-cast v12, Landroid/widget/EditText;

    .line 158
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->url:I

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    .line 159
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->username:I

    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/EditText;

    .line 160
    sget v5, Lcom/flyersoft/moonreaderp/R$id;->password:I

    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/EditText;

    .line 161
    sget v14, Lcom/flyersoft/moonreaderp/R$id;->portEt:I

    invoke-virtual {v0, v14}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v14

    check-cast v14, Landroid/widget/EditText;

    .line 162
    sget v15, Lcom/flyersoft/moonreaderp/R$id;->tip:I

    invoke-virtual {v0, v15}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v15

    const/16 v13, 0x8

    invoke-virtual {v15, v13}, Landroid/view/View;->setVisibility(I)V

    const/4 v15, 0x1

    .line 164
    invoke-virtual {v1, v15}, Lcom/flyersoft/components/cloud/Ftp;->initConfig(Z)Z

    move-result v16

    .line 165
    sget-object v15, Lcom/flyersoft/components/cloud/Ftp;->ftpUrl:Ljava/lang/String;

    invoke-virtual {v3, v15}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 166
    sget-object v15, Lcom/flyersoft/components/cloud/Ftp;->user:Ljava/lang/String;

    invoke-virtual {v4, v15}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 167
    sget-object v15, Lcom/flyersoft/components/cloud/Ftp;->pass:Ljava/lang/String;

    invoke-virtual {v5, v15}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 168
    new-instance v15, Ljava/lang/StringBuilder;

    const-string v13, ""

    invoke-direct {v15, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v13, Lcom/flyersoft/components/cloud/Ftp;->port:I

    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v14, v13}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    if-eqz v16, :cond_0

    const/4 v13, 0x0

    goto :goto_0

    :cond_0
    const/16 v13, 0x8

    .line 169
    :goto_0
    invoke-virtual {v2, v13}, Landroid/widget/Button;->setVisibility(I)V

    const/16 v13, 0x8

    .line 171
    invoke-static {v0, v13}, Lcom/flyersoft/components/cloud/Ftp;->fixCloudTitle(Landroid/view/View;I)V

    .line 172
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v17, 0x0

    sget-object v15, Lcom/flyersoft/tools/A;->FTP_TAG:Ljava/lang/String;

    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v15, Lcom/flyersoft/tools/A;->ftpBookPath:Ljava/lang/String;

    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 176
    invoke-static {}, Lcom/flyersoft/tools/A;->isPro()Z

    move-result v13

    if-nez v13, :cond_2

    .line 177
    sget-boolean v13, Lcom/flyersoft/tools/A;->syncShelf:Z

    if-eqz v13, :cond_1

    .line 178
    sput-boolean v17, Lcom/flyersoft/tools/A;->syncShelf:Z

    :cond_1
    const v13, -0x777778

    .line 179
    invoke-virtual {v7, v13}, Landroid/widget/CheckBox;->setTextColor(I)V

    .line 180
    invoke-virtual {v7}, Landroid/widget/CheckBox;->getPaint()Landroid/text/TextPaint;

    move-result-object v13

    const/4 v15, 0x1

    invoke-virtual {v13, v15}, Landroid/text/TextPaint;->setStrikeThruText(Z)V

    .line 181
    const-string v13, "ignore"

    invoke-virtual {v7, v13}, Landroid/widget/CheckBox;->setTag(Ljava/lang/Object;)V

    .line 184
    :cond_2
    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->hasDownloadUploadRecords()Z

    move-result v13

    if-nez v13, :cond_3

    .line 185
    sget v13, Lcom/flyersoft/moonreaderp/R$id;->clearRecords:I

    invoke-virtual {v0, v13}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v13

    const/16 v15, 0x8

    invoke-virtual {v13, v15}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1

    .line 187
    :cond_3
    sget v13, Lcom/flyersoft/moonreaderp/R$id;->clearRecords:I

    invoke-virtual {v0, v13}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v13

    new-instance v15, Lcom/flyersoft/components/cloud/Ftp$1;

    invoke-direct {v15, v1, v0}, Lcom/flyersoft/components/cloud/Ftp$1;-><init>(Lcom/flyersoft/components/cloud/Ftp;Landroid/view/ViewGroup;)V

    invoke-virtual {v13, v15}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 195
    :goto_1
    sget-boolean v13, Lcom/flyersoft/tools/A;->syncProgress:Z

    invoke-virtual {v6, v13}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 196
    sget-boolean v13, Lcom/flyersoft/tools/A;->syncShelf:Z

    invoke-virtual {v7, v13}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 197
    sget-boolean v13, Lcom/flyersoft/tools/A;->showSyncMsg:Z

    invoke-virtual {v8, v13}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 198
    sget-boolean v13, Lcom/flyersoft/tools/A;->syncManually:Z

    invoke-virtual {v9, v13}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 199
    sget-boolean v13, Lcom/flyersoft/tools/A;->syncShelfViaMenuOnly:Z

    invoke-virtual {v10, v13}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 200
    sget-boolean v13, Lcom/flyersoft/tools/A;->syncBookInWiFiOnly:Z

    invoke-virtual {v11, v13}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 202
    sget-boolean v13, Lcom/flyersoft/tools/A;->syncBookInWiFiOnly:Z

    if-nez v13, :cond_4

    const/16 v13, 0x8

    .line 203
    invoke-virtual {v11, v13}, Landroid/widget/CheckBox;->setVisibility(I)V

    goto :goto_2

    :cond_4
    const/16 v13, 0x8

    :goto_2
    if-nez p2, :cond_5

    if-eqz v16, :cond_5

    .line 205
    sget v15, Lcom/flyersoft/tools/A;->syncType:I

    if-eq v15, v13, :cond_6

    .line 206
    :cond_5
    sget v15, Lcom/flyersoft/moonreaderp/R$id;->syncLay:I

    invoke-virtual {v0, v15}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v15

    invoke-virtual {v15, v13}, Landroid/view/View;->setVisibility(I)V

    .line 207
    sget v15, Lcom/flyersoft/moonreaderp/R$id;->moreLay:I

    invoke-virtual {v0, v15}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v15

    invoke-virtual {v15, v13}, Landroid/view/View;->setVisibility(I)V

    .line 210
    :cond_6
    new-instance v13, Lcom/flyersoft/components/cloud/Ftp$2;

    move-object/from16 v15, p1

    invoke-direct {v13, v1, v15, v2}, Lcom/flyersoft/components/cloud/Ftp$2;-><init>(Lcom/flyersoft/components/cloud/Ftp;Landroid/content/Context;Landroid/widget/Button;)V

    invoke-virtual {v2, v13}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 225
    new-instance v2, Lcom/flyersoft/components/cloud/Ftp$3;

    invoke-direct {v2, v1, v15}, Lcom/flyersoft/components/cloud/Ftp$3;-><init>(Lcom/flyersoft/components/cloud/Ftp;Landroid/content/Context;)V

    invoke-virtual {v7, v2}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 258
    new-instance v2, Lcom/flyersoft/components/MyDialog;

    invoke-direct {v2, v15}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    const-string v13, "FTP (PASV, UTF-8)"

    .line 259
    invoke-virtual {v2, v13}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v2

    .line 260
    invoke-virtual {v2, v0}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    move-object v2, v0

    new-instance v0, Lcom/flyersoft/components/cloud/Ftp$5;

    move-object v13, v15

    move-object v15, v2

    move-object v2, v3

    move-object v3, v4

    move-object v4, v5

    move-object v5, v14

    move-object/from16 v14, p3

    invoke-direct/range {v0 .. v14}, Lcom/flyersoft/components/cloud/Ftp$5;-><init>(Lcom/flyersoft/components/cloud/Ftp;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/EditText;Landroid/content/Context;Lcom/flyersoft/components/cloud/Cloud$AfterLogin;)V

    const v2, 0x104000a

    .line 261
    invoke-virtual {v15, v2, v0}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v2, Lcom/flyersoft/components/cloud/Ftp$4;

    invoke-direct {v2, v1, v14}, Lcom/flyersoft/components/cloud/Ftp$4;-><init>(Lcom/flyersoft/components/cloud/Ftp;Lcom/flyersoft/components/cloud/Cloud$AfterLogin;)V

    const/high16 v3, 0x1040000

    .line 320
    invoke-virtual {v0, v3, v2}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    const/4 v2, 0x0

    .line 326
    invoke-virtual {v0, v2}, Lcom/flyersoft/components/MyDialog;->setCancelable(Z)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method

.method public unlink()V
    .locals 3

    .line 331
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "ftp"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 332
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/ftp.xml"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->deleteFile(Ljava/lang/String;)Z

    .line 333
    sget v0, Lcom/flyersoft/tools/A;->syncType:I

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    .line 334
    sput v2, Lcom/flyersoft/tools/A;->syncType:I

    .line 335
    :cond_0
    const-string v0, "/"

    sput-object v0, Lcom/flyersoft/tools/A;->lastFtpPath:Ljava/lang/String;

    .line 336
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->SaveOptions(Landroid/content/Context;)V

    const/4 v0, 0x0

    .line 337
    sput-object v0, Lcom/flyersoft/components/cloud/Ftp;->ok:Ljava/lang/Boolean;

    .line 338
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 339
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->restartApp()V

    return-void

    .line 341
    :cond_1
    invoke-static {v2}, Ljava/lang/System;->exit(I)V

    return-void
.end method

.method public upload(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;ZZ)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "ZZ)V"
        }
    .end annotation

    .line 1172
    invoke-static {p2}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 1174
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/Ftp;->beforeStart()V

    if-nez p4, :cond_1

    .line 1176
    sget-object p4, Lcom/flyersoft/tools/A;->lastFtpPath:Ljava/lang/String;

    .line 1177
    :cond_1
    invoke-direct {p0, p4}, Lcom/flyersoft/components/cloud/Ftp;->getPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    iput-object p4, p0, Lcom/flyersoft/components/cloud/Ftp;->mPath:Ljava/lang/String;

    .line 1178
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p4

    iput p4, p0, Lcom/flyersoft/components/cloud/Ftp;->fileCount:I

    if-nez p6, :cond_2

    .line 1180
    sget p4, Lcom/flyersoft/moonreaderp/R$string;->upload:I

    invoke-virtual {p1, p4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p0, p1, p4}, Lcom/flyersoft/components/cloud/Ftp;->createProgressDialog(Landroid/content/Context;Ljava/lang/String;)Landroid/app/ProgressDialog;

    .line 1182
    :cond_2
    new-instance v0, Lcom/flyersoft/components/cloud/Ftp$23;

    move-object v1, p0

    move-object v2, p2

    move-object v3, p3

    move v4, p5

    move v5, p6

    invoke-direct/range {v0 .. v5}, Lcom/flyersoft/components/cloud/Ftp$23;-><init>(Lcom/flyersoft/components/cloud/Ftp;Ljava/util/ArrayList;Ljava/lang/String;ZZ)V

    invoke-static {v0}, Lio/reactivex/rxjava3/core/Observable;->create(Lio/reactivex/rxjava3/core/ObservableOnSubscribe;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p2

    .line 1244
    new-instance p3, Lcom/flyersoft/components/cloud/Ftp$24;

    invoke-direct {p3, p0, p1, v2}, Lcom/flyersoft/components/cloud/Ftp$24;-><init>(Lcom/flyersoft/components/cloud/Ftp;Landroid/content/Context;Ljava/util/ArrayList;)V

    .line 1264
    invoke-static {}, Lio/reactivex/rxjava3/schedulers/Schedulers;->newThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p1

    invoke-virtual {p2, p1}, Lio/reactivex/rxjava3/core/Observable;->subscribeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 1265
    invoke-static {}, Lio/reactivex/rxjava3/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/reactivex/rxjava3/core/Observable;->observeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 1266
    invoke-virtual {p1, p3}, Lio/reactivex/rxjava3/core/Observable;->subscribe(Lio/reactivex/rxjava3/functions/Consumer;)Lio/reactivex/rxjava3/disposables/Disposable;

    return-void
.end method

.method public uploadFromInputStream(Ljava/lang/String;Ljava/io/InputStream;Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterUpload;Z)V
    .locals 0

    .line 432
    new-instance p3, Lcom/flyersoft/components/cloud/Ftp$7;

    invoke-direct {p3, p0, p1, p2, p4}, Lcom/flyersoft/components/cloud/Ftp$7;-><init>(Lcom/flyersoft/components/cloud/Ftp;Ljava/lang/String;Ljava/io/InputStream;Lcom/flyersoft/components/cloud/Cloud$AfterUpload;)V

    if-eqz p5, :cond_0

    const/4 p1, 0x1

    .line 471
    invoke-virtual {p3, p1}, Ljava/lang/Thread;->setPriority(I)V

    .line 472
    :cond_0
    invoke-virtual {p3}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public validateAccount(Landroid/content/Context;)Z
    .locals 0

    .line 144
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/Ftp;->isLogin()Z

    move-result p1

    return p1
.end method

.method waitWhileBusy()V
    .locals 2

    .line 119
    :goto_0
    iget-boolean v0, p0, Lcom/flyersoft/components/cloud/Ftp;->busy:Z

    if-eqz v0, :cond_0

    const-wide/16 v0, 0x64

    .line 121
    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 123
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    .line 125
    iput-boolean v0, p0, Lcom/flyersoft/components/cloud/Ftp;->busy:Z

    .line 126
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/flyersoft/components/cloud/Ftp;->startTime:J

    return-void
.end method
