.class Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter$2;
.super Ljava/lang/Object;
.source "PrefChapters.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 679
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 681
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    .line 682
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$fgetnToc(Lcom/flyersoft/moonreaderp/PrefChapters;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;

    const/4 v0, 0x0

    .line 683
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-static {v1}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$fgetoToc(Lcom/flyersoft/moonreaderp/PrefChapters;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 684
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-static {v1}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$fgetoToc(Lcom/flyersoft/moonreaderp/PrefChapters;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;

    iget v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->index:I

    iget v2, p1, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->index:I

    if-ne v1, v2, :cond_0

    .line 685
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$fgetoToc(Lcom/flyersoft/moonreaderp/PrefChapters;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;

    .line 686
    iget-boolean v0, p1, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->expanded:Z

    xor-int/lit8 v0, v0, 0x1

    iput-boolean v0, p1, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->expanded:Z

    .line 687
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$mudpateBookChapterExpandedState(Lcom/flyersoft/moonreaderp/PrefChapters;Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;)V

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 690
    :cond_1
    :goto_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->createToc()V

    .line 691
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$mupdateTocExpandIv(Lcom/flyersoft/moonreaderp/PrefChapters;)V

    .line 692
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->notifyDataSetChanged()V

    return-void
.end method
