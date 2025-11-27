.class Lcom/flyersoft/moonreaderp/PrefSpeedRead$9;
.super Ljava/lang/Thread;
.source "PrefSpeedRead.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefSpeedRead;->startSpeedRead(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefSpeedRead;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 284
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$9;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 289
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$9;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    iget v0, v0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->index:I

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$9;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->list:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x1

    if-ge v0, v1, :cond_5

    .line 290
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$9;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->running:Z

    if-nez v0, :cond_0

    goto/16 :goto_3

    .line 292
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$9;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->speedHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 294
    sget v0, Lcom/flyersoft/tools/A;->speedReadWPM:I

    int-to-float v0, v0

    const/high16 v1, 0x42700000    # 60.0f

    div-float/2addr v0, v1

    const/high16 v1, 0x447a0000    # 1000.0f

    div-float/2addr v1, v0

    float-to-int v0, v1

    .line 297
    sget v1, Lcom/flyersoft/tools/A;->speedReadWords:I

    if-le v1, v2, :cond_1

    .line 298
    sget v1, Lcom/flyersoft/tools/A;->speedReadWords:I

    mul-int v0, v0, v1

    goto :goto_1

    .line 300
    :cond_1
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$9;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->list:Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$9;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    iget v3, v3, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->index:I

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 301
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0xa

    if-gt v3, v4, :cond_2

    .line 302
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-le v3, v2, :cond_4

    sget-object v3, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->PAUSE_PUNC:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, ""

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    sub-int/2addr v5, v2

    invoke-virtual {v1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 303
    :cond_2
    div-int/lit8 v1, v0, 0x2

    const/16 v3, 0x64

    if-le v1, v3, :cond_3

    const/16 v1, 0x64

    :cond_3
    add-int/2addr v0, v1

    :cond_4
    :goto_1
    int-to-long v0, v0

    .line 307
    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception v0

    .line 309
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 312
    :goto_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$9;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    iget v1, v0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->index:I

    add-int/2addr v1, v2

    iput v1, v0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->index:I

    goto/16 :goto_0

    .line 317
    :cond_5
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    .line 318
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdf()Z

    move-result v1

    const/4 v3, 0x2

    if-eqz v1, :cond_7

    .line 319
    sget-wide v4, Lcom/flyersoft/tools/A;->lastPosition:J

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v0}, Lcom/flyersoft/books/PDFReader;->getPageCount()I

    move-result v0

    sub-int/2addr v0, v2

    int-to-long v0, v0

    cmp-long v2, v4, v0

    if-ltz v2, :cond_6

    .line 320
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$9;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->speedHandler:Landroid/os/Handler;

    invoke-virtual {v0, v3}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_3

    .line 322
    :cond_6
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$9;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->speedHandler:Landroid/os/Handler;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_3

    .line 324
    :cond_7
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getBookType()I

    move-result v0

    if-nez v0, :cond_8

    .line 325
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$9;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->speedHandler:Landroid/os/Handler;

    invoke-virtual {v0, v3}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_3

    .line 327
    :cond_8
    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    if-eqz v0, :cond_a

    sget v0, Lcom/flyersoft/tools/A;->lastChapter:I

    sget-object v1, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v1}, Lcom/flyersoft/books/BaseEBook;->getChapters()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    sub-int/2addr v1, v2

    if-lt v0, v1, :cond_a

    .line 328
    invoke-static {}, Lcom/flyersoft/tools/A;->noSplitHtmls()Z

    move-result v0

    if-nez v0, :cond_9

    sget v0, Lcom/flyersoft/tools/A;->lastSplitIndex:I

    sget-object v1, Lcom/flyersoft/tools/A;->splitHtmls:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    sub-int/2addr v1, v2

    if-lt v0, v1, :cond_a

    .line 329
    :cond_9
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$9;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->speedHandler:Landroid/os/Handler;

    invoke-virtual {v0, v3}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_3

    .line 331
    :cond_a
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSpeedRead$9;->this$0:Lcom/flyersoft/moonreaderp/PrefSpeedRead;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefSpeedRead;->speedHandler:Landroid/os/Handler;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    :goto_3
    return-void
.end method
