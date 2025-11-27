.class public Lcom/flyersoft/components/cloud/WebDav;
.super Lcom/flyersoft/components/cloud/Cloud;
.source "WebDav.java"


# instance fields
.field public initedPaths:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static bridge synthetic -$$Nest$mdealParentPath(Lcom/flyersoft/components/cloud/WebDav;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/components/cloud/WebDav;->dealParentPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mgetPath(Lcom/flyersoft/components/cloud/WebDav;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/components/cloud/WebDav;->getPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$misCacheSameFileSize(Lcom/flyersoft/components/cloud/WebDav;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/components/cloud/WebDav;->isCacheSameFileSize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$smverifyWebDav(Landroid/content/Context;Lcom/flyersoft/components/cloud/Cloud$AfterLogin;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/flyersoft/components/cloud/WebDav;->verifyWebDav(Landroid/content/Context;Lcom/flyersoft/components/cloud/Cloud$AfterLogin;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 44
    invoke-direct {p0}, Lcom/flyersoft/components/cloud/Cloud;-><init>()V

    return-void
.end method

.method private dealParentPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 836
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p1, ""

    :cond_0
    return-object p1
.end method

.method private getPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 697
    sget-object v0, Lcom/flyersoft/tools/A;->WEBDAV_TAG:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 698
    sget-object v0, Lcom/flyersoft/tools/A;->WEBDAV_TAG:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    const-string v0, "//"

    const-string v1, "/"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    :cond_0
    return-object p1
.end method

.method private isCacheSameFileSize(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .line 829
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 830
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

    iget-wide v2, p0, Lcom/flyersoft/components/cloud/WebDav;->mFileLen:J

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

.method public static showLoginResult(Landroid/content/Context;ZLjava/lang/String;)V
    .locals 1

    .line 325
    const-string v0, "UNDO"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    if-eqz p1, :cond_1

    .line 328
    sget p1, Lcom/flyersoft/moonreaderp/R$string;->login_success:I

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void

    .line 329
    :cond_1
    invoke-static {p2}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_2

    .line 330
    sget p1, Lcom/flyersoft/moonreaderp/R$string;->login_failed:I

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, p2}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    return-void

    .line 332
    :cond_2
    sget p1, Lcom/flyersoft/moonreaderp/R$string;->login_failed:I

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void
.end method

.method private static verifyWebDav(Landroid/content/Context;Lcom/flyersoft/components/cloud/Cloud$AfterLogin;)V
    .locals 1

    .line 289
    const-string v0, "/"

    sput-object v0, Lcom/flyersoft/tools/A;->lastWebDavPath:Ljava/lang/String;

    .line 290
    new-instance v0, Lcom/flyersoft/components/cloud/WebDav$8;

    invoke-direct {v0, p0, p1}, Lcom/flyersoft/components/cloud/WebDav$8;-><init>(Landroid/content/Context;Lcom/flyersoft/components/cloud/Cloud$AfterLogin;)V

    .line 321
    invoke-virtual {v0}, Lcom/flyersoft/components/cloud/WebDav$8;->start()V

    return-void
.end method


# virtual methods
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

    .line 362
    invoke-static {p2}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 364
    :cond_0
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/components/cloud/WebDav;->fileCount:I

    .line 365
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/WebDav;->beforeStart()V

    if-nez p3, :cond_1

    .line 367
    sget-object p3, Lcom/flyersoft/tools/A;->lastWebDavPath:Ljava/lang/String;

    .line 368
    :cond_1
    invoke-direct {p0, p3}, Lcom/flyersoft/components/cloud/WebDav;->getPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lcom/flyersoft/components/cloud/WebDav;->mPath:Ljava/lang/String;

    .line 369
    sget p3, Lcom/flyersoft/moonreaderp/R$string;->copy:I

    invoke-virtual {p1, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p0, p1, p3}, Lcom/flyersoft/components/cloud/WebDav;->createProgressDialog(Landroid/content/Context;Ljava/lang/String;)Landroid/app/ProgressDialog;

    .line 371
    new-instance p3, Lcom/flyersoft/components/cloud/WebDav$9;

    invoke-direct {p3, p0, p2}, Lcom/flyersoft/components/cloud/WebDav$9;-><init>(Lcom/flyersoft/components/cloud/WebDav;Ljava/util/ArrayList;)V

    invoke-static {p3}, Lio/reactivex/rxjava3/core/Observable;->create(Lio/reactivex/rxjava3/core/ObservableOnSubscribe;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p3

    .line 391
    new-instance v0, Lcom/flyersoft/components/cloud/WebDav$10;

    invoke-direct {v0, p0, p1, p2}, Lcom/flyersoft/components/cloud/WebDav$10;-><init>(Lcom/flyersoft/components/cloud/WebDav;Landroid/content/Context;Ljava/util/ArrayList;)V

    .line 405
    invoke-static {}, Lio/reactivex/rxjava3/schedulers/Schedulers;->newThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p1

    invoke-virtual {p3, p1}, Lio/reactivex/rxjava3/core/Observable;->subscribeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 406
    invoke-static {}, Lio/reactivex/rxjava3/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/reactivex/rxjava3/core/Observable;->observeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 407
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

    .line 496
    invoke-static {p2}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 498
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/WebDav;->beforeStart()V

    .line 499
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/components/cloud/WebDav;->fileCount:I

    .line 500
    sget v0, Lcom/flyersoft/moonreaderp/R$string;->delete:I

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/components/cloud/WebDav;->createProgressDialog(Landroid/content/Context;Ljava/lang/String;)Landroid/app/ProgressDialog;

    .line 502
    new-instance v0, Lcom/flyersoft/components/cloud/WebDav$15;

    invoke-direct {v0, p0, p2}, Lcom/flyersoft/components/cloud/WebDav$15;-><init>(Lcom/flyersoft/components/cloud/WebDav;Ljava/util/ArrayList;)V

    invoke-static {v0}, Lio/reactivex/rxjava3/core/Observable;->create(Lio/reactivex/rxjava3/core/ObservableOnSubscribe;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object v0

    .line 520
    new-instance v1, Lcom/flyersoft/components/cloud/WebDav$16;

    invoke-direct {v1, p0, p1, p2}, Lcom/flyersoft/components/cloud/WebDav$16;-><init>(Lcom/flyersoft/components/cloud/WebDav;Landroid/content/Context;Ljava/util/ArrayList;)V

    .line 534
    invoke-static {}, Lio/reactivex/rxjava3/schedulers/Schedulers;->newThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p1

    invoke-virtual {v0, p1}, Lio/reactivex/rxjava3/core/Observable;->subscribeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 535
    invoke-static {}, Lio/reactivex/rxjava3/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/reactivex/rxjava3/core/Observable;->observeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 536
    invoke-virtual {p1, v1}, Lio/reactivex/rxjava3/core/Observable;->subscribe(Lio/reactivex/rxjava3/functions/Consumer;)Lio/reactivex/rxjava3/disposables/Disposable;

    return-void
.end method

.method public dir(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 599
    invoke-virtual {p0, p1, p2, v0}, Lcom/flyersoft/components/cloud/WebDav;->dir(Landroid/content/Context;Ljava/lang/String;Lcom/flyersoft/tools/T$OnResult;)V

    return-void
.end method

.method public dir(Landroid/content/Context;Ljava/lang/String;Lcom/flyersoft/tools/T$OnResult;)V
    .locals 2

    .line 604
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/WebDav;->beforeStart()V

    .line 605
    iget-object v0, p0, Lcom/flyersoft/components/cloud/WebDav;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_3

    if-nez p3, :cond_0

    iget-object v0, p0, Lcom/flyersoft/components/cloud/WebDav;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    if-nez p3, :cond_1

    .line 608
    sput-object p2, Lcom/flyersoft/tools/A;->lastWebDavPath:Ljava/lang/String;

    .line 609
    :cond_1
    invoke-direct {p0, p2}, Lcom/flyersoft/components/cloud/WebDav;->getPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/cloud/WebDav;->mPath:Ljava/lang/String;

    if-nez p3, :cond_2

    .line 611
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/flyersoft/tools/A;->WEBDAV_TAG:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/WebDav;->mPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/components/cloud/WebDav;->createProgressDialog(Landroid/content/Context;Ljava/lang/String;)Landroid/app/ProgressDialog;

    .line 613
    :cond_2
    new-instance v0, Lcom/flyersoft/components/cloud/WebDav$19;

    invoke-direct {v0, p0, p2, p3}, Lcom/flyersoft/components/cloud/WebDav$19;-><init>(Lcom/flyersoft/components/cloud/WebDav;Ljava/lang/String;Lcom/flyersoft/tools/T$OnResult;)V

    invoke-static {v0}, Lio/reactivex/rxjava3/core/Observable;->create(Lio/reactivex/rxjava3/core/ObservableOnSubscribe;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p2

    .line 640
    new-instance v0, Lcom/flyersoft/components/cloud/WebDav$20;

    invoke-direct {v0, p0, p3, p1}, Lcom/flyersoft/components/cloud/WebDav$20;-><init>(Lcom/flyersoft/components/cloud/WebDav;Lcom/flyersoft/tools/T$OnResult;Landroid/content/Context;)V

    .line 691
    invoke-static {}, Lio/reactivex/rxjava3/schedulers/Schedulers;->newThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p1

    invoke-virtual {p2, p1}, Lio/reactivex/rxjava3/core/Observable;->subscribeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 692
    invoke-static {}, Lio/reactivex/rxjava3/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/reactivex/rxjava3/core/Observable;->observeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 693
    invoke-virtual {p1, v0}, Lio/reactivex/rxjava3/core/Observable;->subscribe(Lio/reactivex/rxjava3/functions/Consumer;)Lio/reactivex/rxjava3/disposables/Disposable;

    :cond_3
    :goto_0
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

    .line 704
    invoke-static {p2}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 706
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/WebDav;->beforeStart()V

    .line 707
    invoke-direct {p0, p3}, Lcom/flyersoft/components/cloud/WebDav;->getPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lcom/flyersoft/components/cloud/WebDav;->mPath:Ljava/lang/String;

    .line 708
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p3

    iput p3, p0, Lcom/flyersoft/components/cloud/WebDav;->fileCount:I

    .line 709
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->download:I

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " ["

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/flyersoft/components/cloud/WebDav;->fileCount:I

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

    invoke-virtual {p0, p1, p3}, Lcom/flyersoft/components/cloud/WebDav;->createProgressDialog(Landroid/content/Context;Ljava/lang/String;)Landroid/app/ProgressDialog;

    .line 711
    new-instance p3, Lcom/flyersoft/components/cloud/WebDav$21;

    invoke-direct {p3, p0, p2, p1, p4}, Lcom/flyersoft/components/cloud/WebDav$21;-><init>(Lcom/flyersoft/components/cloud/WebDav;Ljava/util/ArrayList;Landroid/content/Context;Z)V

    invoke-static {p3}, Lio/reactivex/rxjava3/core/Observable;->create(Lio/reactivex/rxjava3/core/ObservableOnSubscribe;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p3

    .line 779
    new-instance v0, Lcom/flyersoft/components/cloud/WebDav$22;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/flyersoft/components/cloud/WebDav$22;-><init>(Lcom/flyersoft/components/cloud/WebDav;Landroid/content/Context;Ljava/util/ArrayList;ZLcom/flyersoft/tools/T$OnResult;)V

    .line 823
    invoke-static {}, Lio/reactivex/rxjava3/schedulers/Schedulers;->newThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p1

    invoke-virtual {p3, p1}, Lio/reactivex/rxjava3/core/Observable;->subscribeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 824
    invoke-static {}, Lio/reactivex/rxjava3/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/reactivex/rxjava3/core/Observable;->observeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 825
    invoke-virtual {p1, v0}, Lio/reactivex/rxjava3/core/Observable;->subscribe(Lio/reactivex/rxjava3/functions/Consumer;)Lio/reactivex/rxjava3/disposables/Disposable;

    return-void
.end method

.method public downloadToOutputStream(Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterDownload;Z)V
    .locals 1

    .line 241
    new-instance v0, Lcom/flyersoft/components/cloud/WebDav$6;

    invoke-direct {v0, p0, p1, p2}, Lcom/flyersoft/components/cloud/WebDav$6;-><init>(Lcom/flyersoft/components/cloud/WebDav;Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterDownload;)V

    if-eqz p3, :cond_0

    const/4 p1, 0x1

    .line 257
    invoke-virtual {v0, p1}, Ljava/lang/Thread;->setPriority(I)V

    .line 258
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public getBackupList(Landroid/content/Context;Lcom/flyersoft/components/cloud/Cloud$OnGetBackupList;)V
    .locals 2

    .line 915
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/WebDav;->beforeStart()V

    .line 916
    sget-object v0, Lcom/flyersoft/tools/A;->WEBDAV_TAG:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/components/cloud/WebDav;->createProgressDialog(Landroid/content/Context;Ljava/lang/String;)Landroid/app/ProgressDialog;

    .line 918
    new-instance v0, Lcom/flyersoft/components/cloud/WebDav$25;

    invoke-direct {v0, p0}, Lcom/flyersoft/components/cloud/WebDav$25;-><init>(Lcom/flyersoft/components/cloud/WebDav;)V

    invoke-static {v0}, Lio/reactivex/rxjava3/core/Observable;->create(Lio/reactivex/rxjava3/core/ObservableOnSubscribe;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object v0

    .line 939
    new-instance v1, Lcom/flyersoft/components/cloud/WebDav$26;

    invoke-direct {v1, p0, p1, p2}, Lcom/flyersoft/components/cloud/WebDav$26;-><init>(Lcom/flyersoft/components/cloud/WebDav;Landroid/content/Context;Lcom/flyersoft/components/cloud/Cloud$OnGetBackupList;)V

    .line 950
    invoke-static {}, Lio/reactivex/rxjava3/schedulers/Schedulers;->newThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p1

    invoke-virtual {v0, p1}, Lio/reactivex/rxjava3/core/Observable;->subscribeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 951
    invoke-static {}, Lio/reactivex/rxjava3/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/reactivex/rxjava3/core/Observable;->observeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 952
    invoke-virtual {p1, v1}, Lio/reactivex/rxjava3/core/Observable;->subscribe(Lio/reactivex/rxjava3/functions/Consumer;)Lio/reactivex/rxjava3/disposables/Disposable;

    return-void
.end method

.method public declared-synchronized initPaths(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    monitor-enter p0

    .line 338
    :try_start_0
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 339
    monitor-exit p0

    return-object v1

    .line 340
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/flyersoft/components/cloud/WebDav;->initedPaths:Ljava/util/ArrayList;

    if-nez v0, :cond_1

    .line 341
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/components/cloud/WebDav;->initedPaths:Ljava/util/ArrayList;

    .line 342
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/components/cloud/WebDav;->initedPaths:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-eqz v0, :cond_2

    .line 343
    monitor-exit p0

    return-object v1

    .line 344
    :cond_2
    :try_start_2
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNetworkConnecting(Landroid/content/Context;)Z

    move-result v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-nez v0, :cond_3

    .line 345
    monitor-exit p0

    return-object v1

    .line 348
    :cond_3
    :try_start_3
    new-instance v0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;

    invoke-direct {v0, p1}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->makeDirs()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_4

    .line 350
    iget-object v1, p0, Lcom/flyersoft/components/cloud/WebDav;->initedPaths:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 351
    :cond_4
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception p1

    .line 353
    :try_start_4
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 354
    invoke-static {p1}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    monitor-exit p0

    return-object p1

    :catchall_1
    move-exception p1

    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    throw p1
.end method

.method public isLogin()Z
    .locals 1

    const/4 v0, 0x0

    .line 47
    invoke-static {v0}, Lcom/flyersoft/components/cloud/webdav/WebDavHelp;->initWebDav(Z)Z

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

    .line 412
    invoke-static {p2}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 414
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/WebDav;->beforeStart()V

    if-nez p3, :cond_1

    .line 416
    sget-object p3, Lcom/flyersoft/tools/A;->lastWebDavPath:Ljava/lang/String;

    .line 417
    :cond_1
    invoke-direct {p0, p3}, Lcom/flyersoft/components/cloud/WebDav;->getPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lcom/flyersoft/components/cloud/WebDav;->mPath:Ljava/lang/String;

    .line 418
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p3

    iput p3, p0, Lcom/flyersoft/components/cloud/WebDav;->fileCount:I

    .line 419
    sget p3, Lcom/flyersoft/moonreaderp/R$string;->move:I

    invoke-virtual {p1, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p0, p1, p3}, Lcom/flyersoft/components/cloud/WebDav;->createProgressDialog(Landroid/content/Context;Ljava/lang/String;)Landroid/app/ProgressDialog;

    .line 421
    new-instance p3, Lcom/flyersoft/components/cloud/WebDav$11;

    invoke-direct {p3, p0, p2}, Lcom/flyersoft/components/cloud/WebDav$11;-><init>(Lcom/flyersoft/components/cloud/WebDav;Ljava/util/ArrayList;)V

    invoke-static {p3}, Lio/reactivex/rxjava3/core/Observable;->create(Lio/reactivex/rxjava3/core/ObservableOnSubscribe;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p3

    .line 441
    new-instance v0, Lcom/flyersoft/components/cloud/WebDav$12;

    invoke-direct {v0, p0, p1, p2}, Lcom/flyersoft/components/cloud/WebDav$12;-><init>(Lcom/flyersoft/components/cloud/WebDav;Landroid/content/Context;Ljava/util/ArrayList;)V

    .line 455
    invoke-static {}, Lio/reactivex/rxjava3/schedulers/Schedulers;->newThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p1

    invoke-virtual {p3, p1}, Lio/reactivex/rxjava3/core/Observable;->subscribeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 456
    invoke-static {}, Lio/reactivex/rxjava3/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/reactivex/rxjava3/core/Observable;->observeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 457
    invoke-virtual {p1, v0}, Lio/reactivex/rxjava3/core/Observable;->subscribe(Lio/reactivex/rxjava3/functions/Consumer;)Lio/reactivex/rxjava3/disposables/Disposable;

    return-void
.end method

.method public rename(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 462
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/WebDav;->beforeStart()V

    .line 463
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

    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/components/cloud/WebDav;->createProgressDialog(Landroid/content/Context;Ljava/lang/String;)Landroid/app/ProgressDialog;

    .line 465
    new-instance v0, Lcom/flyersoft/components/cloud/WebDav$13;

    invoke-direct {v0, p0, p2, p3}, Lcom/flyersoft/components/cloud/WebDav$13;-><init>(Lcom/flyersoft/components/cloud/WebDav;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0}, Lio/reactivex/rxjava3/core/Observable;->create(Lio/reactivex/rxjava3/core/ObservableOnSubscribe;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p2

    .line 479
    new-instance p3, Lcom/flyersoft/components/cloud/WebDav$14;

    invoke-direct {p3, p0, p1}, Lcom/flyersoft/components/cloud/WebDav$14;-><init>(Lcom/flyersoft/components/cloud/WebDav;Landroid/content/Context;)V

    .line 489
    invoke-static {}, Lio/reactivex/rxjava3/schedulers/Schedulers;->newThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p1

    invoke-virtual {p2, p1}, Lio/reactivex/rxjava3/core/Observable;->subscribeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 490
    invoke-static {}, Lio/reactivex/rxjava3/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/reactivex/rxjava3/core/Observable;->observeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 491
    invoke-virtual {p1, p3}, Lio/reactivex/rxjava3/core/Observable;->subscribe(Lio/reactivex/rxjava3/functions/Consumer;)Lio/reactivex/rxjava3/disposables/Disposable;

    return-void
.end method

.method public search(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 541
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/WebDav;->beforeStart()V

    if-nez p2, :cond_0

    .line 543
    sget-object p2, Lcom/flyersoft/tools/A;->lastWebDavPath:Ljava/lang/String;

    .line 544
    :cond_0
    invoke-direct {p0, p2}, Lcom/flyersoft/components/cloud/WebDav;->getPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/flyersoft/components/cloud/WebDav;->mPath:Ljava/lang/String;

    .line 545
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

    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/components/cloud/WebDav;->createProgressDialog(Landroid/content/Context;Ljava/lang/String;)Landroid/app/ProgressDialog;

    .line 547
    new-instance p2, Lcom/flyersoft/components/cloud/WebDav$17;

    invoke-direct {p2, p0}, Lcom/flyersoft/components/cloud/WebDav$17;-><init>(Lcom/flyersoft/components/cloud/WebDav;)V

    invoke-static {p2}, Lio/reactivex/rxjava3/core/Observable;->create(Lio/reactivex/rxjava3/core/ObservableOnSubscribe;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p2

    .line 563
    new-instance v0, Lcom/flyersoft/components/cloud/WebDav$18;

    invoke-direct {v0, p0, p1, p3}, Lcom/flyersoft/components/cloud/WebDav$18;-><init>(Lcom/flyersoft/components/cloud/WebDav;Landroid/content/Context;Ljava/lang/String;)V

    .line 592
    invoke-static {}, Lio/reactivex/rxjava3/schedulers/Schedulers;->newThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p1

    invoke-virtual {p2, p1}, Lio/reactivex/rxjava3/core/Observable;->subscribeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 593
    invoke-static {}, Lio/reactivex/rxjava3/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/reactivex/rxjava3/core/Observable;->observeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 594
    invoke-virtual {p1, v0}, Lio/reactivex/rxjava3/core/Observable;->subscribe(Lio/reactivex/rxjava3/functions/Consumer;)Lio/reactivex/rxjava3/disposables/Disposable;

    return-void
.end method

.method public showLogin(Landroid/content/Context;ZLcom/flyersoft/components/cloud/Cloud$AfterLogin;)V
    .locals 18

    move-object/from16 v1, p0

    move-object/from16 v12, p1

    .line 57
    invoke-static {v12}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v2, Lcom/flyersoft/moonreaderp/R$layout;->webdav_options:I

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 58
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->button1:I

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 59
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->syncReadingProgress:I

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    move-object v5, v3

    check-cast v5, Landroid/widget/CheckBox;

    .line 60
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->syncShelf:I

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    move-object v6, v3

    check-cast v6, Landroid/widget/CheckBox;

    .line 61
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->syncShowMessage:I

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    move-object v7, v3

    check-cast v7, Landroid/widget/CheckBox;

    .line 62
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->syncButtonOnly:I

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    move-object v8, v3

    check-cast v8, Landroid/widget/CheckBox;

    .line 63
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->syncViaMenuOnly:I

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    move-object v9, v3

    check-cast v9, Landroid/widget/CheckBox;

    .line 64
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->syncWifiOnly:I

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    move-object v10, v3

    check-cast v10, Landroid/widget/CheckBox;

    .line 65
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->path:I

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    move-object v11, v3

    check-cast v11, Landroid/widget/EditText;

    .line 66
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->url:I

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    .line 67
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->username:I

    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/EditText;

    .line 68
    sget v13, Lcom/flyersoft/moonreaderp/R$id;->password:I

    invoke-virtual {v0, v13}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v13

    check-cast v13, Landroid/widget/EditText;

    .line 69
    sget v14, Lcom/flyersoft/moonreaderp/R$id;->portLay:I

    invoke-virtual {v0, v14}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v14

    const/16 v15, 0x8

    invoke-virtual {v14, v15}, Landroid/view/View;->setVisibility(I)V

    const/4 v14, 0x1

    .line 71
    invoke-static {v14}, Lcom/flyersoft/components/cloud/webdav/WebDavHelp;->initWebDav(Z)Z

    move-result v16

    .line 72
    sget-object v15, Lcom/flyersoft/components/cloud/webdav/WebDavHelp;->webDavUrl:Ljava/lang/String;

    invoke-virtual {v3, v15}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 73
    sget-object v15, Lcom/flyersoft/components/cloud/webdav/WebDavHelp;->user:Ljava/lang/String;

    invoke-virtual {v4, v15}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 74
    sget-object v15, Lcom/flyersoft/components/cloud/webdav/WebDavHelp;->pass:Ljava/lang/String;

    invoke-virtual {v13, v15}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    if-eqz v16, :cond_0

    const/4 v15, 0x0

    goto :goto_0

    :cond_0
    const/16 v15, 0x8

    :goto_0
    const/16 v17, 0x0

    .line 75
    invoke-virtual {v2, v15}, Landroid/widget/Button;->setVisibility(I)V

    .line 76
    sget v15, Lcom/flyersoft/moonreaderp/R$id;->tip:I

    invoke-virtual {v0, v15}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v15

    if-nez v16, :cond_1

    const/4 v14, 0x0

    goto :goto_1

    :cond_1
    const/16 v14, 0x8

    :goto_1
    invoke-virtual {v15, v14}, Landroid/view/View;->setVisibility(I)V

    const/4 v14, 0x6

    .line 78
    invoke-static {v0, v14}, Lcom/flyersoft/components/cloud/WebDav;->fixCloudTitle(Landroid/view/View;I)V

    .line 79
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v14, Lcom/flyersoft/tools/A;->WEBDAV_TAG:Ljava/lang/String;

    invoke-virtual {v15, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v14, Lcom/flyersoft/tools/A;->webDavBookPath:Ljava/lang/String;

    invoke-virtual {v15, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v11, v14}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 83
    invoke-static {}, Lcom/flyersoft/tools/A;->isPro()Z

    move-result v14

    if-nez v14, :cond_3

    .line 84
    sget-boolean v14, Lcom/flyersoft/tools/A;->syncShelf:Z

    if-eqz v14, :cond_2

    .line 85
    sput-boolean v17, Lcom/flyersoft/tools/A;->syncShelf:Z

    :cond_2
    const v14, -0x777778

    .line 86
    invoke-virtual {v6, v14}, Landroid/widget/CheckBox;->setTextColor(I)V

    .line 87
    invoke-virtual {v6}, Landroid/widget/CheckBox;->getPaint()Landroid/text/TextPaint;

    move-result-object v14

    const/4 v15, 0x1

    invoke-virtual {v14, v15}, Landroid/text/TextPaint;->setStrikeThruText(Z)V

    .line 88
    const-string v14, "ignore"

    invoke-virtual {v6, v14}, Landroid/widget/CheckBox;->setTag(Ljava/lang/Object;)V

    .line 91
    :cond_3
    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->hasDownloadUploadRecords()Z

    move-result v14

    if-nez v14, :cond_4

    .line 92
    sget v14, Lcom/flyersoft/moonreaderp/R$id;->clearRecords:I

    invoke-virtual {v0, v14}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v14

    const/16 v15, 0x8

    invoke-virtual {v14, v15}, Landroid/view/View;->setVisibility(I)V

    goto :goto_2

    .line 94
    :cond_4
    sget v14, Lcom/flyersoft/moonreaderp/R$id;->clearRecords:I

    invoke-virtual {v0, v14}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v14

    new-instance v15, Lcom/flyersoft/components/cloud/WebDav$1;

    invoke-direct {v15, v1, v0}, Lcom/flyersoft/components/cloud/WebDav$1;-><init>(Lcom/flyersoft/components/cloud/WebDav;Landroid/view/ViewGroup;)V

    invoke-virtual {v14, v15}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 102
    :goto_2
    sget-boolean v14, Lcom/flyersoft/tools/A;->syncProgress:Z

    invoke-virtual {v5, v14}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 103
    sget-boolean v14, Lcom/flyersoft/tools/A;->syncShelf:Z

    invoke-virtual {v6, v14}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 104
    sget-boolean v14, Lcom/flyersoft/tools/A;->showSyncMsg:Z

    invoke-virtual {v7, v14}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 105
    sget-boolean v14, Lcom/flyersoft/tools/A;->syncManually:Z

    invoke-virtual {v8, v14}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 106
    sget-boolean v14, Lcom/flyersoft/tools/A;->syncShelfViaMenuOnly:Z

    invoke-virtual {v9, v14}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 107
    sget-boolean v14, Lcom/flyersoft/tools/A;->syncBookInWiFiOnly:Z

    invoke-virtual {v10, v14}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 109
    sget-boolean v14, Lcom/flyersoft/tools/A;->syncBookInWiFiOnly:Z

    if-nez v14, :cond_5

    const/16 v15, 0x8

    .line 110
    invoke-virtual {v10, v15}, Landroid/widget/CheckBox;->setVisibility(I)V

    :cond_5
    if-nez p2, :cond_6

    if-eqz v16, :cond_6

    .line 112
    sget v14, Lcom/flyersoft/tools/A;->syncType:I

    const/4 v15, 0x6

    if-eq v14, v15, :cond_7

    .line 113
    :cond_6
    sget v14, Lcom/flyersoft/moonreaderp/R$id;->syncLay:I

    invoke-virtual {v0, v14}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v14

    const/16 v15, 0x8

    invoke-virtual {v14, v15}, Landroid/view/View;->setVisibility(I)V

    .line 114
    sget v14, Lcom/flyersoft/moonreaderp/R$id;->moreLay:I

    invoke-virtual {v0, v14}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v14

    invoke-virtual {v14, v15}, Landroid/view/View;->setVisibility(I)V

    .line 117
    :cond_7
    new-instance v14, Lcom/flyersoft/components/cloud/WebDav$2;

    invoke-direct {v14, v1, v12, v2}, Lcom/flyersoft/components/cloud/WebDav$2;-><init>(Lcom/flyersoft/components/cloud/WebDav;Landroid/content/Context;Landroid/widget/Button;)V

    invoke-virtual {v2, v14}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 132
    new-instance v2, Lcom/flyersoft/components/cloud/WebDav$3;

    invoke-direct {v2, v1, v12}, Lcom/flyersoft/components/cloud/WebDav$3;-><init>(Lcom/flyersoft/components/cloud/WebDav;Landroid/content/Context;)V

    invoke-virtual {v6, v2}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 165
    new-instance v2, Lcom/flyersoft/components/MyDialog;

    invoke-direct {v2, v12}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    new-instance v14, Ljava/lang/StringBuilder;

    const-string v15, "WebDav"

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-eqz v16, :cond_8

    .line 166
    const-string v15, ""

    goto :goto_3

    :cond_8
    new-instance v15, Ljava/lang/StringBuilder;

    const-string v1, " ("

    invoke-direct {v15, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->unlink_hint:I

    invoke-virtual {v12, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v15, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v15, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    :goto_3
    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v1

    .line 167
    invoke-virtual {v1, v0}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v14

    new-instance v0, Lcom/flyersoft/components/cloud/WebDav$5;

    move-object/from16 v1, p0

    move-object v2, v3

    move-object v3, v4

    move-object v4, v13

    move-object/from16 v13, p3

    invoke-direct/range {v0 .. v13}, Lcom/flyersoft/components/cloud/WebDav$5;-><init>(Lcom/flyersoft/components/cloud/WebDav;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/EditText;Landroid/content/Context;Lcom/flyersoft/components/cloud/Cloud$AfterLogin;)V

    const v2, 0x104000a

    .line 168
    invoke-virtual {v14, v2, v0}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v2, Lcom/flyersoft/components/cloud/WebDav$4;

    invoke-direct {v2, v1, v13}, Lcom/flyersoft/components/cloud/WebDav$4;-><init>(Lcom/flyersoft/components/cloud/WebDav;Lcom/flyersoft/components/cloud/Cloud$AfterLogin;)V

    const/high16 v3, 0x1040000

    .line 215
    invoke-virtual {v0, v3, v2}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    const/4 v2, 0x0

    .line 221
    invoke-virtual {v0, v2}, Lcom/flyersoft/components/MyDialog;->setCancelable(Z)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method

.method public unlink()V
    .locals 3

    .line 226
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "webdav"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 227
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/webdav.xml"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->deleteFile(Ljava/lang/String;)Z

    .line 228
    sget v0, Lcom/flyersoft/tools/A;->syncType:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_0

    .line 229
    sput v2, Lcom/flyersoft/tools/A;->syncType:I

    .line 230
    :cond_0
    const-string v0, "/"

    sput-object v0, Lcom/flyersoft/tools/A;->lastWebDavPath:Ljava/lang/String;

    .line 231
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->SaveOptions(Landroid/content/Context;)V

    const/4 v0, 0x0

    .line 232
    sput-object v0, Lcom/flyersoft/components/cloud/webdav/WebDavHelp;->ok:Ljava/lang/Boolean;

    .line 233
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 234
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->restartApp()V

    return-void

    .line 236
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

    .line 841
    invoke-static {p2}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 843
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/WebDav;->beforeStart()V

    if-nez p4, :cond_1

    .line 845
    sget-object p4, Lcom/flyersoft/tools/A;->lastWebDavPath:Ljava/lang/String;

    .line 846
    :cond_1
    invoke-direct {p0, p4}, Lcom/flyersoft/components/cloud/WebDav;->getPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    iput-object p4, p0, Lcom/flyersoft/components/cloud/WebDav;->mPath:Ljava/lang/String;

    .line 847
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p4

    iput p4, p0, Lcom/flyersoft/components/cloud/WebDav;->fileCount:I

    if-nez p6, :cond_2

    .line 849
    sget p4, Lcom/flyersoft/moonreaderp/R$string;->upload:I

    invoke-virtual {p1, p4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p0, p1, p4}, Lcom/flyersoft/components/cloud/WebDav;->createProgressDialog(Landroid/content/Context;Ljava/lang/String;)Landroid/app/ProgressDialog;

    .line 851
    :cond_2
    new-instance v0, Lcom/flyersoft/components/cloud/WebDav$23;

    move-object v1, p0

    move-object v2, p2

    move-object v3, p3

    move v4, p5

    move v5, p6

    invoke-direct/range {v0 .. v5}, Lcom/flyersoft/components/cloud/WebDav$23;-><init>(Lcom/flyersoft/components/cloud/WebDav;Ljava/util/ArrayList;Ljava/lang/String;ZZ)V

    invoke-static {v0}, Lio/reactivex/rxjava3/core/Observable;->create(Lio/reactivex/rxjava3/core/ObservableOnSubscribe;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p2

    .line 893
    new-instance p3, Lcom/flyersoft/components/cloud/WebDav$24;

    invoke-direct {p3, p0, p1, v2}, Lcom/flyersoft/components/cloud/WebDav$24;-><init>(Lcom/flyersoft/components/cloud/WebDav;Landroid/content/Context;Ljava/util/ArrayList;)V

    .line 908
    invoke-static {}, Lio/reactivex/rxjava3/schedulers/Schedulers;->newThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p1

    invoke-virtual {p2, p1}, Lio/reactivex/rxjava3/core/Observable;->subscribeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 909
    invoke-static {}, Lio/reactivex/rxjava3/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/reactivex/rxjava3/core/Observable;->observeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 910
    invoke-virtual {p1, p3}, Lio/reactivex/rxjava3/core/Observable;->subscribe(Lio/reactivex/rxjava3/functions/Consumer;)Lio/reactivex/rxjava3/disposables/Disposable;

    return-void
.end method

.method public uploadFromInputStream(Ljava/lang/String;Ljava/io/InputStream;Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterUpload;Z)V
    .locals 0

    .line 263
    new-instance p3, Lcom/flyersoft/components/cloud/WebDav$7;

    invoke-direct {p3, p0, p1, p2, p4}, Lcom/flyersoft/components/cloud/WebDav$7;-><init>(Lcom/flyersoft/components/cloud/WebDav;Ljava/lang/String;Ljava/io/InputStream;Lcom/flyersoft/components/cloud/Cloud$AfterUpload;)V

    if-eqz p5, :cond_0

    const/4 p1, 0x1

    .line 282
    invoke-virtual {p3, p1}, Ljava/lang/Thread;->setPriority(I)V

    .line 283
    :cond_0
    invoke-virtual {p3}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public validateAccount(Landroid/content/Context;)Z
    .locals 0

    .line 52
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/WebDav;->isLogin()Z

    move-result p1

    return p1
.end method
