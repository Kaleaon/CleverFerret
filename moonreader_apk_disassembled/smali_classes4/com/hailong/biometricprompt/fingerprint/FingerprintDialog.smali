.class public Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;
.super Landroid/app/DialogFragment;
.source "FingerprintDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog$OnDialogActionListener;
    }
.end annotation


# static fields
.field private static mDialog:Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;


# instance fields
.field private actionListener:Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog$OnDialogActionListener;

.field private ivFingerprint:Landroid/widget/ImageView;

.field private tvCancel:Landroid/widget/TextView;

.field private tvTip:Landroid/widget/TextView;

.field private tvUsepwd:Landroid/widget/TextView;

.field private verificationDialogStyleBean:Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Landroid/app/DialogFragment;-><init>()V

    return-void
.end method

.method public static newInstance()Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;
    .locals 2

    .line 94
    sget-object v0, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->mDialog:Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;

    if-nez v0, :cond_1

    .line 95
    const-class v0, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;

    monitor-enter v0

    .line 96
    :try_start_0
    sget-object v1, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->mDialog:Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;

    if-nez v1, :cond_0

    .line 97
    new-instance v1, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;

    invoke-direct {v1}, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;-><init>()V

    sput-object v1, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->mDialog:Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;

    .line 99
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 101
    :cond_1
    :goto_0
    sget-object v0, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->mDialog:Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;

    return-object v0
.end method


# virtual methods
.method synthetic lambda$onCreateView$0$com-hailong-biometricprompt-fingerprint-FingerprintDialog(Landroid/view/View;)V
    .locals 0

    .line 45
    iget-object p1, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->actionListener:Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog$OnDialogActionListener;

    if-eqz p1, :cond_0

    .line 46
    invoke-interface {p1}, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog$OnDialogActionListener;->onUsepwd()V

    .line 47
    :cond_0
    invoke-virtual {p0}, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->dismiss()V

    return-void
.end method

.method synthetic lambda$onCreateView$1$com-hailong-biometricprompt-fingerprint-FingerprintDialog(Landroid/view/View;)V
    .locals 0

    .line 51
    iget-object p1, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->actionListener:Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog$OnDialogActionListener;

    if-eqz p1, :cond_0

    .line 52
    invoke-interface {p1}, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog$OnDialogActionListener;->onCancle()V

    .line 53
    :cond_0
    invoke-virtual {p0}, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->dismiss()V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2

    const/4 p3, 0x0

    .line 39
    invoke-virtual {p0, p3}, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->setCancelable(Z)V

    .line 40
    sget v0, Lcom/hailong/biometricprompt/R$layout;->biometricprompt_layout_fingerprint_dialog:I

    invoke-virtual {p1, v0, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    .line 41
    sget v0, Lcom/hailong/biometricprompt/R$id;->ivFingerprint:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->ivFingerprint:Landroid/widget/ImageView;

    .line 42
    sget v0, Lcom/hailong/biometricprompt/R$id;->tvTip:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->tvTip:Landroid/widget/TextView;

    .line 43
    sget v0, Lcom/hailong/biometricprompt/R$id;->tvUsepwd:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->tvUsepwd:Landroid/widget/TextView;

    .line 44
    new-instance v1, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog$$ExternalSyntheticLambda0;-><init>(Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 49
    sget v0, Lcom/hailong/biometricprompt/R$id;->tvCancel:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->tvCancel:Landroid/widget/TextView;

    .line 50
    new-instance v1, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog$$ExternalSyntheticLambda1;-><init>(Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 57
    iget-object v0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->verificationDialogStyleBean:Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;

    if-eqz v0, :cond_5

    .line 58
    invoke-virtual {v0}, Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;->getCancelBtnText()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 59
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    const/high16 v0, 0x1040000

    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    .line 60
    :cond_0
    iget-object p2, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->verificationDialogStyleBean:Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;

    invoke-virtual {p2}, Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;->getCancelBtnText()Ljava/lang/String;

    move-result-object p2

    .line 61
    :goto_0
    iget-object v0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->tvCancel:Landroid/widget/TextView;

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    iget-object p2, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->verificationDialogStyleBean:Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;

    invoke-virtual {p2}, Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;->getCancelTextColor()I

    move-result p2

    if-eqz p2, :cond_1

    .line 64
    iget-object p2, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->tvCancel:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->verificationDialogStyleBean:Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;

    invoke-virtual {v0}, Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;->getCancelTextColor()I

    move-result v0

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 65
    :cond_1
    iget-object p2, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->verificationDialogStyleBean:Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;

    invoke-virtual {p2}, Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;->getUsepwdTextColor()I

    move-result p2

    if-eqz p2, :cond_2

    .line 66
    iget-object p2, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->tvUsepwd:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->verificationDialogStyleBean:Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;

    invoke-virtual {v0}, Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;->getUsepwdTextColor()I

    move-result v0

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 68
    :cond_2
    iget-object p2, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->verificationDialogStyleBean:Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;

    invoke-virtual {p2}, Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;->getFingerprintColor()I

    move-result p2

    if-eqz p2, :cond_3

    .line 69
    iget-object p2, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->ivFingerprint:Landroid/widget/ImageView;

    invoke-virtual {p2}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p2

    .line 71
    iget-object v0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->verificationDialogStyleBean:Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;

    invoke-virtual {v0}, Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;->getFingerprintColor()I

    move-result v0

    invoke-virtual {p2, v0}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 74
    :cond_3
    iget-object p2, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->verificationDialogStyleBean:Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;

    invoke-virtual {p2}, Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;->isUsepwdVisible()Z

    move-result p2

    if-eqz p2, :cond_4

    .line 75
    iget-object p2, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->tvUsepwd:Landroid/widget/TextView;

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 76
    sget p2, Lcom/hailong/biometricprompt/R$id;->view:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    invoke-virtual {p2, p3}, Landroid/view/View;->setVisibility(I)V

    return-object p1

    .line 78
    :cond_4
    iget-object p2, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->tvUsepwd:Landroid/widget/TextView;

    const/16 p3, 0x8

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 79
    sget p2, Lcom/hailong/biometricprompt/R$id;->view:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    invoke-virtual {p2, p3}, Landroid/view/View;->setVisibility(I)V

    :cond_5
    return-object p1
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 88
    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onDismiss(Landroid/content/DialogInterface;)V

    .line 89
    iget-object p1, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->actionListener:Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog$OnDialogActionListener;

    if-eqz p1, :cond_0

    .line 90
    invoke-interface {p1}, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog$OnDialogActionListener;->onDismiss()V

    :cond_0
    return-void
.end method

.method public setActionListener(Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog$OnDialogActionListener;)Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;
    .locals 0

    .line 105
    iput-object p1, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->actionListener:Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog$OnDialogActionListener;

    .line 106
    sget-object p1, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->mDialog:Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;

    return-object p1
.end method

.method public setDialogStyle(Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;)Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;
    .locals 0

    .line 115
    iput-object p1, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->verificationDialogStyleBean:Lcom/hailong/biometricprompt/fingerprint/bean/VerificationDialogStyleBean;

    .line 116
    sget-object p1, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->mDialog:Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;

    return-object p1
.end method

.method public setTip(Ljava/lang/String;I)V
    .locals 1

    .line 126
    iget-object v0, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->tvTip:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 127
    iget-object p1, p0, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->tvTip:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/hailong/biometricprompt/fingerprint/FingerprintDialog;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/content/res/Resources;->getColor(I)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    return-void
.end method
