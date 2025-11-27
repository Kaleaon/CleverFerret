.class Lcom/flyersoft/moonreaderp/PrefYearStatistics$BooksRvAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "PrefYearStatistics.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefYearStatistics;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "BooksRvAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefYearStatistics;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 569
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BooksRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .line 605
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BooksRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->selectedBooks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 7

    .line 578
    move-object v0, p1

    check-cast v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;

    .line 579
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result p1

    iput p1, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;->position:I

    .line 580
    iget p1, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;->position:I

    if-ltz p1, :cond_2

    iget p1, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;->position:I

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BooksRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->selectedBooks:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt p1, v1, :cond_0

    goto/16 :goto_0

    .line 583
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BooksRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->selectedBooks:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/tools/BookDb$ReadStatistics;

    .line 584
    iget-object v1, p1, Lcom/flyersoft/tools/BookDb$ReadStatistics;->filename:Ljava/lang/String;

    .line 585
    iget-object v2, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;->base:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->gauge:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 586
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BooksRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->act:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;->cover:Lcom/flyersoft/views/ShelfImageView;

    const/4 v4, 0x0

    iget-object v5, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;->bookName2:Landroid/widget/TextView;

    invoke-virtual {v2, v3, v1, v4, v5}, Lcom/flyersoft/moonreaderp/ActivityMain;->drawBookView(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;ZLandroid/view/View;)V

    .line 587
    iget-object v2, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;->bookName2:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getVisibility()I

    move-result v2

    if-nez v2, :cond_1

    .line 588
    iget-object v2, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;->bookName2:Landroid/widget/TextView;

    const/high16 v3, 0x41100000    # 9.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 589
    iget-object v2, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;->bookName2:Landroid/widget/TextView;

    const/high16 v3, 0x40c00000    # 6.0f

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v5

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v6

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    invoke-virtual {v2, v4, v5, v6, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 590
    iget-object v2, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;->bookName2:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BooksRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->act:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v1}, Lcom/flyersoft/tools/BookDb;->getBookFromAll(Ljava/lang/String;)Lcom/flyersoft/tools/BookDb$BookInfo;

    move-result-object v4

    invoke-virtual {v3, v1, v4}, Lcom/flyersoft/moonreaderp/ActivityMain;->getBookName2(Ljava/lang/String;Lcom/flyersoft/tools/BookDb$BookInfo;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 592
    :cond_1
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;->menuB:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    const/high16 v2, 0x41e00000    # 28.0f

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    iput v3, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 593
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;->menuB:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 594
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;->menuB:Landroid/view/View;

    const/4 v2, 0x0

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    const/high16 v3, 0x41400000    # 12.0f

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    const/high16 v4, 0x41600000    # 14.0f

    invoke-static {v4}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    const/high16 v5, 0x40800000    # 4.0f

    invoke-static {v5}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v5

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/view/View;->setPadding(IIII)V

    .line 595
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;->menuB:Landroid/view/View;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {v1, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 597
    iget-wide v1, p1, Lcom/flyersoft/tools/BookDb$ReadStatistics;->usedTimeInDays:J

    long-to-float p2, v1

    const-wide/16 v1, 0x1

    invoke-static {v1, v2}, Lcom/flyersoft/tools/T;->minute(J)J

    move-result-wide v3

    long-to-float v3, v3

    div-float/2addr p2, v3

    .line 598
    iget-wide v3, p1, Lcom/flyersoft/tools/BookDb$ReadStatistics;->usedTimeInDays:J

    long-to-float v3, v3

    invoke-static {v1, v2}, Lcom/flyersoft/tools/T;->hour(J)J

    move-result-wide v1

    long-to-float v1, v1

    div-float/2addr v3, v1

    .line 599
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;->timeTv:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BooksRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    const/4 v4, 0x1

    invoke-static {v2, p2, v3, v4}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->-$$Nest$mtimeLabel(Lcom/flyersoft/moonreaderp/PrefYearStatistics;FFZ)Landroid/text/Spanned;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 600
    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;->speedTv:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BooksRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-wide v2, p1, Lcom/flyersoft/tools/BookDb$ReadStatistics;->readWordsInDays:J

    invoke-static {v1, p2, v2, v3, v4}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->-$$Nest$mspeedLabel(Lcom/flyersoft/moonreaderp/PrefYearStatistics;FJZ)Landroid/text/Spanned;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_2
    :goto_0
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 1

    .line 572
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BooksRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->con:Landroid/content/Context;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    sget p2, Lcom/flyersoft/moonreaderp/R$layout;->statistics_book:I

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    .line 573
    new-instance p2, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BooksRvAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    invoke-direct {p2, v0, p1}, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;-><init>(Lcom/flyersoft/moonreaderp/PrefYearStatistics;Landroid/view/View;)V

    return-object p2
.end method
