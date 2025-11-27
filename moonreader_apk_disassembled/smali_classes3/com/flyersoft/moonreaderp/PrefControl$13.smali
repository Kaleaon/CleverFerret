.class Lcom/flyersoft/moonreaderp/PrefControl$13;
.super Ljava/lang/Object;
.source "PrefControl.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefControl;->createKeycodeItem(Ljava/lang/Integer;)V
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

    .line 543
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefControl$13;->this$0:Lcom/flyersoft/moonreaderp/PrefControl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 546
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, -0x1

    invoke-static {v0, v1}, Lcom/flyersoft/tools/A;->saveKeycodeEvent(II)V

    .line 547
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefControl$13;->this$0:Lcom/flyersoft/moonreaderp/PrefControl;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefControl;->kLay:Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    return-void
.end method
