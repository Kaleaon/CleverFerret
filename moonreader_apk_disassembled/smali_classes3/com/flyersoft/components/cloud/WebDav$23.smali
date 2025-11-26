.class Lcom/flyersoft/components/cloud/WebDav$23;
.super Ljava/lang/Object;
.source "WebDav.java"

# interfaces
.implements Lio/reactivex/rxjava3/core/ObservableOnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/WebDav;->upload(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;ZZ)V
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

.field final synthetic val$forUploadBookFile:Z

.field final synthetic val$fromPath:Ljava/lang/String;

.field final synthetic val$ignoreExists:Z


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/WebDav;Ljava/util/ArrayList;Ljava/lang/String;ZZ)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
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

    .line 851
    iput-object p1, p0, Lcom/flyersoft/components/cloud/WebDav$23;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/WebDav$23;->val$files:Ljava/util/ArrayList;

    iput-object p3, p0, Lcom/flyersoft/components/cloud/WebDav$23;->val$fromPath:Ljava/lang/String;

    iput-boolean p4, p0, Lcom/flyersoft/components/cloud/WebDav$23;->val$ignoreExists:Z

    iput-boolean p5, p0, Lcom/flyersoft/components/cloud/WebDav$23;->val$forUploadBookFile:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public subscribe(Lio/reactivex/rxjava3/core/ObservableEmitter;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/rxjava3/core/ObservableEmitter<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 854
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/components/cloud/WebDav$23;->val$files:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    if-lez v0, :cond_3

    iget-object v0, p0, Lcom/flyersoft/components/cloud/WebDav$23;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-boolean v0, v0, Lcom/flyersoft/components/cloud/WebDav;->mCanceled:Z

    if-nez v0, :cond_3

    .line 856
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/components/cloud/WebDav$23;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object v2, p0, Lcom/flyersoft/components/cloud/WebDav$23;->val$files:Ljava/util/ArrayList;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, v0, Lcom/flyersoft/components/cloud/WebDav;->mFilename:Ljava/lang/String;

    .line 857
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    .line 858
    iget-object v0, p0, Lcom/flyersoft/components/cloud/WebDav$23;->val$files:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 860
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/flyersoft/components/cloud/WebDav$23;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object v2, v2, Lcom/flyersoft/components/cloud/WebDav;->mPath:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/flyersoft/components/cloud/WebDav$23;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object v2, v2, Lcom/flyersoft/components/cloud/WebDav;->mFilename:Ljava/lang/String;

    iget-object v4, p0, Lcom/flyersoft/components/cloud/WebDav$23;->val$fromPath:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 861
    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 862
    iget-object v4, p0, Lcom/flyersoft/components/cloud/WebDav$23;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    invoke-virtual {v4, v2}, Lcom/flyersoft/components/cloud/WebDav;->initPaths(Ljava/lang/String;)Ljava/lang/String;

    .line 863
    iget-object v2, p0, Lcom/flyersoft/components/cloud/WebDav$23;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object v2, v2, Lcom/flyersoft/components/cloud/WebDav;->mFilename:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v2, :cond_2

    .line 867
    :try_start_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ">>*check if upload: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-array v5, v1, [Ljava/lang/Object;

    aput-object v4, v5, v3

    invoke-static {v5}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 868
    new-instance v4, Lcom/flyersoft/components/cloud/webdav/WebDavFile;

    invoke-direct {v4, v0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;-><init>(Ljava/lang/String;)V

    .line 869
    invoke-virtual {v4, v3}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->exists(Z)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 870
    iget-boolean v5, p0, Lcom/flyersoft/components/cloud/WebDav$23;->val$ignoreExists:Z

    if-eqz v5, :cond_1

    invoke-virtual {v4}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->getSize()J

    move-result-wide v5

    const-wide/16 v7, 0x0

    cmp-long v9, v5, v7

    if-lez v9, :cond_1

    :goto_1
    const/4 v2, 0x0

    goto :goto_2

    .line 872
    :cond_1
    invoke-virtual {v4}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->getSize()J

    move-result-wide v4

    new-instance v6, Ljava/io/File;

    iget-object v7, p0, Lcom/flyersoft/components/cloud/WebDav$23;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object v7, v7, Lcom/flyersoft/components/cloud/WebDav;->mFilename:Ljava/lang/String;

    invoke-direct {v6, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/io/File;->length()J

    move-result-wide v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    cmp-long v8, v4, v6

    if-nez v8, :cond_2

    goto :goto_1

    :catchall_0
    move-exception v4

    .line 876
    :try_start_2
    invoke-static {v4}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_2
    :goto_2
    if-eqz v2, :cond_0

    .line 880
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ">>*confirm upload: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-array v4, v1, [Ljava/lang/Object;

    aput-object v2, v4, v3

    invoke-static {v4}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 881
    new-instance v2, Lcom/flyersoft/components/cloud/webdav/WebDavFile;

    invoke-direct {v2, v0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/flyersoft/components/cloud/WebDav$23;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/WebDav;->mFilename:Ljava/lang/String;

    invoke-virtual {v2, v0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->upload(Ljava/lang/String;)Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto/16 :goto_0

    :catchall_1
    move-exception v0

    .line 884
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 885
    iget-object v2, p0, Lcom/flyersoft/components/cloud/WebDav$23;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/flyersoft/components/cloud/WebDav;->errorMsg:Ljava/lang/String;

    .line 888
    :cond_3
    iget-boolean v0, p0, Lcom/flyersoft/components/cloud/WebDav$23;->val$forUploadBookFile:Z

    if-nez v0, :cond_4

    .line 889
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    :cond_4
    return-void
.end method
