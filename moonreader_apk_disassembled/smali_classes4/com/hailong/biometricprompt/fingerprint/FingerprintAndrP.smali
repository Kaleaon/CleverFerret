.class public Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;
.super Ljava/lang/Object;
.source "FingerprintAndrP.java"

# interfaces
.implements Lcom/hailong/biometricprompt/fingerprint/IFingerprint;


# static fields
.field private static cryptoObject:Landroid/hardware/biometrics/BiometricPrompt$CryptoObject;

.field private static fingerprintAndrP:Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;


# instance fields
.field private authenticationCallback:Landroid/hardware/biometrics/BiometricPrompt$AuthenticationCallback;

.field private cancellationSignal:Landroid/os/CancellationSignal;

.field private fingerprintCallback:Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;


# direct methods
.method static bridge synthetic -$$Nest$fgetfingerprintCallback(Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;)Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;
    .locals 0

    iget-object p0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;->fingerprintCallback:Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;

    return-object p0
.end method

.method public constructor <init>()V
    .locals 1

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 101
    new-instance v0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP$1;

    invoke-direct {v0, p0}, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP$1;-><init>(Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;)V

    iput-object v0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;->authenticationCallback:Landroid/hardware/biometrics/BiometricPrompt$AuthenticationCallback;

    return-void
.end method

.method static synthetic lambda$authenticate$1(Landroid/content/DialogInterface;I)V
    .locals 0

    return-void
.end method

.method public static newInstance()Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;
    .locals 2

    .line 81
    sget-object v0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;->fingerprintAndrP:Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;

    if-nez v0, :cond_1

    .line 82
    const-class v0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;

    monitor-enter v0

    .line 83
    :try_start_0
    sget-object v1, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;->fingerprintAndrP:Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;

    if-nez v1, :cond_0

    .line 84
    new-instance v1, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;

    invoke-direct {v1}, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;-><init>()V

    sput-object v1, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;->fingerprintAndrP:Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;

    .line 86
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 90
    :cond_1
    :goto_0
    :try_start_1
    invoke-static {}, Lcom/flyersoft/tools/T$$ExternalSyntheticApiModelOutline4;->m()V

    new-instance v0, Lcom/hailong/biometricprompt/uitls/CipherHelper;

    invoke-direct {v0}, Lcom/hailong/biometricprompt/uitls/CipherHelper;-><init>()V

    invoke-virtual {v0}, Lcom/hailong/biometricprompt/uitls/CipherHelper;->createCipher()Ljavax/crypto/Cipher;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T$$ExternalSyntheticApiModelOutline4;->m(Ljavax/crypto/Cipher;)Landroid/hardware/biometrics/BiometricPrompt$CryptoObject;

    move-result-object v0

    sput-object v0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;->cryptoObject:Landroid/hardware/biometrics/BiometricPrompt$CryptoObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 92
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 95
    :goto_1
    sget-object v0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;->fingerprintAndrP:Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;

    return-object v0
.end method


