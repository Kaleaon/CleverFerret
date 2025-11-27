.class Lcom/flyersoft/components/cloud/WebDav$9;
.super Ljava/lang/Object;
.source "WebDav.java"

# interfaces
.implements Lio/reactivex/rxjava3/core/ObservableOnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/WebDav;->copy(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)V
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
.field final synthetic this$0:Lcom/flyersoft/components/cloud/WebDav;

.field final synthetic val$files:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/WebDav;Ljava/util/ArrayList;)V
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

    .line 371
    iput-object p1, p0, Lcom/flyersoft/components/cloud/WebDav$9;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/WebDav$9;->val$files:Ljava/util/ArrayList;

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

    .line 374
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/components/cloud/WebDav$9;->val$files:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/components/cloud/WebDav$9;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-boolean v0, v0, Lcom/flyersoft/components/cloud/WebDav;->mCanceled:Z

    if-nez v0, :cond_0

    .line 376
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/components/cloud/WebDav$9;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/WebDav$9;->val$files:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, v0, Lcom/flyersoft/components/cloud/WebDav;->mFilename:Ljava/lang/String;

    .line 377
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    .line 378
    iget-object v0, p0, Lcom/flyersoft/components/cloud/WebDav$9;->val$files:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 380
    iget-object v0, p0, Lcom/flyersoft/components/cloud/WebDav$9;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object v1, v0, Lcom/flyersoft/components/cloud/WebDav;->mPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/cloud/WebDav;->initPaths(Ljava/lang/String;)Ljava/lang/String;

    .line 381
    new-instance v0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/WebDav$9;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object v1, v1, Lcom/flyersoft/components/cloud/WebDav;->mFilename:Ljava/lang/String;

    invoke-direct {v0, v1}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;-><init>(Ljava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/flyersoft/components/cloud/WebDav$9;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object v2, v2, Lcom/flyersoft/components/cloud/WebDav;->mPath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/flyersoft/components/cloud/WebDav$9;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object v2, v2, Lcom/flyersoft/components/cloud/WebDav;->mFilename:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->copy(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 383
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 384
    iget-object v1, p0, Lcom/flyersoft/components/cloud/WebDav$9;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/flyersoft/components/cloud/WebDav;->errorMsg:Ljava/lang/String;

    :cond_0
    const/4 v0, 0x1

    .line 387
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    return-void
.end method
