.class public Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;
.super Ljava/lang/Object;
.source "FingerprintAndrM.java"

# interfaces
.implements Lcom/hailong/biometricprompt/fingerprint/IFingerprint;


# static fields
.field private static cryptoObject:Landroidx/core/hardware/fingerprint/FingerprintManagerCompat$CryptoObject;

.field private static fingerprintAndrM:Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;

.field private static fingerprintDialog:Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;


# instance fields
.field private final TAG:Ljava/lang/String;

.field private authenticationCallback:Landroidx/core/hardware/fingerprint/FingerprintManagerCompat$AuthenticationCallback;

.field private cancellationSignal:Landroidx/core/os/CancellationSignal;

.field private context:Landroid/app/Activity;

.field private dialogActionListener:Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog$OnDialogActionListener;

.field private fingerprintCallback:Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;

.field private fingerprintManagerCompat:Landroidx/core/hardware/fingerprint/FingerprintManagerCompat;


# direct methods
.method static bridge synthetic -$$Nest$fgetcancellationSignal(Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;)Landroidx/core/os/CancellationSignal;
    .locals 0

    iget-object p0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;->cancellationSignal:Landroidx/core/os/CancellationSignal;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetcontext(Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;)Landroid/app/Activity;
    .locals 0

    iget-object p0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;->context:Landroid/app/Activity;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetfingerprintCallback(Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;)Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;
    .locals 0

    iget-object p0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;->fingerprintCallback:Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$sfgetfingerprintDialog()Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;
    .locals 1

    sget-object v0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;->fingerprintDialog:Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;

    return-object v0
.end method

.method public constructor <init>()V
    .locals 1

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    const-class v0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;->TAG:Ljava/lang/String;

    .line 78
    new-instance v0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM$1;

    invoke-direct {v0, p0}, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM$1;-><init>(Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;)V

    iput-object v0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;->dialogActionListener:Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog$OnDialogActionListener;

    .line 101
    new-instance v0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM$2;

    invoke-direct {v0, p0}, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM$2;-><init>(Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;)V

    iput-object v0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;->authenticationCallback:Landroidx/core/hardware/fingerprint/FingerprintManagerCompat$AuthenticationCallback;

    return-void
.end method

.method static synthetic lambda$authenticate$0()V
    .locals 1

    .line 49
    sget-object v0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;->fingerprintDialog:Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;

    invoke-virtual {v0}, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->dismiss()V

    return-void
.end method

.method public static newInstance()Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;
    .locals 2

    .line 59
    sget-object v0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;->fingerprintAndrM:Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;

    if-nez v0, :cond_1

    .line 60
    const-class v0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;

    monitor-enter v0

    .line 61
    :try_start_0
    sget-object v1, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;->fingerprintAndrM:Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;

    if-nez v1, :cond_0

    .line 62
    new-instance v1, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;

    invoke-direct {v1}, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;-><init>()V

    sput-object v1, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;->fingerprintAndrM:Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;

    .line 64
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 68
    :cond_1
    :goto_0
    :try_start_1
    new-instance v0, Landroidx/core/hardware/fingerprint/FingerprintManagerCompat$CryptoObject;

    new-instance v1, Lcom/hailong/biometricprompt/uitls/CipherHelper;

    invoke-direct {v1}, Lcom/hailong/biometricprompt/uitls/CipherHelper;-><init>()V

    invoke-virtual {v1}, Lcom/hailong/biometricprompt/uitls/CipherHelper;->createCipher()Ljavax/crypto/Cipher;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/core/hardware/fingerprint/FingerprintManagerCompat$CryptoObject;-><init>(Ljavax/crypto/Cipher;)V

    sput-object v0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;->cryptoObject:Landroidx/core/hardware/fingerprint/FingerprintManagerCompat$CryptoObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 70
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 72
    :goto_1
    sget-object v0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;->fingerprintAndrM:Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;

    return-object v0
.end method


