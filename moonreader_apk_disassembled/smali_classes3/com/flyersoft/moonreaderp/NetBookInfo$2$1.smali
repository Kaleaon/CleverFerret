.class Lcom/flyersoft/moonreaderp/NetBookInfo$2$1;
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

    .line 197
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$2$1;->this$1:Lcom/flyersoft/moonreaderp/NetBookInfo$2;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 199
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$2$1;->this$1:Lcom/flyersoft/moonreaderp/NetBookInfo$2;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/NetBookInfo$2;->this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v0, v0, Lcom/flyersoft/opds/OpdsEntry;->thumbnail:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 200
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$2$1;->this$1:Lcom/flyersoft/moonreaderp/NetBookInfo$2;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/NetBookInfo$2;->this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$2$1;->this$1:Lcom/flyersoft/moonreaderp/NetBookInfo$2;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/NetBookInfo$2;->this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v1, v1, Lcom/flyersoft/opds/OpdsEntry;->thumbnail:Ljava/lang/String;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$2$1;->this$1:Lcom/flyersoft/moonreaderp/NetBookInfo$2;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/NetBookInfo$2;->this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v2, v2, Lcom/flyersoft/opds/OpdsEntry;->username:Ljava/lang/String;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$2$1;->this$1:Lcom/flyersoft/moonreaderp/NetBookInfo$2;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/NetBookInfo$2;->this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v3, v3, Lcom/flyersoft/opds/OpdsEntry;->password:Ljava/lang/String;

    invoke-static {v1, v2, v3}, Lcom/flyersoft/tools/T;->getUrlImage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/NetBookInfo;->mDrawable1:Landroid/graphics/drawable/Drawable;

    .line 201
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$2$1;->this$1:Lcom/flyersoft/moonreaderp/NetBookInfo$2;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/NetBookInfo$2;->this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/NetBookInfo;->handler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 202
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$2$1;->this$1:Lcom/flyersoft/moonreaderp/NetBookInfo$2;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/NetBookInfo$2;->this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v0, v0, Lcom/flyersoft/opds/OpdsEntry;->cover:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$2$1;->this$1:Lcom/flyersoft/moonreaderp/NetBookInfo$2;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/NetBookInfo$2;->this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v0, v0, Lcom/flyersoft/opds/OpdsEntry;->thumbnail:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$2$1;->this$1:Lcom/flyersoft/moonreaderp/NetBookInfo$2;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/NetBookInfo$2;->this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v0, v0, Lcom/flyersoft/opds/OpdsEntry;->cover:Ljava/lang/String;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$2$1;->this$1:Lcom/flyersoft/moonreaderp/NetBookInfo$2;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/NetBookInfo$2;->this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v1, v1, Lcom/flyersoft/opds/OpdsEntry;->thumbnail:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 203
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$2$1;->this$1:Lcom/flyersoft/moonreaderp/NetBookInfo$2;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/NetBookInfo$2;->this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$2$1;->this$1:Lcom/flyersoft/moonreaderp/NetBookInfo$2;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/NetBookInfo$2;->this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v1, v1, Lcom/flyersoft/opds/OpdsEntry;->thumbnail:Ljava/lang/String;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$2$1;->this$1:Lcom/flyersoft/moonreaderp/NetBookInfo$2;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/NetBookInfo$2;->this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v2, v2, Lcom/flyersoft/opds/OpdsEntry;->username:Ljava/lang/String;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$2$1;->this$1:Lcom/flyersoft/moonreaderp/NetBookInfo$2;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/NetBookInfo$2;->this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/NetBookInfo;->book:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v3, v3, Lcom/flyersoft/opds/OpdsEntry;->password:Ljava/lang/String;

    invoke-static {v1, v2, v3}, Lcom/flyersoft/tools/T;->getUrlImage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/NetBookInfo;->mDrawable2:Landroid/graphics/drawable/Drawable;

    :cond_2
    return-void
.end method
