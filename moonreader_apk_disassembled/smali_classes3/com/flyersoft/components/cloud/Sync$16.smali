.class Lcom/flyersoft/components/cloud/Sync$16;
.super Ljava/lang/Object;
.source "Sync.java"

# interfaces
.implements Lcom/flyersoft/components/cloud/Cloud$AfterDownload;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Sync;->downloadBooksSortFiles(Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$books:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 777
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Sync$16;->val$books:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterDownload(Ljava/io/ByteArrayOutputStream;Ljava/lang/String;J)V
    .locals 1

    .line 780
    const-string p2, "/sorts"

    if-eqz p1, :cond_5

    .line 782
    :try_start_0
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object p4, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, "/books.sorts"

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    .line 783
    invoke-static {p3}, Lcom/flyersoft/tools/T;->deleteFile(Ljava/lang/String;)Z

    .line 785
    invoke-virtual {p1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1

    invoke-static {p1, p3}, Lcom/flyersoft/tools/T;->bytes2File([BLjava/lang/String;)Z

    .line 786
    invoke-static {}, Lcom/flyersoft/tools/A;->deleteAllShelfSortFiles()V

    .line 787
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object p4, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p3, p1}, Lcom/flyersoft/tools/compress/MyZip_Java;->unZipFiles(Ljava/lang/String;Ljava/lang/String;)V

    .line 789
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object p3, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFolderFileList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p1

    .line 790
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    const/4 p3, 0x1

    if-eqz p2, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    .line 791
    const-string p4, "shelf_top_books"

    invoke-virtual {p2, p4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p4

    if-eqz p4, :cond_1

    .line 792
    invoke-static {}, Lcom/flyersoft/tools/A;->shelfTopBookRecordFile()Ljava/lang/String;

    move-result-object p4

    invoke-static {p2, p4, p3}, Lcom/flyersoft/tools/T;->moveFile(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 794
    :cond_1
    const-string p3, "shelf.options"

    invoke-virtual {p2, p3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p3

    if-eqz p3, :cond_0

    .line 795
    invoke-static {p2}, Lcom/flyersoft/components/cloud/Sync;->getShelfOptionsFromFile(Ljava/lang/String;)V

    .line 796
    invoke-static {p2}, Lcom/flyersoft/tools/T;->deleteFile(Ljava/lang/String;)Z

    goto :goto_0

    .line 800
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Sync$16;->val$books:Ljava/util/ArrayList;

    invoke-static {p1}, Lcom/flyersoft/components/cloud/Sync;->-$$Nest$smresetSortsAndTopBooks(Ljava/util/ArrayList;)V

    .line 801
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->clearAllBooks()V

    .line 802
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p1

    if-nez p1, :cond_3

    .line 803
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->handler:Landroid/os/Handler;

    const/16 p2, 0x400

    invoke-virtual {p1, p2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 805
    :cond_3
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Sync$16;->val$books:Ljava/util/ArrayList;

    sget p2, Lcom/flyersoft/tools/A;->syncType:I

    const/4 p4, 0x6

    const/4 v0, 0x0

    if-ne p2, p4, :cond_4

    const/4 p2, 0x1

    goto :goto_1

    :cond_4
    const/4 p2, 0x0

    :goto_1
    invoke-static {p1, p2, v0, p3}, Lcom/flyersoft/components/cloud/Sync;->-$$Nest$smdownloadShelfBookCovers(Ljava/util/ArrayList;ZZZ)V

    .line 806
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Sync$16;->val$books:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    .line 808
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_5
    return-void
.end method
