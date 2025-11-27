.class Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$5;
.super Ljava/lang/Object;
.source "DualFavLay.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 446
    iput-object p1, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$5;->this$1:Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 449
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/tools/BookDb$BookCollection;

    .line 450
    sget v0, Lcom/flyersoft/tools/A;->dualFavType:I

    iget-object p1, p1, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldValue:Ljava/lang/String;

    invoke-static {v0, p1}, Lcom/flyersoft/components/DualFavLay;->removeFromLastFavTop(ILjava/lang/String;)V

    .line 451
    iget-object p1, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$5;->this$1:Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;

    invoke-virtual {p1}, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->sortItems()V

    .line 452
    iget-object p1, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$5;->this$1:Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;

    invoke-virtual {p1}, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->notifyDataSetChanged()V

    return-void
.end method
