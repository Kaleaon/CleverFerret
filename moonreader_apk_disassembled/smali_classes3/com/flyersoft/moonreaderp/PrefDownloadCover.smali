.class public Lcom/flyersoft/moonreaderp/PrefDownloadCover;
.super Lcom/flyersoft/moonreaderp/PrefOptions;
.source "PrefDownloadCover.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/moonreaderp/PrefDownloadCover$OnSaveImage;,
        Lcom/flyersoft/moonreaderp/PrefDownloadCover$MyWebViewClient;,
        Lcom/flyersoft/moonreaderp/PrefDownloadCover$LibWebChromeClient;
    }
.end annotation


# instance fields
.field BING:Ljava/lang/String;

.field BING2:Ljava/lang/String;

.field GOOGLE:Ljava/lang/String;

.field GOOGLE2:Ljava/lang/String;

.field SOGOU:Ljava/lang/String;

.field SOGOU2:Ljava/lang/String;

.field YAHOO:Ljava/lang/String;

.field YAHOO2:Ljava/lang/String;

.field baiduIv:Landroid/widget/ImageView;

.field bingIv:Landroid/widget/ImageView;

.field cancelB:Landroid/view/View;

.field coverIv:Landroid/widget/ImageView;

.field googleIv:Landroid/widget/ImageView;

.field okB:Landroid/view/View;

.field onSaveImage:Lcom/flyersoft/moonreaderp/PrefDownloadCover$OnSaveImage;

.field resizeImage:Z

.field saveTo:Ljava/lang/String;

.field searchKey:Ljava/lang/String;

.field tipTv:Landroid/widget/TextView;

.field title:Ljava/lang/String;

.field ttfCancelled:Z

.field ttfDownloadStarted:Z

.field ttf_file:Ljava/lang/String;

.field ttf_tmp:Ljava/lang/String;

.field type:I

.field wb:Landroid/webkit/WebView;

.field wb_agent:Ljava/lang/String;

.field wb_cookie:Ljava/lang/String;

.field wb_url:Ljava/lang/String;

.field yahooIv:Landroid/widget/ImageView;


