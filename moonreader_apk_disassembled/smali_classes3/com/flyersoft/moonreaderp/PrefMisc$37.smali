.class Lcom/flyersoft/moonreaderp/PrefMisc$37;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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

    .line 1144
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$37;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$37;->val$lsb:Landroid/widget/SeekBar;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefMisc$37;->val$rsb:Landroid/widget/SeekBar;

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/PrefMisc$37;->val$tsb:Landroid/widget/SeekBar;

    iput-object p5, p0, Lcom/flyersoft/moonreaderp/PrefMisc$37;->val$bsb:Landroid/widget/SeekBar;

    iput-object p6, p0, Lcom/flyersoft/moonreaderp/PrefMisc$37;->val$lspace:Landroid/view/View;

    iput-object p7, p0, Lcom/flyersoft/moonreaderp/PrefMisc$37;->val$rspace:Landroid/view/View;

    iput-object p8, p0, Lcom/flyersoft/moonreaderp/PrefMisc$37;->val$tspace:Landroid/view/View;

    iput-object p9, p0, Lcom/flyersoft/moonreaderp/PrefMisc$37;->val$bspace:Landroid/view/View;

    iput-object p10, p0, Lcom/flyersoft/moonreaderp/PrefMisc$37;->val$lay:Landroid/widget/LinearLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    const/16 p1, 0x8

    .line 1147
    sput p1, Lcom/flyersoft/tools/A;->bedge:I

    sput p1, Lcom/flyersoft/tools/A;->tedge:I

    sput p1, Lcom/flyersoft/tools/A;->redge:I

    sput p1, Lcom/flyersoft/tools/A;->ledge:I

    .line 1148
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$37;->val$lsb:Landroid/widget/SeekBar;

    sget v0, Lcom/flyersoft/tools/A;->ledge:I

    invoke-virtual {p1, v0}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 1149
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$37;->val$rsb:Landroid/widget/SeekBar;

    sget v0, Lcom/flyersoft/tools/A;->redge:I

    invoke-virtual {p1, v0}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 1150
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$37;->val$tsb:Landroid/widget/SeekBar;

    sget v0, Lcom/flyersoft/tools/A;->tedge:I

    invoke-virtual {p1, v0}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 1151
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$37;->val$bsb:Landroid/widget/SeekBar;

    sget v0, Lcom/flyersoft/tools/A;->bedge:I

    invoke-virtual {p1, v0}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 1152
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$37;->val$lspace:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    sget v0, Lcom/flyersoft/tools/A;->ledge:I

    int-to-float v0, v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    iput v0, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 1153
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$37;->val$rspace:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    sget v0, Lcom/flyersoft/tools/A;->redge:I

    int-to-float v0, v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    iput v0, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 1154
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$37;->val$tspace:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    sget v0, Lcom/flyersoft/tools/A;->tedge:I

    int-to-float v0, v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    iput v0, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 1155
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$37;->val$bspace:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    sget v0, Lcom/flyersoft/tools/A;->bedge:I

    int-to-float v0, v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    iput v0, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 1156
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$37;->val$lay:Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->requestLayout()V

    return-void
.end method
