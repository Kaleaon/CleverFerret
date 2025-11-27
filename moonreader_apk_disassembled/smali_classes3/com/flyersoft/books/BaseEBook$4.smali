.class Lcom/flyersoft/books/BaseEBook$4;
.super Ljava/lang/Thread;
.source "BaseEBook.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/books/BaseEBook;->getTxtUnReadWordCount(Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;Z)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$from:I

.field final synthetic val$onDone:Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;

.field final synthetic val$whole:Z


# direct methods
.method constructor <init>(IZLcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;)V
    .locals 0

    .line 602
    iput p1, p0, Lcom/flyersoft/books/BaseEBook$4;->val$from:I

    iput-boolean p2, p0, Lcom/flyersoft/books/BaseEBook$4;->val$whole:Z

    iput-object p3, p0, Lcom/flyersoft/books/BaseEBook$4;->val$onDone:Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .line 605
    const-string v0, "*used time 2): "

    const-string v1, ", "

    const-string v2, ", wordCount: "

    const/4 v3, 0x1

    sput-boolean v3, Lcom/flyersoft/books/BaseEBook;->isGetWordsWoking:Z

    .line 607
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    const/4 v6, 0x0

    .line 609
    :try_start_0
    sget-boolean v7, Lcom/flyersoft/tools/A;->isAsiaLanguage:Z

    .line 610
    iget v8, p0, Lcom/flyersoft/books/BaseEBook$4;->val$from:I
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v9, 0x0

    :goto_0
    :try_start_1
    sget-object v10, Lcom/flyersoft/tools/A;->txts:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-ge v8, v10, :cond_2

    .line 611
    sget-object v10, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v10}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v10
    :try_end_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-eqz v10, :cond_0

    .line 635
    sput-boolean v6, Lcom/flyersoft/books/BaseEBook;->isGetWordsWoking:Z

    .line 636
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    :goto_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    sub-long/2addr v6, v4

    invoke-virtual {v3, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->saveMemoryLog(Ljava/lang/String;)Ljava/lang/String;

    return-void

    .line 613
    :cond_0
    :try_start_2
    sget-object v10, Lcom/flyersoft/tools/A;->txtWordCount:[Ljava/lang/Integer;

    aget-object v10, v10, v8

    if-nez v10, :cond_1

    .line 614
    sget-object v10, Lcom/flyersoft/tools/A;->txtWordCount:[Ljava/lang/Integer;

    sget-object v11, Lcom/flyersoft/tools/A;->txts:Ljava/util/ArrayList;

    invoke-virtual {v11, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-static {v11, v7}, Lcom/flyersoft/tools/T;->getWordsCount(Ljava/lang/String;Z)I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v10, v8

    .line 615
    :cond_1
    sget-object v10, Lcom/flyersoft/tools/A;->txtWordCount:[Ljava/lang/Integer;

    aget-object v10, v10, v8

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    add-int/2addr v9, v10

    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 617
    :cond_2
    iget-boolean v8, p0, Lcom/flyersoft/books/BaseEBook$4;->val$whole:Z

    if-nez v8, :cond_3

    iget-object v8, p0, Lcom/flyersoft/books/BaseEBook$4;->val$onDone:Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;

    if-eqz v8, :cond_3

    .line 618
    invoke-interface {v8, v9}, Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;->refresh(I)V

    .line 619
    :cond_3
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "*used time 1): "

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v10

    sub-long/2addr v10, v4

    invoke-virtual {v8, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/flyersoft/tools/A;->saveMemoryLog(Ljava/lang/String;)Ljava/lang/String;

    .line 621
    iget-boolean v8, p0, Lcom/flyersoft/books/BaseEBook$4;->val$whole:Z

    if-nez v8, :cond_4

    invoke-static {}, Lcom/flyersoft/tools/A;->isLowestMemory()Z

    move-result v8

    if-nez v8, :cond_7

    .line 622
    :cond_4
    iget v8, p0, Lcom/flyersoft/books/BaseEBook$4;->val$from:I

    sub-int/2addr v8, v3

    :goto_2
    if-ltz v8, :cond_7

    .line 623
    sget-object v3, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v3
    :try_end_2
    .catch Ljava/lang/OutOfMemoryError; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz v3, :cond_5

    .line 635
    sput-boolean v6, Lcom/flyersoft/books/BaseEBook;->isGetWordsWoking:Z

    .line 636
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 625
    :cond_5
    :try_start_3
    sget-object v3, Lcom/flyersoft/tools/A;->txtWordCount:[Ljava/lang/Integer;

    aget-object v3, v3, v8

    if-nez v3, :cond_6

    .line 626
    sget-object v3, Lcom/flyersoft/tools/A;->txtWordCount:[Ljava/lang/Integer;

    sget-object v10, Lcom/flyersoft/tools/A;->txts:Ljava/util/ArrayList;

    invoke-virtual {v10, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-static {v10, v7}, Lcom/flyersoft/tools/T;->getWordsCount(Ljava/lang/String;Z)I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v3, v8

    :cond_6
    add-int/lit8 v8, v8, -0x1

    goto :goto_2

    .line 628
    :cond_7
    iget-boolean v3, p0, Lcom/flyersoft/books/BaseEBook$4;->val$whole:Z

    if-eqz v3, :cond_8

    iget-object v3, p0, Lcom/flyersoft/books/BaseEBook$4;->val$onDone:Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;

    if-eqz v3, :cond_8

    .line 629
    invoke-interface {v3, v9}, Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;->refresh(I)V
    :try_end_3
    .catch Ljava/lang/OutOfMemoryError; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 635
    :cond_8
    sput-boolean v6, Lcom/flyersoft/books/BaseEBook;->isGetWordsWoking:Z

    .line 636
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    goto/16 :goto_1

    :catch_0
    move-exception v3

    goto :goto_3

    :catch_1
    move-exception v3

    goto :goto_4

    :catchall_0
    move-exception v3

    const/4 v9, 0x0

    goto :goto_6

    :catch_2
    move-exception v3

    const/4 v9, 0x0

    .line 633
    :goto_3
    :try_start_4
    invoke-static {v3}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 635
    sput-boolean v6, Lcom/flyersoft/books/BaseEBook;->isGetWordsWoking:Z

    .line 636
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    goto :goto_5

    :catch_3
    move-exception v3

    const/4 v9, 0x0

    .line 631
    :goto_4
    :try_start_5
    invoke-static {v3}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 635
    sput-boolean v6, Lcom/flyersoft/books/BaseEBook;->isGetWordsWoking:Z

    .line 636
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    :goto_5
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    sub-long/2addr v6, v4

    invoke-virtual {v3, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->saveMemoryLog(Ljava/lang/String;)Ljava/lang/String;

    return-void

    :catchall_1
    move-exception v3

    .line 635
    :goto_6
    sput-boolean v6, Lcom/flyersoft/books/BaseEBook;->isGetWordsWoking:Z

    .line 636
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v7

    sub-long/2addr v7, v4

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->saveMemoryLog(Ljava/lang/String;)Ljava/lang/String;

    .line 637
    throw v3
.end method
