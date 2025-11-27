.class Lcom/flyersoft/moonreaderp/ActivityMain$26;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefDownloadCover$OnSaveImage;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->download_cover(Ljava/lang/String;Lcom/flyersoft/tools/BookDb$BookInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$targetBi:Lcom/flyersoft/tools/BookDb$BookInfo;

.field final synthetic val$targetFullname:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/lang/String;Lcom/flyersoft/tools/BookDb$BookInfo;)V
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

    .line 2795
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$26;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$26;->val$targetFullname:Ljava/lang/String;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$26;->val$targetBi:Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetImageFile(Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V
    .locals 0

    if-nez p2, :cond_0

    return-void

    .line 2799
    :cond_0
    invoke-static {p2, p1}, Lcom/flyersoft/tools/T;->drawableToFile(Landroid/graphics/drawable/Drawable;Ljava/lang/String;)Z

    .line 2800
    invoke-static {p1}, Lcom/flyersoft/tools/A;->deleteShelfImageCache(Ljava/lang/String;)V

    .line 2801
    sget p1, Lcom/flyersoft/tools/A;->lastTab:I

    if-nez p1, :cond_1

    .line 2802
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$26;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->recentLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->myNotifyDataSetChanged(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 2803
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$26;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->recentRv:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->myNotifyDataSetChanged(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 2804
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$26;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateFavRvAdapter()V

    .line 2806
    :cond_1
    sget p1, Lcom/flyersoft/tools/A;->lastTab:I

    const/4 p2, 0x2

    if-ne p1, p2, :cond_2

    .line 2807
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$26;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->fileLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->myNotifyDataSetChanged(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 2808
    :cond_2
    sget p1, Lcom/flyersoft/tools/A;->lastTab:I

    const/4 p2, 0x1

    if-ne p1, p2, :cond_3

    .line 2809
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$26;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->getShelfBooksAdapter()Lcom/flyersoft/moonreaderp/ActivityMain$MultiSelect;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->myNotifyDataSetChanged(Lcom/flyersoft/moonreaderp/ActivityMain$MultiSelect;)V

    .line 2810
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->updateGroupShelf()Z

    .line 2812
    :cond_3
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$26;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->groupCoverCaches:Ljava/util/HashMap;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$26;->val$targetFullname:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2813
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$26;->val$targetBi:Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-static {p1}, Lcom/flyersoft/components/cloud/Sync;->uploadShelfBookCover(Lcom/flyersoft/tools/BookDb$BookInfo;)V

    return-void
.end method
