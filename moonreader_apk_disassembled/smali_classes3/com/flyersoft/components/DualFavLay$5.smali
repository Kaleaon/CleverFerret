.class Lcom/flyersoft/components/DualFavLay$5;
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

.field final synthetic val$type:I


# direct methods
.method constructor <init>(Lcom/flyersoft/components/DualFavLay;Landroid/widget/TextView;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 243
    iput-object p1, p0, Lcom/flyersoft/components/DualFavLay$5;->this$0:Lcom/flyersoft/components/DualFavLay;

    iput-object p2, p0, Lcom/flyersoft/components/DualFavLay$5;->val$tv:Landroid/widget/TextView;

    iput p3, p0, Lcom/flyersoft/components/DualFavLay$5;->val$type:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 3

    .line 246
    new-instance p1, Lcom/flyersoft/components/MyMenu;

    invoke-static {}, Lcom/flyersoft/components/DualFavLay;->-$$Nest$sfgetmContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/flyersoft/components/MyMenu;-><init>(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/flyersoft/components/DualFavLay$5;->val$tv:Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Lcom/flyersoft/components/MyMenu;->setAnchor(Landroid/view/View;)Lcom/flyersoft/components/MyMenu;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/flyersoft/components/DualFavLay;->-$$Nest$sfgetmContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->search:I

    .line 247
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " \""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/flyersoft/components/DualFavLay$5;->val$tv:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/components/DualFavLay$5$1;

    invoke-direct {v1, p0}, Lcom/flyersoft/components/DualFavLay$5$1;-><init>(Lcom/flyersoft/components/DualFavLay$5;)V

    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/components/MyMenu;->setItems([Ljava/lang/CharSequence;Lcom/flyersoft/components/MyMenu$MenuItemClick;)Lcom/flyersoft/components/MyMenu;

    move-result-object p1

    iget-object v0, p0, Lcom/flyersoft/components/DualFavLay$5;->val$tv:Landroid/widget/TextView;

    .line 268
    invoke-virtual {p1, v0}, Lcom/flyersoft/components/MyMenu;->showOverflow(Landroid/view/View;)V

    const/4 p1, 0x1

    return p1
.end method
