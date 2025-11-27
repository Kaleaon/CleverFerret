.class Lcom/flyersoft/moonreaderp/PrefControl$8;
.super Ljava/lang/Object;
.source "PrefControl.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefControl;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefControl;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefControl;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 374
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefControl$8;->this$0:Lcom/flyersoft/moonreaderp/PrefControl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 377
    invoke-static {}, Lcom/flyersoft/tools/A;->set_default_Do_Events()V

    const/4 p1, 0x1

    const/4 p2, 0x0

    .line 378
    invoke-static {p2, p1}, Lcom/flyersoft/tools/A;->set_default_statusbar(ZZ)V

    .line 379
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefControl$8;->this$0:Lcom/flyersoft/moonreaderp/PrefControl;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefControl;->-$$Nest$mloadOptions(Lcom/flyersoft/moonreaderp/PrefControl;)V

    .line 380
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefControl$8;->this$0:Lcom/flyersoft/moonreaderp/PrefControl;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefControl;->-$$Nest$msetNineGridText(Lcom/flyersoft/moonreaderp/PrefControl;)V

    .line 381
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefControl$8;->this$0:Lcom/flyersoft/moonreaderp/PrefControl;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefControl;->root:Landroid/view/View;

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->sv:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ScrollView;

    invoke-virtual {p1, p2, p2}, Landroid/widget/ScrollView;->smoothScrollTo(II)V

    return-void
.end method
