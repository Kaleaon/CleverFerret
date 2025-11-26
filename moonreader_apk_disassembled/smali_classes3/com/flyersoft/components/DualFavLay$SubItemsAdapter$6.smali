.class Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$6;
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

    .line 456
    iput-object p1, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$6;->this$1:Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 459
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/tools/BookDb$BookCollection;

    .line 460
    iget-object v0, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$6;->this$1:Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;

    iget-object v0, v0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->this$0:Lcom/flyersoft/components/DualFavLay;

    iget-object v0, v0, Lcom/flyersoft/components/DualFavLay;->popupWindow:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 461
    iget-object v0, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$6;->this$1:Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;

    iget-object v0, v0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->this$0:Lcom/flyersoft/components/DualFavLay;

    iget-object v0, v0, Lcom/flyersoft/components/DualFavLay;->onItemClick2:Lcom/flyersoft/components/DualFavLay$SubItemClick;

    if-eqz v0, :cond_0

    .line 462
    iget-object v0, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$6;->this$1:Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;

    iget-object v0, v0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->this$0:Lcom/flyersoft/components/DualFavLay;

    iget-object v0, v0, Lcom/flyersoft/components/DualFavLay;->onItemClick2:Lcom/flyersoft/components/DualFavLay$SubItemClick;

    sget v1, Lcom/flyersoft/tools/A;->dualFavType:I

    invoke-interface {v0, v1, p1}, Lcom/flyersoft/components/DualFavLay$SubItemClick;->onClick(ILcom/flyersoft/tools/BookDb$BookCollection;)V

    :cond_0
    return-void
.end method
