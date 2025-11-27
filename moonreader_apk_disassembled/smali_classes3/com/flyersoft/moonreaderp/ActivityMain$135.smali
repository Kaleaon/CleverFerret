.class Lcom/flyersoft/moonreaderp/ActivityMain$135;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;
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

    .line 12594
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$135;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 12596
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$135;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v1, Lcom/flyersoft/moonreaderp/R$array;->one_file_bookmark:I

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$135;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v2, Lcom/flyersoft/moonreaderp/R$array;->one_file_bookmark:I

    const/4 v3, 0x1

    .line 12597
    invoke-static {v1, v2, v3}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v1

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    .line 12598
    new-instance v1, Lcom/flyersoft/components/MyMenu;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$135;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {v1, v2}, Lcom/flyersoft/components/MyMenu;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, p1}, Lcom/flyersoft/components/MyMenu;->setAnchor(Landroid/view/View;)Lcom/flyersoft/components/MyMenu;

    move-result-object v1

    new-instance v2, Lcom/flyersoft/moonreaderp/ActivityMain$135$1;

    invoke-direct {v2, p0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain$135$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$135;Landroid/view/View;)V

    invoke-virtual {v1, v0, v2}, Lcom/flyersoft/components/MyMenu;->setItems([Ljava/lang/CharSequence;Lcom/flyersoft/components/MyMenu$MenuItemClick;)Lcom/flyersoft/components/MyMenu;

    move-result-object v0

    .line 12624
    invoke-virtual {v0, p1}, Lcom/flyersoft/components/MyMenu;->showOverflow(Landroid/view/View;)V

    return-void
.end method
