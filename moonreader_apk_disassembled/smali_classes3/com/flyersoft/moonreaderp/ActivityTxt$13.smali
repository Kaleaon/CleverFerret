.class Lcom/flyersoft/moonreaderp/ActivityTxt$13;
.super Ljava/lang/Thread;
.source "ActivityTxt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->loadNotes()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1668
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$13;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    const/4 v0, 0x1

    .line 1673
    :try_start_0
    invoke-static {v0}, Lcom/flyersoft/tools/A;->checkNotesHighlights(Z)V

    .line 1674
    invoke-static {v0}, Lcom/flyersoft/tools/A;->getBookmarks(Z)Ljava/util/ArrayList;

    .line 1675
    sput-boolean v0, Lcom/flyersoft/tools/A;->highlighInited:Z

    .line 1676
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$13;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->postInvalidate()V

    .line 1677
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$13;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->postInvalidate()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 1679
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 1681
    :goto_0
    sget v0, Lcom/flyersoft/tools/A;->syncType:I

    if-eqz v0, :cond_0

    sget-boolean v0, Lcom/flyersoft/tools/A;->syncManually:Z

    if-nez v0, :cond_0

    .line 1682
    sget-boolean v0, Lcom/flyersoft/tools/A;->syncProgress:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 1683
    sget-boolean v1, Lcom/flyersoft/tools/A;->showSyncMsg:Z

    invoke-static {v0, v1}, Lcom/flyersoft/components/cloud/Sync;->downloadCloudPositionFile(ZZ)V

    :cond_0
    return-void
.end method
