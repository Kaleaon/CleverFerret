.class Lcom/flyersoft/moonreaderp/PrefMisc$125;
.super Landroid/os/Handler;
.source "PrefMisc.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->doAutoBackup(Landroid/app/ProgressDialog;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$progressDialog:Landroid/app/ProgressDialog;


# direct methods
.method constructor <init>(Landroid/os/Looper;Landroid/app/ProgressDialog;)V
    .locals 0

    .line 3507
    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$125;->val$progressDialog:Landroid/app/ProgressDialog;

    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1

    .line 3509
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$125;->val$progressDialog:Landroid/app/ProgressDialog;

    if-eqz p1, :cond_0

    .line 3510
    invoke-virtual {p1}, Landroid/app/ProgressDialog;->dismiss()V

    .line 3511
    :cond_0
    sget-boolean p1, Lcom/flyersoft/tools/A;->autobackupLocal:Z

    if-nez p1, :cond_2

    sget p1, Lcom/flyersoft/tools/A;->autobackupCloud:I

    if-lez p1, :cond_1

    const/4 p1, 0x0

    sget v0, Lcom/flyersoft/tools/A;->autobackupCloud:I

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/PrefMisc;->validateCloud(Landroid/app/Dialog;I)Z

    move-result p1

    if-eqz p1, :cond_1

    goto :goto_0

    :cond_1
    return-void

    .line 3512
    :cond_2
    :goto_0
    sget p1, Lcom/flyersoft/moonreaderp/R$string;->backup_succes:I

    invoke-static {p1}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/T;->showToastTextBackground(Ljava/lang/CharSequence;)V

    return-void
.end method
