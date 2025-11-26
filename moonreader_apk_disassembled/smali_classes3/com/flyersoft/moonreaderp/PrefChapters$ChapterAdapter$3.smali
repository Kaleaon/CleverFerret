.class Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter$3;
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

    .line 771
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6

    .line 774
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$fgetnToc(Lcom/flyersoft/moonreaderp/PrefChapters;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;

    iget v1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->index:I

    .line 775
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->isEbook()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 776
    sget-object p1, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {p1, v1}, Lcom/flyersoft/books/BaseEBook;->clearChapterSpanned(I)V

    .line 777
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v0, p1, Lcom/flyersoft/moonreaderp/PrefChapters;->onChangeChapter:Lcom/flyersoft/moonreaderp/PrefChapters$OnChangeChapter;

    const-wide/16 v3, 0x0

    const/4 v5, 0x1

    const/4 v2, 0x0

    invoke-interface/range {v0 .. v5}, Lcom/flyersoft/moonreaderp/PrefChapters$OnChangeChapter;->onGetChapter(IIJZ)V

    .line 778
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->dismiss()V

    return-void
.end method
