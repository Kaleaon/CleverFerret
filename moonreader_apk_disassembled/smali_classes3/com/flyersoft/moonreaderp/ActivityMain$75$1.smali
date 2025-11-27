.class Lcom/flyersoft/moonreaderp/ActivityMain$75$1;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$75;->onClick(ILandroid/view/View;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$75;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$75;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 6902
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$75$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$75;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 2

    .line 6905
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$75$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$75;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v1, 0x1

    if-ne p1, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mshowFavoriteBooks(Lcom/flyersoft/moonreaderp/ActivityMain;Z)V

    .line 6906
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$75$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$75;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$75;->val$menu:Lcom/flyersoft/components/MyMenu;

    iget-object p1, p1, Lcom/flyersoft/components/MyMenu;->popupWindow:Landroid/widget/PopupWindow;

    invoke-virtual {p1}, Landroid/widget/PopupWindow;->dismiss()V

    return-void
.end method
