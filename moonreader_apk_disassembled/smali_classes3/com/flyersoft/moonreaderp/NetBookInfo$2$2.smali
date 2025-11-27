.class Lcom/flyersoft/moonreaderp/NetBookInfo$2$2;
.super Ljava/lang/Thread;
.source "NetBookInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/NetBookInfo$2;->handleMessage(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/NetBookInfo$2;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/NetBookInfo$2;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 207
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$2$2;->this$1:Lcom/flyersoft/moonreaderp/NetBookInfo$2;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 210
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$2$2;->this$1:Lcom/flyersoft/moonreaderp/NetBookInfo$2;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/NetBookInfo$2;->this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v0, v0, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/opds/OpdsEntry$BookUrl;

    .line 211
    iget-object v2, v1, Lcom/flyersoft/opds/OpdsEntry$BookUrl;->href:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->getUrlFileSize(Ljava/lang/String;)J

    move-result-wide v2

    iput-wide v2, v1, Lcom/flyersoft/opds/OpdsEntry$BookUrl;->file_size:J

    .line 212
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$2$2;->this$1:Lcom/flyersoft/moonreaderp/NetBookInfo$2;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/NetBookInfo$2;->this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/NetBookInfo;->handler:Landroid/os/Handler;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    .line 214
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$2$2;->this$1:Lcom/flyersoft/moonreaderp/NetBookInfo$2;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/NetBookInfo$2;->this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/NetBookInfo;->handler:Landroid/os/Handler;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 216
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-void
.end method
