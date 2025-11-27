.class Lcom/flyersoft/moonreaderp/ActivityMain$75;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemLongClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->showShelfCategory(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$menu:Lcom/flyersoft/components/MyMenu;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Lcom/flyersoft/components/MyMenu;)V
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

    .line 6895
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$75;->val$menu:Lcom/flyersoft/components/MyMenu;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(ILandroid/view/View;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 6899
    new-instance p1, Lcom/flyersoft/components/MyMenu;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p1, v1}, Lcom/flyersoft/components/MyMenu;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1, p2}, Lcom/flyersoft/components/MyMenu;->setAnchor(Landroid/view/View;)Lcom/flyersoft/components/MyMenu;

    move-result-object p1

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->books_not_in_favorite:I

    .line 6900
    invoke-virtual {v1, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->books_in_favorite:I

    .line 6901
    invoke-virtual {v2, v3}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v2

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/flyersoft/moonreaderp/ActivityMain$75$1;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$75$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$75;)V

    .line 6900
    invoke-virtual {p1, v1, v2}, Lcom/flyersoft/components/MyMenu;->setItems([Ljava/lang/CharSequence;Lcom/flyersoft/components/MyMenu$MenuItemClick;)Lcom/flyersoft/components/MyMenu;

    move-result-object p1

    .line 6909
    invoke-virtual {p1, p2}, Lcom/flyersoft/components/MyMenu;->showOverflow(Landroid/view/View;)V

    return v0

    :cond_0
    const/4 p1, 0x0

    return p1
.end method
