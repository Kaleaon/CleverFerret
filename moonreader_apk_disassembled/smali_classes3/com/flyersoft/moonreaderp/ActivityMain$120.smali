.class Lcom/flyersoft/moonreaderp/ActivityMain$120;
.super Ljava/lang/Thread;
.source "ActivityMain.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->autoImportNewBooksThread(ZI)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 10053
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$120;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method

.method private auto_import_task(Ljava/lang/String;)V
    .locals 14

    .line 10070
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    const/4 v2, 0x0

    const/4 v3, 0x1

    .line 10073
    :try_start_0
    invoke-static {p1, v3, v3, v2, v2}, Lcom/flyersoft/tools/T;->getFolderFileList(Ljava/lang/String;ZZZZ)Ljava/util/ArrayList;

    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v4

    .line 10075
    invoke-static {v4}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    const/4 v4, 0x0

    :goto_0
    if-nez v4, :cond_0

    return-void

    .line 10079
    :cond_0
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "*scanFolderForNewBooks(1), total: "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ", time: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 10080
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v7

    sub-long/2addr v7, v0

    invoke-virtual {v5, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v7, "   folder: "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-array v5, v3, [Ljava/lang/Object;

    aput-object p1, v5, v2

    .line 10079
    invoke-static {v5}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 10081
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_10

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 10082
    sget-object v5, Lcom/flyersoft/tools/A;->download_cache_path:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 10083
    sget-object v5, Lcom/flyersoft/tools/A;->cloud_cache_path:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2

    goto :goto_1

    .line 10085
    :cond_2
    invoke-static {v4}, Lcom/flyersoft/tools/T;->getFileExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 10086
    sget-boolean v7, Lcom/flyersoft/tools/A;->importEpub:Z

    const-string v8, ".pdf"

    if-eqz v7, :cond_3

    const-string v7, ".epub"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_c

    const-string v7, ".epub3"

    invoke-virtual {v5, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_c

    :cond_3
    sget-boolean v7, Lcom/flyersoft/tools/A;->importFb2:Z

    if-eqz v7, :cond_4

    const-string v7, ".fb2"

    .line 10087
    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_c

    const-string v7, ".fb2.zip"

    invoke-virtual {v4, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_c

    :cond_4
    sget-boolean v7, Lcom/flyersoft/tools/A;->importMobi:Z

    if-eqz v7, :cond_5

    .line 10088
    invoke-static {v5}, Lcom/flyersoft/tools/A;->isMobiExt(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_c

    :cond_5
    sget-boolean v7, Lcom/flyersoft/tools/A;->importCbz:Z

    if-eqz v7, :cond_6

    const-string v7, ".cbz"

    .line 10089
    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_c

    :cond_6
    sget-boolean v7, Lcom/flyersoft/tools/A;->importCbz:Z

    if-eqz v7, :cond_7

    const-string v7, ".cbr"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_c

    :cond_7
    sget-boolean v7, Lcom/flyersoft/tools/A;->importChmUmd:Z

    if-eqz v7, :cond_8

    const-string v7, ".chm"

    .line 10090
    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_c

    const-string v7, ".umd"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_c

    :cond_8
    sget-boolean v7, Lcom/flyersoft/tools/A;->importDocRtf:Z

    if-eqz v7, :cond_9

    const-string v7, ".docx"

    .line 10091
    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_c

    const-string v7, ".odt"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_c

    const-string v7, ".rtf"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_c

    :cond_9
    sget-boolean v7, Lcom/flyersoft/tools/A;->importPdf:Z

    if-eqz v7, :cond_a

    .line 10092
    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_c

    const-string v7, ".djvu"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_c

    :cond_a
    sget-boolean v7, Lcom/flyersoft/tools/A;->importHtml:Z

    if-eqz v7, :cond_b

    const-string v7, ".mht"

    .line 10093
    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_c

    const-string v7, ".mhtml"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_c

    const-string v7, ".htm"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_c

    const-string v7, ".html"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_c

    :cond_b
    sget-boolean v7, Lcom/flyersoft/tools/A;->importTxt:Z

    if-eqz v7, :cond_1

    const-string v7, ".txt"

    .line 10094
    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_c

    const-string v7, ".md"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 10095
    :cond_c
    new-instance v7, Ljava/io/File;

    invoke-direct {v7, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 10096
    sget v9, Lcom/flyersoft/tools/A;->importFileSize:I

    if-lez v9, :cond_d

    .line 10097
    new-instance v9, Ljava/io/File;

    invoke-direct {v9, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9}, Ljava/io/File;->length()J

    move-result-wide v9

    sget v11, Lcom/flyersoft/tools/A;->importFileSize:I

    mul-int/lit16 v11, v11, 0x400

    int-to-long v11, v11

    cmp-long v13, v9, v11

    if-gtz v13, :cond_d

    goto/16 :goto_1

    .line 10099
    :cond_d
    sget-boolean v9, Lcom/flyersoft/tools/A;->importIgnoreSame:Z

    if-eqz v9, :cond_e

    invoke-static {v4}, Lcom/flyersoft/tools/BookDb;->hasSameBookByFilename(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_e

    goto/16 :goto_1

    .line 10101
    :cond_e
    iget-object v9, p0, Lcom/flyersoft/moonreaderp/ActivityMain$120;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v9, v9, Lcom/flyersoft/moonreaderp/ActivityMain;->newBookList:Ljava/util/ArrayList;

    invoke-virtual {v9, v4}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v9

    const/4 v10, -0x1

    if-ne v9, v10, :cond_1

    invoke-virtual {v7}, Ljava/io/File;->lastModified()J

    move-result-wide v9

    sget-wide v11, Lcom/flyersoft/tools/A;->auto_import_time:J

    cmp-long v7, v9, v11

    if-lez v7, :cond_1

    .line 10102
    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_f

    invoke-static {v4}, Lcom/flyersoft/tools/BookDb;->getBook(Ljava/lang/String;)Lcom/flyersoft/tools/BookDb$BookInfo;

    move-result-object v5

    if-eqz v5, :cond_f

    goto/16 :goto_1

    .line 10104
    :cond_f
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$120;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/ActivityMain;->newBookList:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 10105
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v7, "add:"

    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-array v5, v3, [Ljava/lang/Object;

    aput-object v4, v5, v2

    invoke-static {v5}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    goto/16 :goto_1

    .line 10109
    :cond_10
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v4, "*scanFolderForNewBooks(2), new: "

    invoke-direct {p1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$120;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain;->newBookList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 10110
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    sub-long/2addr v4, v0

    invoke-virtual {p1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-array v0, v3, [Ljava/lang/Object;

    aput-object p1, v0, v2

    .line 10109
    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 10055
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$120;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->newBookList:Ljava/util/ArrayList;

    .line 10057
    :try_start_0
    invoke-static {}, Lcom/flyersoft/tools/A;->getAutoImportFolders()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 10058
    invoke-direct {p0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain$120;->auto_import_task(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 10060
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 10062
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$120;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->newBookList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 10063
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$120;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->handler:Landroid/os/Handler;

    const/16 v1, 0x386

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 10064
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sput-wide v0, Lcom/flyersoft/tools/A;->auto_import_time:J

    .line 10065
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$120;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->importingNewBook:Z

    return-void
.end method
