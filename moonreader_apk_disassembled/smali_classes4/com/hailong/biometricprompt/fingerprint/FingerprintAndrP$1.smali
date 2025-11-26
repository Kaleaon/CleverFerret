.class Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP$1;
.super Landroid/hardware/biometrics/BiometricPrompt$AuthenticationCallback;
.source "FingerprintAndrP.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;


# direct methods
.method constructor <init>(Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 101
    iput-object p1, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP$1;->this$0:Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;

    invoke-direct {p0}, Landroid/hardware/biometrics/BiometricPrompt$AuthenticationCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onAuthenticationError(ILjava/lang/CharSequence;)V
    .locals 2

    .line 104
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "errorCode["

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "] "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "MR2"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    invoke-super {p0, p1, p2}, Landroid/hardware/biometrics/BiometricPrompt$AuthenticationCallback;->onAuthenticationError(ILjava/lang/CharSequence;)V

    .line 106
    iget-object p1, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP$1;->this$0:Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;

    invoke-static {p1}, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;->-$$Nest$fgetfingerprintCallback(Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;)Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 111
    iget-object p1, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP$1;->this$0:Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;

    invoke-static {p1}, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;->-$$Nest$fgetfingerprintCallback(Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;)Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;

    move-result-object p1

    invoke-interface {p1}, Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;->onCancel()V

    :cond_0
    return-void
.end method

.method public onAuthenticationFailed()V
    .locals 1

    .line 129
    invoke-super {p0}, Landroid/hardware/biometrics/BiometricPrompt$AuthenticationCallback;->onAuthenticationFailed()V

    .line 130
    iget-object v0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP$1;->this$0:Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;

    invoke-static {v0}, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;->-$$Nest$fgetfingerprintCallback(Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;)Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 131
    iget-object v0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP$1;->this$0:Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;

    invoke-static {v0}, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;->-$$Nest$fgetfingerprintCallback(Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;)Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;

    move-result-object v0

    invoke-interface {v0}, Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;->onFailed()V

    :cond_0
    return-void
.end method

.method public onAuthenticationHelp(ILjava/lang/CharSequence;)V
    .locals 0

    .line 117
    invoke-super {p0, p1, p2}, Landroid/hardware/biometrics/BiometricPrompt$AuthenticationCallback;->onAuthenticationHelp(ILjava/lang/CharSequence;)V

    return-void
.end method

.method public onAuthenticationSucceeded(Landroid/hardware/biometrics/BiometricPrompt$AuthenticationResult;)V
    .locals 0

    .line 122
    invoke-super {p0, p1}, Landroid/hardware/biometrics/BiometricPrompt$AuthenticationCallback;->onAuthenticationSucceeded(Landroid/hardware/biometrics/BiometricPrompt$AuthenticationResult;)V

    .line 123
    iget-object p1, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP$1;->this$0:Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;

    invoke-static {p1}, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;->-$$Nest$fgetfingerprintCallback(Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;)Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 124
    iget-object p1, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP$1;->this$0:Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;

    invoke-static {p1}, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;->-$$Nest$fgetfingerprintCallback(Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;)Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;

    move-result-object p1

    invoke-interface {p1}, Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;->onSucceeded()V

    :cond_0
    return-void
.end method
