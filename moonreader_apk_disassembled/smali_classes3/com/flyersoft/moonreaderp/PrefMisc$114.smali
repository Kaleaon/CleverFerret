.class Lcom/flyersoft/moonreaderp/PrefMisc$114;
.super Landroid/os/Handler;
.source "PrefMisc.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->backupToLocal(ZZLjava/lang/String;Landroid/content/Context;Landroid/app/Dialog;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$backupTo:Ljava/lang/String;

.field final synthetic val$con:Landroid/content/Context;

.field final synthetic val$fromWhich:I

.field final synthetic val$selfPref:Landroid/app/Dialog;


# direct methods
.method constructor <init>(Landroid/os/Looper;Ljava/lang/String;Landroid/content/Context;Landroid/app/Dialog;I)V
    .locals 0

    .line 3051
    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$114;->val$backupTo:Ljava/lang/String;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefMisc$114;->val$con:Landroid/content/Context;

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/PrefMisc$114;->val$selfPref:Landroid/app/Dialog;

    iput p5, p0, Lcom/flyersoft/moonreaderp/PrefMisc$114;->val$fromWhich:I

    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    .line 3054
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x3e8

    if-ne v0, v1, :cond_1

    .line 3055
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$sfgetprogressDlg()Landroid/app/ProgressDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v0, :cond_0

    .line 3056
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$sfgetprogressDlg()Landroid/app/ProgressDialog;

    move-result-object v0

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    invoke-virtual {v0, p1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    :cond_0
    return-void

    .line 3059
    :cond_1
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$smdismissDlg()V

    .line 3060
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_3

    .line 3061
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    .line 3062
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$114;->val$backupTo:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/miscellaneous/SD;->isSDFile(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "Null"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 3064
    new-instance p1, Lcom/flyersoft/components/MyDialog;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$114;->val$con:Landroid/content/Context;

    invoke-direct {p1, v0}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$114;->val$con:Landroid/content/Context;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->backup_failed:I

    .line 3065
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    .line 3066
    const-string v0, "Failed to write to Ext-SdCard, please click Folder in \"Backup To\" dialog to select inner storage to save the backup file. \n\nor open \"My Files\" Tab, try to create a folder in Ext-SdCard to let the system grant permission to the reader again."

    invoke-virtual {p1, v0}, Lcom/flyersoft/components/MyDialog;->setMessage(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const/4 v0, 0x0

    .line 3067
    invoke-virtual {p1, v0}, Lcom/flyersoft/components/MyDialog;->setCancelable(Z)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const/high16 v0, 0x1040000

    const/4 v1, 0x0

    .line 3068
    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefMisc$114$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$114$1;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc$114;)V

    const v1, 0x104000a

    .line 3069
    invoke-virtual {p1, v1, v0}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    .line 3075
    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void

    .line 3077
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$114;->val$con:Landroid/content/Context;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->backup_failed:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p1}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    return-void

    .line 3079
    :cond_3
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$114;->val$backupTo:Ljava/lang/String;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$114;->val$con:Landroid/content/Context;

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$smshowBackupSuccessInfo(Ljava/lang/String;Landroid/content/Context;)V

    return-void
.end method
