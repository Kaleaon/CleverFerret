.class public Lcom/flyersoft/moonreaderp/PrefSearch;
.super Lcom/flyersoft/moonreaderp/PrefOptions;
.source "PrefSearch.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/moonreaderp/PrefSearch$OnClickResult;,
        Lcom/flyersoft/moonreaderp/PrefSearch$ResultAdapter;,
        Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;
    }
.end annotation


# static fields
.field public static colorBlue:Ljava/lang/String; = null

.field public static colorRed:Ljava/lang/String; = null

.field public static firstVisibleItem:I = 0x0

.field public static lastClickIndex:I = -0x1

.field public static results:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private MAX_RESULTS:I

.field public et:Lcom/flyersoft/views/ClearableEditText;

.field focusHandler:Landroid/os/Handler;

.field historyB:Landroid/widget/ImageButton;

.field inSearching:Z

.field list:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

.field onClickResult:Lcom/flyersoft/moonreaderp/PrefSearch$OnClickResult;

.field optionsB:Landroid/widget/ImageButton;

.field pl:I

.field progressBar:Landroid/widget/ProgressBar;

.field punc:Ljava/lang/String;

.field s_tag1:Ljava/lang/String;

.field s_tag2:Ljava/lang/String;

.field searchB:Landroid/widget/ImageButton;

.field searchHandler:Landroid/os/Handler;

.field senderSearchHandler:Landroid/os/Handler;

.field senderSearchKey:Ljava/lang/String;

.field startSearchTime:J


# direct methods
.method static bridge synthetic -$$Nest$fgetMAX_RESULTS(Lcom/flyersoft/moonreaderp/PrefSearch;)I
    .locals 0

    iget p0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->MAX_RESULTS:I

    return p0
.end method

