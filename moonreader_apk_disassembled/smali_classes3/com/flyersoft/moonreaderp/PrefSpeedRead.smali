.class public Lcom/flyersoft/moonreaderp/PrefSpeedRead;
.super Lcom/flyersoft/moonreaderp/PrefOptions;
.source "PrefSpeedRead.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/moonreaderp/PrefSpeedRead$OnExit;
    }
.end annotation


# static fields
.field public static END_PUNC:Ljava/lang/String; = ",.;?:!\uff0c\u3002\uff1b\uff02\u201d\uff1a\uff1f\uff09\u3001\uff01\u2019"

.field public static MAX_SIZE:I = 0x64

.field public static MAX_WMP:I = 0x7d0

.field public static MAX_WORD:I = 0xa

.field public static MIN_SIZE:I = 0xa

.field public static MIN_WMP:I = 0x32

.field public static MIN_WORD:I = 0x1

.field public static PAUSE_PUNC:Ljava/lang/String; = ".;?!\u3002\uff1b\uff1f\uff01"


# instance fields
.field bottom:Landroid/view/View;

.field changed:Z

.field closeIv:Landroid/view/View;

.field content:Landroid/view/View;

.field contentTop:I

.field index:I

.field iv:Landroid/widget/ImageView;

.field lastPos:J

.field leftTv:Landroid/widget/TextView;

.field list:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field onExit:Lcom/flyersoft/moonreaderp/PrefSpeedRead$OnExit;

.field pos:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field progress:Landroid/widget/TextView;

.field readTime:J

.field readWord:J

.field rightTv:Landroid/widget/TextView;

.field running:Z

.field sizeSeek:Lcom/flyersoft/views/CustomSeek;

.field speedHandler:Landroid/os/Handler;

.field speedSeek:Lcom/flyersoft/views/CustomSeek;

.field startPos:J

.field startTime:J

.field touched:Z

.field wordSeek:Lcom/flyersoft/views/CustomSeek;

.field wordTv:Landroid/widget/TextView;


