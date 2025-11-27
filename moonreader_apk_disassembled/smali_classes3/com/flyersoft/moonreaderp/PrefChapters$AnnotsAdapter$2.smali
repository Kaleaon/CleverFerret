.class Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$2;
.super Ljava/lang/Object;
.source "PrefChapters.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1473
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 2

    .line 1475
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->checked:[Z

    array-length v0, v0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters;->annots:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-eq v0, v1, :cond_0

    .line 1476
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters;->annots:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v1, v1, [Z

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->checked:[Z

    .line 1477
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 1478
    sget-boolean v0, Lcom/flyersoft/tools/A;->chapterReversed:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    .line 1479
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->getItemCount()I

    move-result v0

    sub-int/2addr v0, p1

    add-int/lit8 p1, v0, -0x1

    .line 1480
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    invoke-virtual {v0, p1}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->inverseChecked(I)V

    .line 1481
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$msetNoteDeleteVisble(Lcom/flyersoft/moonreaderp/PrefChapters;)V

    .line 1482
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->getSelectedCount()I

    move-result v0

    if-lez v0, :cond_2

    .line 1483
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->annotLvItemTouch:Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;

    invoke-virtual {v0, p1}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->setStartSelectPosition(I)V

    :cond_2
    return v1
.end method
