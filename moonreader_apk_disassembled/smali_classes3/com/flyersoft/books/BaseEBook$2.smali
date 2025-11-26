.class Lcom/flyersoft/books/BaseEBook$2;
.super Ljava/lang/Thread;
.source "BaseEBook.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/books/BaseEBook;->getTotalPageCount(Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;Z)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/books/BaseEBook;

.field final synthetic val$onDone:Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;


# direct methods
.method constructor <init>(Lcom/flyersoft/books/BaseEBook;Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;)V
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

    .line 260
    iput-object p1, p0, Lcom/flyersoft/books/BaseEBook$2;->this$0:Lcom/flyersoft/books/BaseEBook;

    iput-object p2, p0, Lcom/flyersoft/books/BaseEBook$2;->val$onDone:Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 265
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 267
    :try_start_0
    iget-object v2, p0, Lcom/flyersoft/books/BaseEBook$2;->this$0:Lcom/flyersoft/books/BaseEBook;

    invoke-static {v2}, Lcom/flyersoft/books/BaseEBook;->-$$Nest$mgetPageCountWithCache(Lcom/flyersoft/books/BaseEBook;)I

    move-result v2

    .line 271
    iget-object v3, p0, Lcom/flyersoft/books/BaseEBook$2;->this$0:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v3}, Lcom/flyersoft/books/BaseEBook;->getChapters()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/books/BaseEBook$Chapter;

    .line 272
    iget-boolean v4, v4, Lcom/flyersoft/books/BaseEBook$Chapter;->isAboutPageCount:Z

    if-eqz v4, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    .line 277
    :goto_0
    iget-object v4, p0, Lcom/flyersoft/books/BaseEBook$2;->this$0:Lcom/flyersoft/books/BaseEBook;

    iput-boolean v1, v4, Lcom/flyersoft/books/BaseEBook;->isCountAboutPagesWorking:Z

    .line 278
    iget-object v4, p0, Lcom/flyersoft/books/BaseEBook$2;->this$0:Lcom/flyersoft/books/BaseEBook;

    iput-boolean v3, v4, Lcom/flyersoft/books/BaseEBook;->isCountAccuratePageWorking:Z

    .line 279
    iget-object v4, p0, Lcom/flyersoft/books/BaseEBook$2;->val$onDone:Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;

    if-eqz v4, :cond_2

    sget-object v4, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    if-eqz v4, :cond_2

    iget-object v4, p0, Lcom/flyersoft/books/BaseEBook$2;->this$0:Lcom/flyersoft/books/BaseEBook;

    iget-boolean v4, v4, Lcom/flyersoft/books/BaseEBook;->forceStopPageCount:Z

    if-nez v4, :cond_2

    .line 280
    iget-object v4, p0, Lcom/flyersoft/books/BaseEBook$2;->val$onDone:Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;

    invoke-interface {v4, v2}, Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;->refresh(I)V

    :cond_2
    if-eqz v3, :cond_3

    .line 283
    iget-object v2, p0, Lcom/flyersoft/books/BaseEBook$2;->this$0:Lcom/flyersoft/books/BaseEBook;

    invoke-static {v2}, Lcom/flyersoft/books/BaseEBook;->-$$Nest$mgetPageCountWithoutCache(Lcom/flyersoft/books/BaseEBook;)I

    move-result v2

    .line 284
    iget-object v3, p0, Lcom/flyersoft/books/BaseEBook$2;->val$onDone:Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;

    if-eqz v3, :cond_3

    sget-object v3, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    if-eqz v3, :cond_3

    iget-object v3, p0, Lcom/flyersoft/books/BaseEBook$2;->this$0:Lcom/flyersoft/books/BaseEBook;

    iget-boolean v3, v3, Lcom/flyersoft/books/BaseEBook;->forceStopPageCount:Z

    if-nez v3, :cond_3

    .line 285
    iget-object v3, p0, Lcom/flyersoft/books/BaseEBook$2;->val$onDone:Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;

    invoke-interface {v3, v2}, Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;->refresh(I)V

    .line 287
    :cond_3
    iget-object v3, p0, Lcom/flyersoft/books/BaseEBook$2;->this$0:Lcom/flyersoft/books/BaseEBook;

    invoke-static {v3}, Lcom/flyersoft/books/BaseEBook;->-$$Nest$fgetsavedPageCountOnDone(Lcom/flyersoft/books/BaseEBook;)Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;

    move-result-object v3

    if-eqz v3, :cond_5

    .line 288
    iget-object v3, p0, Lcom/flyersoft/books/BaseEBook$2;->this$0:Lcom/flyersoft/books/BaseEBook;

    invoke-static {v3}, Lcom/flyersoft/books/BaseEBook;->-$$Nest$fgetsavedPageCountOnDone(Lcom/flyersoft/books/BaseEBook;)Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;

    move-result-object v3

    iget-object v4, p0, Lcom/flyersoft/books/BaseEBook$2;->val$onDone:Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;

    if-eq v3, v4, :cond_4

    sget-object v3, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 289
    iget-object v3, p0, Lcom/flyersoft/books/BaseEBook$2;->this$0:Lcom/flyersoft/books/BaseEBook;

    invoke-static {v3}, Lcom/flyersoft/books/BaseEBook;->-$$Nest$fgetsavedPageCountOnDone(Lcom/flyersoft/books/BaseEBook;)Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;

    move-result-object v3

    invoke-interface {v3, v2}, Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;->refresh(I)V

    .line 290
    :cond_4
    iget-object v2, p0, Lcom/flyersoft/books/BaseEBook$2;->this$0:Lcom/flyersoft/books/BaseEBook;

    invoke-static {v2, v0}, Lcom/flyersoft/books/BaseEBook;->-$$Nest$fputsavedPageCountOnDone(Lcom/flyersoft/books/BaseEBook;Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;)V
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 297
    :cond_5
    iget-object v2, p0, Lcom/flyersoft/books/BaseEBook$2;->this$0:Lcom/flyersoft/books/BaseEBook;

    invoke-static {v2, v0}, Lcom/flyersoft/books/BaseEBook;->-$$Nest$fputpageCountTv(Lcom/flyersoft/books/BaseEBook;Lcom/flyersoft/staticlayout/MRTextView;)V

    .line 298
    iget-object v0, p0, Lcom/flyersoft/books/BaseEBook$2;->this$0:Lcom/flyersoft/books/BaseEBook;

    iput-boolean v1, v0, Lcom/flyersoft/books/BaseEBook;->isCountAccuratePageWorking:Z

    iput-boolean v1, v0, Lcom/flyersoft/books/BaseEBook;->isCountAboutPagesWorking:Z

    return-void

    :catchall_0
    move-exception v2

    goto :goto_2

    :catch_0
    move-exception v2

    .line 295
    :try_start_1
    invoke-static {v2}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    goto :goto_1

    :catch_1
    move-exception v2

    .line 293
    invoke-static {v2}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 297
    :goto_1
    iget-object v2, p0, Lcom/flyersoft/books/BaseEBook$2;->this$0:Lcom/flyersoft/books/BaseEBook;

    invoke-static {v2, v0}, Lcom/flyersoft/books/BaseEBook;->-$$Nest$fputpageCountTv(Lcom/flyersoft/books/BaseEBook;Lcom/flyersoft/staticlayout/MRTextView;)V

    .line 298
    iget-object v0, p0, Lcom/flyersoft/books/BaseEBook$2;->this$0:Lcom/flyersoft/books/BaseEBook;

    iput-boolean v1, v0, Lcom/flyersoft/books/BaseEBook;->isCountAccuratePageWorking:Z

    iput-boolean v1, v0, Lcom/flyersoft/books/BaseEBook;->isCountAboutPagesWorking:Z

    return-void

    .line 297
    :goto_2
    iget-object v3, p0, Lcom/flyersoft/books/BaseEBook$2;->this$0:Lcom/flyersoft/books/BaseEBook;

    invoke-static {v3, v0}, Lcom/flyersoft/books/BaseEBook;->-$$Nest$fputpageCountTv(Lcom/flyersoft/books/BaseEBook;Lcom/flyersoft/staticlayout/MRTextView;)V

    .line 298
    iget-object v0, p0, Lcom/flyersoft/books/BaseEBook$2;->this$0:Lcom/flyersoft/books/BaseEBook;

    iput-boolean v1, v0, Lcom/flyersoft/books/BaseEBook;->isCountAccuratePageWorking:Z

    iput-boolean v1, v0, Lcom/flyersoft/books/BaseEBook;->isCountAboutPagesWorking:Z

    .line 300
    throw v2
.end method