.method static bridge synthetic -$$Nest$mcolorBlue(Lcom/flyersoft/moonreaderp/PrefSearch;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefSearch;->colorBlue()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mgetResultFromHtml(Lcom/flyersoft/moonreaderp/PrefSearch;Ljava/util/regex/Pattern;Ljava/lang/String;IILjava/util/ArrayList;)V
    .locals 0

    invoke-direct/range {p0 .. p5}, Lcom/flyersoft/moonreaderp/PrefSearch;->getResultFromHtml(Ljava/util/regex/Pattern;Ljava/lang/String;IILjava/util/ArrayList;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mshowSearchButton(Lcom/flyersoft/moonreaderp/PrefSearch;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefSearch;->showSearchButton(Z)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefSearch$OnClickResult;Ljava/lang/String;)V
    .locals 1

    .line 53
    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->search_result:I

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;-><init>(Landroid/content/Context;I)V

    .line 136
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefSearch$2;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, p0, v0}, Lcom/flyersoft/moonreaderp/PrefSearch$2;-><init>(Lcom/flyersoft/moonreaderp/PrefSearch;Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->senderSearchHandler:Landroid/os/Handler;

    .line 144
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefSearch$3;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, p0, v0}, Lcom/flyersoft/moonreaderp/PrefSearch$3;-><init>(Lcom/flyersoft/moonreaderp/PrefSearch;Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->focusHandler:Landroid/os/Handler;

    const/16 p1, 0x1388

    .line 179
    iput p1, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->MAX_RESULTS:I

    .line 468
    const-string p1, ",.;?\"\':(){}[]!\uff0c\u3002\uff1b\uff02\u201d\u201c\uff1a\uff1f\uff08\uff09\u3001\uff01\n"

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->punc:Ljava/lang/String;

    .line 471
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "<b><font color="

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefSearch;->colorRed()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ">"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->s_tag1:Ljava/lang/String;

    .line 472
    const-string p1, "</font></b>"

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->s_tag2:Ljava/lang/String;

    .line 473
    sget-boolean p1, Lcom/flyersoft/tools/A;->isAsiaLanguage:Z

    const/16 v0, 0x3c

    if-eqz p1, :cond_1

    sget-boolean p1, Lcom/flyersoft/tools/A;->isTablet:Z

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/16 v0, 0x1e

    goto :goto_0

    :cond_1
    sget-boolean p1, Lcom/flyersoft/tools/A;->isTablet:Z

    if-eqz p1, :cond_2

    const/16 v0, 0x64

    :cond_2
    :goto_0
    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->pl:I

    .line 491
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefSearch$5;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, p0, v0}, Lcom/flyersoft/moonreaderp/PrefSearch$5;-><init>(Lcom/flyersoft/moonreaderp/PrefSearch;Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->searchHandler:Landroid/os/Handler;

    .line 54
    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->onClickResult:Lcom/flyersoft/moonreaderp/PrefSearch$OnClickResult;

    .line 55
    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->senderSearchKey:Ljava/lang/String;

    return-void
.end method

.method private adjustResultsColor(Ljava/util/ArrayList;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;",
            ">;)V"
        }
    .end annotation

    .line 126
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefSearch;->colorRed:Ljava/lang/String;

    if-eqz v0, :cond_2

    sget-object v0, Lcom/flyersoft/moonreaderp/PrefSearch;->colorBlue:Ljava/lang/String;

    if-nez v0, :cond_0

    goto :goto_1

    .line 128
    :cond_0
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefSearch;->colorRed()Ljava/lang/String;

    move-result-object v0

    .line 129
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefSearch;->colorBlue()Ljava/lang/String;

    move-result-object v1

    .line 130
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;

    .line 131
    iget-object v3, v2, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->html:Ljava/lang/String;

    sget-object v4, Lcom/flyersoft/moonreaderp/PrefSearch;->colorRed:Ljava/lang/String;

    invoke-virtual {v3, v4, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lcom/flyersoft/moonreaderp/PrefSearch;->colorBlue:Ljava/lang/String;

    invoke-virtual {v3, v4, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->html:Ljava/lang/String;

    goto :goto_0

    .line 132
    :cond_1
    sput-object v0, Lcom/flyersoft/moonreaderp/PrefSearch;->colorRed:Ljava/lang/String;

    .line 133
    sput-object v1, Lcom/flyersoft/moonreaderp/PrefSearch;->colorBlue:Ljava/lang/String;

    :cond_2
    :goto_1
    return-void
.end method

.method private cleanStringBeginEnd(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 459
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, -0x1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-lez v0, :cond_1

    sget-object v0, Lcom/flyersoft/tools/A;->PUNCTUATIONS:Ljava/lang/String;

    .line 460
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-virtual {v0, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ne v0, v1, :cond_0

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->isSpaceChar(C)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 461
    :cond_0
    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 462
    :cond_1
    :goto_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_3

    sget-object v0, Lcom/flyersoft/tools/A;->PUNCTUATIONS:Ljava/lang/String;

    .line 463
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    sub-int/2addr v4, v3

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-virtual {v0, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ne v0, v1, :cond_2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    sub-int/2addr v0, v3

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->isSpaceChar(C)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 464
    :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    sub-int/2addr v0, v3

    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_3
    return-object p1
.end method

.method private colorBlue()Ljava/lang/String;
    .locals 1

    .line 351
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_1

    sget-boolean v0, Lcom/flyersoft/tools/A;->amoled:Z

    if-eqz v0, :cond_0

    const-string v0, "#90caf9"

    return-object v0

    :cond_0
    const-string v0, "#bbdefb"

    return-object v0

    :cond_1
    const-string v0, "#0d47a1"

    return-object v0
.end method

.method private colorRed()Ljava/lang/String;
    .locals 1

    .line 355
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_1

    sget-boolean v0, Lcom/flyersoft/tools/A;->amoled:Z

    if-eqz v0, :cond_0

    const-string v0, "#FF8888"

    return-object v0

    :cond_0
    const-string v0, "#FFAAAA"

    return-object v0

    :cond_1
    const-string v0, "#FF0000"

    return-object v0
.end method

.method private getResultFromHtml(Ljava/util/regex/Pattern;Ljava/lang/String;IILjava/util/ArrayList;)V
    .locals 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/regex/Pattern;",
            "Ljava/lang/String;",
            "II",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move/from16 v2, p3

    move/from16 v3, p4

    move-object/from16 v4, p5

    .line 359
    sget-boolean v5, Lcom/flyersoft/tools/A;->searchBackwardOnly:Z

    if-eqz v5, :cond_0

    sget v5, Lcom/flyersoft/tools/A;->lastChapter:I

    if-gt v2, v5, :cond_14

    sget v5, Lcom/flyersoft/tools/A;->lastChapter:I

    if-ne v2, v5, :cond_0

    sget v5, Lcom/flyersoft/tools/A;->lastSplitIndex:I

    if-le v3, v5, :cond_0

    goto/16 :goto_c

    .line 363
    :cond_0
    sget-boolean v5, Lcom/flyersoft/tools/A;->searchForwardOnly:Z

    if-eqz v5, :cond_1

    sget v5, Lcom/flyersoft/tools/A;->lastChapter:I

    if-lt v2, v5, :cond_14

    sget v5, Lcom/flyersoft/tools/A;->lastChapter:I

    if-ne v2, v5, :cond_1

    sget v5, Lcom/flyersoft/tools/A;->lastSplitIndex:I

    if-ge v3, v5, :cond_1

    goto/16 :goto_c

    .line 369
    :cond_1
    invoke-virtual/range {p1 .. p2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    const/4 v7, 0x0

    .line 370
    :goto_0
    invoke-virtual {v5}, Ljava/util/regex/Matcher;->find()Z

    move-result v8

    if-eqz v8, :cond_13

    .line 371
    sget-boolean v8, Lcom/flyersoft/tools/A;->searchBackwardOnly:Z

    if-eqz v8, :cond_2

    sget v8, Lcom/flyersoft/tools/A;->lastChapter:I

    if-ne v2, v8, :cond_2

    sget v8, Lcom/flyersoft/tools/A;->lastSplitIndex:I

    if-ne v3, v8, :cond_2

    .line 372
    invoke-virtual {v5}, Ljava/util/regex/Matcher;->start()I

    move-result v8

    int-to-long v8, v8

    sget-wide v10, Lcom/flyersoft/tools/A;->lastPosition:J

    cmp-long v12, v8, v10

    if-lez v12, :cond_2

    goto :goto_0

    .line 375
    :cond_2
    sget-boolean v8, Lcom/flyersoft/tools/A;->searchForwardOnly:Z

    if-eqz v8, :cond_3

    sget v8, Lcom/flyersoft/tools/A;->lastChapter:I

    if-ne v2, v8, :cond_3

    sget v8, Lcom/flyersoft/tools/A;->lastSplitIndex:I

    if-ne v3, v8, :cond_3

    .line 376
    invoke-virtual {v5}, Ljava/util/regex/Matcher;->start()I

    move-result v8

    int-to-long v8, v8

    sget-wide v10, Lcom/flyersoft/tools/A;->lastPosition:J

    cmp-long v12, v8, v10

    if-gez v12, :cond_3

    goto :goto_0

    .line 379
    :cond_3
    iget-boolean v8, v0, Lcom/flyersoft/moonreaderp/PrefSearch;->inSearching:Z

    if-nez v8, :cond_4

    goto/16 :goto_c

    .line 380
    :cond_4
    sget-object v8, Lcom/flyersoft/moonreaderp/PrefSearch;->results:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    iget v9, v0, Lcom/flyersoft/moonreaderp/PrefSearch;->MAX_RESULTS:I

    if-le v8, v9, :cond_5

    goto/16 :goto_b

    .line 382
    :cond_5
    new-instance v7, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;

    invoke-direct {v7}, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;-><init>()V

    .line 383
    invoke-virtual {v5}, Ljava/util/regex/Matcher;->start()I

    move-result v8

    iput v8, v7, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->start:I

    .line 384
    invoke-virtual {v5}, Ljava/util/regex/Matcher;->end()I

    move-result v8

    iput v8, v7, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->end:I

    .line 385
    iget v8, v7, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->start:I

    const/16 v9, 0x50

    if-le v8, v9, :cond_6

    iget v8, v7, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->start:I

    sub-int/2addr v8, v9

    goto :goto_1

    :cond_6
    iget v8, v7, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->start:I

    :goto_1
    int-to-long v8, v8

    iput-wide v8, v7, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->position:J

    .line 386
    iput v2, v7, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->chapter:I

    .line 387
    iput v3, v7, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->splitIndex:I

    .line 389
    invoke-virtual {v5}, Ljava/util/regex/Matcher;->start()I

    move-result v8

    iget v9, v0, Lcom/flyersoft/moonreaderp/PrefSearch;->pl:I

    if-le v8, v9, :cond_7

    invoke-virtual {v5}, Ljava/util/regex/Matcher;->start()I

    move-result v8

    iget v9, v0, Lcom/flyersoft/moonreaderp/PrefSearch;->pl:I

    sub-int/2addr v8, v9

    goto :goto_2

    :cond_7
    const/4 v8, 0x0

    .line 390
    :goto_2
    invoke-virtual {v5}, Ljava/util/regex/Matcher;->end()I

    move-result v9

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v10

    iget v11, v0, Lcom/flyersoft/moonreaderp/PrefSearch;->pl:I

    sub-int/2addr v10, v11

    if-ge v9, v10, :cond_8

    invoke-virtual {v5}, Ljava/util/regex/Matcher;->end()I

    move-result v9

    iget v10, v0, Lcom/flyersoft/moonreaderp/PrefSearch;->pl:I

    add-int/2addr v9, v10

    goto :goto_3

    :cond_8
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v9

    .line 391
    :goto_3
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5}, Ljava/util/regex/Matcher;->start()I

    move-result v11

    invoke-virtual {v1, v8, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v11, v0, Lcom/flyersoft/moonreaderp/PrefSearch;->s_tag1:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 392
    invoke-virtual {v5}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v11, v0, Lcom/flyersoft/moonreaderp/PrefSearch;->s_tag2:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 393
    invoke-virtual {v5}, Ljava/util/regex/Matcher;->end()I

    move-result v11

    invoke-virtual {v1, v11, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    iput-object v10, v7, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->html:Ljava/lang/String;

    .line 396
    invoke-static {}, Lcom/flyersoft/tools/A;->getBookType()I

    move-result v10

    const/4 v11, 0x1

    if-ne v10, v11, :cond_a

    .line 397
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-lez v10, :cond_9

    .line 398
    sget v10, Lcom/flyersoft/tools/A;->maxHtmlChapterSize:I

    mul-int v10, v10, v3

    int-to-long v12, v10

    sget v10, Lcom/flyersoft/tools/A;->maxHtmlChapterSize:I

    int-to-long v14, v10

    move-wide/from16 v16, v12

    iget-wide v11, v7, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->position:J

    mul-long v14, v14, v11

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v10

    int-to-long v10, v10

    div-long/2addr v14, v10

    add-long v12, v16, v14

    .line 399
    sget-object v10, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v10}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getBookLength()J

    move-result-wide v10

    goto/16 :goto_8

    .line 401
    :cond_9
    iget-wide v12, v7, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->position:J

    .line 402
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v10

    int-to-long v10, v10

    goto/16 :goto_8

    :cond_a
    const/4 v10, -0x1

    .line 405
    invoke-static {v10}, Lcom/flyersoft/books/BaseEBook;->getBookCharCountIfComplete(I)I

    move-result v10

    int-to-long v10, v10

    const-wide/16 v12, 0x0

    cmp-long v14, v10, v12

    if-lez v14, :cond_f

    .line 407
    sget-object v12, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v12, v2}, Lcom/flyersoft/books/BaseEBook;->get(I)Lcom/flyersoft/books/BaseEBook$Chapter;

    move-result-object v12

    iget v12, v12, Lcom/flyersoft/books/BaseEBook$Chapter;->pure_text_length:I

    .line 408
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v13

    if-lez v13, :cond_d

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    .line 410
    :goto_4
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v13, v6, :cond_c

    if-ge v13, v3, :cond_b

    .line 412
    invoke-virtual {v4, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    add-int/2addr v14, v6

    .line 413
    :cond_b
    invoke-virtual {v4, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    add-int/2addr v15, v6

    add-int/lit8 v13, v13, 0x1

    goto :goto_4

    :cond_c
    mul-int v14, v14, v12

    .line 415
    div-int/2addr v14, v15

    int-to-long v13, v14

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    mul-int v12, v12, v6

    div-int/2addr v12, v15

    int-to-long v3, v12

    move-wide/from16 v17, v3

    iget-wide v3, v7, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->position:J

    mul-long v3, v3, v17

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v6

    move-wide/from16 v17, v3

    int-to-long v3, v6

    div-long v3, v17, v3

    add-long/2addr v13, v3

    goto :goto_5

    :cond_d
    int-to-long v3, v12

    .line 417
    iget-wide v12, v7, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->position:J

    mul-long v3, v3, v12

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v6

    int-to-long v12, v6

    div-long v13, v3, v12

    :goto_5
    if-nez v2, :cond_e

    move-wide v3, v10

    goto :goto_6

    :cond_e
    add-int/lit8 v3, v2, -0x1

    .line 418
    invoke-static {v3}, Lcom/flyersoft/books/BaseEBook;->getBookCharCountIfComplete(I)I

    move-result v3

    int-to-long v3, v3

    :goto_6
    sub-long v3, v10, v3

    add-long/2addr v3, v13

    move-wide v12, v3

    goto :goto_8

    .line 421
    :cond_f
    invoke-virtual/range {p5 .. p5}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_10

    .line 422
    sget v3, Lcom/flyersoft/tools/A;->maxHtmlChapterSize:I

    mul-int v3, v3, p4

    int-to-long v3, v3

    iget-wide v10, v7, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->position:J

    add-long/2addr v3, v10

    goto :goto_7

    .line 424
    :cond_10
    sget-object v3, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v3, v2}, Lcom/flyersoft/books/BaseEBook;->get(I)Lcom/flyersoft/books/BaseEBook$Chapter;

    move-result-object v3

    iget-wide v3, v3, Lcom/flyersoft/books/BaseEBook$Chapter;->size:J

    iget-wide v10, v7, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->position:J

    mul-long v3, v3, v10

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v6

    int-to-long v10, v6

    div-long/2addr v3, v10

    .line 425
    :goto_7
    sget-object v6, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v6, v2}, Lcom/flyersoft/books/BaseEBook;->getPriorTextLength(I)I

    move-result v6

    int-to-long v10, v6

    add-long v12, v3, v10

    .line 426
    sget-object v3, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getBookLength()J

    move-result-wide v10

    .line 430
    :goto_8
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, v7, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->html:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/util/regex/Matcher;->start()I

    move-result v6

    sub-int/2addr v6, v8

    .line 431
    invoke-virtual {v5}, Ljava/util/regex/Matcher;->end()I

    move-result v8

    sub-int/2addr v9, v8

    iget-object v8, v0, Lcom/flyersoft/moonreaderp/PrefSearch;->s_tag1:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    add-int/2addr v9, v8

    iget-object v8, v0, Lcom/flyersoft/moonreaderp/PrefSearch;->s_tag2:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    add-int/2addr v9, v8

    .line 430
    invoke-virtual {v0, v4, v6, v9}, Lcom/flyersoft/moonreaderp/PrefSearch;->getSentence(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 432
    sget-object v4, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    const-string v6, "<font color="

    if-nez v4, :cond_11

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-direct {v0}, Lcom/flyersoft/moonreaderp/PrefSearch;->colorBlue()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ">("

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v12, v13, v10, v11}, Lcom/flyersoft/tools/T;->getPercentStr(JJ)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ")</font>"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_9

    .line 434
    :cond_11
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 433
    invoke-direct {v0}, Lcom/flyersoft/moonreaderp/PrefSearch;->colorBlue()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ">(<b>"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v12, v13, v10, v11}, Lcom/flyersoft/tools/T;->getPercentStr(JJ)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "</b> <small>"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v6, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    .line 434
    invoke-virtual {v6, v2}, Lcom/flyersoft/books/BaseEBook;->get(I)Lcom/flyersoft/books/BaseEBook$Chapter;

    move-result-object v6

    iget-object v6, v6, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "</small></font>)"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    :goto_9
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v7, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->html:Ljava/lang/String;

    .line 435
    iget-boolean v3, v0, Lcom/flyersoft/moonreaderp/PrefSearch;->inSearching:Z

    if-eqz v3, :cond_12

    .line 436
    iget-object v3, v0, Lcom/flyersoft/moonreaderp/PrefSearch;->searchHandler:Landroid/os/Handler;

    const/4 v4, 0x1

    invoke-virtual {v3, v4, v7}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_a

    :cond_12
    const/4 v4, 0x1

    :goto_a
    move/from16 v3, p4

    move-object/from16 v4, p5

    const/4 v7, 0x1

    goto/16 :goto_0

    :cond_13
    :goto_b
    if-eqz v7, :cond_14

    .line 438
    iget-boolean v1, v0, Lcom/flyersoft/moonreaderp/PrefSearch;->inSearching:Z

    if-eqz v1, :cond_14

    .line 439
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PrefSearch;->searchHandler:Landroid/os/Handler;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    :cond_14
    :goto_c
    return-void
.end method

.method private initView()V
    .locals 5

    .line 78
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->phTitle:Landroid/widget/TextView;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->search:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 79
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->phExit:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 81
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->listSv:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->list:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    .line 82
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-nez v0, :cond_0

    .line 83
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->list:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    const v1, -0x777778

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->smallThumbColor:Ljava/lang/Integer;

    .line 85
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->searchB:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->searchB:Landroid/widget/ImageButton;

    .line 86
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->historyB:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->historyB:Landroid/widget/ImageButton;

    .line 87
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->optionB:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->optionsB:Landroid/widget/ImageButton;

    .line 89
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->ProgressBar01:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->progressBar:Landroid/widget/ProgressBar;

    .line 90
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->keyEdit:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/views/ClearableEditText;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->et:Lcom/flyersoft/views/ClearableEditText;

    .line 92
    sget v0, Lcom/flyersoft/tools/A;->cornerRadius:I

    const/4 v1, 0x0

    if-lez v0, :cond_1

    .line 93
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->footerSub:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    sget v2, Lcom/flyersoft/tools/A;->cornerRadius:I

    div-int/lit8 v2, v2, 0x4

    const/high16 v3, 0x40000000    # 2.0f

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    sget v4, Lcom/flyersoft/tools/A;->cornerRadius:I

    div-int/lit8 v4, v4, 0x4

    invoke-virtual {v0, v2, v3, v4, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 95
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->searchB:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 96
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->historyB:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 97
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->optionsB:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 98
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->progressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0, p0}, Landroid/widget/ProgressBar;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 99
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->et:Lcom/flyersoft/views/ClearableEditText;

    sget-object v2, Lcom/flyersoft/tools/A;->lastSearchKey:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/flyersoft/views/ClearableEditText;->setText(Ljava/lang/CharSequence;)V

    .line 101
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->et:Lcom/flyersoft/views/ClearableEditText;

    invoke-virtual {v0}, Lcom/flyersoft/views/ClearableEditText;->setSingleLine()V

    .line 102
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->et:Lcom/flyersoft/views/ClearableEditText;

    const/4 v2, 0x3

    invoke-virtual {v0, v2}, Lcom/flyersoft/views/ClearableEditText;->setImeOptions(I)V

    .line 103
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->et:Lcom/flyersoft/views/ClearableEditText;

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefSearch$1;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/PrefSearch$1;-><init>(Lcom/flyersoft/moonreaderp/PrefSearch;)V

    invoke-virtual {v0, v2}, Lcom/flyersoft/views/ClearableEditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    const/4 v0, 0x1

    .line 111
    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/PrefSearch;->showSearchButton(Z)V

    .line 112
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->senderSearchKey:Ljava/lang/String;

    if-eqz v2, :cond_2

    .line 113
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->senderSearchHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void

    .line 115
    :cond_2
    sget-object v2, Lcom/flyersoft/moonreaderp/PrefSearch;->results:Ljava/util/ArrayList;

    if-eqz v2, :cond_4

    .line 116
    invoke-direct {p0, v2}, Lcom/flyersoft/moonreaderp/PrefSearch;->adjustResultsColor(Ljava/util/ArrayList;)V

    .line 117
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->list:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v2}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v2

    if-nez v2, :cond_3

    .line 118
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->list:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    new-instance v3, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefSearch;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4, v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {v2, v3}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 119
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->list:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefSearch$ResultAdapter;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/flyersoft/moonreaderp/PrefSearch$ResultAdapter;-><init>(Lcom/flyersoft/moonreaderp/PrefSearch;Lcom/flyersoft/moonreaderp/PrefSearch-IA;)V

    invoke-virtual {v0, v2}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setAdapter(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;)V

    .line 120
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->focusHandler:Landroid/os/Handler;

    const-wide/16 v2, 0x32

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    :cond_4
    return-void
.end method

.method private showSearchButton(Z)V
    .locals 4

    .line 674
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->optionsB:Landroid/widget/ImageButton;

    const/4 v1, 0x0

    const/16 v2, 0x8

    if-eqz p1, :cond_0

    const/4 v3, 0x0

    goto :goto_0

    :cond_0
    const/16 v3, 0x8

    :goto_0
    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 676
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->progressBar:Landroid/widget/ProgressBar;

    if-nez p1, :cond_1

    goto :goto_1

    :cond_1
    const/16 v1, 0x8

    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 677
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->et:Lcom/flyersoft/views/ClearableEditText;

    invoke-virtual {v0, p1}, Lcom/flyersoft/views/ClearableEditText;->setEnabled(Z)V

    return-void
.end method

.method private stopSearch()V
    .locals 1

    const/4 v0, 0x0

    .line 488
    iput-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->inSearching:Z

    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 0

    .line 164
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefSearch;->stopSearch()V

    .line 165
    invoke-super {p0}, Lcom/flyersoft/moonreaderp/PrefOptions;->cancel()V

    return-void
.end method

.method public dismiss()V
    .locals 0

    .line 158
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefSearch;->stopSearch()V

    .line 159
    invoke-super {p0}, Lcom/flyersoft/moonreaderp/PrefOptions;->dismiss()V

    return-void
.end method

.method protected firstPunc(Ljava/lang/String;)I
    .locals 4

    const/4 v0, 0x0

    .line 475
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, -0x1

    if-ge v0, v1, :cond_1

    .line 476
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->punc:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-eq v1, v2, :cond_0

    return v0

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return v2
.end method

.method protected getSentence(Ljava/lang/String;II)Ljava/lang/String;
    .locals 6

    .line 443
    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/PrefSearch;->firstPunc(Ljava/lang/String;)I

    move-result v0

    .line 444
    const-string v1, " "

    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    add-int/lit8 v3, p2, -0xa

    if-le v0, v3, :cond_1

    .line 445
    :cond_0
    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    :cond_1
    const/16 v3, 0xf

    if-eq v0, v2, :cond_2

    add-int/lit8 v4, p2, -0xa

    if-le v0, v4, :cond_4

    :cond_2
    if-ge p2, v3, :cond_3

    const/4 p2, 0x0

    const/4 v0, 0x0

    goto :goto_0

    :cond_3
    sub-int/2addr p2, v3

    move v0, p2

    .line 448
    :cond_4
    :goto_0
    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/PrefSearch;->lastPunc(Ljava/lang/String;)I

    move-result p2

    const/16 v4, 0xa

    if-eq p2, v2, :cond_5

    sub-int v5, p2, p3

    if-ge v5, v4, :cond_6

    .line 450
    :cond_5
    invoke-virtual {p1, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result p2

    :cond_6
    if-eq p2, v2, :cond_7

    sub-int v1, p2, p3

    if-ge v1, v4, :cond_9

    .line 452
    :cond_7
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    sub-int/2addr p2, p3

    if-ge p2, v3, :cond_8

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    goto :goto_1

    :cond_8
    add-int/2addr p3, v3

    move p2, p3

    .line 453
    :cond_9
    :goto_1
    invoke-virtual {p1, v0, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    const-string p2, "\n\u3000*"

    const-string p3, ""

    invoke-virtual {p1, p2, p3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "\n|\t"

    invoke-virtual {p1, p2, p3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 454
    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefSearch;->cleanStringBeginEnd(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 455
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\u2026"

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected lastPunc(Ljava/lang/String;)I
    .locals 4

    .line 481
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_0
    const/4 v1, -0x1

    if-ltz v0, :cond_1

    .line 482
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->punc:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-eq v2, v1, :cond_0

    return v0

    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_1
    return v1
.end method

.method public onClick(Landroid/view/View;)V
    .locals 8

    .line 581
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->phExit:Landroid/view/View;

    if-ne p1, v0, :cond_0

    .line 582
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->startSearchTime:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x3e8

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    .line 583
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefSearch;->cancel()V

    .line 586
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->searchB:Landroid/widget/ImageButton;

    if-ne p1, v0, :cond_2

    .line 588
    :try_start_0
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefSearch;->getCurrentFocus()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 589
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefSearch;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "input_method"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 590
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefSearch;->getCurrentFocus()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 592
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    const/4 v0, 0x0

    .line 594
    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/PrefSearch;->showSearchButton(Z)V

    .line 595
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefSearch;->startSearch()V

    .line 598
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->progressBar:Landroid/widget/ProgressBar;

    if-ne p1, v0, :cond_3

    const/4 v0, 0x1

    .line 599
    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/PrefSearch;->showSearchButton(Z)V

    .line 600
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefSearch;->stopSearch()V

    .line 603
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->historyB:Landroid/widget/ImageButton;

    if-ne p1, v0, :cond_4

    .line 604
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefSearch;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefSearch;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->history:I

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Lcom/flyersoft/tools/A;->getSearchHistory()Ljava/util/ArrayList;

    move-result-object v3

    new-instance v4, Lcom/flyersoft/moonreaderp/PrefSearch$6;

    invoke-direct {v4, p0}, Lcom/flyersoft/moonreaderp/PrefSearch$6;-><init>(Lcom/flyersoft/moonreaderp/PrefSearch;)V

    new-instance v5, Lcom/flyersoft/moonreaderp/PrefSearch$7;

    invoke-direct {v5, p0}, Lcom/flyersoft/moonreaderp/PrefSearch$7;-><init>(Lcom/flyersoft/moonreaderp/PrefSearch;)V

    new-instance v6, Lcom/flyersoft/moonreaderp/PrefSearch$8;

    invoke-direct {v6, p0}, Lcom/flyersoft/moonreaderp/PrefSearch$8;-><init>(Lcom/flyersoft/moonreaderp/PrefSearch;)V

    invoke-static/range {v1 .. v6}, Lcom/flyersoft/tools/RemoveHistory;->removeHistory(Landroid/content/Context;Ljava/lang/String;Ljava/util/ArrayList;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;)V

    .line 627
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->optionsB:Landroid/widget/ImageButton;

    if-ne p1, v0, :cond_5

    .line 628
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefSearch;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->search_options:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    .line 629
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->backwardcb:I

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Landroid/widget/CheckBox;

    .line 630
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->forwardcb:I

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Landroid/widget/CheckBox;

    .line 631
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->casecb:I

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Landroid/widget/CheckBox;

    .line 632
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->wholecb:I

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Landroid/widget/CheckBox;

    .line 633
    sget-boolean v0, Lcom/flyersoft/tools/A;->searchBackwardOnly:Z

    invoke-virtual {v4, v0}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 634
    sget-boolean v0, Lcom/flyersoft/tools/A;->searchForwardOnly:Z

    invoke-virtual {v5, v0}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 635
    sget-boolean v0, Lcom/flyersoft/tools/A;->searchCaseSensitive:Z

    invoke-virtual {v6, v0}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 636
    sget-boolean v0, Lcom/flyersoft/tools/A;->searchWholeWord:Z

    invoke-virtual {v7, v0}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 638
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefSearch$9;

    invoke-direct {v0, p0, v5}, Lcom/flyersoft/moonreaderp/PrefSearch$9;-><init>(Lcom/flyersoft/moonreaderp/PrefSearch;Landroid/widget/CheckBox;)V

    invoke-virtual {v4, v0}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 645
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefSearch$10;

    invoke-direct {v0, p0, v4}, Lcom/flyersoft/moonreaderp/PrefSearch$10;-><init>(Lcom/flyersoft/moonreaderp/PrefSearch;Landroid/widget/CheckBox;)V

    invoke-virtual {v5, v0}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 653
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefSearch;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->search_options:I

    .line 655
    invoke-virtual {v0, v2}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 656
    invoke-virtual {v0, p1}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->search:I

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefSearch$11;

    move-object v3, p0

    invoke-direct/range {v2 .. v7}, Lcom/flyersoft/moonreaderp/PrefSearch$11;-><init>(Lcom/flyersoft/moonreaderp/PrefSearch;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;)V

    .line 657
    invoke-virtual {p1, v0, v2}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const/high16 v0, 0x1040000

    .line 667
    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    .line 668
    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    :cond_5
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 60
    invoke-super {p0, p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->onCreate(Landroid/os/Bundle;)V

    .line 61
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefSearch;->initView()V

    .line 62
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefSearch;->initParams()Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const v0, 0x3f666666    # 0.9f

    .line 63
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setDim(F)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const/4 v0, -0x2

    .line 64
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setHeight(I)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const/4 v0, 0x0

    .line 65
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setFullscreen(Z)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    .line 66
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setHideExit(Z)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    .line 67
    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->done()V

    .line 69
    sget-object p1, Lcom/flyersoft/moonreaderp/PrefSearch;->results:Ljava/util/ArrayList;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 70
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefSearch;->getWindow()Landroid/view/Window;

    move-result-object p1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->et:Lcom/flyersoft/views/ClearableEditText;

    invoke-static {p1, v0}, Lcom/flyersoft/tools/A;->showKeyboard(Landroid/view/Window;Landroid/widget/EditText;)V

    :cond_0
    return-void
.end method

.method public startSearch()V
    .locals 5

    .line 182
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->et:Lcom/flyersoft/views/ClearableEditText;

    invoke-virtual {v0}, Lcom/flyersoft/views/ClearableEditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/tools/A;->lastSearchKey:Ljava/lang/String;

    .line 183
    sget-object v0, Lcom/flyersoft/tools/A;->lastSearchKey:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 184
    invoke-direct {p0, v1}, Lcom/flyersoft/moonreaderp/PrefSearch;->showSearchButton(Z)V

    return-void

    .line 187
    :cond_0
    sget-object v0, Lcom/flyersoft/tools/A;->lastSearchKey:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->saveSearchKey(Ljava/lang/String;)V

    .line 188
    iput-boolean v1, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->inSearching:Z

    .line 189
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/flyersoft/moonreaderp/PrefSearch;->results:Ljava/util/ArrayList;

    .line 190
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->list:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v0

    const/4 v2, 0x0

    if-nez v0, :cond_1

    .line 191
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->list:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    new-instance v3, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefSearch;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4, v1, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {v0, v3}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 192
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->list:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefSearch$ResultAdapter;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3}, Lcom/flyersoft/moonreaderp/PrefSearch$ResultAdapter;-><init>(Lcom/flyersoft/moonreaderp/PrefSearch;Lcom/flyersoft/moonreaderp/PrefSearch-IA;)V

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setAdapter(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;)V

    .line 194
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefSearch;->colorRed()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/moonreaderp/PrefSearch;->colorRed:Ljava/lang/String;

    .line 195
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefSearch;->colorBlue()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/moonreaderp/PrefSearch;->colorBlue:Ljava/lang/String;

    .line 196
    sput v2, Lcom/flyersoft/moonreaderp/PrefSearch;->lastClickIndex:I

    .line 197
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch;->startSearchTime:J

    .line 199
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefSearch$4;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefSearch$4;-><init>(Lcom/flyersoft/moonreaderp/PrefSearch;)V

    .line 347
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefSearch$4;->start()V

    return-void
.end method
