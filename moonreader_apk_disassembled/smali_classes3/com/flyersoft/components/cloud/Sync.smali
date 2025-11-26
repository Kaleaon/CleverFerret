.class public Lcom/flyersoft/components/cloud/Sync;
.super Ljava/lang/Object;
.source "Sync.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/components/cloud/Sync$ShelfOptions;,
        Lcom/flyersoft/components/cloud/Sync$CloudBook;
    }
.end annotation


# static fields
.field public static bookDatabaseUpdated:I

.field public static cloudBookList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static coverDownloadList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static coverDownloadList2:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static coverUploadList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static coverUploadList2:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static downloadedShelfList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static lastSyncShelfTime:J

.field public static lastSyncViaMenuTime:J

.field private static lastUploadedText:Ljava/lang/String;

.field private static lastUploadedTime:J

.field public static pdfCloudIsNewerList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static pdfFileUpdated:Z

.field public static syncWindowOpened:Z

.field public static updateBookListWorking:Z

.field private static updateShelfDlg:Landroidx/appcompat/app/AlertDialog;

.field public static uploadBookFilesPaused:Z

.field public static uploadBookFilesWorking:Z

.field public static uploadShelfBookList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static bridge synthetic -$$Nest$sfgetcoverDownloadList2()Ljava/util/ArrayList;
    .locals 1

    sget-object v0, Lcom/flyersoft/components/cloud/Sync;->coverDownloadList2:Ljava/util/ArrayList;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetupdateShelfDlg()Landroidx/appcompat/app/AlertDialog;
    .locals 1

    sget-object v0, Lcom/flyersoft/components/cloud/Sync;->updateShelfDlg:Landroidx/appcompat/app/AlertDialog;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfputcoverDownloadList(Ljava/util/ArrayList;)V
    .locals 0

    sput-object p0, Lcom/flyersoft/components/cloud/Sync;->coverDownloadList:Ljava/util/ArrayList;

    return-void
.end method

.method static bridge synthetic -$$Nest$sfputcoverDownloadList2(Ljava/util/ArrayList;)V
    .locals 0

    sput-object p0, Lcom/flyersoft/components/cloud/Sync;->coverDownloadList2:Ljava/util/ArrayList;

    return-void
.end method

.method static bridge synthetic -$$Nest$sfputcoverUploadList(Ljava/util/ArrayList;)V
    .locals 0

    sput-object p0, Lcom/flyersoft/components/cloud/Sync;->coverUploadList:Ljava/util/ArrayList;

    return-void
.end method

.method static bridge synthetic -$$Nest$sfputcoverUploadList2(Ljava/util/ArrayList;)V
    .locals 0

    sput-object p0, Lcom/flyersoft/components/cloud/Sync;->coverUploadList2:Ljava/util/ArrayList;

    return-void
.end method

.method static bridge synthetic -$$Nest$sfputupdateShelfDlg(Landroidx/appcompat/app/AlertDialog;)V
    .locals 0

    sput-object p0, Lcom/flyersoft/components/cloud/Sync;->updateShelfDlg:Landroidx/appcompat/app/AlertDialog;

    return-void
.end method

