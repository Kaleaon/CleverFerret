.class Lcom/flyersoft/moonreaderp/PrefMisc$66;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->setTiltOptions(Landroid/content/Context;Lcom/flyersoft/moonreaderp/ActivityTxt;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$act:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$cb:Landroid/widget/CheckBox;

.field final synthetic val$sb1:Landroid/widget/SeekBar;

.field final synthetic val$sb2:Landroid/widget/SeekBar;

.field final synthetic val$sp1:Landroid/widget/Spinner;

.field final synthetic val$sp2:Landroid/widget/Spinner;


# direct methods
.method constructor <init>(Landroid/widget/CheckBox;Landroid/widget/SeekBar;Landroid/widget/SeekBar;Landroid/widget/Spinner;Landroid/widget/Spinner;Lcom/flyersoft/moonreaderp/ActivityTxt;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1702
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$66;->val$cb:Landroid/widget/CheckBox;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$66;->val$sb1:Landroid/widget/SeekBar;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefMisc$66;->val$sb2:Landroid/widget/SeekBar;

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/PrefMisc$66;->val$sp1:Landroid/widget/Spinner;

    iput-object p5, p0, Lcom/flyersoft/moonreaderp/PrefMisc$66;->val$sp2:Landroid/widget/Spinner;

    iput-object p6, p0, Lcom/flyersoft/moonreaderp/PrefMisc$66;->val$act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 1704
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$66;->val$cb:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->askForTiltAction:Z

    .line 1705
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$66;->val$sb1:Landroid/widget/SeekBar;

    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result p1

    int-to-float p1, p1

    const/high16 p2, 0x41200000    # 10.0f

    div-float/2addr p1, p2

    const v0, 0x4089999a    # 4.3f

    sub-float p1, v0, p1

    sput p1, Lcom/flyersoft/tools/A;->tilt_forward_sensitive:F

    .line 1706
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$66;->val$sb2:Landroid/widget/SeekBar;

    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result p1

    int-to-float p1, p1

    div-float/2addr p1, p2

    sub-float/2addr v0, p1

    sput v0, Lcom/flyersoft/tools/A;->tilt_backward_sensitive:F

    .line 1707
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$66;->val$sp1:Landroid/widget/Spinner;

    invoke-virtual {p1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result p1

    sput p1, Lcom/flyersoft/tools/A;->tilt_forward:I

    .line 1708
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$66;->val$sp2:Landroid/widget/Spinner;

    invoke-virtual {p1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result p1

    sput p1, Lcom/flyersoft/tools/A;->tilt_backward:I

    .line 1709
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$66;->val$act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    if-eqz p1, :cond_0

    .line 1710
    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->registerShakeSensor()V

    .line 1711
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$66;->val$act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->shakeSensorLisener:Lcom/flyersoft/components/MyShakeSensorListener;

    if-eqz p1, :cond_0

    .line 1712
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$66;->val$act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->shakeSensorLisener:Lcom/flyersoft/components/MyShakeSensorListener;

    const/4 p2, 0x1

    iput-boolean p2, p1, Lcom/flyersoft/components/MyShakeSensorListener;->tilt_turn_page:Z

    :cond_0
    return-void
.end method
