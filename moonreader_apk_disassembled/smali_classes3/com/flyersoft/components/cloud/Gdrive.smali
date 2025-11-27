.class public Lcom/flyersoft/components/cloud/Gdrive;
.super Lcom/flyersoft/components/cloud/Cloud;
.source "Gdrive.java"


# static fields
.field public static final ACCOUNT_PREFS_NAME:Ljava/lang/String; = "gdrive"

.field public static final ACCOUNT_UNLINK_TAG:Ljava/lang/String; = "gdrive_unlink"

.field public static final ERR_ACCOUNT_TIP:Ljava/lang/String; = "Please note that Google Drive may restrict our app from accessing Google Drive files for new accounts. If your account has not been connected to Google Drive in our app before, please use Dropbox or WebDav or FTP instead."

.field public static final GDRIVE_PICK_ACCOUNT:I = 0x15

.field private static ID_CACHE_TIME:I = 0x5

.field private static PREF_CACHE_TIME:I = 0xa

.field public static final SHARED_WITH_ME:Ljava/lang/String; = "Shared with me"


# instance fields
.field public account:Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

.field hasSharedWithMe:Z

.field public ids:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/google/api/services/drive/model/File;",
            ">;"
        }
    .end annotation
.end field

.field public ids_time:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field public isLoggined:Z

.field searchSaveCount:I

.field public service:Lcom/google/api/services/drive/Drive;

.field sharedPref:Landroid/content/SharedPreferences;


