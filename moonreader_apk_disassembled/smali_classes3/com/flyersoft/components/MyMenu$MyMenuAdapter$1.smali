.class Lcom/flyersoft/components/MyMenu$MyMenuAdapter$1;
.super Ljava/lang/Object;
.source "MyMenu.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/MyMenu$MyMenuAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/components/MyMenu$MyMenuAdapter;

.field final synthetic val$position2:I


# direct methods
.method constructor <init>(Lcom/flyersoft/components/MyMenu$MyMenuAdapter;I)V
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

    .line 463
    iput-object p1, p0, Lcom/flyersoft/components/MyMenu$MyMenuAdapter$1;->this$1:Lcom/flyersoft/components/MyMenu$MyMenuAdapter;

    iput p2, p0, Lcom/flyersoft/components/MyMenu$MyMenuAdapter$1;->val$position2:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 466
    iget-object p1, p0, Lcom/flyersoft/components/MyMenu$MyMenuAdapter$1;->this$1:Lcom/flyersoft/components/MyMenu$MyMenuAdapter;

    iget-object p1, p1, Lcom/flyersoft/components/MyMenu$MyMenuAdapter;->this$0:Lcom/flyersoft/components/MyMenu;

    iget-object p1, p1, Lcom/flyersoft/components/MyMenu;->onItemClick:Lcom/flyersoft/components/MyMenu$MenuItemClick;

    if-eqz p1, :cond_0

    .line 467
    iget-object p1, p0, Lcom/flyersoft/components/MyMenu$MyMenuAdapter$1;->this$1:Lcom/flyersoft/components/MyMenu$MyMenuAdapter;

    iget-object p1, p1, Lcom/flyersoft/components/MyMenu$MyMenuAdapter;->this$0:Lcom/flyersoft/components/MyMenu;

    iget-object p1, p1, Lcom/flyersoft/components/MyMenu;->onItemClick:Lcom/flyersoft/components/MyMenu$MenuItemClick;

    iget v0, p0, Lcom/flyersoft/components/MyMenu$MyMenuAdapter$1;->val$position2:I

    invoke-interface {p1, v0}, Lcom/flyersoft/components/MyMenu$MenuItemClick;->onClick(I)V

    .line 468
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/components/MyMenu$MyMenuAdapter$1;->this$1:Lcom/flyersoft/components/MyMenu$MyMenuAdapter;

    iget-object p1, p1, Lcom/flyersoft/components/MyMenu$MyMenuAdapter;->this$0:Lcom/flyersoft/components/MyMenu;

    iget-object p1, p1, Lcom/flyersoft/components/MyMenu;->popupWindow:Landroid/widget/PopupWindow;

    invoke-virtual {p1}, Landroid/widget/PopupWindow;->dismiss()V

    return-void
.end method
