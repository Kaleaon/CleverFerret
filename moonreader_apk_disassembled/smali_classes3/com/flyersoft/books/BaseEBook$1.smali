.class Lcom/flyersoft/books/BaseEBook$1;
.super Ljava/lang/Thread;
.source "BaseEBook.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/books/BaseEBook;->resetPageCount(Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;)V
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

    .line 179
    iput-object p1, p0, Lcom/flyersoft/books/BaseEBook$1;->this$0:Lcom/flyersoft/books/BaseEBook;

    iput-object p2, p0, Lcom/flyersoft/books/BaseEBook$1;->val$onDone:Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 182
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/books/BaseEBook$1;->this$0:Lcom/flyersoft/books/BaseEBook;

    iget-boolean v0, v0, Lcom/flyersoft/books/BaseEBook;->isCountAccuratePageWorking:Z

    if-eqz v0, :cond_0

    goto :goto_0

    .line 184
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/BaseEBook$1;->this$0:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v0}, Lcom/flyersoft/books/BaseEBook;->getChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/books/BaseEBook$Chapter;

    .line 185
    iput v2, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->pageCount:I

    goto :goto_1

    .line 186
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/books/BaseEBook$1;->this$0:Lcom/flyersoft/books/BaseEBook;

    iput-boolean v2, v0, Lcom/flyersoft/books/BaseEBook;->waitingForReset:Z

    .line 187
    iget-object v0, p0, Lcom/flyersoft/books/BaseEBook$1;->this$0:Lcom/flyersoft/books/BaseEBook;

    iput-boolean v2, v0, Lcom/flyersoft/books/BaseEBook;->forceStopPageCount:Z

    .line 188
    iget-object v0, p0, Lcom/flyersoft/books/BaseEBook$1;->this$0:Lcom/flyersoft/books/BaseEBook;

    iget-object v1, p0, Lcom/flyersoft/books/BaseEBook$1;->val$onDone:Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;

    invoke-virtual {v0, v1}, Lcom/flyersoft/books/BaseEBook;->getTotalPageCount(Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;)I

    return-void
.end method
