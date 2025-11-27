.class public Lcom/flyersoft/moonreaderp/NetBookInfo;
.super Lcom/flyersoft/moonreaderp/MyActionBarActivity;
.source "NetBookInfo.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field public static selfPref:Lcom/flyersoft/moonreaderp/NetBookInfo;


# instance fields
.field book:Lcom/flyersoft/opds/OpdsEntry;

.field bookAuthorTv:Landroid/widget/TextView;

.field bookImage:Lcom/flyersoft/views/ShelfImageView;

.field bookTitleTv:Landroid/widget/TextView;

.field cutoutInsets:Landroid/graphics/Insets;

.field descriptionTv:Landroid/widget/TextView;

.field public downloadB:Landroid/widget/Button;

.field formatTv:Landroid/widget/TextView;

.field handler:Landroid/os/Handler;

.field library:Lcom/flyersoft/opds/OpdsSite;

.field mDrawable1:Landroid/graphics/drawable/Drawable;

.field mDrawable2:Landroid/graphics/drawable/Drawable;

.field navigationBarInsets:Landroid/graphics/Insets;

.field private notificationId:I

.field phExit:Landroid/view/View;

.field phTitle:Landroid/widget/TextView;

.field progressTv:Landroid/widget/TextView;

.field private randomID:I

.field public readB:Landroid/widget/Button;

.field public receiveHandler:Landroid/os/Handler;

.field statusBarInsets:Landroid/graphics/Insets;


# direct methods
.method static bridge synthetic -$$Nest$fgetnotificationId(Lcom/flyersoft/moonreaderp/NetBookInfo;)I
    .locals 0

    iget p0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->notificationId:I

    return p0
.end method

