.class Lcom/flyersoft/moonreaderp/ActivityTxt$40;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->showControlOptions(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$headsetNone:Z

.field final synthetic val$preScreenState:I


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;IZ)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
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

    .line 3217
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$40;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$40;->val$preScreenState:I

    iput-boolean p3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$40;->val$headsetNone:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 3

    .line 3219
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$40;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/16 v0, 0x320

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->restoreScrollToTopBug(I)V

    const/4 p1, 0x1

    .line 3220
    invoke-static {p1}, Lcom/flyersoft/tools/A;->setSystemUiVisibility(Z)V

    .line 3221
    iget p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$40;->val$preScreenState:I

    sget v0, Lcom/flyersoft/tools/A;->screenState:I

    if-eq p1, v0, :cond_1

    .line 3222
    sget p1, Lcom/flyersoft/tools/A;->screenState:I

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$40;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->isAutoRotateScreen(Landroid/content/Context;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 3223
    iget p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$40;->val$preScreenState:I

    sput p1, Lcom/flyersoft/tools/A;->screenState:I

    .line 3224
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$40;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->SaveOptions(Landroid/content/Context;)V

    .line 3225
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$40;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->error:I

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$40;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->auto_sensor_failed_tip:I

    invoke-virtual {v1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 3227
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$40;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputisPressScreenStateButton(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    .line 3228
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$40;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->setScreenOrientation()V

    .line 3231
    :cond_1
    :goto_0
    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$40;->val$headsetNone:Z

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$40;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$misHeadsetNone(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    move-result p1

    if-nez p1, :cond_2

    .line 3232
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$40;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mAndroidOreoPlaySilence(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 3233
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$40;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mregisterHardwares(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    return-void
.end method
