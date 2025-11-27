.class Lcom/flyersoft/components/cloud/Dropbox$18$1;
.super Ljava/lang/Object;
.source "Dropbox.java"

# interfaces
.implements Lcom/dropbox/core/util/IOUtil$ProgressListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Dropbox$18;->subscribe(Lio/reactivex/rxjava3/core/ObservableEmitter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/components/cloud/Dropbox$18;

.field final synthetic val$emitter:Lio/reactivex/rxjava3/core/ObservableEmitter;

.field final synthetic val$fileSize:J


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Dropbox$18;Lio/reactivex/rxjava3/core/ObservableEmitter;J)V
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

    .line 747
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Dropbox$18$1;->this$1:Lcom/flyersoft/components/cloud/Dropbox$18;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Dropbox$18$1;->val$emitter:Lio/reactivex/rxjava3/core/ObservableEmitter;

    iput-wide p3, p0, Lcom/flyersoft/components/cloud/Dropbox$18$1;->val$fileSize:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgress(J)V
    .locals 4

    .line 750
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$18$1;->this$1:Lcom/flyersoft/components/cloud/Dropbox$18;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Dropbox$18;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-boolean v0, v0, Lcom/flyersoft/components/cloud/Dropbox;->mCanceled:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$18$1;->this$1:Lcom/flyersoft/components/cloud/Dropbox$18;

    iget-boolean v0, v0, Lcom/flyersoft/components/cloud/Dropbox$18;->val$forUploadBookFile:Z

    if-nez v0, :cond_0

    .line 751
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$18$1;->val$emitter:Lio/reactivex/rxjava3/core/ObservableEmitter;

    new-instance v1, Lcom/flyersoft/components/cloud/Cloud$Progress;

    iget-wide v2, p0, Lcom/flyersoft/components/cloud/Dropbox$18$1;->val$fileSize:J

    invoke-direct {v1, p1, p2, v2, v3}, Lcom/flyersoft/components/cloud/Cloud$Progress;-><init>(JJ)V

    invoke-interface {v0, v1}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method
