.class Lcom/flyersoft/moonreaderp/ActivityMain$67;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->doFingerPrintCheck()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 6628
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$67;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel()V
    .locals 3

    const/4 v0, 0x1

    .line 6663
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "fingerprint onCancel"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 6664
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$67;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mshutdown(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    return-void
.end method

.method public onFailed()V
    .locals 3

    const/4 v0, 0x1

    .line 6651
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "fingerprint onFailed"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 6652
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$67;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v1, Lcom/hailong/biometricprompt/R$string;->biometricprompt_verify_failed:I

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void
.end method

.method public onHwUnavailable()V
    .locals 3

    const/4 v0, 0x1

    .line 6631
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "no fingerprint hardware"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 6632
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$67;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mdoTextPasswordCheck(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    return-void
.end method

.method public onNoneEnrolled()V
    .locals 3

    const/4 v0, 0x1

    .line 6637
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "no fingerprint enrolled"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 6638
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$67;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mdoTextPasswordCheck(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    return-void
.end method

.method public onSucceeded()V
    .locals 4

    const/4 v0, 0x1

    .line 6643
    new-array v1, v0, [Ljava/lang/Object;

    const-string v2, "fingerprint onSucceeded"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 6644
    sput-boolean v0, Lcom/flyersoft/tools/A;->passwordOK:Z

    .line 6645
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$67;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mdo_onCreate(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 6646
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$67;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mforceUpdateMainPager(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    return-void
.end method

.method public onUsepwd()V
    .locals 3

    const/4 v0, 0x1

    .line 6657
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "fingerprint onUsepwd"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 6658
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$67;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mdoTextPasswordCheck(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    return-void
.end method
