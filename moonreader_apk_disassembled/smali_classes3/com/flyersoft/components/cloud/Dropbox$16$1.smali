.class Lcom/flyersoft/components/cloud/Dropbox$16$1;
.super Ljava/lang/Object;
.source "Dropbox.java"

# interfaces
.implements Lcom/dropbox/core/util/IOUtil$ProgressListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Dropbox$16;->subscribe(Lio/reactivex/rxjava3/core/ObservableEmitter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/components/cloud/Dropbox$16;

.field final synthetic val$emitter:Lio/reactivex/rxjava3/core/ObservableEmitter;

.field final synthetic val$os:Ljava/io/ByteArrayOutputStream;

.field final synthetic val$saveToFilename:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Dropbox$16;Lio/reactivex/rxjava3/core/ObservableEmitter;Ljava/io/ByteArrayOutputStream;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
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

    .line 615
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Dropbox$16$1;->this$1:Lcom/flyersoft/components/cloud/Dropbox$16;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Dropbox$16$1;->val$emitter:Lio/reactivex/rxjava3/core/ObservableEmitter;

    iput-object p3, p0, Lcom/flyersoft/components/cloud/Dropbox$16$1;->val$os:Ljava/io/ByteArrayOutputStream;

    iput-object p4, p0, Lcom/flyersoft/components/cloud/Dropbox$16$1;->val$saveToFilename:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgress(J)V
    .locals 4

    .line 618
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$16$1;->this$1:Lcom/flyersoft/components/cloud/Dropbox$16;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Dropbox$16;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-boolean v0, v0, Lcom/flyersoft/components/cloud/Dropbox;->mCanceled:Z

    if-nez v0, :cond_0

    .line 619
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$16$1;->val$emitter:Lio/reactivex/rxjava3/core/ObservableEmitter;

    new-instance v1, Lcom/flyersoft/components/cloud/Cloud$Progress;

    iget-object v2, p0, Lcom/flyersoft/components/cloud/Dropbox$16$1;->this$1:Lcom/flyersoft/components/cloud/Dropbox$16;

    iget-object v2, v2, Lcom/flyersoft/components/cloud/Dropbox$16;->this$0:Lcom/flyersoft/components/cloud/Dropbox;

    iget-wide v2, v2, Lcom/flyersoft/components/cloud/Dropbox;->mFileLen:J

    invoke-direct {v1, p1, p2, v2, v3}, Lcom/flyersoft/components/cloud/Cloud$Progress;-><init>(JJ)V

    invoke-interface {v0, v1}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    .line 620
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Dropbox$16$1;->val$os:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {p1}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result p1

    if-lez p1, :cond_1

    .line 621
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Dropbox$16$1;->val$os:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {p1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/T;->bytes2InputStream([B)Ljava/io/InputStream;

    move-result-object p1

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Dropbox$16$1;->val$saveToFilename:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ".mr"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/flyersoft/tools/T;->appendInputStream2File(Ljava/io/InputStream;Ljava/lang/String;)Z

    .line 622
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Dropbox$16$1;->val$os:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {p1}, Ljava/io/ByteArrayOutputStream;->reset()V

    :cond_1
    return-void
.end method
