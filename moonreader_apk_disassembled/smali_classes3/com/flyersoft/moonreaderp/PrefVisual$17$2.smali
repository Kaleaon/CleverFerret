.class Lcom/flyersoft/moonreaderp/PrefVisual$17$2;
.super Ljava/lang/Object;
.source "PrefVisual.java"

# interfaces
.implements Landroid/widget/PopupWindow$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefVisual$17;->onCheckedChanged(Landroid/widget/CompoundButton;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefVisual$17;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefVisual$17;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 604
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$17$2;->this$1:Lcom/flyersoft/moonreaderp/PrefVisual$17;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss()V
    .locals 2

    .line 607
    sget-boolean v0, Lcom/flyersoft/tools/A;->fontUnderline:Z

    if-nez v0, :cond_0

    .line 608
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual$17$2;->this$1:Lcom/flyersoft/moonreaderp/PrefVisual$17;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefVisual$17;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/flyersoft/moonreaderp/PrefVisual;->ignoreSwitchTmp:Z

    .line 609
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual$17$2;->this$1:Lcom/flyersoft/moonreaderp/PrefVisual$17;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefVisual$17;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pvFontUnderline:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/materialswitch/MaterialSwitch;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 610
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual$17$2;->this$1:Lcom/flyersoft/moonreaderp/PrefVisual$17;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefVisual$17;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    iput-boolean v1, v0, Lcom/flyersoft/moonreaderp/PrefVisual;->ignoreSwitchTmp:Z

    :cond_0
    return-void
.end method
