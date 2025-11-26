.class public abstract Lcom/flyersoft/books/BaseEBook;
.super Ljava/lang/Object;
.source "BaseEBook.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/books/BaseEBook$Chapter;,
        Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;,
        Lcom/flyersoft/books/BaseEBook$SplitCountCache;,
        Lcom/flyersoft/books/BaseEBook$FootNote;,
        Lcom/flyersoft/books/BaseEBook$AudioId;
    }
.end annotation


# static fields
.field public static final ADITIONAL_ERROR_TAG:Ljava/lang/String; = "#ERROR#"

.field public static final CHAPTER_END_HTMLHINT1:Ljava/lang/String; = " <br/><span align=\"right\"><font color=#6060EE><u>("

.field public static final CHAPTER_END_HTMLHINT2:Ljava/lang/String; = "\")</u></font></span>"

.field public static final HAS_ID_TAG:Ljava/lang/String; = "HAS_ID_TAG"

.field public static final MAX_HTML_SIZE:I = 0xf4240

.field public static final UN_LOAD_TAG:Ljava/lang/String; = "UN_LOAD_TAG"

.field private static footnoteCSS:Ljava/lang/String;

.field public static isGetWordsWoking:Z


# instance fields
.field public ISBN:Ljava/lang/String;

.field public author:Ljava/lang/String;

.field public bookName:Ljava/lang/String;

.field public categories:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public chapters:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/books/BaseEBook$Chapter;",
            ">;"
        }
    .end annotation
.end field

.field public description:Ljava/lang/String;

.field public errMsg:Ljava/lang/String;

.field public forceStopPageCount:Z

.field protected imageGetter:Landroid/text/Html$ImageGetter;

.field public inited:Z

.field public isCountAboutPagesWorking:Z

.field public isCountAccuratePageWorking:Z

.field protected isHtml:Z

.field protected myImageGetter:Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

.field private pageCountParams:Ljava/lang/String;

.field private pageCountTv:Lcom/flyersoft/staticlayout/MRTextView;

.field public pages:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/books/BaseEBook$Chapter;",
            ">;"
        }
    .end annotation
.end field

.field private savedPageCountOnDone:Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;

.field protected showChaptersAtBegin:Z

.field protected totalSize:J

.field public treeTOC:Z

.field public waitingForReset:Z


# direct methods
.method static bridge synthetic -$$Nest$fgetsavedPageCountOnDone(Lcom/flyersoft/books/BaseEBook;)Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/books/BaseEBook;->savedPageCountOnDone:Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputpageCountTv(Lcom/flyersoft/books/BaseEBook;Lcom/flyersoft/staticlayout/MRTextView;)V
    .locals 0

    iput-object p1, p0, Lcom/flyersoft/books/BaseEBook;->pageCountTv:Lcom/flyersoft/staticlayout/MRTextView;

    return-void
.end method

.method static bridge synthetic -$$Nest$fputsavedPageCountOnDone(Lcom/flyersoft/books/BaseEBook;Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;)V
    .locals 0

    iput-object p1, p0, Lcom/flyersoft/books/BaseEBook;->savedPageCountOnDone:Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;

    return-void
.end method

.method static bridge synthetic -$$Nest$mgetPageCountWithCache(Lcom/flyersoft/books/BaseEBook;)I
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/books/BaseEBook;->getPageCountWithCache()I

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$mgetPageCountWithoutCache(Lcom/flyersoft/books/BaseEBook;)I
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/books/BaseEBook;->getPageCountWithoutCache()I

    move-result p0

    return p0
.end method

.method public constructor <init>()V
    .locals 1

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    const-string v0, ""

    iput-object v0, p0, Lcom/flyersoft/books/BaseEBook;->description:Ljava/lang/String;

    .line 40
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/books/BaseEBook;->categories:Ljava/util/ArrayList;

    return-void
.end method

