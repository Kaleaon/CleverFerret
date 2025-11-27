.class Lcom/flyersoft/moonreaderp/PrefChapters$3;
.super Ljava/lang/Object;
.source "PrefChapters.java"

# interfaces
.implements Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefChapters;->show_chapter(Z)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefChapters;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefChapters;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 360
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$3;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public refresh(I)V
    .locals 2

    const/4 p1, 0x1

    .line 363
    new-array p1, p1, [Ljava/lang/Object;

    const-string v0, "show chapter totalPageNum"

    const/4 v1, 0x0

    aput-object v0, p1, v1

    invoke-static {p1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 364
    sget-object p1, Lcom/flyersoft/moonreaderp/PrefChapters;->selfPref:Lcom/flyersoft/moonreaderp/PrefChapters;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$3;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters;->chapterList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$3;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters;->chapterList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {p1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 365
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$3;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters;->chapterList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefChapters$3$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$3$1;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters$3;)V

    invoke-virtual {p1, v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method
