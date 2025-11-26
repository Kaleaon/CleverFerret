.class Lcom/flyersoft/components/cloud/Dropbox$4;
.super Ljava/lang/Object;
.source "Dropbox.java"

# interfaces
.implements Lio/reactivex/rxjava3/core/ObservableOnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Dropbox;->copy(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)V
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
.field final synthetic this$0:Lcom/flyersoft/components/cloud/Dropbox;

.field final synthetic val$files:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Dropbox;Ljava/util/ArrayList;)V
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

    .line 216
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Dropbox$4;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Dropbox$4;->val$files:Ljava/util/ArrayList;

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

    .line 219
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$4;->val$files:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$4;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-boolean v0, v0, Lcom/flyersoft/components/cloud/Dropbox;->mCanceled:Z

    if-nez v0, :cond_0

    .line 221
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$4;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Dropbox$4;->val$files:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, v0, Lcom/flyersoft/components/cloud/Dropbox;->mFilename:Ljava/lang/String;

    .line 222
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    .line 223
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$4;->val$files:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 225
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$4;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    invoke-virtual {v0}, Lcom/flyersoft/components/cloud/Dropbox;->getClient()Lcom/dropbox/core/v2/DbxClientV2;

    move-result-object v0

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxClientV2;->files()Lcom/dropbox/core/v2/files/DbxUserFilesRequests;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Dropbox$4;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v1, v1, Lcom/flyersoft/components/cloud/Dropbox;->mFilename:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/flyersoft/components/cloud/Dropbox$4;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v3, v3, Lcom/flyersoft/components/cloud/Dropbox;->mPath:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/flyersoft/components/cloud/Dropbox$4;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v3, v3, Lcom/flyersoft/components/cloud/Dropbox;->mFilename:Ljava/lang/String;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->copyV2(Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/v2/files/RelocationResult;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 227
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 228
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Dropbox$4;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/flyersoft/components/cloud/Dropbox;->errorMsg:Ljava/lang/String;

    :cond_0
    const/4 v0, 0x1

    .line 231
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    return-void
.end method
