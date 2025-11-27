.class Lcom/flyersoft/components/cloud/Gdrive$7;
.super Ljava/lang/Object;
.source "Gdrive.java"

# interfaces
.implements Lio/reactivex/rxjava3/core/ObservableOnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Gdrive;->move(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)V
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

.field final synthetic val$files:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Gdrive;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 720
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Gdrive$7;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Gdrive$7;->val$files:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public subscribe(Lio/reactivex/rxjava3/core/ObservableEmitter;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/rxjava3/core/ObservableEmitter<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 723
    const-string v0, "/"

    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive$7;->val$files:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x1

    if-lez v1, :cond_3

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive$7;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-boolean v1, v1, Lcom/flyersoft/components/cloud/Gdrive;->mCanceled:Z

    if-nez v1, :cond_3

    .line 725
    :try_start_0
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive$7;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v3, p0, Lcom/flyersoft/components/cloud/Gdrive$7;->val$files:Ljava/util/ArrayList;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, v1, Lcom/flyersoft/components/cloud/Gdrive;->mFilename:Ljava/lang/String;

    .line 726
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p1, v1}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    .line 727
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive$7;->val$files:Ljava/util/ArrayList;

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 729
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive$7;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v1, v1, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    iget-object v3, p0, Lcom/flyersoft/components/cloud/Gdrive$7;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v3, v3, Lcom/flyersoft/components/cloud/Gdrive;->mFilename:Ljava/lang/String;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 730
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive$7;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v3, v1, Lcom/flyersoft/components/cloud/Gdrive;->mFilename:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lcom/flyersoft/components/cloud/Gdrive;->getGdriveFile(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;

    move-result-object v1

    .line 731
    iget-object v3, p0, Lcom/flyersoft/components/cloud/Gdrive$7;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v3, v1}, Lcom/flyersoft/components/cloud/Gdrive;->isValidFile(Lcom/google/api/services/drive/model/File;)Z

    move-result v3

    if-nez v3, :cond_1

    iget-object v3, p0, Lcom/flyersoft/components/cloud/Gdrive$7;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v3, v1}, Lcom/flyersoft/components/cloud/Gdrive;->isValidFolder(Lcom/google/api/services/drive/model/File;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 732
    :cond_1
    iget-object v3, p0, Lcom/flyersoft/components/cloud/Gdrive$7;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v5, v3, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    invoke-virtual {v3, v5}, Lcom/flyersoft/components/cloud/Gdrive;->createGdriveFolder(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 733
    iget-object v3, p0, Lcom/flyersoft/components/cloud/Gdrive$7;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v5, v3, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    invoke-virtual {v3, v5}, Lcom/flyersoft/components/cloud/Gdrive;->getGdriveFile(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;

    move-result-object v3

    .line 735
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/flyersoft/components/cloud/Gdrive$7;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v7, v6, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    invoke-static {v6, v7}, Lcom/flyersoft/components/cloud/Gdrive;->-$$Nest$mdealParentPath(Lcom/flyersoft/components/cloud/Gdrive;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lcom/google/api/services/drive/model/File;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 736
    iget-object v6, p0, Lcom/flyersoft/components/cloud/Gdrive$7;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v6, v5}, Lcom/flyersoft/components/cloud/Gdrive;->getGdriveFile(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;

    move-result-object v6

    if-eqz v6, :cond_2

    .line 738
    iget-object v7, p0, Lcom/flyersoft/components/cloud/Gdrive$7;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v7, v7, Lcom/flyersoft/components/cloud/Gdrive;->service:Lcom/google/api/services/drive/Drive;

    invoke-virtual {v7}, Lcom/google/api/services/drive/Drive;->files()Lcom/google/api/services/drive/Drive$Files;

    move-result-object v7

    invoke-virtual {v6}, Lcom/google/api/services/drive/model/File;->getId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v7, v6}, Lcom/google/api/services/drive/Drive$Files;->delete(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Files$Delete;

    move-result-object v6

    invoke-virtual {v6}, Lcom/google/api/services/drive/Drive$Files$Delete;->execute()Ljava/lang/Object;

    .line 739
    iget-object v6, p0, Lcom/flyersoft/components/cloud/Gdrive$7;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v6, v5}, Lcom/flyersoft/components/cloud/Gdrive;->removeFileInfo(Ljava/lang/String;)V

    .line 741
    :cond_2
    new-instance v5, Lcom/google/api/services/drive/model/File;

    invoke-direct {v5}, Lcom/google/api/services/drive/model/File;-><init>()V

    .line 742
    invoke-virtual {v3}, Lcom/google/api/services/drive/model/File;->getId()Ljava/lang/String;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v5, v3}, Lcom/google/api/services/drive/model/File;->setParents(Ljava/util/List;)Lcom/google/api/services/drive/model/File;

    .line 743
    invoke-virtual {v1}, Lcom/google/api/services/drive/model/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Lcom/google/api/services/drive/model/File;->setName(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;

    .line 744
    iget-object v3, p0, Lcom/flyersoft/components/cloud/Gdrive$7;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v3, v3, Lcom/flyersoft/components/cloud/Gdrive;->service:Lcom/google/api/services/drive/Drive;

    invoke-virtual {v3}, Lcom/google/api/services/drive/Drive;->files()Lcom/google/api/services/drive/Drive$Files;

    move-result-object v3

    invoke-virtual {v1}, Lcom/google/api/services/drive/model/File;->getId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6, v5}, Lcom/google/api/services/drive/Drive$Files;->copy(Ljava/lang/String;Lcom/google/api/services/drive/model/File;)Lcom/google/api/services/drive/Drive$Files$Copy;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/api/services/drive/Drive$Files$Copy;->execute()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/api/services/drive/model/File;

    if-eqz v3, :cond_0

    .line 747
    iget-object v5, p0, Lcom/flyersoft/components/cloud/Gdrive$7;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v5, v5, Lcom/flyersoft/components/cloud/Gdrive;->service:Lcom/google/api/services/drive/Drive;

    invoke-virtual {v5}, Lcom/google/api/services/drive/Drive;->files()Lcom/google/api/services/drive/Drive$Files;

    move-result-object v5

    invoke-virtual {v1}, Lcom/google/api/services/drive/model/File;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v1}, Lcom/google/api/services/drive/Drive$Files;->delete(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Files$Delete;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/api/services/drive/Drive$Files$Delete;->execute()Ljava/lang/Object;

    .line 748
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive$7;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v5, v1, Lcom/flyersoft/components/cloud/Gdrive;->mFilename:Ljava/lang/String;

    invoke-virtual {v1, v5}, Lcom/flyersoft/components/cloud/Gdrive;->removeFileInfo(Ljava/lang/String;)V

    .line 749
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive$7;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/flyersoft/components/cloud/Gdrive$7;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v7, v6, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    invoke-static {v6, v7}, Lcom/flyersoft/components/cloud/Gdrive;->-$$Nest$mdealParentPath(Lcom/flyersoft/components/cloud/Gdrive;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/flyersoft/components/cloud/Gdrive$7;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v6, v6, Lcom/flyersoft/components/cloud/Gdrive;->mFilename:Ljava/lang/String;

    invoke-static {v6}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5, v3}, Lcom/flyersoft/components/cloud/Gdrive;->saveFileInfo(Ljava/lang/String;Lcom/google/api/services/drive/model/File;)V

    .line 750
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "move:"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/flyersoft/components/cloud/Gdrive$7;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v3, v3, Lcom/flyersoft/components/cloud/Gdrive;->mFilename:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " to:"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/flyersoft/components/cloud/Gdrive$7;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v3, v3, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-array v3, v2, [Ljava/lang/Object;

    aput-object v1, v3, v4

    invoke-static {v3}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    .line 756
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 757
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Gdrive$7;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/flyersoft/components/cloud/Gdrive;->errorMsg:Ljava/lang/String;

    .line 760
    :cond_3
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    return-void
.end method
