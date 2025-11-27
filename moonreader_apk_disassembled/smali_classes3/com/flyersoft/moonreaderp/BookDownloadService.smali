.class public Lcom/flyersoft/moonreaderp/BookDownloadService;
.super Landroid/app/Service;
.source "BookDownloadService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/moonreaderp/BookDownloadService$Go;
    }
.end annotation


# static fields
.field static final DOWNLOAD_CANCELLED:I = 0x3

.field static final DOWNLOAD_ERROR:I = 0x0

.field static final DOWNLOAD_NEED_PASSWORD:I = 0x2

.field static final DOWNLOAD_SUCCESS:I = 0x1


# instance fields
.field final downloadingNotifications:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field final downloadingUrls:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private goInstances:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/flyersoft/moonreaderp/BookDownloadService$Go;",
            ">;"
        }
    .end annotation
.end field

.field public selfPref:Lcom/flyersoft/moonreaderp/BookDownloadService;

.field volatile serviceCounter:I


# direct methods
.method static bridge synthetic -$$Nest$fgetgoInstances(Lcom/flyersoft/moonreaderp/BookDownloadService;)Ljava/util/HashMap;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService;->goInstances:Ljava/util/HashMap;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mdoStop(Lcom/flyersoft/moonreaderp/BookDownloadService;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/BookDownloadService;->doStop()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mgetCookieStore(Lcom/flyersoft/moonreaderp/BookDownloadService;Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/impl/client/BasicCookieStore;
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/moonreaderp/BookDownloadService;->getCookieStore(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/impl/client/BasicCookieStore;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$misCancelled(Lcom/flyersoft/moonreaderp/BookDownloadService;I)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/BookDownloadService;->isCancelled(I)Z

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$mpostProgressToNetInfoDialog(Lcom/flyersoft/moonreaderp/BookDownloadService;II)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/moonreaderp/BookDownloadService;->postProgressToNetInfoDialog(II)V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 50
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 56
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 57
    invoke-static {v0}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService;->downloadingUrls:Ljava/util/Set;

    .line 58
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService;->downloadingNotifications:Ljava/util/Set;

    const/4 v0, 0x0

    .line 61
    iput v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService;->serviceCounter:I

    .line 141
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService;->goInstances:Ljava/util/HashMap;

    return-void
.end method

.method private doStart()V
    .locals 1

    .line 107
    iget v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService;->serviceCounter:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService;->serviceCounter:I

    return-void
.end method

.method private doStop()V
    .locals 1

    .line 111
    iget v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService;->serviceCounter:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService;->serviceCounter:I

    .line 113
    iget v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService;->serviceCounter:I

    if-nez v0, :cond_0

    .line 114
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/BookDownloadService;->stopSelf()V

    :cond_0
    return-void
.end method

.method public static getBookFromZip(Ljava/lang/String;)Ljava/lang/String;
    .locals 9

    .line 597
    :try_start_0
    invoke-static {p0}, Lcom/flyersoft/tools/compress/BaseCompressor;->createZipper(Ljava/lang/String;)Lcom/flyersoft/tools/compress/BaseCompressor;

    move-result-object v0

    const/4 v1, 0x1

    .line 598
    invoke-virtual {v0, v1}, Lcom/flyersoft/tools/compress/BaseCompressor;->getAllList(Z)Ljava/util/ArrayList;

    move-result-object v1

    .line 599
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 600
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 601
    invoke-static {v3}, Lcom/flyersoft/tools/A;->isReadableFile(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 602
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 603
    :cond_1
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-nez v1, :cond_2

    goto/16 :goto_3

    :cond_2
    const/4 v1, 0x0

    const/4 v3, 0x0

    .line 607
    :goto_1
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v1, v4, :cond_5

    .line 608
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    .line 609
    const-string v5, ".epub"

    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_6

    const-string v5, ".epub3"

    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    goto :goto_2

    :cond_3
    if-eq v3, v1, :cond_4

    .line 613
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v0, v4}, Lcom/flyersoft/tools/compress/BaseCompressor;->getFileInfo(Ljava/lang/String;)Lcom/flyersoft/tools/compress/BaseCompressor$ZRFileInfo;

    move-result-object v4

    iget-wide v4, v4, Lcom/flyersoft/tools/compress/BaseCompressor$ZRFileInfo;->size:J

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v0, v6}, Lcom/flyersoft/tools/compress/BaseCompressor;->getFileInfo(Ljava/lang/String;)Lcom/flyersoft/tools/compress/BaseCompressor$ZRFileInfo;

    move-result-object v6

    iget-wide v6, v6, Lcom/flyersoft/tools/compress/BaseCompressor$ZRFileInfo;->size:J

    cmp-long v8, v4, v6

    if-gez v8, :cond_4

    move v3, v1

    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_5
    move v1, v3

    .line 617
    :cond_6
    :goto_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Lcom/flyersoft/tools/T;->getFileExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 618
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1, v3}, Lcom/flyersoft/tools/compress/BaseCompressor;->saveToFile(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v0, :cond_7

    return-object v3

    :cond_7
    :goto_3
    return-object p0

    :catch_0
    move-exception v0

    .line 623
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-object p0
.end method

.method private getCookieStore(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/impl/client/BasicCookieStore;
    .locals 7

    .line 578
    const-string v0, ";"

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    .line 579
    new-instance v0, Lorg/apache/http/impl/client/BasicCookieStore;

    invoke-direct {v0}, Lorg/apache/http/impl/client/BasicCookieStore;-><init>()V

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 582
    :goto_0
    array-length v3, p1

    if-ge v2, v3, :cond_1

    .line 583
    aget-object v3, p1, v2

    const-string v4, "="

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 584
    array-length v4, v3

    const/4 v5, 0x2

    if-ne v4, v5, :cond_0

    .line 585
    new-instance v4, Lorg/apache/http/impl/cookie/BasicClientCookie;

    aget-object v5, v3, v1

    const/4 v6, 0x1

    aget-object v3, v3, v6

    invoke-direct {v4, v5, v3}, Lorg/apache/http/impl/cookie/BasicClientCookie;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 587
    :cond_0
    new-instance v4, Lorg/apache/http/impl/cookie/BasicClientCookie;

    aget-object v3, v3, v1

    const/4 v5, 0x0

    invoke-direct {v4, v3, v5}, Lorg/apache/http/impl/cookie/BasicClientCookie;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 589
    :goto_1
    invoke-virtual {v4, p2}, Lorg/apache/http/impl/cookie/BasicClientCookie;->setDomain(Ljava/lang/String;)V

    .line 590
    invoke-virtual {v0, v4}, Lorg/apache/http/impl/client/BasicCookieStore;->addCookie(Lorg/apache/http/cookie/Cookie;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method private isCancelled(I)Z
    .locals 2

    .line 155
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/BookDownloadService;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->dataDir:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/cache/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method private postProgressToNetInfoDialog(II)V
    .locals 3

    .line 572
    sget-object v0, Lcom/flyersoft/moonreaderp/NetBookInfo;->selfPref:Lcom/flyersoft/moonreaderp/NetBookInfo;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 573
    sget-object v0, Lcom/flyersoft/moonreaderp/NetBookInfo;->selfPref:Lcom/flyersoft/moonreaderp/NetBookInfo;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/NetBookInfo;->handler:Landroid/os/Handler;

    sget-object v1, Lcom/flyersoft/moonreaderp/NetBookInfo;->selfPref:Lcom/flyersoft/moonreaderp/NetBookInfo;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/NetBookInfo;->handler:Landroid/os/Handler;

    const/16 v2, 0x64

    .line 574
    invoke-virtual {v1, v2, p1, p2}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object p1

    .line 573
    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_0
    return-void
.end method


# virtual methods
.method getGoInstance(Ljava/lang/String;)Lcom/flyersoft/moonreaderp/BookDownloadService$Go;
    .locals 2

    .line 144
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService;->goInstances:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 145
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService;->goInstances:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    return-object p1

    .line 147
    :cond_0
    new-instance v0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;-><init>(Lcom/flyersoft/moonreaderp/BookDownloadService;)V

    .line 148
    iput-object p1, v0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->url_str:Ljava/lang/String;

    .line 149
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService;->goInstances:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public onDestroy()V
    .locals 0

    .line 120
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    return-void
.end method

.method public onRebind(Landroid/content/Intent;)V
    .locals 0

    .line 131
    invoke-super {p0, p1}, Landroid/app/Service;->onRebind(Landroid/content/Intent;)V

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 3

    const/4 p2, 0x1

    if-eqz p1, :cond_4

    .line 68
    :try_start_0
    iput-object p0, p0, Lcom/flyersoft/moonreaderp/BookDownloadService;->selfPref:Lcom/flyersoft/moonreaderp/BookDownloadService;

    .line 69
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/BookDownloadService;->doStart()V

    .line 71
    const-string p3, "url"

    invoke-virtual {p1, p3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    if-nez p3, :cond_0

    .line 73
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/BookDownloadService;->doStop()V

    return p2

    .line 77
    :cond_0
    invoke-virtual {p0, p3}, Lcom/flyersoft/moonreaderp/BookDownloadService;->getGoInstance(Ljava/lang/String;)Lcom/flyersoft/moonreaderp/BookDownloadService$Go;

    move-result-object v0

    .line 78
    const-string v1, "id"

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    iput v1, v0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->notificationId:I

    .line 80
    const-string v1, "saveName"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->saveName:Ljava/lang/String;

    .line 81
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->saveName:Ljava/lang/String;

    if-nez v1, :cond_1

    .line 82
    invoke-static {p3}, Lcom/flyersoft/tools/T;->deleteSpecialChar(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->saveName:Ljava/lang/String;

    .line 84
    :cond_1
    const-string v1, "library_xml"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->library_xml:Ljava/lang/String;

    .line 85
    const-string v1, "user_agent"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->user_agent:Ljava/lang/String;

    .line 86
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->user_agent:Ljava/lang/String;

    if-nez v1, :cond_2

    .line 87
    const-string v1, "OPDS/Stanza iPhone/Aldiko/Moon+ Reader(Android)"

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->user_agent:Ljava/lang/String;

    .line 89
    :cond_2
    const-string v1, "username"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->username:Ljava/lang/String;

    .line 90
    const-string v1, "password"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, v0, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->password:Ljava/lang/String;

    .line 92
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/BookDownloadService;->downloadingUrls:Ljava/util/Set;

    invoke-interface {p1, p3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 93
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/BookDownloadService;->doStop()V

    return p2

    .line 97
    :cond_3
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/BookDownloadService$Go;->startFileDownload()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 100
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_4
    :goto_0
    return p2
.end method

.method public onUnbind(Landroid/content/Intent;)Z
    .locals 0

    .line 136
    invoke-super {p0, p1}, Landroid/app/Service;->onUnbind(Landroid/content/Intent;)Z

    move-result p1

    return p1
.end method
