.class Lcom/flyersoft/components/MyMenu$1;
.super Ljava/lang/Object;
.source "MyMenu.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/MyMenu;->initMenu()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/MyMenu;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/MyMenu;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 170
    iput-object p1, p0, Lcom/flyersoft/components/MyMenu$1;->this$0:Lcom/flyersoft/components/MyMenu;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 172
    iget-object p1, p0, Lcom/flyersoft/components/MyMenu$1;->this$0:Lcom/flyersoft/components/MyMenu;

    iget-object p1, p1, Lcom/flyersoft/components/MyMenu;->onItemClick:Lcom/flyersoft/components/MyMenu$MenuItemClick;

    if-eqz p1, :cond_0

    .line 173
    iget-object p1, p0, Lcom/flyersoft/components/MyMenu$1;->this$0:Lcom/flyersoft/components/MyMenu;

    iget-object p1, p1, Lcom/flyersoft/components/MyMenu;->onItemClick:Lcom/flyersoft/components/MyMenu$MenuItemClick;

    invoke-interface {p1, p3}, Lcom/flyersoft/components/MyMenu$MenuItemClick;->onClick(I)V

    .line 174
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/components/MyMenu$1;->this$0:Lcom/flyersoft/components/MyMenu;

    iget-object p1, p1, Lcom/flyersoft/components/MyMenu;->popupWindow:Landroid/widget/PopupWindow;

    invoke-virtual {p1}, Landroid/widget/PopupWindow;->dismiss()V

    return-void
.end method
