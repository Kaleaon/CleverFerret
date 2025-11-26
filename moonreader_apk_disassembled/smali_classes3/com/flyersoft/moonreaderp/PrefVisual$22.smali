.class Lcom/flyersoft/moonreaderp/PrefVisual$22;
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

    .line 671
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$22;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1

    .line 674
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$22;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    iget-boolean p1, p1, Lcom/flyersoft/moonreaderp/PrefVisual;->ignoreSwitchTmp:Z

    if-eqz p1, :cond_0

    return-void

    .line 675
    :cond_0
    sput-boolean p2, Lcom/flyersoft/tools/A;->textCJK:Z

    .line 676
    sget-boolean p1, Lcom/flyersoft/tools/A;->textCJK:Z

    sput-boolean p1, Lcom/flyersoft/tools/A;->textJustified:Z

    const/4 p1, 0x0

    .line 677
    sput-boolean p1, Lcom/flyersoft/tools/A;->textDense:Z

    .line 678
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefVisual$22;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    const/4 v0, 0x1

    iput-boolean v0, p2, Lcom/flyersoft/moonreaderp/PrefVisual;->ignoreSwitchTmp:Z

    .line 679
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefVisual$22;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pvTextJustified:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v0, Lcom/flyersoft/tools/A;->textJustified:Z

    invoke-virtual {p2, v0}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 680
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefVisual$22;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->pvDense:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {p2, p1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 681
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefVisual$22;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    iput-boolean p1, p2, Lcom/flyersoft/moonreaderp/PrefVisual;->ignoreSwitchTmp:Z

    .line 682
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$22;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$msetTextDenseVisible(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    .line 683
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$22;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$mrefreshTxtRender(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    return-void
.end method