# direct methods
.method static bridge synthetic -$$Nest$mdeleteTtfTmpFile(Lcom/flyersoft/moonreaderp/PrefDownloadCover;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->deleteTtfTmpFile()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mdownloadFontFile(Lcom/flyersoft/moonreaderp/PrefDownloadCover;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->downloadFontFile(Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mgetTtfFontFile(Lcom/flyersoft/moonreaderp/PrefDownloadCover;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->getTtfFontFile()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$misTtfUrl(Lcom/flyersoft/moonreaderp/PrefDownloadCover;Ljava/lang/String;)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->isTtfUrl(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefDownloadCover$OnSaveImage;Ljava/lang/String;Ljava/lang/String;IZ)V
    .locals 1

    .line 77
    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->download_cover:I

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;-><init>(Landroid/content/Context;I)V

    .line 50
    const-string p1, "https://www.google.com/search?tbm=isch&q="

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->GOOGLE:Ljava/lang/String;

    .line 51
    const-string p1, "https://www.bing.com/images/search?q="

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->BING:Ljava/lang/String;

    .line 52
    const-string p1, "https://images.search.yahoo.com/search/images?ei=UTF-8&p="

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->YAHOO:Ljava/lang/String;

    .line 53
    const-string p1, "https://pic.sogou.com/pics?ie=utf8&query="

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->SOGOU:Ljava/lang/String;

    .line 55
    const-string p1, "https://www.google.com/search?q="

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->GOOGLE2:Ljava/lang/String;

    .line 56
    const-string p1, "https://www.bing.com/search?q="

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->BING2:Ljava/lang/String;

    .line 57
    const-string p1, "https://search.yahoo.com/search?p="

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->YAHOO2:Ljava/lang/String;

    .line 58
    const-string p1, "https://www.sogou.com/web?ie=utf8&query="

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->SOGOU2:Ljava/lang/String;

    const/4 p1, 0x1

    .line 329
    iput-boolean p1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttfCancelled:Z

    .line 78
    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->onSaveImage:Lcom/flyersoft/moonreaderp/PrefDownloadCover$OnSaveImage;

    .line 79
    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->saveTo:Ljava/lang/String;

    .line 80
    iput p5, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->type:I

    .line 81
    iput-object p4, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->searchKey:Ljava/lang/String;

    .line 82
    iput-boolean p6, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->resizeImage:Z

    if-ne p5, p1, :cond_0

    .line 83
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->getContext()Landroid/content/Context;

    move-result-object p1

    sget p2, Lcom/flyersoft/moonreaderp/R$string;->background_image:I

    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x2

    if-ne p5, p1, :cond_1

    .line 84
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->getContext()Landroid/content/Context;

    move-result-object p2

    sget p3, Lcom/flyersoft/moonreaderp/R$string;->download:I

    invoke-virtual {p2, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " (TTF)"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_1
    const/4 p1, 0x3

    if-ne p5, p1, :cond_2

    .line 85
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->getContext()Landroid/content/Context;

    move-result-object p1

    sget p2, Lcom/flyersoft/moonreaderp/R$string;->add_to_desktop:I

    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 86
    :cond_2
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->getDownloadCoverTitle(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    :goto_0
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->title:Ljava/lang/String;

    return-void
.end method

.method private deleteTtfTmpFile()V
    .locals 3

    .line 559
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttf_tmp:Ljava/lang/String;

    const-string v1, "/sdcard/errttf"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lcom/flyersoft/tools/T;->moveFile(Ljava/lang/String;Ljava/lang/String;Z)Z

    return-void
.end method

.method private downloadFontFile(Ljava/lang/String;)V
    .locals 3

    .line 332
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttfDownloadStarted:Z

    if-eqz v0, :cond_0

    return-void

    .line 336
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->wb:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->wb_url:Ljava/lang/String;

    .line 337
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->wb_url:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/webkit/CookieManager;->getCookie(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->wb_cookie:Ljava/lang/String;

    .line 338
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->wb:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebSettings;->getUserAgentString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->wb_agent:Ljava/lang/String;

    .line 340
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->createProgressDialog(Landroid/content/Context;)Landroid/app/ProgressDialog;

    move-result-object v0

    const/4 v1, 0x1

    .line 341
    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    .line 342
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->getContext()Landroid/content/Context;

    move-result-object v1

    const/high16 v2, 0x1040000

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefDownloadCover$4;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/PrefDownloadCover$4;-><init>(Lcom/flyersoft/moonreaderp/PrefDownloadCover;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/ProgressDialog;->setButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 347
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->download:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    const/4 v1, 0x0

    .line 348
    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 349
    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 350
    invoke-static {v0}, Lcom/flyersoft/tools/A;->setDialogButtonColor(Landroid/app/AlertDialog;)V

    .line 352
    new-instance v1, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, p0, v2, v0}, Lcom/flyersoft/moonreaderp/PrefDownloadCover$5;-><init>(Lcom/flyersoft/moonreaderp/PrefDownloadCover;Landroid/os/Looper;Landroid/app/ProgressDialog;)V

    .line 415
    new-instance v0, Ljava/lang/Thread;

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefDownloadCover$6;

    invoke-direct {v2, p0, p1, v1}, Lcom/flyersoft/moonreaderp/PrefDownloadCover$6;-><init>(Lcom/flyersoft/moonreaderp/PrefDownloadCover;Ljava/lang/String;Landroid/os/Handler;)V

    invoke-direct {v0, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 503
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public static getDownloadCoverTitle(Landroid/content/Context;)Ljava/lang/String;
    .locals 3

    .line 111
    sget v0, Lcom/flyersoft/moonreaderp/R$string;->download_book_cover:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 112
    invoke-static {}, Lcom/flyersoft/tools/A;->getLocale()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v1

    .line 114
    const-string v2, "en"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 116
    :cond_0
    new-instance v1, Ljava/util/Locale;

    invoke-direct {v1, v2}, Ljava/util/Locale;-><init>(Ljava/lang/String;)V

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->download_book_cover:I

    invoke-static {v1, v2}, Lcom/flyersoft/tools/A;->getLocaleString(Ljava/util/Locale;I)Ljava/lang/String;

    move-result-object v1

    .line 118
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    :goto_0
    return-object v0

    .line 121
    :cond_1
    sget v0, Lcom/flyersoft/moonreaderp/R$string;->download:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->book_cover:I

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/flyersoft/tools/T;->combineString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private getTtfFontFile()Ljava/lang/String;
    .locals 11

    .line 508
    const-string v0, "/"

    .line 509
    :try_start_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttf_tmp:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/compress/BaseCompressor;->createZipper(Ljava/lang/String;)Lcom/flyersoft/tools/compress/BaseCompressor;

    move-result-object v1

    .line 510
    invoke-virtual {v1}, Lcom/flyersoft/tools/compress/BaseCompressor;->getAllList()Ljava/util/ArrayList;

    move-result-object v2

    .line 511
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 512
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 513
    invoke-static {v4}, Lcom/flyersoft/tools/A;->isFontFile(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 514
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 515
    :cond_1
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_2

    .line 516
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->no_ttf_found:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_2
    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 519
    :goto_1
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v4, v6, :cond_5

    .line 520
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    const-string v7, "-regular"

    invoke-virtual {v6, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    const/4 v7, -0x1

    if-eq v6, v7, :cond_3

    goto :goto_2

    :cond_3
    if-eq v5, v4, :cond_4

    .line 524
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v1, v6}, Lcom/flyersoft/tools/compress/BaseCompressor;->getFileInfo(Ljava/lang/String;)Lcom/flyersoft/tools/compress/BaseCompressor$ZRFileInfo;

    move-result-object v6

    iget-wide v6, v6, Lcom/flyersoft/tools/compress/BaseCompressor$ZRFileInfo;->size:J

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v1, v8}, Lcom/flyersoft/tools/compress/BaseCompressor;->getFileInfo(Ljava/lang/String;)Lcom/flyersoft/tools/compress/BaseCompressor$ZRFileInfo;

    move-result-object v8

    iget-wide v8, v8, Lcom/flyersoft/tools/compress/BaseCompressor$ZRFileInfo;->size:J

    cmp-long v10, v6, v8

    if-gez v10, :cond_4

    move v5, v4

    :cond_4
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_5
    move v4, v5

    .line 528
    :goto_2
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/flyersoft/tools/T;->deleteSpecialChar(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 529
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v8, Lcom/flyersoft/tools/A;->outerFontsFolder:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v6, v7}, Lcom/flyersoft/tools/compress/BaseCompressor;->saveToFile(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 530
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v7, Lcom/flyersoft/tools/A;->outerFontsFolder:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttf_file:Ljava/lang/String;

    goto :goto_3

    .line 531
    :cond_6
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/flyersoft/tools/A;->getDefaultFontFolder()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v6, v7}, Lcom/flyersoft/tools/compress/BaseCompressor;->saveToFile(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 532
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/flyersoft/tools/A;->getDefaultFontFolder()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttf_file:Ljava/lang/String;

    :goto_3
    const/4 v5, 0x0

    goto :goto_4

    .line 534
    :cond_7
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->getContext()Landroid/content/Context;

    move-result-object v5

    sget v6, Lcom/flyersoft/moonreaderp/R$string;->invalid_file:I

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    :goto_4
    if-nez v5, :cond_9

    .line 536
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v6

    const/4 v7, 0x1

    if-le v6, v7, :cond_9

    .line 537
    :goto_5
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v2, v6, :cond_9

    if-eq v2, v4, :cond_8

    .line 539
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/flyersoft/tools/T;->deleteSpecialChar(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 540
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttf_file:Ljava/lang/String;

    invoke-static {v9}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v7, v6}, Lcom/flyersoft/tools/compress/BaseCompressor;->saveToFile(Ljava/lang/String;Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_8
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    :cond_9
    return-object v5

    :catch_0
    move-exception v0

    .line 547
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 548
    invoke-static {v0}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private initView()V
    .locals 2

    .line 125
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->okB:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->okB:Landroid/view/View;

    .line 126
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->cancelB:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->cancelB:Landroid/view/View;

    .line 127
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->okB:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 128
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->cancelB:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 130
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->tipTv:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->tipTv:Landroid/widget/TextView;

    .line 131
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->imageView1:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->coverIv:Landroid/widget/ImageView;

    .line 132
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->google:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->googleIv:Landroid/widget/ImageView;

    .line 133
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->bing:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->bingIv:Landroid/widget/ImageView;

    .line 134
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->yahoo:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->yahooIv:Landroid/widget/ImageView;

    .line 135
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->baidu:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->baiduIv:Landroid/widget/ImageView;

    .line 136
    sget-boolean v1, Lcom/flyersoft/tools/A;->isChinese:Z

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    const/4 v1, 0x4

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 137
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->googleIv:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 138
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->bingIv:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 139
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->yahooIv:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 140
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->baiduIv:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 142
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->type:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 143
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->tipTv:Landroid/widget/TextView;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->click_ttf_in_browser:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 145
    :cond_1
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->webView:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/webkit/WebView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->wb:Landroid/webkit/WebView;

    .line 146
    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->registerForContextMenu(Landroid/view/View;)V

    .line 147
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->wb:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 148
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->wb:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    .line 149
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->wb:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setDatabaseEnabled(Z)V

    .line 150
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->wb:Landroid/webkit/WebView;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefDownloadCover$MyWebViewClient;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefDownloadCover$MyWebViewClient;-><init>(Lcom/flyersoft/moonreaderp/PrefDownloadCover;)V

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 151
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->wb:Landroid/webkit/WebView;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefDownloadCover$LibWebChromeClient;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefDownloadCover$LibWebChromeClient;-><init>(Lcom/flyersoft/moonreaderp/PrefDownloadCover;)V

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 152
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->wb:Landroid/webkit/WebView;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefDownloadCover$1;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefDownloadCover$1;-><init>(Lcom/flyersoft/moonreaderp/PrefDownloadCover;)V

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setDownloadListener(Landroid/webkit/DownloadListener;)V

    .line 160
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->searchCover()V

    return-void
.end method

.method private isTtfUrl(Ljava/lang/String;)Z
    .locals 1

    .line 554
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    .line 555
    invoke-static {p1}, Lcom/flyersoft/tools/A;->isFontFile(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, ".zip"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, ".rar"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method private searchCover()V
    .locals 6

    .line 312
    sget v0, Lcom/flyersoft/tools/A;->cover_search_engine:I

    const/4 v1, 0x1

    const/4 v2, 0x2

    if-eqz v0, :cond_9

    if-eq v0, v1, :cond_7

    if-eq v0, v2, :cond_5

    const/4 v3, 0x3

    if-eq v0, v3, :cond_3

    .line 317
    sget-boolean v0, Lcom/flyersoft/tools/A;->isChinesePRC:Z

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->type:I

    if-ne v0, v2, :cond_0

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->SOGOU2:Ljava/lang/String;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->SOGOU:Ljava/lang/String;

    goto :goto_0

    :cond_1
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->type:I

    if-ne v0, v2, :cond_2

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->GOOGLE2:Ljava/lang/String;

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->GOOGLE:Ljava/lang/String;

    goto :goto_0

    .line 316
    :cond_3
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->type:I

    if-ne v0, v2, :cond_4

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->SOGOU2:Ljava/lang/String;

    goto :goto_0

    :cond_4
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->SOGOU:Ljava/lang/String;

    goto :goto_0

    .line 315
    :cond_5
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->type:I

    if-ne v0, v2, :cond_6

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->YAHOO2:Ljava/lang/String;

    goto :goto_0

    :cond_6
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->YAHOO:Ljava/lang/String;

    goto :goto_0

    .line 314
    :cond_7
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->type:I

    if-ne v0, v2, :cond_8

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->BING2:Ljava/lang/String;

    goto :goto_0

    :cond_8
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->BING:Ljava/lang/String;

    goto :goto_0

    .line 313
    :cond_9
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->type:I

    if-ne v0, v2, :cond_a

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->GOOGLE2:Ljava/lang/String;

    goto :goto_0

    :cond_a
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->GOOGLE:Ljava/lang/String;

    .line 319
    :goto_0
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->searchKey:Ljava/lang/String;

    .line 320
    iget v4, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->type:I

    if-nez v4, :cond_d

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    const/16 v5, 0x8

    if-ge v4, v5, :cond_d

    .line 321
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-boolean v3, Lcom/flyersoft/tools/A;->isChinese:Z

    if-eqz v3, :cond_b

    const-string v3, " \u5c01\u9762"

    goto :goto_1

    :cond_b
    sget v3, Lcom/flyersoft/tools/A;->cover_search_engine:I

    if-ne v3, v1, :cond_c

    const-string v3, ""

    goto :goto_1

    :cond_c
    const-string v3, " book cover"

    :goto_1
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 323
    :cond_d
    iget v4, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->type:I

    if-ne v4, v2, :cond_e

    .line 324
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/webkit/CookieManager;->setAcceptCookie(Z)V

    .line 325
    :cond_e
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->wb:Landroid/webkit/WebView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v3}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6

    .line 271
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->okB:Landroid/view/View;

    const/4 v1, 0x2

    if-ne p1, v0, :cond_3

    .line 272
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->type:I

    if-ne v0, v1, :cond_0

    .line 273
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->onSaveImage:Lcom/flyersoft/moonreaderp/PrefDownloadCover$OnSaveImage;

    if-eqz v0, :cond_2

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->ttf_file:Ljava/lang/String;

    if-eqz v2, :cond_2

    const/4 v3, 0x0

    .line 274
    invoke-interface {v0, v2, v3}, Lcom/flyersoft/moonreaderp/PrefDownloadCover$OnSaveImage;->onGetImageFile(Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 275
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->onSaveImage:Lcom/flyersoft/moonreaderp/PrefDownloadCover$OnSaveImage;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->coverIv:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 276
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->coverIv:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 277
    iget-boolean v2, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->resizeImage:Z

    if-eqz v2, :cond_1

    .line 278
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    .line 279
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v3

    const/16 v4, 0x21c

    if-le v2, v4, :cond_1

    if-lez v3, :cond_1

    .line 282
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    mul-int/lit16 v3, v3, 0x21c

    div-int/2addr v3, v2

    invoke-static {v5, v0, v4, v3}, Lcom/flyersoft/tools/T;->zoomDrawable(Landroid/content/res/Resources;Landroid/graphics/drawable/Drawable;II)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 284
    :cond_1
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->onSaveImage:Lcom/flyersoft/moonreaderp/PrefDownloadCover$OnSaveImage;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->saveTo:Ljava/lang/String;

    invoke-interface {v2, v3, v0}, Lcom/flyersoft/moonreaderp/PrefDownloadCover$OnSaveImage;->onGetImageFile(Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V

    .line 286
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->cancel()V

    .line 288
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->cancelB:Landroid/view/View;

    if-ne p1, v0, :cond_4

    .line 289
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->cancel()V

    .line 292
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->googleIv:Landroid/widget/ImageView;

    if-ne p1, v0, :cond_5

    const/4 v0, 0x0

    .line 293
    sput v0, Lcom/flyersoft/tools/A;->cover_search_engine:I

    .line 294
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->searchCover()V

    .line 296
    :cond_5
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->bingIv:Landroid/widget/ImageView;

    if-ne p1, v0, :cond_6

    const/4 v0, 0x1

    .line 297
    sput v0, Lcom/flyersoft/tools/A;->cover_search_engine:I

    .line 298
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->searchCover()V

    .line 300
    :cond_6
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->yahooIv:Landroid/widget/ImageView;

    if-ne p1, v0, :cond_7

    .line 301
    sput v1, Lcom/flyersoft/tools/A;->cover_search_engine:I

    .line 302
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->searchCover()V

    .line 304
    :cond_7
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->baiduIv:Landroid/widget/ImageView;

    if-ne p1, v0, :cond_8

    const/4 p1, 0x3

    .line 305
    sput p1, Lcom/flyersoft/tools/A;->cover_search_engine:I

    .line 306
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->searchCover()V

    :cond_8
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 98
    invoke-super {p0, p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->onCreate(Landroid/os/Bundle;)V

    .line 99
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->initView()V

    .line 100
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->initParams()Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const v0, 0x3f4ccccd    # 0.8f

    .line 101
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setDim(F)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const/4 v0, -0x1

    .line 102
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setHeight(I)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const/4 v1, 0x0

    .line 103
    invoke-virtual {p1, v1}, Lcom/flyersoft/moonreaderp/PrefOptions;->setFullscreen(Z)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->title:Ljava/lang/String;

    .line 104
    invoke-virtual {p1, v1}, Lcom/flyersoft/moonreaderp/PrefOptions;->setDialogTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    .line 105
    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->done()V

    .line 106
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object p1

    .line 107
    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->width:I

    return-void
.end method

.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 4

    .line 200
    instance-of p1, p2, Landroid/webkit/WebView;

    if-eqz p1, :cond_6

    .line 201
    check-cast p2, Landroid/webkit/WebView;

    invoke-virtual {p2}, Landroid/webkit/WebView;->getHitTestResult()Landroid/webkit/WebView$HitTestResult;

    move-result-object p1

    if-eqz p1, :cond_6

    .line 203
    iget p2, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->type:I

    const/4 p3, 0x2

    const-string v0, "*********"

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne p2, p3, :cond_2

    .line 204
    invoke-virtual {p1}, Landroid/webkit/WebView$HitTestResult;->getExtra()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    goto/16 :goto_1

    .line 207
    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    new-array p3, v1, [Ljava/lang/Object;

    aput-object p2, p3, v2

    invoke-static {p3}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 208
    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->isTtfUrl(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 209
    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->downloadFontFile(Ljava/lang/String;)V

    return-void

    .line 211
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->res:Landroid/content/Context;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->res:Landroid/content/Context;

    sget p3, Lcom/flyersoft/moonreaderp/R$string;->no_ttf_found:I

    invoke-virtual {p2, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void

    .line 215
    :cond_2
    invoke-virtual {p1}, Landroid/webkit/WebView$HitTestResult;->getType()I

    move-result p2

    const/4 p3, 0x5

    const/16 v3, 0x8

    if-eq p2, p3, :cond_4

    if-ne p2, v3, :cond_3

    goto :goto_0

    .line 256
    :cond_3
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->res:Landroid/content/Context;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->res:Landroid/content/Context;

    sget p3, Lcom/flyersoft/moonreaderp/R$string;->not_image_anchor_in_browser:I

    invoke-virtual {p2, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void

    .line 217
    :cond_4
    :goto_0
    invoke-virtual {p1}, Landroid/webkit/WebView$HitTestResult;->getExtra()Ljava/lang/String;

    move-result-object p1

    .line 218
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    new-array p3, v1, [Ljava/lang/Object;

    aput-object p2, p3, v2

    invoke-static {p3}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 221
    const-string p2, "data:image"

    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p2

    const/4 p3, -0x1

    if-eq p2, p3, :cond_5

    .line 223
    const-string p3, ","

    invoke-virtual {p1, p3, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result p2

    add-int/2addr p2, v1

    .line 224
    invoke-virtual {p1, p2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/opds/MyBase64;->decode(Ljava/lang/String;)[B

    move-result-object p1

    .line 225
    array-length p2, p1

    invoke-static {p1, v2, p2}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 226
    new-instance p2, Landroid/graphics/drawable/BitmapDrawable;

    iget-object p3, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->res:Landroid/content/Context;

    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    invoke-direct {p2, p3, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 228
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->coverIv:Landroid/widget/ImageView;

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 229
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->tipTv:Landroid/widget/TextView;

    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setVisibility(I)V

    return-void

    .line 232
    :cond_5
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->root:Landroid/view/View;

    sget p3, Lcom/flyersoft/moonreaderp/R$id;->progressBar2:I

    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    invoke-virtual {p2, v2}, Landroid/view/View;->setVisibility(I)V

    .line 233
    new-instance p2, Lcom/flyersoft/moonreaderp/PrefDownloadCover$2;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p3

    invoke-direct {p2, p0, p3}, Lcom/flyersoft/moonreaderp/PrefDownloadCover$2;-><init>(Lcom/flyersoft/moonreaderp/PrefDownloadCover;Landroid/os/Looper;)V

    .line 246
    new-instance p3, Ljava/lang/Thread;

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$3;

    invoke-direct {v0, p0, p1, p2}, Lcom/flyersoft/moonreaderp/PrefDownloadCover$3;-><init>(Lcom/flyersoft/moonreaderp/PrefDownloadCover;Ljava/lang/String;Landroid/os/Handler;)V

    invoke-direct {p3, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 252
    invoke-virtual {p3}, Ljava/lang/Thread;->start()V

    :cond_6
    :goto_1
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1

    .line 263
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->wb:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 264
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->wb:Landroid/webkit/WebView;

    invoke-virtual {p1}, Landroid/webkit/WebView;->goBack()V

    const/4 p1, 0x1

    return p1

    .line 267
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/flyersoft/moonreaderp/PrefOptions;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public show()V
    .locals 1

    const/4 v0, 0x1

    .line 91
    invoke-static {v0}, Lcom/flyersoft/tools/A;->permissionOk(Z)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 93
    :cond_0
    invoke-super {p0}, Lcom/flyersoft/moonreaderp/PrefOptions;->show()V

    return-void
.end method