.method public static createFootnoteBox(Ljava/util/ArrayList;)Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/books/BaseEBook$FootNote;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 883
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 884
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/books/BaseEBook$FootNote;

    .line 885
    iget-object v2, v1, Lcom/flyersoft/books/BaseEBook$FootNote;->title:Ljava/lang/String;

    .line 886
    iget-object v3, v1, Lcom/flyersoft/books/BaseEBook$FootNote;->linkName:Ljava/lang/String;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    iget-object v3, v1, Lcom/flyersoft/books/BaseEBook$FootNote;->linkName:Ljava/lang/String;

    const-string v4, "\ufffc"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    iget-object v3, v1, Lcom/flyersoft/books/BaseEBook$FootNote;->linkName:Ljava/lang/String;

    goto :goto_1

    :cond_0
    const/4 v3, 0x0

    :goto_1
    if-eqz v3, :cond_2

    if-nez v2, :cond_1

    move-object v2, v3

    goto :goto_2

    .line 888
    :cond_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " | "

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 889
    :cond_2
    :goto_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz v2, :cond_3

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "<b>"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "</b> "

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_3

    :cond_3
    const-string v2, ""

    :goto_3
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, v1, Lcom/flyersoft/books/BaseEBook$FootNote;->html:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "<br>"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 891
    :cond_4
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v1, "<div style=\""

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/flyersoft/books/BaseEBook;->getFootnoteCSS()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\">"

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 892
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->trimHtml(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "</div>"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private createMyHtmlCache(ILjava/lang/String;ILjava/util/ArrayList;Z)V
    .locals 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    move/from16 v6, p1

    .line 399
    invoke-virtual {p0}, Lcom/flyersoft/books/BaseEBook;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Lcom/flyersoft/books/BaseEBook$Chapter;

    .line 400
    invoke-static/range {p4 .. p4}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    const/4 v8, 0x1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual/range {p4 .. p4}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 401
    :goto_0
    iget-object v2, v7, Lcom/flyersoft/books/BaseEBook$Chapter;->spanned:[Ljava/lang/CharSequence;

    if-eqz v2, :cond_1

    iget-object v2, v7, Lcom/flyersoft/books/BaseEBook$Chapter;->spanned:[Ljava/lang/CharSequence;

    array-length v2, v2

    if-ne v2, v0, :cond_1

    iget-object v2, v7, Lcom/flyersoft/books/BaseEBook$Chapter;->spanned:[Ljava/lang/CharSequence;

    goto :goto_1

    .line 402
    :cond_1
    new-array v2, v0, [Ljava/lang/CharSequence;

    :goto_1
    move-object v9, v2

    .line 404
    invoke-static/range {p4 .. p4}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v2

    const/4 v10, 0x0

    if-eqz v2, :cond_4

    .line 405
    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    instance-of v0, v0, Lcom/flyersoft/books/Fb2;

    if-eqz v0, :cond_2

    .line 406
    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    check-cast v0, Lcom/flyersoft/books/Fb2;

    move-object/from16 v2, p2

    invoke-virtual {v0, v6, v8, v2}, Lcom/flyersoft/books/Fb2;->dealSplitHtml(IZLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    :cond_2
    move-object/from16 v2, p2

    move-object v0, v2

    .line 407
    :goto_2
    aget-object v2, v9, v10

    if-nez v2, :cond_3

    .line 408
    invoke-static {v0}, Lcom/flyersoft/tools/A;->cleanHtml(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/flyersoft/books/BaseEBook;->getMyImageGetter()Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    move-result-object v2

    invoke-static {v0, v2, v6}, Lcom/flyersoft/staticlayout/MyHtml;->fromHtml(Ljava/lang/String;Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;I)Landroid/text/Spanned;

    move-result-object v0

    aput-object v0, v9, v10

    :cond_3
    if-eqz p5, :cond_e

    .line 410
    aget-object v0, v9, v10

    if-eqz v0, :cond_e

    .line 411
    iget-object v2, p0, Lcom/flyersoft/books/BaseEBook;->pageCountTv:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-static {v2, v6, v0}, Lcom/flyersoft/books/BaseEBook;->getSpannedPageCount(Lcom/flyersoft/staticlayout/MRTextView;ILjava/lang/CharSequence;)I

    move-result v0

    iput v0, v7, Lcom/flyersoft/books/BaseEBook$Chapter;->pageCount:I

    .line 412
    aget-object v0, v9, v10

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    iput v0, v7, Lcom/flyersoft/books/BaseEBook$Chapter;->spannedLength:I

    goto/16 :goto_7

    .line 416
    :cond_4
    iget-object v2, v7, Lcom/flyersoft/books/BaseEBook$Chapter;->splitPageCount:[I

    if-eqz v2, :cond_5

    iget-object v2, v7, Lcom/flyersoft/books/BaseEBook$Chapter;->splitPageCount:[I

    array-length v2, v2

    if-eq v2, v0, :cond_6

    .line 417
    :cond_5
    new-array v2, v0, [I

    iput-object v2, v7, Lcom/flyersoft/books/BaseEBook$Chapter;->splitPageCount:[I

    .line 418
    new-array v0, v0, [I

    iput-object v0, v7, Lcom/flyersoft/books/BaseEBook$Chapter;->splitSpannedLength:[I

    .line 420
    :cond_6
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    const/4 v12, 0x0

    .line 422
    :goto_3
    invoke-virtual/range {p4 .. p4}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v12, v0, :cond_e

    move/from16 v13, p3

    move-object/from16 v14, p4

    if-nez p5, :cond_7

    if-ne v12, v13, :cond_d

    .line 424
    :cond_7
    invoke-virtual {v14, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 425
    sget-object v2, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    instance-of v2, v2, Lcom/flyersoft/books/Fb2;

    if-eqz v2, :cond_9

    .line 426
    sget-object v2, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    check-cast v2, Lcom/flyersoft/books/Fb2;

    if-gtz v12, :cond_8

    const/4 v3, 0x1

    goto :goto_4

    :cond_8
    const/4 v3, 0x0

    :goto_4
    invoke-virtual {v2, v6, v3, v0}, Lcom/flyersoft/books/Fb2;->dealSplitHtml(IZLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 427
    :cond_9
    invoke-static {v0}, Lcom/flyersoft/tools/A;->chineseJianFanConvert(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz p5, :cond_c

    .line 431
    invoke-static {v0}, Lcom/flyersoft/tools/T;->html2TextLength(Ljava/lang/String;)I

    move-result v2

    const/4 v3, 0x0

    const v4, 0x3dcccccd    # 0.1f

    .line 432
    invoke-direct {p0, v11, v2, v3, v4}, Lcom/flyersoft/books/BaseEBook;->getSplitCache(Ljava/util/ArrayList;IFF)Lcom/flyersoft/books/BaseEBook$SplitCountCache;

    move-result-object v3

    if-eqz v3, :cond_a

    .line 435
    iget-object v0, v7, Lcom/flyersoft/books/BaseEBook$Chapter;->splitPageCount:[I

    iget v2, v3, Lcom/flyersoft/books/BaseEBook$SplitCountCache;->pageCount:I

    int-to-float v2, v2

    iget v4, v3, Lcom/flyersoft/books/BaseEBook$SplitCountCache;->offRate:F

    div-float/2addr v2, v4

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    aput v2, v0, v12

    .line 436
    iget-object v0, v7, Lcom/flyersoft/books/BaseEBook$Chapter;->splitSpannedLength:[I

    iget v2, v3, Lcom/flyersoft/books/BaseEBook$SplitCountCache;->spannedLength:I

    int-to-float v2, v2

    iget v3, v3, Lcom/flyersoft/books/BaseEBook$SplitCountCache;->offRate:F

    div-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    aput v2, v0, v12

    goto :goto_5

    .line 438
    :cond_a
    aget-object v3, v9, v12

    if-nez v3, :cond_b

    .line 439
    invoke-static {v0}, Lcom/flyersoft/tools/A;->cleanHtml(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/flyersoft/books/BaseEBook;->getMyImageGetter()Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    move-result-object v3

    invoke-static {v0, v3, v6}, Lcom/flyersoft/staticlayout/MyHtml;->fromHtml(Ljava/lang/String;Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;I)Landroid/text/Spanned;

    move-result-object v0

    aput-object v0, v9, v12

    .line 440
    :cond_b
    iget-object v0, v7, Lcom/flyersoft/books/BaseEBook$Chapter;->splitPageCount:[I

    iget-object v3, p0, Lcom/flyersoft/books/BaseEBook;->pageCountTv:Lcom/flyersoft/staticlayout/MRTextView;

    aget-object v4, v9, v12

    invoke-static {v3, v6, v4}, Lcom/flyersoft/books/BaseEBook;->getSpannedPageCount(Lcom/flyersoft/staticlayout/MRTextView;ILjava/lang/CharSequence;)I

    move-result v3

    aput v3, v0, v12

    .line 441
    iget-object v0, v7, Lcom/flyersoft/books/BaseEBook$Chapter;->splitSpannedLength:[I

    aget-object v3, v9, v12

    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    move-result v3

    aput v3, v0, v12

    .line 442
    new-instance v0, Lcom/flyersoft/books/BaseEBook$SplitCountCache;

    iget-object v3, v7, Lcom/flyersoft/books/BaseEBook$Chapter;->splitPageCount:[I

    aget v3, v3, v12

    iget-object v4, v7, Lcom/flyersoft/books/BaseEBook$Chapter;->splitSpannedLength:[I

    aget v4, v4, v12

    const/4 v5, 0x0

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/flyersoft/books/BaseEBook$SplitCountCache;-><init>(Lcom/flyersoft/books/BaseEBook;IIIF)V

    invoke-virtual {v11, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 444
    :goto_5
    iget v0, v7, Lcom/flyersoft/books/BaseEBook$Chapter;->pageCount:I

    iget-object v2, v7, Lcom/flyersoft/books/BaseEBook$Chapter;->splitPageCount:[I

    aget v2, v2, v12

    add-int/2addr v0, v2

    iput v0, v7, Lcom/flyersoft/books/BaseEBook$Chapter;->pageCount:I

    .line 445
    iget v0, v7, Lcom/flyersoft/books/BaseEBook$Chapter;->spannedLength:I

    iget-object v2, v7, Lcom/flyersoft/books/BaseEBook$Chapter;->splitSpannedLength:[I

    aget v2, v2, v12

    add-int/2addr v0, v2

    iput v0, v7, Lcom/flyersoft/books/BaseEBook$Chapter;->spannedLength:I

    goto :goto_6

    .line 447
    :cond_c
    invoke-static {v0}, Lcom/flyersoft/tools/A;->cleanHtml(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/flyersoft/books/BaseEBook;->getMyImageGetter()Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    move-result-object v2

    invoke-static {v0, v2, v6}, Lcom/flyersoft/staticlayout/MyHtml;->fromHtml(Ljava/lang/String;Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;I)Landroid/text/Spanned;

    move-result-object v0

    aput-object v0, v9, v12

    .line 449
    :goto_6
    iget-boolean v0, p0, Lcom/flyersoft/books/BaseEBook;->forceStopPageCount:Z

    if-nez v0, :cond_e

    sget-object v0, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    if-nez v0, :cond_d

    goto :goto_7

    :cond_d
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_3

    .line 455
    :cond_e
    :goto_7
    iput-object v9, v7, Lcom/flyersoft/books/BaseEBook$Chapter;->spanned:[Ljava/lang/CharSequence;

    return-void
.end method

.method public static getBookCharCountIfComplete(I)I
    .locals 4

    const/4 v0, 0x0

    .line 780
    :try_start_0
    invoke-static {}, Lcom/flyersoft/tools/A;->getBookType()I

    move-result v1

    if-eqz v1, :cond_7

    const/4 v2, 0x1

    if-eq v1, v2, :cond_6

    const/4 v3, 0x7

    if-eq v1, v3, :cond_3

    const/16 v3, 0x64

    if-eq v1, v3, :cond_0

    return v0

    :cond_0
    add-int/2addr p0, v2

    const/4 v1, 0x0

    .line 785
    :goto_0
    sget-object v2, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v2}, Lcom/flyersoft/books/BaseEBook;->getChapters()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge p0, v2, :cond_2

    .line 786
    sget-object v2, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v2, p0}, Lcom/flyersoft/books/BaseEBook;->get(I)Lcom/flyersoft/books/BaseEBook$Chapter;

    move-result-object v2

    iget v2, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->pure_text_length:I

    if-gez v2, :cond_1

    return v0

    .line 789
    :cond_1
    sget-object v2, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v2, p0}, Lcom/flyersoft/books/BaseEBook;->get(I)Lcom/flyersoft/books/BaseEBook$Chapter;

    move-result-object v2

    iget v2, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->pure_text_length:I

    add-int/2addr v1, v2

    add-int/lit8 p0, p0, 0x1

    goto :goto_0

    :cond_2
    return v1

    .line 796
    :cond_3
    sget-object p0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 797
    :goto_1
    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->getPageCharCount()[Ljava/lang/Integer;

    move-result-object v3

    array-length v3, v3

    if-ge v1, v3, :cond_5

    .line 798
    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->getPageCharCount()[Ljava/lang/Integer;

    move-result-object v3

    aget-object v3, v3, v1

    if-eqz v3, :cond_4

    .line 799
    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->getPageCharCount()[Ljava/lang/Integer;

    move-result-object v3

    aget-object v3, v3, v1

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    add-int/2addr v2, v3

    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_5
    return v2

    .line 793
    :cond_6
    sget-object p0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getHtmlFileCharCount()I

    move-result p0

    return p0

    .line 782
    :cond_7
    invoke-static {p0}, Lcom/flyersoft/tools/A;->getPriorTxtLength(I)I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 803
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return v0
.end method

.method public static getBookWordCountIfComplete()I
    .locals 5

    const/4 v0, 0x0

    .line 732
    :try_start_0
    invoke-static {}, Lcom/flyersoft/tools/A;->getBookType()I

    move-result v1

    if-eqz v1, :cond_7

    const/4 v2, 0x1

    if-eq v1, v2, :cond_6

    const/4 v2, 0x7

    if-eq v1, v2, :cond_3

    const/16 v2, 0x64

    if-eq v1, v2, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 742
    :goto_0
    sget-object v3, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v3}, Lcom/flyersoft/books/BaseEBook;->getChapters()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v1, v3, :cond_2

    .line 743
    sget-object v3, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v3, v1}, Lcom/flyersoft/books/BaseEBook;->get(I)Lcom/flyersoft/books/BaseEBook$Chapter;

    move-result-object v3

    iget v3, v3, Lcom/flyersoft/books/BaseEBook$Chapter;->pure_text_length:I

    if-gez v3, :cond_1

    return v0

    .line 746
    :cond_1
    sget-object v3, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v3, v1}, Lcom/flyersoft/books/BaseEBook;->get(I)Lcom/flyersoft/books/BaseEBook$Chapter;

    move-result-object v3

    iget v3, v3, Lcom/flyersoft/books/BaseEBook$Chapter;->word_count:I

    add-int/2addr v2, v3

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return v2

    .line 753
    :cond_3
    sget-object v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 754
    :goto_1
    invoke-virtual {v1}, Lcom/flyersoft/books/PDFReader;->getPageWordCount()[Ljava/lang/Integer;

    move-result-object v4

    array-length v4, v4

    if-ge v2, v4, :cond_5

    .line 755
    invoke-virtual {v1}, Lcom/flyersoft/books/PDFReader;->getPageWordCount()[Ljava/lang/Integer;

    move-result-object v4

    aget-object v4, v4, v2

    if-nez v4, :cond_4

    return v0

    .line 758
    :cond_4
    invoke-virtual {v1}, Lcom/flyersoft/books/PDFReader;->getPageWordCount()[Ljava/lang/Integer;

    move-result-object v4

    aget-object v4, v4, v2

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    add-int/2addr v3, v4

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_5
    return v3

    .line 750
    :cond_6
    sget-object v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getHtmlFileWordCount()I

    move-result v0

    return v0

    :cond_7
    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 734
    :goto_2
    sget-object v3, Lcom/flyersoft/tools/A;->txts:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v1, v3, :cond_9

    .line 735
    sget-object v3, Lcom/flyersoft/tools/A;->txtWordCount:[Ljava/lang/Integer;

    aget-object v3, v3, v1

    if-nez v3, :cond_8

    return v0

    .line 738
    :cond_8
    sget-object v3, Lcom/flyersoft/tools/A;->txtWordCount:[Ljava/lang/Integer;

    aget-object v3, v3, v1

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    add-int/2addr v2, v3

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_9
    return v2

    :catch_0
    move-exception v1

    .line 762
    invoke-static {v1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return v0
.end method

.method public static getEBookUnReadWordCount(Lcom/flyersoft/books/BaseEBook;ILcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;Z)I
    .locals 4

    const/4 v0, 0x0

    if-eqz p3, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    add-int/lit8 v1, p1, 0x1

    .line 511
    :goto_0
    invoke-virtual {p0}, Lcom/flyersoft/books/BaseEBook;->getChapters()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x1

    if-ge v1, v2, :cond_2

    .line 512
    invoke-virtual {p0}, Lcom/flyersoft/books/BaseEBook;->getChapters()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget v2, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->pure_text_length:I

    if-gez v2, :cond_1

    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    const/4 v1, 0x1

    :goto_1
    if-eqz v1, :cond_3

    .line 516
    invoke-virtual {p0}, Lcom/flyersoft/books/BaseEBook;->getChapters()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ne v2, v3, :cond_3

    invoke-virtual {p0}, Lcom/flyersoft/books/BaseEBook;->getChapters()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget v2, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->pure_text_length:I

    if-gez v2, :cond_3

    const/4 v1, 0x0

    :cond_3
    if-nez v1, :cond_6

    .line 519
    sget-boolean v0, Lcom/flyersoft/books/BaseEBook;->isGetWordsWoking:Z

    const/4 v1, -0x1

    if-eqz v0, :cond_4

    return v1

    .line 521
    :cond_4
    new-instance v0, Lcom/flyersoft/books/BaseEBook$3;

    invoke-direct {v0, p1, p0, p3, p2}, Lcom/flyersoft/books/BaseEBook$3;-><init>(ILcom/flyersoft/books/BaseEBook;ZLcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;)V

    if-eqz p3, :cond_5

    const/4 v3, 0x5

    .line 576
    :cond_5
    invoke-virtual {v0, v3}, Ljava/lang/Thread;->setPriority(I)V

    .line 577
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return v1

    :cond_6
    add-int/2addr p1, v3

    .line 581
    :goto_2
    invoke-virtual {p0}, Lcom/flyersoft/books/BaseEBook;->getChapters()Ljava/util/ArrayList;

    move-result-object p3

    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result p3

    if-ge p1, p3, :cond_7

    .line 582
    invoke-virtual {p0}, Lcom/flyersoft/books/BaseEBook;->getChapters()Ljava/util/ArrayList;

    move-result-object p3

    invoke-virtual {p3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget p3, p3, Lcom/flyersoft/books/BaseEBook$Chapter;->word_count:I

    add-int/2addr v0, p3

    add-int/lit8 p1, p1, 0x1

    goto :goto_2

    .line 583
    :cond_7
    invoke-interface {p2, v0}, Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;->refresh(I)V

    return v0
.end method

.method public static getEbookCurPageInChapter()I
    .locals 5

    .line 945
    sget-object v0, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getRealHeight()I

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    return v1

    .line 948
    :cond_0
    invoke-static {v0}, Lcom/flyersoft/books/BaseEBook;->getTxtViewPageCount(I)I

    move-result v2

    .line 949
    sget-object v3, Lcom/flyersoft/tools/A;->txtScroll:Landroid/widget/ScrollView;

    invoke-virtual {v3}, Landroid/widget/ScrollView;->getScrollY()I

    move-result v3

    invoke-static {}, Lcom/flyersoft/tools/A;->getPageHeight()I

    move-result v4

    div-int/lit8 v4, v4, 0x5

    add-int/2addr v3, v4

    mul-int v3, v3, v2

    div-int/2addr v3, v0

    add-int/2addr v3, v1

    if-le v3, v2, :cond_1

    return v2

    :cond_1
    return v3
.end method

.method public static getFootnoteCSS()Ljava/lang/String;
    .locals 3

    .line 867
    const-string v0, ".footnote"

    sget-object v1, Lcom/flyersoft/books/BaseEBook;->footnoteCSS:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 869
    :try_start_0
    invoke-static {}, Lcom/flyersoft/books/Fb2;->getFb2Css()Lcom/flyersoft/components/CSS;

    move-result-object v1

    iget-object v1, v1, Lcom/flyersoft/components/CSS;->styles:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 870
    invoke-static {}, Lcom/flyersoft/books/Fb2;->getFb2Css()Lcom/flyersoft/components/CSS;

    move-result-object v1

    iget-object v1, v1, Lcom/flyersoft/components/CSS;->styles:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/components/CSS$Style;

    iget-object v0, v0, Lcom/flyersoft/components/CSS$Style;->css_text:Ljava/lang/String;

    .line 871
    const-string v1, "{"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    const-string v2, "}"

    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/books/BaseEBook;->footnoteCSS:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 874
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 877
    :cond_0
    :goto_0
    sget-object v0, Lcom/flyersoft/books/BaseEBook;->footnoteCSS:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 878
    const-string v0, "font-size:0.8em; background:rgba(126, 126, 126, 0.1); margin:0.5em; padding:0.5em; border:1px dotted #888888; border-radius:10px;"

    sput-object v0, Lcom/flyersoft/books/BaseEBook;->footnoteCSS:Ljava/lang/String;

    .line 879
    :cond_1
    sget-object v0, Lcom/flyersoft/books/BaseEBook;->footnoteCSS:Ljava/lang/String;

    return-object v0
.end method

.method public static getISBN(Ljava/lang/String;)Ljava/lang/String;
    .locals 11

    const/4 v0, 0x0

    .line 815
    :try_start_0
    const-string v1, ".epub"

    invoke-virtual {p0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    const/16 v2, 0x2d

    const/16 v3, 0x39

    const/16 v4, 0x30

    const/16 v5, 0x1e

    const/4 v6, -0x1

    if-nez v1, :cond_0

    const-string v1, ".epub3"

    invoke-virtual {p0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 816
    :cond_0
    invoke-static {p0}, Lcom/flyersoft/tools/compress/MyZip_Base;->createZipper(Ljava/lang/String;)Lcom/flyersoft/tools/compress/MyZip_Base;

    move-result-object v1

    .line 817
    invoke-virtual {v1}, Lcom/flyersoft/tools/compress/MyZip_Base;->getFileInfoOfZip()Ljava/util/ArrayList;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_7

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;

    .line 818
    iget-object v9, v8, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    const-string v10, "content.opf"

    invoke-virtual {v9, v10}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 819
    iget-object p0, v8, Lcom/flyersoft/tools/compress/MyZip_Base$FileInfo_In_Zip;->filename:Ljava/lang/String;

    invoke-virtual {v1, p0}, Lcom/flyersoft/tools/compress/MyZip_Base;->getFileStreamFromZip(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p0

    .line 820
    invoke-static {p0}, Lcom/flyersoft/tools/T;->inputStream2String(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object p0

    .line 821
    const-string v1, "ISBN"

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-ne v1, v6, :cond_2

    return-object v0

    .line 824
    :cond_2
    const-string v6, ">"

    invoke-virtual {p0, v6, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    .line 825
    const-string v6, "<"

    invoke-virtual {p0, v6, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v6

    .line 826
    invoke-virtual {p0, v1, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x0

    .line 827
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v1, v6, :cond_5

    .line 828
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-eq v6, v2, :cond_4

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-lt v6, v4, :cond_3

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-le v6, v3, :cond_4

    :cond_3
    return-object v0

    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 830
    :cond_5
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v1, v5, :cond_6

    return-object p0

    :cond_6
    return-object v0

    .line 833
    :cond_7
    const-string v1, ".mobi"

    invoke-virtual {p0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_10

    .line 834
    invoke-static {p0}, Lcom/flyersoft/tools/T;->getFileText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 835
    const-string v1, ">ISBN"

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-ne v1, v6, :cond_8

    .line 837
    const-string v1, "isbn:"

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    :cond_8
    if-ne v1, v6, :cond_9

    return-object v0

    :cond_9
    add-int/lit8 v7, v1, 0x1

    :goto_1
    add-int/lit8 v8, v1, 0x1e

    if-ge v7, v8, :cond_b

    .line 842
    invoke-virtual {p0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v8

    if-lt v8, v4, :cond_a

    invoke-virtual {p0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v8

    if-gt v8, v3, :cond_a

    goto :goto_2

    :cond_a
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    :cond_b
    const/4 v7, -0x1

    :goto_2
    if-ne v7, v6, :cond_c

    return-object v0

    :cond_c
    add-int/lit8 v1, v7, 0x1

    :goto_3
    add-int/lit8 v8, v7, 0x1e

    if-ge v1, v8, :cond_f

    .line 851
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v8

    if-eq v8, v2, :cond_e

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v8

    if-lt v8, v4, :cond_d

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v8

    if-le v8, v3, :cond_e

    :cond_d
    move v6, v1

    goto :goto_4

    :cond_e
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_f
    :goto_4
    if-le v6, v7, :cond_10

    sub-int v1, v6, v7

    if-ge v1, v5, :cond_10

    .line 857
    invoke-virtual {p0, v7, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    :catchall_0
    move-exception p0

    .line 860
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_10
    return-object v0
.end method

.method private static getPageCountParams()Ljava/lang/String;
    .locals 2

    .line 380
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, ""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lcom/flyersoft/tools/A;->fontName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v1, Lcom/flyersoft/tools/A;->fontSize:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    sget v1, Lcom/flyersoft/tools/A;->fontSpace:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    sget v1, Lcom/flyersoft/tools/A;->fontScale:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    sget v1, Lcom/flyersoft/tools/A;->paragraphSpace:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    sget v1, Lcom/flyersoft/tools/A;->lineSpace:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    sget v1, Lcom/flyersoft/tools/A;->topMargin:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    sget v1, Lcom/flyersoft/tools/A;->bottomMargin:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    sget v1, Lcom/flyersoft/tools/A;->leftMargin:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    sget v1, Lcom/flyersoft/tools/A;->rightMargin:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    sget-boolean v1, Lcom/flyersoft/tools/A;->textHyphenation:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getPageCountWithCache()I
    .locals 14

    .line 310
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 312
    invoke-virtual {p0}, Lcom/flyersoft/books/BaseEBook;->getChapters()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/16 v2, 0x32

    const/4 v7, 0x1

    const/4 v8, 0x0

    if-le v1, v2, :cond_0

    const/4 v9, 0x1

    goto :goto_0

    :cond_0
    const/4 v9, 0x0

    :goto_0
    const/4 v1, 0x0

    const/4 v10, 0x0

    .line 314
    :goto_1
    invoke-virtual {p0}, Lcom/flyersoft/books/BaseEBook;->getChapters()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_9

    .line 315
    invoke-virtual {p0}, Lcom/flyersoft/books/BaseEBook;->getChapters()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    move-object v11, v2

    check-cast v11, Lcom/flyersoft/books/BaseEBook$Chapter;

    .line 317
    iget v2, v11, Lcom/flyersoft/books/BaseEBook$Chapter;->pageCount:I

    if-nez v2, :cond_6

    .line 318
    invoke-virtual {p0, v1}, Lcom/flyersoft/books/BaseEBook;->getChapterText(I)Ljava/lang/String;

    move-result-object v2

    .line 319
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 320
    invoke-static {v2, v4}, Lcom/flyersoft/tools/A;->adjustChapterHtml(Ljava/lang/String;Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v2

    .line 322
    iget-object v3, p0, Lcom/flyersoft/books/BaseEBook;->pageCountTv:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-static {v3, v1}, Lcom/flyersoft/books/BaseEBook;->updateMRTextViewForPageCount(Lcom/flyersoft/staticlayout/MRTextView;I)V

    if-nez v9, :cond_1

    const/4 v12, 0x0

    goto :goto_2

    .line 323
    :cond_1
    invoke-static {v2}, Lcom/flyersoft/tools/T;->html2TextLength(Ljava/lang/String;)I

    move-result v3

    move v12, v3

    :goto_2
    if-eqz v9, :cond_2

    .line 325
    invoke-static {v4}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 326
    iget v3, v11, Lcom/flyersoft/books/BaseEBook$Chapter;->pageCountFontSize:F

    const v5, 0x3dcccccd    # 0.1f

    invoke-direct {p0, v6, v12, v3, v5}, Lcom/flyersoft/books/BaseEBook;->getSplitCache(Ljava/util/ArrayList;IFF)Lcom/flyersoft/books/BaseEBook$SplitCountCache;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 329
    iget v5, v3, Lcom/flyersoft/books/BaseEBook$SplitCountCache;->pageCount:I

    int-to-float v5, v5

    iget v13, v3, Lcom/flyersoft/books/BaseEBook$SplitCountCache;->offRate:F

    div-float/2addr v5, v13

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    iput v5, v11, Lcom/flyersoft/books/BaseEBook$Chapter;->pageCount:I

    .line 330
    iget v5, v3, Lcom/flyersoft/books/BaseEBook$SplitCountCache;->spannedLength:I

    int-to-float v5, v5

    iget v3, v3, Lcom/flyersoft/books/BaseEBook$SplitCountCache;->offRate:F

    div-float/2addr v5, v3

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v3

    iput v3, v11, Lcom/flyersoft/books/BaseEBook$Chapter;->spannedLength:I

    .line 331
    iput-boolean v7, v11, Lcom/flyersoft/books/BaseEBook$Chapter;->isAboutPageCount:Z

    .line 335
    :cond_2
    sget-object v3, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    if-nez v3, :cond_3

    goto :goto_5

    .line 338
    :cond_3
    iget v3, v11, Lcom/flyersoft/books/BaseEBook$Chapter;->pageCount:I

    if-nez v3, :cond_4

    .line 339
    invoke-static {v2}, Lcom/flyersoft/tools/A;->chineseJianFanConvert(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v5, 0x1

    move-object v0, p0

    .line 340
    invoke-direct/range {v0 .. v5}, Lcom/flyersoft/books/BaseEBook;->createMyHtmlCache(ILjava/lang/String;ILjava/util/ArrayList;Z)V

    move v13, v1

    if-eqz v9, :cond_5

    .line 341
    invoke-static {v4}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 342
    new-instance v0, Lcom/flyersoft/books/BaseEBook$SplitCountCache;

    iget v3, v11, Lcom/flyersoft/books/BaseEBook$Chapter;->pageCount:I

    iget v4, v11, Lcom/flyersoft/books/BaseEBook$Chapter;->spannedLength:I

    iget v5, v11, Lcom/flyersoft/books/BaseEBook$Chapter;->pageCountFontSize:F

    move-object v1, p0

    move v2, v12

    invoke-direct/range {v0 .. v5}, Lcom/flyersoft/books/BaseEBook$SplitCountCache;-><init>(Lcom/flyersoft/books/BaseEBook;IIIF)V

    move-object v1, v0

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :cond_4
    move v13, v1

    .line 345
    :cond_5
    :goto_3
    invoke-virtual {p0, v8}, Lcom/flyersoft/books/BaseEBook;->clearMyHtmlCacheIfLowMemory(Z)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 346
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "clear MEM after chapterID: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-array v2, v7, [Ljava/lang/Object;

    aput-object v1, v2, v8

    invoke-static {v2}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    goto :goto_4

    :cond_6
    move v13, v1

    .line 349
    :cond_7
    :goto_4
    iget v1, v11, Lcom/flyersoft/books/BaseEBook$Chapter;->pageCount:I

    add-int/2addr v10, v1

    .line 350
    iget-boolean v1, p0, Lcom/flyersoft/books/BaseEBook;->forceStopPageCount:Z

    if-nez v1, :cond_9

    sget-object v1, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    if-nez v1, :cond_8

    goto :goto_5

    :cond_8
    add-int/lit8 v1, v13, 0x1

    goto/16 :goto_1

    :cond_9
    :goto_5
    return v10
.end method

.method private getPageCountWithoutCache()I
    .locals 9

    const/4 v0, 0x0

    const/4 v2, 0x0

    const/4 v7, 0x0

    .line 360
    :goto_0
    invoke-virtual {p0}, Lcom/flyersoft/books/BaseEBook;->getChapters()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v2, v1, :cond_4

    .line 361
    invoke-virtual {p0}, Lcom/flyersoft/books/BaseEBook;->getChapters()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Lcom/flyersoft/books/BaseEBook$Chapter;

    .line 362
    iget-boolean v1, v8, Lcom/flyersoft/books/BaseEBook$Chapter;->isAboutPageCount:Z

    if-eqz v1, :cond_0

    .line 363
    invoke-virtual {p0, v2}, Lcom/flyersoft/books/BaseEBook;->getChapterText(I)Ljava/lang/String;

    move-result-object v1

    .line 364
    iget-object v3, p0, Lcom/flyersoft/books/BaseEBook;->pageCountTv:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-static {v3, v2}, Lcom/flyersoft/books/BaseEBook;->updateMRTextViewForPageCount(Lcom/flyersoft/staticlayout/MRTextView;I)V

    .line 365
    invoke-static {v1}, Lcom/flyersoft/tools/A;->chineseJianFanConvert(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x0

    const/4 v6, 0x1

    const/4 v4, 0x0

    move-object v1, p0

    .line 366
    invoke-direct/range {v1 .. v6}, Lcom/flyersoft/books/BaseEBook;->createMyHtmlCache(ILjava/lang/String;ILjava/util/ArrayList;Z)V

    .line 367
    iput-boolean v0, v8, Lcom/flyersoft/books/BaseEBook$Chapter;->isAboutPageCount:Z

    .line 368
    invoke-virtual {p0, v0}, Lcom/flyersoft/books/BaseEBook;->clearMyHtmlCacheIfLowMemory(Z)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 369
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "clear MEM after chapterID (2): "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v3, v4, v0

    invoke-static {v4}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    goto :goto_1

    :cond_0
    move-object v1, p0

    .line 372
    :cond_1
    :goto_1
    iget v3, v8, Lcom/flyersoft/books/BaseEBook$Chapter;->pageCount:I

    add-int/2addr v7, v3

    .line 373
    iget-boolean v3, v1, Lcom/flyersoft/books/BaseEBook;->forceStopPageCount:Z

    if-nez v3, :cond_3

    sget-object v3, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    if-nez v3, :cond_2

    goto :goto_2

    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    :goto_2
    return v7

    :cond_4
    move-object v1, p0

    return v7
.end method

.method public static getPdfUnReadWordCoun(Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;Z)I
    .locals 6

    .line 652
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    const/4 v1, -0x1

    if-nez v0, :cond_9

    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    if-nez v0, :cond_0

    goto :goto_4

    .line 654
    :cond_0
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    if-nez v0, :cond_1

    return v1

    :cond_1
    const/4 v2, 0x0

    if-eqz p1, :cond_2

    const/4 v3, 0x0

    goto :goto_0

    .line 658
    :cond_2
    sget-object v3, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfGetCurrPageNo()I

    move-result v3

    :goto_0
    if-ne v3, v1, :cond_3

    return v1

    :cond_3
    move v4, v3

    .line 661
    :goto_1
    invoke-virtual {v0}, Lcom/flyersoft/books/PDFReader;->getPageWordCount()[Ljava/lang/Integer;

    move-result-object v5

    array-length v5, v5

    if-ge v4, v5, :cond_7

    .line 662
    invoke-virtual {v0}, Lcom/flyersoft/books/PDFReader;->getPageWordCount()[Ljava/lang/Integer;

    move-result-object v5

    aget-object v5, v5, v4

    if-nez v5, :cond_6

    .line 668
    sget-boolean v0, Lcom/flyersoft/books/BaseEBook;->isGetWordsWoking:Z

    if-eqz v0, :cond_4

    return v1

    .line 670
    :cond_4
    new-instance v0, Lcom/flyersoft/books/BaseEBook$5;

    invoke-direct {v0, v3, p1, p0}, Lcom/flyersoft/books/BaseEBook$5;-><init>(IZLcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;)V

    if-eqz p1, :cond_5

    const/4 p0, 0x5

    goto :goto_2

    :cond_5
    const/4 p0, 0x1

    .line 718
    :goto_2
    invoke-virtual {v0, p0}, Ljava/lang/Thread;->setPriority(I)V

    .line 719
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return v1

    :cond_6
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 723
    :cond_7
    :goto_3
    invoke-virtual {v0}, Lcom/flyersoft/books/PDFReader;->getPageWordCount()[Ljava/lang/Integer;

    move-result-object p0

    array-length p0, p0

    if-ge v3, p0, :cond_8

    .line 724
    invoke-virtual {v0}, Lcom/flyersoft/books/PDFReader;->getPageWordCount()[Ljava/lang/Integer;

    move-result-object p0

    aget-object p0, p0, v3

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    add-int/2addr v2, p0

    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    :cond_8
    return v2

    :cond_9
    :goto_4
    return v1
.end method

.method public static getPriorTextLength2(I)I
    .locals 1

    add-int/lit8 v0, p0, -0x1

    .line 769
    invoke-static {v0}, Lcom/flyersoft/books/BaseEBook;->getBookCharCountIfComplete(I)I

    move-result v0

    if-nez v0, :cond_0

    .line 771
    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v0, p0}, Lcom/flyersoft/books/BaseEBook;->getPriorTextLength(I)I

    move-result p0

    return p0

    :cond_0
    const/4 p0, -0x1

    .line 773
    invoke-static {p0}, Lcom/flyersoft/books/BaseEBook;->getBookCharCountIfComplete(I)I

    move-result p0

    sub-int/2addr p0, v0

    return p0
.end method

.method public static getSpannedPageCount(Lcom/flyersoft/staticlayout/MRTextView;ILjava/lang/CharSequence;)I
    .locals 9

    .line 930
    new-instance v0, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v3

    sget-object p1, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    .line 931
    invoke-virtual {p1}, Lcom/flyersoft/staticlayout/MRTextView;->getWidth()I

    move-result v4

    sget-object v5, Lcom/flyersoft/staticlayout/MyLayout$Alignment;->ALIGN_LEFT:Lcom/flyersoft/staticlayout/MyLayout$Alignment;

    sget-object p1, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    iget v6, p1, Lcom/flyersoft/staticlayout/MRTextView;->mSpacingMult:F

    sget-object p1, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    iget v7, p1, Lcom/flyersoft/staticlayout/MRTextView;->mSpacingAdd:F

    const/4 v8, 0x1

    move-object v1, p0

    move-object v2, p2

    invoke-direct/range {v0 .. v8}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;-><init>(Lcom/flyersoft/staticlayout/MyTextView;Ljava/lang/CharSequence;Landroid/text/TextPaint;ILcom/flyersoft/staticlayout/MyLayout$Alignment;FFZ)V

    .line 932
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->getLineCount()I

    move-result p0

    invoke-virtual {v0, p0}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->getLineTop(I)I

    move-result p0

    .line 933
    invoke-static {p0}, Lcom/flyersoft/books/BaseEBook;->getTxtViewPageCount(I)I

    move-result p0

    return p0
.end method

.method private getSplitCache(Ljava/util/ArrayList;IFF)Lcom/flyersoft/books/BaseEBook$SplitCountCache;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/books/BaseEBook$SplitCountCache;",
            ">;IFF)",
            "Lcom/flyersoft/books/BaseEBook$SplitCountCache;"
        }
    .end annotation

    if-lez p2, :cond_1

    .line 460
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/books/BaseEBook$SplitCountCache;

    .line 461
    iget v1, v0, Lcom/flyersoft/books/BaseEBook$SplitCountCache;->fontSize:F

    cmpl-float v1, p3, v1

    if-nez v1, :cond_0

    .line 462
    iget v1, v0, Lcom/flyersoft/books/BaseEBook$SplitCountCache;->charCount:I

    int-to-float v1, v1

    int-to-float v2, p2

    div-float/2addr v1, v2

    const/high16 v2, 0x3f800000    # 1.0f

    sub-float v3, v2, p4

    cmpl-float v3, v1, v3

    if-lez v3, :cond_0

    add-float/2addr v2, p4

    cmpg-float v2, v1, v2

    if-gez v2, :cond_0

    .line 464
    iput v1, v0, Lcom/flyersoft/books/BaseEBook$SplitCountCache;->offRate:F

    return-object v0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public static getTxtUnReadWordCount(Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;Z)I
    .locals 4

    .line 591
    sget-wide v0, Lcom/flyersoft/tools/A;->lastPosition:J

    sget v2, Lcom/flyersoft/tools/A;->fixedBlockLength:I

    int-to-long v2, v2

    div-long/2addr v0, v2

    long-to-int v1, v0

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    if-nez v1, :cond_1

    const/4 v1, 0x3

    goto :goto_0

    :cond_1
    add-int/lit8 v1, v1, 0x2

    :goto_0
    move v2, v1

    .line 593
    :goto_1
    sget-object v3, Lcom/flyersoft/tools/A;->txts:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_5

    .line 594
    sget-object v3, Lcom/flyersoft/tools/A;->txtWordCount:[Ljava/lang/Integer;

    aget-object v3, v3, v2

    if-nez v3, :cond_4

    .line 600
    sget-boolean v0, Lcom/flyersoft/books/BaseEBook;->isGetWordsWoking:Z

    const/4 v2, -0x1

    if-eqz v0, :cond_2

    return v2

    .line 602
    :cond_2
    new-instance v0, Lcom/flyersoft/books/BaseEBook$4;

    invoke-direct {v0, v1, p1, p0}, Lcom/flyersoft/books/BaseEBook$4;-><init>(IZLcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;)V

    if-eqz p1, :cond_3

    const/4 p0, 0x5

    goto :goto_2

    :cond_3
    const/4 p0, 0x1

    .line 640
    :goto_2
    invoke-virtual {v0, p0}, Ljava/lang/Thread;->setPriority(I)V

    .line 641
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return v2

    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 645
    :cond_5
    :goto_3
    sget-object p0, Lcom/flyersoft/tools/A;->txts:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    if-ge v1, p0, :cond_6

    .line 646
    sget-object p0, Lcom/flyersoft/tools/A;->txtWordCount:[Ljava/lang/Integer;

    aget-object p0, p0, v1

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    add-int/2addr v0, p0

    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_6
    return v0
.end method

.method public static getTxtViewPageCount(I)I
    .locals 4

    .line 937
    invoke-static {}, Lcom/flyersoft/tools/A;->getPageHeight()I

    move-result v0

    div-int v0, p0, v0

    const/4 v1, 0x0

    const/4 v2, 0x3

    if-le v0, v2, :cond_0

    .line 938
    invoke-static {}, Lcom/flyersoft/tools/A;->oneLineTagHeight()I

    move-result v3

    mul-int v0, v0, v3

    :goto_0
    div-int/2addr v0, v2

    goto :goto_1

    :cond_0
    const/4 v2, 0x2

    if-le v0, v2, :cond_1

    invoke-static {}, Lcom/flyersoft/tools/A;->oneLineTagHeight()I

    move-result v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_1
    add-int/2addr p0, v0

    const/4 v0, 0x1

    if-ge p0, v0, :cond_2

    const/4 p0, 0x1

    .line 941
    :cond_2
    invoke-static {}, Lcom/flyersoft/tools/A;->getPageHeight()I

    move-result v2

    div-int v2, p0, v2

    invoke-static {}, Lcom/flyersoft/tools/A;->getPageHeight()I

    move-result v3

    rem-int/2addr p0, v3

    if-nez p0, :cond_3

    goto :goto_2

    :cond_3
    const/4 v1, 0x1

    :goto_2
    add-int/2addr v2, v1

    return v2
.end method

.method public static updateMRTextViewForPageCount(Lcom/flyersoft/staticlayout/MRTextView;I)V
    .locals 7

    .line 899
    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    if-nez v0, :cond_0

    goto :goto_1

    .line 901
    :cond_0
    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v0, p1}, Lcom/flyersoft/books/BaseEBook;->get(I)Lcom/flyersoft/books/BaseEBook$Chapter;

    move-result-object v4

    .line 905
    iget-object v2, v4, Lcom/flyersoft/books/BaseEBook$Chapter;->css_body_id:Ljava/lang/String;

    iget-object v3, v4, Lcom/flyersoft/books/BaseEBook$Chapter;->css_body_class:Ljava/lang/String;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string v1, "body"

    invoke-static/range {v1 .. v6}, Lcom/flyersoft/staticlayout/MyHtml;->getClassStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/flyersoft/books/BaseEBook$Chapter;Ljava/util/ArrayList;Ljava/util/ArrayList;)Lcom/flyersoft/components/CSS$Style;

    move-result-object p1

    .line 906
    iget-object v0, v4, Lcom/flyersoft/books/BaseEBook$Chapter;->css_body_style:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 907
    new-instance v0, Lcom/flyersoft/components/CSS$Style;

    invoke-direct {v0, p1}, Lcom/flyersoft/components/CSS$Style;-><init>(Lcom/flyersoft/components/CSS$Style;)V

    .line 908
    iget-object p1, v4, Lcom/flyersoft/books/BaseEBook$Chapter;->css_body_style:Ljava/lang/String;

    invoke-virtual {v0, p1}, Lcom/flyersoft/components/CSS$Style;->scanPropertyForStyle(Ljava/lang/String;)V

    move-object p1, v0

    :cond_1
    const/high16 v0, 0x3f800000    # 1.0f

    if-eqz p1, :cond_2

    .line 912
    iget-object v1, p1, Lcom/flyersoft/components/CSS$Style;->fontFace:Ljava/lang/String;

    .line 913
    iget v2, p1, Lcom/flyersoft/components/CSS$Style;->fontSize:F

    const/4 v3, 0x0

    cmpl-float v2, v2, v3

    if-lez v2, :cond_3

    .line 914
    iget v0, p1, Lcom/flyersoft/components/CSS$Style;->fontSize:F

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    .line 919
    :cond_3
    :goto_0
    iput v0, v4, Lcom/flyersoft/books/BaseEBook$Chapter;->pageCountFontSize:F

    .line 920
    sget p1, Lcom/flyersoft/tools/A;->fontSize:F

    mul-float v0, v0, p1

    .line 921
    invoke-static {}, Lcom/flyersoft/tools/A;->getDualFontSizeAdd()F

    move-result p1

    add-float/2addr v0, p1

    .line 923
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->getPaint()Landroid/text/TextPaint;

    move-result-object p1

    sget-object v2, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v2}, Lcom/flyersoft/staticlayout/MRTextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/text/TextPaint;->set(Landroid/text/TextPaint;)V

    .line 924
    invoke-virtual {p0, v0}, Lcom/flyersoft/staticlayout/MRTextView;->setTextSize(F)V

    if-eqz v1, :cond_4

    .line 925
    sget-boolean p1, Lcom/flyersoft/tools/A;->useCssFont:Z

    if-eqz p1, :cond_4

    sget-object p1, Lcom/flyersoft/tools/A;->forceCssFontName:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_4

    const/4 p1, 0x1

    const/4 v0, 0x0

    .line 926
    invoke-static {v1, v0, v0, p1}, Lcom/flyersoft/tools/A;->getTypeFace2(Ljava/lang/String;IZZ)Landroid/graphics/Typeface;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/flyersoft/staticlayout/MRTextView;->setTypeface(Landroid/graphics/Typeface;)V

    :cond_4
    :goto_1
    return-void
.end method


# virtual methods
.method public clearChapterSpanned(I)V
    .locals 1

    if-ltz p1, :cond_0

    .line 497
    invoke-virtual {p0}, Lcom/flyersoft/books/BaseEBook;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 498
    invoke-virtual {p0}, Lcom/flyersoft/books/BaseEBook;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/books/BaseEBook$Chapter;

    const/4 v0, 0x0

    iput-object v0, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->spanned:[Ljava/lang/CharSequence;

    :cond_0
    return-void
.end method

.method public clearMyHtmlCacheIfLowMemory(Z)Z
    .locals 2

    .line 486
    invoke-virtual {p0}, Lcom/flyersoft/books/BaseEBook;->isInited()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    if-nez p1, :cond_2

    const/16 p1, 0x28

    .line 488
    invoke-static {p1}, Lcom/flyersoft/tools/A;->isLowMemory(I)Z

    move-result p1

    if-eqz p1, :cond_1

    goto :goto_0

    :cond_1
    return v1

    .line 489
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/flyersoft/books/BaseEBook;->getChapters()Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/books/BaseEBook$Chapter;

    const/4 v1, 0x0

    .line 490
    iput-object v1, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->spanned:[Ljava/lang/CharSequence;

    goto :goto_1

    :cond_3
    const/4 p1, 0x1

    return p1
.end method

.method public get(I)Lcom/flyersoft/books/BaseEBook$Chapter;
    .locals 1

    .line 57
    invoke-virtual {p0}, Lcom/flyersoft/books/BaseEBook;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/books/BaseEBook$Chapter;

    return-object p1
.end method

.method public getAudioContent(I)Ljava/lang/String;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public getAudioFile(I)Ljava/lang/String;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public getAudioIdList(I)Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/books/BaseEBook$AudioId;",
            ">;"
        }
    .end annotation

    const/4 p1, 0x0

    return-object p1
.end method

.method public abstract getAuthor()Ljava/lang/String;
.end method

.method public abstract getBookName()Ljava/lang/String;
.end method

.method public abstract getCacheFilename(Landroid/net/Uri;)Ljava/lang/String;
.end method

.method public getChapterMyHtmlAndCacheIt(ILjava/lang/String;ILjava/util/ArrayList;)Ljava/lang/CharSequence;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/CharSequence;"
        }
    .end annotation

    .line 385
    invoke-virtual {p0}, Lcom/flyersoft/books/BaseEBook;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/books/BaseEBook$Chapter;

    .line 386
    iget-object v1, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->spanned:[Ljava/lang/CharSequence;

    if-eqz v1, :cond_1

    iget-object v1, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->spanned:[Ljava/lang/CharSequence;

    array-length v1, v1

    add-int/lit8 v2, p3, 0x1

    if-lt v1, v2, :cond_1

    iget-object v1, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->spanned:[Ljava/lang/CharSequence;

    aget-object v1, v1, p3

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    move v5, p3

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v7, 0x0

    move-object v2, p0

    move v3, p1

    move-object v4, p2

    move v5, p3

    move-object v6, p4

    .line 387
    invoke-direct/range {v2 .. v7}, Lcom/flyersoft/books/BaseEBook;->createMyHtmlCache(ILjava/lang/String;ILjava/util/ArrayList;Z)V

    .line 388
    :goto_1
    iget-object p1, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->spanned:[Ljava/lang/CharSequence;

    aget-object p1, p1, v5

    return-object p1
.end method

.method public getChapterMyHtmlCache(II)Ljava/lang/CharSequence;
    .locals 2

    .line 392
    invoke-virtual {p0}, Lcom/flyersoft/books/BaseEBook;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/books/BaseEBook$Chapter;

    .line 393
    iget-object v0, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->spanned:[Ljava/lang/CharSequence;

    if-eqz v0, :cond_1

    iget-object v0, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->spanned:[Ljava/lang/CharSequence;

    array-length v0, v0

    add-int/lit8 v1, p2, 0x1

    if-lt v0, v1, :cond_1

    iget-object v0, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->spanned:[Ljava/lang/CharSequence;

    aget-object v0, v0, p2

    if-nez v0, :cond_0

    goto :goto_0

    .line 395
    :cond_0
    iget-object p1, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->spanned:[Ljava/lang/CharSequence;

    aget-object p1, p1, p2

    return-object p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public abstract getChapterText(I)Ljava/lang/String;
.end method

.method public abstract getChapters()Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/books/BaseEBook$Chapter;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getCoverFile()Ljava/lang/String;
.end method

.method public getCurPageInTotal()I
    .locals 3

    .line 202
    sget v0, Lcom/flyersoft/tools/A;->lastChapter:I

    sget v1, Lcom/flyersoft/tools/A;->lastSplitIndex:I

    invoke-static {}, Lcom/flyersoft/books/BaseEBook;->getEbookCurPageInChapter()I

    move-result v2

    invoke-virtual {p0, v0, v1, v2}, Lcom/flyersoft/books/BaseEBook;->getCurPageInTotal(III)I

    move-result v0

    return v0
.end method

.method public getCurPageInTotal(III)I
    .locals 4

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v1, p1, :cond_0

    .line 207
    invoke-virtual {p0}, Lcom/flyersoft/books/BaseEBook;->getChapters()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v1, v3, :cond_0

    .line 208
    invoke-virtual {p0}, Lcom/flyersoft/books/BaseEBook;->getChapters()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/books/BaseEBook$Chapter;

    iget v3, v3, Lcom/flyersoft/books/BaseEBook$Chapter;->pageCount:I

    add-int/2addr v2, v3

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    if-lez p2, :cond_1

    .line 210
    invoke-virtual {p0}, Lcom/flyersoft/books/BaseEBook;->getChapters()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/books/BaseEBook$Chapter;

    .line 211
    iget-object v1, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->splitPageCount:[I

    if-eqz v1, :cond_1

    iget-object v1, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->splitPageCount:[I

    array-length v1, v1

    if-le v1, p2, :cond_1

    :goto_1
    if-ge v0, p2, :cond_1

    .line 213
    iget-object v1, p1, Lcom/flyersoft/books/BaseEBook$Chapter;->splitPageCount:[I

    aget v1, v1, v0

    add-int/2addr v2, v1

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    if-lez p3, :cond_2

    add-int/2addr v2, p3

    :cond_2
    return v2
.end method

.method public abstract getDrawableFromSource(Ljava/lang/String;I)Landroid/graphics/drawable/Drawable;
.end method

.method public abstract getFontFile(Ljava/lang/String;I)Ljava/lang/String;
.end method

.method public abstract getFootNote(Ljava/lang/String;)Lcom/flyersoft/books/BaseEBook$FootNote;
.end method

.method public abstract getImageFileList()Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getImageGetter()Landroid/text/Html$ImageGetter;
.end method

.method public abstract getMyImageGetter()Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;
.end method

.method public abstract getPriorTextLength(I)I
.end method

.method public abstract getSingleFileText(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public getTotalPageCount(Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;)I
    .locals 1

    const/4 v0, 0x0

    .line 228
    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/books/BaseEBook;->getTotalPageCount(Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;Z)I

    move-result p1

    return p1
.end method

.method public getTotalPageCount(Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;Z)I
    .locals 5

    if-eqz p2, :cond_0

    .line 233
    iput-object p1, p0, Lcom/flyersoft/books/BaseEBook;->savedPageCountOnDone:Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;

    .line 235
    :cond_0
    iget-boolean p2, p0, Lcom/flyersoft/books/BaseEBook;->isCountAboutPagesWorking:Z

    const/4 v0, -0x1

    if-eqz p2, :cond_2

    .line 236
    invoke-static {}, Lcom/flyersoft/books/BaseEBook;->getPageCountParams()Ljava/lang/String;

    move-result-object p2

    iget-object v1, p0, Lcom/flyersoft/books/BaseEBook;->pageCountParams:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_1

    .line 237
    invoke-virtual {p0, p1}, Lcom/flyersoft/books/BaseEBook;->resetPageCount(Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;)V

    :cond_1
    return v0

    .line 243
    :cond_2
    invoke-virtual {p0}, Lcom/flyersoft/books/BaseEBook;->getChapters()Ljava/util/ArrayList;

    move-result-object p2

    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/books/BaseEBook$Chapter;

    .line 244
    iget v4, v3, Lcom/flyersoft/books/BaseEBook$Chapter;->pageCount:I

    if-nez v4, :cond_3

    const/4 p2, 0x1

    .line 253
    iput-boolean p2, p0, Lcom/flyersoft/books/BaseEBook;->isCountAccuratePageWorking:Z

    iput-boolean p2, p0, Lcom/flyersoft/books/BaseEBook;->isCountAboutPagesWorking:Z

    .line 254
    invoke-static {}, Lcom/flyersoft/books/BaseEBook;->getPageCountParams()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/flyersoft/books/BaseEBook;->pageCountParams:Ljava/lang/String;

    .line 256
    new-instance v2, Lcom/flyersoft/staticlayout/MRTextView;

    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/flyersoft/staticlayout/MRTextView;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/flyersoft/books/BaseEBook;->pageCountTv:Lcom/flyersoft/staticlayout/MRTextView;

    .line 257
    invoke-virtual {v2, v1}, Lcom/flyersoft/staticlayout/MRTextView;->setLeft(I)V

    .line 258
    iget-object v1, p0, Lcom/flyersoft/books/BaseEBook;->pageCountTv:Lcom/flyersoft/staticlayout/MRTextView;

    sget-object v2, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v2}, Lcom/flyersoft/staticlayout/MRTextView;->getWidth()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/flyersoft/staticlayout/MRTextView;->setRight(I)V

    .line 260
    new-instance v1, Lcom/flyersoft/books/BaseEBook$2;

    invoke-direct {v1, p0, p1}, Lcom/flyersoft/books/BaseEBook$2;-><init>(Lcom/flyersoft/books/BaseEBook;Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;)V

    .line 303
    invoke-virtual {v1, p2}, Ljava/lang/Thread;->setPriority(I)V

    .line 304
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    return v0

    .line 248
    :cond_3
    iget v3, v3, Lcom/flyersoft/books/BaseEBook$Chapter;->pageCount:I

    add-int/2addr v2, v3

    goto :goto_0

    :cond_4
    return v2
.end method

.method public abstract getTotalSize()J
.end method

.method public abstract isDrmProtected()Z
.end method

.method public abstract isHtml()Z
.end method

.method public abstract isInited()Z
.end method

.method public resetPageCount(Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;)V
    .locals 3

    .line 168
    invoke-virtual {p0}, Lcom/flyersoft/books/BaseEBook;->isInited()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 170
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/books/BaseEBook;->waitingForReset:Z

    if-eqz v0, :cond_1

    goto :goto_0

    .line 172
    :cond_1
    invoke-static {}, Lcom/flyersoft/books/BaseEBook;->getPageCountParams()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/books/BaseEBook;->pageCountParams:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    :goto_0
    return-void

    :cond_2
    const/4 v0, 0x1

    .line 176
    iput-boolean v0, p0, Lcom/flyersoft/books/BaseEBook;->waitingForReset:Z

    .line 177
    iget-boolean v1, p0, Lcom/flyersoft/books/BaseEBook;->isCountAccuratePageWorking:Z

    if-eqz v1, :cond_3

    .line 178
    iput-boolean v0, p0, Lcom/flyersoft/books/BaseEBook;->forceStopPageCount:Z

    .line 179
    new-instance v1, Lcom/flyersoft/books/BaseEBook$1;

    invoke-direct {v1, p0, p1}, Lcom/flyersoft/books/BaseEBook$1;-><init>(Lcom/flyersoft/books/BaseEBook;Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;)V

    .line 191
    invoke-virtual {v1, v0}, Ljava/lang/Thread;->setPriority(I)V

    .line 192
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    return-void

    :cond_3
    const/4 v0, 0x0

    .line 194
    iput-boolean v0, p0, Lcom/flyersoft/books/BaseEBook;->waitingForReset:Z

    .line 195
    invoke-virtual {p0}, Lcom/flyersoft/books/BaseEBook;->getChapters()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/books/BaseEBook$Chapter;

    .line 196
    iput v0, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->pageCount:I

    goto :goto_1

    .line 197
    :cond_4
    invoke-virtual {p0, p1}, Lcom/flyersoft/books/BaseEBook;->getTotalPageCount(Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;)I

    return-void
.end method

.method public abstract showChaptersAtBegin()Z
.end method
