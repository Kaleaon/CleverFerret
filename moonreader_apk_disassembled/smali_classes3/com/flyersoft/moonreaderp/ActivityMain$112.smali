.class Lcom/flyersoft/moonreaderp/ActivityMain$112;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefEditBook$OnBookEdited;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->importSingleBook(Landroid/content/Context;Ljava/lang/String;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$isNewBook:Z


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Z)V
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

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 9872
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$112;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-boolean p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$112;->val$isNewBook:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSaveBookInfo()V
    .locals 2

    .line 9874
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$112;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->show_select_state(Z)V

    .line 9875
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$112;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateFavRvAdapter()V

    .line 9876
    sget v0, Lcom/flyersoft/tools/A;->lastTab:I

    if-nez v0, :cond_0

    .line 9877
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$112;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->recentLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->myNotifyDataSetChanged(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 9878
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$112;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->recentRv:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->myNotifyDataSetChanged(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 9880
    :cond_0
    sget v0, Lcom/flyersoft/tools/A;->lastTab:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 9881
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$112;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->fileLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->myNotifyDataSetChanged(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 9882
    :cond_1
    sget v0, Lcom/flyersoft/tools/A;->lastTab:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_2

    .line 9883
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$112;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->getShelfBooksAdapter()Lcom/flyersoft/moonreaderp/ActivityMain$MultiSelect;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->myNotifyDataSetChanged(Lcom/flyersoft/moonreaderp/ActivityMain$MultiSelect;)V

    goto :goto_0

    .line 9885
    :cond_2
    sput-boolean v1, Lcom/flyersoft/tools/A;->shelfForceUpdate:Z

    .line 9886
    :goto_0
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$112;->val$isNewBook:Z

    if-eqz v0, :cond_3

    .line 9887
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$112;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/16 v1, 0xc8

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->checkIfSyncShelfBooksToCloud(I)V

    :cond_3
    return-void
.end method
