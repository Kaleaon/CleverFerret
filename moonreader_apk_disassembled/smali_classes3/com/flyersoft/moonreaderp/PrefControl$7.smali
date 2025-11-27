.class Lcom/flyersoft/moonreaderp/PrefControl$7;
.super Ljava/lang/Object;
.source "PrefControl.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefControl;->setScreenOrientation()V
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

    .line 244
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefControl$7;->this$0:Lcom/flyersoft/moonreaderp/PrefControl;

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

    .line 247
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "#onItemSelected:"

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x1

    new-array p2, p2, [Ljava/lang/Object;

    const/4 p4, 0x0

    aput-object p1, p2, p4

    invoke-static {p2}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 248
    sget p1, Lcom/flyersoft/tools/A;->screenState:I

    if-eqz p1, :cond_0

    if-nez p3, :cond_0

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefControl$7;->this$0:Lcom/flyersoft/moonreaderp/PrefControl;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/A;->isAutoRotateScreen(Landroid/content/Context;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 249
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefControl$7;->this$0:Lcom/flyersoft/moonreaderp/PrefControl;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefControl$7;->this$0:Lcom/flyersoft/moonreaderp/PrefControl;

    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/PrefControl;->getContext()Landroid/content/Context;

    move-result-object p2

    sget p3, Lcom/flyersoft/moonreaderp/R$string;->auto_sensor_failed_tip:I

    invoke-virtual {p2, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;)V

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
