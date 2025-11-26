.class public final synthetic Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP$$ExternalSyntheticLambda10;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/concurrent/Executor;


# instance fields
.field public final synthetic f$0:Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;


# direct methods
.method public synthetic constructor <init>(Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP$$ExternalSyntheticLambda10;->f$0:Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;

    return-void
.end method


# virtual methods
.method public final execute(Ljava/lang/Runnable;)V
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP$$ExternalSyntheticLambda10;->f$0:Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;

    invoke-virtual {v0, p1}, Lcom/hailong/biometricprompt/fingerprint/FingerprintAndrP;->lambda$authenticate$0$com-hailong-biometricprompt-fingerprint-FingerprintAndrP(Ljava/lang/Runnable;)V

    return-void
.end method
