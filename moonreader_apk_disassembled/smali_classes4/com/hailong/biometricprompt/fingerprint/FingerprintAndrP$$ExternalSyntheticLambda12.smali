.class public final synthetic Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP$$ExternalSyntheticLambda12;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/os/CancellationSignal$OnCancelListener;


# instance fields
.field public final synthetic f$0:Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;


# direct methods
.method public synthetic constructor <init>(Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP$$ExternalSyntheticLambda12;->f$0:Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;

    return-void
.end method


# virtual methods
.method public final onCancel()V
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP$$ExternalSyntheticLambda12;->f$0:Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;

    invoke-virtual {v0}, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;->lambda$authenticate$2$com-hailong-biometricprompt-fingerprint-FingerprintAndrP()V

    return-void
.end method
