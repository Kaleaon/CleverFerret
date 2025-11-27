.class Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM$1;
.super Ljava/lang/Object;
.source "FingerprintAndrM.java"

# interfaces
.implements Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog$OnDialogActionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;


# direct methods
.method constructor <init>(Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 78
    iput-object p1, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM$1;->this$0:Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancle()V
    .locals 1

    .line 87
    iget-object v0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM$1;->this$0:Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;

    invoke-static {v0}, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;->-$$Nest$fgetfingerprintCallback(Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;)Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 88
    iget-object v0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM$1;->this$0:Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;

    invoke-static {v0}, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;->-$$Nest$fgetfingerprintCallback(Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;)Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;

    move-result-object v0

    invoke-interface {v0}, Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;->onCancel()V

    :cond_0
    return-void
.end method

.method public onDismiss()V
    .locals 1

    .line 93
    iget-object v0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM$1;->this$0:Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;

    invoke-static {v0}, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;->-$$Nest$fgetcancellationSignal(Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;)Landroidx/core/os/CancellationSignal;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM$1;->this$0:Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;

    invoke-static {v0}, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;->-$$Nest$fgetcancellationSignal(Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;)Landroidx/core/os/CancellationSignal;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/core/os/CancellationSignal;->isCanceled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 94
    iget-object v0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM$1;->this$0:Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;

    invoke-static {v0}, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;->-$$Nest$fgetcancellationSignal(Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;)Landroidx/core/os/CancellationSignal;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/core/os/CancellationSignal;->cancel()V

    :cond_0
    return-void
.end method

.method public onUsepwd()V
    .locals 1

    .line 81
    iget-object v0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM$1;->this$0:Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;

    invoke-static {v0}, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;->-$$Nest$fgetfingerprintCallback(Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;)Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 82
    iget-object v0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM$1;->this$0:Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;

    invoke-static {v0}, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;->-$$Nest$fgetfingerprintCallback(Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;)Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;

    move-result-object v0

    invoke-interface {v0}, Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;->onUsepwd()V

    :cond_0
    return-void
.end method
