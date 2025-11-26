.class Lcom/flyersoft/moonreaderp/PrefChapters$25;
.super Ljava/lang/Thread;
.source "PrefChapters.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefChapters;->showImageLocation(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

.field final synthetic val$imageFile:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefChapters;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 2160
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$25;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$25;->val$imageFile:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 20

    move-object/from16 v1, p0

    .line 2164
    const-string v2, "--------end--------"

    const/16 v3, 0x64

    const/4 v4, 0x1

    const/4 v5, 0x0

    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 2165
    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v0}, Lcom/flyersoft/books/BaseEBook;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v8, 0x0

    :goto_0
    const-wide/16 v9, -0x1

    const/4 v11, -0x1

    if-ge v8, v0, :cond_6

    .line 2169
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    const/4 v14, 0x2

    new-array v14, v14, [Ljava/lang/Object;

    aput-object v12, v14, v5

    aput-object v13, v14, v4

    invoke-static {v14}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    const-wide/16 v12, 0x0

    cmp-long v14, v6, v12

    if-lez v14, :cond_0

    .line 2170
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    sub-long/2addr v12, v6

    const-wide/16 v14, 0x1f4

    cmp-long v16, v12, v14

    if-lez v16, :cond_0

    .line 2172
    iget-object v6, v1, Lcom/flyersoft/moonreaderp/PrefChapters$25;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iput-boolean v5, v6, Lcom/flyersoft/moonreaderp/PrefChapters;->ProgressDialogCreated:Z

    .line 2173
    iget-object v6, v1, Lcom/flyersoft/moonreaderp/PrefChapters$25;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v6, v6, Lcom/flyersoft/moonreaderp/PrefChapters;->imageHandler:Landroid/os/Handler;

    iget-object v7, v1, Lcom/flyersoft/moonreaderp/PrefChapters$25;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v7, v7, Lcom/flyersoft/moonreaderp/PrefChapters;->imageHandler:Landroid/os/Handler;

    iget-object v12, v1, Lcom/flyersoft/moonreaderp/PrefChapters$25;->val$imageFile:Ljava/lang/String;

    invoke-virtual {v7, v5, v12}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    move-wide v6, v9

    :cond_0
    cmp-long v12, v6, v9

    if-nez v12, :cond_1

    .line 2176
    iget-object v12, v1, Lcom/flyersoft/moonreaderp/PrefChapters$25;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-boolean v12, v12, Lcom/flyersoft/moonreaderp/PrefChapters;->ProgressDialogCreated:Z

    if-eqz v12, :cond_1

    iget-object v12, v1, Lcom/flyersoft/moonreaderp/PrefChapters$25;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v12, v12, Lcom/flyersoft/moonreaderp/PrefChapters;->progressDlg:Landroid/app/ProgressDialog;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-nez v12, :cond_1

    .line 2215
    new-array v0, v4, [Ljava/lang/Object;

    aput-object v2, v0, v5

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 2216
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefChapters$25;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->imageHandler:Landroid/os/Handler;

    invoke-virtual {v0, v3}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void

    .line 2179
    :cond_1
    :try_start_1
    iget-object v12, v1, Lcom/flyersoft/moonreaderp/PrefChapters$25;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v12, v12, Lcom/flyersoft/moonreaderp/PrefChapters;->progressDlg:Landroid/app/ProgressDialog;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-eqz v12, :cond_2

    .line 2180
    :try_start_2
    iget-object v12, v1, Lcom/flyersoft/moonreaderp/PrefChapters$25;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v12, v12, Lcom/flyersoft/moonreaderp/PrefChapters;->imageHandler:Landroid/os/Handler;

    iget-object v13, v1, Lcom/flyersoft/moonreaderp/PrefChapters$25;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v13, v13, Lcom/flyersoft/moonreaderp/PrefChapters;->imageHandler:Landroid/os/Handler;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v15, v1, Lcom/flyersoft/moonreaderp/PrefChapters$25;->val$imageFile:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v15, " ["

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    add-int/lit8 v15, v8, 0x1

    move-wide/from16 v16, v9

    int-to-long v9, v15

    const/16 v18, 0x1

    int-to-long v3, v0

    :try_start_3
    invoke-static {v9, v10, v3, v4}, Lcom/flyersoft/tools/T;->getPercentStr(JJ)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "]"

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x65

    invoke-virtual {v13, v4, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v3

    invoke-virtual {v12, v3}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_1

    :catchall_0
    move-exception v0

    const/16 v18, 0x1

    goto/16 :goto_4

    :catch_0
    move-exception v0

    const/16 v18, 0x1

    goto/16 :goto_5

    :cond_2
    move-wide/from16 v16, v9

    const/16 v18, 0x1

    .line 2182
    :goto_1
    sget-object v3, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v3, v8}, Lcom/flyersoft/books/BaseEBook;->getChapterText(I)Ljava/lang/String;

    move-result-object v3

    .line 2183
    iget-object v4, v1, Lcom/flyersoft/moonreaderp/PrefChapters$25;->val$imageFile:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    if-eq v4, v11, :cond_5

    .line 2186
    const-string v0, "<"

    invoke-virtual {v3, v0, v4}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result v0

    invoke-virtual {v3, v5, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 2187
    sget v3, Lcom/flyersoft/tools/A;->maxHtmlChapterSize:I

    if-le v4, v3, :cond_3

    .line 2188
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 2189
    invoke-static {v0, v3}, Lcom/flyersoft/tools/A;->createSplitHtmls(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 2190
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .line 2191
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    move-object/from16 v19, v3

    move v3, v0

    move-object/from16 v0, v19

    goto :goto_2

    :cond_3
    const/4 v3, 0x0

    .line 2194
    :goto_2
    sget-object v4, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v4}, Lcom/flyersoft/books/BaseEBook;->getMyImageGetter()Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    move-result-object v4

    invoke-static {v0, v4, v8}, Lcom/flyersoft/staticlayout/MyHtml;->fromHtml(Ljava/lang/String;Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;I)Landroid/text/Spanned;

    move-result-object v0

    .line 2195
    invoke-interface {v0}, Landroid/text/Spanned;->length()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    if-gez v3, :cond_4

    const/4 v3, 0x0

    .line 2198
    :cond_4
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "*find it: "

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v9, 0x1

    new-array v10, v9, [Ljava/lang/Object;

    aput-object v4, v10, v5

    invoke-static {v10}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    goto :goto_3

    :cond_5
    add-int/lit8 v8, v8, 0x1

    const/16 v3, 0x64

    const/4 v4, 0x1

    goto/16 :goto_0

    :cond_6
    move-wide/from16 v16, v9

    const/4 v0, -0x1

    const/4 v3, 0x0

    const/4 v8, -0x1

    :goto_3
    cmp-long v4, v6, v16

    if-nez v4, :cond_7

    .line 2203
    iget-object v4, v1, Lcom/flyersoft/moonreaderp/PrefChapters$25;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-boolean v4, v4, Lcom/flyersoft/moonreaderp/PrefChapters;->ProgressDialogCreated:Z

    if-eqz v4, :cond_7

    iget-object v4, v1, Lcom/flyersoft/moonreaderp/PrefChapters$25;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/PrefChapters;->progressDlg:Landroid/app/ProgressDialog;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-nez v4, :cond_7

    const/4 v9, 0x1

    .line 2215
    new-array v0, v9, [Ljava/lang/Object;

    aput-object v2, v0, v5

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 2216
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefChapters$25;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->imageHandler:Landroid/os/Handler;

    const/16 v15, 0x64

    invoke-virtual {v0, v15}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void

    :cond_7
    if-eq v8, v11, :cond_8

    .line 2207
    :try_start_4
    iget-object v4, v1, Lcom/flyersoft/moonreaderp/PrefChapters$25;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iput v8, v4, Lcom/flyersoft/moonreaderp/PrefChapters;->imgChapter:I

    .line 2208
    iget-object v4, v1, Lcom/flyersoft/moonreaderp/PrefChapters$25;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iput v3, v4, Lcom/flyersoft/moonreaderp/PrefChapters;->imgSplit:I

    .line 2209
    iget-object v3, v1, Lcom/flyersoft/moonreaderp/PrefChapters$25;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iput v0, v3, Lcom/flyersoft/moonreaderp/PrefChapters;->imgPos:I

    .line 2210
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefChapters$25;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->imageHandler:Landroid/os/Handler;

    const/16 v3, 0x66

    invoke-virtual {v0, v3}, Landroid/os/Handler;->sendEmptyMessage(I)Z
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :cond_8
    const/4 v9, 0x1

    .line 2215
    new-array v0, v9, [Ljava/lang/Object;

    aput-object v2, v0, v5

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 2216
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefChapters$25;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->imageHandler:Landroid/os/Handler;

    const/16 v15, 0x64

    invoke-virtual {v0, v15}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void

    :catchall_1
    move-exception v0

    :goto_4
    const/4 v9, 0x1

    const/16 v15, 0x64

    goto :goto_6

    :catch_1
    move-exception v0

    .line 2213
    :goto_5
    :try_start_5
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    const/4 v9, 0x1

    .line 2215
    new-array v0, v9, [Ljava/lang/Object;

    aput-object v2, v0, v5

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 2216
    iget-object v0, v1, Lcom/flyersoft/moonreaderp/PrefChapters$25;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->imageHandler:Landroid/os/Handler;

    const/16 v15, 0x64

    invoke-virtual {v0, v15}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void

    .line 2215
    :goto_6
    new-array v3, v9, [Ljava/lang/Object;

    aput-object v2, v3, v5

    invoke-static {v3}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 2216
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/PrefChapters$25;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefChapters;->imageHandler:Landroid/os/Handler;

    invoke-virtual {v2, v15}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 2217
    throw v0
.end method
