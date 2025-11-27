.class Lorg/comic/CDocument$3;
.super Ljava/lang/Thread;
.source "CDocument.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/comic/CDocument;->unrarFile(Lorg/comic/CbzPageInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/comic/CDocument;


# direct methods
.method constructor <init>(Lorg/comic/CDocument;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 380
    iput-object p1, p0, Lorg/comic/CDocument$3;->this$0:Lorg/comic/CDocument;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 382
    sget-boolean v0, Lcom/flyersoft/tools/A;->crcError:Z

    if-nez v0, :cond_5

    .line 383
    :goto_0
    iget-object v0, p0, Lorg/comic/CDocument$3;->this$0:Lorg/comic/CDocument;

    iget-object v0, v0, Lorg/comic/CDocument;->unrarList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_4

    .line 384
    iget-object v0, p0, Lorg/comic/CDocument$3;->this$0:Lorg/comic/CDocument;

    iget-boolean v0, v0, Lorg/comic/CDocument;->closed:Z

    if-eqz v0, :cond_0

    goto :goto_2

    .line 385
    :cond_0
    iget-object v0, p0, Lorg/comic/CDocument$3;->this$0:Lorg/comic/CDocument;

    iget-object v0, v0, Lorg/comic/CDocument;->unrarList:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/comic/CbzPageInfo;

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    .line 387
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "#unrar: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v4, v0, Lorg/comic/CbzPageInfo;->pageno:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iget-object v4, v0, Lorg/comic/CbzPageInfo;->cacheFile:Ljava/lang/String;

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v3, v5, v1

    aput-object v4, v5, v2

    invoke-static {v5}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 388
    iget-object v3, p0, Lorg/comic/CDocument$3;->this$0:Lorg/comic/CDocument;

    iget-object v3, v3, Lorg/comic/CDocument;->zipper:Lcom/flyersoft/tools/compress/BaseCompressor;

    iget-object v4, v0, Lorg/comic/CbzPageInfo;->zipFile:Ljava/lang/String;

    iget-object v0, v0, Lorg/comic/CbzPageInfo;->cacheFile:Ljava/lang/String;

    invoke-virtual {v3, v4, v0}, Lcom/flyersoft/tools/compress/BaseCompressor;->saveToFile(Ljava/lang/String;Ljava/lang/String;)Z

    goto :goto_1

    .line 390
    :cond_1
    sput-boolean v2, Lcom/flyersoft/tools/A;->crcError:Z

    .line 391
    :goto_1
    iget-object v0, p0, Lorg/comic/CDocument$3;->this$0:Lorg/comic/CDocument;

    iget-object v0, v0, Lorg/comic/CDocument;->unrarList:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 392
    sget-boolean v0, Lcom/flyersoft/tools/A;->crcError:Z

    if-eqz v0, :cond_3

    .line 393
    iget-object v0, p0, Lorg/comic/CDocument$3;->this$0:Lorg/comic/CDocument;

    iget-object v0, v0, Lorg/comic/CDocument;->handler:Landroid/os/Handler;

    if-eqz v0, :cond_2

    .line 394
    iget-object v0, p0, Lorg/comic/CDocument$3;->this$0:Lorg/comic/CDocument;

    iget-object v0, v0, Lorg/comic/CDocument;->handler:Landroid/os/Handler;

    const/16 v1, 0x3c6

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 395
    :cond_2
    iget-object v0, p0, Lorg/comic/CDocument$3;->this$0:Lorg/comic/CDocument;

    iput-boolean v2, v0, Lorg/comic/CDocument;->closed:Z

    goto :goto_0

    :cond_3
    const-wide/16 v0, 0xa

    .line 397
    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 399
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_4
    :goto_2
    return-void

    .line 403
    :cond_5
    iget-object v0, p0, Lorg/comic/CDocument$3;->this$0:Lorg/comic/CDocument;

    invoke-static {v0}, Lorg/comic/CDocument;->-$$Nest$munrarAll(Lorg/comic/CDocument;)V

    return-void
.end method
