.class public Lcom/flyersoft/components/cloud/Dropbox;
.super Lcom/flyersoft/components/cloud/Cloud;
.source "Dropbox.java"


# static fields
.field public static final ACCOUNT_PREFS_NAME:Ljava/lang/String; = "dropbox"


# instance fields
.field public isLoggined:Z

.field private sDbxClient:Lcom/dropbox/core/v2/DbxClientV2;


# direct methods
.method static bridge synthetic -$$Nest$mdealParentPath(Lcom/flyersoft/components/cloud/Dropbox;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/components/cloud/Dropbox;->dealParentPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mgetPath(Lcom/flyersoft/components/cloud/Dropbox;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/components/cloud/Dropbox;->getPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$misCacheSameFileSize(Lcom/flyersoft/components/cloud/Dropbox;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/components/cloud/Dropbox;->isCacheSameFileSize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public constructor <init>()V
    .locals 0

    .line 47
    invoke-direct {p0}, Lcom/flyersoft/components/cloud/Cloud;-><init>()V

    .line 48
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/Dropbox;->checkDropboxAuth()Z

    return-void
.end method

.method private dealParentPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 706
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p1, ""

    :cond_0
    return-object p1
.end method

.method private getPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 255
    sget-object v0, Lcom/flyersoft/tools/A;->DROPBOX_TAG:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 256
    sget-object v0, Lcom/flyersoft/tools/A;->DROPBOX_TAG:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    :cond_0
    return-object p1
.end method

.method private isCacheSameFileSize(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .line 699
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 700
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

    iget-wide v2, p0, Lcom/flyersoft/components/cloud/Dropbox;->mFileLen:J

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


# virtual methods
.method public checkDropboxAuth()Z
    .locals 2

    .line 144
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/Dropbox;->getToken()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 145
    :goto_0
    iput-boolean v1, p0, Lcom/flyersoft/components/cloud/Dropbox;->isLoggined:Z

    if-eqz v1, :cond_1

    .line 147
    invoke-virtual {p0, v0}, Lcom/flyersoft/components/cloud/Dropbox;->init(Ljava/lang/String;)V

    .line 148
    :cond_1
    iget-boolean v0, p0, Lcom/flyersoft/components/cloud/Dropbox;->isLoggined:Z

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

    .line 207
    invoke-static {p2}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 209
    :cond_0
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/components/cloud/Dropbox;->fileCount:I

    .line 210
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/Dropbox;->beforeStart()V

    if-nez p3, :cond_1

    .line 212
    sget-object p3, Lcom/flyersoft/tools/A;->lastDropboxPath:Ljava/lang/String;

    .line 213
    :cond_1
    invoke-direct {p0, p3}, Lcom/flyersoft/components/cloud/Dropbox;->getPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lcom/flyersoft/components/cloud/Dropbox;->mPath:Ljava/lang/String;

    .line 214
    sget p3, Lcom/flyersoft/moonreaderp/R$string;->copy:I

    invoke-virtual {p1, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p0, p1, p3}, Lcom/flyersoft/components/cloud/Dropbox;->createProgressDialog(Landroid/content/Context;Ljava/lang/String;)Landroid/app/ProgressDialog;

    .line 216
    new-instance p3, Lcom/flyersoft/components/cloud/Dropbox$4;

    invoke-direct {p3, p0, p2}, Lcom/flyersoft/components/cloud/Dropbox$4;-><init>(Lcom/flyersoft/components/cloud/Dropbox;Ljava/util/ArrayList;)V

    invoke-static {p3}, Lio/reactivex/rxjava3/core/Observable;->create(Lio/reactivex/rxjava3/core/ObservableOnSubscribe;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p3

    .line 235
    new-instance v0, Lcom/flyersoft/components/cloud/Dropbox$5;

    invoke-direct {v0, p0, p1, p2}, Lcom/flyersoft/components/cloud/Dropbox$5;-><init>(Lcom/flyersoft/components/cloud/Dropbox;Landroid/content/Context;Ljava/util/ArrayList;)V

    .line 249
    invoke-static {}, Lio/reactivex/rxjava3/schedulers/Schedulers;->newThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p1

    invoke-virtual {p3, p1}, Lio/reactivex/rxjava3/core/Observable;->subscribeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 250
    invoke-static {}, Lio/reactivex/rxjava3/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/reactivex/rxjava3/core/Observable;->observeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 251
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

    .line 345
    invoke-static {p2}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 347
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/Dropbox;->beforeStart()V

    .line 348
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/components/cloud/Dropbox;->fileCount:I

    .line 349
    sget v0, Lcom/flyersoft/moonreaderp/R$string;->delete:I

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/components/cloud/Dropbox;->createProgressDialog(Landroid/content/Context;Ljava/lang/String;)Landroid/app/ProgressDialog;

    .line 351
    new-instance v0, Lcom/flyersoft/components/cloud/Dropbox$10;

    invoke-direct {v0, p0, p2}, Lcom/flyersoft/components/cloud/Dropbox$10;-><init>(Lcom/flyersoft/components/cloud/Dropbox;Ljava/util/ArrayList;)V

    invoke-static {v0}, Lio/reactivex/rxjava3/core/Observable;->create(Lio/reactivex/rxjava3/core/ObservableOnSubscribe;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object v0

    .line 369
    new-instance v1, Lcom/flyersoft/components/cloud/Dropbox$11;

    invoke-direct {v1, p0, p1, p2}, Lcom/flyersoft/components/cloud/Dropbox$11;-><init>(Lcom/flyersoft/components/cloud/Dropbox;Landroid/content/Context;Ljava/util/ArrayList;)V

    .line 383
    invoke-static {}, Lio/reactivex/rxjava3/schedulers/Schedulers;->newThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p1

    invoke-virtual {v0, p1}, Lio/reactivex/rxjava3/core/Observable;->subscribeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 384
    invoke-static {}, Lio/reactivex/rxjava3/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/reactivex/rxjava3/core/Observable;->observeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 385
    invoke-virtual {p1, v1}, Lio/reactivex/rxjava3/core/Observable;->subscribe(Lio/reactivex/rxjava3/functions/Consumer;)Lio/reactivex/rxjava3/disposables/Disposable;

    return-void
.end method

.method public dir(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 446
    invoke-virtual {p0, p1, p2, v0}, Lcom/flyersoft/components/cloud/Dropbox;->dir(Landroid/content/Context;Ljava/lang/String;Lcom/flyersoft/tools/T$OnResult;)V

    return-void
.end method

.method public dir(Landroid/content/Context;Ljava/lang/String;Lcom/flyersoft/tools/T$OnResult;)V
    .locals 2

    .line 451
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/Dropbox;->beforeStart()V

    .line 452
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_3

    if-nez p3, :cond_0

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    if-nez p3, :cond_1

    .line 455
    sput-object p2, Lcom/flyersoft/tools/A;->lastDropboxPath:Ljava/lang/String;

    .line 456
    :cond_1
    invoke-direct {p0, p2}, Lcom/flyersoft/components/cloud/Dropbox;->getPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox;->mPath:Ljava/lang/String;

    if-nez p3, :cond_2

    .line 458
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/flyersoft/tools/A;->DROPBOX_TAG:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Dropbox;->mPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/components/cloud/Dropbox;->createProgressDialog(Landroid/content/Context;Ljava/lang/String;)Landroid/app/ProgressDialog;

    .line 460
    :cond_2
    new-instance v0, Lcom/flyersoft/components/cloud/Dropbox$14;

    invoke-direct {v0, p0, p2, p3}, Lcom/flyersoft/components/cloud/Dropbox$14;-><init>(Lcom/flyersoft/components/cloud/Dropbox;Ljava/lang/String;Lcom/flyersoft/tools/T$OnResult;)V

    invoke-static {v0}, Lio/reactivex/rxjava3/core/Observable;->create(Lio/reactivex/rxjava3/core/ObservableOnSubscribe;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p2

    .line 507
    new-instance v0, Lcom/flyersoft/components/cloud/Dropbox$15;

    invoke-direct {v0, p0, p3, p1}, Lcom/flyersoft/components/cloud/Dropbox$15;-><init>(Lcom/flyersoft/components/cloud/Dropbox;Lcom/flyersoft/tools/T$OnResult;Landroid/content/Context;)V

    .line 554
    invoke-static {}, Lio/reactivex/rxjava3/schedulers/Schedulers;->newThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p1

    invoke-virtual {p2, p1}, Lio/reactivex/rxjava3/core/Observable;->subscribeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 555
    invoke-static {}, Lio/reactivex/rxjava3/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/reactivex/rxjava3/core/Observable;->observeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 556
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

    .line 572
    invoke-static {p2}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 574
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/Dropbox;->beforeStart()V

    .line 575
    invoke-direct {p0, p3}, Lcom/flyersoft/components/cloud/Dropbox;->getPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lcom/flyersoft/components/cloud/Dropbox;->mPath:Ljava/lang/String;

    .line 576
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p3

    iput p3, p0, Lcom/flyersoft/components/cloud/Dropbox;->fileCount:I

    .line 577
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->download:I

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " ["

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/flyersoft/components/cloud/Dropbox;->fileCount:I

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

    invoke-virtual {p0, p1, p3}, Lcom/flyersoft/components/cloud/Dropbox;->createProgressDialog(Landroid/content/Context;Ljava/lang/String;)Landroid/app/ProgressDialog;

    .line 579
    new-instance p3, Lcom/flyersoft/components/cloud/Dropbox$16;

    invoke-direct {p3, p0, p2, p1, p4}, Lcom/flyersoft/components/cloud/Dropbox$16;-><init>(Lcom/flyersoft/components/cloud/Dropbox;Ljava/util/ArrayList;Landroid/content/Context;Z)V

    invoke-static {p3}, Lio/reactivex/rxjava3/core/Observable;->create(Lio/reactivex/rxjava3/core/ObservableOnSubscribe;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p3

    .line 653
    new-instance v0, Lcom/flyersoft/components/cloud/Dropbox$17;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/flyersoft/components/cloud/Dropbox$17;-><init>(Lcom/flyersoft/components/cloud/Dropbox;Landroid/content/Context;Ljava/util/ArrayList;ZLcom/flyersoft/tools/T$OnResult;)V

    .line 693
    invoke-static {}, Lio/reactivex/rxjava3/schedulers/Schedulers;->newThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p1

    invoke-virtual {p3, p1}, Lio/reactivex/rxjava3/core/Observable;->subscribeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 694
    invoke-static {}, Lio/reactivex/rxjava3/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/reactivex/rxjava3/core/Observable;->observeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 695
    invoke-virtual {p1, v0}, Lio/reactivex/rxjava3/core/Observable;->subscribe(Lio/reactivex/rxjava3/functions/Consumer;)Lio/reactivex/rxjava3/disposables/Disposable;

    return-void
.end method

.method public downloadToOutputStream(Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterDownload;Z)V
    .locals 1

    .line 92
    new-instance v0, Lcom/flyersoft/components/cloud/Dropbox$1;

    invoke-direct {v0, p0, p1, p2}, Lcom/flyersoft/components/cloud/Dropbox$1;-><init>(Lcom/flyersoft/components/cloud/Dropbox;Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterDownload;)V

    if-eqz p3, :cond_0

    const/4 p1, 0x1

    .line 110
    invoke-virtual {v0, p1}, Ljava/lang/Thread;->setPriority(I)V

    .line 111
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public getBackupList(Landroid/content/Context;Lcom/flyersoft/components/cloud/Cloud$OnGetBackupList;)V
    .locals 2

    .line 796
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/Dropbox;->beforeStart()V

    .line 797
    sget-object v0, Lcom/flyersoft/tools/A;->DROPBOX_TAG:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/components/cloud/Dropbox;->createProgressDialog(Landroid/content/Context;Ljava/lang/String;)Landroid/app/ProgressDialog;

    .line 799
    new-instance v0, Lcom/flyersoft/components/cloud/Dropbox$20;

    invoke-direct {v0, p0}, Lcom/flyersoft/components/cloud/Dropbox$20;-><init>(Lcom/flyersoft/components/cloud/Dropbox;)V

    invoke-static {v0}, Lio/reactivex/rxjava3/core/Observable;->create(Lio/reactivex/rxjava3/core/ObservableOnSubscribe;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object v0

    .line 825
    new-instance v1, Lcom/flyersoft/components/cloud/Dropbox$21;

    invoke-direct {v1, p0, p1, p2}, Lcom/flyersoft/components/cloud/Dropbox$21;-><init>(Lcom/flyersoft/components/cloud/Dropbox;Landroid/content/Context;Lcom/flyersoft/components/cloud/Cloud$OnGetBackupList;)V

    .line 836
    invoke-static {}, Lio/reactivex/rxjava3/schedulers/Schedulers;->newThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p1

    invoke-virtual {v0, p1}, Lio/reactivex/rxjava3/core/Observable;->subscribeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 837
    invoke-static {}, Lio/reactivex/rxjava3/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/reactivex/rxjava3/core/Observable;->observeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 838
    invoke-virtual {p1, v1}, Lio/reactivex/rxjava3/core/Observable;->subscribe(Lio/reactivex/rxjava3/functions/Consumer;)Lio/reactivex/rxjava3/disposables/Disposable;

    return-void
.end method

.method public getClient()Lcom/dropbox/core/v2/DbxClientV2;
    .locals 2

    .line 161
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox;->sDbxClient:Lcom/dropbox/core/v2/DbxClientV2;

    if-eqz v0, :cond_0

    return-object v0

    .line 162
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Client not initialized."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getDropboxResultFiles(Lcom/dropbox/core/v2/DbxClientV2;Lcom/dropbox/core/v2/files/ListFolderResult;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/dropbox/core/v2/DbxClientV2;",
            "Lcom/dropbox/core/v2/files/ListFolderResult;",
            ")",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/files/Metadata;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 560
    invoke-virtual {p2}, Lcom/dropbox/core/v2/files/ListFolderResult;->getEntries()Ljava/util/List;

    move-result-object v0

    .line 561
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "dropbox filecount: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v1, v3, v4

    invoke-static {v3}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 562
    :goto_0
    invoke-virtual {p2}, Lcom/dropbox/core/v2/files/ListFolderResult;->getHasMore()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 563
    invoke-virtual {p1}, Lcom/dropbox/core/v2/DbxClientV2;->files()Lcom/dropbox/core/v2/files/DbxUserFilesRequests;

    move-result-object v1

    invoke-virtual {p2}, Lcom/dropbox/core/v2/files/ListFolderResult;->getCursor()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v1, p2}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->listFolderContinue(Ljava/lang/String;)Lcom/dropbox/core/v2/files/ListFolderResult;

    move-result-object p2

    .line 564
    invoke-virtual {p2}, Lcom/dropbox/core/v2/files/ListFolderResult;->getEntries()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 565
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "dropbox filecount# "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-array v3, v2, [Ljava/lang/Object;

    aput-object v1, v3, v4

    invoke-static {v3}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method protected getToken()Ljava/lang/String;
    .locals 5

    .line 168
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "dropbox"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 169
    const-string v1, "access-token"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_0

    .line 171
    invoke-static {}, Lcom/dropbox/core/android/Auth;->getOAuth2Token()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 173
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-interface {v4, v1, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 177
    :cond_0
    invoke-static {}, Lcom/dropbox/core/android/Auth;->getUid()Ljava/lang/String;

    move-result-object v1

    .line 178
    const-string v4, "user-id"

    invoke-interface {v0, v4, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v1, :cond_1

    .line 179
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 180
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, v4, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_1
    return-object v3
.end method

.method public init(Ljava/lang/String;)V
    .locals 3

    .line 152
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox;->sDbxClient:Lcom/dropbox/core/v2/DbxClientV2;

    if-nez v0, :cond_0

    .line 153
    const-string v0, "moonreader"

    invoke-static {v0}, Lcom/dropbox/core/DbxRequestConfig;->newBuilder(Ljava/lang/String;)Lcom/dropbox/core/DbxRequestConfig$Builder;

    move-result-object v0

    new-instance v1, Lcom/dropbox/core/http/OkHttp3Requestor;

    .line 154
    invoke-static {}, Lcom/dropbox/core/http/OkHttp3Requestor;->defaultOkHttpClient()Lokhttp3/OkHttpClient;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/dropbox/core/http/OkHttp3Requestor;-><init>(Lokhttp3/OkHttpClient;)V

    invoke-virtual {v0, v1}, Lcom/dropbox/core/DbxRequestConfig$Builder;->withHttpRequestor(Lcom/dropbox/core/http/HttpRequestor;)Lcom/dropbox/core/DbxRequestConfig$Builder;

    move-result-object v0

    .line 155
    invoke-virtual {v0}, Lcom/dropbox/core/DbxRequestConfig$Builder;->build()Lcom/dropbox/core/DbxRequestConfig;

    move-result-object v0

    .line 156
    new-instance v1, Lcom/dropbox/core/v2/DbxClientV2;

    invoke-direct {v1, v0, p1}, Lcom/dropbox/core/v2/DbxClientV2;-><init>(Lcom/dropbox/core/DbxRequestConfig;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/flyersoft/components/cloud/Dropbox;->sDbxClient:Lcom/dropbox/core/v2/DbxClientV2;

    :cond_0
    return-void
.end method

.method public installDropboxTip(Landroid/app/Activity;)V
    .locals 2

    .line 191
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    invoke-direct {v0, p1}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->login_failed:I

    invoke-virtual {p1, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->install_dropbox:I

    .line 192
    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyDialog;->setMessage(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    const/4 v1, 0x0

    .line 193
    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyDialog;->setCancelable(Z)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/components/cloud/Dropbox$3;

    invoke-direct {v1, p0, p1}, Lcom/flyersoft/components/cloud/Dropbox$3;-><init>(Lcom/flyersoft/components/cloud/Dropbox;Landroid/app/Activity;)V

    const p1, 0x104000a

    .line 194
    invoke-virtual {v0, p1, v1}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const/high16 v0, 0x1040000

    const/4 v1, 0x0

    .line 199
    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    .line 200
    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method

.method public isFolderNotExistError(Ljava/lang/Throwable;)Z
    .locals 2

    .line 186
    invoke-static {p1}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 187
    const-string v0, "404"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const-string v0, "not_found"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p1

    if-eq p1, v1, :cond_1

    :cond_0
    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public isLogin()Z
    .locals 1

    .line 53
    iget-boolean v0, p0, Lcom/flyersoft/components/cloud/Dropbox;->isLoggined:Z

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

    .line 262
    invoke-static {p2}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 264
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/Dropbox;->beforeStart()V

    if-nez p3, :cond_1

    .line 266
    sget-object p3, Lcom/flyersoft/tools/A;->lastDropboxPath:Ljava/lang/String;

    .line 267
    :cond_1
    invoke-direct {p0, p3}, Lcom/flyersoft/components/cloud/Dropbox;->getPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lcom/flyersoft/components/cloud/Dropbox;->mPath:Ljava/lang/String;

    .line 268
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p3

    iput p3, p0, Lcom/flyersoft/components/cloud/Dropbox;->fileCount:I

    .line 269
    sget p3, Lcom/flyersoft/moonreaderp/R$string;->move:I

    invoke-virtual {p1, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p0, p1, p3}, Lcom/flyersoft/components/cloud/Dropbox;->createProgressDialog(Landroid/content/Context;Ljava/lang/String;)Landroid/app/ProgressDialog;

    .line 271
    new-instance p3, Lcom/flyersoft/components/cloud/Dropbox$6;

    invoke-direct {p3, p0, p2}, Lcom/flyersoft/components/cloud/Dropbox$6;-><init>(Lcom/flyersoft/components/cloud/Dropbox;Ljava/util/ArrayList;)V

    invoke-static {p3}, Lio/reactivex/rxjava3/core/Observable;->create(Lio/reactivex/rxjava3/core/ObservableOnSubscribe;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p3

    .line 290
    new-instance v0, Lcom/flyersoft/components/cloud/Dropbox$7;

    invoke-direct {v0, p0, p1, p2}, Lcom/flyersoft/components/cloud/Dropbox$7;-><init>(Lcom/flyersoft/components/cloud/Dropbox;Landroid/content/Context;Ljava/util/ArrayList;)V

    .line 304
    invoke-static {}, Lio/reactivex/rxjava3/schedulers/Schedulers;->newThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p1

    invoke-virtual {p3, p1}, Lio/reactivex/rxjava3/core/Observable;->subscribeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 305
    invoke-static {}, Lio/reactivex/rxjava3/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/reactivex/rxjava3/core/Observable;->observeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 306
    invoke-virtual {p1, v0}, Lio/reactivex/rxjava3/core/Observable;->subscribe(Lio/reactivex/rxjava3/functions/Consumer;)Lio/reactivex/rxjava3/disposables/Disposable;

    return-void
.end method

.method public rename(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 311
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/Dropbox;->beforeStart()V

    .line 312
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

    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/components/cloud/Dropbox;->createProgressDialog(Landroid/content/Context;Ljava/lang/String;)Landroid/app/ProgressDialog;

    .line 314
    new-instance v0, Lcom/flyersoft/components/cloud/Dropbox$8;

    invoke-direct {v0, p0, p2, p3}, Lcom/flyersoft/components/cloud/Dropbox$8;-><init>(Lcom/flyersoft/components/cloud/Dropbox;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0}, Lio/reactivex/rxjava3/core/Observable;->create(Lio/reactivex/rxjava3/core/ObservableOnSubscribe;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p2

    .line 328
    new-instance p3, Lcom/flyersoft/components/cloud/Dropbox$9;

    invoke-direct {p3, p0, p1}, Lcom/flyersoft/components/cloud/Dropbox$9;-><init>(Lcom/flyersoft/components/cloud/Dropbox;Landroid/content/Context;)V

    .line 338
    invoke-static {}, Lio/reactivex/rxjava3/schedulers/Schedulers;->newThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p1

    invoke-virtual {p2, p1}, Lio/reactivex/rxjava3/core/Observable;->subscribeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 339
    invoke-static {}, Lio/reactivex/rxjava3/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/reactivex/rxjava3/core/Observable;->observeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 340
    invoke-virtual {p1, p3}, Lio/reactivex/rxjava3/core/Observable;->subscribe(Lio/reactivex/rxjava3/functions/Consumer;)Lio/reactivex/rxjava3/disposables/Disposable;

    return-void
.end method

.method public search(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 390
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/Dropbox;->beforeStart()V

    if-nez p2, :cond_0

    .line 392
    sget-object p2, Lcom/flyersoft/tools/A;->lastDropboxPath:Ljava/lang/String;

    .line 393
    :cond_0
    invoke-direct {p0, p2}, Lcom/flyersoft/components/cloud/Dropbox;->getPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Dropbox;->mPath:Ljava/lang/String;

    .line 394
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

    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/components/cloud/Dropbox;->createProgressDialog(Landroid/content/Context;Ljava/lang/String;)Landroid/app/ProgressDialog;

    .line 396
    new-instance p2, Lcom/flyersoft/components/cloud/Dropbox$12;

    invoke-direct {p2, p0, p3}, Lcom/flyersoft/components/cloud/Dropbox$12;-><init>(Lcom/flyersoft/components/cloud/Dropbox;Ljava/lang/String;)V

    invoke-static {p2}, Lio/reactivex/rxjava3/core/Observable;->create(Lio/reactivex/rxjava3/core/ObservableOnSubscribe;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p2

    .line 410
    new-instance v0, Lcom/flyersoft/components/cloud/Dropbox$13;

    invoke-direct {v0, p0, p1, p3}, Lcom/flyersoft/components/cloud/Dropbox$13;-><init>(Lcom/flyersoft/components/cloud/Dropbox;Landroid/content/Context;Ljava/lang/String;)V

    .line 439
    invoke-static {}, Lio/reactivex/rxjava3/schedulers/Schedulers;->newThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p1

    invoke-virtual {p2, p1}, Lio/reactivex/rxjava3/core/Observable;->subscribeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 440
    invoke-static {}, Lio/reactivex/rxjava3/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/reactivex/rxjava3/core/Observable;->observeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 441
    invoke-virtual {p1, v0}, Lio/reactivex/rxjava3/core/Observable;->subscribe(Lio/reactivex/rxjava3/functions/Consumer;)Lio/reactivex/rxjava3/disposables/Disposable;

    return-void
.end method

.method public showLogin(Landroid/content/Context;ZLcom/flyersoft/components/cloud/Cloud$AfterLogin;)V
    .locals 0

    .line 69
    const-string p2, "6zyqydhbaxmhj4d"

    invoke-static {p1, p2}, Lcom/dropbox/core/android/Auth;->startOAuth2Authentication(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method public unlink()V
    .locals 3

    const/4 v0, 0x0

    .line 74
    sput-object v0, Lcom/dropbox/core/android/AuthActivity;->result:Landroid/content/Intent;

    const/4 v1, 0x0

    .line 75
    iput-boolean v1, p0, Lcom/flyersoft/components/cloud/Dropbox;->isLoggined:Z

    .line 76
    iput-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox;->sDbxClient:Lcom/dropbox/core/v2/DbxClientV2;

    .line 78
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v2, "dropbox"

    invoke-virtual {v0, v2, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 79
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/dropbox.xml"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->deleteFile(Ljava/lang/String;)Z

    .line 80
    sget v0, Lcom/flyersoft/tools/A;->syncType:I

    const/4 v2, 0x2

    if-ne v0, v2, :cond_0

    .line 81
    sput v1, Lcom/flyersoft/tools/A;->syncType:I

    .line 82
    :cond_0
    const-string v0, "/"

    sput-object v0, Lcom/flyersoft/tools/A;->lastDropboxPath:Ljava/lang/String;

    .line 83
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->SaveOptions(Landroid/content/Context;)V

    .line 84
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 85
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->restartApp()V

    return-void

    .line 87
    :cond_1
    invoke-static {v1}, Ljava/lang/System;->exit(I)V

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

    .line 711
    invoke-static {p2}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 713
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/Dropbox;->beforeStart()V

    if-nez p4, :cond_1

    .line 715
    sget-object p4, Lcom/flyersoft/tools/A;->lastDropboxPath:Ljava/lang/String;

    .line 716
    :cond_1
    invoke-direct {p0, p4}, Lcom/flyersoft/components/cloud/Dropbox;->getPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    iput-object p4, p0, Lcom/flyersoft/components/cloud/Dropbox;->mPath:Ljava/lang/String;

    .line 717
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p4

    iput p4, p0, Lcom/flyersoft/components/cloud/Dropbox;->fileCount:I

    if-nez p6, :cond_2

    .line 719
    sget p4, Lcom/flyersoft/moonreaderp/R$string;->upload:I

    invoke-virtual {p1, p4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p0, p1, p4}, Lcom/flyersoft/components/cloud/Dropbox;->createProgressDialog(Landroid/content/Context;Ljava/lang/String;)Landroid/app/ProgressDialog;

    .line 721
    :cond_2
    new-instance v0, Lcom/flyersoft/components/cloud/Dropbox$18;

    move-object v1, p0

    move-object v2, p2

    move-object v3, p3

    move v4, p5

    move v5, p6

    invoke-direct/range {v0 .. v5}, Lcom/flyersoft/components/cloud/Dropbox$18;-><init>(Lcom/flyersoft/components/cloud/Dropbox;Ljava/util/ArrayList;Ljava/lang/String;ZZ)V

    invoke-static {v0}, Lio/reactivex/rxjava3/core/Observable;->create(Lio/reactivex/rxjava3/core/ObservableOnSubscribe;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p2

    .line 766
    new-instance p3, Lcom/flyersoft/components/cloud/Dropbox$19;

    invoke-direct {p3, p0, p1, v2}, Lcom/flyersoft/components/cloud/Dropbox$19;-><init>(Lcom/flyersoft/components/cloud/Dropbox;Landroid/content/Context;Ljava/util/ArrayList;)V

    .line 789
    invoke-static {}, Lio/reactivex/rxjava3/schedulers/Schedulers;->newThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p1

    invoke-virtual {p2, p1}, Lio/reactivex/rxjava3/core/Observable;->subscribeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 790
    invoke-static {}, Lio/reactivex/rxjava3/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/reactivex/rxjava3/core/Observable;->observeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 791
    invoke-virtual {p1, p3}, Lio/reactivex/rxjava3/core/Observable;->subscribe(Lio/reactivex/rxjava3/functions/Consumer;)Lio/reactivex/rxjava3/disposables/Disposable;

    return-void
.end method

.method public uploadFromInputStream(Ljava/lang/String;Ljava/io/InputStream;Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterUpload;Z)V
    .locals 0

    .line 116
    new-instance p3, Lcom/flyersoft/components/cloud/Dropbox$2;

    invoke-direct {p3, p0, p1, p2, p4}, Lcom/flyersoft/components/cloud/Dropbox$2;-><init>(Lcom/flyersoft/components/cloud/Dropbox;Ljava/lang/String;Ljava/io/InputStream;Lcom/flyersoft/components/cloud/Cloud$AfterUpload;)V

    if-eqz p5, :cond_0

    const/4 p1, 0x1

    .line 133
    invoke-virtual {p3, p1}, Ljava/lang/Thread;->setPriority(I)V

    .line 134
    :cond_0
    invoke-virtual {p3}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public validateAccount(Landroid/content/Context;)Z
    .locals 2

    .line 58
    iget-boolean v0, p0, Lcom/flyersoft/components/cloud/Dropbox;->isLoggined:Z

    const/4 v1, 0x1

    if-nez v0, :cond_0

    const/4 v0, 0x2

    .line 59
    sput v0, Lcom/flyersoft/tools/A;->trySyncType:I

    .line 60
    sput-boolean v1, Lcom/flyersoft/components/cloud/Sync;->syncWindowOpened:Z

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 61
    invoke-virtual {p0, p1, v1, v0}, Lcom/flyersoft/components/cloud/Dropbox;->showLogin(Landroid/content/Context;ZLcom/flyersoft/components/cloud/Cloud$AfterLogin;)V

    :cond_0
    return v1
.end method
