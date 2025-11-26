.class Lcom/flyersoft/components/MyMenu$MyMenuAdapter$2;
.super Ljava/lang/Object;
.source "MyMenu.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


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

    .line 471
    iput-object p1, p0, Lcom/flyersoft/components/MyMenu$MyMenuAdapter$2;->this$1:Lcom/flyersoft/components/MyMenu$MyMenuAdapter;

    iput p2, p0, Lcom/flyersoft/components/MyMenu$MyMenuAdapter$2;->val$position2:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 2

    .line 474
    iget-object v0, p0, Lcom/flyersoft/components/MyMenu$MyMenuAdapter$2;->this$1:Lcom/flyersoft/components/MyMenu$MyMenuAdapter;

    iget-object v0, v0, Lcom/flyersoft/components/MyMenu$MyMenuAdapter;->this$0:Lcom/flyersoft/components/MyMenu;

    iget-object v0, v0, Lcom/flyersoft/components/MyMenu;->onItemLongClick:Lcom/flyersoft/components/MyMenu$MenuItemLongClick;

    iget v1, p0, Lcom/flyersoft/components/MyMenu$MyMenuAdapter$2;->val$position2:I

    invoke-interface {v0, v1, p1}, Lcom/flyersoft/components/MyMenu$MenuItemLongClick;->onClick(ILandroid/view/View;)Z

    move-result p1

    return p1
.end method
