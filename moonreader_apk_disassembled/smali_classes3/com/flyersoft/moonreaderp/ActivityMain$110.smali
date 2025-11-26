.class Lcom/flyersoft/moonreaderp/ActivityMain$110;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->removeBooksFromShelf(Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$books:Ljava/util/ArrayList;

.field final synthetic val$delCb:Landroid/widget/CheckBox;

.field final synthetic val$favCb:Landroid/widget/CheckBox;

.field final synthetic val$groupCb:Landroid/widget/CheckBox;

.field final synthetic val$removeFav:Z


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/util/ArrayList;Landroid/widget/CheckBox;ZLandroid/widget/CheckBox;Landroid/widget/CheckBox;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null,
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

    .line 9758
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$110;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$110;->val$books:Ljava/util/ArrayList;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$110;->val$groupCb:Landroid/widget/CheckBox;

    iput-boolean p4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$110;->val$removeFav:Z

    iput-object p5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$110;->val$favCb:Landroid/widget/CheckBox;

    iput-object p6, p0, Lcom/flyersoft/moonreaderp/ActivityMain$110;->val$delCb:Landroid/widget/CheckBox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    .line 9760
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$110;->val$books:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    .line 9761
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$110;->val$groupCb:Landroid/widget/CheckBox;

    if-eqz p2, :cond_3

    invoke-virtual {p2}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p2

    if-eqz p2, :cond_3

    .line 9762
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$110;->val$books:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-virtual {v0}, Lcom/flyersoft/tools/BookDb$BookInfo;->isGroup()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 9763
    iget-object v0, v0, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 9764
    sget-object v2, Lcom/flyersoft/tools/A;->listShelfBookCaches:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/tools/BookDb$BookInfo;

    if-nez v2, :cond_2

    .line 9766
    invoke-static {v1}, Lcom/flyersoft/tools/BookDb;->getBook(Ljava/lang/String;)Lcom/flyersoft/tools/BookDb$BookInfo;

    move-result-object v2

    :cond_2
    if-eqz v2, :cond_1

    .line 9768
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 9772
    :cond_3
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_4
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p2, :cond_9

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 9773
    iget-boolean v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$110;->val$removeFav:Z

    if-eqz v2, :cond_6

    .line 9774
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$110;->val$favCb:Landroid/widget/CheckBox;

    invoke-virtual {v2}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 9775
    iget-object v1, p2, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v1, p2}, Lcom/flyersoft/tools/BookDb;->deleteBook(Ljava/lang/String;Lcom/flyersoft/tools/BookDb$BookInfo;)I

    goto :goto_2

    .line 9777
    :cond_5
    const-string v2, ""

    iput-object v2, p2, Lcom/flyersoft/tools/BookDb$BookInfo;->favorite:Ljava/lang/String;

    .line 9778
    invoke-static {p2, v1}, Lcom/flyersoft/tools/BookDb;->insertBook(Lcom/flyersoft/tools/BookDb$BookInfo;Z)J

    goto :goto_2

    .line 9782
    :cond_6
    iget-object v1, p2, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v1, p2}, Lcom/flyersoft/tools/BookDb;->deleteBook(Ljava/lang/String;Lcom/flyersoft/tools/BookDb$BookInfo;)I

    .line 9784
    :goto_2
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$110;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->listShelfBooks:Ljava/util/ArrayList;

    if-eqz v1, :cond_7

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$110;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 9785
    :cond_7
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$110;->val$delCb:Landroid/widget/CheckBox;

    invoke-virtual {v1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 9786
    sget v1, Lcom/flyersoft/tools/A;->files_type:I

    if-nez v1, :cond_8

    iget-object v1, p2, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/flyersoft/tools/A;->lastPath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 9787
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$110;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v2, -0x1

    invoke-static {v1, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fputfolderFileCount(Lcom/flyersoft/moonreaderp/ActivityMain;I)V

    .line 9788
    :cond_8
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$110;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p2, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-virtual {v1, p2, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->deleteSingeBook(Ljava/lang/String;Z)Z

    goto :goto_1

    .line 9791
    :cond_9
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$110;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->show_select_state(Z)V

    .line 9792
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$110;->val$groupCb:Landroid/widget/CheckBox;

    if-eqz p1, :cond_a

    .line 9793
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$110;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateShelf()V

    goto :goto_3

    .line 9795
    :cond_a
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$110;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfLv:Lcom/flyersoft/views/BookShelfView;

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->myNotifyDataSetChanged(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 9796
    :goto_3
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$110;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateFavRvAdapter()V

    .line 9797
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$110;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1, v1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateRecentList(ZZ)V

    .line 9798
    invoke-static {}, Lcom/flyersoft/tools/A;->saveAllShelfSorts()V

    .line 9799
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$110;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mupdateListShelfBooksIndex(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    return-void
.end method
