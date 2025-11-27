.class Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$2;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;

.field final synthetic val$add:I

.field final synthetic val$filename:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1838
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$2;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;

    iput p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$2;->val$add:I

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$2;->val$filename:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 4

    .line 1840
    iget v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$2;->val$add:I

    if-lez v0, :cond_1

    if-nez p1, :cond_0

    .line 1842
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$2;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$2;->val$filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mgoToQuickFolder(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/lang/String;)V

    return-void

    :cond_0
    sub-int/2addr p1, v0

    .line 1848
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$2;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v1, Lcom/flyersoft/tools/A;->files_from:I

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fputfileOperationFrom(Lcom/flyersoft/moonreaderp/ActivityMain;I)V

    .line 1849
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$2;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selectedFiles:Ljava/util/ArrayList;

    .line 1850
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$2;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selectedFiles:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$2;->val$filename:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v0, 0x0

    if-nez p1, :cond_3

    .line 1852
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$2;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->isLocal()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1853
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$2;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$2;->val$filename:Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->importSingleBook(Ljava/lang/String;Z)V

    goto :goto_0

    .line 1855
    :cond_2
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$2;->val$filename:Ljava/lang/String;

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/components/cloud/Cloud;->FileList([Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/components/cloud/Sync;->addCloudFilesToShelf(Ljava/util/ArrayList;)V

    :cond_3
    :goto_0
    const/4 v1, 0x1

    if-ne p1, v1, :cond_5

    .line 1860
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$2;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->isLocal()Z

    move-result v2

    if-nez v2, :cond_4

    .line 1861
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$2;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$2;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->selectedFiles:Ljava/util/ArrayList;

    invoke-static {v2, v3}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mdeleteCloudFiles(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/util/ArrayList;)V

    goto :goto_1

    .line 1863
    :cond_4
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$2;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v2, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mdeleteSelectedFiles(Lcom/flyersoft/moonreaderp/ActivityMain;Z)V

    :cond_5
    :goto_1
    const/4 v2, 0x3

    if-ne p1, v2, :cond_6

    .line 1866
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$2;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-boolean v0, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->isMoveFile:Z

    .line 1867
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$2;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mshowPasteBar(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    :cond_6
    const/4 v0, 0x4

    if-ne p1, v0, :cond_7

    .line 1870
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$2;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-boolean v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->isMoveFile:Z

    .line 1871
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$2;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mshowPasteBar(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    :cond_7
    const/4 v0, 0x5

    if-ne p1, v0, :cond_8

    .line 1874
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$2;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$2;->val$filename:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mrenameBookFile(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/lang/String;)V

    :cond_8
    const/4 v0, 0x7

    if-ne p1, v0, :cond_9

    .line 1875
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$2;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->isLocal()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 1876
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$2;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$2;->val$filename:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/compress/BaseCompressor;->getZRCacheFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flyersoft/tools/A;->sendFile(Landroid/content/Context;Ljava/lang/String;)V

    :cond_9
    const/16 v0, 0x8

    if-ne p1, v0, :cond_a

    .line 1877
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$2;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->isLocal()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 1878
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$2;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$2;->val$filename:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/flyersoft/tools/T;->openFileWithDefaultApp(Landroid/app/Activity;Ljava/lang/String;)V

    :cond_a
    const/16 v0, 0x9

    if-ne p1, v0, :cond_b

    .line 1879
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$2;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->isLocal()Z

    move-result p1

    if-eqz p1, :cond_b

    .line 1880
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$2;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FilesAdapter$5$2;->val$filename:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->do_add_desktop(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    :cond_b
    return-void
.end method
