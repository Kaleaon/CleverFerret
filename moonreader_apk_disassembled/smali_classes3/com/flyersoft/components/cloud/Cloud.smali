.class public abstract Lcom/flyersoft/components/cloud/Cloud;
.super Ljava/lang/Object;
.source "Cloud.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/components/cloud/Cloud$Progress;,
        Lcom/flyersoft/components/cloud/Cloud$OnGetBackupList;,
        Lcom/flyersoft/components/cloud/Cloud$AfterUpload;,
        Lcom/flyersoft/components/cloud/Cloud$AfterDownload;,
        Lcom/flyersoft/components/cloud/Cloud$AfterLogin;
    }
.end annotation


# static fields
.field public static final ClOUD_COUNT:I = 0x4

.field private static final MAX_FTP_THREAD:I = 0x5

.field public static disable_ftp_pool:Z = false

.field private static dropbox:Lcom/flyersoft/components/cloud/Dropbox;

.field private static final ftpList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/components/cloud/Ftp;",
            ">;"
        }
    .end annotation
.end field

.field public static gdrive:Lcom/flyersoft/components/cloud/Gdrive;

.field private static webDav:Lcom/flyersoft/components/cloud/WebDav;


# instance fields
.field protected errorMsg:Ljava/lang/String;

.field protected fileCount:I

.field protected mCanceled:Z

.field protected mDialog:Landroid/app/ProgressDialog;

.field protected mFileLen:J

.field protected mFilename:Ljava/lang/String;

.field protected mPath:Ljava/lang/String;

