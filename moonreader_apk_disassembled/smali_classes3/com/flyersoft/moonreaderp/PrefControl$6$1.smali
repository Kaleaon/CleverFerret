.class Lcom/flyersoft/moonreaderp/PrefControl$6$1;
.super Ljava/lang/Object;
.source "PrefControl.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefControl$6;->handleMessage(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefControl$6;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefControl$6;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 209
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefControl$6$1;->this$1:Lcom/flyersoft/moonreaderp/PrefControl$6;

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

    .line 212
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefControl$6$1;->this$1:Lcom/flyersoft/moonreaderp/PrefControl$6;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefControl$6;->this$0:Lcom/flyersoft/moonreaderp/PrefControl;

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->pcHeadsetKey:I

    sget p3, Lcom/flyersoft/tools/A;->doHeadsetKey:I

    invoke-static {p1, p2, p3}, Lcom/flyersoft/moonreaderp/PrefControl;->-$$Nest$mgetAction(Lcom/flyersoft/moonreaderp/PrefControl;II)I

    move-result p1

    const/16 p2, 0x13

    if-ne p1, p2, :cond_0

    .line 213
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefControl$6$1;->this$1:Lcom/flyersoft/moonreaderp/PrefControl$6;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefControl$6;->this$0:Lcom/flyersoft/moonreaderp/PrefControl;

    sget p3, Lcom/flyersoft/moonreaderp/R$id;->pcMediaPause:I

    sget p4, Lcom/flyersoft/tools/A;->doHeadsetKey:I

    invoke-static {p1, p3, p4}, Lcom/flyersoft/moonreaderp/PrefControl;->-$$Nest$mgetAction(Lcom/flyersoft/moonreaderp/PrefControl;II)I

    move-result p1

    if-eq p1, p2, :cond_0

    .line 214
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefControl$6$1;->this$1:Lcom/flyersoft/moonreaderp/PrefControl$6;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefControl$6;->this$0:Lcom/flyersoft/moonreaderp/PrefControl;

    sget p3, Lcom/flyersoft/moonreaderp/R$id;->pcMediaPause:I

    invoke-static {p1, p3, p2}, Lcom/flyersoft/moonreaderp/PrefControl;->-$$Nest$msetSelection(Lcom/flyersoft/moonreaderp/PrefControl;II)V

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
