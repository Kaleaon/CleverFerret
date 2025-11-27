.class Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$8;
.super Ljava/lang/Thread;
.source "DualFavLay.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->addBookCount(Landroid/widget/TextView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;

.field final synthetic val$countTv:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;Landroid/widget/TextView;)V
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

    .line 555
    iput-object p1, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$8;->this$1:Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;

    iput-object p2, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$8;->val$countTv:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 558
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$8;->val$countTv:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/tools/BookDb$BookCollection;

    .line 560
    sget v1, Lcom/flyersoft/tools/A;->dualFavType:I

    const/4 v2, 0x5

    if-ne v1, v2, :cond_0

    .line 561
    iget-object v1, v0, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldValue:Ljava/lang/String;

    iget-object v2, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$8;->this$1:Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;

    iget-object v2, v2, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->this$0:Lcom/flyersoft/components/DualFavLay;

    invoke-static {v2}, Lcom/flyersoft/components/DualFavLay;->-$$Nest$mgetAllBooks(Lcom/flyersoft/components/DualFavLay;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/flyersoft/tools/BookDb;->getFolderBooks(Ljava/lang/String;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    goto :goto_0

    .line 563
    :cond_0
    iget-object v1, v0, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldName:Ljava/lang/String;

    iget-object v2, v0, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldValue:Ljava/lang/String;

    iget-boolean v3, v0, Lcom/flyersoft/tools/BookDb$BookCollection;->multiType:Z

    const/4 v4, 0x0

    invoke-static {v1, v2, v4, v3}, Lcom/flyersoft/tools/BookDb;->getBooks(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 565
    :goto_0
    iget-object v2, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$8;->val$countTv:Landroid/widget/TextView;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->about2:I

    invoke-virtual {v2, v3, v0}, Landroid/widget/TextView;->setTag(ILjava/lang/Object;)V

    .line 566
    iget-object v0, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$8;->val$countTv:Landroid/widget/TextView;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->about:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Landroid/widget/TextView;->setTag(ILjava/lang/Object;)V

    .line 567
    iget-object v0, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$8;->this$1:Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;

    iget-object v0, v0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->this$0:Lcom/flyersoft/components/DualFavLay;

    iget-object v0, v0, Lcom/flyersoft/components/DualFavLay;->bookCountHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$8;->this$1:Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;

    iget-object v1, v1, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->this$0:Lcom/flyersoft/components/DualFavLay;

    iget-object v1, v1, Lcom/flyersoft/components/DualFavLay;->bookCountHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$8;->val$countTv:Landroid/widget/TextView;

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 569
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-void
.end method
