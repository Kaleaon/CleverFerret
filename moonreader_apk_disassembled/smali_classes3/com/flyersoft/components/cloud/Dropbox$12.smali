.class Lcom/flyersoft/components/cloud/Dropbox$12;
.super Ljava/lang/Object;
.source "Dropbox.java"

# interfaces
.implements Lio/reactivex/rxjava3/core/ObservableOnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Dropbox;->search(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
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

.field final synthetic val$key:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Dropbox;Ljava/lang/String;)V
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

    .line 396
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Dropbox$12;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Dropbox$12;->val$key:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public subscribe(Lio/reactivex/rxjava3/core/ObservableEmitter;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/rxjava3/core/ObservableEmitter<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 400
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$12;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    invoke-virtual {v0}, Lcom/flyersoft/components/cloud/Dropbox;->getClient()Lcom/dropbox/core/v2/DbxClientV2;

    move-result-object v0

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxClientV2;->files()Lcom/dropbox/core/v2/files/DbxUserFilesRequests;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Dropbox$12;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-object v1, v1, Lcom/flyersoft/components/cloud/Dropbox;->mPath:Ljava/lang/String;

    iget-object v2, p0, Lcom/flyersoft/components/cloud/Dropbox$12;->val$key:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->search(Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/v2/files/SearchResult;

    move-result-object v0

    if-nez v0, :cond_0

    .line 401
    new-instance v0, Ljava/lang/Throwable;

    invoke-direct {v0}, Ljava/lang/Throwable;-><init>()V

    :cond_0
    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    .line 403
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 404
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Dropbox$12;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/flyersoft/components/cloud/Dropbox;->errorMsg:Ljava/lang/String;

    .line 405
    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    return-void
.end method
