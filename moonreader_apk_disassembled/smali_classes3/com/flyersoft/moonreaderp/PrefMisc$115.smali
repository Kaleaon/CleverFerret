.class Lcom/flyersoft/moonreaderp/PrefMisc$115;
.super Ljava/lang/Thread;
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

.field final synthetic val$handler:Landroid/os/Handler;

.field final synthetic val$includeBooks:Z

.field final synthetic val$includeCovers:Z


# direct methods
.method constructor <init>(Ljava/lang/String;ZZLandroid/os/Handler;)V
    .locals 0

    .line 3082
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$115;->val$backupTo:Ljava/lang/String;

    iput-boolean p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$115;->val$includeCovers:Z

    iput-boolean p3, p0, Lcom/flyersoft/moonreaderp/PrefMisc$115;->val$includeBooks:Z

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/PrefMisc$115;->val$handler:Landroid/os/Handler;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 3086
    :try_start_0
    sget-object v0, Lcom/flyersoft/tools/A;->appDataPath:Ljava/lang/String;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$115;->val$backupTo:Ljava/lang/String;

    iget-boolean v3, p0, Lcom/flyersoft/moonreaderp/PrefMisc$115;->val$includeCovers:Z

    iget-boolean v4, p0, Lcom/flyersoft/moonreaderp/PrefMisc$115;->val$includeBooks:Z

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefMisc$115;->val$handler:Landroid/os/Handler;

    const/4 v2, 0x1

    invoke-static/range {v0 .. v5}, Lcom/flyersoft/tools/compress/MyZip_Java;->ZipFolder(Ljava/lang/String;Ljava/lang/String;ZZZLandroid/os/Handler;)V

    .line 3087
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$115;->val$handler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 3089
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 3090
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$115;->val$handler:Landroid/os/Handler;

    const/4 v2, 0x1

    invoke-static {v0}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method