.field protected main:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method static bridge synthetic -$$Nest$sfgetftpList()Ljava/util/ArrayList;
    .locals 1

    sget-object v0, Lcom/flyersoft/components/cloud/Cloud;->ftpList:Ljava/util/ArrayList;

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 22
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/flyersoft/components/cloud/Cloud;->ftpList:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static varargs FileList([Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 206
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    .line 207
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_0

    .line 208
    aget-object v2, p0, v1

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public static destroyFtpList()V
    .locals 1

    .line 46
    sget-object v0, Lcom/flyersoft/components/cloud/Cloud;->ftpList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 47
    new-instance v0, Lcom/flyersoft/components/cloud/Cloud$1;

    invoke-direct {v0}, Lcom/flyersoft/components/cloud/Cloud$1;-><init>()V

    .line 61
    invoke-virtual {v0}, Lcom/flyersoft/components/cloud/Cloud$1;->start()V

    :cond_0
    return-void
.end method

.method public static fixCloudTitle(Ljava/lang/String;I)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x4

    if-eq p1, v0, :cond_2

    const/4 v0, 0x6

    if-eq p1, v0, :cond_1

    const/16 v0, 0x8

    if-eq p1, v0, :cond_0

    .line 321
    invoke-static {p0}, Lcom/flyersoft/components/cloud/Cloud;->fixDropboxTitle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 317
    :cond_0
    invoke-static {p0}, Lcom/flyersoft/components/cloud/Cloud;->fixFtpTitle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 315
    :cond_1
    invoke-static {p0}, Lcom/flyersoft/components/cloud/Cloud;->fixWebDavTitle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 319
    :cond_2
    invoke-static {p0}, Lcom/flyersoft/components/cloud/Cloud;->fixGdriveTitle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static fixCloudTitle(Landroid/view/View;I)V
    .locals 2

    .line 326
    instance-of v0, p0, Landroid/widget/TextView;

    if-eqz v0, :cond_0

    .line 327
    check-cast p0, Landroid/widget/TextView;

    .line 328
    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/flyersoft/components/cloud/Cloud;->fixCloudTitle(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    .line 329
    :cond_0
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_1

    .line 330
    check-cast p0, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    .line 331
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 332
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1, p1}, Lcom/flyersoft/components/cloud/Cloud;->fixCloudTitle(Landroid/view/View;I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private static fixDropboxTitle(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 349
    const-string v0, "%s"

    const-string v1, "Dropbox"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static fixFtpTitle(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 341
    const-string v0, "(?i)dropbox"

    const-string v1, "FTP"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "%s"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static fixGdriveTitle(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 345
    const-string v0, "(?i)dropbox"

    const-string v1, "Google Drive"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "%s"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static fixWebDavTitle(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 337
    const-string v0, "(?i)dropbox"

    const-string v1, "WebDav"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "%s"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getCloudName(I)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x4

    if-eq p0, v0, :cond_2

    const/4 v0, 0x6

    if-eq p0, v0, :cond_1

    const/16 v0, 0x8

    if-eq p0, v0, :cond_0

    .line 308
    const-string p0, "Dropbox"

    return-object p0

    .line 304
    :cond_0
    const-string p0, "FTP"

    return-object p0

    .line 302
    :cond_1
    const-string p0, "WebDav"

    return-object p0

    .line 306
    :cond_2
    const-string p0, "Google Drive"

    return-object p0
.end method

.method public static getCloudTag(I)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x2

    if-eq p0, v0, :cond_3

    const/4 v0, 0x4

    if-eq p0, v0, :cond_2

    const/4 v0, 0x6

    if-eq p0, v0, :cond_1

    const/16 v0, 0x8

    if-eq p0, v0, :cond_0

    .line 282
    const-string p0, ""

    return-object p0

    .line 276
    :cond_0
    sget-object p0, Lcom/flyersoft/tools/A;->FTP_TAG:Ljava/lang/String;

    return-object p0

    .line 274
    :cond_1
    sget-object p0, Lcom/flyersoft/tools/A;->WEBDAV_TAG:Ljava/lang/String;

    return-object p0

    .line 278
    :cond_2
    sget-object p0, Lcom/flyersoft/tools/A;->GDRIVE_TAG:Ljava/lang/String;

    return-object p0

    .line 280
    :cond_3
    sget-object p0, Lcom/flyersoft/tools/A;->DROPBOX_TAG:Ljava/lang/String;

    return-object p0
.end method

.method public static getCloudType(Ljava/lang/String;)I
    .locals 1

    .line 287
    sget-object v0, Lcom/flyersoft/tools/A;->WEBDAV_TAG:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x6

    return p0

    .line 289
    :cond_0
    sget-object v0, Lcom/flyersoft/tools/A;->FTP_TAG:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 p0, 0x8

    return p0

    .line 291
    :cond_1
    sget-object v0, Lcom/flyersoft/tools/A;->DROPBOX_TAG:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 p0, 0x2

    return p0

    .line 293
    :cond_2
    sget-object v0, Lcom/flyersoft/tools/A;->GDRIVE_TAG:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_3

    const/4 p0, 0x4

    return p0

    :cond_3
    const/4 p0, 0x0

    return p0
.end method

.method public static getDropbox()Lcom/flyersoft/components/cloud/Dropbox;
    .locals 1

    .line 76
    sget-object v0, Lcom/flyersoft/components/cloud/Cloud;->dropbox:Lcom/flyersoft/components/cloud/Dropbox;

    if-nez v0, :cond_0

    .line 77
    new-instance v0, Lcom/flyersoft/components/cloud/Dropbox;

    invoke-direct {v0}, Lcom/flyersoft/components/cloud/Dropbox;-><init>()V

    sput-object v0, Lcom/flyersoft/components/cloud/Cloud;->dropbox:Lcom/flyersoft/components/cloud/Dropbox;

    .line 78
    :cond_0
    sget-object v0, Lcom/flyersoft/components/cloud/Cloud;->dropbox:Lcom/flyersoft/components/cloud/Dropbox;

    return-object v0
.end method

.method private static getFtp()Lcom/flyersoft/components/cloud/Ftp;
    .locals 4

    .line 25
    sget-boolean v0, Lcom/flyersoft/components/cloud/Cloud;->disable_ftp_pool:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/flyersoft/components/cloud/Cloud;->ftpList:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 26
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/components/cloud/Ftp;

    return-object v0

    .line 29
    :cond_0
    sget-object v0, Lcom/flyersoft/components/cloud/Cloud;->ftpList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/components/cloud/Ftp;

    .line 30
    iget-boolean v3, v2, Lcom/flyersoft/components/cloud/Ftp;->busy:Z

    if-nez v3, :cond_1

    goto :goto_0

    :cond_2
    const/4 v2, 0x0

    :goto_0
    if-nez v2, :cond_4

    .line 36
    sget-object v0, Lcom/flyersoft/components/cloud/Cloud;->ftpList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x5

    if-ge v2, v3, :cond_3

    .line 37
    new-instance v1, Lcom/flyersoft/components/cloud/Ftp;

    invoke-direct {v1}, Lcom/flyersoft/components/cloud/Ftp;-><init>()V

    .line 38
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v1

    .line 40
    :cond_3
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/components/cloud/Ftp;

    return-object v0

    :cond_4
    return-object v2
.end method

.method public static getGdrive()Lcom/flyersoft/components/cloud/Gdrive;
    .locals 1

    .line 83
    sget-object v0, Lcom/flyersoft/components/cloud/Cloud;->gdrive:Lcom/flyersoft/components/cloud/Gdrive;

    if-nez v0, :cond_0

    .line 84
    new-instance v0, Lcom/flyersoft/components/cloud/Gdrive;

    invoke-direct {v0}, Lcom/flyersoft/components/cloud/Gdrive;-><init>()V

    sput-object v0, Lcom/flyersoft/components/cloud/Cloud;->gdrive:Lcom/flyersoft/components/cloud/Gdrive;

    .line 85
    :cond_0
    sget-object v0, Lcom/flyersoft/components/cloud/Cloud;->gdrive:Lcom/flyersoft/components/cloud/Gdrive;

    return-object v0
.end method

.method public static getNoteFile(I)Ljava/lang/String;
    .locals 1

    .line 262
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lcom/flyersoft/components/cloud/Cloud;->getPrefix(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "/Cache/"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p0, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-static {p0}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ".an"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getPositionFile(I)Ljava/lang/String;
    .locals 1

    .line 258
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lcom/flyersoft/components/cloud/Cloud;->getPrefix(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "/Cache/"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p0, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-static {p0}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ".po"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getPrefix(I)Ljava/lang/String;
    .locals 1

    .line 238
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lcom/flyersoft/components/cloud/Cloud;->getWebBookPath(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "/.Moon+"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getRecentFile(I)Ljava/lang/String;
    .locals 1

    .line 266
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lcom/flyersoft/components/cloud/Cloud;->getPrefix(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "/Cache/recent.list"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getShelfBooksDeviceFile(I)Ljava/lang/String;
    .locals 1

    .line 250
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lcom/flyersoft/components/cloud/Cloud;->getPrefix(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "/books.id"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getShelfBooksJsonFile(I)Ljava/lang/String;
    .locals 1

    .line 242
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lcom/flyersoft/components/cloud/Cloud;->getPrefix(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "/books.sync"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getShelfBooksSortFile(I)Ljava/lang/String;
    .locals 1

    .line 246
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lcom/flyersoft/components/cloud/Cloud;->getPrefix(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "/books.sorts"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getShelfCoversDeviceFile(I)Ljava/lang/String;
    .locals 1

    .line 254
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lcom/flyersoft/components/cloud/Cloud;->getPrefix(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "/covers.id"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getWebBookPath(I)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x4

    if-eq p0, v0, :cond_2

    const/4 v0, 0x6

    if-eq p0, v0, :cond_1

    const/16 v0, 0x8

    if-eq p0, v0, :cond_0

    .line 233
    sget-object p0, Lcom/flyersoft/tools/A;->dropboxBookPath:Ljava/lang/String;

    return-object p0

    .line 229
    :cond_0
    sget-object p0, Lcom/flyersoft/tools/A;->ftpBookPath:Ljava/lang/String;

    return-object p0

    .line 227
    :cond_1
    sget-object p0, Lcom/flyersoft/tools/A;->webDavBookPath:Ljava/lang/String;

    return-object p0

    .line 231
    :cond_2
    sget-object p0, Lcom/flyersoft/tools/A;->gdriveBookPath:Ljava/lang/String;

    return-object p0
.end method

.method public static getWebDav()Lcom/flyersoft/components/cloud/WebDav;
    .locals 1

    .line 70
    sget-object v0, Lcom/flyersoft/components/cloud/Cloud;->webDav:Lcom/flyersoft/components/cloud/WebDav;

    if-nez v0, :cond_0

    .line 71
    new-instance v0, Lcom/flyersoft/components/cloud/WebDav;

    invoke-direct {v0}, Lcom/flyersoft/components/cloud/WebDav;-><init>()V

    sput-object v0, Lcom/flyersoft/components/cloud/Cloud;->webDav:Lcom/flyersoft/components/cloud/WebDav;

    .line 72
    :cond_0
    sget-object v0, Lcom/flyersoft/components/cloud/Cloud;->webDav:Lcom/flyersoft/components/cloud/WebDav;

    return-object v0
.end method

.method public static instance()Lcom/flyersoft/components/cloud/Cloud;
    .locals 1

    .line 89
    sget v0, Lcom/flyersoft/tools/A;->syncType:I

    invoke-static {v0}, Lcom/flyersoft/components/cloud/Cloud;->instance(I)Lcom/flyersoft/components/cloud/Cloud;

    move-result-object v0

    return-object v0
.end method

.method public static instance(I)Lcom/flyersoft/components/cloud/Cloud;
    .locals 1

    const/4 v0, 0x2

    if-eq p0, v0, :cond_2

    const/4 v0, 0x4

    if-eq p0, v0, :cond_1

    const/16 v0, 0x8

    if-eq p0, v0, :cond_0

    .line 97
    invoke-static {}, Lcom/flyersoft/components/cloud/Cloud;->getWebDav()Lcom/flyersoft/components/cloud/WebDav;

    move-result-object p0

    return-object p0

    .line 96
    :cond_0
    invoke-static {}, Lcom/flyersoft/components/cloud/Cloud;->getFtp()Lcom/flyersoft/components/cloud/Ftp;

    move-result-object p0

    return-object p0

    .line 95
    :cond_1
    invoke-static {}, Lcom/flyersoft/components/cloud/Cloud;->getGdrive()Lcom/flyersoft/components/cloud/Gdrive;

    move-result-object p0

    return-object p0

    .line 94
    :cond_2
    invoke-static {}, Lcom/flyersoft/components/cloud/Cloud;->getDropbox()Lcom/flyersoft/components/cloud/Dropbox;

    move-result-object p0

    return-object p0
.end method

.method public static isError(Ljava/lang/Object;)Z
    .locals 0

    if-eqz p0, :cond_1

    .line 202
    instance-of p0, p0, Ljava/lang/Throwable;

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method


# virtual methods
.method protected afterFinish(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    .line 189
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Cloud;->mDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    .line 190
    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    :cond_0
    if-eqz p2, :cond_2

    if-eqz p1, :cond_1

    .line 193
    invoke-static {p1, p2}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void

    .line 195
    :cond_1
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1, p2}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    :cond_2
    return-void
.end method

.method protected beforeStart()V
    .locals 1

    .line 180
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Cloud;->mDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    .line 181
    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    :cond_0
    const/4 v0, 0x0

    .line 182
    iput-object v0, p0, Lcom/flyersoft/components/cloud/Cloud;->mDialog:Landroid/app/ProgressDialog;

    .line 183
    iput-object v0, p0, Lcom/flyersoft/components/cloud/Cloud;->errorMsg:Ljava/lang/String;

    const/4 v0, 0x0

    .line 184
    iput-boolean v0, p0, Lcom/flyersoft/components/cloud/Cloud;->mCanceled:Z

    .line 185
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object v0, p0, Lcom/flyersoft/components/cloud/Cloud;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    return-void
.end method

.method public abstract copy(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)V
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
.end method

.method public createProgressDialog(Landroid/content/Context;Ljava/lang/String;)Landroid/app/ProgressDialog;
    .locals 3

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 164
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Cloud;->mDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_1

    .line 165
    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 166
    :cond_1
    invoke-static {p1}, Lcom/flyersoft/tools/A;->createProgressDialog(Landroid/content/Context;)Landroid/app/ProgressDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/cloud/Cloud;->mDialog:Landroid/app/ProgressDialog;

    const/high16 v1, 0x1040000

    .line 167
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    new-instance v1, Lcom/flyersoft/components/cloud/Cloud$2;

    invoke-direct {v1, p0}, Lcom/flyersoft/components/cloud/Cloud$2;-><init>(Lcom/flyersoft/components/cloud/Cloud;)V

    const/4 v2, -0x2

    invoke-virtual {v0, v2, p1, v1}, Landroid/app/ProgressDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 172
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Cloud;->mDialog:Landroid/app/ProgressDialog;

    invoke-virtual {p1, p2}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 173
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Cloud;->mDialog:Landroid/app/ProgressDialog;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 174
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Cloud;->mDialog:Landroid/app/ProgressDialog;

    invoke-virtual {p1}, Landroid/app/ProgressDialog;->show()V

    .line 175
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Cloud;->mDialog:Landroid/app/ProgressDialog;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->setDialogButtonColor(Landroid/app/AlertDialog;)V

    .line 176
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Cloud;->mDialog:Landroid/app/ProgressDialog;

    return-object p1
.end method

.method public abstract delete(Landroid/content/Context;Ljava/util/ArrayList;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract dir(Landroid/content/Context;Ljava/lang/String;)V
.end method

.method public abstract dir(Landroid/content/Context;Ljava/lang/String;Lcom/flyersoft/tools/T$OnResult;)V
.end method

.method public abstract download(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;ZLcom/flyersoft/tools/T$OnResult;)V
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
.end method

.method public abstract downloadToOutputStream(Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterDownload;Z)V
.end method

.method public abstract getBackupList(Landroid/content/Context;Lcom/flyersoft/components/cloud/Cloud$OnGetBackupList;)V
.end method

.method public abstract isLogin()Z
.end method

.method public abstract move(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)V
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
.end method

.method public abstract rename(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract search(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract showLogin(Landroid/content/Context;ZLcom/flyersoft/components/cloud/Cloud$AfterLogin;)V
.end method

.method public abstract unlink()V
.end method

.method public abstract upload(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;ZZ)V
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
.end method

.method public abstract uploadFromInputStream(Ljava/lang/String;Ljava/io/InputStream;Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterUpload;Z)V
.end method

.method public abstract validateAccount(Landroid/content/Context;)Z
.end method
