.class Lcom/flyersoft/moonreaderp/PrefPdf$6$1;
.super Ljava/lang/Object;
.source "PrefPdf.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefPdf$6;->handleMessage(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefPdf$6;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefPdf$6;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 231
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefPdf$6$1;->this$1:Lcom/flyersoft/moonreaderp/PrefPdf$6;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 234
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    const/4 p3, 0x2

    new-array p3, p3, [Ljava/lang/Object;

    const-string p4, "*onItemSelected"

    const/4 p5, 0x0

    aput-object p4, p3, p5

    const/4 p4, 0x1

    aput-object p2, p3, p4

    invoke-static {p3}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 235
    invoke-static {p1}, Lcom/flyersoft/tools/A;->checkSpinnerItemNightState(Landroid/widget/AdapterView;)V

    .line 236
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefPdf$6$1;->this$1:Lcom/flyersoft/moonreaderp/PrefPdf$6;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefPdf$6;->this$0:Lcom/flyersoft/moonreaderp/PrefPdf;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefPdf;->flip_type_sp:Landroid/widget/Spinner;

    invoke-virtual {p1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result p1

    sput p1, Lcom/radaee/pdf/Global;->flip_pdf:I

    sput p1, Lcom/flyersoft/tools/A;->flip_pdf:I

    sput p1, Lcom/flyersoft/tools/A;->flip_animation:I

    .line 237
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefPdf$6$1;->this$1:Lcom/flyersoft/moonreaderp/PrefPdf$6;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefPdf$6;->this$0:Lcom/flyersoft/moonreaderp/PrefPdf;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefPdf;->-$$Nest$msetFlipLayVisiblity(Lcom/flyersoft/moonreaderp/PrefPdf;)V

    .line 238
    sget-boolean p1, Lcom/flyersoft/tools/A;->toggleTapMode:Z

    if-nez p1, :cond_0

    sget p1, Lcom/flyersoft/tools/A;->tapMode:I

    const/4 p2, 0x4

    if-ge p1, p2, :cond_0

    invoke-static {}, Lcom/flyersoft/tools/A;->toggleTapModeForFlip()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 239
    sput-boolean p4, Lcom/flyersoft/tools/A;->toggleTapMode:Z

    .line 240
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefPdf$6$1;->this$1:Lcom/flyersoft/moonreaderp/PrefPdf$6;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefPdf$6;->this$0:Lcom/flyersoft/moonreaderp/PrefPdf;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefPdf;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefPdf$6$1;->this$1:Lcom/flyersoft/moonreaderp/PrefPdf$6;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefPdf$6;->this$0:Lcom/flyersoft/moonreaderp/PrefPdf;

    .line 241
    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/PrefPdf;->getContext()Landroid/content/Context;

    move-result-object p2

    sget p3, Lcom/flyersoft/moonreaderp/R$string;->flip_animation:I

    invoke-virtual {p2, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    iget-object p3, p0, Lcom/flyersoft/moonreaderp/PrefPdf$6$1;->this$1:Lcom/flyersoft/moonreaderp/PrefPdf$6;

    iget-object p3, p3, Lcom/flyersoft/moonreaderp/PrefPdf$6;->this$0:Lcom/flyersoft/moonreaderp/PrefPdf;

    .line 242
    invoke-virtual {p3}, Lcom/flyersoft/moonreaderp/PrefPdf;->getContext()Landroid/content/Context;

    move-result-object p3

    sget p4, Lcom/flyersoft/moonreaderp/R$string;->switch_Left_right_mode:I

    invoke-virtual {p3, p4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p3

    .line 240
    invoke-static {p1, p2, p3}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;)V"
        }
    .end annotation

    return-void
.end method
