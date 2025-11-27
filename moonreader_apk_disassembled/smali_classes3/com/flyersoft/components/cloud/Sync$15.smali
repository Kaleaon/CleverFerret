.class Lcom/flyersoft/components/cloud/Sync$15;
.super Ljava/lang/Thread;
.source "Sync.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Sync;->updateBookListToCloud(Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$bookList:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Ljava/util/ArrayList;)V
    .locals 0

    .line 728
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Sync$15;->val$bookList:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .line 731
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Sync$15;->val$bookList:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/flyersoft/components/cloud/Sync;->createCloudBookList(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v0

    .line 732
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Sync$15;->val$bookList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 733
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "--------updateBookListToCloud---------, new size: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v1, v2, v3

    invoke-static {v2}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 735
    invoke-static {v0}, Lcom/flyersoft/tools/T;->toJsonText(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 736
    invoke-static {v0}, Lcom/flyersoft/tools/compress/MyZip_Java;->compress(Ljava/lang/String;)[B

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/tools/T;->bytes2InputStream([B)Ljava/io/InputStream;

    move-result-object v4

    .line 738
    invoke-static {}, Lcom/flyersoft/components/cloud/Cloud;->instance()Lcom/flyersoft/components/cloud/Cloud;

    move-result-object v2

    sget v1, Lcom/flyersoft/tools/A;->syncType:I

    invoke-static {v1}, Lcom/flyersoft/components/cloud/Cloud;->getShelfBooksJsonFile(I)Ljava/lang/String;

    move-result-object v3

    new-instance v5, Ljava/lang/String;

    .line 739
    invoke-static {v0}, Lcom/flyersoft/tools/compress/MyZip_Java;->compress(Ljava/lang/String;)[B

    move-result-object v0

    invoke-direct {v5, v0}, Ljava/lang/String;-><init>([B)V

    new-instance v6, Lcom/flyersoft/components/cloud/Sync$15$1;

    invoke-direct {v6, p0}, Lcom/flyersoft/components/cloud/Sync$15$1;-><init>(Lcom/flyersoft/components/cloud/Sync$15;)V

    const/4 v7, 0x1

    .line 738
    invoke-virtual/range {v2 .. v7}, Lcom/flyersoft/components/cloud/Cloud;->uploadFromInputStream(Ljava/lang/String;Ljava/io/InputStream;Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterUpload;Z)V

    return-void
.end method
