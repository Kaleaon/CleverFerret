.class Lcom/flyersoft/moonreaderp/PrefChapters$10;
.super Landroid/os/Handler;
.source "PrefChapters.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefChapters;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefChapters;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefChapters;Landroid/os/Looper;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 571
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$10;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    .line 574
    iget p1, p1, Landroid/os/Message;->what:I

    const/16 v0, 0x3e7

    if-ne p1, v0, :cond_0

    .line 575
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$10;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters;->reverseB:Landroid/widget/ImageView;

    const/high16 v0, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Lcom/flyersoft/tools/miscellaneous/AnimalTools;->startJdllyAnimal(Landroid/view/View;FZ)V

    return-void

    .line 578
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$10;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$mgetCurChapterId(Lcom/flyersoft/moonreaderp/PrefChapters;)I

    move-result p1

    if-lez p1, :cond_2

    .line 580
    sget-boolean v0, Lcom/flyersoft/tools/A;->chapterReversed:Z

    if-eqz v0, :cond_1

    .line 581
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$10;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$fgetnToc(Lcom/flyersoft/moonreaderp/PrefChapters;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int/2addr v0, p1

    add-int/lit8 p1, v0, -0x1

    .line 582
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$10;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->chapterList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v0, p1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->myScrollTo(I)Z

    :cond_2
    return-void
.end method
