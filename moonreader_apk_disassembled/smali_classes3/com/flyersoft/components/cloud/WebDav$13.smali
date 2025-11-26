.class Lcom/flyersoft/components/cloud/WebDav$13;
.super Ljava/lang/Object;
.source "WebDav.java"

# interfaces
.implements Lio/reactivex/rxjava3/core/ObservableOnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/WebDav;->rename(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
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

.field final synthetic val$newName:Ljava/lang/String;

.field final synthetic val$oldName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/WebDav;Ljava/lang/String;Ljava/lang/String;)V
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

    .line 465
    iput-object p1, p0, Lcom/flyersoft/components/cloud/WebDav$13;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/WebDav$13;->val$oldName:Ljava/lang/String;

    iput-object p3, p0, Lcom/flyersoft/components/cloud/WebDav$13;->val$newName:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public subscribe(Lio/reactivex/rxjava3/core/ObservableEmitter;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/rxjava3/core/ObservableEmitter<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 469
    :try_start_0
    new-instance v0, Lcom/flyersoft/components/cloud/webdav/WebDavFile;

    iget-object v1, p0, Lcom/flyersoft/components/cloud/WebDav$13;->val$oldName:Ljava/lang/String;

    invoke-direct {v0, v1}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/flyersoft/components/cloud/WebDav$13;->val$newName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/cloud/webdav/WebDavFile;->move(Ljava/lang/String;)Ljava/lang/String;

    const/4 v0, 0x1

    .line 470
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    .line 472
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 473
    iget-object v1, p0, Lcom/flyersoft/components/cloud/WebDav$13;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/flyersoft/components/cloud/WebDav;->errorMsg:Ljava/lang/String;

    const/4 v0, -0x1

    .line 474
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    return-void
.end method
