.class Lcom/flyersoft/moonreaderp/PrefMisc$112;
.super Ljava/lang/Thread;
.source "PrefMisc.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->backupToCloud(ZZLjava/lang/String;Ljava/lang/String;Landroid/content/Context;Landroid/app/Dialog;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$backupTo:Ljava/lang/String;

.field final synthetic val$cloudType:I

.field final synthetic val$con:Landroid/content/Context;

.field final synthetic val$handler:Landroid/os/Handler;

.field final synthetic val$includeBooks:Z

.field final synthetic val$includeCovers:Z

.field final synthetic val$uploadFilename:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;ZZLandroid/os/Handler;ILjava/lang/String;Landroid/content/Context;)V
    .locals 0

    .line 3022
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$112;->val$backupTo:Ljava/lang/String;

    iput-boolean p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$112;->val$includeCovers:Z

    iput-boolean p3, p0, Lcom/flyersoft/moonreaderp/PrefMisc$112;->val$includeBooks:Z

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/PrefMisc$112;->val$handler:Landroid/os/Handler;

    iput p5, p0, Lcom/flyersoft/moonreaderp/PrefMisc$112;->val$cloudType:I

    iput-object p6, p0, Lcom/flyersoft/moonreaderp/PrefMisc$112;->val$uploadFilename:Ljava/lang/String;

    iput-object p7, p0, Lcom/flyersoft/moonreaderp/PrefMisc$112;->val$con:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 3026
    :try_start_0
    sget-object v0, Lcom/flyersoft/tools/A;->appDataPath:Ljava/lang/String;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$112;->val$backupTo:Ljava/lang/String;

    iget-boolean v3, p0, Lcom/flyersoft/moonreaderp/PrefMisc$112;->val$includeCovers:Z

    iget-boolean v4, p0, Lcom/flyersoft/moonreaderp/PrefMisc$112;->val$includeBooks:Z

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefMisc$112;->val$handler:Landroid/os/Handler;

    const/4 v2, 0x1

    invoke-static/range {v0 .. v5}, Lcom/flyersoft/tools/compress/MyZip_Java;->ZipFolder(Ljava/lang/String;Ljava/lang/String;ZZZLandroid/os/Handler;)V

    .line 3027
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$112;->val$handler:Landroid/os/Handler;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->upload:I

    invoke-static {v2}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " ..."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x3e8

    invoke-virtual {v0, v2, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 3028
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$112;->val$cloudType:I

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$112;->val$uploadFilename:Ljava/lang/String;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$112;->val$backupTo:Ljava/lang/String;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefMisc$112;->val$handler:Landroid/os/Handler;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefMisc$112;->val$con:Landroid/content/Context;

    invoke-static {v0, v1, v2, v3, v4}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$smuploadBackupFileToCloud(ILjava/lang/String;Ljava/lang/String;Landroid/os/Handler;Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 3030
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 3031
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$112;->val$handler:Landroid/os/Handler;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefMisc$112;->val$con:Landroid/content/Context;

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->error:I

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ":\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method
