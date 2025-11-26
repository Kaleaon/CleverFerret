.class Lcom/flyersoft/components/cloud/Gdrive$5;
.super Ljava/lang/Object;
.source "Gdrive.java"

# interfaces
.implements Lio/reactivex/rxjava3/core/ObservableOnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Gdrive;->copy(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)V
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

    .line 639
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Gdrive$5;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Gdrive$5;->val$files:Ljava/util/ArrayList;

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

    .line 642
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$5;->val$files:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    if-lez v0, :cond_3

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$5;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-boolean v0, v0, Lcom/flyersoft/components/cloud/Gdrive;->mCanceled:Z

    if-nez v0, :cond_3

    .line 644
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$5;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v2, p0, Lcom/flyersoft/components/cloud/Gdrive$5;->val$files:Ljava/util/ArrayList;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, v0, Lcom/flyersoft/components/cloud/Gdrive;->mFilename:Ljava/lang/String;

    .line 645
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    .line 646
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$5;->val$files:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 647
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$5;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v2, v0, Lcom/flyersoft/components/cloud/Gdrive;->mFilename:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/flyersoft/components/cloud/Gdrive;->getGdriveFile(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;

    move-result-object v0

    .line 649
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Gdrive$5;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v2, v0}, Lcom/flyersoft/components/cloud/Gdrive;->isValidFile(Lcom/google/api/services/drive/model/File;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 650
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Gdrive$5;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v2, v2, Lcom/flyersoft/components/cloud/Gdrive;->mFilename:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 651
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/flyersoft/components/cloud/Gdrive$5;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v6, v5, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    invoke-static {v5, v6}, Lcom/flyersoft/components/cloud/Gdrive;->-$$Nest$mdealParentPath(Lcom/flyersoft/components/cloud/Gdrive;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 652
    iget-object v5, p0, Lcom/flyersoft/components/cloud/Gdrive$5;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v5, v5, Lcom/flyersoft/components/cloud/Gdrive;->mFilename:Ljava/lang/String;

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 653
    iget-object v5, p0, Lcom/flyersoft/components/cloud/Gdrive$5;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v5, v4}, Lcom/flyersoft/components/cloud/Gdrive;->getGdriveFile(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 655
    iget-object v6, p0, Lcom/flyersoft/components/cloud/Gdrive$5;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v6, v6, Lcom/flyersoft/components/cloud/Gdrive;->service:Lcom/google/api/services/drive/Drive;

    invoke-virtual {v6}, Lcom/google/api/services/drive/Drive;->files()Lcom/google/api/services/drive/Drive$Files;

    move-result-object v6

    invoke-virtual {v5}, Lcom/google/api/services/drive/model/File;->getId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v5}, Lcom/google/api/services/drive/Drive$Files;->delete(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Files$Delete;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/api/services/drive/Drive$Files$Delete;->execute()Ljava/lang/Object;

    .line 656
    iget-object v5, p0, Lcom/flyersoft/components/cloud/Gdrive$5;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v5, v4}, Lcom/flyersoft/components/cloud/Gdrive;->removeFileInfo(Ljava/lang/String;)V

    .line 658
    :cond_1
    new-instance v5, Lcom/google/api/services/drive/model/File;

    invoke-direct {v5}, Lcom/google/api/services/drive/model/File;-><init>()V

    .line 659
    iget-object v6, p0, Lcom/flyersoft/components/cloud/Gdrive$5;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v7, v6, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lcom/flyersoft/components/cloud/Gdrive;->createGdriveFolder(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 660
    iget-object v6, p0, Lcom/flyersoft/components/cloud/Gdrive$5;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v7, v6, Lcom/flyersoft/components/cloud/Gdrive;->mPath:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lcom/flyersoft/components/cloud/Gdrive;->getGdriveFile(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;

    move-result-object v6

    .line 661
    invoke-virtual {v6}, Lcom/google/api/services/drive/model/File;->getId()Ljava/lang/String;

    move-result-object v6

    filled-new-array {v6}, [Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/google/api/services/drive/model/File;->setParents(Ljava/util/List;)Lcom/google/api/services/drive/model/File;

    .line 663
    :cond_2
    invoke-virtual {v5, v2}, Lcom/google/api/services/drive/model/File;->setName(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;

    .line 664
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Gdrive$5;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v2, v2, Lcom/flyersoft/components/cloud/Gdrive;->service:Lcom/google/api/services/drive/Drive;

    invoke-virtual {v2}, Lcom/google/api/services/drive/Drive;->files()Lcom/google/api/services/drive/Drive$Files;

    move-result-object v2

    invoke-virtual {v0}, Lcom/google/api/services/drive/model/File;->getId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0, v5}, Lcom/google/api/services/drive/Drive$Files;->copy(Ljava/lang/String;Lcom/google/api/services/drive/model/File;)Lcom/google/api/services/drive/Drive$Files$Copy;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/api/services/drive/Drive$Files$Copy;->execute()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/api/services/drive/model/File;

    if-eqz v0, :cond_0

    .line 666
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Gdrive$5;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v2, v4, v0}, Lcom/flyersoft/components/cloud/Gdrive;->saveFileInfo(Ljava/lang/String;Lcom/google/api/services/drive/model/File;)V

    .line 667
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "copy:"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-array v2, v1, [Ljava/lang/Object;

    aput-object v0, v2, v3

    invoke-static {v2}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    .line 672
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 673
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Gdrive$5;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/flyersoft/components/cloud/Gdrive;->errorMsg:Ljava/lang/String;

    .line 676
    :cond_3
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    return-void
.end method
