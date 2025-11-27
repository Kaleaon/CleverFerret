.class Lcom/flyersoft/components/cloud/Sync$14;
.super Ljava/lang/Object;
.source "Sync.java"

# interfaces
.implements Lcom/flyersoft/components/cloud/Cloud$AfterDownload;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Sync;->updateBookListViaCloudFinal(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$checkSyncRecords:Z


# direct methods
.method constructor <init>(Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 674
    iput-boolean p1, p0, Lcom/flyersoft/components/cloud/Sync$14;->val$checkSyncRecords:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterDownload(Ljava/io/ByteArrayOutputStream;Ljava/lang/String;J)V
    .locals 5

    const-string p2, "*cloudBooks size: "

    const/4 p3, 0x1

    .line 677
    invoke-static {p3}, Lcom/flyersoft/components/cloud/Sync;->setShelfUpdateState(I)V

    const/4 p4, 0x0

    .line 679
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p1, :cond_0

    .line 682
    :try_start_1
    invoke-virtual {p1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1

    .line 683
    array-length v1, p1

    if-lez v1, :cond_0

    .line 684
    invoke-static {p1}, Lcom/flyersoft/tools/compress/MyZip_Java;->decompress([B)Ljava/lang/String;

    move-result-object v1

    .line 685
    const-class v2, Lcom/flyersoft/components/cloud/Sync$CloudBook;

    invoke-static {v1, v2}, Lcom/flyersoft/tools/T;->getJsonArray(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    .line 686
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p2

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, ", bytes len: "

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length p1, p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-array p2, p3, [Ljava/lang/Object;

    aput-object p1, p2, p4

    invoke-static {p2}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 689
    :try_start_2
    new-array p2, p3, [Ljava/lang/Object;

    const-string v1, "FAILED to get cloud book list"

    aput-object v1, p2, p4

    invoke-static {p2}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 690
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 694
    :cond_0
    :goto_0
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getAllBooks()Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    .line 695
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 697
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/components/cloud/Sync$CloudBook;

    .line 698
    iget-object v3, v2, Lcom/flyersoft/components/cloud/Sync$CloudBook;->filename:Ljava/lang/String;

    sget v4, Lcom/flyersoft/tools/A;->syncType:I

    invoke-static {v3, v4}, Lcom/flyersoft/components/cloud/Sync;->fixWebDavFilename(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/flyersoft/components/cloud/Sync$CloudBook;->filename:Ljava/lang/String;

    goto :goto_1

    .line 700
    :cond_1
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 701
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/components/cloud/Sync$CloudBook;

    .line 702
    sget-object v3, Lcom/flyersoft/tools/A;->deviceRandomID:Ljava/lang/String;

    iget-object v4, v2, Lcom/flyersoft/components/cloud/Sync$CloudBook;->deviceId:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 703
    invoke-virtual {p2, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 705
    :cond_3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_4
    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/components/cloud/Sync$CloudBook;

    .line 706
    sget-object v3, Lcom/flyersoft/tools/A;->deviceRandomID:Ljava/lang/String;

    iget-object v4, v2, Lcom/flyersoft/components/cloud/Sync$CloudBook;->deviceId:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 707
    iget-boolean v3, p0, Lcom/flyersoft/components/cloud/Sync$14;->val$checkSyncRecords:Z

    if-eqz v3, :cond_5

    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->getDownloadedShelfList()Ljava/util/ArrayList;

    move-result-object v3

    iget-object v4, v2, Lcom/flyersoft/components/cloud/Sync$CloudBook;->filename:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v3

    const/4 v4, -0x1

    if-ne v3, v4, :cond_4

    .line 708
    :cond_5
    iget-object v3, v2, Lcom/flyersoft/components/cloud/Sync$CloudBook;->filename:Ljava/lang/String;

    invoke-static {p1, v3}, Lcom/flyersoft/components/cloud/Sync;->getSamePureFilenameBook(Ljava/util/ArrayList;Ljava/lang/String;)Lcom/flyersoft/tools/BookDb$BookInfo;

    move-result-object v3

    if-nez v3, :cond_4

    .line 709
    invoke-virtual {p2, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 712
    :cond_6
    iget-boolean v1, p0, Lcom/flyersoft/components/cloud/Sync$14;->val$checkSyncRecords:Z

    xor-int/2addr p3, v1

    .line 713
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-gtz v2, :cond_8

    if-nez v1, :cond_7

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_7

    goto :goto_4

    :cond_7
    if-eqz v1, :cond_9

    .line 716
    invoke-static {p1}, Lcom/flyersoft/components/cloud/Sync;->updateBookListToCloud(Ljava/util/ArrayList;)V

    goto :goto_5

    .line 714
    :cond_8
    :goto_4
    invoke-static {p1, p2, v0, p3}, Lcom/flyersoft/components/cloud/Sync;->-$$Nest$smupdateMyShelfBooks(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/List;Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_5

    :catchall_0
    move-exception p1

    .line 718
    :try_start_3
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 720
    :cond_9
    :goto_5
    sput-boolean p4, Lcom/flyersoft/components/cloud/Sync;->updateBookListWorking:Z

    return-void

    :catchall_1
    move-exception p1

    sput-boolean p4, Lcom/flyersoft/components/cloud/Sync;->updateBookListWorking:Z

    .line 721
    throw p1
.end method
