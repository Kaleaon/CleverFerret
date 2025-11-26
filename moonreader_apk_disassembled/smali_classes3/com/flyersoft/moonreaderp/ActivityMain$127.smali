.class Lcom/flyersoft/moonreaderp/ActivityMain$127;
.super Ljava/lang/Thread;
.source "ActivityMain.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->shelfImportScanForBooksThread(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$path:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/lang/String;)V
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

    .line 11613
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$127;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$127;->val$path:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 15

    .line 11617
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$127;->val$path:Ljava/lang/String;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$127;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v5, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->fileHandler:Landroid/os/Handler;

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v6, 0x0

    invoke-static/range {v0 .. v8}, Lcom/flyersoft/tools/T;->getFolderFileList(Ljava/lang/String;ZZZZLandroid/os/Handler;IILcom/flyersoft/tools/T$FileResultOK;)Ljava/util/ArrayList;

    move-result-object v0

    .line 11619
    sget-boolean v1, Lcom/flyersoft/tools/T;->scanCanceled:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 11620
    sput-boolean v2, Lcom/flyersoft/tools/T;->scanCanceled:Z

    return-void

    .line 11625
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 11626
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 11627
    invoke-static {v3}, Lcom/flyersoft/tools/T;->getFileExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 11628
    sget v5, Lcom/flyersoft/tools/A;->importFileSize:I

    if-lez v5, :cond_2

    .line 11629
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->length()J

    move-result-wide v5

    sget v7, Lcom/flyersoft/tools/A;->importFileSize:I

    mul-int/lit16 v7, v7, 0x400

    int-to-long v7, v7

    cmp-long v9, v5, v7

    if-gtz v9, :cond_2

    goto :goto_0

    .line 11631
    :cond_2
    sget-boolean v5, Lcom/flyersoft/tools/A;->importEpub:Z

    if-eqz v5, :cond_3

    const-string v5, ".epub"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_c

    const-string v5, ".epub3"

    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_c

    :cond_3
    sget-boolean v5, Lcom/flyersoft/tools/A;->importFb2:Z

    if-eqz v5, :cond_4

    const-string v5, ".fb2"

    .line 11632
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_c

    const-string v5, ".fb2.zip"

    invoke-virtual {v3, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_c

    :cond_4
    sget-boolean v5, Lcom/flyersoft/tools/A;->importMobi:Z

    if-eqz v5, :cond_5

    .line 11633
    invoke-static {v4}, Lcom/flyersoft/tools/A;->isMobiExt(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_c

    :cond_5
    sget-boolean v5, Lcom/flyersoft/tools/A;->importCbz:Z

    if-eqz v5, :cond_6

    const-string v5, ".cbz"

    .line 11634
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_c

    :cond_6
    sget-boolean v5, Lcom/flyersoft/tools/A;->importCbz:Z

    if-eqz v5, :cond_7

    const-string v5, ".cbr"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_c

    :cond_7
    sget-boolean v5, Lcom/flyersoft/tools/A;->importChmUmd:Z

    if-eqz v5, :cond_8

    const-string v5, ".chm"

    .line 11635
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_c

    const-string v5, ".umd"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_c

    :cond_8
    sget-boolean v5, Lcom/flyersoft/tools/A;->importDocRtf:Z

    if-eqz v5, :cond_9

    const-string v5, ".docx"

    .line 11636
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_c

    const-string v5, ".odt"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_c

    const-string v5, ".rtf"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_c

    :cond_9
    sget-boolean v5, Lcom/flyersoft/tools/A;->importPdf:Z

    if-eqz v5, :cond_a

    const-string v5, ".pdf"

    .line 11637
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_c

    const-string v5, ".djvu"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_c

    :cond_a
    sget-boolean v5, Lcom/flyersoft/tools/A;->importHtml:Z

    if-eqz v5, :cond_b

    const-string v5, ".mht"

    .line 11638
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_c

    const-string v5, ".mhtml"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_c

    const-string v5, ".htm"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_c

    const-string v5, ".html"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_c

    :cond_b
    sget-boolean v5, Lcom/flyersoft/tools/A;->importTxt:Z

    if-eqz v5, :cond_1

    const-string v5, ".txt"

    .line 11639
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_c

    const-string v5, ".md"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 11640
    :cond_c
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 11646
    :cond_d
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$127;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->import_items:Ljava/util/ArrayList;

    .line 11647
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    const-wide/16 v5, 0x1

    invoke-static {v5, v6}, Lcom/flyersoft/tools/T;->day(J)J

    move-result-wide v7

    div-long/2addr v3, v7

    .line 11648
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$127;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->getScanFailedBooks()Ljava/util/ArrayList;

    move-result-object v0

    .line 11649
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    const/4 v8, 0x1

    if-eqz v7, :cond_11

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 11650
    new-instance v9, Ljava/io/File;

    invoke-direct {v9, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 11651
    new-instance v10, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;

    iget-object v11, p0, Lcom/flyersoft/moonreaderp/ActivityMain$127;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {v10, v11}, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 11652
    iput-object v7, v10, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->filename:Ljava/lang/String;

    .line 11653
    invoke-static {v7}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    iput-object v11, v10, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->onlyFilename:Ljava/lang/String;

    .line 11654
    invoke-static {v7}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    iput-object v11, v10, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->path:Ljava/lang/String;

    .line 11655
    invoke-virtual {v9}, Ljava/io/File;->lastModified()J

    move-result-wide v11

    iput-wide v11, v10, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->fileTime:J

    .line 11656
    iget-wide v11, v10, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->fileTime:J

    invoke-static {v5, v6}, Lcom/flyersoft/tools/T;->day(J)J

    move-result-wide v13

    div-long/2addr v11, v13

    sub-long v11, v3, v11

    iput-wide v11, v10, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->day:J

    .line 11657
    invoke-virtual {v9}, Ljava/io/File;->length()J

    move-result-wide v11

    iput-wide v11, v10, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->fileSize:J

    .line 11658
    invoke-static {v7}, Lcom/flyersoft/tools/BookDb;->getBook(Ljava/lang/String;)Lcom/flyersoft/tools/BookDb$BookInfo;

    move-result-object v9

    if-eqz v9, :cond_e

    const/4 v9, 0x1

    goto :goto_2

    :cond_e
    const/4 v9, 0x0

    :goto_2
    iput-boolean v9, v10, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->imported:Z

    .line 11659
    iget-boolean v9, v10, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->imported:Z

    xor-int/2addr v8, v9

    iput-boolean v8, v10, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->selected:Z

    .line 11661
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v7

    iput-boolean v7, v10, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->broken:Z

    .line 11662
    iget-boolean v7, v10, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->broken:Z

    if-eqz v7, :cond_f

    .line 11663
    iput-boolean v2, v10, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->selected:Z

    .line 11665
    :cond_f
    iget-wide v7, v10, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->day:J

    const-wide/16 v11, 0x0

    cmp-long v9, v7, v11

    if-nez v9, :cond_10

    .line 11666
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-static {}, Lcom/flyersoft/tools/A;->getLocale()Ljava/util/Locale;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/flyersoft/tools/T;->dateToStr(Ljava/lang/Long;Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v7

    iget-wide v8, v10, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->fileTime:J

    .line 11667
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-static {}, Lcom/flyersoft/tools/A;->getLocale()Ljava/util/Locale;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/flyersoft/tools/T;->dateToStr(Ljava/lang/Long;Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v8

    .line 11666
    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_10

    .line 11668
    iput-wide v5, v10, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->day:J

    .line 11671
    :cond_10
    iget-object v7, p0, Lcom/flyersoft/moonreaderp/ActivityMain$127;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v7, v7, Lcom/flyersoft/moonreaderp/ActivityMain;->import_items:Ljava/util/ArrayList;

    invoke-virtual {v7, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 11673
    :cond_11
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$127;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->import_items:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, v8}, Lcom/flyersoft/moonreaderp/ActivityMain;->sortImportItems(Ljava/util/ArrayList;I)V

    .line 11674
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$127;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileHandler:Landroid/os/Handler;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void
.end method
