.class Lcom/flyersoft/moonreaderp/PrefMisc$36;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

.field final synthetic val$bsb:Landroid/widget/SeekBar;

.field final synthetic val$bspace:Landroid/view/View;

.field final synthetic val$lay:Landroid/widget/LinearLayout;

.field final synthetic val$lsb:Landroid/widget/SeekBar;

.field final synthetic val$lspace:Landroid/view/View;

.field final synthetic val$rsb:Landroid/widget/SeekBar;

.field final synthetic val$rspace:Landroid/view/View;

.field final synthetic val$tsb:Landroid/widget/SeekBar;

.field final synthetic val$tspace:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefMisc;Landroid/widget/SeekBar;Landroid/widget/SeekBar;Landroid/widget/SeekBar;Landroid/widget/SeekBar;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/widget/LinearLayout;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010,
            0x1010,
            0x1010,
            0x1010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1113
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$36;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$36;->val$lsb:Landroid/widget/SeekBar;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefMisc$36;->val$rsb:Landroid/widget/SeekBar;

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/PrefMisc$36;->val$tsb:Landroid/widget/SeekBar;

    iput-object p5, p0, Lcom/flyersoft/moonreaderp/PrefMisc$36;->val$bsb:Landroid/widget/SeekBar;

    iput-object p6, p0, Lcom/flyersoft/moonreaderp/PrefMisc$36;->val$lspace:Landroid/view/View;

    iput-object p7, p0, Lcom/flyersoft/moonreaderp/PrefMisc$36;->val$rspace:Landroid/view/View;

    iput-object p8, p0, Lcom/flyersoft/moonreaderp/PrefMisc$36;->val$tspace:Landroid/view/View;

    iput-object p9, p0, Lcom/flyersoft/moonreaderp/PrefMisc$36;->val$bspace:Landroid/view/View;

    iput-object p10, p0, Lcom/flyersoft/moonreaderp/PrefMisc$36;->val$lay:Landroid/widget/LinearLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 2

    if-nez p3, :cond_0

    return-void

    .line 1118
    :cond_0
    iget-object p3, p0, Lcom/flyersoft/moonreaderp/PrefMisc$36;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    invoke-virtual {p3}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object p3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, ""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p3, v0}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    .line 1119
    iget-object p3, p0, Lcom/flyersoft/moonreaderp/PrefMisc$36;->val$lsb:Landroid/widget/SeekBar;

    if-ne p1, p3, :cond_1

    sput p2, Lcom/flyersoft/tools/A;->ledge:I

    .line 1120
    :cond_1
    iget-object p3, p0, Lcom/flyersoft/moonreaderp/PrefMisc$36;->val$rsb:Landroid/widget/SeekBar;

    if-ne p1, p3, :cond_2

    sput p2, Lcom/flyersoft/tools/A;->redge:I

    .line 1121
    :cond_2
    iget-object p3, p0, Lcom/flyersoft/moonreaderp/PrefMisc$36;->val$tsb:Landroid/widget/SeekBar;

    if-ne p1, p3, :cond_3

    sput p2, Lcom/flyersoft/tools/A;->tedge:I

    .line 1122
    :cond_3
    iget-object p3, p0, Lcom/flyersoft/moonreaderp/PrefMisc$36;->val$bsb:Landroid/widget/SeekBar;

    if-ne p1, p3, :cond_4

    sput p2, Lcom/flyersoft/tools/A;->bedge:I

    .line 1123
    :cond_4
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$36;->val$lspace:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    sget p2, Lcom/flyersoft/tools/A;->ledge:I

    int-to-float p2, p2

    invoke-static {p2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result p2

    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 1124
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$36;->val$rspace:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    sget p2, Lcom/flyersoft/tools/A;->redge:I

    int-to-float p2, p2

    invoke-static {p2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result p2

    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 1125
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$36;->val$tspace:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    sget p2, Lcom/flyersoft/tools/A;->tedge:I

    int-to-float p2, p2

    invoke-static {p2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result p2

    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 1126
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$36;->val$bspace:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    sget p2, Lcom/flyersoft/tools/A;->bedge:I

    int-to-float p2, p2

    invoke-static {p2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result p2

    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 1127
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$36;->val$lay:Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->requestLayout()V

    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method
