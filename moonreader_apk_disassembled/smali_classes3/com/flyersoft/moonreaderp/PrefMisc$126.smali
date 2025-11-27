.class Lcom/flyersoft/moonreaderp/PrefMisc$126;
.super Ljava/lang/Thread;
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
.field final synthetic val$handler:Landroid/os/Handler;


# direct methods
.method constructor <init>(Landroid/os/Handler;)V
    .locals 0

    .line 3516
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$126;->val$handler:Landroid/os/Handler;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .line 3520
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sput-wide v0, Lcom/flyersoft/tools/A;->lastAutoBackupTime:J

    .line 3521
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->SaveOptions(Landroid/content/Context;)V

    .line 3522
    sget-boolean v0, Lcom/flyersoft/tools/A;->isProVersion:Z

    if-eqz v0, :cond_0

    const-string v0, ".mrpro"

    goto :goto_0

    :cond_0
    const-string v0, ".mrstd"

    .line 3523
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/flyersoft/tools/A;->backup_folder:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$smbackupFilenameByToday()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " AUTO"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 3524
    sget-object v3, Lcom/flyersoft/tools/A;->appDataPath:Ljava/lang/String;

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x0

    invoke-static/range {v3 .. v8}, Lcom/flyersoft/tools/compress/MyZip_Java;->ZipFolder(Ljava/lang/String;Ljava/lang/String;ZZZLandroid/os/Handler;)V

    .line 3526
    sget v1, Lcom/flyersoft/tools/A;->autobackupCloud:I

    if-lez v1, :cond_1

    sget v1, Lcom/flyersoft/tools/A;->autobackupCloud:I

    invoke-static {v1}, Lcom/flyersoft/components/cloud/Cloud;->instance(I)Lcom/flyersoft/components/cloud/Cloud;

    move-result-object v1

    invoke-virtual {v1}, Lcom/flyersoft/components/cloud/Cloud;->isLogin()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 3527
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$smbackupFilenameByToday()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " AUTO ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 3528
    sget v1, Lcom/flyersoft/tools/A;->autobackupCloud:I

    const/4 v2, 0x0

    invoke-static {v1, v0, v4, v2, v2}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$smuploadBackupFileToCloud(ILjava/lang/String;Ljava/lang/String;Landroid/os/Handler;Landroid/content/Context;)V

    .line 3530
    :cond_1
    sget-boolean v0, Lcom/flyersoft/tools/A;->autobackupLocal:Z

    if-nez v0, :cond_2

    .line 3531
    invoke-static {v4}, Lcom/flyersoft/tools/T;->deleteFile(Ljava/lang/String;)Z

    .line 3533
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$126;->val$handler:Landroid/os/Handler;

    if-eqz v0, :cond_3

    const/4 v1, 0x0

    .line 3534
    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 3536
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_3
    return-void
.end method
