.class Lcom/flyersoft/moonreaderp/PrefMisc$92;
.super Landroid/os/Handler;
.source "PrefMisc.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->restoreProc_second(Landroid/app/Dialog;ILjava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$cloudType:I

.field final synthetic val$selfPref:Landroid/app/Dialog;


# direct methods
.method constructor <init>(Landroid/os/Looper;Landroid/app/Dialog;I)V
    .locals 0

    .line 2373
    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$92;->val$selfPref:Landroid/app/Dialog;

    iput p3, p0, Lcom/flyersoft/moonreaderp/PrefMisc$92;->val$cloudType:I

    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3

    .line 2377
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$92;->val$selfPref:Landroid/app/Dialog;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Dialog;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 2379
    :cond_0
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x3e8

    if-ne v0, v1, :cond_2

    .line 2380
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$sfgetprogressDlg()Landroid/app/ProgressDialog;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v0, :cond_1

    .line 2381
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$sfgetprogressDlg()Landroid/app/ProgressDialog;

    move-result-object v0

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    invoke-virtual {v0, p1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    :cond_1
    :goto_0
    return-void

    .line 2384
    :cond_2
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$smdismissDlg()V

    .line 2385
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x64

    if-ne v0, v1, :cond_3

    .line 2386
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$92;->val$selfPref:Landroid/app/Dialog;

    invoke-virtual {p1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$smdoAfterRestoreSuccess(Landroid/content/Context;)V

    return-void

    .line 2387
    :cond_3
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0xc8

    if-ne v0, v1, :cond_4

    .line 2388
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$92;->val$selfPref:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Landroid/os/Handler;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$92;->val$selfPref:Landroid/app/Dialog;

    instance-of v1, v1, Lcom/flyersoft/moonreaderp/PrefShelf;

    iget v2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$92;->val$cloudType:I

    invoke-static {v0, p1, v1, v2}, Lcom/flyersoft/moonreaderp/PrefMisc;->restoreProc_final(Landroid/content/Context;Landroid/os/Handler;ZI)V

    return-void

    .line 2390
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$92;->val$selfPref:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    iget v1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$92;->val$cloudType:I

    invoke-static {v0, p1, v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$smdoAfterRestoreFailed(Landroid/content/Context;Ljava/lang/String;I)V

    return-void
.end method
