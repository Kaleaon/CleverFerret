.class Lcom/flyersoft/components/cloud/WebDav$17;
.super Ljava/lang/Object;
.source "WebDav.java"

# interfaces
.implements Lio/reactivex/rxjava3/core/ObservableOnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/WebDav;->search(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
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


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/WebDav;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 547
    iput-object p1, p0, Lcom/flyersoft/components/cloud/WebDav$17;->this$0:Lcom/flyersoft/components/cloud/WebDav;

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

    .line 553
    :try_start_0
    new-instance v0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/WebDav$17;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iget-object v1, v1, Lcom/flyersoft/components/cloud/WebDav;->mPath:Ljava/lang/String;

    invoke-direct {v0, v1}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->listFiles()Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_0

    .line 554
    new-instance v0, Ljava/lang/Throwable;

    invoke-direct {v0}, Ljava/lang/Throwable;-><init>()V

    :cond_0
    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    .line 556
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 557
    iget-object v1, p0, Lcom/flyersoft/components/cloud/WebDav$17;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/flyersoft/components/cloud/WebDav;->errorMsg:Ljava/lang/String;

    .line 558
    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    return-void
.end method
