.class Lcom/flyersoft/components/cloud/Gdrive$9;
.super Ljava/lang/Object;
.source "Gdrive.java"

# interfaces
.implements Lio/reactivex/rxjava3/core/ObservableOnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Gdrive;->rename(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/rxjava3/core/ObservableOnSubscribe<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/cloud/Gdrive;

.field final synthetic val$newName:Ljava/lang/String;

.field final synthetic val$oldName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Gdrive;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 788
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Gdrive$9;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Gdrive$9;->val$oldName:Ljava/lang/String;

    iput-object p3, p0, Lcom/flyersoft/components/cloud/Gdrive$9;->val$newName:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public subscribe(Lio/reactivex/rxjava3/core/ObservableEmitter;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/rxjava3/core/ObservableEmitter<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    const-string v0, "rename:"

    .line 792
    :try_start_0
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive$9;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v2, p0, Lcom/flyersoft/components/cloud/Gdrive$9;->val$oldName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/flyersoft/components/cloud/Gdrive;->getGdriveFile(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;

    move-result-object v1

    .line 793
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Gdrive$9;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v2, v1}, Lcom/flyersoft/components/cloud/Gdrive;->isValidFile(Lcom/google/api/services/drive/model/File;)Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/flyersoft/components/cloud/Gdrive$9;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v2, v1}, Lcom/flyersoft/components/cloud/Gdrive;->isValidFolder(Lcom/google/api/services/drive/model/File;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 794
    :cond_0
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Gdrive$9;->val$newName:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 795
    invoke-virtual {v1}, Lcom/google/api/services/drive/model/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 796
    new-instance v3, Lcom/google/api/services/drive/model/File;

    invoke-direct {v3}, Lcom/google/api/services/drive/model/File;-><init>()V

    .line 797
    invoke-virtual {v3, v2}, Lcom/google/api/services/drive/model/File;->setName(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;

    .line 799
    iget-object v4, p0, Lcom/flyersoft/components/cloud/Gdrive$9;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v4, v4, Lcom/flyersoft/components/cloud/Gdrive;->service:Lcom/google/api/services/drive/Drive;

    invoke-virtual {v4}, Lcom/google/api/services/drive/Drive;->files()Lcom/google/api/services/drive/Drive$Files;

    move-result-object v4

    invoke-virtual {v1}, Lcom/google/api/services/drive/model/File;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1, v3}, Lcom/google/api/services/drive/Drive$Files;->update(Ljava/lang/String;Lcom/google/api/services/drive/model/File;)Lcom/google/api/services/drive/Drive$Files$Update;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/api/services/drive/Drive$Files$Update;->execute()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/api/services/drive/model/File;

    const/4 v3, 0x1

    if-eqz v1, :cond_1

    .line 801
    iget-object v4, p0, Lcom/flyersoft/components/cloud/Gdrive$9;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v5, p0, Lcom/flyersoft/components/cloud/Gdrive$9;->val$oldName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/flyersoft/components/cloud/Gdrive;->removeFileInfo(Ljava/lang/String;)V

    .line 802
    iget-object v4, p0, Lcom/flyersoft/components/cloud/Gdrive$9;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/flyersoft/components/cloud/Gdrive$9;->val$oldName:Ljava/lang/String;

    invoke-static {v6}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v1}, Lcom/flyersoft/components/cloud/Gdrive;->saveFileInfo(Ljava/lang/String;Lcom/google/api/services/drive/model/File;)V

    .line 803
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$9;->val$oldName:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " to:"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-array v1, v3, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 805
    :cond_1
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    .line 809
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 810
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive$9;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/flyersoft/components/cloud/Gdrive;->errorMsg:Ljava/lang/String;

    const/4 v0, -0x1

    .line 811
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    :cond_2
    return-void
.end method
