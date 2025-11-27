.class Lcom/flyersoft/moonreaderp/ActivityTxt$235;
.super Ljava/lang/Thread;
.source "ActivityTxt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->isWebImage(Ljava/lang/String;Ljava/lang/String;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$h:Landroid/os/Handler;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/os/Handler;)V
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

    .line 21327
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$235;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$235;->val$h:Landroid/os/Handler;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 21329
    :cond_0
    invoke-static {}, Lcom/flyersoft/tools/A;->getUnloadedImages()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    if-lez v0, :cond_5

    .line 21330
    invoke-static {}, Lcom/flyersoft/tools/A;->getUnloadedImages()Ljava/util/ArrayList;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 21331
    new-array v3, v1, [Ljava/lang/Object;

    aput-object v0, v3, v2

    invoke-static {v3}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 21332
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$235;->val$h:Landroid/os/Handler;

    invoke-virtual {v3, v2, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 21334
    :try_start_0
    new-instance v3, Ljava/net/URL;

    invoke-direct {v3, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 21335
    invoke-virtual {v3}, Ljava/net/URL;->getContent()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/io/InputStream;

    .line 21336
    invoke-static {v0}, Lcom/flyersoft/tools/A;->generateUrlImageCacheName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 21337
    const-string v4, ".svg"

    invoke-virtual {v0, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 21338
    invoke-static {v3, v0}, Lcom/flyersoft/tools/T;->inputStream2File(Ljava/io/InputStream;Ljava/lang/String;)Z

    goto :goto_0

    .line 21340
    :cond_1
    const-string v4, "src"

    invoke-static {v3, v4}, Landroid/graphics/drawable/Drawable;->createFromStream(Ljava/io/InputStream;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 21342
    invoke-static {v3, v0}, Lcom/flyersoft/tools/T;->drawableToFile(Landroid/graphics/drawable/Drawable;Ljava/lang/String;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 21345
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 21346
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$235;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetimgDownload_start_size(Lcom/flyersoft/moonreaderp/ActivityTxt;)I

    move-result v4

    sub-int/2addr v4, v1

    invoke-static {v3, v4}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputimgDownload_start_size(Lcom/flyersoft/moonreaderp/ActivityTxt;I)V

    .line 21347
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$235;->val$h:Landroid/os/Handler;

    const/4 v4, 0x2

    invoke-static {v0}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v4, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 21349
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$235;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_3

    return-void

    .line 21351
    :cond_3
    invoke-static {}, Lcom/flyersoft/tools/A;->getUnloadedImages()Ljava/util/ArrayList;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 21352
    invoke-static {}, Lcom/flyersoft/tools/A;->getUnloadedImages()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 21353
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$235;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetimgDownload_stop(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 21356
    :cond_5
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$235;->val$h:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void
.end method
