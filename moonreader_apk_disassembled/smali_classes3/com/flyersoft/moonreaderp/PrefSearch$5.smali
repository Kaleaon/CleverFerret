.class Lcom/flyersoft/moonreaderp/PrefSearch$5;
.super Landroid/os/Handler;
.source "PrefSearch.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefSearch;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefSearch;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefSearch;Landroid/os/Looper;)V
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

    .line 491
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSearch$5;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 6

    .line 494
    iget v0, p1, Landroid/os/Message;->what:I

    if-nez v0, :cond_0

    .line 495
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch$5;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefSearch;->list:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 496
    :cond_0
    iget v0, p1, Landroid/os/Message;->what:I

    const-string v1, " "

    const/4 v2, 0x1

    if-ne v0, v2, :cond_2

    .line 497
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefSearch;->results:Ljava/util/ArrayList;

    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 498
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch$5;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefSearch;->list:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 499
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch$5;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefSearch;->list:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 500
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch$5;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefSearch;->phTitle:Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefSearch$5;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    invoke-virtual {v4}, Lcom/flyersoft/moonreaderp/PrefSearch;->getContext()Landroid/content/Context;

    move-result-object v4

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->book_found:I

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v4, Lcom/flyersoft/moonreaderp/PrefSearch;->results:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 502
    :cond_2
    iget v0, p1, Landroid/os/Message;->what:I

    .line 506
    iget p1, p1, Landroid/os/Message;->what:I

    const/4 v0, 0x2

    if-ne p1, v0, :cond_5

    .line 507
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSearch$5;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    invoke-static {p1, v2}, Lcom/flyersoft/moonreaderp/PrefSearch;->-$$Nest$mshowSearchButton(Lcom/flyersoft/moonreaderp/PrefSearch;Z)V

    .line 508
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch$5;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefSearch;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->book_found:I

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 509
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefSearch;->results:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefSearch$5;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    invoke-static {v2}, Lcom/flyersoft/moonreaderp/PrefSearch;->-$$Nest$fgetMAX_RESULTS(Lcom/flyersoft/moonreaderp/PrefSearch;)I

    move-result v2

    if-lt v0, v2, :cond_3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, ">"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefSearch$5;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    invoke-static {v1}, Lcom/flyersoft/moonreaderp/PrefSearch;->-$$Nest$fgetMAX_RESULTS(Lcom/flyersoft/moonreaderp/PrefSearch;)I

    move-result v1

    goto :goto_0

    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lcom/flyersoft/moonreaderp/PrefSearch;->results:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 510
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch$5;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefSearch;->phTitle:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 511
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefSearch;->results:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_4

    sget-boolean v0, Lcom/flyersoft/tools/A;->isFanTiChinese:Z

    if-eqz v0, :cond_4

    sget-boolean v0, Lcom/flyersoft/tools/A;->textJian2Fan:Z

    if-eqz v0, :cond_4

    .line 512
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\n\u5df2\u542f\u7528\u7b80\u7e41\u8f6c\u6362, \u8bf7\u7528\u7e41\u4f53\u6587\u672c\u641c\u7d22"

    invoke-static {p1}, Lcom/flyersoft/tools/miscellaneous/ChineseJianFanConvert;->convertJian2Fan(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 513
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSearch$5;->this$0:Lcom/flyersoft/moonreaderp/PrefSearch;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefSearch;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    :cond_5
    return-void
.end method
