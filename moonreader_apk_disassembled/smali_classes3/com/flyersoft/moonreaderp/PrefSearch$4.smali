.class Lcom/flyersoft/moonreaderp/PrefSearch$4;
.super Ljava/lang/Thread;
.source "PrefSearch.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefSearch;->startSearch()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefSearch;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefSearch;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 199
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 18

    move-object/from16 v1, p0

    .line 205
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-boolean v2, Lcom/flyersoft/tools/A;->searchCaseSensitive:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v3, ""

    if-eqz v2, :cond_0

    move-object v2, v3

    goto :goto_0

    :cond_0
    :try_start_1
    const-string v2, "(?i)"

    :goto_0
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-boolean v2, Lcom/flyersoft/tools/A;->searchWholeWord:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const-string v4, "\\b"

    if-eqz v2, :cond_1

    move-object v2, v4

    goto :goto_1

    :cond_1
    move-object v2, v3

    :goto_1
    :try_start_2
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Lcom/flyersoft/tools/A;->lastSearchKey:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    sget-boolean v2, Lcom/flyersoft/tools/A;->searchWholeWord:Z

    if-eqz v2, :cond_2

    move-object v3, v4

    :cond_2
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 207
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v3

    .line 208
    invoke-static {}, Lcom/flyersoft/tools/A;->getBookType()I

    move-result v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    const-string v2, "<font color="

    const/16 v4, 0x50

    const/4 v8, 0x2

    const/4 v5, 0x1

    const/4 v9, 0x0

    if-eqz v0, :cond_21

    if-eq v0, v5, :cond_1a

    const/4 v6, 0x7

    if-eq v0, v6, :cond_c

    const/16 v2, 0x64

    if-eq v0, v2, :cond_3

    goto/16 :goto_19

    :cond_3
    const/4 v5, 0x0

    .line 277
    :goto_2
    :try_start_3
    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v0}, Lcom/flyersoft/books/BaseEBook;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v5, v0, :cond_a

    .line 278
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/PrefSearch;->inSearching:Z

    if-nez v0, :cond_4

    goto/16 :goto_19

    .line 279
    :cond_4
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 280
    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v0, v5}, Lcom/flyersoft/books/BaseEBook;->getChapterText(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v7}, Lcom/flyersoft/tools/A;->adjustChapterHtml(Ljava/lang/String;Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v0

    .line 281
    invoke-static {v0}, Lcom/flyersoft/tools/A;->chineseJianFanConvert(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 282
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_7

    const/4 v6, 0x0

    .line 283
    :goto_3
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v6, v2, :cond_9

    .line 284
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-boolean v2, v2, Lcom/flyersoft/moonreaderp/PrefSearch;->inSearching:Z

    if-eqz v2, :cond_9

    sget-object v2, Lcom/flyersoft/moonreaderp/PrefSearch;->results:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    iget-object v4, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    invoke-static {v4}, Lcom/flyersoft/moonreaderp/PrefSearch;->-$$Nest$fgetMAX_RESULTS(Lcom/flyersoft/moonreaderp/PrefSearch;)I

    move-result v4

    if-le v2, v4, :cond_5

    goto :goto_5

    .line 286
    :cond_5
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    invoke-static {}, Lcom/flyersoft/tools/A;->isHtmlContent()Z

    move-result v4

    if-eqz v4, :cond_6

    .line 288
    sget-object v4, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v4, v5, v0, v6, v7}, Lcom/flyersoft/books/BaseEBook;->getChapterMyHtmlAndCacheIt(ILjava/lang/String;ILjava/util/ArrayList;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_4

    .line 289
    :cond_6
    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 286
    :goto_4
    invoke-static/range {v2 .. v7}, Lcom/flyersoft/moonreaderp/PrefSearch;->-$$Nest$mgetResultFromHtml(Lcom/flyersoft/moonreaderp/PrefSearch;Ljava/util/regex/Pattern;Ljava/lang/String;IILjava/util/ArrayList;)V

    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 292
    :cond_7
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    .line 294
    invoke-static {}, Lcom/flyersoft/tools/A;->isHtmlContent()Z

    move-result v4

    if-eqz v4, :cond_8

    sget-object v4, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v0, v9, v6}, Lcom/flyersoft/books/BaseEBook;->getChapterMyHtmlAndCacheIt(ILjava/lang/String;ILjava/util/ArrayList;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_8
    move-object v4, v0

    const/4 v6, 0x0

    .line 292
    invoke-static/range {v2 .. v7}, Lcom/flyersoft/moonreaderp/PrefSearch;->-$$Nest$mgetResultFromHtml(Lcom/flyersoft/moonreaderp/PrefSearch;Ljava/util/regex/Pattern;Ljava/lang/String;IILjava/util/ArrayList;)V

    :cond_9
    :goto_5
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_2

    .line 298
    :cond_a
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/PrefSearch;->inSearching:Z

    if-eqz v0, :cond_b

    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefSearch;->searchHandler:Landroid/os/Handler;

    invoke-virtual {v0, v8}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 299
    :cond_b
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iput-boolean v9, v0, Lcom/flyersoft/moonreaderp/PrefSearch;->inSearching:Z

    return-void

    .line 303
    :cond_c
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    .line 304
    sget-boolean v6, Lcom/flyersoft/tools/A;->searchForwardOnly:Z

    if-eqz v6, :cond_d

    invoke-virtual {v0}, Lcom/flyersoft/books/PDFReader;->getCurPageNo()I

    move-result v6

    goto :goto_6

    :cond_d
    const/4 v6, 0x0

    .line 305
    :goto_6
    sget-boolean v7, Lcom/flyersoft/tools/A;->searchBackwardOnly:Z

    if-eqz v7, :cond_e

    invoke-virtual {v0}, Lcom/flyersoft/books/PDFReader;->getCurPageNo()I

    move-result v0

    goto :goto_7

    :cond_e
    invoke-virtual {v0}, Lcom/flyersoft/books/PDFReader;->getPageCount()I

    move-result v0

    :goto_7
    if-ge v6, v0, :cond_18

    .line 307
    iget-object v7, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-boolean v7, v7, Lcom/flyersoft/moonreaderp/PrefSearch;->inSearching:Z

    if-nez v7, :cond_f

    goto/16 :goto_19

    .line 308
    :cond_f
    sget-boolean v7, Lcom/radaee/pdf/Global;->textReflow:Z

    if-eqz v7, :cond_10

    sget-object v7, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    int-to-long v10, v6

    invoke-virtual {v7, v10, v11}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfCreateReflowText(J)Ljava/lang/String;

    move-result-object v7

    goto :goto_8

    .line 309
    :cond_10
    sget-object v7, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v7, v6}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfGetPageText(I)Ljava/lang/String;

    move-result-object v7

    .line 312
    :goto_8
    invoke-virtual {v3, v7}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v10

    .line 313
    invoke-virtual {v10}, Ljava/util/regex/Matcher;->find()Z

    move-result v10

    if-eqz v10, :cond_15

    .line 314
    invoke-virtual {v3, v7}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v10

    const/4 v11, 0x0

    .line 315
    :goto_9
    invoke-virtual {v10}, Ljava/util/regex/Matcher;->find()Z

    move-result v12

    if-eqz v12, :cond_16

    .line 317
    new-instance v11, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;

    invoke-direct {v11}, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;-><init>()V

    .line 318
    invoke-virtual {v10}, Ljava/util/regex/Matcher;->start()I

    move-result v12

    iput v12, v11, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->start:I

    .line 319
    invoke-virtual {v10}, Ljava/util/regex/Matcher;->end()I

    move-result v12

    iput v12, v11, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->end:I

    .line 320
    iget v12, v11, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->start:I

    if-le v12, v4, :cond_11

    iget v12, v11, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->start:I

    sub-int/2addr v12, v4

    :goto_a
    int-to-long v12, v12

    goto :goto_b

    :cond_11
    iget v12, v11, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->start:I

    goto :goto_a

    :goto_b
    iput-wide v12, v11, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->position:J

    .line 321
    iput v6, v11, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->chapter:I

    .line 322
    invoke-virtual {v10}, Ljava/util/regex/Matcher;->start()I

    move-result v12

    iget-object v13, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget v13, v13, Lcom/flyersoft/moonreaderp/PrefSearch;->pl:I

    if-le v12, v13, :cond_12

    invoke-virtual {v10}, Ljava/util/regex/Matcher;->start()I

    move-result v12

    iget-object v13, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget v13, v13, Lcom/flyersoft/moonreaderp/PrefSearch;->pl:I

    sub-int/2addr v12, v13

    goto :goto_c

    :cond_12
    const/4 v12, 0x0

    .line 323
    :goto_c
    invoke-virtual {v10}, Ljava/util/regex/Matcher;->end()I

    move-result v13

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v14

    iget-object v15, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget v15, v15, Lcom/flyersoft/moonreaderp/PrefSearch;->pl:I

    sub-int/2addr v14, v15

    if-ge v13, v14, :cond_13

    invoke-virtual {v10}, Ljava/util/regex/Matcher;->end()I

    move-result v13

    iget-object v14, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget v14, v14, Lcom/flyersoft/moonreaderp/PrefSearch;->pl:I

    add-int/2addr v13, v14

    goto :goto_d

    :cond_13
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v13

    .line 324
    :goto_d
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10}, Ljava/util/regex/Matcher;->start()I

    move-result v15

    invoke-virtual {v7, v12, v15}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v15, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-object v15, v15, Lcom/flyersoft/moonreaderp/PrefSearch;->s_tag1:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 325
    invoke-virtual {v10}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v15, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-object v15, v15, Lcom/flyersoft/moonreaderp/PrefSearch;->s_tag2:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 326
    invoke-virtual {v10}, Ljava/util/regex/Matcher;->end()I

    move-result v15

    invoke-virtual {v7, v15, v13}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    iput-object v14, v11, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->html:Ljava/lang/String;

    .line 327
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v15, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-object v4, v11, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->html:Ljava/lang/String;

    invoke-virtual {v10}, Ljava/util/regex/Matcher;->start()I

    move-result v17

    sub-int v12, v17, v12

    .line 328
    invoke-virtual {v10}, Ljava/util/regex/Matcher;->end()I

    move-result v17

    sub-int v13, v13, v17

    iget-object v8, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-object v8, v8, Lcom/flyersoft/moonreaderp/PrefSearch;->s_tag1:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    add-int/2addr v13, v8

    iget-object v8, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-object v8, v8, Lcom/flyersoft/moonreaderp/PrefSearch;->s_tag2:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    add-int/2addr v13, v8

    .line 327
    invoke-virtual {v15, v4, v12, v13}, Lcom/flyersoft/moonreaderp/PrefSearch;->getSentence(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v14, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    .line 329
    invoke-static {v4}, Lcom/flyersoft/moonreaderp/PrefSearch;->-$$Nest$mcolorBlue(Lcom/flyersoft/moonreaderp/PrefSearch;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v14, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ">["

    invoke-virtual {v14, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v6, 0x1

    invoke-virtual {v14, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, "/"

    invoke-virtual {v14, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, "]</font>"

    invoke-virtual {v14, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v11, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->html:Ljava/lang/String;

    .line 330
    iget-object v4, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-boolean v4, v4, Lcom/flyersoft/moonreaderp/PrefSearch;->inSearching:Z

    if-eqz v4, :cond_14

    .line 331
    iget-object v4, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/PrefSearch;->searchHandler:Landroid/os/Handler;

    iget-object v8, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-object v8, v8, Lcom/flyersoft/moonreaderp/PrefSearch;->searchHandler:Landroid/os/Handler;

    invoke-virtual {v8, v5, v11}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v8

    invoke-virtual {v4, v8}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_14
    const/16 v4, 0x50

    const/4 v8, 0x2

    const/4 v11, 0x1

    goto/16 :goto_9

    :cond_15
    const/4 v11, 0x0

    :cond_16
    if-eqz v11, :cond_17

    .line 334
    iget-object v4, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-boolean v4, v4, Lcom/flyersoft/moonreaderp/PrefSearch;->inSearching:Z

    if-eqz v4, :cond_17

    .line 335
    iget-object v4, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/PrefSearch;->searchHandler:Landroid/os/Handler;

    invoke-virtual {v4, v9}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    :cond_17
    add-int/lit8 v6, v6, 0x1

    const/16 v4, 0x50

    const/4 v8, 0x2

    goto/16 :goto_7

    .line 338
    :cond_18
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/PrefSearch;->inSearching:Z

    if-eqz v0, :cond_19

    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefSearch;->searchHandler:Landroid/os/Handler;

    const/4 v2, 0x2

    invoke-virtual {v0, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 339
    :cond_19
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iput-boolean v9, v0, Lcom/flyersoft/moonreaderp/PrefSearch;->inSearching:Z

    return-void

    .line 257
    :cond_1a
    invoke-static {}, Lcom/flyersoft/tools/A;->noSplitHtmls()Z

    move-result v0

    if-nez v0, :cond_1e

    const/4 v6, 0x0

    .line 258
    :goto_e
    sget-object v0, Lcom/flyersoft/tools/A;->splitHtmls:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v6, v0, :cond_1f

    .line 259
    sget-boolean v0, Lcom/flyersoft/tools/A;->searchBackwardOnly:Z

    if-eqz v0, :cond_1b

    sget v0, Lcom/flyersoft/tools/A;->lastSplitIndex:I

    if-le v6, v0, :cond_1b

    goto :goto_f

    .line 260
    :cond_1b
    sget-boolean v0, Lcom/flyersoft/tools/A;->searchForwardOnly:Z

    if-eqz v0, :cond_1c

    sget v0, Lcom/flyersoft/tools/A;->lastSplitIndex:I

    if-ge v6, v0, :cond_1c

    goto :goto_f

    .line 261
    :cond_1c
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/PrefSearch;->inSearching:Z

    if-eqz v0, :cond_1f

    sget-object v0, Lcom/flyersoft/moonreaderp/PrefSearch;->results:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget-object v2, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    invoke-static {v2}, Lcom/flyersoft/moonreaderp/PrefSearch;->-$$Nest$fgetMAX_RESULTS(Lcom/flyersoft/moonreaderp/PrefSearch;)I

    move-result v2

    if-le v0, v2, :cond_1d

    goto :goto_10

    .line 262
    :cond_1d
    sget-object v0, Lcom/flyersoft/tools/A;->splitHtmls:Ljava/util/ArrayList;

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 263
    invoke-static {v0}, Lcom/flyersoft/tools/A;->chineseJianFanConvert(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 264
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    invoke-static {v0}, Lcom/flyersoft/staticlayout/MyHtml;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    sget-object v7, Lcom/flyersoft/tools/A;->splitHtmls:Ljava/util/ArrayList;

    const/4 v5, 0x0

    invoke-static/range {v2 .. v7}, Lcom/flyersoft/moonreaderp/PrefSearch;->-$$Nest$mgetResultFromHtml(Lcom/flyersoft/moonreaderp/PrefSearch;Ljava/util/regex/Pattern;Ljava/lang/String;IILjava/util/ArrayList;)V

    :goto_f
    add-int/lit8 v6, v6, 0x1

    goto :goto_e

    .line 267
    :cond_1e
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->htmlSrc:Ljava/lang/String;

    .line 268
    invoke-static {v0}, Lcom/flyersoft/tools/A;->chineseJianFanConvert(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 269
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    invoke-static {v0}, Lcom/flyersoft/staticlayout/MyHtml;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    sget-object v7, Lcom/flyersoft/tools/A;->splitHtmls:Ljava/util/ArrayList;

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static/range {v2 .. v7}, Lcom/flyersoft/moonreaderp/PrefSearch;->-$$Nest$mgetResultFromHtml(Lcom/flyersoft/moonreaderp/PrefSearch;Ljava/util/regex/Pattern;Ljava/lang/String;IILjava/util/ArrayList;)V

    .line 272
    :cond_1f
    :goto_10
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/PrefSearch;->inSearching:Z

    if-eqz v0, :cond_20

    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefSearch;->searchHandler:Landroid/os/Handler;

    const/4 v2, 0x2

    invoke-virtual {v0, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 273
    :cond_20
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iput-boolean v9, v0, Lcom/flyersoft/moonreaderp/PrefSearch;->inSearching:Z

    return-void

    :cond_21
    const/4 v0, 0x0

    .line 210
    :goto_11
    sget-object v4, Lcom/flyersoft/tools/A;->txts:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v0, v4, :cond_2f

    .line 211
    invoke-static {v0}, Lcom/flyersoft/tools/A;->getPriorTxtLength(I)I

    move-result v4

    .line 212
    sget-boolean v6, Lcom/flyersoft/tools/A;->searchBackwardOnly:Z

    if-eqz v6, :cond_22

    int-to-long v6, v4

    sget-wide v10, Lcom/flyersoft/tools/A;->lastPosition:J

    cmp-long v8, v6, v10

    if-lez v8, :cond_22

    goto/16 :goto_17

    .line 213
    :cond_22
    sget-boolean v6, Lcom/flyersoft/tools/A;->searchForwardOnly:Z

    if-eqz v6, :cond_23

    int-to-long v6, v4

    sget-wide v10, Lcom/flyersoft/tools/A;->lastPosition:J

    cmp-long v8, v6, v10

    if-gez v8, :cond_23

    goto/16 :goto_17

    .line 214
    :cond_23
    iget-object v6, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-boolean v6, v6, Lcom/flyersoft/moonreaderp/PrefSearch;->inSearching:Z

    if-nez v6, :cond_24

    goto/16 :goto_19

    .line 215
    :cond_24
    sget-object v6, Lcom/flyersoft/moonreaderp/PrefSearch;->results:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    iget-object v7, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    invoke-static {v7}, Lcom/flyersoft/moonreaderp/PrefSearch;->-$$Nest$fgetMAX_RESULTS(Lcom/flyersoft/moonreaderp/PrefSearch;)I

    move-result v7

    if-le v6, v7, :cond_25

    goto/16 :goto_18

    .line 217
    :cond_25
    sget-object v6, Lcom/flyersoft/tools/A;->txts:Ljava/util/ArrayList;

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 218
    invoke-static {v6}, Lcom/flyersoft/tools/A;->chineseJianFanConvert(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 220
    invoke-virtual {v3, v6}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v6

    .line 221
    invoke-virtual {v6}, Ljava/util/regex/Matcher;->find()Z

    move-result v6

    if-eqz v6, :cond_2c

    .line 222
    invoke-static {v0}, Lcom/flyersoft/tools/A;->getTxts2(I)Ljava/lang/String;

    move-result-object v6

    .line 223
    invoke-static {v6}, Lcom/flyersoft/tools/A;->chineseJianFanConvert(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 224
    invoke-virtual {v3, v6}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v7

    const/4 v8, 0x0

    .line 225
    :goto_12
    invoke-virtual {v7}, Ljava/util/regex/Matcher;->find()Z

    move-result v10

    if-eqz v10, :cond_2d

    .line 226
    sget-boolean v10, Lcom/flyersoft/tools/A;->searchBackwardOnly:Z

    if-eqz v10, :cond_26

    invoke-virtual {v7}, Ljava/util/regex/Matcher;->start()I

    move-result v10

    add-int/2addr v10, v4

    int-to-long v10, v10

    sget-wide v12, Lcom/flyersoft/tools/A;->lastPosition:J

    cmp-long v14, v10, v12

    if-lez v14, :cond_26

    goto :goto_12

    .line 227
    :cond_26
    sget-boolean v10, Lcom/flyersoft/tools/A;->searchForwardOnly:Z

    if-eqz v10, :cond_27

    invoke-virtual {v7}, Ljava/util/regex/Matcher;->start()I

    move-result v10

    add-int/2addr v10, v4

    int-to-long v10, v10

    sget-wide v12, Lcom/flyersoft/tools/A;->lastPosition:J

    cmp-long v14, v10, v12

    if-gez v14, :cond_27

    goto :goto_12

    .line 229
    :cond_27
    new-instance v8, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;

    invoke-direct {v8}, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;-><init>()V

    .line 230
    invoke-virtual {v7}, Ljava/util/regex/Matcher;->start()I

    move-result v10

    add-int/2addr v10, v4

    iput v10, v8, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->start:I

    .line 231
    invoke-virtual {v7}, Ljava/util/regex/Matcher;->end()I

    move-result v10

    add-int/2addr v10, v4

    iput v10, v8, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->end:I

    .line 232
    iget v10, v8, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->start:I

    const/16 v11, 0x50

    if-le v10, v11, :cond_28

    iget v10, v8, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->start:I

    sub-int/2addr v10, v11

    :goto_13
    int-to-long v12, v10

    goto :goto_14

    :cond_28
    iget v10, v8, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->start:I

    goto :goto_13

    :goto_14
    iput-wide v12, v8, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->position:J

    .line 233
    invoke-virtual {v7}, Ljava/util/regex/Matcher;->start()I

    move-result v10

    iget-object v12, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget v12, v12, Lcom/flyersoft/moonreaderp/PrefSearch;->pl:I

    if-le v10, v12, :cond_29

    invoke-virtual {v7}, Ljava/util/regex/Matcher;->start()I

    move-result v10

    iget-object v12, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget v12, v12, Lcom/flyersoft/moonreaderp/PrefSearch;->pl:I

    sub-int/2addr v10, v12

    goto :goto_15

    :cond_29
    const/4 v10, 0x0

    .line 234
    :goto_15
    invoke-virtual {v7}, Ljava/util/regex/Matcher;->end()I

    move-result v12

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v13

    iget-object v14, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget v14, v14, Lcom/flyersoft/moonreaderp/PrefSearch;->pl:I

    sub-int/2addr v13, v14

    if-ge v12, v13, :cond_2a

    invoke-virtual {v7}, Ljava/util/regex/Matcher;->end()I

    move-result v12

    iget-object v13, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget v13, v13, Lcom/flyersoft/moonreaderp/PrefSearch;->pl:I

    add-int/2addr v12, v13

    goto :goto_16

    :cond_2a
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v12

    .line 235
    :goto_16
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7}, Ljava/util/regex/Matcher;->start()I

    move-result v14

    invoke-virtual {v6, v10, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v14, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-object v14, v14, Lcom/flyersoft/moonreaderp/PrefSearch;->s_tag1:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 236
    invoke-virtual {v7}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v14, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-object v14, v14, Lcom/flyersoft/moonreaderp/PrefSearch;->s_tag2:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 237
    invoke-virtual {v7}, Ljava/util/regex/Matcher;->end()I

    move-result v14

    invoke-virtual {v6, v14, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    iput-object v13, v8, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->html:Ljava/lang/String;

    .line 238
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v14, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-object v15, v8, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->html:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/util/regex/Matcher;->start()I

    move-result v16

    sub-int v10, v16, v10

    .line 239
    invoke-virtual {v7}, Ljava/util/regex/Matcher;->end()I

    move-result v16

    sub-int v12, v12, v16

    iget-object v11, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-object v11, v11, Lcom/flyersoft/moonreaderp/PrefSearch;->s_tag1:Ljava/lang/String;

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v11

    add-int/2addr v12, v11

    iget-object v11, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-object v11, v11, Lcom/flyersoft/moonreaderp/PrefSearch;->s_tag2:Ljava/lang/String;

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v11

    add-int/2addr v12, v11

    .line 238
    invoke-virtual {v14, v15, v10, v12}, Lcom/flyersoft/moonreaderp/PrefSearch;->getSentence(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v10, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    .line 240
    invoke-static {v10}, Lcom/flyersoft/moonreaderp/PrefSearch;->-$$Nest$mcolorBlue(Lcom/flyersoft/moonreaderp/PrefSearch;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v10, ">("

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v10, v8, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->position:J

    invoke-static {}, Lcom/flyersoft/tools/A;->txtLength()J

    move-result-wide v14

    invoke-static {v10, v11, v14, v15}, Lcom/flyersoft/tools/T;->getPercentStr(JJ)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v10, ")</font>"

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    iput-object v10, v8, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->html:Ljava/lang/String;

    .line 242
    iget-object v10, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-boolean v10, v10, Lcom/flyersoft/moonreaderp/PrefSearch;->inSearching:Z

    if-eqz v10, :cond_2b

    .line 243
    iget-object v10, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-object v10, v10, Lcom/flyersoft/moonreaderp/PrefSearch;->searchHandler:Landroid/os/Handler;

    iget-object v11, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-object v11, v11, Lcom/flyersoft/moonreaderp/PrefSearch;->searchHandler:Landroid/os/Handler;

    invoke-virtual {v11, v5, v8}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v8

    invoke-virtual {v10, v8}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_2b
    const/4 v8, 0x1

    goto/16 :goto_12

    :cond_2c
    const/4 v8, 0x0

    :cond_2d
    if-eqz v8, :cond_2e

    .line 246
    iget-object v4, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-boolean v4, v4, Lcom/flyersoft/moonreaderp/PrefSearch;->inSearching:Z

    if-eqz v4, :cond_2e

    .line 247
    iget-object v4, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/PrefSearch;->searchHandler:Landroid/os/Handler;

    invoke-virtual {v4, v9}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    :cond_2e
    :goto_17
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_11

    .line 250
    :cond_2f
    :goto_18
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/PrefSearch;->inSearching:Z

    if-eqz v0, :cond_30

    .line 251
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefSearch;->searchHandler:Landroid/os/Handler;

    const/4 v2, 0x2

    invoke-virtual {v0, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 252
    :cond_30
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefSearch$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iput-boolean v9, v0, Lcom/flyersoft/moonreaderp/PrefSearch;->inSearching:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    .line 344
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :goto_19
    return-void
.end method