# direct methods
.method static bridge synthetic -$$Nest$mgetNextWord(Lcom/flyersoft/moonreaderp/PrefSpeedRead;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->getNextWord()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$msetTextSize(Lcom/flyersoft/moonreaderp/PrefSpeedRead;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->setTextSize(I)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mswitchContronVisible(Lcom/flyersoft/moonreaderp/PrefSpeedRead;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->switchContronVisible()V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefSpeedRead$OnExit;)V
    .locals 1

    .line 45
    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->speed_read:I

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;-><init>(Landroid/content/Context;I)V

    .line 337
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefSpeedRead$10;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, p0, v0}, Lcom/flyersoft/moonreaderp/PrefSpeedRead$10;-><init>(Lcom/flyersoft/moonreaderp/PrefSpeedRead;Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->speedHandler:Landroid/os/Handler;

    .line 46
    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->onExit:Lcom/flyersoft/moonreaderp/PrefSpeedRead$OnExit;

    return-void
.end method

.method private getNextWord()Ljava/lang/String;
    .locals 9

    .line 405
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->list:Ljava/util/ArrayList;

    iget v1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->index:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 409
    :goto_0
    iget v1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->index:I

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->list:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    const/4 v4, 0x0

    if-ge v1, v2, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-gt v1, v3, :cond_1

    .line 410
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;->isLeftQuote(C)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 411
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->list:Ljava/util/ArrayList;

    iget v2, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->index:I

    add-int/2addr v2, v3

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 412
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->list:Ljava/util/ArrayList;

    iget v2, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->index:I

    invoke-virtual {v1, v2, v0}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 413
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->list:Ljava/util/ArrayList;

    iget v2, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->index:I

    add-int/2addr v2, v3

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 414
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->pos:Ljava/util/ArrayList;

    iget v2, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->index:I

    add-int/2addr v2, v3

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 415
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "changed: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->index:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-array v2, v3, [Ljava/lang/Object;

    aput-object v1, v2, v4

    invoke-static {v2}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    goto :goto_0

    .line 420
    :cond_1
    :goto_1
    iget v1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->index:I

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->list:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    sub-int/2addr v2, v3

    if-ge v1, v2, :cond_5

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->list:Ljava/util/ArrayList;

    iget v2, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->index:I

    add-int/2addr v2, v3

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_5

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->list:Ljava/util/ArrayList;

    iget v2, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->index:I

    add-int/2addr v2, v3

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x4

    if-ge v1, v2, :cond_5

    .line 421
    sget-object v1, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->END_PUNC:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v5, ""

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->list:Ljava/util/ArrayList;

    iget v7, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->index:I

    add-int/2addr v7, v3

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v6, v4}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 423
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->list:Ljava/util/ArrayList;

    iget v2, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->index:I

    add-int/2addr v2, v3

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const/4 v2, 0x0

    .line 425
    :cond_2
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    add-int/2addr v2, v3

    .line 426
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v6

    sub-int/2addr v6, v3

    if-le v2, v6, :cond_3

    goto :goto_2

    .line 428
    :cond_3
    sget-object v6, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->END_PUNC:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 431
    :goto_2
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->list:Ljava/util/ArrayList;

    iget v6, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->index:I

    invoke-virtual {v5, v6, v0}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 432
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "changed2: "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v6, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->index:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    new-array v6, v3, [Ljava/lang/Object;

    aput-object v5, v6, v4

    invoke-static {v6}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 433
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    if-ne v2, v5, :cond_4

    .line 434
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->list:Ljava/util/ArrayList;

    iget v2, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->index:I

    add-int/2addr v2, v3

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 435
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->pos:Ljava/util/ArrayList;

    iget v2, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->index:I

    add-int/2addr v2, v3

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto/16 :goto_1

    .line 437
    :cond_4
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->list:Ljava/util/ArrayList;

    iget v5, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->index:I

    add-int/2addr v5, v3

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v5, v1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    :cond_5
    return-object v0
.end method

.method private getWordList()V
    .locals 11

    .line 448
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->list:Ljava/util/ArrayList;

    .line 449
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->pos:Ljava/util/ArrayList;

    .line 452
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v1, 0x0

    .line 455
    iput v1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->index:I

    .line 458
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdf()Z

    move-result v2

    const-wide/16 v3, -0x1

    if-eqz v2, :cond_0

    .line 459
    iget-object v2, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    sget-wide v5, Lcom/flyersoft/tools/A;->lastPosition:J

    long-to-int v6, v5

    invoke-virtual {v2, v6}, Lcom/flyersoft/books/PDFReader;->getPageText(I)Ljava/lang/String;

    move-result-object v2

    move-wide v6, v3

    goto :goto_1

    .line 460
    :cond_0
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getBookType()I

    move-result v2

    if-nez v2, :cond_2

    .line 461
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 462
    sget v5, Lcom/flyersoft/tools/A;->lastBlockIndex:I

    .line 463
    :goto_0
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    const v7, 0x7a120

    if-ge v6, v7, :cond_1

    sget-object v6, Lcom/flyersoft/tools/A;->txts:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v5, v6, :cond_1

    add-int/lit8 v6, v5, 0x1

    .line 464
    invoke-static {v5}, Lcom/flyersoft/tools/A;->getTxts2(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v5, v6

    goto :goto_0

    .line 465
    :cond_1
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 466
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getDisplayText()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->indexOf(Ljava/lang/String;)I

    move-result v2

    int-to-long v6, v2

    move-object v2, v5

    goto :goto_1

    .line 468
    :cond_2
    iget-object v2, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v2}, Lcom/flyersoft/staticlayout/MRTextView;->getText2()Ljava/lang/String;

    move-result-object v2

    .line 469
    sget-wide v6, Lcom/flyersoft/tools/A;->lastPosition:J

    .line 472
    :goto_1
    invoke-static {v2}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    return-void

    .line 474
    :cond_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    const/16 v5, 0xa

    const/16 v10, 0x20

    .line 476
    invoke-virtual {v2, v5, v10}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    const/16 v5, 0xd

    .line 477
    invoke-virtual {v2, v5, v10}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    const/16 v5, 0x9

    .line 478
    invoke-virtual {v2, v5, v10}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    .line 479
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->list:Ljava/util/ArrayList;

    iget-object v10, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->pos:Ljava/util/ArrayList;

    invoke-static {v2, v5, v10}, Lcom/flyersoft/staticlayout/MRTextView;->getWords(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    cmp-long v5, v6, v3

    if-eqz v5, :cond_5

    const/4 v3, 0x0

    .line 482
    :goto_2
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->pos:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v3, v4, :cond_5

    .line 483
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->pos:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    int-to-long v4, v4

    cmp-long v10, v4, v6

    if-ltz v10, :cond_4

    .line 484
    iput v3, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->index:I

    .line 485
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getBookType()I

    move-result v0

    if-nez v0, :cond_5

    .line 486
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->pos:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    int-to-long v3, v0

    iput-wide v3, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->lastPos:J

    iput-wide v3, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->startPos:J

    goto :goto_3

    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 491
    :cond_5
    :goto_3
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "split words time: "

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long/2addr v3, v8

    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v3, " len: "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " words: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->list:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v0, v2, v1

    invoke-static {v2}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    return-void
.end method

.method private initView()V
    .locals 5

    .line 83
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->speed:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/views/CustomSeek;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->speedSeek:Lcom/flyersoft/views/CustomSeek;

    .line 84
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->size:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/views/CustomSeek;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->sizeSeek:Lcom/flyersoft/views/CustomSeek;

    .line 85
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->word:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/views/CustomSeek;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->wordSeek:Lcom/flyersoft/views/CustomSeek;

    .line 86
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->left:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->leftTv:Landroid/widget/TextView;

    .line 87
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->text:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->wordTv:Landroid/widget/TextView;

    .line 88
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->right:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->rightTv:Landroid/widget/TextView;

    .line 89
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->close:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->closeIv:Landroid/view/View;

    .line 90
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->bottom:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->bottom:Landroid/view/View;

    .line 91
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->progress:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->progress:Landroid/widget/TextView;

    .line 92
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->iv:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->iv:Landroid/widget/ImageView;

    .line 93
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->wordLay:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->content:Landroid/view/View;

    .line 95
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->leftTv:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 96
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->wordTv:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 97
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->rightTv:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 98
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->closeIv:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 100
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->leftTv:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 101
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->rightTv:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 103
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->leftTv:Landroid/widget/TextView;

    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v1

    const v2, -0x77333334

    const v3, -0x77bbbbbc

    if-eqz v1, :cond_0

    const v1, -0x77333334

    goto :goto_0

    :cond_0
    const v1, -0x77bbbbbc

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 104
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->rightTv:Landroid/widget/TextView;

    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_1

    :cond_1
    const v2, -0x77bbbbbc

    :goto_1
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 106
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->progress:Landroid/widget/TextView;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 107
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->tts_speed:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 108
    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 109
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 110
    :cond_2
    sget v1, Lcom/flyersoft/tools/A;->speedReadWPM:I

    sget v3, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->MIN_WMP:I

    if-ge v1, v3, :cond_3

    .line 111
    sput v3, Lcom/flyersoft/tools/A;->speedReadWPM:I

    .line 112
    :cond_3
    sget v1, Lcom/flyersoft/tools/A;->speedReadWPM:I

    sget v3, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->MAX_WMP:I

    if-le v1, v3, :cond_4

    .line 113
    sput v3, Lcom/flyersoft/tools/A;->speedReadWPM:I

    .line 114
    :cond_4
    sget v1, Lcom/flyersoft/tools/A;->speedReadSize:I

    sget v3, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->MIN_SIZE:I

    if-ge v1, v3, :cond_5

    .line 115
    sput v3, Lcom/flyersoft/tools/A;->speedReadSize:I

    .line 116
    :cond_5
    sget v1, Lcom/flyersoft/tools/A;->speedReadSize:I

    sget v3, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->MAX_SIZE:I

    if-le v1, v3, :cond_6

    .line 117
    sput v3, Lcom/flyersoft/tools/A;->speedReadSize:I

    .line 118
    :cond_6
    sget v1, Lcom/flyersoft/tools/A;->speedReadWords:I

    sget v3, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->MIN_WORD:I

    if-ge v1, v3, :cond_7

    .line 119
    sput v3, Lcom/flyersoft/tools/A;->speedReadWords:I

    .line 120
    :cond_7
    sget v1, Lcom/flyersoft/tools/A;->speedReadWords:I

    sget v3, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->MAX_WORD:I

    if-le v1, v3, :cond_8

    .line 121
    sput v3, Lcom/flyersoft/tools/A;->speedReadWords:I

    .line 123
    :cond_8
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->speedSeek:Lcom/flyersoft/views/CustomSeek;

    iget-object v1, v1, Lcom/flyersoft/views/CustomSeek;->titleTv:Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " (WPM)"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 124
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->speedSeek:Lcom/flyersoft/views/CustomSeek;

    sget v1, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->MIN_WMP:I

    sget v3, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->MAX_WMP:I

    sget v4, Lcom/flyersoft/tools/A;->speedReadWPM:I

    invoke-virtual {v0, v1, v3, v4}, Lcom/flyersoft/views/CustomSeek;->init(III)V

    .line 125
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->speedSeek:Lcom/flyersoft/views/CustomSeek;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/CustomSeek;->setStep(I)V

    .line 126
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->sizeSeek:Lcom/flyersoft/views/CustomSeek;

    sget v1, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->MIN_SIZE:I

    sget v3, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->MAX_SIZE:I

    sget v4, Lcom/flyersoft/tools/A;->speedReadSize:I

    invoke-virtual {v0, v1, v3, v4}, Lcom/flyersoft/views/CustomSeek;->init(III)V

    .line 127
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->wordSeek:Lcom/flyersoft/views/CustomSeek;

    sget v1, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->MIN_WORD:I

    sget v3, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->MAX_WORD:I

    sget v4, Lcom/flyersoft/tools/A;->speedReadWords:I

    invoke-virtual {v0, v1, v3, v4}, Lcom/flyersoft/views/CustomSeek;->init(III)V

    .line 129
    sget v0, Lcom/flyersoft/tools/A;->speedReadSize:I

    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->setTextSize(I)V

    .line 130
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->wordTv:Landroid/widget/TextView;

    sget-object v1, Lcom/flyersoft/tools/A;->fontName:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/flyersoft/tools/A;->getTypeFace(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 131
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->wordTv:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    sget-boolean v1, Lcom/flyersoft/tools/A;->fontAnti:Z

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setAntiAlias(Z)V

    .line 132
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->wordTv:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    sget-boolean v1, Lcom/flyersoft/tools/A;->fontBold:Z

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setFakeBoldText(Z)V

    .line 133
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->wordTv:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    sget-boolean v1, Lcom/flyersoft/tools/A;->fontItalic:Z

    if-eqz v1, :cond_9

    const/4 v1, 0x0

    invoke-static {v1}, Lcom/flyersoft/tools/A;->getFontSkew(Ljava/lang/String;)F

    move-result v1

    goto :goto_2

    :cond_9
    const/4 v1, 0x0

    :goto_2
    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setTextSkewX(F)V

    .line 135
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->speedSeek:Lcom/flyersoft/views/CustomSeek;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefSpeedRead$1;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefSpeedRead$1;-><init>(Lcom/flyersoft/moonreaderp/PrefSpeedRead;)V

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/CustomSeek;->setOnCustomProgressChanged(Lcom/flyersoft/views/CustomSeek$OnProgressChanged;)V

    .line 142
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->sizeSeek:Lcom/flyersoft/views/CustomSeek;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefSpeedRead$2;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefSpeedRead$2;-><init>(Lcom/flyersoft/moonreaderp/PrefSpeedRead;)V

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/CustomSeek;->setOnCustomProgressChanged(Lcom/flyersoft/views/CustomSeek$OnProgressChanged;)V

    .line 149
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->wordSeek:Lcom/flyersoft/views/CustomSeek;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefSpeedRead$3;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefSpeedRead$3;-><init>(Lcom/flyersoft/moonreaderp/PrefSpeedRead;)V

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/CustomSeek;->setOnCustomProgressChanged(Lcom/flyersoft/views/CustomSeek$OnProgressChanged;)V

    .line 157
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->bottom:Landroid/view/View;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefSpeedRead$4;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefSpeedRead$4;-><init>(Lcom/flyersoft/moonreaderp/PrefSpeedRead;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 163
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->root:Landroid/view/View;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefSpeedRead$5;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefSpeedRead$5;-><init>(Lcom/flyersoft/moonreaderp/PrefSpeedRead;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private saveReadTime()V
    .locals 8

    .line 503
    iget-wide v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->startTime:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    .line 504
    iget-wide v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->readTime:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->startTime:J

    sub-long/2addr v4, v6

    add-long/2addr v0, v4

    iput-wide v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->readTime:J

    .line 505
    iput-wide v2, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->startTime:J

    :cond_0
    return-void
.end method

.method private setTextSize(I)V
    .locals 1

    .line 224
    sput p1, Lcom/flyersoft/tools/A;->speedReadSize:I

    .line 225
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->wordTv:Landroid/widget/TextView;

    int-to-float p1, p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    return-void
.end method

.method private showCenterAnimate(Z)V
    .locals 2

    .line 217
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->content:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    if-eqz p1, :cond_0

    .line 218
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->root:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p1

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->content:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    sub-int/2addr p1, v1

    const/high16 v1, 0x41b00000    # 22.0f

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    sub-int/2addr p1, v1

    div-int/lit8 p1, p1, 0x2

    goto :goto_0

    :cond_0
    iget p1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->contentTop:I

    :goto_0
    int-to-float p1, p1

    invoke-virtual {v0, p1}, Landroid/view/ViewPropertyAnimator;->y(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const-wide/16 v0, 0xc8

    .line 220
    invoke-virtual {p1, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    return-void
.end method

.method private switchContronVisible()V
    .locals 6

    .line 174
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->contentTop:I

    if-nez v0, :cond_0

    .line 175
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->content:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->contentTop:I

    :cond_0
    const/4 v0, 0x1

    .line 176
    iput-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->touched:Z

    .line 178
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->speedSeek:Lcom/flyersoft/views/CustomSeek;

    invoke-virtual {v1}, Lcom/flyersoft/views/CustomSeek;->getVisibility()I

    move-result v1

    const-wide/16 v2, 0xc8

    const/4 v4, 0x0

    if-nez v1, :cond_1

    .line 179
    new-instance v1, Landroid/view/animation/TranslateAnimation;

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->bottom:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getHeight()I

    move-result v5

    int-to-float v5, v5

    invoke-direct {v1, v4, v4, v4, v5}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    .line 180
    invoke-virtual {v1, v2, v3}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    .line 182
    new-instance v2, Lcom/flyersoft/moonreaderp/PrefSpeedRead$6;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/PrefSpeedRead$6;-><init>(Lcom/flyersoft/moonreaderp/PrefSpeedRead;)V

    invoke-virtual {v1, v2}, Landroid/view/animation/TranslateAnimation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 191
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->bottom:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 193
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->iv:Landroid/widget/ImageView;

    sget v2, Lcom/flyersoft/moonreaderp/R$drawable;->arrow_up:I

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 194
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->iv:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    const/16 v2, 0x96

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 195
    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->showCenterAnimate(Z)V

    return-void

    .line 197
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->speedSeek:Lcom/flyersoft/views/CustomSeek;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/CustomSeek;->setVisibility(I)V

    .line 198
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->sizeSeek:Lcom/flyersoft/views/CustomSeek;

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/CustomSeek;->setVisibility(I)V

    .line 199
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->wordSeek:Lcom/flyersoft/views/CustomSeek;

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/CustomSeek;->setVisibility(I)V

    .line 200
    new-instance v0, Landroid/view/animation/TranslateAnimation;

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->bottom:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getHeight()I

    move-result v5

    int-to-float v5, v5

    invoke-direct {v0, v4, v4, v5, v4}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    .line 201
    invoke-virtual {v0, v2, v3}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 203
    new-instance v2, Lcom/flyersoft/moonreaderp/PrefSpeedRead$7;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/PrefSpeedRead$7;-><init>(Lcom/flyersoft/moonreaderp/PrefSpeedRead;)V

    invoke-virtual {v0, v2}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 210
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->bottom:Landroid/view/View;

    invoke-virtual {v2, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 211
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->iv:Landroid/widget/ImageView;

    sget v2, Lcom/flyersoft/moonreaderp/R$drawable;->arrow_down:I

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 212
    invoke-direct {p0, v1}, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->showCenterAnimate(Z)V

    return-void
.end method


# virtual methods
.method public dismiss()V
    .locals 9

    .line 511
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->stopSpeedRead()V

    .line 512
    invoke-super {p0}, Lcom/flyersoft/moonreaderp/PrefOptions;->dismiss()V

    .line 513
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->onExit:Lcom/flyersoft/moonreaderp/PrefSpeedRead$OnExit;

    if-eqz v0, :cond_0

    .line 514
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->saveReadTime()V

    .line 515
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->onExit:Lcom/flyersoft/moonreaderp/PrefSpeedRead$OnExit;

    iget-boolean v2, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->changed:Z

    iget-wide v3, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->lastPos:J

    iget-wide v5, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->startPos:J

    sub-long/2addr v3, v5

    iget-wide v5, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->readTime:J

    iget-wide v7, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->readWord:J

    invoke-interface/range {v1 .. v8}, Lcom/flyersoft/moonreaderp/PrefSpeedRead$OnExit;->onExit(ZJJJ)V

    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 231
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->wordTv:Landroid/widget/TextView;

    if-ne p1, v0, :cond_1

    .line 232
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->running:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 233
    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->startSpeedRead(Z)V

    goto :goto_0

    .line 235
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->stopSpeedRead()V

    .line 238
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->leftTv:Landroid/widget/TextView;

    const-string v1, "/"

    if-ne p1, v0, :cond_3

    .line 239
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->list:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_2

    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->index:I

    if-lez v0, :cond_2

    .line 240
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->wordTv:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->list:Ljava/util/ArrayList;

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->index:I

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 241
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->progress:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget v3, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->index:I

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->list:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 244
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->rightTv:Landroid/widget/TextView;

    if-ne p1, v0, :cond_5

    .line 245
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->list:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_4

    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->index:I

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->list:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ge v0, v2, :cond_4

    .line 246
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->wordTv:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->list:Ljava/util/ArrayList;

    iget v3, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->index:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->index:I

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/CharSequence;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 247
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->progress:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget v3, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->index:I

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->list:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 250
    :cond_5
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->closeIv:Landroid/view/View;

    if-ne p1, v0, :cond_6

    .line 251
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->dismiss()V

    :cond_6
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 51
    invoke-super {p0, p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->onCreate(Landroid/os/Bundle;)V

    .line 52
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->initView()V

    .line 53
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->initParams()Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const v0, 0x3f4ccccd    # 0.8f

    .line 54
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setDim(F)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const/4 v0, 0x1

    .line 55
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setFullscreen(Z)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    .line 56
    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->done()V

    .line 58
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object p1

    const/4 v1, -0x1

    .line 59
    iput v1, p1, Landroid/view/WindowManager$LayoutParams;->height:I

    iput v1, p1, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 60
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 62
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    const/4 v1, 0x0

    invoke-static {v1, p1, v0}, Lcom/flyersoft/tools/A;->setSystemUiVisibility(Landroid/app/Activity;Landroid/view/View;Z)V

    .line 63
    invoke-static {}, Lcom/flyersoft/tools/A;->AndroidP()Z

    move-result p1

    if-eqz p1, :cond_0

    sget p1, Lcom/flyersoft/tools/A;->fitCutout:I

    if-ne p1, v0, :cond_0

    .line 64
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/A;->fitCutoutScreen(Landroid/view/Window;)V

    .line 65
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->closeIv:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-static {}, Lcom/flyersoft/tools/A;->getSysBarHeight()I

    move-result v0

    const/high16 v1, 0x41200000    # 10.0f

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    sub-int/2addr v0, v1

    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 66
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->progress:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-static {}, Lcom/flyersoft/tools/A;->getSysBarHeight()I

    move-result v0

    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 69
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->root:Landroid/view/View;

    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 70
    sget-boolean v0, Lcom/flyersoft/tools/A;->amoled:Z

    if-eqz v0, :cond_1

    sget v0, Lcom/flyersoft/tools/C;->amoledBlack:I

    goto :goto_0

    :cond_1
    sget v0, Lcom/flyersoft/tools/C;->NIGHT_MAIN_COLOR:I

    goto :goto_0

    :cond_2
    sget v0, Lcom/flyersoft/material/components/icons/R$color;->material_grey_150:I

    invoke-static {v0}, Lcom/flyersoft/tools/C;->getColor(I)I

    move-result v0

    .line 69
    :goto_0
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 71
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->content:Landroid/view/View;

    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 72
    sget-boolean v0, Lcom/flyersoft/tools/A;->amoled:Z

    if-eqz v0, :cond_3

    sget v0, Lcom/flyersoft/tools/C;->amoledBlack:I

    goto :goto_1

    :cond_3
    sget v0, Lcom/flyersoft/tools/C;->NIGHT_BROWSE_COLOR:I

    goto :goto_1

    :cond_4
    sget v0, Lcom/flyersoft/material/components/icons/R$color;->material_grey_50:I

    invoke-static {v0}, Lcom/flyersoft/tools/C;->getColor(I)I

    move-result v0

    .line 71
    :goto_1
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 73
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->root:Landroid/view/View;

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->footerSubLight:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 74
    sget-boolean v0, Lcom/flyersoft/tools/A;->amoled:Z

    if-eqz v0, :cond_5

    sget v0, Lcom/flyersoft/tools/C;->amoledBlack3:I

    goto :goto_2

    :cond_5
    sget v0, Lcom/flyersoft/tools/C;->NIGHT_BROWSE_COLOR:I

    goto :goto_2

    :cond_6
    sget v0, Lcom/flyersoft/material/components/icons/R$color;->material_grey_200:I

    invoke-static {v0}, Lcom/flyersoft/tools/C;->getColor(I)I

    move-result v0

    .line 73
    :goto_2
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    return-void
.end method

.method public startSpeedRead(Z)V
    .locals 4

    const/4 v0, 0x1

    .line 262
    iput-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->running:Z

    .line 263
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->speedSeek:Lcom/flyersoft/views/CustomSeek;

    invoke-virtual {v1}, Lcom/flyersoft/views/CustomSeek;->getCurrent()I

    move-result v1

    sput v1, Lcom/flyersoft/tools/A;->speedReadWPM:I

    .line 264
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->leftTv:Landroid/widget/TextView;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 265
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->rightTv:Landroid/widget/TextView;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    if-nez p1, :cond_0

    .line 267
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->list:Ljava/util/ArrayList;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 268
    :cond_0
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->getWordList()V

    .line 269
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->list:Ljava/util/ArrayList;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result p1

    if-eqz p1, :cond_2

    return-void

    .line 272
    :cond_2
    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->changed:Z

    if-nez p1, :cond_3

    .line 273
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->wordTv:Landroid/widget/TextView;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefSpeedRead$8;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefSpeedRead$8;-><init>(Lcom/flyersoft/moonreaderp/PrefSpeedRead;)V

    const-wide/16 v2, 0xfa0

    invoke-virtual {p1, v1, v2, v3}, Landroid/widget/TextView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 281
    :cond_3
    iput-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->changed:Z

    .line 282
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->startTime:J

    .line 284
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefSpeedRead$9;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/PrefSpeedRead$9;-><init>(Lcom/flyersoft/moonreaderp/PrefSpeedRead;)V

    .line 334
    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefSpeedRead$9;->start()V

    return-void
.end method

.method public stopSpeedRead()V
    .locals 2

    const/4 v0, 0x0

    .line 496
    iput-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->running:Z

    .line 497
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->leftTv:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 498
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->rightTv:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 499
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->saveReadTime()V

    return-void
.end method
