.class Lcom/flyersoft/moonreaderp/PrefMisc$28;
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

.field final synthetic val$linkNightView:Landroid/view/View;

.field final synthetic val$linkView:Landroid/view/View;

.field final synthetic val$pdfColorView:Landroid/view/View;

.field final synthetic val$visitedNightView:Landroid/view/View;

.field final synthetic val$visitedView:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefMisc;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
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
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 944
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$28;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$28;->val$linkView:Landroid/view/View;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefMisc$28;->val$linkNightView:Landroid/view/View;

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/PrefMisc$28;->val$visitedView:Landroid/view/View;

    iput-object p5, p0, Lcom/flyersoft/moonreaderp/PrefMisc$28;->val$visitedNightView:Landroid/view/View;

    iput-object p6, p0, Lcom/flyersoft/moonreaderp/PrefMisc$28;->val$pdfColorView:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    const p1, -0x9f9f1c

    .line 947
    sput p1, Lcom/flyersoft/tools/A;->linkColor:I

    .line 948
    sput p1, Lcom/flyersoft/tools/A;->linkColorNight:I

    const p1, -0x666634

    .line 949
    sput p1, Lcom/flyersoft/tools/A;->linkVisitedColor:I

    .line 950
    sput p1, Lcom/flyersoft/tools/A;->linkVisitedColorNight:I

    .line 951
    sget p1, Lcom/radaee/pdf/Global;->annotTransparencyColorDefault:I

    sput p1, Lcom/radaee/pdf/Global;->annotTransparencyColor:I

    .line 952
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$28;->val$linkView:Landroid/view/View;

    sget v0, Lcom/flyersoft/tools/A;->linkColor:I

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 953
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$28;->val$linkNightView:Landroid/view/View;

    sget v0, Lcom/flyersoft/tools/A;->linkColorNight:I

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 954
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$28;->val$visitedView:Landroid/view/View;

    sget v0, Lcom/flyersoft/tools/A;->linkVisitedColor:I

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 955
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$28;->val$visitedNightView:Landroid/view/View;

    sget v0, Lcom/flyersoft/tools/A;->linkVisitedColorNight:I

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 956
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$28;->val$pdfColorView:Landroid/view/View;

    sget v0, Lcom/radaee/pdf/Global;->annotTransparencyColor:I

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 957
    sget-boolean p1, Lcom/radaee/pdf/Global;->ms_init:Z

    if-eqz p1, :cond_0

    .line 958
    sget p1, Lcom/radaee/pdf/Global;->annotTransparencyColor:I

    invoke-static {p1}, Lcom/radaee/pdf/Global;->setAnnotTransparency(I)V

    :cond_0
    return-void
.end method
