.class Lcom/flyersoft/components/cloud/Sync$7$1;
.super Ljava/lang/Thread;
.source "Sync.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Sync$7;->done(Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/cloud/Sync$7;

.field final synthetic val$cloudFiles:Ljava/util/HashMap;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Sync$7;Ljava/util/HashMap;)V
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

    .line 405
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Sync$7$1;->this$0:Lcom/flyersoft/components/cloud/Sync$7;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Sync$7$1;->val$cloudFiles:Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 409
    :try_start_0
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getAllBooks()Ljava/util/ArrayList;

    move-result-object v0

    .line 410
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 411
    iget-object v5, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v5}, Lcom/flyersoft/tools/A;->getFileType(Ljava/lang/String;)I

    move-result v5

    const/4 v6, 0x7

    if-ne v5, v6, :cond_1

    goto :goto_1

    :cond_1
    const/4 v3, 0x0

    :goto_1
    if-nez v3, :cond_2

    .line 412
    iget-object v4, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->downloadUrl:Ljava/lang/String;

    invoke-static {v4}, Lcom/flyersoft/components/cloud/Cloud;->getCloudType(Ljava/lang/String;)I

    move-result v4

    if-nez v4, :cond_0

    .line 413
    :cond_2
    iget-object v4, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->pureFilename:Ljava/lang/String;

    iget-object v5, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    iget-object v6, p0, Lcom/flyersoft/components/cloud/Sync$7$1;->val$cloudFiles:Ljava/util/HashMap;

    invoke-static {v4, v5, v6}, Lcom/flyersoft/components/cloud/Sync;->-$$Nest$smlocalFileIsNewer(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 414
    iget-object v4, p0, Lcom/flyersoft/components/cloud/Sync$7$1;->this$0:Lcom/flyersoft/components/cloud/Sync$7;

    iget-boolean v4, v4, Lcom/flyersoft/components/cloud/Sync$7;->val$checkSyncRecords:Z

    if-eqz v4, :cond_4

    if-eqz v3, :cond_3

    iget-object v3, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    .line 415
    invoke-static {v3}, Lcom/flyersoft/components/cloud/Sync;->-$$Nest$smisJustUploadedPdf(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    :cond_3
    iget-object v3, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    .line 416
    invoke-static {v3}, Lcom/flyersoft/components/cloud/Sync;->-$$Nest$smisJustUploadedFile(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 417
    :cond_4
    sget-object v3, Lcom/flyersoft/components/cloud/Sync;->uploadShelfBookList:Ljava/util/ArrayList;

    iget-object v2, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_5
    if-eqz v3, :cond_0

    .line 418
    iget-object v3, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->pureFilename:Ljava/lang/String;

    iget-object v4, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    iget-object v5, p0, Lcom/flyersoft/components/cloud/Sync$7$1;->val$cloudFiles:Ljava/util/HashMap;

    invoke-static {v3, v4, v5}, Lcom/flyersoft/components/cloud/Sync;->-$$Nest$smcloudFileIsNewer(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 419
    sget-object v3, Lcom/flyersoft/components/cloud/Sync;->pdfCloudIsNewerList:Ljava/util/ArrayList;

    iget-object v2, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 422
    :cond_6
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Sync$7$1;->this$0:Lcom/flyersoft/components/cloud/Sync$7;

    iget-boolean v1, v1, Lcom/flyersoft/components/cloud/Sync$7;->val$uploadCoversToo:Z

    if-eqz v1, :cond_7

    sget-object v1, Lcom/flyersoft/components/cloud/Sync;->uploadShelfBookList:Ljava/util/ArrayList;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v1

    if-nez v1, :cond_7

    .line 423
    invoke-static {v0, v4, v3}, Lcom/flyersoft/components/cloud/Sync;->-$$Nest$smuploadShelfBookCovers(Ljava/util/ArrayList;ZZ)V

    .line 425
    :cond_7
    sget-object v0, Lcom/flyersoft/components/cloud/Sync;->pdfCloudIsNewerList:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    if-nez v0, :cond_8

    .line 426
    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->-$$Nest$smdownloadPdfCloudIsNewer()V

    :cond_8
    const/4 v0, 0x0

    .line 427
    invoke-static {v0}, Lcom/flyersoft/components/cloud/Sync;->-$$Nest$smuploadShelfBooksFinal(Ljava/lang/String;)V

    .line 429
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Sync$7$1;->val$cloudFiles:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    .line 432
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-void
.end method
