.class Lcom/flyersoft/moonreaderp/ActivityMain$124;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->initBookmarksRvEvents(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 10477
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$124;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 10480
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$124;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->clear_all_statistics:I

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    .line 10481
    new-instance v1, Lcom/flyersoft/components/MyMenu;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$124;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {v1, v2}, Lcom/flyersoft/components/MyMenu;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, p1}, Lcom/flyersoft/components/MyMenu;->setAnchor(Landroid/view/View;)Lcom/flyersoft/components/MyMenu;

    move-result-object v1

    new-instance v2, Lcom/flyersoft/moonreaderp/ActivityMain$124$1;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$124$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$124;)V

    invoke-virtual {v1, v0, v2}, Lcom/flyersoft/components/MyMenu;->setItems([Ljava/lang/CharSequence;Lcom/flyersoft/components/MyMenu$MenuItemClick;)Lcom/flyersoft/components/MyMenu;

    move-result-object v0

    .line 10485
    invoke-virtual {v0, p1}, Lcom/flyersoft/components/MyMenu;->showOverflow(Landroid/view/View;)V

    return-void
.end method
