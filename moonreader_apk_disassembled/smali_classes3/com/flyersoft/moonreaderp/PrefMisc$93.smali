.class Lcom/flyersoft/moonreaderp/PrefMisc$93;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


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

.field final synthetic val$handler:Landroid/os/Handler;

.field final synthetic val$selfPref:Landroid/app/Dialog;


# direct methods
.method constructor <init>(Landroid/app/Dialog;ILandroid/os/Handler;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 2411
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$93;->val$selfPref:Landroid/app/Dialog;

    iput p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$93;->val$cloudType:I

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefMisc$93;->val$handler:Landroid/os/Handler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 6

    .line 2413
    sget-object p1, Lcom/flyersoft/moonreaderp/PrefMisc;->selectedBackup:Ljava/lang/String;

    if-nez p1, :cond_0

    .line 2414
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$93;->val$selfPref:Landroid/app/Dialog;

    invoke-virtual {p1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$93;->val$selfPref:Landroid/app/Dialog;

    invoke-virtual {p2}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object p2

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->nothing_selected:I

    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void

    .line 2417
    :cond_0
    iget p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$93;->val$cloudType:I

    if-eqz p1, :cond_1

    .line 2418
    invoke-static {p1}, Lcom/flyersoft/components/cloud/Cloud;->getPrefix(I)Ljava/lang/String;

    move-result-object p1

    .line 2439
    iget p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$93;->val$cloudType:I

    invoke-static {p2}, Lcom/flyersoft/components/cloud/Cloud;->instance(I)Lcom/flyersoft/components/cloud/Cloud;

    move-result-object v0

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$93;->val$selfPref:Landroid/app/Dialog;

    invoke-virtual {p2}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "/Backup/"

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p1, Lcom/flyersoft/moonreaderp/PrefMisc;->selectedBackup:Ljava/lang/String;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/components/cloud/Cloud;->FileList([Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v2

    .line 2440
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$smcloudTmpBackupFilename()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    new-instance v5, Lcom/flyersoft/moonreaderp/PrefMisc$93$1;

    invoke-direct {v5, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$93$1;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc$93;)V

    const/4 v4, 0x1

    .line 2439
    invoke-virtual/range {v0 .. v5}, Lcom/flyersoft/components/cloud/Cloud;->download(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;ZLcom/flyersoft/tools/T$OnResult;)V

    return-void

    .line 2455
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object p2, Lcom/flyersoft/tools/A;->backup_folder:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "/"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p2, Lcom/flyersoft/moonreaderp/PrefMisc;->selectedBackup:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    sput-object p1, Lcom/flyersoft/moonreaderp/PrefMisc;->selectedBackup:Ljava/lang/String;

    .line 2456
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$93;->val$selfPref:Landroid/app/Dialog;

    invoke-virtual {p1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$93;->val$handler:Landroid/os/Handler;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$93;->val$selfPref:Landroid/app/Dialog;

    instance-of v0, v0, Lcom/flyersoft/moonreaderp/PrefShelf;

    iget v1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$93;->val$cloudType:I

    invoke-static {p1, p2, v0, v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->restoreProc_final(Landroid/content/Context;Landroid/os/Handler;ZI)V

    return-void
.end method
