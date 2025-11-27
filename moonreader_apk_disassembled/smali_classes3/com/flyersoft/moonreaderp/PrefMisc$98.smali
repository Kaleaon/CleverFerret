.class Lcom/flyersoft/moonreaderp/PrefMisc$98;
.super Landroid/os/Handler;
.source "PrefMisc.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->restoreProc_final(Landroid/content/Context;Landroid/os/Handler;ZI)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$cloudType:I

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/os/Looper;Landroid/content/Context;I)V
    .locals 0

    .line 2536
    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$98;->val$context:Landroid/content/Context;

    iput p3, p0, Lcom/flyersoft/moonreaderp/PrefMisc$98;->val$cloudType:I

    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    .line 2539
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x3e8

    if-ne v0, v1, :cond_1

    .line 2540
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$sfgetprogressDlg()Landroid/app/ProgressDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v0, :cond_0

    .line 2541
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$sfgetprogressDlg()Landroid/app/ProgressDialog;

    move-result-object v0

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    invoke-virtual {v0, p1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    :cond_0
    return-void

    .line 2542
    :cond_1
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x64

    if-ne v0, v1, :cond_2

    .line 2543
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$smdismissDlg()V

    .line 2544
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$98;->val$context:Landroid/content/Context;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$smdoAfterRestoreSuccess(Landroid/content/Context;)V

    return-void

    .line 2546
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$98;->val$context:Landroid/content/Context;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    iget v1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$98;->val$cloudType:I

    invoke-static {v0, p1, v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$smdoAfterRestoreFailed(Landroid/content/Context;Ljava/lang/String;I)V

    return-void
.end method
