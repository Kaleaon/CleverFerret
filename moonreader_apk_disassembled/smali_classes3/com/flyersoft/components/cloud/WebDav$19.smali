.class Lcom/flyersoft/components/cloud/WebDav$19;
.super Ljava/lang/Object;
.source "WebDav.java"

# interfaces
.implements Lio/reactivex/rxjava3/core/ObservableOnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/WebDav;->dir(Landroid/content/Context;Ljava/lang/String;Lcom/flyersoft/tools/T$OnResult;)V
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

.field final synthetic val$onDone:Lcom/flyersoft/tools/T$OnResult;

.field final synthetic val$path:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/WebDav;Ljava/lang/String;Lcom/flyersoft/tools/T$OnResult;)V
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

    .line 613
    iput-object p1, p0, Lcom/flyersoft/components/cloud/WebDav$19;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/WebDav$19;->val$path:Ljava/lang/String;

    iput-object p3, p0, Lcom/flyersoft/components/cloud/WebDav$19;->val$onDone:Lcom/flyersoft/tools/T$OnResult;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public subscribe(Lio/reactivex/rxjava3/core/ObservableEmitter;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/rxjava3/core/ObservableEmitter<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 617
    const-string v0, "/"

    .line 0
    const-string v1, "dir:"

    .line 617
    :try_start_0
    iget-object v2, p0, Lcom/flyersoft/components/cloud/WebDav$19;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object v3, p0, Lcom/flyersoft/components/cloud/WebDav$19;->val$path:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/flyersoft/components/cloud/WebDav;->-$$Nest$mgetPath(Lcom/flyersoft/components/cloud/WebDav;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/flyersoft/components/cloud/WebDav;->mPath:Ljava/lang/String;

    .line 618
    iget-object v2, p0, Lcom/flyersoft/components/cloud/WebDav$19;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object v3, v2, Lcom/flyersoft/components/cloud/WebDav;->mPath:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/flyersoft/components/cloud/WebDav;->initPaths(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 619
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/flyersoft/components/cloud/WebDav$19;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object v1, v1, Lcom/flyersoft/components/cloud/WebDav;->mPath:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v1, v3, v4

    invoke-static {v3}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    if-eqz v2, :cond_2

    .line 621
    iget-object v1, p0, Lcom/flyersoft/components/cloud/WebDav$19;->val$onDone:Lcom/flyersoft/tools/T$OnResult;

    if-nez v1, :cond_0

    .line 622
    iget-object v1, p0, Lcom/flyersoft/components/cloud/WebDav$19;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object v2, v1, Lcom/flyersoft/components/cloud/WebDav;->mPath:Ljava/lang/String;

    iget-object v3, p0, Lcom/flyersoft/components/cloud/WebDav$19;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object v3, v3, Lcom/flyersoft/components/cloud/WebDav;->mPath:Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/flyersoft/components/cloud/WebDav;->mPath:Ljava/lang/String;

    .line 623
    iget-object v1, p0, Lcom/flyersoft/components/cloud/WebDav$19;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object v1, v1, Lcom/flyersoft/components/cloud/WebDav;->mPath:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 624
    iget-object v1, p0, Lcom/flyersoft/components/cloud/WebDav$19;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iput-object v0, v1, Lcom/flyersoft/components/cloud/WebDav;->mPath:Ljava/lang/String;

    goto :goto_0

    .line 625
    :cond_0
    const-string v0, "500"

    invoke-virtual {v2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "501"

    invoke-virtual {v2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "502"

    invoke-virtual {v2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "503"

    invoke-virtual {v2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "504"

    invoke-virtual {v2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 626
    :cond_1
    new-instance v0, Ljava/lang/Throwable;

    invoke-direct {v0}, Ljava/lang/Throwable;-><init>()V

    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    return-void

    .line 630
    :cond_2
    :goto_0
    new-instance v0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/WebDav$19;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object v1, v1, Lcom/flyersoft/components/cloud/WebDav;->mPath:Ljava/lang/String;

    invoke-direct {v0, v1}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->listFiles()Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_3

    .line 631
    new-instance v0, Ljava/lang/Throwable;

    invoke-direct {v0}, Ljava/lang/Throwable;-><init>()V

    :cond_3
    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    .line 633
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 634
    iget-object v1, p0, Lcom/flyersoft/components/cloud/WebDav$19;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/flyersoft/components/cloud/WebDav;->errorMsg:Ljava/lang/String;

    .line 635
    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    return-void
.end method
