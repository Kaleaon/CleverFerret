.class Lcom/flyersoft/moonreaderp/PrefVisual$17;
.super Ljava/lang/Object;
.source "PrefVisual.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefVisual;->setSytleMaterialSwitchEvents()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefVisual;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 585
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$17;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 2

    .line 588
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual$17;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/PrefVisual;->ignoreSwitchTmp:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    if-nez p2, :cond_1

    const/4 p1, 0x0

    .line 590
    sput-boolean p1, Lcom/flyersoft/tools/A;->fontUnderline:Z

    .line 591
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$17;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$mrefreshFontStyle(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    return-void

    .line 593
    :cond_1
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefVisual$17;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object p2

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->solid_line:I

    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual$17;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    .line 594
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->dashed_line:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    filled-new-array {p2, v0}, [Ljava/lang/String;

    move-result-object p2

    .line 595
    new-instance v0, Lcom/flyersoft/components/MyMenu;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$17;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flyersoft/components/MyMenu;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Lcom/flyersoft/components/MyMenu;->setAnchor(Landroid/view/View;)Lcom/flyersoft/components/MyMenu;

    move-result-object p1

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefVisual$17$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefVisual$17$1;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual$17;)V

    invoke-virtual {p1, p2, v0}, Lcom/flyersoft/components/MyMenu;->setItems([Ljava/lang/CharSequence;Lcom/flyersoft/components/MyMenu$MenuItemClick;)Lcom/flyersoft/components/MyMenu;

    move-result-object p1

    .line 603
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefVisual$17;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->styleLay:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/flyersoft/components/MyMenu;->setBuilderAnchor(Landroid/view/View;)Lcom/flyersoft/components/MyMenu;

    .line 604
    new-instance p2, Lcom/flyersoft/moonreaderp/PrefVisual$17$2;

    invoke-direct {p2, p0}, Lcom/flyersoft/moonreaderp/PrefVisual$17$2;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual$17;)V

    invoke-virtual {p1, p2}, Lcom/flyersoft/components/MyMenu;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)Lcom/flyersoft/components/MyMenu;

    .line 614
    invoke-virtual {p1}, Lcom/flyersoft/components/MyMenu;->show()V

    return-void
.end method
