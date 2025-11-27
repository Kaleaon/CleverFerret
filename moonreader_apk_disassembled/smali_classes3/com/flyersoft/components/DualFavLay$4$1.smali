.class Lcom/flyersoft/components/DualFavLay$4$1;
.super Ljava/lang/Object;
.source "DualFavLay.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/DualFavLay$4;->onLongClick(Landroid/view/View;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/components/DualFavLay$4;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/DualFavLay$4;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 229
    iput-object p1, p0, Lcom/flyersoft/components/DualFavLay$4$1;->this$1:Lcom/flyersoft/components/DualFavLay$4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 2

    .line 232
    iget-object v0, p0, Lcom/flyersoft/components/DualFavLay$4$1;->this$1:Lcom/flyersoft/components/DualFavLay$4;

    iget-object v0, v0, Lcom/flyersoft/components/DualFavLay$4;->this$0:Lcom/flyersoft/components/DualFavLay;

    iget-object v0, v0, Lcom/flyersoft/components/DualFavLay;->popupWindow:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 233
    iget-object v0, p0, Lcom/flyersoft/components/DualFavLay$4$1;->this$1:Lcom/flyersoft/components/DualFavLay$4;

    iget-object v0, v0, Lcom/flyersoft/components/DualFavLay$4;->this$0:Lcom/flyersoft/components/DualFavLay;

    iget-object v0, v0, Lcom/flyersoft/components/DualFavLay;->onItemClick1:Lcom/flyersoft/components/DualFavLay$MainItemClick;

    if-eqz v0, :cond_1

    .line 234
    iget-object v0, p0, Lcom/flyersoft/components/DualFavLay$4$1;->this$1:Lcom/flyersoft/components/DualFavLay$4;

    iget-object v0, v0, Lcom/flyersoft/components/DualFavLay$4;->this$0:Lcom/flyersoft/components/DualFavLay;

    iget-object v0, v0, Lcom/flyersoft/components/DualFavLay;->onItemClick1:Lcom/flyersoft/components/DualFavLay$MainItemClick;

    const/4 v1, 0x1

    if-ne p1, v1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    invoke-interface {v0, v1, p1}, Lcom/flyersoft/components/DualFavLay$MainItemClick;->onClick(IZ)V

    :cond_1
    return-void
.end method
