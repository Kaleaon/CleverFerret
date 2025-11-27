.class Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM$2;
.super Landroidx/core/hardware/fingerprint/FingerprintManagerCompat$AuthenticationCallback;
.source "FingerprintAndrM.java"


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

    .line 101
    iput-object p1, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM$2;->this$0:Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;

    invoke-direct {p0}, Landroidx/core/hardware/fingerprint/FingerprintManagerCompat$AuthenticationCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onAuthenticationError(ILjava/lang/CharSequence;)V
    .locals 1

    .line 104
    invoke-super {p0, p1, p2}, Landroidx/core/hardware/fingerprint/FingerprintManagerCompat$AuthenticationCallback;->onAuthenticationError(ILjava/lang/CharSequence;)V

    const/4 v0, 0x5

    if-eq p1, v0, :cond_0

    .line 107
    invoke-static {}, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;->-$$Nest$sfgetfingerprintDialog()Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;

    move-result-object p1

    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p2

    sget v0, Lcom/hailong/biometricprompt/R$color;->biometricprompt_color_FF5555:I

    invoke-virtual {p1, p2, v0}, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->setTip(Ljava/lang/String;I)V

    :cond_0
    return-void
.end method

.method public onAuthenticationFailed()V
    .locals 3

    .line 126
    invoke-super {p0}, Landroidx/core/hardware/fingerprint/FingerprintManagerCompat$AuthenticationCallback;->onAuthenticationFailed()V

    .line 127
    invoke-static {}, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;->-$$Nest$sfgetfingerprintDialog()Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;

    move-result-object v0

    iget-object v1, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM$2;->this$0:Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;

    invoke-static {v1}, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;->-$$Nest$fgetcontext(Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;)Landroid/app/Activity;

    move-result-object v1

    sget v2, Lcom/hailong/biometricprompt/R$string;->biometricprompt_verify_failed:I

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    sget v2, Lcom/hailong/biometricprompt/R$color;->biometricprompt_color_FF5555:I

    invoke-virtual {v0, v1, v2}, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->setTip(Ljava/lang/String;I)V

    .line 128
    iget-object v0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM$2;->this$0:Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;

    invoke-static {v0}, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;->-$$Nest$fgetfingerprintCallback(Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;)Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;

    move-result-object v0

    invoke-interface {v0}, Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;->onFailed()V

    return-void
.end method

.method public onAuthenticationHelp(ILjava/lang/CharSequence;)V
    .locals 1

    .line 112
    invoke-super {p0, p1, p2}, Landroidx/core/hardware/fingerprint/FingerprintManagerCompat$AuthenticationCallback;->onAuthenticationHelp(ILjava/lang/CharSequence;)V

    .line 113
    invoke-static {}, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;->-$$Nest$sfgetfingerprintDialog()Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;

    move-result-object p1

    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p2

    sget v0, Lcom/hailong/biometricprompt/R$color;->biometricprompt_color_FF5555:I

    invoke-virtual {p1, p2, v0}, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->setTip(Ljava/lang/String;I)V

    return-void
.end method

.method public onAuthenticationSucceeded(Landroidx/core/hardware/fingerprint/FingerprintManagerCompat$AuthenticationResult;)V
    .locals 2

    .line 118
    invoke-super {p0, p1}, Landroidx/core/hardware/fingerprint/FingerprintManagerCompat$AuthenticationCallback;->onAuthenticationSucceeded(Landroidx/core/hardware/fingerprint/FingerprintManagerCompat$AuthenticationResult;)V

    .line 119
    invoke-static {}, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;->-$$Nest$sfgetfingerprintDialog()Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;

    move-result-object p1

    iget-object v0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM$2;->this$0:Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;

    invoke-static {v0}, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;->-$$Nest$fgetcontext(Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;)Landroid/app/Activity;

    move-result-object v0

    sget v1, Lcom/hailong/biometricprompt/R$string;->biometricprompt_verify_success:I

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    sget v1, Lcom/hailong/biometricprompt/R$color;->biometricprompt_color_82C785:I

    invoke-virtual {p1, v0, v1}, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->setTip(Ljava/lang/String;I)V

    .line 120
    iget-object p1, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM$2;->this$0:Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;

    invoke-static {p1}, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;->-$$Nest$fgetfingerprintCallback(Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;)Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;

    move-result-object p1

    invoke-interface {p1}, Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;->onSucceeded()V

    .line 121
    invoke-static {}, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;->-$$Nest$sfgetfingerprintDialog()Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;

    move-result-object p1

    invoke-virtual {p1}, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->dismiss()V

    return-void
.end method
