.class Lcom/flyersoft/components/DualFavLay$4;
.super Ljava/lang/Object;
.source "DualFavLay.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/DualFavLay;->setLongTapEvent(ILandroid/widget/TextView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/DualFavLay;

.field final synthetic val$tv:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/DualFavLay;Landroid/widget/TextView;)V
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

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 224
    iput-object p1, p0, Lcom/flyersoft/components/DualFavLay$4;->this$0:Lcom/flyersoft/components/DualFavLay;

    iput-object p2, p0, Lcom/flyersoft/components/DualFavLay$4;->val$tv:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 3

    .line 227
    new-instance p1, Lcom/flyersoft/components/MyMenu;

    invoke-static {}, Lcom/flyersoft/components/DualFavLay;->-$$Nest$sfgetmContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/flyersoft/components/MyMenu;-><init>(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/flyersoft/components/DualFavLay$4;->val$tv:Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Lcom/flyersoft/components/MyMenu;->setAnchor(Landroid/view/View;)Lcom/flyersoft/components/MyMenu;

    move-result-object p1

    invoke-static {}, Lcom/flyersoft/components/DualFavLay;->-$$Nest$sfgetmContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->books_not_in_favorite:I

    .line 228
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/flyersoft/components/DualFavLay;->-$$Nest$sfgetmContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->books_in_favorite:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/components/DualFavLay$4$1;

    invoke-direct {v1, p0}, Lcom/flyersoft/components/DualFavLay$4$1;-><init>(Lcom/flyersoft/components/DualFavLay$4;)V

    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/components/MyMenu;->setItems([Ljava/lang/CharSequence;Lcom/flyersoft/components/MyMenu$MenuItemClick;)Lcom/flyersoft/components/MyMenu;

    move-result-object p1

    iget-object v0, p0, Lcom/flyersoft/components/DualFavLay$4;->val$tv:Landroid/widget/TextView;

    .line 237
    invoke-virtual {p1, v0}, Lcom/flyersoft/components/MyMenu;->showOverflow(Landroid/view/View;)V

    const/4 p1, 0x1

    return p1
.end method
