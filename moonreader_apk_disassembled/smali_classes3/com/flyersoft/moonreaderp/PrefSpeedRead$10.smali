.class Lcom/flyersoft/moonreaderp/PrefSpeedRead$10;
.super Landroid/os/Handler;
.source "PrefSpeedRead.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefSpeedRead;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefSpeedRead;Landroid/os/Looper;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 337
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$10;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 12

    .line 340
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    .line 341
    iget v1, p1, Landroid/os/Message;->what:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 342
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$10;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    invoke-virtual {p1, v2}, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->startSpeedRead(Z)V

    return-void

    .line 345
    :cond_0
    iget v1, p1, Landroid/os/Message;->what:I

    const/4 v3, 0x2

    if-ne v1, v3, :cond_1

    .line 346
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$10;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->stopSpeedRead()V

    return-void

    .line 349
    :cond_1
    iget v1, p1, Landroid/os/Message;->what:I

    const/4 v4, 0x3

    if-ne v1, v4, :cond_2

    .line 350
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pageDownToNextChapter()V

    return-void

    .line 353
    :cond_2
    iget p1, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x4

    if-ne p1, v1, :cond_5

    .line 355
    :cond_3
    invoke-virtual {v0, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfPageScroll(Z)Z

    .line 356
    iget-object p1, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    sget-wide v3, Lcom/flyersoft/tools/A;->lastPosition:J

    long-to-int v1, v3

    invoke-virtual {p1, v1}, Lcom/flyersoft/books/PDFReader;->getPageText(I)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_4

    sget-wide v3, Lcom/flyersoft/tools/A;->lastPosition:J

    iget-object p1, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    .line 357
    invoke-virtual {p1}, Lcom/flyersoft/books/PDFReader;->getPageCount()I

    move-result p1

    sub-int/2addr p1, v2

    int-to-long v5, p1

    cmp-long p1, v3, v5

    if-ltz p1, :cond_3

    .line 360
    :cond_4
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$10;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    invoke-virtual {p1, v2}, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->startSpeedRead(Z)V

    return-void

    .line 364
    :cond_5
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$10;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    iget p1, p1, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->index:I

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$10;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->list:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_c

    .line 365
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$10;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->-$$Nest$mgetNextWord(Lcom/flyersoft/moonreaderp/PrefSpeedRead;)Ljava/lang/String;

    move-result-object p1

    .line 367
    sget v0, Lcom/flyersoft/tools/A;->speedReadWords:I

    .line 368
    const-string v1, "-"

    if-le v0, v2, :cond_6

    .line 369
    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_6

    add-int/lit8 v0, v0, -0x1

    :cond_6
    const/4 v4, 0x1

    :goto_0
    const/4 v5, 0x0

    if-ge v4, v0, :cond_b

    .line 371
    iget-object v6, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$10;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    iget v6, v6, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->index:I

    iget-object v7, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$10;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    iget-object v7, v7, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->list:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    sub-int/2addr v7, v2

    if-ge v6, v7, :cond_b

    .line 372
    iget-object v6, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$10;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    iget v7, v6, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->index:I

    add-int/2addr v7, v2

    iput v7, v6, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->index:I

    .line 373
    iget-object v6, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$10;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    invoke-static {v6}, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->-$$Nest$mgetNextWord(Lcom/flyersoft/moonreaderp/PrefSpeedRead;)Ljava/lang/String;

    move-result-object v6

    .line 374
    invoke-static {p1}, Lcom/flyersoft/tools/A;->hasOtherLetter(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_7

    invoke-static {v6}, Lcom/flyersoft/tools/A;->hasOtherLetter(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 375
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v7

    if-lt v7, v0, :cond_7

    .line 376
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$10;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    iget v1, v0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->index:I

    sub-int/2addr v1, v2

    iput v1, v0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->index:I

    goto/16 :goto_2

    .line 380
    :cond_7
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_8

    invoke-virtual {v6, v5}, Ljava/lang/String;->charAt(I)C

    move-result v7

    invoke-static {v7}, Lcom/flyersoft/tools/A;->isOtherLetter(C)Z

    move-result v7

    if-eqz v7, :cond_8

    .line 381
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    .line 383
    :cond_8
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " "

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 384
    :goto_1
    iget-object v7, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$10;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    iget-wide v8, v7, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->readWord:J

    const-wide/16 v10, 0x1

    add-long/2addr v8, v10

    iput-wide v8, v7, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->readWord:J

    .line 386
    iget-object v7, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$10;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    iget-object v7, v7, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->wordTv:Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v7

    invoke-virtual {v7, p1}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    move-result v7

    .line 387
    iget-object v8, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$10;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    iget-object v8, v8, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->wordTv:Landroid/widget/TextView;

    invoke-virtual {v8}, Landroid/widget/TextView;->getWidth()I

    move-result v8

    iget-object v9, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$10;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    iget-object v9, v9, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->wordTv:Landroid/widget/TextView;

    invoke-virtual {v9}, Landroid/widget/TextView;->getPaddingLeft()I

    move-result v9

    sub-int/2addr v8, v9

    iget-object v9, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$10;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    iget-object v9, v9, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->wordTv:Landroid/widget/TextView;

    invoke-virtual {v9}, Landroid/widget/TextView;->getPaddingRight()I

    move-result v9

    sub-int/2addr v8, v9

    int-to-float v8, v8

    const/high16 v9, 0x42a00000    # 80.0f

    mul-float v8, v8, v9

    const/high16 v9, 0x42c80000    # 100.0f

    div-float/2addr v8, v9

    const/high16 v9, 0x40400000    # 3.0f

    mul-float v8, v8, v9

    cmpl-float v7, v7, v8

    if-lez v7, :cond_9

    goto :goto_2

    .line 391
    :cond_9
    invoke-virtual {v6, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_a

    add-int/lit8 v0, v0, -0x1

    :cond_a
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_0

    .line 395
    :cond_b
    :goto_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$10;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->wordTv:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 396
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$10;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->pos:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$10;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    iget v4, v4, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->index:I

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    int-to-long v6, v1

    iput-wide v6, v0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->lastPos:J

    .line 397
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$10;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    iget v0, v0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->index:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    new-array v1, v3, [Ljava/lang/Object;

    aput-object v0, v1, v5

    aput-object p1, v1, v2

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 400
    :cond_c
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$10;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->progress:Landroid/widget/TextView;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$10;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    iget v1, v1, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->index:I

    add-int/2addr v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$10;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->list:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
