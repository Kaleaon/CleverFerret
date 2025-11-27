.class Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "PrefBookCalendar.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefBookCalendar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "BookViewHolder"
.end annotation


# instance fields
.field base:Landroid/view/View;

.field bookName2:Landroid/widget/TextView;

.field cover:Lcom/flyersoft/views/ShelfImageView;

.field menuB:Landroid/view/View;

.field onAnnotBookOverflowClick:Landroid/view/View$OnClickListener;

.field position:I

.field speedTv:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

.field timeTv:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Lcom/flyersoft/moonreaderp/PrefBookCalendar;Landroid/view/View;)V
    .locals 2
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

    .line 541
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    .line 542
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 571
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder$1;-><init>(Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder;)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder;->onAnnotBookOverflowClick:Landroid/view/View$OnClickListener;

    .line 543
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->coverGrid:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder;->base:Landroid/view/View;

    .line 544
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->timeTv:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder;->timeTv:Landroid/widget/TextView;

    .line 545
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->speedTv:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder;->speedTv:Landroid/widget/TextView;

    .line 547
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder;->timeTv:Landroid/widget/TextView;

    invoke-static {}, Lcom/flyersoft/tools/C;->secondTextColor()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 548
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder;->speedTv:Landroid/widget/TextView;

    invoke-static {}, Lcom/flyersoft/tools/C;->secondTextColor()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 550
    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder;->base:Landroid/view/View;

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateCardViewNightMode(Landroid/view/View;Z)V

    .line 551
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder;->base:Landroid/view/View;

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->myBookName2:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder;->bookName2:Landroid/widget/TextView;

    .line 552
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder;->base:Landroid/view/View;

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->myBookImage:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/views/ShelfImageView;

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder;->cover:Lcom/flyersoft/views/ShelfImageView;

    .line 553
    iput-boolean v1, p1, Lcom/flyersoft/views/ShelfImageView;->forceNoShadow:Z

    .line 554
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder;->base:Landroid/view/View;

    invoke-virtual {p1, v1}, Landroid/view/View;->setFocusable(Z)V

    .line 555
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder;->base:Landroid/view/View;

    sget v0, Lcom/flyersoft/material/components/icons/R$drawable;->my_list_selector:I

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 556
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder;->base:Landroid/view/View;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 559
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v0, 0x428c0000    # 70.0f

    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    const/high16 v1, 0x43040000    # 132.0f

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    invoke-direct {p1, v0, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p2, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 561
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder;->base:Landroid/view/View;

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->overflow1:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder;->menuB:Landroid/view/View;

    .line 562
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder;->onAnnotBookOverflowClick:Landroid/view/View$OnClickListener;

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 567
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->selectedBooks:Ljava/util/ArrayList;

    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder;->position:I

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/tools/BookDb$ReadStatistics;

    iget-object p1, p1, Lcom/flyersoft/tools/BookDb$ReadStatistics;->filename:Ljava/lang/String;

    .line 568
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->openFile(Ljava/lang/String;)V

    return-void
.end method
