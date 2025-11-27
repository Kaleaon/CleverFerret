.class Lcom/flyersoft/components/cloud/Gdrive$11;
.super Ljava/lang/Object;
.source "Gdrive.java"

# interfaces
.implements Lio/reactivex/rxjava3/core/ObservableOnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Gdrive;->delete(Landroid/content/Context;Ljava/util/ArrayList;)V
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

    .line 839
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Gdrive$11;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Gdrive$11;->val$files:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public subscribe(Lio/reactivex/rxjava3/core/ObservableEmitter;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/rxjava3/core/ObservableEmitter<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 842
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$11;->val$files:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    if-lez v0, :cond_2

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$11;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-boolean v0, v0, Lcom/flyersoft/components/cloud/Gdrive;->mCanceled:Z

    if-nez v0, :cond_2

    .line 844
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$11;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v2, p0, Lcom/flyersoft/components/cloud/Gdrive$11;->val$files:Ljava/util/ArrayList;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, v0, Lcom/flyersoft/components/cloud/Gdrive;->mFilename:Ljava/lang/String;

    .line 845
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    .line 846
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$11;->val$files:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 848
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$11;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v2, v0, Lcom/flyersoft/components/cloud/Gdrive;->mFilename:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/flyersoft/components/cloud/Gdrive;->getGdriveFile(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;

    move-result-object v0

    .line 849
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Gdrive$11;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v2, v0}, Lcom/flyersoft/components/cloud/Gdrive;->isValidFile(Lcom/google/api/services/drive/model/File;)Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, p0, Lcom/flyersoft/components/cloud/Gdrive$11;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v2, v0}, Lcom/flyersoft/components/cloud/Gdrive;->isValidFolder(Lcom/google/api/services/drive/model/File;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 850
    :cond_1
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Gdrive$11;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v2, v2, Lcom/flyersoft/components/cloud/Gdrive;->service:Lcom/google/api/services/drive/Drive;

    invoke-virtual {v2}, Lcom/google/api/services/drive/Drive;->files()Lcom/google/api/services/drive/Drive$Files;

    move-result-object v2

    invoke-virtual {v0}, Lcom/google/api/services/drive/model/File;->getId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Lcom/google/api/services/drive/Drive$Files;->delete(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Files$Delete;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/api/services/drive/Drive$Files$Delete;->execute()Ljava/lang/Object;

    .line 851
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$11;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v2, v0, Lcom/flyersoft/components/cloud/Gdrive;->mFilename:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/flyersoft/components/cloud/Gdrive;->removeFileInfo(Ljava/lang/String;)V

    .line 852
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "delete:"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/flyersoft/components/cloud/Gdrive$11;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    iget-object v2, v2, Lcom/flyersoft/components/cloud/Gdrive;->mFilename:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-array v2, v1, [Ljava/lang/Object;

    aput-object v0, v2, v3

    invoke-static {v2}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 855
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 856
    iget-object v2, p0, Lcom/flyersoft/components/cloud/Gdrive$11;->this$0:Lcom/flyersoft/components/cloud/Gdrive;

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/flyersoft/components/cloud/Gdrive;->errorMsg:Ljava/lang/String;

    .line 859
    :cond_2
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    return-void
.end method
