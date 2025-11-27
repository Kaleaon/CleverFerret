.class public Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager;
.super Ljava/lang/Object;
.source "FingerprintVerifyManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;)V
    .locals 3

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    invoke-static {}, Lcom/hailong/biometricprompt/uitls/AndrVersionUtil;->isAboveAndrP()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 62
    invoke-static {p1}, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;->-$$Nest$fgetenableAndroidP(Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 63
    invoke-static {}, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;->newInstance()Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;

    move-result-object v0

    goto :goto_0

    .line 65
    :cond_0
    invoke-static {}, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;->newInstance()Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;

    move-result-object v0

    goto :goto_0

    .line 66
    :cond_1
    invoke-static {}, Lcom/hailong/biometricprompt/uitls/AndrVersionUtil;->isAboveAndrM()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 67
    invoke-static {}, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;->newInstance()Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;

    move-result-object v0

    .line 73
    :goto_0
    invoke-static {p1}, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;->-$$Nest$fgetcontext(Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;)Landroid/app/Activity;

    move-result-object v1

    invoke-static {p1}, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;->-$$Nest$fgetcallback(Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;)Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/hailong/biometricprompt/fingerprint/IFingerprint;->canAuthenticate(Landroid/content/Context;Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;)Z

    move-result v1

    if-nez v1, :cond_2

    return-void

    .line 80
    :cond_2
    new-instance v1, Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;

    invoke-direct {v1}, Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;-><init>()V

    .line 81
    invoke-static {p1}, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;->-$$Nest$fgetcancelTextColor(Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;->setCancelTextColor(I)V

    .line 82
    invoke-static {p1}, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;->-$$Nest$fgetusepwdTextColor(Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;->setUsepwdTextColor(I)V

    .line 83
    invoke-static {p1}, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;->-$$Nest$fgetfingerprintColor(Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;->setFingerprintColor(I)V

    .line 84
    invoke-static {p1}, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;->-$$Nest$fgetusepwdVisible(Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;)Z

    move-result v2

    invoke-virtual {v1, v2}, Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;->setUsepwdVisible(Z)V

    .line 87
    invoke-static {p1}, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;->-$$Nest$fgettitle(Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;->setTitle(Ljava/lang/String;)V

    .line 88
    invoke-static {p1}, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;->-$$Nest$fgetsubTitle(Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;->setSubTitle(Ljava/lang/String;)V

    .line 89
    invoke-static {p1}, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;->-$$Nest$fgetdescription(Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;->setDescription(Ljava/lang/String;)V

    .line 90
    invoke-static {p1}, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;->-$$Nest$fgetcancelBtnText(Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;->setCancelBtnText(Ljava/lang/String;)V

    .line 92
    invoke-static {p1}, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;->-$$Nest$fgetcontext(Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;)Landroid/app/Activity;

    move-result-object v2

    invoke-static {p1}, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;->-$$Nest$fgetcallback(Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;)Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;

    move-result-object p1

    invoke-interface {v0, v2, v1, p1}, Lcom/hailong/biometricprompt/fingerprint/IFingerprint;->authenticate(Landroid/app/Activity;Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;)V

    return-void

    .line 69
    :cond_3
    invoke-static {p1}, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;->-$$Nest$fgetcallback(Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$Builder;)Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;

    move-result-object p1

    invoke-interface {p1}, Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;->onHwUnavailable()V

    return-void
.end method

.method public static available(Landroid/content/Context;)Z
    .locals 1

    .line 25
    invoke-static {}, Lcom/hailong/biometricprompt/uitls/AndrVersionUtil;->isAboveAndrM()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 26
    invoke-static {p0}, Landroidx/core/hardware/fingerprint/FingerprintManagerCompat;->from(Landroid/content/Context;)Landroidx/core/hardware/fingerprint/FingerprintManagerCompat;

    move-result-object p0

    invoke-virtual {p0}, Landroidx/core/hardware/fingerprint/FingerprintManagerCompat;->isHardwareDetected()Z

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static hasEnrolled(Landroid/content/Context;)Z
    .locals 1

    .line 32
    invoke-static {}, Lcom/hailong/biometricprompt/uitls/AndrVersionUtil;->isAboveAndrM()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 33
    invoke-static {p0}, Landroidx/core/hardware/fingerprint/FingerprintManagerCompat;->from(Landroid/content/Context;)Landroidx/core/hardware/fingerprint/FingerprintManagerCompat;

    move-result-object p0

    invoke-virtual {p0}, Landroidx/core/hardware/fingerprint/FingerprintManagerCompat;->hasEnrolledFingerprints()Z

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method static synthetic lambda$showEnrollDialog$0(Landroid/content/Context;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 45
    new-instance p1, Landroid/content/Intent;

    const-string p2, "android.settings.FINGERPRINT_ENROLL"

    invoke-direct {p1, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 46
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic lambda$showEnrollDialog$1(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 50
    invoke-interface {p0}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method

.method public static showEnrollDialog(Landroid/content/Context;)Z
    .locals 3

    .line 39
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    const/4 v2, 0x0

    if-lt v0, v1, :cond_0

    .line 40
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget v1, Lcom/hailong/biometricprompt/R$string;->biometricprompt_finger_add:I

    .line 42
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 43
    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x104000a

    .line 44
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0}, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$$ExternalSyntheticLambda0;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/high16 v1, 0x1040000

    .line 49
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    new-instance v1, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$$ExternalSyntheticLambda1;

    invoke-direct {v1}, Lcom/hailong/biometricprompt/fingerprint/FingerprintVerifyManager$$ExternalSyntheticLambda1;-><init>()V

    invoke-virtual {v0, p0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 53
    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog;->show()V

    const/4 p0, 0x1

    return p0

    :cond_0
    return v2
.end method