# virtual methods
.method public authenticate(Landroid/app/Activity;Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;)V
    .locals 7

    .line 42
    iput-object p1, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;->context:Landroid/app/Activity;

    .line 43
    iput-object p3, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;->fingerprintCallback:Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;

    .line 45
    invoke-static {p1}, Landroidx/core/hardware/fingerprint/FingerprintManagerCompat;->from(Landroid/content/Context;)Landroidx/core/hardware/fingerprint/FingerprintManagerCompat;

    move-result-object p3

    iput-object p3, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;->fingerprintManagerCompat:Landroidx/core/hardware/fingerprint/FingerprintManagerCompat;

    .line 48
    new-instance p3, Landroidx/core/os/CancellationSignal;

    invoke-direct {p3}, Landroidx/core/os/CancellationSignal;-><init>()V

    iput-object p3, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;->cancellationSignal:Landroidx/core/os/CancellationSignal;

    .line 49
    new-instance v0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM$$ExternalSyntheticLambda0;-><init>()V

    invoke-virtual {p3, v0}, Landroidx/core/os/CancellationSignal;->setOnCancelListener(Landroidx/core/os/CancellationSignal$OnCancelListener;)V

    .line 52
    iget-object v1, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;->fingerprintManagerCompat:Landroidx/core/hardware/fingerprint/FingerprintManagerCompat;

    sget-object v2, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;->cryptoObject:Landroidx/core/hardware/fingerprint/FingerprintManagerCompat$CryptoObject;

    iget-object v4, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;->cancellationSignal:Landroidx/core/os/CancellationSignal;

    iget-object v5, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;->authenticationCallback:Landroidx/core/hardware/fingerprint/FingerprintManagerCompat$AuthenticationCallback;

    const/4 v6, 0x0

    const/4 v3, 0x0

    invoke-virtual/range {v1 .. v6}, Landroidx/core/hardware/fingerprint/FingerprintManagerCompat;->authenticate(Landroidx/core/hardware/fingerprint/FingerprintManagerCompat$CryptoObject;ILandroidx/core/os/CancellationSignal;Landroidx/core/hardware/fingerprint/FingerprintManagerCompat$AuthenticationCallback;Landroid/os/Handler;)V

    .line 54
    invoke-static {}, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->newInstance()Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;

    move-result-object p3

    iget-object v0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;->dialogActionListener:Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog$OnDialogActionListener;

    invoke-virtual {p3, v0}, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->setActionListener(Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog$OnDialogActionListener;)Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;

    move-result-object p3

    invoke-virtual {p3, p2}, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->setDialogStyle(Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;)Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;

    move-result-object p2

    sput-object p2, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;->fingerprintDialog:Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;

    .line 55
    invoke-virtual {p1}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    iget-object p3, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrM;->TAG:Ljava/lang/String;

    invoke-virtual {p2, p1, p3}, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->show(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method public canAuthenticate(Landroid/content/Context;Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;)Z
    .locals 2

    .line 142
    invoke-static {p1}, Landroidx/core/hardware/fingerprint/FingerprintManagerCompat;->from(Landroid/content/Context;)Landroidx/core/hardware/fingerprint/FingerprintManagerCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/core/hardware/fingerprint/FingerprintManagerCompat;->isHardwareDetected()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 143
    invoke-interface {p2}, Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;->onHwUnavailable()V

    return v1

    .line 147
    :cond_0
    invoke-static {p1}, Landroidx/core/hardware/fingerprint/FingerprintManagerCompat;->from(Landroid/content/Context;)Landroidx/core/hardware/fingerprint/FingerprintManagerCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/core/hardware/fingerprint/FingerprintManagerCompat;->hasEnrolledFingerprints()Z

    move-result p1

    if-nez p1, :cond_1

    .line 148
    invoke-interface {p2}, Lcom/hailong/biometricprompt/fingerprint/FingerprintCallback;->onNoneEnrolled()V

    return v1

    :cond_1
    const/4 p1, 0x1

    return p1
.end method
