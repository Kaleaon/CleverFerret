.class Lcom/flyersoft/moonreaderp/PrefVisual$21;
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

    .line 653
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$21;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 656
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$21;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    iget-boolean p1, p1, Lcom/flyersoft/moonreaderp/PrefVisual;->ignoreSwitchTmp:Z

    if-eqz p1, :cond_0

    return-void

    .line 657
    :cond_0
    sput-boolean p2, Lcom/flyersoft/tools/A;->textHyphenation:Z

    .line 658
    sget-boolean p1, Lcom/flyersoft/tools/A;->textHyphenation:Z

    sput-boolean p1, Lcom/flyersoft/tools/A;->textJustified:Z

    .line 659
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$21;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    const/4 p2, 0x1

    iput-boolean p2, p1, Lcom/flyersoft/moonreaderp/PrefVisual;->ignoreSwitchTmp:Z

    .line 660
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$21;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefVisual;->root:Landroid/view/View;

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->pvTextJustified:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean p2, Lcom/flyersoft/tools/A;->textJustified:Z

    invoke-virtual {p1, p2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 661
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$21;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    const/4 p2, 0x0

    iput-boolean p2, p1, Lcom/flyersoft/moonreaderp/PrefVisual;->ignoreSwitchTmp:Z

    .line 663
    sget-object p1, Lcom/flyersoft/tools/A;->txtScroll:Landroid/widget/ScrollView;

    invoke-static {p1, p2}, Lcom/flyersoft/tools/A;->setTxtScrollPadding(Landroid/widget/ScrollView;Z)V

    .line 664
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$21;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$msetTxtScroll2Margin(Lcom/flyersoft/moonreaderp/PrefVisual;Z)V

    .line 665
    invoke-static {}, Lcom/flyersoft/tools/A;->setHyphenation()V

    .line 666
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$21;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$msetHyphenationValue(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    .line 667
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$21;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$mrefreshTxtRender(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    return-void
.end method
