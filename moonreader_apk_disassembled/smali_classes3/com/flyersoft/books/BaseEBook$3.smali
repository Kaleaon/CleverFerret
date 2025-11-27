.class Lcom/flyersoft/books/BaseEBook$3;
.super Ljava/lang/Thread;
.source "BaseEBook.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/books/BaseEBook;->getEBookUnReadWordCount(Lcom/flyersoft/books/BaseEBook;ILcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;Z)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$ebook:Lcom/flyersoft/books/BaseEBook;

.field final synthetic val$fromChapter:I

.field final synthetic val$onDone:Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;

.field final synthetic val$whole:Z


# direct methods
.method constructor <init>(ILcom/flyersoft/books/BaseEBook;ZLcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;)V
    .locals 0

    .line 521
    iput p1, p0, Lcom/flyersoft/books/BaseEBook$3;->val$fromChapter:I

    iput-object p2, p0, Lcom/flyersoft/books/BaseEBook$3;->val$ebook:Lcom/flyersoft/books/BaseEBook;

    iput-boolean p3, p0, Lcom/flyersoft/books/BaseEBook$3;->val$whole:Z

    iput-object p4, p0, Lcom/flyersoft/books/BaseEBook$3;->val$onDone:Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .line 524
    const-string v0, "*used time 2): "

    const-string v1, ", "

    const-string v2, ", wordCount: "

    const-string v3, "mem: "

    invoke-static {v3}, Lcom/flyersoft/tools/A;->saveMemoryLog(Ljava/lang/String;)Ljava/lang/String;

    const/4 v3, 0x1

    .line 525
    sput-boolean v3, Lcom/flyersoft/books/BaseEBook;->isGetWordsWoking:Z

    .line 527
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    const/4 v6, 0x0

    .line 529
    :try_start_0
    sget-boolean v7, Lcom/flyersoft/tools/A;->isAsiaLanguage:Z

    .line 530
    iget v8, p0, Lcom/flyersoft/books/BaseEBook$3;->val$fromChapter:I
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    add-int/2addr v8, v3

    const/4 v3, 0x0

    :goto_0
    :try_start_1
    iget-object v9, p0, Lcom/flyersoft/books/BaseEBook$3;->val$ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v9}, Lcom/flyersoft/books/BaseEBook;->getChapters()Ljava/util/ArrayList;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-ge v8, v9, :cond_3

    .line 531
    sget-object v9, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v9}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v9
    :try_end_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-eqz v9, :cond_0

    .line 571
    sput-boolean v6, Lcom/flyersoft/books/BaseEBook;->isGetWordsWoking:Z

    .line 572
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    :goto_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v7

    sub-long/2addr v7, v4

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->saveMemoryLog(Ljava/lang/String;)Ljava/lang/String;

    return-void

    .line 533
    :cond_0
    :try_start_2
    iget-object v9, p0, Lcom/flyersoft/books/BaseEBook$3;->val$ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v9}, Lcom/flyersoft/books/BaseEBook;->getChapters()Ljava/util/ArrayList;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/flyersoft/books/BaseEBook$Chapter;

    .line 534
    iget v10, v9, Lcom/flyersoft/books/BaseEBook$Chapter;->pure_text_length:I

    if-gez v10, :cond_2

    .line 535
    iget-object v10, p0, Lcom/flyersoft/books/BaseEBook$3;->val$ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v10, v8}, Lcom/flyersoft/books/BaseEBook;->getChapterText(I)Ljava/lang/String;

    move-result-object v10

    .line 536
    iget-object v11, p0, Lcom/flyersoft/books/BaseEBook$3;->val$ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v11}, Lcom/flyersoft/books/BaseEBook;->isHtml()Z

    move-result v11

    if-eqz v11, :cond_1

    .line 537
    invoke-static {v10}, Lcom/flyersoft/tools/T;->html2Text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 539
    :cond_1
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v11

    iput v11, v9, Lcom/flyersoft/books/BaseEBook$Chapter;->pure_text_length:I

    .line 540
    invoke-static {v10, v7}, Lcom/flyersoft/tools/T;->getWordsCount(Ljava/lang/String;Z)I

    move-result v10

    iput v10, v9, Lcom/flyersoft/books/BaseEBook$Chapter;->word_count:I

    .line 543
    :cond_2
    iget v9, v9, Lcom/flyersoft/books/BaseEBook$Chapter;->word_count:I

    add-int/2addr v3, v9

    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 545
    :cond_3
    iget-boolean v8, p0, Lcom/flyersoft/books/BaseEBook$3;->val$whole:Z

    if-nez v8, :cond_4

    iget-object v8, p0, Lcom/flyersoft/books/BaseEBook$3;->val$onDone:Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;

    if-eqz v8, :cond_4

    .line 546
    invoke-interface {v8, v3}, Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;->refresh(I)V

    .line 547
    :cond_4
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "*used time 1): "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v9

    sub-long/2addr v9, v4

    invoke-virtual {v8, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/flyersoft/tools/A;->saveMemoryLog(Ljava/lang/String;)Ljava/lang/String;

    .line 549
    iget-boolean v8, p0, Lcom/flyersoft/books/BaseEBook$3;->val$whole:Z

    if-nez v8, :cond_5

    invoke-static {}, Lcom/flyersoft/tools/A;->isLowestMemory()Z

    move-result v8

    if-nez v8, :cond_9

    .line 550
    :cond_5
    iget v8, p0, Lcom/flyersoft/books/BaseEBook$3;->val$fromChapter:I

    :goto_2
    if-ltz v8, :cond_9

    .line 551
    sget-object v9, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v9}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v9
    :try_end_2
    .catch Ljava/lang/OutOfMemoryError; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz v9, :cond_6

    .line 571
    sput-boolean v6, Lcom/flyersoft/books/BaseEBook;->isGetWordsWoking:Z

    .line 572
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 553
    :cond_6
    :try_start_3
    iget-object v9, p0, Lcom/flyersoft/books/BaseEBook$3;->val$ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v9}, Lcom/flyersoft/books/BaseEBook;->getChapters()Ljava/util/ArrayList;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/flyersoft/books/BaseEBook$Chapter;

    .line 554
    iget v10, v9, Lcom/flyersoft/books/BaseEBook$Chapter;->pure_text_length:I

    if-gez v10, :cond_8

    .line 555
    iget-object v10, p0, Lcom/flyersoft/books/BaseEBook$3;->val$ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v10, v8}, Lcom/flyersoft/books/BaseEBook;->getChapterText(I)Ljava/lang/String;

    move-result-object v10

    .line 556
    iget-object v11, p0, Lcom/flyersoft/books/BaseEBook$3;->val$ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v11}, Lcom/flyersoft/books/BaseEBook;->isHtml()Z

    move-result v11

    if-eqz v11, :cond_7

    .line 557
    invoke-static {v10}, Lcom/flyersoft/tools/T;->html2Text(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 558
    :cond_7
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v11

    iput v11, v9, Lcom/flyersoft/books/BaseEBook$Chapter;->pure_text_length:I

    .line 559
    invoke-static {v10, v7}, Lcom/flyersoft/tools/T;->getWordsCount(Ljava/lang/String;Z)I

    move-result v10

    iput v10, v9, Lcom/flyersoft/books/BaseEBook$Chapter;->word_count:I

    :cond_8
    add-int/lit8 v8, v8, -0x1

    goto :goto_2

    .line 562
    :cond_9
    iget-boolean v7, p0, Lcom/flyersoft/books/BaseEBook$3;->val$whole:Z

    if-nez v7, :cond_a

    iget-object v7, p0, Lcom/flyersoft/books/BaseEBook$3;->val$onDone:Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;

    if-eqz v7, :cond_a

    const/4 v8, -0x1

    .line 563
    invoke-interface {v7, v8}, Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;->refresh(I)V

    .line 564
    :cond_a
    iget-boolean v7, p0, Lcom/flyersoft/books/BaseEBook$3;->val$whole:Z

    if-eqz v7, :cond_b

    iget-object v7, p0, Lcom/flyersoft/books/BaseEBook$3;->val$onDone:Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;

    if-eqz v7, :cond_b

    .line 565
    invoke-interface {v7, v3}, Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;->refresh(I)V
    :try_end_3
    .catch Ljava/lang/OutOfMemoryError; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 571
    :cond_b
    sput-boolean v6, Lcom/flyersoft/books/BaseEBook;->isGetWordsWoking:Z

    .line 572
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    goto/16 :goto_1

    :catch_0
    move-exception v7

    goto :goto_3

    :catch_1
    move-exception v7

    goto :goto_4

    :catchall_0
    move-exception v7

    const/4 v3, 0x0

    goto :goto_6

    :catch_2
    move-exception v7

    const/4 v3, 0x0

    .line 569
    :goto_3
    :try_start_4
    invoke-static {v7}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 571
    sput-boolean v6, Lcom/flyersoft/books/BaseEBook;->isGetWordsWoking:Z

    .line 572
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    goto :goto_5

    :catch_3
    move-exception v7

    const/4 v3, 0x0

    .line 567
    :goto_4
    :try_start_5
    invoke-static {v7}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 571
    sput-boolean v6, Lcom/flyersoft/books/BaseEBook;->isGetWordsWoking:Z

    .line 572
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    :goto_5
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v7

    sub-long/2addr v7, v4

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->saveMemoryLog(Ljava/lang/String;)Ljava/lang/String;

    return-void

    :catchall_1
    move-exception v7

    .line 571
    :goto_6
    sput-boolean v6, Lcom/flyersoft/books/BaseEBook;->isGetWordsWoking:Z

    .line 572
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v8

    sub-long/2addr v8, v4

    invoke-virtual {v6, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->saveMemoryLog(Ljava/lang/String;)Ljava/lang/String;

    .line 573
    throw v7
.end method
