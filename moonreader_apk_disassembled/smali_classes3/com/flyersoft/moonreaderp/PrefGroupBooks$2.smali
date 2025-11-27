.class Lcom/flyersoft/moonreaderp/PrefGroupBooks$2;
.super Ljava/lang/Object;
.source "PrefGroupBooks.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefGroupBooks;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefGroupBooks;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 162
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$2;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 165
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$2;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->titleEt:Lcom/flyersoft/views/ClearableEditText;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/ClearableEditText;->setVisibility(I)V

    .line 166
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$2;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    sget v2, Lcom/flyersoft/tools/A;->shelfCoverSize:I

    mul-int/lit8 v2, v2, 0x55

    div-int/lit8 v2, v2, 0x64

    iput v2, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->shelfCoverSize:I

    .line 167
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$2;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->initColumnCount()V

    .line 168
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$2;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    new-instance v2, Lcom/flyersoft/views/recyclerview/MyGridLayoutManager;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$2;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    invoke-virtual {v3}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$2;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    invoke-static {v4}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->-$$Nest$fgetshelfColumn(Lcom/flyersoft/moonreaderp/PrefGroupBooks;)I

    move-result v4

    const/4 v5, 0x1

    invoke-direct {v2, v3, v4, v5, v1}, Lcom/flyersoft/views/recyclerview/MyGridLayoutManager;-><init>(Landroid/content/Context;IIZ)V

    invoke-virtual {v0, v2}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 169
    new-instance v0, Landroidx/recyclerview/widget/ItemTouchHelper;

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$2;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    invoke-direct {v2, v3}, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;-><init>(Lcom/flyersoft/moonreaderp/PrefGroupBooks;)V

    invoke-direct {v0, v2}, Landroidx/recyclerview/widget/ItemTouchHelper;-><init>(Landroidx/recyclerview/widget/ItemTouchHelper$Callback;)V

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$2;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/ItemTouchHelper;->attachToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 170
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$2;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$2;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    invoke-direct {v2, v3}, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;-><init>(Lcom/flyersoft/moonreaderp/PrefGroupBooks;)V

    iput-object v2, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->groupAdapter:Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;

    .line 171
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$2;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$2;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->groupAdapter:Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;

    invoke-virtual {v0, v2}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setAdapter(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;)V

    .line 173
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$2;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v2, "pop_group"

    invoke-virtual {v0, v2, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 174
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$2;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$2;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rootBi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v3, v3, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-interface {v0, v3, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$2;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rootBi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v5, v5, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "##"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    invoke-virtual {v2, v3, v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->myScrollTo(II)Z

    .line 180
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$2;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->titleEt:Lcom/flyersoft/views/ClearableEditText;

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/ClearableEditText;->setClearIconVisible(Z)V

    return-void
.end method
