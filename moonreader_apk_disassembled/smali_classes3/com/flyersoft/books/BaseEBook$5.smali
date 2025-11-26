.class Lcom/flyersoft/books/BaseEBook$5;
.super Ljava/lang/Thread;
.source "BaseEBook.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/books/BaseEBook;->getPdfUnReadWordCoun(Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;Z)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$cur:I

.field final synthetic val$onDone:Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;

.field final synthetic val$whole:Z


# direct methods
.method constructor <init>(IZLcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;)V
    .locals 0

    .line 670
    iput p1, p0, Lcom/flyersoft/books/BaseEBook$5;->val$cur:I

    iput-boolean p2, p0, Lcom/flyersoft/books/BaseEBook$5;->val$whole:Z

    iput-object p3, p0, Lcom/flyersoft/books/BaseEBook$5;->val$onDone:Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 15

    .line 673
    const-string v0, "*used time 2): "

    const-string v1, ", "

    const-string v2, ", wordCount: "

    const/4 v3, 0x1

    sput-boolean v3, Lcom/flyersoft/books/BaseEBook;->isGetWordsWoking:Z

    .line 675
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    .line 676
    sget-object v6, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v6, v6, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    .line 677
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v7

    const-string v8, "pdf_words_failed"

    const/4 v9, 0x0

    invoke-virtual {v7, v8, v9}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v7

    .line 678
    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    sget-object v10, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-interface {v8, v10, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    invoke-interface {v8}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 680
    :try_start_0
    sget-boolean v8, Lcom/flyersoft/tools/A;->isAsiaLanguage:Z

    .line 681
    iget v10, p0, Lcom/flyersoft/books/BaseEBook$5;->val$cur:I
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 v11, 0x0

    :goto_0
    :try_start_1
    invoke-virtual {v6}, Lcom/flyersoft/books/PDFReader;->getPageWordCount()[Ljava/lang/Integer;

    move-result-object v12

    array-length v12, v12

    if-ge v10, v12, :cond_2

    .line 682
    sget-object v12, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v12}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v12
    :try_end_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v12, :cond_0

    .line 712
    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    sget-object v6, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-interface {v3, v6}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 713
    sput-boolean v9, Lcom/flyersoft/books/BaseEBook;->isGetWordsWoking:Z

    .line 714
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    :goto_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    sub-long/2addr v6, v4

    invoke-virtual {v3, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->saveMemoryLog(Ljava/lang/String;)Ljava/lang/String;

    return-void

    .line 684
    :cond_0
    :try_start_2
    invoke-virtual {v6}, Lcom/flyersoft/books/PDFReader;->getPageWordCount()[Ljava/lang/Integer;

    move-result-object v12

    aget-object v12, v12, v10

    if-nez v12, :cond_1

    .line 685
    sget-object v12, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v12, v10}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfGetPageText(I)Ljava/lang/String;

    move-result-object v12

    .line 686
    invoke-virtual {v6}, Lcom/flyersoft/books/PDFReader;->getPageCharCount()[Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v13, v10

    .line 687
    invoke-virtual {v6}, Lcom/flyersoft/books/PDFReader;->getPageWordCount()[Ljava/lang/Integer;

    move-result-object v13

    invoke-static {v12, v8}, Lcom/flyersoft/tools/T;->getWordsCount(Ljava/lang/String;Z)I

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v13, v10

    .line 689
    :cond_1
    invoke-virtual {v6}, Lcom/flyersoft/books/PDFReader;->getPageWordCount()[Ljava/lang/Integer;

    move-result-object v12

    aget-object v12, v12, v10

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v12

    add-int/2addr v11, v12

    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 691
    :cond_2
    iget-boolean v10, p0, Lcom/flyersoft/books/BaseEBook$5;->val$whole:Z

    if-nez v10, :cond_3

    iget-object v10, p0, Lcom/flyersoft/books/BaseEBook$5;->val$onDone:Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;

    if-eqz v10, :cond_3

    .line 692
    invoke-interface {v10, v11}, Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;->refresh(I)V

    .line 693
    :cond_3
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "*used time 1): "

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v12

    sub-long/2addr v12, v4

    invoke-virtual {v10, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/flyersoft/tools/A;->saveMemoryLog(Ljava/lang/String;)Ljava/lang/String;

    .line 695
    iget-boolean v10, p0, Lcom/flyersoft/books/BaseEBook$5;->val$whole:Z

    if-nez v10, :cond_4

    invoke-static {}, Lcom/flyersoft/tools/A;->isLowestMemory()Z

    move-result v10

    if-nez v10, :cond_7

    .line 696
    :cond_4
    iget v10, p0, Lcom/flyersoft/books/BaseEBook$5;->val$cur:I

    sub-int/2addr v10, v3

    :goto_2
    if-ltz v10, :cond_7

    .line 697
    sget-object v3, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v3
    :try_end_2
    .catch Ljava/lang/OutOfMemoryError; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v3, :cond_5

    .line 712
    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    sget-object v6, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-interface {v3, v6}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 713
    sput-boolean v9, Lcom/flyersoft/books/BaseEBook;->isGetWordsWoking:Z

    .line 714
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 699
    :cond_5
    :try_start_3
    invoke-virtual {v6}, Lcom/flyersoft/books/PDFReader;->getPageWordCount()[Ljava/lang/Integer;

    move-result-object v3

    aget-object v3, v3, v10

    if-nez v3, :cond_6

    .line 700
    sget-object v3, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v3, v10}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfGetPageText(I)Ljava/lang/String;

    move-result-object v3

    .line 701
    invoke-virtual {v6}, Lcom/flyersoft/books/PDFReader;->getPageCharCount()[Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v12, v10

    .line 702
    invoke-virtual {v6}, Lcom/flyersoft/books/PDFReader;->getPageWordCount()[Ljava/lang/Integer;

    move-result-object v12

    invoke-static {v3, v8}, Lcom/flyersoft/tools/T;->getWordsCount(Ljava/lang/String;Z)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v12, v10

    :cond_6
    add-int/lit8 v10, v10, -0x1

    goto :goto_2

    .line 705
    :cond_7
    iget-boolean v3, p0, Lcom/flyersoft/books/BaseEBook$5;->val$whole:Z

    if-eqz v3, :cond_8

    iget-object v3, p0, Lcom/flyersoft/books/BaseEBook$5;->val$onDone:Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;

    if-eqz v3, :cond_8

    .line 706
    invoke-interface {v3, v11}, Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;->refresh(I)V
    :try_end_3
    .catch Ljava/lang/OutOfMemoryError; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 712
    :cond_8
    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    sget-object v6, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-interface {v3, v6}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 713
    sput-boolean v9, Lcom/flyersoft/books/BaseEBook;->isGetWordsWoking:Z

    .line 714
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    goto/16 :goto_1

    :catchall_0
    move-exception v3

    goto :goto_3

    :catch_0
    move-exception v3

    goto :goto_4

    :catchall_1
    move-exception v3

    const/4 v11, 0x0

    .line 710
    :goto_3
    :try_start_4
    invoke-static {v3}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 712
    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    sget-object v6, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-interface {v3, v6}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 713
    sput-boolean v9, Lcom/flyersoft/books/BaseEBook;->isGetWordsWoking:Z

    .line 714
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    goto :goto_5

    :catch_1
    move-exception v3

    const/4 v11, 0x0

    .line 708
    :goto_4
    :try_start_5
    invoke-static {v3}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 712
    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    sget-object v6, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-interface {v3, v6}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 713
    sput-boolean v9, Lcom/flyersoft/books/BaseEBook;->isGetWordsWoking:Z

    .line 714
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    :goto_5
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    sub-long/2addr v6, v4

    invoke-virtual {v3, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->saveMemoryLog(Ljava/lang/String;)Ljava/lang/String;

    return-void

    :catchall_2
    move-exception v3

    .line 712
    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    sget-object v7, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-interface {v6, v7}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    invoke-interface {v6}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 713
    sput-boolean v9, Lcom/flyersoft/books/BaseEBook;->isGetWordsWoking:Z

    .line 714
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v7

    sub-long/2addr v7, v4

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->saveMemoryLog(Ljava/lang/String;)Ljava/lang/String;

    .line 715
    throw v3
.end method