# direct methods
.method static bridge synthetic -$$Nest$mdealParentPath(Lcom/flyersoft/components/cloud/Gdrive;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/components/cloud/Gdrive;->dealParentPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mgetPath(Lcom/flyersoft/components/cloud/Gdrive;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/components/cloud/Gdrive;->getPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$minit(Lcom/flyersoft/components/cloud/Gdrive;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/components/cloud/Gdrive;->init()V

    return-void
.end method

.method static bridge synthetic -$$Nest$misCacheSameFileSize(Lcom/flyersoft/components/cloud/Gdrive;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/components/cloud/Gdrive;->isCacheSameFileSize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 51
    invoke-direct {p0}, Lcom/flyersoft/components/cloud/Cloud;-><init>()V

    .line 344
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive;->ids:Ljava/util/HashMap;

    .line 345
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive;->ids_time:Ljava/util/HashMap;

    .line 52
    invoke-direct {p0}, Lcom/flyersoft/components/cloud/Gdrive;->init()V

    return-void
.end method

.method public static afterFailedLogin(Landroid/content/Context;Z)V
    .locals 2

    const/4 v0, 0x0

    .line 93
    sput v0, Lcom/flyersoft/tools/A;->syncType:I

    .line 94
    sget-object v1, Lcom/flyersoft/moonreaderp/PrefMisc;->syncGdriveCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    if-eqz v1, :cond_0

    .line 95
    sget-object v1, Lcom/flyersoft/moonreaderp/PrefMisc;->syncGdriveCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v1, v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 96
    :cond_0
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->main_files:Landroid/view/View;

    if-eqz v0, :cond_1

    sget v0, Lcom/flyersoft/tools/A;->lastTab:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 97
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget-object v1, Lcom/flyersoft/tools/A;->lastPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->showFileList(Ljava/lang/String;)V

    :cond_1
    if-eqz p1, :cond_2

    .line 99
    sget p1, Lcom/flyersoft/moonreaderp/R$string;->confirmation:I

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    const-string v0, "Please note that Google Drive may restrict our app from accessing Google Drive files for new accounts. If your account has not been connected to Google Drive in our app before, please use Dropbox or WebDav or FTP instead."

    invoke-static {p0, p1, v0}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    :cond_2
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

.method private doLogin()V
    .locals 4

    const/4 v0, 0x4

    .line 103
    sput v0, Lcom/flyersoft/tools/A;->trySyncType:I

    const/4 v0, 0x1

    .line 104
    sput-boolean v0, Lcom/flyersoft/components/cloud/Sync;->syncWindowOpened:Z

    .line 105
    invoke-static {}, Lcom/flyersoft/tools/A;->getAct()Landroid/app/Activity;

    move-result-object v1

    invoke-static {}, Lcom/flyersoft/tools/A;->getAct()Landroid/app/Activity;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->connect_wait:I

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;I)V

    .line 106
    invoke-static {}, Lcom/flyersoft/tools/A;->getAct()Landroid/app/Activity;

    move-result-object v0

    invoke-static {}, Lcom/flyersoft/tools/A;->getAct()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/flyersoft/components/cloud/Gdrive;->getGoogleSignInClient(Landroid/content/Context;)Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;->getSignInIntent()Landroid/content/Intent;

    move-result-object v1

    const/16 v2, 0x15

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method public static getGDriveResultFiles(Lcom/google/api/services/drive/Drive;Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/api/services/drive/Drive;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/google/api/services/drive/model/File;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 969
    invoke-static {p0, p1, v0}, Lcom/flyersoft/components/cloud/Gdrive;->getGDriveResultFiles(Lcom/google/api/services/drive/Drive;Ljava/lang/String;Z)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static getGDriveResultFiles(Lcom/google/api/services/drive/Drive;Ljava/lang/String;Z)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/api/services/drive/Drive;",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/util/List<",
            "Lcom/google/api/services/drive/model/File;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 973
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    .line 983
    :cond_0
    invoke-virtual {p0}, Lcom/google/api/services/drive/Drive;->files()Lcom/google/api/services/drive/Drive$Files;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/api/services/drive/Drive$Files;->list()Lcom/google/api/services/drive/Drive$Files$List;

    move-result-object v2

    .line 984
    invoke-virtual {v2, p1}, Lcom/google/api/services/drive/Drive$Files$List;->setQ(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Files$List;

    move-result-object v2

    const-string v3, "nextPageToken,files(id,name,size,createdTime,modifiedTime,starred,mimeType)"

    .line 985
    invoke-virtual {v2, v3}, Lcom/google/api/services/drive/Drive$Files$List;->setFields(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Files$List;

    move-result-object v2

    .line 986
    invoke-virtual {v2, v1}, Lcom/google/api/services/drive/Drive$Files$List;->setPageToken(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Files$List;

    move-result-object v2

    const/16 v3, 0x1f4

    .line 987
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/google/api/services/drive/Drive$Files$List;->setPageSize(Ljava/lang/Integer;)Lcom/google/api/services/drive/Drive$Files$List;

    move-result-object v2

    const-string v3, "drive"

    .line 988
    invoke-virtual {v2, v3}, Lcom/google/api/services/drive/Drive$Files$List;->setSpaces(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Files$List;

    move-result-object v2

    .line 989
    invoke-virtual {v2}, Lcom/google/api/services/drive/Drive$Files$List;->execute()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/api/services/drive/model/FileList;

    .line 990
    invoke-virtual {v2}, Lcom/google/api/services/drive/model/FileList;->getFiles()Ljava/util/List;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    if-eqz p2, :cond_1

    .line 992
    invoke-virtual {v2}, Lcom/google/api/services/drive/model/FileList;->getNextPageToken()Ljava/lang/String;

    move-result-object v1

    :cond_1
    if-nez v1, :cond_0

    return-object v0
.end method

.method private getPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 700
    sget-object v0, Lcom/flyersoft/tools/A;->GDRIVE_TAG:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 701
    sget-object v0, Lcom/flyersoft/tools/A;->GDRIVE_TAG:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    :cond_0
    return-object p1
.end method

.method public static handleSignInResult(Landroid/app/Activity;Landroid/content/Intent;)V
    .locals 1

    .line 296
    invoke-static {p1}, Lcom/google/android/gms/auth/api/signin/GoogleSignIn;->getSignedInAccountFromIntent(Landroid/content/Intent;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance v0, Lcom/flyersoft/components/cloud/Gdrive$4;

    invoke-direct {v0, p0}, Lcom/flyersoft/components/cloud/Gdrive$4;-><init>(Landroid/app/Activity;)V

    .line 297
    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/Task;->addOnSuccessListener(Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance v0, Lcom/flyersoft/components/cloud/Gdrive$3;

    invoke-direct {v0, p0}, Lcom/flyersoft/components/cloud/Gdrive$3;-><init>(Landroid/app/Activity;)V

    .line 319
    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/Task;->addOnFailureListener(Lcom/google/android/gms/tasks/OnFailureListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public static hasLoginHistory()Z
    .locals 2

    .line 110
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/gdrive_unlink"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/gdrive.xml"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 111
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x1

    return v0
.end method

.method private init()V
    .locals 3

    .line 264
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/gdrive_unlink"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 265
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/auth/api/signin/GoogleSignIn;->getLastSignedInAccount(Landroid/content/Context;)Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive;->account:Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    .line 266
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive;->account:Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    if-eqz v0, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    iput-boolean v1, p0, Lcom/flyersoft/components/cloud/Gdrive;->isLoggined:Z

    if-eqz v0, :cond_2

    .line 268
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive;->account:Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    const-string v2, "Moon+ Reader"

    invoke-virtual {p0, v0, v1, v2}, Lcom/flyersoft/components/cloud/Gdrive;->getGoogleDriveService(Landroid/content/Context;Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;Ljava/lang/String;)Lcom/google/api/services/drive/Drive;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive;->service:Lcom/google/api/services/drive/Drive;

    :cond_2
    return-void
.end method

.method private isCacheSameFileSize(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .line 1248
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1249
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

    iget-wide v2, p0, Lcom/flyersoft/components/cloud/Gdrive;->mFileLen:J

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

.method static synthetic lambda$showLogin$1(Landroid/content/Context;Landroid/content/DialogInterface;I)V
    .locals 0

    const/4 p1, 0x0

    .line 83
    invoke-static {p0, p1}, Lcom/flyersoft/components/cloud/Gdrive;->afterFailedLogin(Landroid/content/Context;Z)V

    return-void
.end method

.method static synthetic lambda$showLogin$2(Landroid/content/Context;Landroid/content/DialogInterface;)V
    .locals 0

    const/4 p1, 0x0

    .line 86
    invoke-static {p0, p1}, Lcom/flyersoft/components/cloud/Gdrive;->afterFailedLogin(Landroid/content/Context;Z)V

    return-void
.end method


# virtual methods
.method public clearIds()V
    .locals 1

    .line 348
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive;->ids:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 349
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive;->ids_time:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    return-void
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

    .line 630
    invoke-static {p2}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 632
    :cond_0
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/components/cloud/Gdrive;->fileCount:I

    .line 633
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/Gdrive;->beforeStart()V

    if-nez p3, :cond_1

    .line 635
    sget-object p3, Lcom/flyersoft/tools/A;->lastGdrivePath:Ljava/lang/String;

    .line 636
    :cond_1
    invoke-direct {p0, p3}, Lcom/flyersoft/components/cloud/Gdrive;->getPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    .line 637
    sget p3, Lcom/flyersoft/moonreaderp/R$string;->copy:I

    invoke-virtual {p1, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p0, p1, p3}, Lcom/flyersoft/components/cloud/Gdrive;->createProgressDialog(Landroid/content/Context;Ljava/lang/String;)Landroid/app/ProgressDialog;

    .line 639
    new-instance p3, Lcom/flyersoft/components/cloud/Gdrive$5;

    invoke-direct {p3, p0, p2}, Lcom/flyersoft/components/cloud/Gdrive$5;-><init>(Lcom/flyersoft/components/cloud/Gdrive;Ljava/util/ArrayList;)V

    invoke-static {p3}, Lio/reactivex/rxjava3/core/Observable;->create(Lio/reactivex/rxjava3/core/ObservableOnSubscribe;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p3

    .line 680
    new-instance v0, Lcom/flyersoft/components/cloud/Gdrive$6;

    invoke-direct {v0, p0, p1, p2}, Lcom/flyersoft/components/cloud/Gdrive$6;-><init>(Lcom/flyersoft/components/cloud/Gdrive;Landroid/content/Context;Ljava/util/ArrayList;)V

    .line 694
    invoke-static {}, Lio/reactivex/rxjava3/schedulers/Schedulers;->newThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p1

    invoke-virtual {p3, p1}, Lio/reactivex/rxjava3/core/Observable;->subscribeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 695
    invoke-static {}, Lio/reactivex/rxjava3/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/reactivex/rxjava3/core/Observable;->observeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 696
    invoke-virtual {p1, v0}, Lio/reactivex/rxjava3/core/Observable;->subscribe(Lio/reactivex/rxjava3/functions/Consumer;)Lio/reactivex/rxjava3/disposables/Disposable;

    return-void
.end method

.method public declared-synchronized createGdriveFolder(Ljava/lang/String;)Z
    .locals 5

    monitor-enter p0

    .line 574
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/flyersoft/components/cloud/Gdrive;->getGdriveFile(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 576
    invoke-virtual {p0, v0}, Lcom/flyersoft/components/cloud/Gdrive;->isValidFolder(Lcom/google/api/services/drive/model/File;)Z

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    monitor-exit p0

    return p1

    .line 578
    :cond_0
    :try_start_1
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    const/4 v1, -0x1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_1

    .line 580
    monitor-exit p0

    return v2

    .line 581
    :cond_1
    :try_start_2
    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 582
    invoke-virtual {p0, v0}, Lcom/flyersoft/components/cloud/Gdrive;->getGdriveFile(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;

    move-result-object v1

    if-nez v1, :cond_2

    .line 584
    invoke-virtual {p0, v0}, Lcom/flyersoft/components/cloud/Gdrive;->createGdriveFolder(Ljava/lang/String;)Z

    move-result v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-nez v3, :cond_2

    .line 585
    monitor-exit p0

    return v2

    :cond_2
    if-nez v1, :cond_3

    .line 589
    :try_start_3
    invoke-virtual {p0, v0}, Lcom/flyersoft/components/cloud/Gdrive;->getGdriveFile(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;

    move-result-object v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :cond_3
    :goto_0
    if-nez v1, :cond_4

    .line 591
    monitor-exit p0

    return v2

    :cond_4
    const/4 v0, 0x2

    .line 593
    :try_start_4
    new-array v3, v0, [Ljava/lang/Object;

    const-string v4, "******************create folder****************(1)"

    aput-object v4, v3, v2

    const/4 v4, 0x1

    aput-object p1, v3, v4

    invoke-static {v3}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 594
    new-instance v3, Lcom/google/api/services/drive/model/File;

    invoke-direct {v3}, Lcom/google/api/services/drive/model/File;-><init>()V

    .line 595
    invoke-virtual {v1}, Lcom/google/api/services/drive/model/File;->getId()Ljava/lang/String;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v3, v1}, Lcom/google/api/services/drive/model/File;->setParents(Ljava/util/List;)Lcom/google/api/services/drive/model/File;

    .line 596
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Lcom/google/api/services/drive/model/File;->setName(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;

    .line 597
    const-string v1, "application/vnd.google-apps.folder"

    invoke-virtual {v3, v1}, Lcom/google/api/services/drive/model/File;->setMimeType(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;

    .line 599
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive;->service:Lcom/google/api/services/drive/Drive;

    invoke-virtual {v1}, Lcom/google/api/services/drive/Drive;->files()Lcom/google/api/services/drive/Drive$Files;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/google/api/services/drive/Drive$Files;->create(Lcom/google/api/services/drive/model/File;)Lcom/google/api/services/drive/Drive$Files$Create;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/api/services/drive/Drive$Files$Create;->execute()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/api/services/drive/model/File;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    if-nez v1, :cond_5

    .line 601
    monitor-exit p0

    return v2

    .line 602
    :cond_5
    :try_start_5
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "******************create folder****************(2)"

    aput-object v1, v0, v2

    aput-object p1, v0, v4

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 603
    monitor-exit p0

    return v4

    .line 605
    :goto_1
    :try_start_6
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 607
    monitor-exit p0

    return v2

    :catchall_1
    move-exception p1

    :try_start_7
    monitor-exit p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    throw p1
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

    .line 833
    invoke-static {p2}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 835
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/Gdrive;->beforeStart()V

    .line 836
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/components/cloud/Gdrive;->fileCount:I

    .line 837
    sget v0, Lcom/flyersoft/moonreaderp/R$string;->delete:I

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/components/cloud/Gdrive;->createProgressDialog(Landroid/content/Context;Ljava/lang/String;)Landroid/app/ProgressDialog;

    .line 839
    new-instance v0, Lcom/flyersoft/components/cloud/Gdrive$11;

    invoke-direct {v0, p0, p2}, Lcom/flyersoft/components/cloud/Gdrive$11;-><init>(Lcom/flyersoft/components/cloud/Gdrive;Ljava/util/ArrayList;)V

    invoke-static {v0}, Lio/reactivex/rxjava3/core/Observable;->create(Lio/reactivex/rxjava3/core/ObservableOnSubscribe;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object v0

    .line 863
    new-instance v1, Lcom/flyersoft/components/cloud/Gdrive$12;

    invoke-direct {v1, p0, p1, p2}, Lcom/flyersoft/components/cloud/Gdrive$12;-><init>(Lcom/flyersoft/components/cloud/Gdrive;Landroid/content/Context;Ljava/util/ArrayList;)V

    .line 877
    invoke-static {}, Lio/reactivex/rxjava3/schedulers/Schedulers;->newThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p1

    invoke-virtual {v0, p1}, Lio/reactivex/rxjava3/core/Observable;->subscribeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 878
    invoke-static {}, Lio/reactivex/rxjava3/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/reactivex/rxjava3/core/Observable;->observeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 879
    invoke-virtual {p1, v1}, Lio/reactivex/rxjava3/core/Observable;->subscribe(Lio/reactivex/rxjava3/functions/Consumer;)Lio/reactivex/rxjava3/disposables/Disposable;

    return-void
.end method

.method public dir(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 1004
    invoke-virtual {p0, p1, p2, v0}, Lcom/flyersoft/components/cloud/Gdrive;->dir(Landroid/content/Context;Ljava/lang/String;Lcom/flyersoft/tools/T$OnResult;)V

    return-void
.end method

.method public dir(Landroid/content/Context;Ljava/lang/String;Lcom/flyersoft/tools/T$OnResult;)V
    .locals 2

    .line 1009
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/Gdrive;->beforeStart()V

    .line 1010
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_3

    if-nez p3, :cond_0

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    if-nez p3, :cond_1

    .line 1013
    sput-object p2, Lcom/flyersoft/tools/A;->lastGdrivePath:Ljava/lang/String;

    .line 1014
    :cond_1
    invoke-direct {p0, p2}, Lcom/flyersoft/components/cloud/Gdrive;->getPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    if-nez p3, :cond_2

    .line 1016
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/flyersoft/tools/A;->GDRIVE_TAG:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/components/cloud/Gdrive;->createProgressDialog(Landroid/content/Context;Ljava/lang/String;)Landroid/app/ProgressDialog;

    .line 1018
    :cond_2
    new-instance v0, Lcom/flyersoft/components/cloud/Gdrive$15;

    invoke-direct {v0, p0, p2, p3}, Lcom/flyersoft/components/cloud/Gdrive$15;-><init>(Lcom/flyersoft/components/cloud/Gdrive;Ljava/lang/String;Lcom/flyersoft/tools/T$OnResult;)V

    invoke-static {v0}, Lio/reactivex/rxjava3/core/Observable;->create(Lio/reactivex/rxjava3/core/ObservableOnSubscribe;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p2

    .line 1060
    new-instance v0, Lcom/flyersoft/components/cloud/Gdrive$16;

    invoke-direct {v0, p0, p3, p1}, Lcom/flyersoft/components/cloud/Gdrive$16;-><init>(Lcom/flyersoft/components/cloud/Gdrive;Lcom/flyersoft/tools/T$OnResult;Landroid/content/Context;)V

    .line 1119
    invoke-static {}, Lio/reactivex/rxjava3/schedulers/Schedulers;->newThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p1

    invoke-virtual {p2, p1}, Lio/reactivex/rxjava3/core/Observable;->subscribeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 1120
    invoke-static {}, Lio/reactivex/rxjava3/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/reactivex/rxjava3/core/Observable;->observeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 1121
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

    .line 1126
    invoke-static {p2}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 1128
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/Gdrive;->beforeStart()V

    .line 1129
    invoke-direct {p0, p3}, Lcom/flyersoft/components/cloud/Gdrive;->getPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    .line 1130
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p3

    iput p3, p0, Lcom/flyersoft/components/cloud/Gdrive;->fileCount:I

    .line 1131
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->download:I

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " ["

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/flyersoft/components/cloud/Gdrive;->fileCount:I

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

    invoke-virtual {p0, p1, p3}, Lcom/flyersoft/components/cloud/Gdrive;->createProgressDialog(Landroid/content/Context;Ljava/lang/String;)Landroid/app/ProgressDialog;

    .line 1133
    new-instance p3, Lcom/flyersoft/components/cloud/Gdrive$17;

    invoke-direct {p3, p0, p2, p1, p4}, Lcom/flyersoft/components/cloud/Gdrive$17;-><init>(Lcom/flyersoft/components/cloud/Gdrive;Ljava/util/ArrayList;Landroid/content/Context;Z)V

    invoke-static {p3}, Lio/reactivex/rxjava3/core/Observable;->create(Lio/reactivex/rxjava3/core/ObservableOnSubscribe;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p3

    .line 1202
    new-instance v0, Lcom/flyersoft/components/cloud/Gdrive$18;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/flyersoft/components/cloud/Gdrive$18;-><init>(Lcom/flyersoft/components/cloud/Gdrive;Landroid/content/Context;Ljava/util/ArrayList;ZLcom/flyersoft/tools/T$OnResult;)V

    .line 1242
    invoke-static {}, Lio/reactivex/rxjava3/schedulers/Schedulers;->newThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p1

    invoke-virtual {p3, p1}, Lio/reactivex/rxjava3/core/Observable;->subscribeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 1243
    invoke-static {}, Lio/reactivex/rxjava3/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/reactivex/rxjava3/core/Observable;->observeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 1244
    invoke-virtual {p1, v0}, Lio/reactivex/rxjava3/core/Observable;->subscribe(Lio/reactivex/rxjava3/functions/Consumer;)Lio/reactivex/rxjava3/disposables/Disposable;

    return-void
.end method

.method public downloadToOutputStream(Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterDownload;Z)V
    .locals 1

    .line 142
    new-instance v0, Lcom/flyersoft/components/cloud/Gdrive$1;

    invoke-direct {v0, p0, p1, p2}, Lcom/flyersoft/components/cloud/Gdrive$1;-><init>(Lcom/flyersoft/components/cloud/Gdrive;Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterDownload;)V

    if-eqz p3, :cond_0

    const/4 p1, 0x1

    .line 178
    invoke-virtual {v0, p1}, Ljava/lang/Thread;->setPriority(I)V

    .line 179
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public gdriveFileIdExists(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2

    const/4 v0, 0x0

    .line 505
    :try_start_0
    invoke-virtual {p0, p2}, Lcom/flyersoft/components/cloud/Gdrive;->getFile(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;

    move-result-object p2

    .line 506
    invoke-virtual {p0, p2}, Lcom/flyersoft/components/cloud/Gdrive;->isValidFile(Lcom/google/api/services/drive/model/File;)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {p0, p2}, Lcom/flyersoft/components/cloud/Gdrive;->isValidFolder(Lcom/google/api/services/drive/model/File;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 510
    :cond_0
    invoke-virtual {p0, p1}, Lcom/flyersoft/components/cloud/Gdrive;->removeFileInfo(Ljava/lang/String;)V

    return v0

    .line 507
    :cond_1
    :goto_0
    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/components/cloud/Gdrive;->saveFileInfo(Ljava/lang/String;Lcom/google/api/services/drive/model/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 p1, 0x1

    return p1

    :catchall_0
    move-exception p2

    .line 514
    invoke-static {p2, v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;Z)V

    .line 515
    invoke-virtual {p0, p1}, Lcom/flyersoft/components/cloud/Gdrive;->removeFileInfo(Ljava/lang/String;)V

    return v0
.end method

.method public getBackupList(Landroid/content/Context;Lcom/flyersoft/components/cloud/Cloud$OnGetBackupList;)V
    .locals 2

    .line 1341
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/Gdrive;->beforeStart()V

    .line 1342
    sget-object v0, Lcom/flyersoft/tools/A;->GDRIVE_TAG:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/components/cloud/Gdrive;->createProgressDialog(Landroid/content/Context;Ljava/lang/String;)Landroid/app/ProgressDialog;

    .line 1344
    new-instance v0, Lcom/flyersoft/components/cloud/Gdrive$21;

    invoke-direct {v0, p0}, Lcom/flyersoft/components/cloud/Gdrive$21;-><init>(Lcom/flyersoft/components/cloud/Gdrive;)V

    invoke-static {v0}, Lio/reactivex/rxjava3/core/Observable;->create(Lio/reactivex/rxjava3/core/ObservableOnSubscribe;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object v0

    .line 1371
    new-instance v1, Lcom/flyersoft/components/cloud/Gdrive$22;

    invoke-direct {v1, p0, p1, p2}, Lcom/flyersoft/components/cloud/Gdrive$22;-><init>(Lcom/flyersoft/components/cloud/Gdrive;Landroid/content/Context;Lcom/flyersoft/components/cloud/Cloud$OnGetBackupList;)V

    .line 1382
    invoke-static {}, Lio/reactivex/rxjava3/schedulers/Schedulers;->newThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p1

    invoke-virtual {v0, p1}, Lio/reactivex/rxjava3/core/Observable;->subscribeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 1383
    invoke-static {}, Lio/reactivex/rxjava3/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/reactivex/rxjava3/core/Observable;->observeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 1384
    invoke-virtual {p1, v1}, Lio/reactivex/rxjava3/core/Observable;->subscribe(Lio/reactivex/rxjava3/functions/Consumer;)Lio/reactivex/rxjava3/disposables/Disposable;

    return-void
.end method

.method public getFile(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 523
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive;->service:Lcom/google/api/services/drive/Drive;

    invoke-virtual {v0}, Lcom/google/api/services/drive/Drive;->files()Lcom/google/api/services/drive/Drive$Files;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/api/services/drive/Drive$Files;->get(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Files$Get;

    move-result-object p1

    const-string v0, "id,name,size,createdTime,modifiedTime,starred,mimeType"

    .line 524
    invoke-virtual {p1, v0}, Lcom/google/api/services/drive/Drive$Files$Get;->setFields(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Files$Get;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/api/services/drive/Drive$Files$Get;->execute()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/model/File;

    return-object p1
.end method

.method public getFileSize(Lcom/google/api/services/drive/model/File;)J
    .locals 3

    const-wide/16 v0, 0x0

    if-nez p1, :cond_0

    return-wide v0

    .line 621
    :cond_0
    invoke-virtual {p1}, Lcom/google/api/services/drive/model/File;->getSize()Ljava/lang/Long;

    move-result-object v2

    if-nez v2, :cond_1

    return-wide v0

    .line 623
    :cond_1
    invoke-virtual {p1}, Lcom/google/api/services/drive/model/File;->getSize()Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    return-wide v0
.end method

.method public getFileTime(Lcom/google/api/services/drive/model/File;)J
    .locals 2

    .line 611
    invoke-virtual {p1}, Lcom/google/api/services/drive/model/File;->getModifiedTime()Lcom/google/api/client/util/DateTime;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 612
    invoke-virtual {p1}, Lcom/google/api/services/drive/model/File;->getModifiedTime()Lcom/google/api/client/util/DateTime;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/api/client/util/DateTime;->getValue()J

    move-result-wide v0

    return-wide v0

    .line 613
    :cond_0
    invoke-virtual {p1}, Lcom/google/api/services/drive/model/File;->getCreatedTime()Lcom/google/api/client/util/DateTime;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 614
    invoke-virtual {p1}, Lcom/google/api/services/drive/model/File;->getCreatedTime()Lcom/google/api/client/util/DateTime;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/api/client/util/DateTime;->getValue()J

    move-result-wide v0

    return-wide v0

    :cond_1
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public declared-synchronized getGdriveFile(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;
    .locals 3

    monitor-enter p0

    const/4 v0, 0x0

    .line 378
    :try_start_0
    const-string v1, "Shared with me"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 379
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive;->ids:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 380
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive;->ids:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/model/File;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    .line 381
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/Gdrive;->getSharedPref()Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1, p1, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 382
    invoke-virtual {p0, p1, v1}, Lcom/flyersoft/components/cloud/Gdrive;->gdriveFileIdExists(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 383
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive;->ids:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/model/File;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object p1

    .line 385
    :cond_1
    monitor-exit p0

    return-object v0

    .line 388
    :cond_2
    :try_start_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_3

    const-string v1, "/"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 389
    invoke-virtual {p0, p1}, Lcom/flyersoft/components/cloud/Gdrive;->getFile(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;

    move-result-object p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-object p1

    .line 391
    :cond_3
    :try_start_3
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_9

    const-string v1, "/"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    goto :goto_0

    .line 395
    :cond_4
    invoke-virtual {p0, p1}, Lcom/flyersoft/components/cloud/Gdrive;->hasCacheId(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 396
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive;->ids:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/model/File;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return-object p1

    .line 398
    :cond_5
    :try_start_4
    invoke-virtual {p0, p1}, Lcom/flyersoft/components/cloud/Gdrive;->hasCachePref(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 399
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive;->ids:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/model/File;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    monitor-exit p0

    return-object p1

    .line 400
    :cond_6
    :try_start_5
    const-string v1, "/"

    invoke-virtual {p1, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 401
    invoke-virtual {p0, v1}, Lcom/flyersoft/components/cloud/Gdrive;->getGdriveFile(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;

    move-result-object v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    if-nez v2, :cond_7

    .line 403
    monitor-exit p0

    return-object v0

    .line 404
    :cond_7
    :try_start_6
    invoke-virtual {v2}, Lcom/google/api/services/drive/model/File;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/flyersoft/components/cloud/Gdrive;->saveFilesInParent(Ljava/lang/String;Ljava/lang/String;)V

    .line 405
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive;->ids:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive;->ids:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/model/File;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    move-object v0, p1

    :cond_8
    monitor-exit p0

    return-object v0

    .line 392
    :cond_9
    :goto_0
    :try_start_7
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Gdrive;->ids:Ljava/util/HashMap;

    const-string v1, "/"

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_a

    .line 393
    const-string p1, "/"

    const-string v1, "root"

    invoke-virtual {p0, p1, v1}, Lcom/flyersoft/components/cloud/Gdrive;->gdriveFileIdExists(Ljava/lang/String;Ljava/lang/String;)Z

    .line 394
    :cond_a
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Gdrive;->ids:Ljava/util/HashMap;

    const-string v1, "/"

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/model/File;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    .line 408
    :try_start_8
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 410
    monitor-exit p0

    return-object v0

    :catchall_1
    move-exception p1

    :try_start_9
    monitor-exit p0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    throw p1
.end method

.method public getGoogleDriveService(Landroid/content/Context;Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;Ljava/lang/String;)Lcom/google/api/services/drive/Drive;
    .locals 2

    .line 272
    const-string v0, "https://www.googleapis.com/auth/drive"

    .line 274
    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    .line 273
    invoke-static {p1, v0}, Lcom/google/api/client/googleapis/extensions/android/gms/auth/GoogleAccountCredential;->usingOAuth2(Landroid/content/Context;Ljava/util/Collection;)Lcom/google/api/client/googleapis/extensions/android/gms/auth/GoogleAccountCredential;

    move-result-object p1

    .line 275
    invoke-virtual {p2}, Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;->getAccount()Landroid/accounts/Account;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/google/api/client/googleapis/extensions/android/gms/auth/GoogleAccountCredential;->setSelectedAccount(Landroid/accounts/Account;)Lcom/google/api/client/googleapis/extensions/android/gms/auth/GoogleAccountCredential;

    .line 276
    new-instance p2, Lcom/google/api/services/drive/Drive$Builder;

    .line 278
    invoke-static {}, Lcom/google/api/client/extensions/android/http/AndroidHttp;->newCompatibleTransport()Lcom/google/api/client/http/HttpTransport;

    move-result-object v0

    new-instance v1, Lcom/google/api/client/json/gson/GsonFactory;

    invoke-direct {v1}, Lcom/google/api/client/json/gson/GsonFactory;-><init>()V

    invoke-direct {p2, v0, v1, p1}, Lcom/google/api/services/drive/Drive$Builder;-><init>(Lcom/google/api/client/http/HttpTransport;Lcom/google/api/client/json/JsonFactory;Lcom/google/api/client/http/HttpRequestInitializer;)V

    .line 281
    invoke-virtual {p2, p3}, Lcom/google/api/services/drive/Drive$Builder;->setApplicationName(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Builder;

    move-result-object p1

    .line 282
    invoke-virtual {p1}, Lcom/google/api/services/drive/Drive$Builder;->build()Lcom/google/api/services/drive/Drive;

    move-result-object p1

    return-object p1
.end method

.method public getGoogleSignInClient(Landroid/content/Context;)Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;
    .locals 3

    .line 287
    new-instance v0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$Builder;

    sget-object v1, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->DEFAULT_SIGN_IN:Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;

    invoke-direct {v0, v1}, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$Builder;-><init>(Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;)V

    .line 289
    invoke-virtual {v0}, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$Builder;->requestEmail()Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$Builder;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/common/api/Scope;

    const-string v2, "https://www.googleapis.com/auth/drive"

    invoke-direct {v1, v2}, Lcom/google/android/gms/common/api/Scope;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x0

    new-array v2, v2, [Lcom/google/android/gms/common/api/Scope;

    .line 290
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$Builder;->requestScopes(Lcom/google/android/gms/common/api/Scope;[Lcom/google/android/gms/common/api/Scope;)Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$Builder;

    move-result-object v0

    .line 291
    invoke-virtual {v0}, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$Builder;->build()Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;

    move-result-object v0

    .line 292
    invoke-static {p1, v0}, Lcom/google/android/gms/auth/api/signin/GoogleSignIn;->getClient(Landroid/content/Context;Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;)Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;

    move-result-object p1

    return-object p1
.end method

.method public getSharedPref()Landroid/content/SharedPreferences;
    .locals 3

    .line 337
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive;->sharedPref:Landroid/content/SharedPreferences;

    if-nez v0, :cond_0

    .line 338
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "gdrive"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive;->sharedPref:Landroid/content/SharedPreferences;

    .line 339
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive;->sharedPref:Landroid/content/SharedPreferences;

    return-object v0
.end method

.method public hasCacheId(Ljava/lang/String;)Z
    .locals 6

    .line 353
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive;->ids:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 354
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive;->ids_time:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 355
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive;->ids_time:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    sub-long/2addr v2, v4

    sget v0, Lcom/flyersoft/components/cloud/Gdrive;->ID_CACHE_TIME:I

    int-to-long v4, v0

    invoke-static {v4, v5}, Lcom/flyersoft/tools/T;->minute(J)J

    move-result-wide v4

    cmp-long v0, v2, v4

    if-lez v0, :cond_0

    .line 356
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive;->ids:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 357
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive;->ids_time:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return v1

    :cond_0
    const/4 p1, 0x1

    return p1

    :cond_1
    return v1
.end method

.method public hasCachePref(Ljava/lang/String;)Z
    .locals 6

    .line 367
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/Gdrive;->getSharedPref()Landroid/content/SharedPreferences;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 368
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/Gdrive;->getSharedPref()Landroid/content/SharedPreferences;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "#"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-wide/16 v3, 0x0

    invoke-interface {v1, v2, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v1

    if-eqz v0, :cond_0

    cmp-long v5, v1, v3

    if-lez v5, :cond_0

    .line 370
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long/2addr v3, v1

    sget v1, Lcom/flyersoft/components/cloud/Gdrive;->PREF_CACHE_TIME:I

    int-to-long v1, v1

    invoke-static {v1, v2}, Lcom/flyersoft/tools/T;->minute(J)J

    move-result-wide v1

    cmp-long v5, v3, v1

    if-gez v5, :cond_0

    .line 371
    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/components/cloud/Gdrive;->gdriveFileIdExists(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public isLogin()Z
    .locals 1

    .line 57
    iget-boolean v0, p0, Lcom/flyersoft/components/cloud/Gdrive;->isLoggined:Z

    return v0
.end method

.method public isValidFile(Lcom/google/api/services/drive/model/File;)Z
    .locals 2

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 566
    :cond_0
    invoke-virtual {p1}, Lcom/google/api/services/drive/model/File;->getSize()Ljava/lang/Long;

    move-result-object v1

    if-nez v1, :cond_1

    return v0

    .line 568
    :cond_1
    invoke-virtual {p1}, Lcom/google/api/services/drive/model/File;->getExplicitlyTrashed()Ljava/lang/Boolean;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-virtual {p1}, Lcom/google/api/services/drive/model/File;->getExplicitlyTrashed()Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_2

    return v0

    :cond_2
    const/4 p1, 0x1

    return p1
.end method

.method public isValidFolder(Lcom/google/api/services/drive/model/File;)Z
    .locals 2

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 555
    :cond_0
    invoke-virtual {p1}, Lcom/google/api/services/drive/model/File;->getExplicitlyTrashed()Ljava/lang/Boolean;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {p1}, Lcom/google/api/services/drive/model/File;->getExplicitlyTrashed()Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_1

    return v0

    .line 557
    :cond_1
    invoke-virtual {p1}, Lcom/google/api/services/drive/model/File;->getMimeType()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 558
    invoke-virtual {p1}, Lcom/google/api/services/drive/model/File;->getMimeType()Ljava/lang/String;

    move-result-object p1

    const-string v1, "application/vnd.google-apps.folder"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    const/4 p1, 0x1

    return p1

    :cond_2
    return v0
.end method

.method synthetic lambda$showLogin$0$com-flyersoft-components-cloud-Gdrive(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 81
    invoke-direct {p0}, Lcom/flyersoft/components/cloud/Gdrive;->doLogin()V

    return-void
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

    .line 711
    invoke-static {p2}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 713
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/Gdrive;->beforeStart()V

    if-nez p3, :cond_1

    .line 715
    sget-object p3, Lcom/flyersoft/tools/A;->lastGdrivePath:Ljava/lang/String;

    .line 716
    :cond_1
    invoke-direct {p0, p3}, Lcom/flyersoft/components/cloud/Gdrive;->getPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    .line 717
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p3

    iput p3, p0, Lcom/flyersoft/components/cloud/Gdrive;->fileCount:I

    .line 718
    sget p3, Lcom/flyersoft/moonreaderp/R$string;->move:I

    invoke-virtual {p1, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p0, p1, p3}, Lcom/flyersoft/components/cloud/Gdrive;->createProgressDialog(Landroid/content/Context;Ljava/lang/String;)Landroid/app/ProgressDialog;

    .line 720
    new-instance p3, Lcom/flyersoft/components/cloud/Gdrive$7;

    invoke-direct {p3, p0, p2}, Lcom/flyersoft/components/cloud/Gdrive$7;-><init>(Lcom/flyersoft/components/cloud/Gdrive;Ljava/util/ArrayList;)V

    invoke-static {p3}, Lio/reactivex/rxjava3/core/Observable;->create(Lio/reactivex/rxjava3/core/ObservableOnSubscribe;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p3

    .line 764
    new-instance v0, Lcom/flyersoft/components/cloud/Gdrive$8;

    invoke-direct {v0, p0, p1, p2}, Lcom/flyersoft/components/cloud/Gdrive$8;-><init>(Lcom/flyersoft/components/cloud/Gdrive;Landroid/content/Context;Ljava/util/ArrayList;)V

    .line 778
    invoke-static {}, Lio/reactivex/rxjava3/schedulers/Schedulers;->newThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p1

    invoke-virtual {p3, p1}, Lio/reactivex/rxjava3/core/Observable;->subscribeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 779
    invoke-static {}, Lio/reactivex/rxjava3/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/reactivex/rxjava3/core/Observable;->observeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 780
    invoke-virtual {p1, v0}, Lio/reactivex/rxjava3/core/Observable;->subscribe(Lio/reactivex/rxjava3/functions/Consumer;)Lio/reactivex/rxjava3/disposables/Disposable;

    return-void
.end method

.method public removeFileInfo(Ljava/lang/String;)V
    .locals 1

    .line 546
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive;->ids:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 547
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive;->ids_time:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 548
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/Gdrive;->getSharedPref()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 549
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/Gdrive;->getSharedPref()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    :cond_0
    return-void
.end method

.method public rename(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 785
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/Gdrive;->beforeStart()V

    .line 786
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

    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/components/cloud/Gdrive;->createProgressDialog(Landroid/content/Context;Ljava/lang/String;)Landroid/app/ProgressDialog;

    .line 788
    new-instance v0, Lcom/flyersoft/components/cloud/Gdrive$9;

    invoke-direct {v0, p0, p2, p3}, Lcom/flyersoft/components/cloud/Gdrive$9;-><init>(Lcom/flyersoft/components/cloud/Gdrive;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0}, Lio/reactivex/rxjava3/core/Observable;->create(Lio/reactivex/rxjava3/core/ObservableOnSubscribe;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p2

    .line 816
    new-instance p3, Lcom/flyersoft/components/cloud/Gdrive$10;

    invoke-direct {p3, p0, p1}, Lcom/flyersoft/components/cloud/Gdrive$10;-><init>(Lcom/flyersoft/components/cloud/Gdrive;Landroid/content/Context;)V

    .line 826
    invoke-static {}, Lio/reactivex/rxjava3/schedulers/Schedulers;->newThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p1

    invoke-virtual {p2, p1}, Lio/reactivex/rxjava3/core/Observable;->subscribeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 827
    invoke-static {}, Lio/reactivex/rxjava3/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/reactivex/rxjava3/core/Observable;->observeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 828
    invoke-virtual {p1, p3}, Lio/reactivex/rxjava3/core/Observable;->subscribe(Lio/reactivex/rxjava3/functions/Consumer;)Lio/reactivex/rxjava3/disposables/Disposable;

    return-void
.end method

.method public saveFileInfo(Ljava/lang/String;Lcom/google/api/services/drive/model/File;)V
    .locals 1

    const/4 v0, 0x0

    .line 528
    invoke-virtual {p0, p1, p2, v0}, Lcom/flyersoft/components/cloud/Gdrive;->saveFileInfo(Ljava/lang/String;Lcom/google/api/services/drive/model/File;Landroid/content/SharedPreferences$Editor;)V

    return-void
.end method

.method public saveFileInfo(Ljava/lang/String;Lcom/google/api/services/drive/model/File;Landroid/content/SharedPreferences$Editor;)V
    .locals 3

    .line 532
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive;->ids:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 533
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive;->ids_time:Ljava/util/HashMap;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 534
    const-string v0, "#"

    if-eqz p3, :cond_0

    .line 535
    invoke-virtual {p2}, Lcom/google/api/services/drive/model/File;->getId()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p3, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 536
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-interface {p3, p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    return-void

    .line 538
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/Gdrive;->getSharedPref()Landroid/content/SharedPreferences;

    move-result-object p3

    invoke-interface {p3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p3

    .line 539
    invoke-virtual {p2}, Lcom/google/api/services/drive/model/File;->getId()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p3, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 540
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-interface {p2, p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 541
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method public declared-synchronized saveFilesInParent(Ljava/lang/String;Ljava/lang/String;)V
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    const-string v0, "\'"

    monitor-enter p0

    .line 414
    :try_start_0
    iget-object v3, v1, Lcom/flyersoft/components/cloud/Gdrive;->service:Lcom/google/api/services/drive/Drive;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p2

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\' in parents and trashed=false"

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/flyersoft/components/cloud/Gdrive;->getGDriveResultFiles(Lcom/google/api/services/drive/Drive;Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    .line 415
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_14

    .line 416
    invoke-virtual {v1}, Lcom/flyersoft/components/cloud/Gdrive;->getSharedPref()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    .line 417
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 418
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 419
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 420
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 422
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_0
    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_6

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/google/api/services/drive/model/File;

    .line 423
    invoke-virtual {v1, v9}, Lcom/flyersoft/components/cloud/Gdrive;->isValidFolder(Lcom/google/api/services/drive/model/File;)Z

    move-result v10

    .line 424
    invoke-virtual {v1, v9}, Lcom/flyersoft/components/cloud/Gdrive;->isValidFile(Lcom/google/api/services/drive/model/File;)Z

    move-result v11

    if-nez v11, :cond_1

    if-eqz v10, :cond_0

    :cond_1
    if-eqz v10, :cond_3

    .line 427
    invoke-virtual {v9}, Lcom/google/api/services/drive/model/File;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v10}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 428
    invoke-virtual {v9}, Lcom/google/api/services/drive/model/File;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v5, v10}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_3

    .line 429
    invoke-virtual {v9}, Lcom/google/api/services/drive/model/File;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v5, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 431
    :cond_2
    invoke-virtual {v9}, Lcom/google/api/services/drive/model/File;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_3
    :goto_1
    if-eqz v11, :cond_5

    .line 434
    invoke-virtual {v9}, Lcom/google/api/services/drive/model/File;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 435
    invoke-virtual {v9}, Lcom/google/api/services/drive/model/File;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v10}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_5

    .line 436
    invoke-virtual {v9}, Lcom/google/api/services/drive/model/File;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 438
    :cond_4
    invoke-virtual {v9}, Lcom/google/api/services/drive/model/File;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 440
    :cond_5
    :goto_2
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, "/"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Lcom/google/api/services/drive/model/File;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v1, v10, v9, v4}, Lcom/flyersoft/components/cloud/Gdrive;->saveFileInfo(Ljava/lang/String;Lcom/google/api/services/drive/model/File;Landroid/content/SharedPreferences$Editor;)V

    goto :goto_0

    .line 444
    :cond_6
    :goto_3
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v6, 0x2

    const/4 v8, 0x3

    const/4 v9, 0x1

    const/4 v10, 0x0

    if-lez v0, :cond_b

    .line 445
    invoke-virtual {v5, v10}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    move-object v11, v0

    check-cast v11, Ljava/lang/String;

    .line 446
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 447
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_7
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_8

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/google/api/services/drive/model/File;

    .line 448
    invoke-virtual {v13}, Lcom/google/api/services/drive/model/File;->getName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v11, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_7

    .line 449
    invoke-virtual {v12, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 450
    :cond_8
    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    new-array v13, v8, [Ljava/lang/Object;

    const-string v14, "*duplicated gdrive folder"

    aput-object v14, v13, v10

    aput-object v11, v13, v9

    aput-object v0, v13, v6

    invoke-static {v13}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 451
    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int/2addr v0, v9

    move v13, v0

    :goto_5
    if-ltz v13, :cond_a

    .line 452
    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-le v0, v9, :cond_9

    .line 453
    iget-object v0, v1, Lcom/flyersoft/components/cloud/Gdrive;->service:Lcom/google/api/services/drive/Drive;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "\'"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/google/api/services/drive/model/File;

    invoke-virtual {v15}, Lcom/google/api/services/drive/model/File;->getId()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v15, "\' in parents and trashed=false"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v0, v14, v10}, Lcom/flyersoft/components/cloud/Gdrive;->getGDriveResultFiles(Lcom/google/api/services/drive/Drive;Ljava/lang/String;Z)Ljava/util/List;

    move-result-object v0

    .line 454
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    if-nez v0, :cond_9

    .line 456
    :try_start_1
    iget-object v0, v1, Lcom/flyersoft/components/cloud/Gdrive;->service:Lcom/google/api/services/drive/Drive;

    invoke-virtual {v0}, Lcom/google/api/services/drive/Drive;->files()Lcom/google/api/services/drive/Drive$Files;

    move-result-object v0

    invoke-virtual {v12, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/google/api/services/drive/model/File;

    invoke-virtual {v14}, Lcom/google/api/services/drive/model/File;->getId()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v0, v14}, Lcom/google/api/services/drive/Drive$Files;->delete(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Files$Delete;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/api/services/drive/Drive$Files$Delete;->execute()Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_6

    :catchall_0
    move-exception v0

    .line 458
    :try_start_2
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 459
    invoke-virtual {v12, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/api/services/drive/model/File;

    invoke-virtual {v0}, Lcom/google/api/services/drive/model/File;->getId()Ljava/lang/String;

    move-result-object v0

    new-array v14, v8, [Ljava/lang/Object;

    const-string v15, "##DELETE FOLDER FAILED: "

    aput-object v15, v14, v10

    aput-object v11, v14, v9

    aput-object v0, v14, v6

    invoke-static {v14}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 461
    :goto_6
    invoke-virtual {v12, v13}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_9
    add-int/lit8 v13, v13, -0x1

    goto :goto_5

    .line 465
    :cond_a
    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_6

    .line 466
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "/"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v12, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/api/services/drive/model/File;

    invoke-virtual {v1, v0, v6, v4}, Lcom/flyersoft/components/cloud/Gdrive;->saveFileInfo(Ljava/lang/String;Lcom/google/api/services/drive/model/File;Landroid/content/SharedPreferences$Editor;)V

    goto/16 :goto_3

    .line 469
    :cond_b
    const-string v0, "Apps/Books"

    invoke-virtual {v2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 470
    :cond_c
    :goto_7
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_13

    .line 471
    invoke-virtual {v7, v10}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Ljava/lang/String;

    .line 472
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 473
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_d
    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/google/api/services/drive/model/File;

    .line 474
    invoke-virtual {v12}, Lcom/google/api/services/drive/model/File;->getName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v5, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_d

    .line 475
    invoke-virtual {v11, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_8

    .line 476
    :cond_e
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    new-array v12, v8, [Ljava/lang/Object;

    const-string v13, "*duplicated gdrive file"

    aput-object v13, v12, v10

    aput-object v5, v12, v9

    aput-object v0, v12, v6

    invoke-static {v12}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 479
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int/2addr v0, v9

    const-wide/16 v12, 0x0

    :goto_9
    if-ltz v0, :cond_10

    .line 480
    invoke-virtual {v11, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/google/api/services/drive/model/File;

    invoke-virtual {v1, v14}, Lcom/flyersoft/components/cloud/Gdrive;->getFileTime(Lcom/google/api/services/drive/model/File;)J

    move-result-wide v14

    cmp-long v16, v14, v12

    if-lez v16, :cond_f

    .line 481
    invoke-virtual {v11, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/google/api/services/drive/model/File;

    invoke-virtual {v1, v12}, Lcom/flyersoft/components/cloud/Gdrive;->getFileTime(Lcom/google/api/services/drive/model/File;)J

    move-result-wide v12

    :cond_f
    add-int/lit8 v0, v0, -0x1

    goto :goto_9

    .line 483
    :cond_10
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int/2addr v0, v9

    move v14, v0

    :goto_a
    if-ltz v14, :cond_12

    .line 484
    invoke-virtual {v11, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/api/services/drive/model/File;

    invoke-virtual {v1, v0}, Lcom/flyersoft/components/cloud/Gdrive;->getFileTime(Lcom/google/api/services/drive/model/File;)J

    move-result-wide v15

    cmp-long v0, v15, v12

    if-gez v0, :cond_11

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    if-le v0, v9, :cond_11

    .line 486
    :try_start_3
    iget-object v0, v1, Lcom/flyersoft/components/cloud/Gdrive;->service:Lcom/google/api/services/drive/Drive;

    invoke-virtual {v0}, Lcom/google/api/services/drive/Drive;->files()Lcom/google/api/services/drive/Drive$Files;

    move-result-object v0

    invoke-virtual {v11, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/google/api/services/drive/model/File;

    invoke-virtual {v15}, Lcom/google/api/services/drive/model/File;->getId()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v0, v15}, Lcom/google/api/services/drive/Drive$Files;->delete(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Files$Delete;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/api/services/drive/Drive$Files$Delete;->execute()Ljava/lang/Object;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_b

    :catchall_1
    move-exception v0

    .line 488
    :try_start_4
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 489
    invoke-virtual {v11, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/api/services/drive/model/File;

    invoke-virtual {v0}, Lcom/google/api/services/drive/model/File;->getId()Ljava/lang/String;

    move-result-object v0

    new-array v15, v8, [Ljava/lang/Object;

    const-string v16, "##DELETE FILE FAILED: "

    aput-object v16, v15, v10

    aput-object v5, v15, v9

    aput-object v0, v15, v6

    invoke-static {v15}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 491
    :goto_b
    invoke-virtual {v11, v14}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_11
    add-int/lit8 v14, v14, -0x1

    goto :goto_a

    .line 494
    :cond_12
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_c

    .line 495
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v12, "/"

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v11, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/api/services/drive/model/File;

    invoke-virtual {v1, v0, v5, v4}, Lcom/flyersoft/components/cloud/Gdrive;->saveFileInfo(Ljava/lang/String;Lcom/google/api/services/drive/model/File;Landroid/content/SharedPreferences$Editor;)V

    goto/16 :goto_7

    .line 499
    :cond_13
    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 501
    :cond_14
    monitor-exit p0

    return-void

    :catchall_2
    move-exception v0

    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw v0
.end method

.method public search(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 886
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/Gdrive;->beforeStart()V

    if-nez p2, :cond_0

    .line 888
    sget-object p2, Lcom/flyersoft/tools/A;->lastGdrivePath:Ljava/lang/String;

    .line 889
    :cond_0
    invoke-direct {p0, p2}, Lcom/flyersoft/components/cloud/Gdrive;->getPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    .line 890
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

    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/components/cloud/Gdrive;->createProgressDialog(Landroid/content/Context;Ljava/lang/String;)Landroid/app/ProgressDialog;

    const/4 p2, 0x0

    .line 891
    iput p2, p0, Lcom/flyersoft/components/cloud/Gdrive;->searchSaveCount:I

    .line 893
    new-instance p2, Lcom/flyersoft/components/cloud/Gdrive$13;

    invoke-direct {p2, p0, p3}, Lcom/flyersoft/components/cloud/Gdrive$13;-><init>(Lcom/flyersoft/components/cloud/Gdrive;Ljava/lang/String;)V

    invoke-static {p2}, Lio/reactivex/rxjava3/core/Observable;->create(Lio/reactivex/rxjava3/core/ObservableOnSubscribe;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p2

    .line 945
    new-instance v0, Lcom/flyersoft/components/cloud/Gdrive$14;

    invoke-direct {v0, p0, p1, p3}, Lcom/flyersoft/components/cloud/Gdrive$14;-><init>(Lcom/flyersoft/components/cloud/Gdrive;Landroid/content/Context;Ljava/lang/String;)V

    .line 963
    invoke-static {}, Lio/reactivex/rxjava3/schedulers/Schedulers;->newThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p1

    invoke-virtual {p2, p1}, Lio/reactivex/rxjava3/core/Observable;->subscribeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 964
    invoke-static {}, Lio/reactivex/rxjava3/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/reactivex/rxjava3/core/Observable;->observeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 965
    invoke-virtual {p1, v0}, Lio/reactivex/rxjava3/core/Observable;->subscribe(Lio/reactivex/rxjava3/functions/Consumer;)Lio/reactivex/rxjava3/disposables/Disposable;

    return-void
.end method

.method public showLogin(Landroid/content/Context;ZLcom/flyersoft/components/cloud/Cloud$AfterLogin;)V
    .locals 1

    .line 76
    invoke-static {}, Lcom/flyersoft/tools/A;->getAct()Landroid/app/Activity;

    move-result-object p2

    if-eqz p2, :cond_0

    .line 78
    new-instance p2, Lcom/flyersoft/components/MyDialog;

    invoke-direct {p2, p1}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget p3, Lcom/flyersoft/moonreaderp/R$string;->tip:I

    .line 79
    invoke-virtual {p2, p3}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object p2

    const-string p3, "Please note that Google Drive may restrict our app from accessing Google Drive files for new accounts. If your account has not been connected to Google Drive in our app before, please use Dropbox or WebDav or FTP instead."

    .line 80
    invoke-virtual {p2, p3}, Lcom/flyersoft/components/MyDialog;->setMessage(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p2

    new-instance p3, Lcom/flyersoft/components/cloud/Gdrive$$ExternalSyntheticLambda0;

    invoke-direct {p3, p0}, Lcom/flyersoft/components/cloud/Gdrive$$ExternalSyntheticLambda0;-><init>(Lcom/flyersoft/components/cloud/Gdrive;)V

    const v0, 0x104000a

    .line 81
    invoke-virtual {p2, v0, p3}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p2

    new-instance p3, Lcom/flyersoft/components/cloud/Gdrive$$ExternalSyntheticLambda1;

    invoke-direct {p3, p1}, Lcom/flyersoft/components/cloud/Gdrive$$ExternalSyntheticLambda1;-><init>(Landroid/content/Context;)V

    const/high16 v0, 0x1040000

    .line 82
    invoke-virtual {p2, v0, p3}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p2

    new-instance p3, Lcom/flyersoft/components/cloud/Gdrive$$ExternalSyntheticLambda2;

    invoke-direct {p3, p1}, Lcom/flyersoft/components/cloud/Gdrive$$ExternalSyntheticLambda2;-><init>(Landroid/content/Context;)V

    .line 85
    invoke-virtual {p2, p3}, Lcom/flyersoft/components/MyDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    .line 88
    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    :cond_0
    return-void
.end method

.method public unlink()V
    .locals 3

    .line 117
    :try_start_0
    invoke-static {}, Lcom/flyersoft/tools/A;->getAct()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/flyersoft/components/cloud/Gdrive;->getGoogleSignInClient(Landroid/content/Context;)Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/auth/api/signin/GoogleSignInClient;->signOut()Lcom/google/android/gms/tasks/Task;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 119
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 122
    :goto_0
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/Gdrive;->getSharedPref()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 123
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/gdrive.xml"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->deleteFile(Ljava/lang/String;)Z

    .line 124
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/gdrive_unlink"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "unlink"

    invoke-static {v0, v1}, Lcom/flyersoft/tools/T;->saveFileText(Ljava/lang/String;Ljava/lang/String;)Z

    .line 125
    sget v0, Lcom/flyersoft/tools/A;->syncType:I

    const/4 v1, 0x4

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    .line 126
    sput v2, Lcom/flyersoft/tools/A;->syncType:I

    .line 127
    :cond_0
    const-string v0, "/"

    sput-object v0, Lcom/flyersoft/tools/A;->lastGdrivePath:Ljava/lang/String;

    .line 128
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->SaveOptions(Landroid/content/Context;)V

    const/4 v0, 0x0

    .line 130
    iput-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive;->account:Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    .line 131
    iput-boolean v2, p0, Lcom/flyersoft/components/cloud/Gdrive;->isLoggined:Z

    .line 132
    sput-object v0, Lcom/flyersoft/components/cloud/Cloud;->gdrive:Lcom/flyersoft/components/cloud/Gdrive;

    .line 134
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 135
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->closeOldReader()Z

    .line 136
    :cond_1
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 137
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->restartApp()V

    :cond_2
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

    .line 1256
    invoke-static {p2}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 1258
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/Gdrive;->beforeStart()V

    if-nez p4, :cond_1

    .line 1260
    sget-object p4, Lcom/flyersoft/tools/A;->lastGdrivePath:Ljava/lang/String;

    .line 1261
    :cond_1
    invoke-direct {p0, p4}, Lcom/flyersoft/components/cloud/Gdrive;->getPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    iput-object p4, p0, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    .line 1262
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p4

    iput p4, p0, Lcom/flyersoft/components/cloud/Gdrive;->fileCount:I

    if-nez p6, :cond_2

    .line 1264
    sget p4, Lcom/flyersoft/moonreaderp/R$string;->upload:I

    invoke-virtual {p1, p4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p0, p1, p4}, Lcom/flyersoft/components/cloud/Gdrive;->createProgressDialog(Landroid/content/Context;Ljava/lang/String;)Landroid/app/ProgressDialog;

    .line 1266
    :cond_2
    new-instance v0, Lcom/flyersoft/components/cloud/Gdrive$19;

    move-object v1, p0

    move-object v2, p2

    move-object v3, p3

    move v4, p5

    move v5, p6

    invoke-direct/range {v0 .. v5}, Lcom/flyersoft/components/cloud/Gdrive$19;-><init>(Lcom/flyersoft/components/cloud/Gdrive;Ljava/util/ArrayList;Ljava/lang/String;ZZ)V

    invoke-static {v0}, Lio/reactivex/rxjava3/core/Observable;->create(Lio/reactivex/rxjava3/core/ObservableOnSubscribe;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p2

    .line 1319
    new-instance p3, Lcom/flyersoft/components/cloud/Gdrive$20;

    invoke-direct {p3, p0, p1, v2}, Lcom/flyersoft/components/cloud/Gdrive$20;-><init>(Lcom/flyersoft/components/cloud/Gdrive;Landroid/content/Context;Ljava/util/ArrayList;)V

    .line 1334
    invoke-static {}, Lio/reactivex/rxjava3/schedulers/Schedulers;->newThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p1

    invoke-virtual {p2, p1}, Lio/reactivex/rxjava3/core/Observable;->subscribeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 1335
    invoke-static {}, Lio/reactivex/rxjava3/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/rxjava3/core/Scheduler;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/reactivex/rxjava3/core/Observable;->observeOn(Lio/reactivex/rxjava3/core/Scheduler;)Lio/reactivex/rxjava3/core/Observable;

    move-result-object p1

    .line 1336
    invoke-virtual {p1, p3}, Lio/reactivex/rxjava3/core/Observable;->subscribe(Lio/reactivex/rxjava3/functions/Consumer;)Lio/reactivex/rxjava3/disposables/Disposable;

    return-void
.end method

.method public uploadFromInputStream(Ljava/lang/String;Ljava/io/InputStream;Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterUpload;Z)V
    .locals 6

    .line 184
    new-instance v0, Lcom/flyersoft/components/cloud/Gdrive$2;

    move-object v1, p0

    move-object v2, p1

    move-object v4, p2

    move-object v5, p3

    move-object v3, p4

    invoke-direct/range {v0 .. v5}, Lcom/flyersoft/components/cloud/Gdrive$2;-><init>(Lcom/flyersoft/components/cloud/Gdrive;Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterUpload;Ljava/io/InputStream;Ljava/lang/String;)V

    if-eqz p5, :cond_0

    const/4 p1, 0x1

    .line 249
    invoke-virtual {v0, p1}, Ljava/lang/Thread;->setPriority(I)V

    .line 250
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public validateAccount(Landroid/content/Context;)Z
    .locals 2

    .line 62
    iget-boolean v0, p0, Lcom/flyersoft/components/cloud/Gdrive;->isLoggined:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 63
    invoke-virtual {p0, p1, v1, v0}, Lcom/flyersoft/components/cloud/Gdrive;->showLogin(Landroid/content/Context;ZLcom/flyersoft/components/cloud/Cloud$AfterLogin;)V

    return v1

    .line 66
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Gdrive;->service:Lcom/google/api/services/drive/Drive;

    if-nez p1, :cond_1

    .line 67
    invoke-direct {p0}, Lcom/flyersoft/components/cloud/Gdrive;->init()V

    :cond_1
    const/4 p1, 0x1

    return p1
.end method