.method static bridge synthetic -$$Nest$smaddCloudBooksToShelf(ZLjava/util/ArrayList;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/flyersoft/components/cloud/Sync;->addCloudBooksToShelf(ZLjava/util/ArrayList;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$smaddCloudFilesToShelfFinal(Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/flyersoft/components/cloud/Sync;->addCloudFilesToShelfFinal(Ljava/util/ArrayList;Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smcloudFileIsNewer(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)Z
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/flyersoft/components/cloud/Sync;->cloudFileIsNewer(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)Z

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$smdealDownloadedCloudNote(Ljava/io/ByteArrayOutputStream;)V
    .locals 0

    invoke-static {p0}, Lcom/flyersoft/components/cloud/Sync;->dealDownloadedCloudNote(Ljava/io/ByteArrayOutputStream;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smdealDownloadedCloudPosition(Ljava/io/ByteArrayOutputStream;Ljava/lang/String;ZZ)V
    .locals 0

    invoke-static {p0, p1, p2, p3}, Lcom/flyersoft/components/cloud/Sync;->dealDownloadedCloudPosition(Ljava/io/ByteArrayOutputStream;Ljava/lang/String;ZZ)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smdealUploadedCloudPosition(Ljava/lang/String;Z)V
    .locals 0

    invoke-static {p0, p1}, Lcom/flyersoft/components/cloud/Sync;->dealUploadedCloudPosition(Ljava/lang/String;Z)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smdoCloneShelf(Ljava/util/List;)V
    .locals 0

    invoke-static {p0}, Lcom/flyersoft/components/cloud/Sync;->doCloneShelf(Ljava/util/List;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smdownloadPdfCloudIsNewer()V
    .locals 0

    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->downloadPdfCloudIsNewer()V

    return-void
.end method

.method static bridge synthetic -$$Nest$smdownloadShelfBookCovers(Ljava/util/ArrayList;ZZZ)V
    .locals 0

    invoke-static {p0, p1, p2, p3}, Lcom/flyersoft/components/cloud/Sync;->downloadShelfBookCovers(Ljava/util/ArrayList;ZZZ)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smdownloadShelfBookCoversFinal(Z)V
    .locals 0

    invoke-static {p0}, Lcom/flyersoft/components/cloud/Sync;->downloadShelfBookCoversFinal(Z)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smisJustUploadedFile(Ljava/lang/String;)Z
    .locals 0

    invoke-static {p0}, Lcom/flyersoft/components/cloud/Sync;->isJustUploadedFile(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$smisJustUploadedPdf(Ljava/lang/String;)Z
    .locals 0

    invoke-static {p0}, Lcom/flyersoft/components/cloud/Sync;->isJustUploadedPdf(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$smlocalFileIsNewer(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)Z
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/flyersoft/components/cloud/Sync;->localFileIsNewer(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)Z

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$smrecordUploadedFile(Ljava/lang/String;)V
    .locals 0

    invoke-static {p0}, Lcom/flyersoft/components/cloud/Sync;->recordUploadedFile(Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smrefreshShelfCovers(Z)V
    .locals 0

    invoke-static {p0}, Lcom/flyersoft/components/cloud/Sync;->refreshShelfCovers(Z)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smresetSortsAndTopBooks(Ljava/util/ArrayList;)V
    .locals 0

    invoke-static {p0}, Lcom/flyersoft/components/cloud/Sync;->resetSortsAndTopBooks(Ljava/util/ArrayList;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smupdateBookListViaCloudFinal(Z)V
    .locals 0

    invoke-static {p0}, Lcom/flyersoft/components/cloud/Sync;->updateBookListViaCloudFinal(Z)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smupdateMyShelfBooks(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/List;Z)V
    .locals 0

    invoke-static {p0, p1, p2, p3}, Lcom/flyersoft/components/cloud/Sync;->updateMyShelfBooks(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/List;Z)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smupdateMyShelfBooksFinal(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/List;Z)V
    .locals 0

    invoke-static {p0, p1, p2, p3}, Lcom/flyersoft/components/cloud/Sync;->updateMyShelfBooksFinal(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/List;Z)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smuploadShelfBookCovers(Ljava/util/ArrayList;ZZ)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/flyersoft/components/cloud/Sync;->uploadShelfBookCovers(Ljava/util/ArrayList;ZZ)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smuploadShelfBookCoversFinal()V
    .locals 0

    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->uploadShelfBookCoversFinal()V

    return-void
.end method

.method static bridge synthetic -$$Nest$smuploadShelfBooksFinal(Ljava/lang/String;)V
    .locals 0

    invoke-static {p0}, Lcom/flyersoft/components/cloud/Sync;->uploadShelfBooksFinal(Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smverifyDownloadBookCovers(Ljava/util/HashMap;ZZ)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/flyersoft/components/cloud/Sync;->verifyDownloadBookCovers(Ljava/util/HashMap;ZZ)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smverifyUploadBookCovers(Ljava/util/HashMap;Z)V
    .locals 0

    invoke-static {p0, p1}, Lcom/flyersoft/components/cloud/Sync;->verifyUploadBookCovers(Ljava/util/HashMap;Z)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 372
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/flyersoft/components/cloud/Sync;->cloudBookList:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static addCloudBooksToShelf(ZLjava/util/ArrayList;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 21
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$BookInfo;",
            ">;",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/components/cloud/Sync$CloudBook;",
            ">;)",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$BookInfo;",
            ">;"
        }
    .end annotation

    move-object/from16 v0, p1

    .line 998
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 999
    invoke-static/range {p2 .. p2}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto/16 :goto_9

    .line 1002
    :cond_0
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->beginTransition()V

    .line 1004
    invoke-virtual/range {p2 .. p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_6

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/components/cloud/Sync$CloudBook;

    .line 1005
    iget-object v5, v3, Lcom/flyersoft/components/cloud/Sync$CloudBook;->downloadUrl:Ljava/lang/String;

    .line 1006
    invoke-static {v5}, Lcom/flyersoft/components/cloud/Cloud;->getCloudType(Ljava/lang/String;)I

    move-result v6

    if-nez v6, :cond_1

    .line 1007
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget v6, Lcom/flyersoft/tools/A;->syncType:I

    invoke-static {v6}, Lcom/flyersoft/components/cloud/Cloud;->getCloudTag(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v6, Lcom/flyersoft/tools/A;->syncType:I

    invoke-static {v6}, Lcom/flyersoft/components/cloud/Cloud;->getWebBookPath(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, v3, Lcom/flyersoft/components/cloud/Sync$CloudBook;->filename:Ljava/lang/String;

    invoke-static {v6}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    :cond_1
    move-object/from16 v16, v5

    .line 1008
    iget-object v5, v3, Lcom/flyersoft/components/cloud/Sync$CloudBook;->filename:Ljava/lang/String;

    .line 1009
    invoke-static {v5}, Lcom/flyersoft/tools/A;->getOpenFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1010
    invoke-static {v6}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    move-object v8, v6

    goto :goto_1

    :cond_2
    move-object v8, v5

    .line 1012
    :goto_1
    new-instance v6, Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v7, v3, Lcom/flyersoft/components/cloud/Sync$CloudBook;->bookName:Ljava/lang/String;

    iget-object v9, v3, Lcom/flyersoft/components/cloud/Sync$CloudBook;->author:Ljava/lang/String;

    iget-object v10, v3, Lcom/flyersoft/components/cloud/Sync$CloudBook;->description:Ljava/lang/String;

    iget-object v11, v3, Lcom/flyersoft/components/cloud/Sync$CloudBook;->category:Ljava/lang/String;

    iget-object v14, v3, Lcom/flyersoft/components/cloud/Sync$CloudBook;->addTime:Ljava/lang/String;

    iget-object v15, v3, Lcom/flyersoft/components/cloud/Sync$CloudBook;->favorite:Ljava/lang/String;

    iget-object v5, v3, Lcom/flyersoft/components/cloud/Sync$CloudBook;->rate:Ljava/lang/String;

    .line 1016
    const-string v12, ""

    if-eqz p0, :cond_3

    iget-object v13, v3, Lcom/flyersoft/components/cloud/Sync$CloudBook;->groupBooks:Ljava/util/ArrayList;

    invoke-static {v13}, Lcom/flyersoft/tools/T;->stringList2Text(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v13

    move-object/from16 v18, v13

    goto :goto_2

    :cond_3
    move-object/from16 v18, v12

    :goto_2
    if-eqz p0, :cond_4

    .line 1017
    iget-object v12, v3, Lcom/flyersoft/components/cloud/Sync$CloudBook;->groupName:Ljava/lang/String;

    :cond_4
    move-object/from16 v19, v12

    const-string v20, ""

    const-string v12, ""

    const-string v13, ""

    move-object/from16 v17, v5

    invoke-direct/range {v6 .. v20}, Lcom/flyersoft/tools/BookDb$BookInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1019
    invoke-static {v6, v4}, Lcom/flyersoft/tools/BookDb;->insertBook(Lcom/flyersoft/tools/BookDb$BookInfo;Z)J

    if-eqz v0, :cond_5

    .line 1021
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1022
    :cond_5
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 1025
    :cond_6
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_7
    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const/4 v5, 0x1

    if-eqz v3, :cond_d

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 1026
    invoke-virtual {v3}, Lcom/flyersoft/tools/BookDb$BookInfo;->isGroup()Z

    move-result v6

    if-eqz v6, :cond_7

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 1028
    :goto_4
    iget-object v8, v3, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-ge v6, v8, :cond_9

    .line 1029
    iget-object v8, v3, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    invoke-virtual {v8, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 1030
    invoke-static {v8}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_8

    .line 1031
    invoke-static {v8}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v1, v8}, Lcom/flyersoft/components/cloud/Sync;->getSamePureFilenameBook(Ljava/util/ArrayList;Ljava/lang/String;)Lcom/flyersoft/tools/BookDb$BookInfo;

    move-result-object v8

    if-eqz v8, :cond_8

    .line 1033
    iget-object v7, v3, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    iget-object v8, v8, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-virtual {v7, v6, v8}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    const/4 v7, 0x1

    :cond_8
    add-int/lit8 v6, v6, 0x1

    goto :goto_4

    .line 1038
    :cond_9
    iget-object v6, v3, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    sub-int/2addr v6, v5

    :goto_5
    if-ltz v6, :cond_c

    const/4 v8, 0x0

    :goto_6
    if-ge v8, v6, :cond_b

    .line 1040
    iget-object v9, v3, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    iget-object v10, v3, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    invoke-virtual {v10, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_a

    .line 1041
    iget-object v7, v3, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    const/4 v7, 0x1

    goto :goto_7

    :cond_a
    add-int/lit8 v8, v8, 0x1

    goto :goto_6

    :cond_b
    :goto_7
    add-int/lit8 v6, v6, -0x1

    goto :goto_5

    :cond_c
    if-eqz v7, :cond_7

    .line 1048
    invoke-static {v3, v4}, Lcom/flyersoft/tools/BookDb;->insertBook(Lcom/flyersoft/tools/BookDb$BookInfo;Z)J

    goto :goto_3

    .line 1053
    :cond_d
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->endTransition()V

    .line 1055
    sget-object v2, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateShelf()V

    .line 1056
    sget-object v2, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateFavRvAdapter()V

    .line 1057
    sget-object v2, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v2, v4}, Lcom/flyersoft/tools/A;->updateWidget(Landroid/content/Context;Z)V

    if-eqz v0, :cond_f

    .line 1060
    sget v2, Lcom/flyersoft/tools/A;->syncType:I

    const/4 v3, 0x6

    if-ne v2, v3, :cond_e

    goto :goto_8

    :cond_e
    const/4 v5, 0x0

    :goto_8
    invoke-static {v0, v5, v4, v4}, Lcom/flyersoft/components/cloud/Sync;->downloadShelfBookCovers(Ljava/util/ArrayList;ZZZ)V

    :cond_f
    :goto_9
    return-object v1
.end method

.method public static addCloudFilesToShelf(Ljava/util/ArrayList;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1378
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-ltz v0, :cond_1

    .line 1379
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/A;->isReadableFile(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1380
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 1381
    :cond_1
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_2

    return-void

    .line 1384
    :cond_2
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    .line 1386
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$layout;->add_to_favorite:I

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 1387
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->favEt:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    .line 1388
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->favCb:I

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/CheckBox;

    .line 1389
    sget-boolean v5, Lcom/flyersoft/tools/A;->fileImportWithFav:Z

    invoke-virtual {v4, v5}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 1390
    new-instance v5, Lcom/flyersoft/components/cloud/Sync$27;

    invoke-direct {v5, v2}, Lcom/flyersoft/components/cloud/Sync$27;-><init>(Landroid/widget/EditText;)V

    invoke-virtual {v4, v5}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 1396
    const-string v5, ""

    invoke-virtual {v2, v5}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 1397
    new-instance v5, Lcom/flyersoft/components/cloud/Sync$28;

    invoke-direct {v5, v2, v4}, Lcom/flyersoft/components/cloud/Sync$28;-><init>(Landroid/widget/EditText;Landroid/widget/CheckBox;)V

    invoke-virtual {v2, v5}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 1408
    sget v5, Lcom/flyersoft/moonreaderp/R$id;->favIb:I

    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    new-instance v6, Lcom/flyersoft/components/cloud/Sync$29;

    invoke-direct {v6, v0, v2, v4}, Lcom/flyersoft/components/cloud/Sync$29;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/widget/EditText;Landroid/widget/CheckBox;)V

    invoke-virtual {v5, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1414
    new-instance v5, Lcom/flyersoft/components/MyDialog;

    invoke-direct {v5, v0}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v6, Lcom/flyersoft/moonreaderp/R$string;->save_to_shelf:I

    invoke-virtual {v5, v6}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v5

    invoke-virtual {v5, v1}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v1

    const v5, 0x104000a

    .line 1415
    invoke-virtual {v0, v5}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v5

    new-instance v6, Lcom/flyersoft/components/cloud/Sync$30;

    invoke-direct {v6, v2, v4, p0, v0}, Lcom/flyersoft/components/cloud/Sync$30;-><init>(Landroid/widget/EditText;Landroid/widget/CheckBox;Ljava/util/ArrayList;Lcom/flyersoft/moonreaderp/ActivityMain;)V

    invoke-virtual {v1, v5, v6}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    const/high16 v0, 0x1040000

    .line 1428
    invoke-virtual {p0, v0, v3}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    invoke-virtual {p0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method

.method private static addCloudFilesToShelfFinal(Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 22
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1432
    sget v0, Lcom/flyersoft/tools/A;->syncType:I

    invoke-static {v0}, Lcom/flyersoft/components/cloud/Cloud;->getCloudTag(I)Ljava/lang/String;

    move-result-object v0

    .line 1433
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1434
    sget v2, Lcom/flyersoft/tools/A;->files_from:I

    const/4 v3, 0x6

    const/4 v4, 0x0

    if-ne v2, v3, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 1436
    :goto_0
    invoke-virtual/range {p0 .. p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 1437
    invoke-static {v5}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v2, :cond_2

    .line 1439
    invoke-static {v6}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    :cond_2
    move-object v8, v6

    .line 1440
    invoke-static {v8}, Lcom/flyersoft/tools/BookDb;->getBook(Ljava/lang/String;)Lcom/flyersoft/tools/BookDb$BookInfo;

    move-result-object v6

    if-nez v6, :cond_1

    .line 1442
    invoke-virtual {v5, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    goto :goto_2

    :cond_3
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    :goto_2
    move-object/from16 v17, v5

    .line 1443
    new-instance v7, Lcom/flyersoft/tools/BookDb$BookInfo;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, ""

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1451
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    invoke-virtual {v5, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    const-string v20, ""

    const-string v21, ""

    const-string v10, ""

    const-string v11, ""

    const-string v12, ""

    const-string v13, ""

    const-string v14, ""

    const-string v18, ""

    const-string v19, ""

    move-object v9, v8

    move-object/from16 v16, p1

    invoke-direct/range {v7 .. v21}, Lcom/flyersoft/tools/BookDb$BookInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1458
    invoke-static {v7, v4}, Lcom/flyersoft/tools/BookDb;->insertBook(Lcom/flyersoft/tools/BookDb$BookInfo;Z)J

    .line 1459
    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 1463
    :cond_4
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_8

    .line 1464
    invoke-static {v1, v2, v4, v4}, Lcom/flyersoft/components/cloud/Sync;->downloadShelfBookCovers(Ljava/util/ArrayList;ZZZ)V

    .line 1465
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    .line 1466
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateShelf()V

    .line 1467
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    new-array v3, v3, [Ljava/lang/String;

    .line 1468
    :goto_3
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v4, v5, :cond_6

    .line 1469
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v5, v5, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v5}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1470
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    add-int/lit8 v7, v4, 0x1

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v8, ". "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v2, :cond_5

    invoke-static {v5}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    :cond_5
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    move v4, v7

    goto :goto_3

    .line 1472
    :cond_6
    new-instance v2, Landroid/widget/ArrayAdapter;

    .line 1473
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v4

    if-eqz v4, :cond_7

    sget v4, Lcom/flyersoft/moonreaderp/R$layout;->simple_item_night:I

    goto :goto_4

    :cond_7
    sget v4, Lcom/flyersoft/moonreaderp/R$layout;->simple_item:I

    :goto_4
    invoke-direct {v2, v0, v4, v3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 1474
    invoke-static {v0}, Lcom/flyersoft/tools/A;->alertDialog(Landroid/content/Context;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->book_is_imported:I

    .line 1475
    invoke-virtual {v0, v5}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object v1

    const/4 v3, 0x0

    .line 1476
    invoke-virtual {v1, v2, v3}, Landroidx/appcompat/app/AlertDialog$Builder;->setAdapter(Landroid/widget/ListAdapter;Landroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x104000a

    .line 1477
    invoke-virtual {v1, v2, v3}, Landroidx/appcompat/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object v1

    .line 1478
    invoke-virtual {v1}, Landroidx/appcompat/app/AlertDialog$Builder;->show()Landroidx/appcompat/app/AlertDialog;

    const/16 v1, 0xc8

    .line 1479
    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->checkIfSyncShelfBooksToCloud(I)V

    :cond_8
    return-void
.end method

.method public static addToDownloadedShelfList(Ljava/lang/String;)V
    .locals 2

    .line 1335
    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->getDownloadedShelfList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 1336
    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->getDownloadedShelfList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1337
    :cond_0
    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->saveDownloadedShelfList()V

    return-void
.end method

.method public static addToDownloadedShelfList(Ljava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/components/cloud/Sync$CloudBook;",
            ">;)V"
        }
    .end annotation

    .line 1328
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/components/cloud/Sync$CloudBook;

    .line 1329
    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->getDownloadedShelfList()Ljava/util/ArrayList;

    move-result-object v1

    iget-object v2, v0, Lcom/flyersoft/components/cloud/Sync$CloudBook;->filename:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    .line 1330
    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->getDownloadedShelfList()Ljava/util/ArrayList;

    move-result-object v1

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Sync$CloudBook;->filename:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1331
    :cond_1
    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->saveDownloadedShelfList()V

    return-void
.end method

.method public static allowSyncShelf()Z
    .locals 1

    const/4 v0, 0x1

    .line 262
    invoke-static {v0, v0}, Lcom/flyersoft/components/cloud/Sync;->allowSyncShelf(ZZ)Z

    move-result v0

    return v0
.end method

.method public static allowSyncShelf(ZZ)Z
    .locals 1

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    .line 266
    sget-object p0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p0

    if-eqz p0, :cond_0

    return v0

    .line 268
    :cond_0
    sget p0, Lcom/flyersoft/tools/A;->syncType:I

    if-nez p0, :cond_1

    return v0

    .line 270
    :cond_1
    sget-boolean p0, Lcom/flyersoft/tools/A;->syncShelf:Z

    if-nez p0, :cond_2

    return v0

    :cond_2
    if-eqz p1, :cond_3

    .line 272
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/flyersoft/tools/T;->isNetworkConnecting(Landroid/content/Context;)Z

    move-result p0

    if-nez p0, :cond_3

    return v0

    .line 274
    :cond_3
    invoke-static {}, Lcom/flyersoft/components/cloud/Cloud;->instance()Lcom/flyersoft/components/cloud/Cloud;

    move-result-object p0

    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/Cloud;->isLogin()Z

    move-result p0

    if-nez p0, :cond_4

    return v0

    :cond_4
    const/4 p0, 0x1

    return p0
.end method

.method public static clearDownloadUploadRecord()V
    .locals 3

    .line 1308
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 1309
    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->uploadRecordXmlName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 1310
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 1311
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 1312
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1313
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->uploadRecordXmlName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ".xml"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->deleteFile(Ljava/lang/String;)Z

    .line 1314
    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->getDownloadedShelfList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 1315
    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->saveDownloadedShelfList()V

    return-void
.end method

.method private static cloudFileIsNewer(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/flyersoft/tools/T$FileItem;",
            ">;)Z"
        }
    .end annotation

    .line 443
    invoke-virtual {p2, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/tools/T$FileItem;

    const/4 p2, 0x0

    if-nez p0, :cond_0

    return p2

    .line 446
    :cond_0
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_1

    return v1

    .line 448
    :cond_1
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 449
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result p1

    if-nez p1, :cond_2

    return v1

    .line 451
    :cond_2
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long p1, v2, v4

    if-nez p1, :cond_3

    return v1

    .line 453
    :cond_3
    iget-wide v2, p0, Lcom/flyersoft/tools/T$FileItem;->size:J

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v4

    cmp-long p1, v2, v4

    if-nez p1, :cond_4

    return p2

    .line 455
    :cond_4
    sget p1, Lcom/flyersoft/tools/A;->syncType:I

    const/16 v2, 0x8

    if-ne p1, v2, :cond_5

    return p2

    .line 457
    :cond_5
    iget-wide p0, p0, Lcom/flyersoft/tools/T$FileItem;->date:J

    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v2

    cmp-long v0, p0, v2

    if-lez v0, :cond_6

    return v1

    :cond_6
    return p2
.end method

.method public static createCloudBookList(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$BookInfo;",
            ">;)",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/components/cloud/Sync$CloudBook;",
            ">;"
        }
    .end annotation

    .line 1352
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1353
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 1354
    new-instance v2, Lcom/flyersoft/components/cloud/Sync$CloudBook;

    invoke-direct {v2}, Lcom/flyersoft/components/cloud/Sync$CloudBook;-><init>()V

    .line 1355
    iget-object v3, v1, Lcom/flyersoft/tools/BookDb$BookInfo;->book:Ljava/lang/String;

    iput-object v3, v2, Lcom/flyersoft/components/cloud/Sync$CloudBook;->bookName:Ljava/lang/String;

    .line 1356
    iget-object v3, v1, Lcom/flyersoft/tools/BookDb$BookInfo;->author:Ljava/lang/String;

    iput-object v3, v2, Lcom/flyersoft/components/cloud/Sync$CloudBook;->author:Ljava/lang/String;

    .line 1357
    iget-object v3, v1, Lcom/flyersoft/tools/BookDb$BookInfo;->description:Ljava/lang/String;

    iput-object v3, v2, Lcom/flyersoft/components/cloud/Sync$CloudBook;->description:Ljava/lang/String;

    .line 1358
    iget-object v3, v1, Lcom/flyersoft/tools/BookDb$BookInfo;->category:Ljava/lang/String;

    iput-object v3, v2, Lcom/flyersoft/components/cloud/Sync$CloudBook;->category:Ljava/lang/String;

    .line 1359
    iget-object v3, v1, Lcom/flyersoft/tools/BookDb$BookInfo;->favorite:Ljava/lang/String;

    iput-object v3, v2, Lcom/flyersoft/components/cloud/Sync$CloudBook;->favorite:Ljava/lang/String;

    .line 1360
    iget-object v3, v1, Lcom/flyersoft/tools/BookDb$BookInfo;->rate:Ljava/lang/String;

    iput-object v3, v2, Lcom/flyersoft/components/cloud/Sync$CloudBook;->rate:Ljava/lang/String;

    .line 1361
    iget-object v3, v1, Lcom/flyersoft/tools/BookDb$BookInfo;->groupName:Ljava/lang/String;

    iput-object v3, v2, Lcom/flyersoft/components/cloud/Sync$CloudBook;->groupName:Ljava/lang/String;

    .line 1362
    iget-object v3, v1, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    iput-object v3, v2, Lcom/flyersoft/components/cloud/Sync$CloudBook;->groupBooks:Ljava/util/ArrayList;

    .line 1363
    iget-object v3, v1, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    iget-object v4, v1, Lcom/flyersoft/tools/BookDb$BookInfo;->downloadUrl:Ljava/lang/String;

    invoke-static {v4}, Lcom/flyersoft/components/cloud/Cloud;->getCloudType(Ljava/lang/String;)I

    move-result v4

    invoke-static {v3, v4}, Lcom/flyersoft/components/cloud/Sync;->fixWebDavFilename(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/flyersoft/components/cloud/Sync$CloudBook;->filename:Ljava/lang/String;

    .line 1365
    iget-object v3, v1, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    iget-object v3, v1, Lcom/flyersoft/tools/BookDb$BookInfo;->downloadUrl:Ljava/lang/String;

    invoke-static {v3}, Lcom/flyersoft/components/cloud/Cloud;->getCloudType(Ljava/lang/String;)I

    move-result v3

    if-nez v3, :cond_0

    .line 1366
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget v4, Lcom/flyersoft/tools/A;->syncType:I

    invoke-static {v4}, Lcom/flyersoft/components/cloud/Cloud;->getCloudTag(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v4, Lcom/flyersoft/tools/A;->syncType:I

    invoke-static {v4}, Lcom/flyersoft/components/cloud/Cloud;->getWebBookPath(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, v2, Lcom/flyersoft/components/cloud/Sync$CloudBook;->filename:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/flyersoft/components/cloud/Sync$CloudBook;->downloadUrl:Ljava/lang/String;

    goto :goto_1

    .line 1368
    :cond_0
    iget-object v3, v1, Lcom/flyersoft/tools/BookDb$BookInfo;->downloadUrl:Ljava/lang/String;

    iput-object v3, v2, Lcom/flyersoft/components/cloud/Sync$CloudBook;->downloadUrl:Ljava/lang/String;

    .line 1370
    :goto_1
    iget-object v1, v1, Lcom/flyersoft/tools/BookDb$BookInfo;->addTime:Ljava/lang/String;

    iput-object v1, v2, Lcom/flyersoft/components/cloud/Sync$CloudBook;->addTime:Ljava/lang/String;

    .line 1371
    sget-object v1, Lcom/flyersoft/tools/A;->deviceRandomID:Ljava/lang/String;

    iput-object v1, v2, Lcom/flyersoft/components/cloud/Sync$CloudBook;->deviceId:Ljava/lang/String;

    .line 1372
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :cond_1
    return-object v0
.end method

.method private static dealDownloadedCloudNote(Ljava/io/ByteArrayOutputStream;)V
    .locals 1

    if-eqz p0, :cond_0

    .line 199
    invoke-virtual {p0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    .line 200
    array-length v0, p0

    if-lez v0, :cond_0

    .line 201
    invoke-static {p0}, Lcom/flyersoft/tools/compress/MyZip_Java;->decompress([B)Ljava/lang/String;

    move-result-object p0

    .line 202
    invoke-static {p0}, Lcom/flyersoft/components/cloud/Sync;->extractSyncNotes(Ljava/lang/String;)V

    .line 203
    sget-object p0, Lcom/flyersoft/tools/A;->contentLay:Lcom/flyersoft/views/ContentLay;

    if-eqz p0, :cond_0

    sget-object p0, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    if-eqz p0, :cond_0

    sget-object p0, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    if-eqz p0, :cond_0

    .line 204
    sget-object p0, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->postInvalidate()V

    .line 205
    sget-object p0, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MRTextView;->postInvalidate()V

    .line 206
    sget-object p0, Lcom/flyersoft/tools/A;->contentLay:Lcom/flyersoft/views/ContentLay;

    invoke-virtual {p0}, Lcom/flyersoft/views/ContentLay;->postInvalidate()V

    :cond_0
    return-void
.end method

.method private static dealDownloadedCloudPosition(Ljava/io/ByteArrayOutputStream;Ljava/lang/String;ZZ)V
    .locals 4

    .line 136
    invoke-static {p0}, Lcom/flyersoft/tools/T;->ByteArrayOutputStream2String(Ljava/io/ByteArrayOutputStream;)Ljava/lang/String;

    move-result-object v0

    .line 137
    const-string v1, "]"

    const-string v2, " ["

    if-eqz v0, :cond_0

    .line 138
    invoke-static {v0, p2}, Lcom/flyersoft/components/cloud/Sync;->notifyNewCloudPosition(Ljava/lang/String;Z)V

    if-eqz p3, :cond_0

    .line 140
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->sync_from_cloud:I

    invoke-static {v3}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const v3, 0x104000a

    .line 141
    invoke-static {v3}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 140
    invoke-static {v0}, Lcom/flyersoft/tools/T;->showToastTextBackground(Ljava/lang/CharSequence;)V

    :cond_0
    const/4 v0, 0x1

    if-eqz p1, :cond_1

    if-eqz p3, :cond_1

    .line 145
    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->showToastTextBackground(Ljava/lang/CharSequence;I)V

    :cond_1
    if-nez p0, :cond_2

    if-nez p1, :cond_2

    .line 149
    sput-boolean v0, Lcom/flyersoft/tools/A;->hasNewNoteForUpload:Z

    if-eqz p2, :cond_2

    if-eqz p3, :cond_2

    .line 151
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    sget p1, Lcom/flyersoft/moonreaderp/R$string;->sync_from_cloud:I

    invoke-static {p1}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget p1, Lcom/flyersoft/moonreaderp/R$string;->not_exists:I

    invoke-static {p1}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/flyersoft/tools/T;->showToastTextBackground(Ljava/lang/CharSequence;)V

    .line 153
    :cond_2
    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->downloadCloudNoteFile()V

    return-void
.end method

.method private static dealUploadedCloudPosition(Ljava/lang/String;Z)V
    .locals 0

    if-nez p0, :cond_1

    if-eqz p1, :cond_0

    .line 91
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    sget p1, Lcom/flyersoft/moonreaderp/R$string;->sync_to_cloud:I

    invoke-static {p1}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " ["

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const p1, 0x104000a

    .line 92
    invoke-static {p1}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "]"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 91
    invoke-static {p0}, Lcom/flyersoft/tools/T;->showToastTextBackground(Ljava/lang/CharSequence;)V

    .line 93
    :cond_0
    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->uploadCloudNoteFile()V

    return-void

    .line 95
    :cond_1
    invoke-static {}, Lcom/flyersoft/moonreaderp/ActivityTxt;->sync_finish_message()V

    if-eqz p1, :cond_2

    const/4 p1, 0x1

    .line 97
    invoke-static {p0, p1}, Lcom/flyersoft/tools/T;->showToastTextBackground(Ljava/lang/CharSequence;I)V

    :cond_2
    return-void
.end method

.method public static doAfterDownloadBookFileFromCloud(Lcom/flyersoft/tools/BookDb$BookInfo;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1229
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1230
    invoke-static {p1}, Lcom/flyersoft/tools/A;->getBookCoverFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result p2

    .line 1231
    iget-object v0, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->author:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->description:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->category:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1232
    iget-object v0, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->favorite:Ljava/lang/String;

    invoke-static {v0, p1, v1}, Lcom/flyersoft/tools/BookDb;->createBookInfoFromFile(Ljava/lang/String;Ljava/lang/String;Z)Lcom/flyersoft/tools/BookDb$BookInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1234
    iget-object v2, v0, Lcom/flyersoft/tools/BookDb$BookInfo;->book:Ljava/lang/String;

    iput-object v2, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->book:Ljava/lang/String;

    .line 1235
    iget-object v2, v0, Lcom/flyersoft/tools/BookDb$BookInfo;->author:Ljava/lang/String;

    iput-object v2, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->author:Ljava/lang/String;

    .line 1236
    iget-object v2, v0, Lcom/flyersoft/tools/BookDb$BookInfo;->description:Ljava/lang/String;

    iput-object v2, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->description:Ljava/lang/String;

    .line 1237
    iget-object v0, v0, Lcom/flyersoft/tools/BookDb$BookInfo;->category:Ljava/lang/String;

    iput-object v0, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->category:Ljava/lang/String;

    .line 1238
    invoke-static {p0, v1}, Lcom/flyersoft/tools/BookDb;->insertBook(Lcom/flyersoft/tools/BookDb$BookInfo;Z)J

    .line 1242
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1243
    iget-object v0, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v0, p1}, Lcom/flyersoft/tools/BookDb;->changeBookFileInGroup(Ljava/lang/String;Ljava/lang/String;)V

    .line 1244
    iget-object v0, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v0, p1}, Lcom/flyersoft/tools/BookDb;->changeBookFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 1245
    iget-object v0, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v0, p1}, Lcom/flyersoft/tools/A;->changeShelfTopBook(Ljava/lang/String;Ljava/lang/String;)V

    .line 1246
    iget-object v0, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v0, p1}, Lcom/flyersoft/tools/A;->changeShelfSortBook(Ljava/lang/String;Ljava/lang/String;)V

    .line 1248
    :cond_1
    iput-object p1, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    .line 1250
    sget-object p0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p0

    if-nez p0, :cond_2

    .line 1251
    sget-object p0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->openFile(Ljava/lang/String;)V

    :cond_2
    if-nez p2, :cond_4

    .line 1252
    invoke-static {p1}, Lcom/flyersoft/tools/A;->getBookCoverFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_4

    .line 1253
    invoke-static {v1}, Lcom/flyersoft/components/cloud/Sync;->refreshShelfCovers(Z)V

    return-void

    .line 1255
    :cond_3
    sget-object p0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p0

    if-nez p0, :cond_4

    .line 1256
    sget-object p0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->error:I

    .line 1257
    invoke-static {v0}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ": "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->invalid_file:I

    invoke-static {v0}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->deleteEndQuotes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1256
    invoke-static {p0, p1, p2}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    :cond_4
    return-void
.end method

.method private static doCloneShelf(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/flyersoft/components/cloud/Sync$CloudBook;",
            ">;)V"
        }
    .end annotation

    .line 1065
    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->resetSyncDownloadUploadState()V

    .line 1066
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "books"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, v2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1067
    invoke-static {}, Lcom/flyersoft/tools/A;->shelfTopBookRecordFile()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->deleteFile(Ljava/lang/String;)Z

    .line 1068
    sput-object v2, Lcom/flyersoft/tools/A;->shelfTopBooks:Ljava/util/ArrayList;

    const/4 v0, 0x1

    .line 1069
    check-cast p0, Ljava/util/ArrayList;

    invoke-static {v0, v2, p0}, Lcom/flyersoft/components/cloud/Sync;->addCloudBooksToShelf(ZLjava/util/ArrayList;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object p0

    .line 1070
    invoke-static {p0}, Lcom/flyersoft/components/cloud/Sync;->downloadBooksSortFiles(Ljava/util/ArrayList;)V

    return-void
.end method

.method public static doSyncShelf(Z)V
    .locals 6

    .line 339
    sget-boolean v0, Lcom/flyersoft/tools/A;->syncShelfViaMenuOnly:Z

    if-eqz v0, :cond_0

    goto :goto_0

    .line 341
    :cond_0
    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->allowSyncShelf()Z

    move-result v0

    if-nez v0, :cond_1

    :goto_0
    return-void

    .line 343
    :cond_1
    sget v0, Lcom/flyersoft/tools/A;->syncType:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v1, 0x2

    new-array v2, v1, [Ljava/lang/Object;

    const-string v3, "--------doSyncShelf---------"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const/4 v3, 0x1

    aput-object v0, v2, v3

    invoke-static {v2}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    if-eqz p0, :cond_2

    .line 345
    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->resetSyncDownloadUploadState()V

    .line 346
    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sput-wide v4, Lcom/flyersoft/components/cloud/Sync;->lastSyncShelfTime:J

    .line 347
    invoke-static {v3, v3}, Lcom/flyersoft/components/cloud/Sync;->updateBookListViaCloud(ZZ)V

    .line 349
    new-instance p0, Lcom/flyersoft/components/cloud/Sync$6;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/flyersoft/components/cloud/Sync$6;-><init>(Landroid/os/Looper;)V

    const-wide/16 v4, 0xc8

    .line 359
    invoke-virtual {p0, v3, v4, v5}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    const-wide/16 v2, 0x190

    .line 360
    invoke-virtual {p0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    return-void
.end method

.method public static downloadBooksSortFiles(Ljava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$BookInfo;",
            ">;)V"
        }
    .end annotation

    .line 777
    invoke-static {}, Lcom/flyersoft/components/cloud/Cloud;->instance()Lcom/flyersoft/components/cloud/Cloud;

    move-result-object v0

    sget v1, Lcom/flyersoft/tools/A;->syncType:I

    invoke-static {v1}, Lcom/flyersoft/components/cloud/Cloud;->getShelfBooksSortFile(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/flyersoft/components/cloud/Sync$16;

    invoke-direct {v2, p0}, Lcom/flyersoft/components/cloud/Sync$16;-><init>(Ljava/util/ArrayList;)V

    const/4 p0, 0x1

    invoke-virtual {v0, v1, v2, p0}, Lcom/flyersoft/components/cloud/Cloud;->downloadToOutputStream(Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterDownload;Z)V

    return-void
.end method

.method private static downloadCloudNoteFile()V
    .locals 4

    .line 186
    invoke-static {}, Lcom/flyersoft/components/cloud/Cloud;->instance()Lcom/flyersoft/components/cloud/Cloud;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flyersoft/components/cloud/Cloud;->isLogin()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 187
    sget v0, Lcom/flyersoft/tools/A;->syncType:I

    invoke-static {v0}, Lcom/flyersoft/components/cloud/Cloud;->getNoteFile(I)Ljava/lang/String;

    move-result-object v0

    .line 188
    invoke-static {}, Lcom/flyersoft/components/cloud/Cloud;->instance()Lcom/flyersoft/components/cloud/Cloud;

    move-result-object v1

    new-instance v2, Lcom/flyersoft/components/cloud/Sync$3;

    invoke-direct {v2}, Lcom/flyersoft/components/cloud/Sync$3;-><init>()V

    const/4 v3, 0x0

    invoke-virtual {v1, v0, v2, v3}, Lcom/flyersoft/components/cloud/Cloud;->downloadToOutputStream(Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterDownload;Z)V

    :cond_0
    return-void
.end method

.method public static downloadCloudPositionFile(ZZ)V
    .locals 3

    .line 119
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNetworkConnecting(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    if-eqz p1, :cond_1

    .line 122
    sget v0, Lcom/flyersoft/moonreaderp/R$string;->sync_from_cloud:I

    invoke-static {v0}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->showToastTextBackground(Ljava/lang/CharSequence;)V

    .line 124
    :cond_1
    invoke-static {}, Lcom/flyersoft/components/cloud/Cloud;->instance()Lcom/flyersoft/components/cloud/Cloud;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flyersoft/components/cloud/Cloud;->isLogin()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 125
    sget v0, Lcom/flyersoft/tools/A;->syncType:I

    invoke-static {v0}, Lcom/flyersoft/components/cloud/Cloud;->getPositionFile(I)Ljava/lang/String;

    move-result-object v0

    .line 126
    invoke-static {}, Lcom/flyersoft/components/cloud/Cloud;->instance()Lcom/flyersoft/components/cloud/Cloud;

    move-result-object v1

    new-instance v2, Lcom/flyersoft/components/cloud/Sync$2;

    invoke-direct {v2, p0, p1}, Lcom/flyersoft/components/cloud/Sync$2;-><init>(ZZ)V

    const/4 p0, 0x0

    invoke-virtual {v1, v0, v2, p0}, Lcom/flyersoft/components/cloud/Cloud;->downloadToOutputStream(Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterDownload;Z)V

    :cond_2
    :goto_0
    return-void
.end method

.method private static downloadPdfCloudIsNewer()V
    .locals 5

    .line 514
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 516
    :cond_0
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->handler:Landroid/os/Handler;

    .line 517
    sget-object v1, Lcom/flyersoft/components/cloud/Sync;->pdfCloudIsNewerList:Ljava/util/ArrayList;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/16 v1, 0x3fd

    .line 518
    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void

    .line 522
    :cond_1
    sget-object v1, Lcom/flyersoft/components/cloud/Sync;->pdfCloudIsNewerList:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 523
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "["

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v4, Lcom/flyersoft/components/cloud/Sync;->pdfCloudIsNewerList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, "] "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 524
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->download:I

    .line 525
    invoke-static {v3}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ": "

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x3fe

    .line 524
    invoke-virtual {v0, v4, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 527
    invoke-static {}, Lcom/flyersoft/components/cloud/Cloud;->instance()Lcom/flyersoft/components/cloud/Cloud;

    move-result-object v0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget v4, Lcom/flyersoft/tools/A;->syncType:I

    .line 528
    invoke-static {v4}, Lcom/flyersoft/components/cloud/Cloud;->getWebBookPath(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lcom/flyersoft/components/cloud/Sync$9;

    invoke-direct {v4, v1}, Lcom/flyersoft/components/cloud/Sync$9;-><init>(Ljava/lang/String;)V

    .line 527
    invoke-virtual {v0, v3, v4, v2}, Lcom/flyersoft/components/cloud/Cloud;->downloadToOutputStream(Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterDownload;Z)V

    return-void
.end method

.method private static downloadRecordFileName()Ljava/lang/String;
    .locals 2

    .line 1296
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/sync_book_list"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static declared-synchronized downloadShelfBookCovers(Ljava/util/ArrayList;ZZZ)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$BookInfo;",
            ">;ZZZ)V"
        }
    .end annotation

    const-class v0, Lcom/flyersoft/components/cloud/Sync;

    monitor-enter v0

    .line 1075
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    sput-object v1, Lcom/flyersoft/components/cloud/Sync;->coverDownloadList:Ljava/util/ArrayList;

    .line 1076
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    sput-object v1, Lcom/flyersoft/components/cloud/Sync;->coverDownloadList2:Ljava/util/ArrayList;

    .line 1077
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 1078
    iget-object v1, v1, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    if-eqz p1, :cond_0

    .line 1080
    invoke-static {v1}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1081
    :cond_0
    invoke-static {v1}, Lcom/flyersoft/tools/A;->getBookCoverFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1082
    sget-object v3, Lcom/flyersoft/components/cloud/Sync;->coverDownloadList:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1083
    sget-object v2, Lcom/flyersoft/components/cloud/Sync;->coverDownloadList2:Ljava/util/ArrayList;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "_2.png"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1086
    :cond_1
    sget-object p0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p0, :cond_2

    .line 1087
    monitor-exit v0

    return-void

    .line 1089
    :cond_2
    :try_start_1
    sget-object p0, Lcom/flyersoft/components/cloud/Sync;->coverDownloadList2:Ljava/util/ArrayList;

    invoke-static {p0}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result p0

    if-nez p0, :cond_3

    .line 1090
    sget-object p0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    new-instance p1, Lcom/flyersoft/components/cloud/Sync$23;

    invoke-direct {p1, p2, p3}, Lcom/flyersoft/components/cloud/Sync$23;-><init>(ZZ)V

    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1107
    :cond_3
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p0
.end method

.method private static downloadShelfBookCoversFinal(Z)V
    .locals 6

    .line 1126
    sget-object v0, Lcom/flyersoft/components/cloud/Sync;->coverDownloadList2:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 1127
    sget-object v0, Lcom/flyersoft/components/cloud/Sync;->coverDownloadList:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1128
    sget-object v3, Lcom/flyersoft/components/cloud/Sync;->coverDownloadList2:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 1129
    invoke-static {}, Lcom/flyersoft/components/cloud/Cloud;->instance()Lcom/flyersoft/components/cloud/Cloud;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget v5, Lcom/flyersoft/tools/A;->syncType:I

    invoke-static {v5}, Lcom/flyersoft/components/cloud/Cloud;->getPrefix(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "/Cover/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Lcom/flyersoft/components/cloud/Sync$24;

    invoke-direct {v5, v2, v0, p0}, Lcom/flyersoft/components/cloud/Sync$24;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {v3, v4, v5, v1}, Lcom/flyersoft/components/cloud/Cloud;->downloadToOutputStream(Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterDownload;Z)V

    return-void

    :cond_0
    if-eqz p0, :cond_1

    .line 1173
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getAllBooks()Ljava/util/ArrayList;

    move-result-object p0

    .line 1174
    invoke-static {p0, v2, v1}, Lcom/flyersoft/components/cloud/Sync;->uploadShelfBookCovers(Ljava/util/ArrayList;ZZ)V

    :cond_1
    return-void
.end method

.method private static extractSyncNotes(Ljava/lang/String;)V
    .locals 3

    .line 213
    invoke-static {}, Lcom/flyersoft/tools/A;->getFileType()I

    move-result v0

    const/4 v1, 0x7

    const/4 v2, 0x1

    if-ne v0, v1, :cond_0

    sget-object v0, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, ".pdf"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 214
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    if-eqz v0, :cond_1

    .line 215
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v0, p0, v2}, Lcom/flyersoft/books/PDFReader;->pdfCreateNotesFromText(Ljava/lang/String;Z)Z

    return-void

    .line 216
    :cond_0
    sget-object v0, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-static {v0, p0}, Lcom/flyersoft/tools/BookDb;->importNotesFromText(Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    if-ne p0, v2, :cond_1

    .line 217
    invoke-static {v2}, Lcom/flyersoft/tools/A;->getBookmarks(Z)Ljava/util/ArrayList;

    .line 218
    invoke-static {v2}, Lcom/flyersoft/tools/A;->checkNotesHighlights(Z)V

    :cond_1
    return-void
.end method

.method public static fixWebDavFilename(Ljava/lang/String;I)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x6

    if-ne p1, v0, :cond_0

    .line 254
    const-string p1, "/"

    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_0

    const-string p1, "%"

    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 255
    invoke-static {p0}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :cond_0
    return-object p0
.end method

.method public static fixWebDavPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 232
    sget-object v0, Lcom/flyersoft/tools/A;->WEBDAV_TAG:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 233
    sget-object v0, Lcom/flyersoft/tools/A;->WEBDAV_TAG:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 236
    invoke-static {}, Lcom/flyersoft/components/cloud/webdav/WebDavHelp;->getWebDavUrl()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 237
    invoke-static {}, Lcom/flyersoft/components/cloud/webdav/WebDavHelp;->getWebDavUrl()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 238
    :cond_0
    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 239
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 240
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/flyersoft/tools/A;->WEBDAV_TAG:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :cond_2
    return-object p0
.end method

.method public static fixWebDavThumbFile(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 245
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "%"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 246
    invoke-static {p1}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/A;->getShelfCoverFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 247
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p1

    :cond_0
    return-object p0
.end method

.method public static getDownloadedShelfList()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1321
    sget-object v0, Lcom/flyersoft/components/cloud/Sync;->downloadedShelfList:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 1322
    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->downloadRecordFileName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFileText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->text2StringList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/cloud/Sync;->downloadedShelfList:Ljava/util/ArrayList;

    .line 1324
    :cond_0
    sget-object v0, Lcom/flyersoft/components/cloud/Sync;->downloadedShelfList:Ljava/util/ArrayList;

    return-object v0
.end method

.method public static getSamePureFilenameBook(Ljava/util/ArrayList;Ljava/lang/String;)Lcom/flyersoft/tools/BookDb$BookInfo;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$BookInfo;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lcom/flyersoft/tools/BookDb$BookInfo;"
        }
    .end annotation

    .line 1185
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 1186
    iget-object v1, v0, Lcom/flyersoft/tools/BookDb$BookInfo;->pureFilename:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getShelfOptionsFromFile(Ljava/lang/String;)V
    .locals 1

    .line 832
    invoke-static {p0}, Lcom/flyersoft/tools/T;->getFileText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 833
    invoke-static {p0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 834
    const-class v0, Lcom/flyersoft/components/cloud/Sync$ShelfOptions;

    invoke-static {p0, v0}, Lcom/flyersoft/tools/T;->fromJsonText(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/components/cloud/Sync$ShelfOptions;

    if-eqz p0, :cond_0

    .line 838
    iget p0, p0, Lcom/flyersoft/components/cloud/Sync$ShelfOptions;->shelf_sort_by:I

    sput p0, Lcom/flyersoft/tools/A;->shelf_sort_by:I

    :cond_0
    return-void
.end method

.method public static hasDownloadUploadRecords()Z
    .locals 6

    .line 1300
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->uploadRecordXmlName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ".xml"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFileSize(Ljava/lang/String;)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    const/4 v4, 0x1

    cmp-long v5, v0, v2

    if-lez v5, :cond_0

    return v4

    .line 1302
    :cond_0
    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->getDownloadedShelfList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_1

    return v4

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private static isJustUploadedFile(Ljava/lang/String;)Z
    .locals 6

    .line 1279
    sget v0, Lcom/flyersoft/tools/A;->syncType:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_0

    const/16 v0, 0x64

    goto :goto_0

    :cond_0
    const/4 v0, 0x7

    .line 1280
    :goto_0
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 1281
    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->uploadRecordXmlName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-wide/16 v4, 0x0

    .line 1282
    invoke-interface {v1, p0, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v1

    cmp-long p0, v1, v4

    if-lez p0, :cond_1

    .line 1283
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v1

    int-to-long v0, v0

    invoke-static {v0, v1}, Lcom/flyersoft/tools/T;->day(J)J

    move-result-wide v0

    cmp-long p0, v4, v0

    if-gez p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    return v3
.end method

.method private static isJustUploadedPdf(Ljava/lang/String;)Z
    .locals 5

    .line 1272
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 1273
    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->uploadRecordXmlName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "_2"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-wide/16 v3, 0x0

    .line 1274
    invoke-interface {v0, v1, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    .line 1275
    invoke-static {p0}, Lcom/flyersoft/tools/T;->getFileSize(Ljava/lang/String;)J

    move-result-wide v3

    cmp-long p0, v3, v0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    return v2
.end method

.method private static localFileIsNewer(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/flyersoft/tools/T$FileItem;",
            ">;)Z"
        }
    .end annotation

    .line 461
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 463
    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 464
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result p1

    if-nez p1, :cond_1

    return v1

    .line 466
    :cond_1
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long p1, v2, v4

    if-nez p1, :cond_2

    return v1

    .line 468
    :cond_2
    invoke-virtual {p2, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/tools/T$FileItem;

    const/4 p1, 0x1

    if-eqz p0, :cond_5

    .line 470
    iget-wide v2, p0, Lcom/flyersoft/tools/T$FileItem;->size:J

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v4

    cmp-long p2, v2, v4

    if-nez p2, :cond_3

    return v1

    .line 472
    :cond_3
    iget-wide v2, p0, Lcom/flyersoft/tools/T$FileItem;->date:J

    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v4

    cmp-long p0, v2, v4

    if-gez p0, :cond_4

    return p1

    :cond_4
    return v1

    :cond_5
    return p1
.end method

.method private static notifyNewCloudPosition(Ljava/lang/String;Z)V
    .locals 5

    .line 157
    const-string v0, "*"

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    goto/16 :goto_1

    :cond_0
    const/4 v2, 0x0

    .line 160
    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    add-int/lit8 v0, v0, 0x1

    .line 161
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 162
    const-string v0, "|"

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-ne v0, v1, :cond_1

    const/4 v0, -0x1

    goto :goto_0

    .line 168
    :cond_1
    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    add-int/lit8 v0, v0, 0x1

    .line 169
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    move v0, p0

    move-object p0, v4

    :goto_0
    if-nez p1, :cond_2

    .line 172
    sget-object p1, Lcom/flyersoft/tools/A;->deviceRandomID:Ljava/lang/String;

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_4

    .line 173
    :cond_2
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v3, "positions10"

    invoke-virtual {p1, v3, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    .line 174
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 175
    sget-object v2, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v2, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    if-eq v0, v1, :cond_3

    .line 177
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1, p0, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 178
    :cond_3
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 180
    sget-object p0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p0

    if-nez p0, :cond_4

    .line 181
    sget-object p0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt;->handler:Landroid/os/Handler;

    const/16 p1, 0x321

    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    :cond_4
    :goto_1
    return-void
.end method

.method public static openShelfBookFromCloud(Lcom/flyersoft/tools/BookDb$BookInfo;)Z
    .locals 9

    .line 1192
    iget-object v0, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->downloadUrl:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/components/cloud/Cloud;->getCloudType(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_1

    .line 1194
    sget-object v0, Lcom/flyersoft/components/cloud/Sync;->cloudBookList:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    const/4 v1, -0x1

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    .line 1195
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget v1, Lcom/flyersoft/tools/A;->syncType:I

    invoke-static {v1}, Lcom/flyersoft/components/cloud/Cloud;->getCloudTag(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v1, Lcom/flyersoft/tools/A;->syncType:I

    invoke-static {v1}, Lcom/flyersoft/components/cloud/Cloud;->getWebBookPath(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->downloadUrl:Ljava/lang/String;

    .line 1196
    invoke-static {p0, v2}, Lcom/flyersoft/tools/BookDb;->insertBook(Lcom/flyersoft/tools/BookDb$BookInfo;Z)J

    .line 1197
    sget v0, Lcom/flyersoft/tools/A;->syncType:I

    goto :goto_0

    :cond_0
    return v2

    .line 1204
    :cond_1
    :goto_0
    invoke-static {v0}, Lcom/flyersoft/components/cloud/Cloud;->instance(I)Lcom/flyersoft/components/cloud/Cloud;

    move-result-object v1

    invoke-virtual {v1}, Lcom/flyersoft/components/cloud/Cloud;->isLogin()Z

    move-result v1

    const/4 v2, 0x1

    if-nez v1, :cond_2

    .line 1205
    new-instance p0, Lcom/flyersoft/components/MyDialog;

    sget-object v1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0, v1}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    .line 1206
    invoke-static {v0}, Lcom/flyersoft/components/cloud/Cloud;->getCloudName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->unlink_hint:I

    .line 1207
    invoke-virtual {p0, v1}, Lcom/flyersoft/components/MyDialog;->setMessage(I)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    new-instance v1, Lcom/flyersoft/components/cloud/Sync$25;

    invoke-direct {v1, v0}, Lcom/flyersoft/components/cloud/Sync$25;-><init>(I)V

    const v0, 0x104000a

    .line 1208
    invoke-virtual {p0, v0, v1}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    const/high16 v0, 0x1040000

    const/4 v1, 0x0

    .line 1213
    invoke-virtual {p0, v0, v1}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    invoke-virtual {p0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return v2

    .line 1217
    :cond_2
    invoke-static {v0}, Lcom/flyersoft/components/cloud/Cloud;->instance(I)Lcom/flyersoft/components/cloud/Cloud;

    move-result-object v3

    sget-object v4, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->downloadUrl:Ljava/lang/String;

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/components/cloud/Cloud;->FileList([Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v5

    sget-object v6, Lcom/flyersoft/tools/A;->cloud_cache_path:Ljava/lang/String;

    new-instance v8, Lcom/flyersoft/components/cloud/Sync$26;

    invoke-direct {v8, p0}, Lcom/flyersoft/components/cloud/Sync$26;-><init>(Lcom/flyersoft/tools/BookDb$BookInfo;)V

    const/4 v7, 0x1

    invoke-virtual/range {v3 .. v8}, Lcom/flyersoft/components/cloud/Cloud;->download(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;ZLcom/flyersoft/tools/T$OnResult;)V

    return v2
.end method

.method private static recordUploadedFile(Ljava/lang/String;)V
    .locals 4

    .line 1262
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 1263
    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->uploadRecordXmlName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 1264
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 1265
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-interface {v0, p0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 1266
    invoke-static {p0}, Lcom/flyersoft/tools/T;->getFileExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, ".pdf"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1267
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "_2"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0}, Lcom/flyersoft/tools/T;->getFileSize(Ljava/lang/String;)J

    move-result-wide v2

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 1268
    :cond_0
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method private static refreshShelfCovers(Z)V
    .locals 2

    .line 1484
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    .line 1485
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1486
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfLv:Lcom/flyersoft/views/BookShelfView;

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->myNotifyDataSetChanged(Landroidx/recyclerview/widget/RecyclerView;)V

    if-eqz p0, :cond_0

    .line 1488
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateFavRvAdapter()V

    :cond_0
    return-void
.end method

.method private static resetSortsAndTopBooks(Ljava/util/ArrayList;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$BookInfo;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 844
    sput-object v0, Lcom/flyersoft/tools/A;->shelfTopBooks:Ljava/util/ArrayList;

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 846
    :goto_0
    invoke-static {}, Lcom/flyersoft/tools/A;->getShelfTopBooks()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x1

    if-ge v1, v3, :cond_1

    .line 847
    invoke-static {}, Lcom/flyersoft/tools/A;->getShelfTopBooks()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 848
    invoke-static {v3}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 849
    invoke-static {p0, v3}, Lcom/flyersoft/components/cloud/Sync;->getSamePureFilenameBook(Ljava/util/ArrayList;Ljava/lang/String;)Lcom/flyersoft/tools/BookDb$BookInfo;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 851
    invoke-static {}, Lcom/flyersoft/tools/A;->getShelfTopBooks()Ljava/util/ArrayList;

    move-result-object v2

    iget-object v3, v3, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-virtual {v2, v1, v3}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    const/4 v2, 0x1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    if-eqz v2, :cond_2

    .line 856
    invoke-static {}, Lcom/flyersoft/tools/A;->saveShelfTopBooks()V

    .line 858
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/sorts"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/tools/T;->getFolderFileList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    .line 859
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_3
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 861
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 862
    invoke-static {v2}, Lcom/flyersoft/tools/T;->getFileText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/flyersoft/tools/T;->text2StringList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    const/4 v6, 0x0

    :cond_4
    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    const-string v8, "**"

    if-eqz v7, :cond_5

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 863
    invoke-virtual {v7, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    const/4 v9, 0x3

    if-le v8, v9, :cond_4

    .line 864
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v9

    add-int/lit8 v9, v9, -0x2

    if-ge v8, v9, :cond_4

    .line 865
    new-instance v9, Lcom/flyersoft/tools/A$Shelf_Sort;

    invoke-virtual {v7, v0, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    add-int/lit8 v8, v8, 0x2

    invoke-virtual {v7, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result v7

    invoke-direct {v9, v10, v7}, Lcom/flyersoft/tools/A$Shelf_Sort;-><init>(Ljava/lang/String;I)V

    .line 866
    invoke-virtual {v3, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 867
    iget-object v7, v9, Lcom/flyersoft/tools/A$Shelf_Sort;->pureFilename:Ljava/lang/String;

    invoke-static {p0, v7}, Lcom/flyersoft/components/cloud/Sync;->getSamePureFilenameBook(Ljava/util/ArrayList;Ljava/lang/String;)Lcom/flyersoft/tools/BookDb$BookInfo;

    move-result-object v7

    if-eqz v7, :cond_4

    .line 869
    iget-object v6, v7, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    iput-object v6, v9, Lcom/flyersoft/tools/A$Shelf_Sort;->filename:Ljava/lang/String;

    const/4 v6, 0x1

    goto :goto_2

    :cond_5
    if-eqz v6, :cond_3

    .line 876
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 877
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/flyersoft/tools/A$Shelf_Sort;

    .line 878
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, v6, Lcom/flyersoft/tools/A$Shelf_Sort;->filename:Ljava/lang/String;

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v6, v6, Lcom/flyersoft/tools/A$Shelf_Sort;->position:I

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 879
    :cond_6
    invoke-static {v5}, Lcom/flyersoft/tools/T;->stringList2Text(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/flyersoft/tools/T;->saveFileText(Ljava/lang/String;Ljava/lang/String;)Z

    goto/16 :goto_1

    :cond_7
    return-void
.end method

.method private static resetSyncDownloadUploadState()V
    .locals 2

    const/4 v0, 0x0

    .line 364
    sput-boolean v0, Lcom/flyersoft/components/cloud/Sync;->updateBookListWorking:Z

    const/4 v1, 0x0

    .line 365
    sput-object v1, Lcom/flyersoft/components/cloud/Sync;->coverDownloadList2:Ljava/util/ArrayList;

    sput-object v1, Lcom/flyersoft/components/cloud/Sync;->coverDownloadList:Ljava/util/ArrayList;

    .line 366
    sput-object v1, Lcom/flyersoft/components/cloud/Sync;->coverUploadList2:Ljava/util/ArrayList;

    sput-object v1, Lcom/flyersoft/components/cloud/Sync;->coverUploadList:Ljava/util/ArrayList;

    .line 367
    sput-boolean v0, Lcom/flyersoft/components/cloud/Sync;->uploadBookFilesPaused:Z

    sput-boolean v0, Lcom/flyersoft/components/cloud/Sync;->uploadBookFilesWorking:Z

    .line 368
    sput-object v1, Lcom/flyersoft/components/cloud/Sync;->uploadShelfBookList:Ljava/util/ArrayList;

    .line 369
    sput-object v1, Lcom/flyersoft/components/cloud/Sync;->pdfCloudIsNewerList:Ljava/util/ArrayList;

    return-void
.end method

.method public static saveDownloadedShelfList()V
    .locals 2

    .line 1341
    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->downloadRecordFileName()Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->getDownloadedShelfList()Ljava/util/ArrayList;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/tools/T;->stringList2Text(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flyersoft/tools/T;->saveFileText(Ljava/lang/String;Ljava/lang/String;)Z

    return-void
.end method

.method public static saveShelfOptionsToFile()Ljava/lang/String;
    .locals 3

    .line 821
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/shelf.options"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 822
    new-instance v1, Lcom/flyersoft/components/cloud/Sync$ShelfOptions;

    invoke-direct {v1}, Lcom/flyersoft/components/cloud/Sync$ShelfOptions;-><init>()V

    .line 825
    sget v2, Lcom/flyersoft/tools/A;->shelf_sort_by:I

    iput v2, v1, Lcom/flyersoft/components/cloud/Sync$ShelfOptions;->shelf_sort_by:I

    .line 826
    invoke-static {v1}, Lcom/flyersoft/tools/T;->toJsonText(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 827
    invoke-static {v0, v1}, Lcom/flyersoft/tools/T;->saveFileText(Ljava/lang/String;Ljava/lang/String;)Z

    return-object v0
.end method

.method public static setShelfUpdateState(I)V
    .locals 1

    if-nez p0, :cond_0

    const/4 p0, 0x0

    .line 1494
    sput p0, Lcom/flyersoft/components/cloud/Sync;->bookDatabaseUpdated:I

    return-void

    .line 1495
    :cond_0
    sget v0, Lcom/flyersoft/components/cloud/Sync;->bookDatabaseUpdated:I

    if-ge v0, p0, :cond_1

    .line 1496
    sput p0, Lcom/flyersoft/components/cloud/Sync;->bookDatabaseUpdated:I

    :cond_1
    return-void
.end method

.method public static syncShelfFromCloudManually()V
    .locals 5

    .line 316
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNetworkConnecting(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 317
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->no_network:I

    invoke-static {v1}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void

    .line 320
    :cond_0
    sget-wide v0, Lcom/flyersoft/components/cloud/Sync;->lastSyncViaMenuTime:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sget-wide v2, Lcom/flyersoft/components/cloud/Sync;->lastSyncViaMenuTime:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x1f40

    cmp-long v4, v0, v2

    if-gez v4, :cond_1

    .line 321
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->connect_wait:I

    invoke-static {v1}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void

    .line 325
    :cond_1
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->sync_from_cloud:I

    invoke-static {v1}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    .line 326
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sput-wide v0, Lcom/flyersoft/components/cloud/Sync;->lastSyncViaMenuTime:J

    .line 327
    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->resetSyncDownloadUploadState()V

    const/4 v0, 0x0

    .line 329
    invoke-static {v0, v0}, Lcom/flyersoft/components/cloud/Sync;->updateBookListViaCloud(ZZ)V

    .line 331
    new-instance v0, Lcom/flyersoft/components/cloud/Sync$5;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flyersoft/components/cloud/Sync$5;-><init>(Landroid/os/Looper;)V

    const/4 v1, 0x1

    const-wide/16 v2, 0xc8

    .line 335
    invoke-virtual {v0, v1, v2, v3}, Lcom/flyersoft/components/cloud/Sync$5;->sendEmptyMessageDelayed(IJ)Z

    return-void
.end method

.method public static syncShelfMsg(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1180
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->sync_shelf:I

    invoke-static {v1}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/tools/T;->deleteEndQuotes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez p0, :cond_0

    .line 1181
    const-string p0, ""

    goto :goto_0

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, ", "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->upload:I

    invoke-static {v2}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "..."

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_0
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static syncShelfToCloudManually()V
    .locals 5

    .line 282
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNetworkConnecting(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 283
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->no_network:I

    invoke-static {v1}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void

    .line 286
    :cond_0
    sget-wide v0, Lcom/flyersoft/components/cloud/Sync;->lastSyncViaMenuTime:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sget-wide v2, Lcom/flyersoft/components/cloud/Sync;->lastSyncViaMenuTime:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x1f40

    cmp-long v4, v0, v2

    if-gez v4, :cond_1

    .line 287
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->connect_wait:I

    invoke-static {v1}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void

    .line 291
    :cond_1
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->sync_to_cloud:I

    invoke-static {v1}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    .line 292
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getAllBooks()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 293
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v1

    if-eqz v1, :cond_2

    return-void

    .line 296
    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    sput-wide v1, Lcom/flyersoft/components/cloud/Sync;->lastSyncViaMenuTime:J

    .line 297
    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->resetSyncDownloadUploadState()V

    .line 298
    invoke-static {v0}, Lcom/flyersoft/components/cloud/Sync;->updateBookListToCloud(Ljava/util/ArrayList;)V

    .line 300
    new-instance v0, Lcom/flyersoft/components/cloud/Sync$4;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flyersoft/components/cloud/Sync$4;-><init>(Landroid/os/Looper;)V

    const/4 v1, 0x1

    const-wide/16 v2, 0xc8

    .line 311
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    const/4 v1, 0x2

    const-wide/16 v2, 0x190

    .line 312
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    return-void
.end method

.method public static updateBookListToCloud(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$BookInfo;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 727
    invoke-static {v0}, Lcom/flyersoft/components/cloud/Sync;->setShelfUpdateState(I)V

    .line 728
    new-instance v0, Lcom/flyersoft/components/cloud/Sync$15;

    invoke-direct {v0, p0}, Lcom/flyersoft/components/cloud/Sync$15;-><init>(Ljava/util/ArrayList;)V

    const/4 p0, 0x1

    .line 754
    invoke-virtual {v0, p0}, Ljava/lang/Thread;->setPriority(I)V

    .line 755
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public static declared-synchronized updateBookListViaCloud(ZZ)V
    .locals 4

    const-class v0, Lcom/flyersoft/components/cloud/Sync;

    monitor-enter v0

    .line 653
    :try_start_0
    sget-boolean v1, Lcom/flyersoft/components/cloud/Sync;->updateBookListWorking:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    .line 654
    monitor-exit v0

    return-void

    :cond_0
    const/4 v1, 0x1

    .line 655
    :try_start_1
    sput-boolean v1, Lcom/flyersoft/components/cloud/Sync;->updateBookListWorking:Z

    if-eqz p0, :cond_1

    .line 658
    invoke-static {}, Lcom/flyersoft/components/cloud/Cloud;->instance()Lcom/flyersoft/components/cloud/Cloud;

    move-result-object p0

    sget v2, Lcom/flyersoft/tools/A;->syncType:I

    invoke-static {v2}, Lcom/flyersoft/components/cloud/Cloud;->getShelfBooksDeviceFile(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/flyersoft/components/cloud/Sync$13;

    invoke-direct {v3, p1}, Lcom/flyersoft/components/cloud/Sync$13;-><init>(Z)V

    invoke-virtual {p0, v2, v3, v1}, Lcom/flyersoft/components/cloud/Cloud;->downloadToOutputStream(Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterDownload;Z)V

    goto :goto_0

    .line 670
    :cond_1
    invoke-static {p1}, Lcom/flyersoft/components/cloud/Sync;->updateBookListViaCloudFinal(Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 671
    :goto_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p0
.end method

.method private static updateBookListViaCloudFinal(Z)V
    .locals 3

    .line 674
    invoke-static {}, Lcom/flyersoft/components/cloud/Cloud;->instance()Lcom/flyersoft/components/cloud/Cloud;

    move-result-object v0

    sget v1, Lcom/flyersoft/tools/A;->syncType:I

    invoke-static {v1}, Lcom/flyersoft/components/cloud/Cloud;->getShelfBooksJsonFile(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/flyersoft/components/cloud/Sync$14;

    invoke-direct {v2, p0}, Lcom/flyersoft/components/cloud/Sync$14;-><init>(Z)V

    const/4 p0, 0x1

    invoke-virtual {v0, v1, v2, p0}, Lcom/flyersoft/components/cloud/Cloud;->downloadToOutputStream(Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterDownload;Z)V

    return-void
.end method

.method public static declared-synchronized updateCoversViaCloud()V
    .locals 5

    const-class v0, Lcom/flyersoft/components/cloud/Sync;

    monitor-enter v0

    .line 638
    :try_start_0
    invoke-static {}, Lcom/flyersoft/components/cloud/Cloud;->instance()Lcom/flyersoft/components/cloud/Cloud;

    move-result-object v1

    sget v2, Lcom/flyersoft/tools/A;->syncType:I

    invoke-static {v2}, Lcom/flyersoft/components/cloud/Cloud;->getShelfCoversDeviceFile(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/flyersoft/components/cloud/Sync$12;

    invoke-direct {v3}, Lcom/flyersoft/components/cloud/Sync$12;-><init>()V

    const/4 v4, 0x1

    invoke-virtual {v1, v2, v3, v4}, Lcom/flyersoft/components/cloud/Cloud;->downloadToOutputStream(Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterDownload;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 650
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private static updateMyShelfBooks(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/List;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$BookInfo;",
            ">;",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/components/cloud/Sync$CloudBook;",
            ">;",
            "Ljava/util/List<",
            "Lcom/flyersoft/components/cloud/Sync$CloudBook;",
            ">;Z)V"
        }
    .end annotation

    .line 885
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 887
    :cond_0
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    new-instance v1, Lcom/flyersoft/components/cloud/Sync$17;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/flyersoft/components/cloud/Sync$17;-><init>(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/List;Z)V

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method private static updateMyShelfBooksFinal(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/List;Z)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$BookInfo;",
            ">;",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/components/cloud/Sync$CloudBook;",
            ">;",
            "Ljava/util/List<",
            "Lcom/flyersoft/components/cloud/Sync$CloudBook;",
            ">;Z)V"
        }
    .end annotation

    .line 902
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    const-string v1, "<b><big>"

    if-eqz v0, :cond_0

    .line 904
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->sync_via_cloud:I

    .line 903
    invoke-static {v1}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v1

    sget v2, Lcom/flyersoft/tools/A;->syncType:I

    invoke-static {v1, v2}, Lcom/flyersoft/components/cloud/Cloud;->fixCloudTitle(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "</big></b><br><br>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->no_more_found:I

    .line 904
    invoke-static {v1}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "<br><br>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 907
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->sync_shelf_hint:I

    .line 905
    invoke-static {v1}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v1

    sget v2, Lcom/flyersoft/tools/A;->syncType:I

    invoke-static {v1, v2}, Lcom/flyersoft/components/cloud/Cloud;->fixCloudTitle(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "</big></b><br><br><font color=\"#1e88e5\"><u>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->sync_shelf_hint2:I

    .line 906
    invoke-static {v1}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 907
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ")</u></font><br><br>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 908
    :goto_0
    sget-object v2, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    .line 909
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v3, 0x1

    .line 910
    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 911
    new-instance v4, Landroid/widget/TextView;

    invoke-direct {v4, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 912
    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v0

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 913
    new-instance v7, Landroid/widget/CheckBox;

    invoke-direct {v7, v2}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    .line 914
    sget v0, Lcom/flyersoft/moonreaderp/R$string;->sync_ignore_hint:I

    invoke-virtual {v7, v0}, Landroid/widget/CheckBox;->setText(I)V

    .line 915
    invoke-virtual {v7, v3}, Landroid/widget/CheckBox;->setChecked(Z)V

    if-eqz p3, :cond_1

    const/16 v0, 0x8

    .line 917
    invoke-virtual {v7, v0}, Landroid/widget/CheckBox;->setVisibility(I)V

    .line 918
    :cond_1
    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 919
    invoke-virtual {v1, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 921
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    const/4 v11, 0x0

    if-nez v0, :cond_3

    .line 922
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    .line 923
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v5

    new-array v5, v5, [Z

    const/4 v6, 0x0

    .line 924
    :goto_1
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-ge v6, v8, :cond_2

    .line 925
    invoke-virtual {p1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/flyersoft/components/cloud/Sync$CloudBook;

    iget-object v8, v8, Lcom/flyersoft/components/cloud/Sync$CloudBook;->bookName:Ljava/lang/String;

    aput-object v8, v0, v6

    .line 926
    aput-boolean v3, v5, v6

    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 928
    :cond_2
    new-instance v3, Lcom/flyersoft/components/cloud/Sync$18;

    invoke-direct {v3, v2, v0, v5, p1}, Lcom/flyersoft/components/cloud/Sync$18;-><init>(Landroid/content/Context;[Ljava/lang/String;[ZLjava/util/ArrayList;)V

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 949
    :cond_3
    invoke-virtual {p1}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v0

    move-object v8, v0

    check-cast v8, Ljava/util/ArrayList;

    .line 951
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    invoke-direct {v0, v2}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v3, Lcom/flyersoft/tools/A;->syncType:I

    .line 952
    invoke-static {v3}, Lcom/flyersoft/components/cloud/Cloud;->getCloudName(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 953
    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 954
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 955
    new-instance v1, Lcom/flyersoft/components/cloud/Sync$19;

    invoke-direct {v1, p0, p1}, Lcom/flyersoft/components/cloud/Sync$19;-><init>(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    const v3, 0x104000a

    invoke-virtual {v0, v3, v1}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    .line 960
    :cond_4
    new-instance v1, Lcom/flyersoft/components/cloud/Sync$22;

    invoke-direct {v1}, Lcom/flyersoft/components/cloud/Sync$22;-><init>()V

    const/high16 v3, 0x1040000

    invoke-virtual {v0, v3, v1}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v9

    sget v10, Lcom/flyersoft/moonreaderp/R$string;->clone_shelf:I

    new-instance v1, Lcom/flyersoft/components/cloud/Sync$21;

    move-object v4, p0

    move-object v5, p1

    move-object v3, p2

    move v6, p3

    invoke-direct/range {v1 .. v6}, Lcom/flyersoft/components/cloud/Sync$21;-><init>(Landroid/content/Context;Ljava/util/List;Ljava/util/ArrayList;Ljava/util/ArrayList;Z)V

    .line 964
    invoke-virtual {v9, v10, v1}, Lcom/flyersoft/components/MyDialog;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    new-instance v5, Lcom/flyersoft/components/cloud/Sync$20;

    move-object v10, v3

    move-object v9, v4

    invoke-direct/range {v5 .. v10}, Lcom/flyersoft/components/cloud/Sync$20;-><init>(ZLandroid/widget/CheckBox;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/List;)V

    .line 981
    invoke-virtual {p0, v5}, Lcom/flyersoft/components/MyDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    .line 993
    invoke-virtual {p0, v11}, Lcom/flyersoft/components/MyDialog;->setCancelable(Z)Lcom/flyersoft/components/MyDialog;

    .line 994
    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    move-result-object p0

    sput-object p0, Lcom/flyersoft/components/cloud/Sync;->updateShelfDlg:Landroidx/appcompat/app/AlertDialog;

    return-void
.end method

.method public static uploadBooksSortFiles()V
    .locals 9

    .line 760
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/sorts"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFolderFileList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 761
    invoke-static {}, Lcom/flyersoft/tools/A;->shelfTopBookRecordFile()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 762
    invoke-static {}, Lcom/flyersoft/tools/A;->cleanShelfTopBooks()V

    .line 763
    invoke-static {}, Lcom/flyersoft/tools/A;->shelfTopBookRecordFile()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 765
    :cond_0
    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->saveShelfOptionsToFile()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 766
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/books.sorts"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 767
    invoke-static {v6}, Lcom/flyersoft/tools/T;->deleteFile(Ljava/lang/String;)Z

    .line 768
    invoke-static {v0, v6}, Lcom/flyersoft/tools/compress/MyZip_Java;->zipFiles(Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 769
    invoke-static {}, Lcom/flyersoft/components/cloud/Cloud;->instance()Lcom/flyersoft/components/cloud/Cloud;

    move-result-object v3

    sget v0, Lcom/flyersoft/tools/A;->syncType:I

    invoke-static {v0}, Lcom/flyersoft/components/cloud/Cloud;->getShelfBooksSortFile(I)Ljava/lang/String;

    move-result-object v4

    .line 770
    invoke-static {v6}, Lcom/flyersoft/tools/T;->file2InputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v5

    const/4 v7, 0x0

    const/4 v8, 0x1

    .line 769
    invoke-virtual/range {v3 .. v8}, Lcom/flyersoft/components/cloud/Cloud;->uploadFromInputStream(Ljava/lang/String;Ljava/io/InputStream;Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterUpload;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    .line 772
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-void
.end method

.method private static uploadCloudNoteFile()V
    .locals 8

    .line 102
    sget-boolean v0, Lcom/flyersoft/tools/A;->hasNewNoteForUpload:Z

    if-eqz v0, :cond_2

    const/4 v0, 0x0

    .line 103
    sput-boolean v0, Lcom/flyersoft/tools/A;->hasNewNoteForUpload:Z

    .line 104
    sget-object v0, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/flyersoft/tools/BookDb;->exportNotesToText(Ljava/lang/String;Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v0

    .line 105
    sget-object v1, Lcom/flyersoft/tools/A;->deletedNotes:Ljava/util/ArrayList;

    if-eqz v1, :cond_0

    .line 106
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v0, Lcom/flyersoft/tools/A;->deletedNotes:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/flyersoft/tools/BookDb;->deletedNotesToText(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 109
    :cond_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0xa

    if-le v1, v2, :cond_1

    .line 110
    sget v1, Lcom/flyersoft/tools/A;->syncType:I

    invoke-static {v1}, Lcom/flyersoft/components/cloud/Cloud;->getNoteFile(I)Ljava/lang/String;

    move-result-object v3

    .line 111
    invoke-static {v0}, Lcom/flyersoft/tools/compress/MyZip_Java;->compress(Ljava/lang/String;)[B

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/tools/T;->bytes2InputStream([B)Ljava/io/InputStream;

    move-result-object v4

    .line 112
    invoke-static {}, Lcom/flyersoft/components/cloud/Cloud;->instance()Lcom/flyersoft/components/cloud/Cloud;

    move-result-object v2

    new-instance v5, Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/compress/MyZip_Java;->compress(Ljava/lang/String;)[B

    move-result-object v0

    invoke-direct {v5, v0}, Ljava/lang/String;-><init>([B)V

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Lcom/flyersoft/components/cloud/Cloud;->uploadFromInputStream(Ljava/lang/String;Ljava/io/InputStream;Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterUpload;Z)V

    return-void

    .line 114
    :cond_1
    invoke-static {}, Lcom/flyersoft/moonreaderp/ActivityTxt;->sync_finish_message()V

    :cond_2
    return-void
.end method

.method public static uploadCloudPositionFile(ZZ)Z
    .locals 10

    .line 51
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNetworkConnecting(Landroid/content/Context;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 53
    :cond_0
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v2, "positions10"

    invoke-virtual {v0, v2, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 54
    sget-object v2, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_1

    return v1

    .line 57
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v4, 0x2

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, -0x1

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 58
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lcom/flyersoft/tools/A;->deviceRandomID:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "*"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-ne v0, v4, :cond_2

    const-string v0, ""

    goto :goto_0

    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v4, "|"

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    if-nez p0, :cond_3

    .line 61
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sget-wide v4, Lcom/flyersoft/components/cloud/Sync;->lastUploadedTime:J

    sub-long/2addr v2, v4

    const-wide/16 v4, 0x5

    invoke-static {v4, v5}, Lcom/flyersoft/tools/T;->minute(J)J

    move-result-wide v4

    cmp-long p0, v2, v4

    if-gez p0, :cond_3

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v0, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    sget-object v0, Lcom/flyersoft/components/cloud/Sync;->lastUploadedText:Ljava/lang/String;

    .line 62
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3

    .line 63
    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->uploadCloudNoteFile()V

    return v1

    :cond_3
    if-eqz p1, :cond_4

    .line 68
    sget p0, Lcom/flyersoft/moonreaderp/R$string;->sync_to_cloud:I

    invoke-static {p0}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/flyersoft/tools/T;->showToastTextBackground(Ljava/lang/CharSequence;)V

    .line 70
    :cond_4
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v0, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    sput-object p0, Lcom/flyersoft/components/cloud/Sync;->lastUploadedText:Ljava/lang/String;

    .line 71
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sput-wide v2, Lcom/flyersoft/components/cloud/Sync;->lastUploadedTime:J

    .line 72
    sget p0, Lcom/flyersoft/tools/A;->syncType:I

    invoke-static {p0}, Lcom/flyersoft/components/cloud/Cloud;->getPositionFile(I)Ljava/lang/String;

    move-result-object v5

    .line 74
    invoke-static {}, Lcom/flyersoft/components/cloud/Cloud;->instance()Lcom/flyersoft/components/cloud/Cloud;

    move-result-object p0

    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/Cloud;->isLogin()Z

    move-result p0

    if-eqz p0, :cond_5

    .line 75
    invoke-static {}, Lcom/flyersoft/components/cloud/Cloud;->instance()Lcom/flyersoft/components/cloud/Cloud;

    move-result-object v4

    invoke-static {v7}, Lcom/flyersoft/tools/T;->String2InputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v6

    new-instance v8, Lcom/flyersoft/components/cloud/Sync$1;

    invoke-direct {v8, p1}, Lcom/flyersoft/components/cloud/Sync$1;-><init>(Z)V

    const/4 v9, 0x0

    invoke-virtual/range {v4 .. v9}, Lcom/flyersoft/components/cloud/Cloud;->uploadFromInputStream(Ljava/lang/String;Ljava/io/InputStream;Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterUpload;Z)V

    const/4 p0, 0x1

    return p0

    .line 84
    :cond_5
    invoke-static {}, Lcom/flyersoft/moonreaderp/ActivityTxt;->sync_finish_message()V

    return v1
.end method

.method public static uploadCurrentBookToCloud(Landroid/content/Context;)V
    .locals 8

    .line 223
    sget v0, Lcom/flyersoft/tools/A;->syncType:I

    if-nez v0, :cond_0

    goto :goto_0

    .line 225
    :cond_0
    invoke-static {}, Lcom/flyersoft/components/cloud/Cloud;->instance()Lcom/flyersoft/components/cloud/Cloud;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flyersoft/components/cloud/Cloud;->isLogin()Z

    move-result v0

    if-nez v0, :cond_1

    :goto_0
    return-void

    .line 227
    :cond_1
    sget v0, Lcom/flyersoft/tools/A;->syncType:I

    invoke-static {v0}, Lcom/flyersoft/components/cloud/Cloud;->instance(I)Lcom/flyersoft/components/cloud/Cloud;

    move-result-object v1

    sget-object v0, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/components/cloud/Cloud;->FileList([Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v3

    sget-object v0, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    .line 228
    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    sget v0, Lcom/flyersoft/tools/A;->syncType:I

    invoke-static {v0}, Lcom/flyersoft/components/cloud/Cloud;->getWebBookPath(I)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x1

    move-object v2, p0

    .line 227
    invoke-virtual/range {v1 .. v7}, Lcom/flyersoft/components/cloud/Cloud;->upload(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;ZZ)V

    return-void
.end method

.method private static uploadRecordXmlName()Ljava/lang/String;
    .locals 2

    .line 1291
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget v1, Lcom/flyersoft/tools/A;->syncType:I

    invoke-static {v1}, Lcom/flyersoft/components/cloud/Cloud;->getCloudTag(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/tools/T;->deleteQuotes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "_uploads"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static uploadShelfBookCover(Lcom/flyersoft/tools/BookDb$BookInfo;)V
    .locals 1

    .line 543
    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->allowSyncShelf()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    if-nez p0, :cond_1

    :goto_0
    return-void

    .line 547
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 548
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 p0, 0x1

    .line 549
    invoke-static {v0, p0, p0}, Lcom/flyersoft/components/cloud/Sync;->uploadShelfBookCovers(Ljava/util/ArrayList;ZZ)V

    return-void
.end method

.method private static declared-synchronized uploadShelfBookCovers(Ljava/util/ArrayList;ZZ)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$BookInfo;",
            ">;ZZ)V"
        }
    .end annotation

    const-class v0, Lcom/flyersoft/components/cloud/Sync;

    monitor-enter v0

    .line 553
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    sput-object v1, Lcom/flyersoft/components/cloud/Sync;->coverUploadList:Ljava/util/ArrayList;

    .line 554
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    sput-object v1, Lcom/flyersoft/components/cloud/Sync;->coverUploadList2:Ljava/util/ArrayList;

    .line 555
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 556
    iget-object v1, v1, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    sget v2, Lcom/flyersoft/tools/A;->syncType:I

    invoke-static {v1, v2}, Lcom/flyersoft/components/cloud/Sync;->fixWebDavFilename(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    .line 557
    invoke-static {v1}, Lcom/flyersoft/tools/A;->getBookCoverFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 558
    invoke-static {v2}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 559
    sget-object v3, Lcom/flyersoft/components/cloud/Sync;->coverUploadList:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 560
    sget-object v2, Lcom/flyersoft/components/cloud/Sync;->coverUploadList2:Ljava/util/ArrayList;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "_2.png"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 564
    :cond_1
    sget-object p0, Lcom/flyersoft/components/cloud/Sync;->coverUploadList:Ljava/util/ArrayList;

    invoke-static {p0}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result p0

    if-nez p0, :cond_3

    sget-object p0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p0

    if-nez p0, :cond_3

    if-eqz p1, :cond_2

    .line 566
    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->uploadShelfBookCoversFinal()V

    goto :goto_1

    .line 568
    :cond_2
    sget-object p0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    new-instance p1, Lcom/flyersoft/components/cloud/Sync$10;

    invoke-direct {p1, p2}, Lcom/flyersoft/components/cloud/Sync$10;-><init>(Z)V

    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 586
    :cond_3
    :goto_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method private static uploadShelfBookCoversFinal()V
    .locals 8

    .line 604
    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->allowSyncShelf()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 606
    :cond_0
    sget-object v0, Lcom/flyersoft/components/cloud/Sync;->coverUploadList:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 608
    :try_start_0
    sget-object v0, Lcom/flyersoft/components/cloud/Sync;->coverUploadList:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Ljava/lang/String;

    .line 609
    sget-object v0, Lcom/flyersoft/components/cloud/Sync;->coverUploadList2:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 610
    invoke-static {}, Lcom/flyersoft/components/cloud/Cloud;->instance()Lcom/flyersoft/components/cloud/Cloud;

    move-result-object v2

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget v3, Lcom/flyersoft/tools/A;->syncType:I

    .line 611
    invoke-static {v3}, Lcom/flyersoft/components/cloud/Cloud;->getPrefix(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "/Cover/"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 612
    invoke-static {v5}, Lcom/flyersoft/tools/T;->file2InputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v4

    new-instance v6, Lcom/flyersoft/components/cloud/Sync$11;

    invoke-direct {v6, v5}, Lcom/flyersoft/components/cloud/Sync$11;-><init>(Ljava/lang/String;)V

    const/4 v7, 0x1

    .line 610
    invoke-virtual/range {v2 .. v7}, Lcom/flyersoft/components/cloud/Cloud;->uploadFromInputStream(Ljava/lang/String;Ljava/io/InputStream;Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterUpload;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    .line 622
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 623
    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->uploadShelfBookCoversFinal()V

    :goto_0
    return-void

    .line 626
    :cond_1
    invoke-static {}, Lcom/flyersoft/components/cloud/Cloud;->instance()Lcom/flyersoft/components/cloud/Cloud;

    move-result-object v1

    sget v0, Lcom/flyersoft/tools/A;->syncType:I

    invoke-static {v0}, Lcom/flyersoft/components/cloud/Cloud;->getShelfCoversDeviceFile(I)Ljava/lang/String;

    move-result-object v2

    sget-object v0, Lcom/flyersoft/tools/A;->deviceRandomID:Ljava/lang/String;

    .line 627
    invoke-static {v0}, Lcom/flyersoft/tools/T;->String2InputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    sget-object v4, Lcom/flyersoft/tools/A;->deviceRandomID:Ljava/lang/String;

    const/4 v5, 0x0

    const/4 v6, 0x1

    .line 626
    invoke-virtual/range {v1 .. v6}, Lcom/flyersoft/components/cloud/Cloud;->uploadFromInputStream(Ljava/lang/String;Ljava/io/InputStream;Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterUpload;Z)V

    return-void
.end method

.method private static uploadShelfBooksFinal(Ljava/lang/String;)V
    .locals 9

    .line 478
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 480
    :cond_0
    sget-boolean v0, Lcom/flyersoft/components/cloud/Sync;->uploadBookFilesPaused:Z

    if-eqz v0, :cond_1

    :goto_0
    return-void

    .line 483
    :cond_1
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->handler:Landroid/os/Handler;

    .line 484
    sget-object v1, Lcom/flyersoft/components/cloud/Sync;->uploadShelfBookList:Ljava/util/ArrayList;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v1

    const/16 v2, 0x3fe

    const/4 v3, 0x0

    if-nez v1, :cond_4

    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->allowSyncShelf()Z

    move-result v1

    if-nez v1, :cond_2

    goto/16 :goto_2

    .line 494
    :cond_2
    sget-object v1, Lcom/flyersoft/components/cloud/Sync;->uploadShelfBookList:Ljava/util/ArrayList;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Ljava/lang/String;

    .line 495
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "["

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v3, Lcom/flyersoft/components/cloud/Sync;->uploadShelfBookList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "] "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    if-eqz p0, :cond_3

    .line 497
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v6}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "..."

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_1

    .line 498
    :cond_3
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->upload:I

    invoke-static {v1}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ": "

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v6}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 496
    :goto_1
    invoke-virtual {v0, v2, p0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 500
    invoke-static {}, Lcom/flyersoft/components/cloud/Cloud;->instance()Lcom/flyersoft/components/cloud/Cloud;

    move-result-object v3

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    sget v0, Lcom/flyersoft/tools/A;->syncType:I

    .line 501
    invoke-static {v0}, Lcom/flyersoft/components/cloud/Cloud;->getWebBookPath(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v6}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 502
    invoke-static {v6}, Lcom/flyersoft/tools/T;->file2InputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v5

    new-instance v7, Lcom/flyersoft/components/cloud/Sync$8;

    invoke-direct {v7, v6}, Lcom/flyersoft/components/cloud/Sync$8;-><init>(Ljava/lang/String;)V

    const/4 v8, 0x1

    .line 500
    invoke-virtual/range {v3 .. v8}, Lcom/flyersoft/components/cloud/Cloud;->uploadFromInputStream(Ljava/lang/String;Ljava/io/InputStream;Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterUpload;Z)V

    return-void

    .line 485
    :cond_4
    :goto_2
    sput-boolean v3, Lcom/flyersoft/components/cloud/Sync;->uploadBookFilesWorking:Z

    const/4 v1, 0x0

    .line 486
    sput-object v1, Lcom/flyersoft/components/cloud/Sync;->uploadShelfBookList:Ljava/util/ArrayList;

    if-eqz p0, :cond_5

    .line 488
    invoke-virtual {v0, v2, p0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void

    :cond_5
    const/16 p0, 0x3fd

    .line 490
    invoke-virtual {v0, p0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void
.end method

.method public static declared-synchronized uploadShelfBooksToCloud(ZZ)V
    .locals 5

    const-class v0, Lcom/flyersoft/components/cloud/Sync;

    monitor-enter v0

    .line 375
    :try_start_0
    sget-boolean v1, Lcom/flyersoft/tools/A;->syncBookInWiFiOnly:Z

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isWiFiConnecting(Landroid/content/Context;)Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 376
    monitor-exit v0

    return-void

    .line 377
    :cond_0
    :try_start_1
    sget-object v1, Lcom/flyersoft/components/cloud/Sync;->uploadShelfBookList:Ljava/util/ArrayList;

    if-eqz v1, :cond_1

    const/4 p0, 0x0

    .line 378
    invoke-static {p0}, Lcom/flyersoft/components/cloud/Sync;->uploadShelfBooksFinal(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 379
    monitor-exit v0

    return-void

    .line 382
    :cond_1
    :try_start_2
    sget-boolean v1, Lcom/flyersoft/components/cloud/Sync;->uploadBookFilesWorking:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v1, :cond_2

    .line 383
    monitor-exit v0

    return-void

    :cond_2
    const/4 v1, 0x1

    .line 384
    :try_start_3
    sput-boolean v1, Lcom/flyersoft/components/cloud/Sync;->uploadBookFilesWorking:Z

    const/4 v1, 0x0

    .line 385
    sput-boolean v1, Lcom/flyersoft/components/cloud/Sync;->uploadBookFilesPaused:Z

    .line 387
    invoke-static {}, Lcom/flyersoft/components/cloud/Cloud;->instance()Lcom/flyersoft/components/cloud/Cloud;

    move-result-object v1

    sget-object v2, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v3, Lcom/flyersoft/tools/A;->syncType:I

    invoke-static {v3}, Lcom/flyersoft/components/cloud/Cloud;->getWebBookPath(I)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lcom/flyersoft/components/cloud/Sync$7;

    invoke-direct {v4, p1, p0}, Lcom/flyersoft/components/cloud/Sync$7;-><init>(ZZ)V

    invoke-virtual {v1, v2, v3, v4}, Lcom/flyersoft/components/cloud/Cloud;->dir(Landroid/content/Context;Ljava/lang/String;Lcom/flyersoft/tools/T$OnResult;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 440
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    :try_start_4
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw p0
.end method

.method private static declared-synchronized verifyDownloadBookCovers(Ljava/util/HashMap;ZZ)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/flyersoft/tools/T$FileItem;",
            ">;ZZ)V"
        }
    .end annotation

    const-class v0, Lcom/flyersoft/components/cloud/Sync;

    monitor-enter v0

    .line 1111
    :try_start_0
    sget-object v1, Lcom/flyersoft/components/cloud/Sync;->coverDownloadList2:Ljava/util/ArrayList;

    if-eqz v1, :cond_2

    .line 1112
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    :goto_0
    if-ltz v1, :cond_2

    .line 1113
    sget-object v2, Lcom/flyersoft/components/cloud/Sync;->coverDownloadList2:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    sget-object v3, Lcom/flyersoft/components/cloud/Sync;->coverDownloadList:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v2, v3, p0}, Lcom/flyersoft/components/cloud/Sync;->cloudFileIsNewer(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1114
    sget-object v2, Lcom/flyersoft/components/cloud/Sync;->coverDownloadList:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1115
    sget-object v2, Lcom/flyersoft/components/cloud/Sync;->coverDownloadList2:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_1

    :cond_0
    if-eqz p2, :cond_1

    .line 1116
    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->getDownloadedShelfList()Ljava/util/ArrayList;

    move-result-object v2

    sget-object v3, Lcom/flyersoft/components/cloud/Sync;->coverDownloadList2:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_1

    .line 1117
    sget-object v2, Lcom/flyersoft/components/cloud/Sync;->coverDownloadList:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1118
    sget-object v2, Lcom/flyersoft/components/cloud/Sync;->coverDownloadList2:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_1
    :goto_1
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 1121
    :cond_2
    invoke-static {p1}, Lcom/flyersoft/components/cloud/Sync;->downloadShelfBookCoversFinal(Z)V

    .line 1122
    invoke-virtual {p0}, Ljava/util/HashMap;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1123
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method private static declared-synchronized verifyUploadBookCovers(Ljava/util/HashMap;Z)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/flyersoft/tools/T$FileItem;",
            ">;Z)V"
        }
    .end annotation

    const-class v0, Lcom/flyersoft/components/cloud/Sync;

    monitor-enter v0

    .line 589
    :try_start_0
    sget-object v1, Lcom/flyersoft/components/cloud/Sync;->coverUploadList2:Ljava/util/ArrayList;

    if-eqz v1, :cond_2

    .line 590
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    :goto_0
    if-ltz v1, :cond_2

    .line 591
    sget-object v3, Lcom/flyersoft/components/cloud/Sync;->coverUploadList2:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    sget-object v4, Lcom/flyersoft/components/cloud/Sync;->coverUploadList:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v3, v4, p0}, Lcom/flyersoft/components/cloud/Sync;->localFileIsNewer(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)Z

    move-result v3

    xor-int/lit8 v4, v3, 0x1

    if-eqz p1, :cond_0

    if-eqz v3, :cond_0

    .line 592
    sget-object v3, Lcom/flyersoft/components/cloud/Sync;->coverUploadList:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Lcom/flyersoft/components/cloud/Sync;->isJustUploadedFile(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v4, 0x1

    :cond_0
    if-eqz v4, :cond_1

    .line 595
    sget-object v3, Lcom/flyersoft/components/cloud/Sync;->coverUploadList:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 596
    sget-object v3, Lcom/flyersoft/components/cloud/Sync;->coverUploadList2:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_1
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 599
    :cond_2
    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->uploadShelfBookCoversFinal()V

    .line 600
    invoke-virtual {p0}, Ljava/util/HashMap;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 601
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method