# virtual methods
.method public authenticate(Landroid/app/Activity;Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;)V
    .locals 3

    .line 38
    iput-object p3, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;->fingerprintCallback:Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;

    .line 43
    invoke-virtual {p2}, Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;->getTitle()Ljava/lang/String;

    move-result-object p3

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-eqz p3, :cond_0

    sget p3, Lcom/hailong/biometricprompt/R$string;->biometricprompt_fingerprint_verification:I

    invoke-virtual {p1, p3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p3

    goto :goto_0

    :cond_0
    invoke-virtual {p2}, Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;->getTitle()Ljava/lang/String;

    move-result-object p3

    .line 44
    :goto_0
    invoke-virtual {p2}, Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;->getCancelBtnText()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/high16 v0, 0x1040000

    .line 45
    invoke-virtual {p1, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 46
    :cond_1
    invoke-virtual {p2}, Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;->getCancelBtnText()Ljava/lang/String;

    move-result-object v0

    .line 47
    :goto_1
    invoke-static {p1}, Lcom/flyersoft/tools/T$$ExternalSyntheticApiModelOutline4;->m(Landroid/content/Context;)Landroid/hardware/biometrics/BiometricPrompt$Builder;

    move-result-object v1

    .line 48
    invoke-static {v1, p3}, Lcom/flyersoft/tools/T$$ExternalSyntheticApiModelOutline4;->m(Landroid/hardware/biometrics/BiometricPrompt$Builder;Ljava/lang/CharSequence;)Landroid/hardware/biometrics/BiometricPrompt$Builder;

    move-result-object p3

    new-instance v1, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP$$ExternalSyntheticLambda10;

    invoke-direct {v1, p0}, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP$$ExternalSyntheticLambda10;-><init>(Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;)V

    new-instance v2, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP$$ExternalSyntheticLambda11;

    invoke-direct {v2}, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP$$ExternalSyntheticLambda11;-><init>()V

    .line 49
    invoke-static {p3, v0, v1, v2}, Lcom/flyersoft/tools/T$$ExternalSyntheticApiModelOutline4;->m(Landroid/hardware/biometrics/BiometricPrompt$Builder;Ljava/lang/CharSequence;Ljava/util/concurrent/Executor;Landroid/content/DialogInterface$OnClickListener;)Landroid/hardware/biometrics/BiometricPrompt$Builder;

    move-result-object p3

    .line 56
    invoke-virtual {p2}, Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;->getSubTitle()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 57
    invoke-virtual {p2}, Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;->getSubTitle()Ljava/lang/String;

    move-result-object v0

    invoke-static {p3, v0}, Lcom/flyersoft/tools/T$$ExternalSyntheticApiModelOutline4;->m$1(Landroid/hardware/biometrics/BiometricPrompt$Builder;Ljava/lang/CharSequence;)Landroid/hardware/biometrics/BiometricPrompt$Builder;

    .line 58
    :cond_2
    invoke-virtual {p2}, Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;->getDescription()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 59
    invoke-virtual {p2}, Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;->getDescription()Ljava/lang/String;

    move-result-object p2

    invoke-static {p3, p2}, Lcom/flyersoft/tools/T$$ExternalSyntheticApiModelOutline4;->m$2(Landroid/hardware/biometrics/BiometricPrompt$Builder;Ljava/lang/CharSequence;)Landroid/hardware/biometrics/BiometricPrompt$Builder;

    .line 62
    :cond_3
    invoke-static {p3}, Lcom/flyersoft/tools/T$$ExternalSyntheticApiModelOutline4;->m(Landroid/hardware/biometrics/BiometricPrompt$Builder;)Landroid/hardware/biometrics/BiometricPrompt;

    move-result-object p2

    .line 65
    new-instance p3, Landroid/os/CancellationSignal;

    invoke-direct {p3}, Landroid/os/CancellationSignal;-><init>()V

    iput-object p3, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;->cancellationSignal:Landroid/os/CancellationSignal;

    .line 66
    new-instance v0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP$$ExternalSyntheticLambda12;

    invoke-direct {v0, p0}, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP$$ExternalSyntheticLambda12;-><init>(Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;)V

    invoke-virtual {p3, v0}, Landroid/os/CancellationSignal;->setOnCancelListener(Landroid/os/CancellationSignal$OnCancelListener;)V

    .line 77
    sget-object p3, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;->cryptoObject:Landroid/hardware/biometrics/BiometricPrompt$CryptoObject;

    iget-object v0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;->cancellationSignal:Landroid/os/CancellationSignal;

    invoke-static {p1}, Lcom/flyersoft/tools/T$$ExternalSyntheticApiModelOutline4;->m(Landroid/app/Activity;)Ljava/util/concurrent/Executor;

    move-result-object p1

    iget-object v1, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;->authenticationCallback:Landroid/hardware/biometrics/BiometricPrompt$AuthenticationCallback;

    invoke-static {p2, p3, v0, p1, v1}, Lcom/flyersoft/tools/T$$ExternalSyntheticApiModelOutline4;->m(Landroid/hardware/biometrics/BiometricPrompt;Landroid/hardware/biometrics/BiometricPrompt$CryptoObject;Landroid/os/CancellationSignal;Ljava/util/concurrent/Executor;Landroid/hardware/biometrics/BiometricPrompt$AuthenticationCallback;)V

    return-void
.end method

.method public canAuthenticate(Landroid/content/Context;Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;)Z
    .locals 2

    .line 146
    invoke-static {p1}, Landroidx/core/hardware/fingerprint/FingerprintManagerCompat;->from(Landroid/content/Context;)Landroidx/core/hardware/fingerprint/FingerprintManagerCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/core/hardware/fingerprint/FingerprintManagerCompat;->isHardwareDetected()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 147
    invoke-interface {p2}, Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;->onHwUnavailable()V

    return v1

    .line 151
    :cond_0
    invoke-static {p1}, Landroidx/core/hardware/fingerprint/FingerprintManagerCompat;->from(Landroid/content/Context;)Landroidx/core/hardware/fingerprint/FingerprintManagerCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/core/hardware/fingerprint/FingerprintManagerCompat;->hasEnrolledFingerprints()Z

    move-result p1

    if-nez p1, :cond_1

    .line 152
    invoke-interface {p2}, Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;->onNoneEnrolled()V

    return v1

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method synthetic lambda$authenticate$0$com-hailong-biometricprompt-fingerprint-FingerprintAndrP(Ljava/lang/Runnable;)V
    .locals 1

    .line 50
    const-string p1, "MR2"

    const-string v0, "cancelText1"

    invoke-static {p1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    iget-object p1, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;->fingerprintCallback:Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;

    if-eqz p1, :cond_0

    .line 52
    invoke-interface {p1}, Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;->onCancel()V

    :cond_0
    return-void
.end method

.method synthetic lambda$authenticate$2$com-hailong-biometricprompt-fingerprint-FingerprintAndrP()V
    .locals 2

    .line 67
    const-string v0, "MR2"

    const-string v1, "cancelText2"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    iget-object v0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;->fingerprintCallback:Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;

    if-eqz v0, :cond_0

    .line 69
    invoke-interface {v0}, Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;->onCancel()V

    :cond_0
    return-void
.end method