.method static bridge synthetic -$$Nest$mcreateAvailableFormats(Lcom/flyersoft/moonreaderp/NetBookInfo;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/NetBookInfo;->createAvailableFormats()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mdoDownload(Lcom/flyersoft/moonreaderp/NetBookInfo;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/NetBookInfo;->doDownload(I)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mgetDownloadTo(Lcom/flyersoft/moonreaderp/NetBookInfo;Z)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/NetBookInfo;->getDownloadTo(Z)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$msetAndroid15Insets(Lcom/flyersoft/moonreaderp/NetBookInfo;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/NetBookInfo;->setAndroid15Insets(Landroid/view/View;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mshowDownloadProgress(Lcom/flyersoft/moonreaderp/NetBookInfo;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/NetBookInfo;->showDownloadProgress(I)V

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 44
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/MyActionBarActivity;-><init>()V

    .line 186
    new-instance v0, Lcom/flyersoft/moonreaderp/NetBookInfo$2;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/flyersoft/moonreaderp/NetBookInfo$2;-><init>(Lcom/flyersoft/moonreaderp/NetBookInfo;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->handler:Landroid/os/Handler;

    const/4 v0, -0x1

    .line 251
    iput v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->notificationId:I

    .line 379
    new-instance v0, Lcom/flyersoft/moonreaderp/NetBookInfo$4;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/flyersoft/moonreaderp/NetBookInfo$4;-><init>(Lcom/flyersoft/moonreaderp/NetBookInfo;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->receiveHandler:Landroid/os/Handler;

    const/16 v0, 0x64

    .line 392
    invoke-static {v0}, Lcom/flyersoft/tools/T;->myRandom(I)I

    move-result v0

    iput v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->randomID:I

    return-void
.end method

.method private createAvailableFormats()V
    .locals 10

    .line 171
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/NetBookInfo;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 173
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 174
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v1, v1, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/opds/OpdsEntry$BookUrl;

    .line 175
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    const-string v5, ""

    if-lez v4, :cond_1

    const-string v4, ", "

    goto :goto_1

    :cond_1
    move-object v4, v5

    :goto_1
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, v2, Lcom/flyersoft/opds/OpdsEntry$BookUrl;->type:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    iget-wide v6, v2, Lcom/flyersoft/opds/OpdsEntry$BookUrl;->file_size:J

    const-wide/16 v8, 0x3e8

    cmp-long v4, v6, v8

    if-lez v4, :cond_2

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, " ("

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v5, v2, Lcom/flyersoft/opds/OpdsEntry$BookUrl;->file_size:J

    invoke-static {p0, v5, v6}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    :cond_2
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 175
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 177
    :cond_3
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->formatTv:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->available_formats:I

    invoke-virtual {p0, v3}, Lcom/flyersoft/moonreaderp/NetBookInfo;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private doDownload(I)V
    .locals 2

    .line 304
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iput p1, v0, Lcom/flyersoft/opds/OpdsEntry;->selectedUrlIndex:I

    .line 305
    new-instance p1, Ljava/io/File;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/NetBookInfo;->getDownloadTo(Z)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p1, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 306
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-nez v1, :cond_0

    .line 308
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/tools/T;->createFolder(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 309
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Failed to create target folder: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "Error"

    invoke-static {p0, v0, p1}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    return-void

    .line 313
    :cond_0
    sput-object p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->selfPref:Lcom/flyersoft/moonreaderp/NetBookInfo;

    .line 314
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->downloadB:Landroid/widget/Button;

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    .line 315
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    invoke-virtual {p1}, Lcom/flyersoft/opds/OpdsEntry;->getSelectedUrl()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/NetBookInfo;->downloadBook(Ljava/lang/String;)V

    .line 316
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/NetBookInfo;->saveBookIcon()V

    return-void
.end method

.method private downloadBook(Ljava/lang/String;)V
    .locals 8

    .line 324
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    int-to-long v0, v0

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    mul-long v0, v0, v2

    long-to-int v1, v0

    iput v1, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->notificationId:I

    .line 325
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v0

    iput v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->notificationId:I

    .line 326
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "****start downloadBook, id: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->notificationId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", url: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 327
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/flyersoft/moonreaderp/BookDownloadService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 328
    const-string v1, "url"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 329
    const-string v1, "id"

    iget v3, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->notificationId:I

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 330
    const-string v1, "saveName"

    invoke-direct {p0, v2}, Lcom/flyersoft/moonreaderp/NetBookInfo;->getDownloadTo(Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 332
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v1, v1, Lcom/flyersoft/opds/OpdsEntry;->user_agent:Ljava/lang/String;

    const-string v3, "user_agent"

    invoke-virtual {v0, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 333
    sget-object v1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v1

    if-nez v1, :cond_0

    sget-object v1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->lastLibrary:Lcom/flyersoft/opds/OpdsSite;

    if-eqz v1, :cond_0

    .line 334
    sget-object v1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->lastLibrary:Lcom/flyersoft/opds/OpdsSite;

    iget-object v1, v1, Lcom/flyersoft/opds/OpdsSite;->xmlFile:Ljava/lang/String;

    const-string v3, "library_xml"

    invoke-virtual {v0, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 336
    sget-object v1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->lastLibrary:Lcom/flyersoft/opds/OpdsSite;

    iget-object v1, v1, Lcom/flyersoft/opds/OpdsSite;->xmlFile:Ljava/lang/String;

    invoke-virtual {p0, v1, v2}, Lcom/flyersoft/moonreaderp/NetBookInfo;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 337
    const-string v3, "username"

    const-string v4, ""

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 338
    const-string v6, "password"

    invoke-interface {v1, v6, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/tools/A;->getDecryptText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 339
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 340
    invoke-virtual {v0, v3, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 341
    invoke-virtual {v0, v6, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 346
    :cond_0
    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/NetBookInfo;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 347
    sget v0, Lcom/flyersoft/moonreaderp/R$string;->download:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/NetBookInfo;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, p1, v2}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method

.method private getDownloadTo(Z)Ljava/lang/String;
    .locals 5

    .line 394
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    const-string v1, ""

    if-nez v0, :cond_0

    return-object v1

    .line 396
    :cond_0
    iget v0, v0, Lcom/flyersoft/opds/OpdsEntry;->selectedUrlIndex:I

    const/4 v2, -0x1

    if-ne v0, v2, :cond_1

    .line 397
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    invoke-virtual {v0}, Lcom/flyersoft/opds/OpdsEntry;->getSelectedUrl()Ljava/lang/String;

    .line 398
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iget v0, v0, Lcom/flyersoft/opds/OpdsEntry;->selectedUrlIndex:I

    if-ne v0, v2, :cond_2

    return-object v1

    .line 400
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v0, v0, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iget v1, v1, Lcom/flyersoft/opds/OpdsEntry;->selectedUrlIndex:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/opds/OpdsEntry$BookUrl;

    invoke-virtual {v0}, Lcom/flyersoft/opds/OpdsEntry$BookUrl;->getExt()Ljava/lang/String;

    move-result-object v0

    .line 401
    const-string v1, ".fb2"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    invoke-virtual {v1}, Lcom/flyersoft/opds/OpdsEntry;->getSelectedUrl()Ljava/lang/String;

    move-result-object v1

    const-string v2, ".fb2.zip"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    move-object v0, v2

    .line 404
    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v2, v2, Lcom/flyersoft/opds/OpdsEntry;->title:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " - "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v2, v2, Lcom/flyersoft/opds/OpdsEntry;->author:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/tools/T;->deleteSpecialChar(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 405
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x0

    const/16 v4, 0x64

    if-le v2, v4, :cond_4

    .line 406
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->randomID:I

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 407
    :cond_4
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/flyersoft/tools/A;->download_saved_path:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "/"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 408
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    if-eqz p1, :cond_7

    .line 409
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_7

    .line 410
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iget-object p1, p1, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-ge v3, p1, :cond_7

    .line 411
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iget p1, p1, Lcom/flyersoft/opds/OpdsEntry;->selectedUrlIndex:I

    if-eq v3, p1, :cond_6

    .line 412
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iget-object p1, p1, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/opds/OpdsEntry$BookUrl;

    invoke-virtual {p1}, Lcom/flyersoft/opds/OpdsEntry$BookUrl;->getExt()Ljava/lang/String;

    move-result-object p1

    .line 413
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 414
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    return-object p1

    :cond_5
    move-object v0, p1

    :cond_6
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_7
    return-object v0
.end method

.method private initView()V
    .locals 5

    .line 119
    :try_start_0
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->titleB:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/NetBookInfo;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->phTitle:Landroid/widget/TextView;

    .line 120
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->library:Lcom/flyersoft/opds/OpdsSite;

    if-eqz v1, :cond_0

    iget-object v1, v1, Lcom/flyersoft/opds/OpdsSite;->title:Ljava/lang/String;

    goto :goto_0

    :cond_0
    sget v1, Lcom/flyersoft/moonreaderp/R$string;->netlibrary:I

    invoke-virtual {p0, v1}, Lcom/flyersoft/moonreaderp/NetBookInfo;->getString(I)Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 121
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->exitB:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/NetBookInfo;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->phExit:Landroid/view/View;

    .line 122
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 123
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->phSearch:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/NetBookInfo;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 125
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->bfTextTitle:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/NetBookInfo;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->bookTitleTv:Landroid/widget/TextView;

    .line 126
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->bfTextAuthor:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/NetBookInfo;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->bookAuthorTv:Landroid/widget/TextView;

    .line 127
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->bfTextViewDescription:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/NetBookInfo;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->descriptionTv:Landroid/widget/TextView;

    .line 128
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->formatTv:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/NetBookInfo;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->formatTv:Landroid/widget/TextView;

    .line 129
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->progressTv:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/NetBookInfo;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->progressTv:Landroid/widget/TextView;

    .line 130
    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 131
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->progressTv:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setFakeBoldText(Z)V

    .line 132
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->cancelB:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/NetBookInfo;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->downloadB:Landroid/widget/Button;

    .line 133
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->okB:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/NetBookInfo;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->readB:Landroid/widget/Button;

    .line 134
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->downloadB:Landroid/widget/Button;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->download:I

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setText(I)V

    .line 135
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->readB:Landroid/widget/Button;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->read:I

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setText(I)V

    .line 136
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->bfImageView01:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/NetBookInfo;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/views/ShelfImageView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->bookImage:Lcom/flyersoft/views/ShelfImageView;

    .line 138
    invoke-virtual {v0}, Lcom/flyersoft/views/ShelfImageView;->getHierarchy()Lcom/facebook/drawee/interfaces/DraweeHierarchy;

    move-result-object v0

    check-cast v0, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;

    sget-object v2, Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;->FIT_CENTER:Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    invoke-virtual {v0, v2}, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;->setActualImageScaleType(Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;)V

    .line 139
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v0, v0, Lcom/flyersoft/opds/OpdsEntry;->thumbnail:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 140
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->bookImage:Lcom/flyersoft/views/ShelfImageView;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v2, v2, Lcom/flyersoft/opds/OpdsEntry;->thumbnail:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/flyersoft/views/ShelfImageView;->setImageURI(Ljava/lang/String;)V

    .line 141
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v0, v0, Lcom/flyersoft/opds/OpdsEntry;->username:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 142
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->bookImage:Lcom/flyersoft/views/ShelfImageView;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v2, v2, Lcom/flyersoft/opds/OpdsEntry;->thumbnail:Ljava/lang/String;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v3, v3, Lcom/flyersoft/opds/OpdsEntry;->username:Ljava/lang/String;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v4, v4, Lcom/flyersoft/opds/OpdsEntry;->password:Ljava/lang/String;

    invoke-virtual {v0, v2, v3, v4, v1}, Lcom/flyersoft/views/ShelfImageView;->downloadUrlImage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 145
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->downloadB:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 146
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->readB:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 148
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    if-eqz v0, :cond_2

    .line 149
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->bookTitleTv:Landroid/widget/TextView;

    iget-object v0, v0, Lcom/flyersoft/opds/OpdsEntry;->title:Ljava/lang/String;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 150
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->bookAuthorTv:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v2, v2, Lcom/flyersoft/opds/OpdsEntry;->author:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 151
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->descriptionTv:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v2, v2, Lcom/flyersoft/opds/OpdsEntry;->content:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/A;->myFromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 154
    :cond_2
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/NetBookInfo;->createAvailableFormats()V

    .line 155
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v0, v0, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v2, 0x0

    if-lez v0, :cond_3

    .line 156
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->downloadB:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 157
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->readB:Landroid/widget/Button;

    invoke-direct {p0, v1}, Lcom/flyersoft/moonreaderp/NetBookInfo;->getDownloadTo(Z)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    goto :goto_1

    .line 159
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->downloadB:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 160
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->readB:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 163
    :goto_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->handler:Landroid/os/Handler;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 166
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-void
.end method

.method private saveBookIcon()V
    .locals 5

    .line 351
    sget-object v0, Lcom/flyersoft/tools/A;->download_cache_path:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->createFolder(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_3

    .line 353
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->mDrawable2:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->mDrawable1:Landroid/graphics/drawable/Drawable;

    :goto_0
    if-eqz v0, :cond_3

    const/4 v1, 0x0

    .line 357
    :try_start_0
    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 358
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 359
    sget-object v3, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v4, 0x64

    invoke-virtual {v0, v3, v4, v2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 360
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    .line 361
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/flyersoft/tools/A;->download_cache_path:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v3, 0x0

    invoke-direct {p0, v3}, Lcom/flyersoft/moonreaderp/NetBookInfo;->getDownloadTo(Z)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ".png"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 362
    invoke-static {v2}, Lcom/flyersoft/tools/T;->getFileOutputStream(Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object v1

    .line 363
    array-length v2, v0

    invoke-virtual {v1, v0, v3, v2}, Ljava/io/OutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_3

    .line 371
    :try_start_1
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    return-void

    :catchall_0
    move-exception v0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 367
    :try_start_2
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v1, :cond_3

    .line 371
    :try_start_3
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_3

    :catch_1
    move-exception v0

    .line 365
    :try_start_4
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    if-eqz v1, :cond_3

    .line 371
    :try_start_5
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    goto :goto_3

    :catch_2
    move-exception v0

    .line 373
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    goto :goto_3

    :goto_1
    if-eqz v1, :cond_2

    .line 371
    :try_start_6
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3

    goto :goto_2

    :catch_3
    move-exception v1

    .line 373
    invoke-static {v1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 375
    :cond_2
    :goto_2
    throw v0

    :cond_3
    :goto_3
    return-void
.end method

.method private setAndroid15Insets(Landroid/view/View;)V
    .locals 5

    .line 89
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->navigationBarInsets:Landroid/graphics/Insets;

    invoke-static {v0}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/graphics/Insets;)I

    move-result v0

    if-nez v0, :cond_0

    .line 90
    invoke-static {}, Lcom/flyersoft/tools/A;->isLandscape()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->cutoutInsets:Landroid/graphics/Insets;

    invoke-static {v1}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/graphics/Insets;)I

    move-result v1

    if-lez v1, :cond_0

    .line 91
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->cutoutInsets:Landroid/graphics/Insets;

    invoke-static {v0}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/graphics/Insets;)I

    move-result v0

    .line 92
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->navigationBarInsets:Landroid/graphics/Insets;

    invoke-static {v1}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m$1(Landroid/graphics/Insets;)I

    move-result v1

    if-nez v1, :cond_1

    .line 93
    invoke-static {}, Lcom/flyersoft/tools/A;->isLandscape()Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->cutoutInsets:Landroid/graphics/Insets;

    invoke-static {v2}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m$1(Landroid/graphics/Insets;)I

    move-result v2

    if-lez v2, :cond_1

    .line 94
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->cutoutInsets:Landroid/graphics/Insets;

    invoke-static {v1}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m$1(Landroid/graphics/Insets;)I

    move-result v1

    .line 96
    :cond_1
    invoke-static {}, Lcom/flyersoft/tools/C;->headerSubColor()I

    move-result v2

    invoke-virtual {p1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 97
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->statusBarInsets:Landroid/graphics/Insets;

    invoke-static {v2}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m$3(Landroid/graphics/Insets;)I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {p1, v3, v2, v3, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 99
    sget p1, Lcom/flyersoft/moonreaderp/R$id;->headerSub:I

    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/NetBookInfo;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, v0, v3, v1, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 100
    sget p1, Lcom/flyersoft/moonreaderp/R$id;->sv:I

    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/NetBookInfo;->findViewById(I)Landroid/view/View;

    move-result-object p1

    const/high16 v2, 0x41000000    # 8.0f

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    invoke-virtual {p1, v0, v3, v1, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 101
    sget p1, Lcom/flyersoft/moonreaderp/R$id;->toolbarLight:I

    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/NetBookInfo;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    add-int/2addr v2, v0

    const/high16 v4, 0x40800000    # 4.0f

    invoke-static {v4}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    add-int/2addr v4, v1

    invoke-virtual {p1, v2, v3, v4, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 102
    sget p1, Lcom/flyersoft/moonreaderp/R$id;->footerSubLight:I

    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/NetBookInfo;->findViewById(I)Landroid/view/View;

    move-result-object p1

    const/high16 v2, 0x40000000    # 2.0f

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    add-int/2addr v0, v4

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-static {v4}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    add-int/2addr v1, v2

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->navigationBarInsets:Landroid/graphics/Insets;

    invoke-static {v2}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m$2(Landroid/graphics/Insets;)I

    move-result v2

    invoke-virtual {p1, v0, v4, v1, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 104
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/NetBookInfo;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/Window;)Landroid/view/WindowInsetsController;

    move-result-object p1

    if-eqz p1, :cond_3

    .line 106
    sget-boolean v0, Lcom/flyersoft/tools/A;->mainNightTheme:Z

    const/16 v1, 0x10

    if-eqz v0, :cond_2

    goto :goto_0

    :cond_2
    const/16 v3, 0x10

    :goto_0
    invoke-static {p1, v3, v1}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/WindowInsetsController;II)V

    :cond_3
    return-void
.end method

.method private showDownloadProgress(I)V
    .locals 3

    if-ltz p1, :cond_0

    .line 245
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->progressTv:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "%"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 247
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->progressTv:Landroid/widget/TextView;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 248
    :goto_0
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->progressBar1:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/NetBookInfo;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-ltz p1, :cond_1

    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    const/16 p1, 0x8

    :goto_1
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 11

    .line 253
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->phExit:Landroid/view/View;

    if-ne p1, v0, :cond_0

    .line 254
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/NetBookInfo;->finish()V

    .line 256
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->downloadB:Landroid/widget/Button;

    const/4 v1, 0x1

    if-ne p1, v0, :cond_5

    .line 257
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    if-eqz v0, :cond_9

    iget-object v0, v0, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    if-nez v0, :cond_1

    goto/16 :goto_5

    .line 259
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v0, v0, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v2, 0x0

    if-le v0, v1, :cond_4

    .line 260
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v0, v0, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v3, v0, [Ljava/lang/String;

    :goto_0
    if-ge v2, v0, :cond_3

    .line 262
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->download:I

    invoke-virtual {p0, v5}, Lcom/flyersoft/moonreaderp/NetBookInfo;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v5, v2, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ": "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v6, v6, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/flyersoft/opds/OpdsEntry$BookUrl;

    iget-object v6, v6, Lcom/flyersoft/opds/OpdsEntry$BookUrl;->type:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 263
    iget-object v6, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v6, v6, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/flyersoft/opds/OpdsEntry$BookUrl;

    iget-wide v6, v6, Lcom/flyersoft/opds/OpdsEntry$BookUrl;->file_size:J

    const-wide/16 v8, 0x0

    cmp-long v10, v6, v8

    if-lez v10, :cond_2

    .line 264
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, " ("

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v7, v7, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/flyersoft/opds/OpdsEntry$BookUrl;

    iget-wide v7, v7, Lcom/flyersoft/opds/OpdsEntry$BookUrl;->file_size:J

    .line 263
    invoke-static {p0, v7, v8}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, ")"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_1

    .line 264
    :cond_2
    const-string v6, ""

    :goto_1
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v2

    move v2, v5

    goto :goto_0

    .line 265
    :cond_3
    new-instance v0, Lcom/flyersoft/components/MyMenu;

    invoke-direct {v0, p0}, Lcom/flyersoft/components/MyMenu;-><init>(Landroid/content/Context;)V

    new-instance v2, Lcom/flyersoft/moonreaderp/NetBookInfo$3;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/NetBookInfo$3;-><init>(Lcom/flyersoft/moonreaderp/NetBookInfo;)V

    invoke-virtual {v0, v3, v2}, Lcom/flyersoft/components/MyMenu;->setItems([Ljava/lang/CharSequence;Lcom/flyersoft/components/MyMenu$MenuItemClick;)Lcom/flyersoft/components/MyMenu;

    move-result-object v0

    .line 271
    invoke-virtual {v0}, Lcom/flyersoft/components/MyMenu;->show()V

    goto :goto_2

    .line 273
    :cond_4
    invoke-direct {p0, v2}, Lcom/flyersoft/moonreaderp/NetBookInfo;->doDownload(I)V

    .line 277
    :cond_5
    :goto_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->readB:Landroid/widget/Button;

    if-ne p1, v0, :cond_9

    .line 278
    invoke-direct {p0, v1}, Lcom/flyersoft/moonreaderp/NetBookInfo;->getDownloadTo(Z)Ljava/lang/String;

    move-result-object p1

    .line 279
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 280
    iget v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->notificationId:I

    const/4 v2, -0x1

    if-eq v0, v2, :cond_6

    .line 281
    const-string v0, "notification"

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/NetBookInfo;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    .line 282
    iget v3, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->notificationId:I

    invoke-virtual {v0, v3}, Landroid/app/NotificationManager;->cancel(I)V

    .line 283
    iput v2, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->notificationId:I

    .line 286
    :cond_6
    const-string v0, ".cbz"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_8

    const-string v0, ".cbr"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    goto :goto_3

    .line 291
    :cond_7
    sput-object p1, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    .line 292
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {v0, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 293
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 294
    const-string v2, "bookFile"

    invoke-virtual {v0, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 295
    const-string p1, "fromMain"

    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 296
    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/NetBookInfo;->startActivity(Landroid/content/Intent;)V

    goto :goto_4

    .line 287
    :cond_8
    :goto_3
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 288
    const-string v1, "imageFile"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 289
    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/NetBookInfo;->startActivity(Landroid/content/Intent;)V

    .line 298
    :goto_4
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/NetBookInfo;->finish()V

    :cond_9
    :goto_5
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 52
    invoke-super {p0, p1}, Lcom/flyersoft/moonreaderp/MyActionBarActivity;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    .line 53
    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/NetBookInfo;->requestWindowFeature(I)Z

    .line 55
    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->net_book_info:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/NetBookInfo;->setContentView(I)V

    .line 56
    sput-object p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->selfPref:Lcom/flyersoft/moonreaderp/NetBookInfo;

    .line 57
    sget-object v0, Lcom/flyersoft/opds/N;->lastBookEntry:Lcom/flyersoft/opds/OpdsEntry;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    .line 58
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->lastLibrary:Lcom/flyersoft/opds/OpdsSite;

    if-eqz v0, :cond_0

    .line 59
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->lastLibrary:Lcom/flyersoft/opds/OpdsSite;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo;->library:Lcom/flyersoft/opds/OpdsSite;

    .line 60
    :cond_0
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/NetBookInfo;->initView()V

    .line 62
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->root:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/NetBookInfo;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 63
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v1

    .line 64
    invoke-static {v0}, Lcom/flyersoft/tools/A;->checkNightDialogState(Landroid/view/View;)Z

    if-eqz v1, :cond_2

    .line 65
    sget-boolean v1, Lcom/flyersoft/tools/A;->amoled:Z

    if-eqz v1, :cond_1

    sget v1, Lcom/flyersoft/tools/C;->amoledBlack:I

    goto :goto_0

    :cond_1
    const v1, -0xbdbdbe

    goto :goto_0

    :cond_2
    const v1, -0x868687

    .line 66
    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 69
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x23

    if-ge v0, v1, :cond_3

    .line 70
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/NetBookInfo;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/high16 v1, -0x80000000

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 71
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/NetBookInfo;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-static {}, Lcom/flyersoft/tools/C;->headerSubColor()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 72
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/NetBookInfo;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/flyersoft/tools/C;->setNavigationBarColor(Landroid/view/Window;Z)V

    return-void

    .line 74
    :cond_3
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/NetBookInfo;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    new-instance v0, Lcom/flyersoft/moonreaderp/NetBookInfo$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/NetBookInfo$1;-><init>(Lcom/flyersoft/moonreaderp/NetBookInfo;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnApplyWindowInsetsListener(Landroid/view/View$OnApplyWindowInsetsListener;)V

    return-void
.end method

.method protected onDestroy()V
    .locals 1

    const/4 v0, 0x0

    .line 182
    sput-object v0, Lcom/flyersoft/moonreaderp/NetBookInfo;->selfPref:Lcom/flyersoft/moonreaderp/NetBookInfo;

    .line 183
    invoke-super {p0}, Lcom/flyersoft/moonreaderp/MyActionBarActivity;->onDestroy()V

    return-void
.end method
