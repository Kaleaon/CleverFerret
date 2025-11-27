.class Lcom/facebook/soloader/UnpackingSoSource$2;
.super Ljava/lang/Object;
.source "UnpackingSoSource.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/soloader/UnpackingSoSource;->refreshLocked(Lcom/facebook/soloader/FileLocker;I)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/soloader/UnpackingSoSource;

.field final synthetic val$lock:Lcom/facebook/soloader/FileLocker;

.field final synthetic val$runFsync:Z

.field final synthetic val$stateFileName:Ljava/io/File;


# direct methods
.method constructor <init>(Lcom/facebook/soloader/UnpackingSoSource;ZLjava/io/File;Lcom/facebook/soloader/FileLocker;)V
    .locals 0

    .line 354
    iput-object p1, p0, Lcom/facebook/soloader/UnpackingSoSource$2;->this$0:Lcom/facebook/soloader/UnpackingSoSource;

    iput-boolean p2, p0, Lcom/facebook/soloader/UnpackingSoSource$2;->val$runFsync:Z

    iput-object p3, p0, Lcom/facebook/soloader/UnpackingSoSource$2;->val$stateFileName:Ljava/io/File;

    iput-object p4, p0, Lcom/facebook/soloader/UnpackingSoSource$2;->val$lock:Lcom/facebook/soloader/FileLocker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 357
    const-string v0, " (from syncer thread)"

    .line 0
    const-string v1, "releasing dso store lock for "

    .line 357
    const-string v2, "starting syncer worker"

    const-string v3, "fb-UnpackingSoSource"

    invoke-static {v3, v2}, Lcom/facebook/soloader/LogUtil;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 360
    :try_start_0
    iget-boolean v2, p0, Lcom/facebook/soloader/UnpackingSoSource$2;->val$runFsync:Z

    if-eqz v2, :cond_0

    .line 361
    iget-object v2, p0, Lcom/facebook/soloader/UnpackingSoSource$2;->this$0:Lcom/facebook/soloader/UnpackingSoSource;

    iget-object v2, v2, Lcom/facebook/soloader/UnpackingSoSource;->soDirectory:Ljava/io/File;

    invoke-static {v2}, Lcom/facebook/soloader/SysUtil;->fsyncAll(Ljava/io/File;)V

    .line 363
    :cond_0
    iget-object v2, p0, Lcom/facebook/soloader/UnpackingSoSource$2;->val$stateFileName:Ljava/io/File;

    iget-boolean v4, p0, Lcom/facebook/soloader/UnpackingSoSource$2;->val$runFsync:Z

    const/4 v5, 0x1

    invoke-static {v2, v5, v4}, Lcom/facebook/soloader/UnpackingSoSource;->access$100(Ljava/io/File;BZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 365
    :try_start_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/facebook/soloader/UnpackingSoSource$2;->this$0:Lcom/facebook/soloader/UnpackingSoSource;

    iget-object v1, v1, Lcom/facebook/soloader/UnpackingSoSource;->soDirectory:Ljava/io/File;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/facebook/soloader/LogUtil;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 367
    iget-object v0, p0, Lcom/facebook/soloader/UnpackingSoSource$2;->val$lock:Lcom/facebook/soloader/FileLocker;

    invoke-virtual {v0}, Lcom/facebook/soloader/FileLocker;->close()V

    return-void

    :catchall_0
    move-exception v2

    .line 365
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/facebook/soloader/UnpackingSoSource$2;->this$0:Lcom/facebook/soloader/UnpackingSoSource;

    iget-object v1, v1, Lcom/facebook/soloader/UnpackingSoSource;->soDirectory:Ljava/io/File;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/facebook/soloader/LogUtil;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 367
    iget-object v0, p0, Lcom/facebook/soloader/UnpackingSoSource$2;->val$lock:Lcom/facebook/soloader/FileLocker;

    invoke-virtual {v0}, Lcom/facebook/soloader/FileLocker;->close()V

    .line 368
    throw v2
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    move-exception v0

    .line 370
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
