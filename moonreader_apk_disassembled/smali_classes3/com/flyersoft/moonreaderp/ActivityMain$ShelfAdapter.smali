.class Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;
.super Lcom/flyersoft/moonreaderp/ActivityMain$MultiSelectRvAdapter;
.source "ActivityMain.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ShelfAdapter"
.end annotation


# instance fields
.field bookCount:Ljava/lang/Integer;

.field public checked:[Z

.field focustItem:I

.field isGrid:Z

.field itemCount:Ljava/lang/Integer;

.field public longTapSelectItem:I

.field measureNameLayHeight:Ljava/lang/Integer;

.field onBookAuthorClick:Landroid/view/View$OnClickListener;

.field onBookClick:Landroid/view/View$OnClickListener;

.field onBookLongClick:Landroid/view/View$OnLongClickListener;

.field onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method public constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 8300
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain$MultiSelectRvAdapter;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    const/4 p1, -0x1

    .line 8333
    iput p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->focustItem:I

    .line 8455
    new-instance p1, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter$1;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

    .line 8644
    new-instance p1, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter$2;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter$2;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->onBookAuthorClick:Landroid/view/View$OnClickListener;

    .line 8722
    new-instance p1, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter$3;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter$3;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->onBookClick:Landroid/view/View$OnClickListener;

    .line 8739
    new-instance p1, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter$4;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter$4;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->onBookLongClick:Landroid/view/View$OnLongClickListener;

    .line 8301
    sget p1, Lcom/flyersoft/tools/A;->shelfStyle:I

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->isGrid:Z

    .line 8302
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->resetChecked()V

    return-void
.end method

.method private checkCoverHeightAndSetBackground(ILandroid/view/View;Z)V
    .locals 9

    .line 8662
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->myBookImage:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez p3, :cond_0

    .line 8663
    iget-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->checked:[Z

    array-length v3, p3

    if-ge p1, v3, :cond_0

    aget-boolean p3, p3, p1

    if-eqz p3, :cond_0

    const/4 p3, 0x1

    goto :goto_0

    :cond_0
    const/4 p3, 0x0

    .line 8665
    :goto_0
    iget-boolean v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->isGrid:Z

    const/16 v4, 0x387

    const/16 v5, 0x46

    const/16 v6, 0x64

    const/4 v7, -0x1

    if-nez v3, :cond_5

    .line 8666
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v3

    if-nez v3, :cond_4

    .line 8667
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v8, Lcom/flyersoft/tools/A;->shelfCoverSize:I

    invoke-virtual {v3, v8}, Lcom/flyersoft/moonreaderp/ActivityMain;->listStyleBookHeight(I)I

    move-result v3

    .line 8668
    invoke-virtual {p2, v2, v2}, Landroid/view/View;->measure(II)V

    .line 8669
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 8670
    sget-boolean v8, Lcom/flyersoft/tools/A;->woody:Z

    if-eqz v8, :cond_1

    const/16 v5, 0x4a

    :cond_1
    mul-int v5, v5, v3

    div-int/2addr v5, v6

    invoke-direct {v2, v5, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v3, 0x11

    .line 8671
    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 8672
    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 8673
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetshelfColumn(Lcom/flyersoft/moonreaderp/ActivityMain;)I

    move-result v0

    const/4 v2, -0x2

    if-le v0, v1, :cond_2

    .line 8674
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v7, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v1, 0x40a00000    # 5.0f

    .line 8675
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 8676
    invoke-virtual {p2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_1

    .line 8678
    :cond_2
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v0, v7, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 8679
    :goto_1
    sget-boolean v0, Lcom/flyersoft/tools/A;->woody:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfLv:Lcom/flyersoft/views/BookShelfView;

    iget-boolean v0, v0, Lcom/flyersoft/views/BookShelfView;->woodyHeightInited:Z

    if-nez v0, :cond_3

    .line 8680
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfLv:Lcom/flyersoft/views/BookShelfView;

    invoke-virtual {v0, p2}, Lcom/flyersoft/views/BookShelfView;->initWoodyRowHeight(Landroid/view/View;)V

    .line 8681
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->handler:Landroid/os/Handler;

    invoke-virtual {v1, v4, p2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 8683
    :cond_4
    invoke-virtual {p0, p1, p2, p3}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->drawSelectedState(ILandroid/view/View;Z)V

    return-void

    .line 8685
    :cond_5
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->isCoverHeightError(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 8686
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->coverWidth:I

    sget-boolean v3, Lcom/flyersoft/tools/A;->woody:Z

    if-eqz v3, :cond_6

    const/16 v6, 0x5e

    :cond_6
    mul-int v1, v1, v6

    div-int/2addr v1, v5

    .line 8687
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v7, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 8688
    sget-boolean v0, Lcom/flyersoft/tools/A;->woody:Z

    if-nez v0, :cond_9

    .line 8689
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->nameLay:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 8690
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->measureNameLayHeight:Ljava/lang/Integer;

    if-nez v3, :cond_7

    .line 8691
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->myBookName:I

    invoke-virtual {p2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 8692
    sget v5, Lcom/flyersoft/tools/A;->shelfFontSize:I

    add-int/lit8 v5, v5, -0x4

    int-to-float v5, v5

    const v6, 0x3dcccccd    # 0.1f

    add-float/2addr v5, v6

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setTextSize(F)V

    .line 8693
    invoke-virtual {v0, v2, v2}, Landroid/view/View;->measure(II)V

    .line 8694
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v2

    const/4 v3, 0x0

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    add-int/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iput-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->measureNameLayHeight:Ljava/lang/Integer;

    .line 8696
    :cond_7
    sget v2, Lcom/flyersoft/tools/A;->shelfFontSize:I

    mul-int/lit8 v2, v2, 0x20

    mul-int v1, v1, v2

    div-int/lit16 v1, v1, 0x640

    .line 8697
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->measureNameLayHeight:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ge v1, v2, :cond_8

    .line 8698
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->measureNameLayHeight:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 8699
    :cond_8
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v7, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_2

    .line 8700
    :cond_9
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfLv:Lcom/flyersoft/views/BookShelfView;

    iget-boolean v0, v0, Lcom/flyersoft/views/BookShelfView;->woodyHeightInited:Z

    if-nez v0, :cond_a

    .line 8701
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfLv:Lcom/flyersoft/views/BookShelfView;

    invoke-virtual {v0, p2}, Lcom/flyersoft/views/BookShelfView;->initWoodyRowHeight(Landroid/view/View;)V

    .line 8702
    :cond_a
    :goto_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->handler:Landroid/os/Handler;

    invoke-virtual {v1, v4, p2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 8704
    :cond_b
    invoke-virtual {p0, p1, p2, p3}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->drawSelectedState(ILandroid/view/View;Z)V

    return-void
.end method


# virtual methods
.method public clearChecked()V
    .locals 6

    .line 8353
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->checked:[Z

    .line 8354
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->resetChecked()V

    .line 8356
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfLv:Lcom/flyersoft/views/BookShelfView;

    invoke-virtual {v1}, Lcom/flyersoft/views/BookShelfView;->findFirstVisibleItem()I

    move-result v1

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetshelfColumn(Lcom/flyersoft/moonreaderp/ActivityMain;)I

    move-result v2

    sub-int/2addr v1, v2

    .line 8357
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfLv:Lcom/flyersoft/views/BookShelfView;

    invoke-virtual {v2}, Lcom/flyersoft/views/BookShelfView;->findLastVisibleItem()I

    move-result v2

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v3}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetshelfColumn(Lcom/flyersoft/moonreaderp/ActivityMain;)I

    move-result v3

    add-int/2addr v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 8358
    :goto_0
    array-length v5, v0

    if-ge v4, v5, :cond_1

    .line 8359
    aget-boolean v5, v0, v4

    if-eqz v5, :cond_0

    if-lt v4, v1, :cond_0

    if-gt v4, v2, :cond_0

    .line 8360
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {p0, v4, v5}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->notifyItemChanged(ILjava/lang/Object;)V

    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, -0x1

    .line 8362
    iput v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->longTapSelectItem:I

    return-void
.end method

.method public drawSelectedState(ILandroid/view/View;Z)V
    .locals 1

    .line 8709
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->overLay:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    if-nez p2, :cond_0

    return-void

    :cond_0
    if-eqz p3, :cond_1

    .line 8712
    new-instance p3, Landroid/graphics/drawable/ColorDrawable;

    const v0, 0x502196f3

    invoke-direct {p3, v0}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    goto :goto_0

    .line 8713
    :cond_1
    iget-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v0, Lcom/flyersoft/material/components/icons/R$drawable;->my_list_selector:I

    invoke-virtual {p3, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p3

    .line 8714
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->mergeTarget:I

    if-ne p1, v0, :cond_2

    .line 8715
    new-instance p3, Landroid/graphics/drawable/ColorDrawable;

    const p1, 0x702196f3    # 2.000383E29f

    invoke-direct {p3, p1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 8716
    :cond_2
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x17

    if-lt p1, v0, :cond_3

    .line 8717
    invoke-static {p2, p3}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    return-void

    .line 8719
    :cond_3
    invoke-virtual {p2, p3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public fillItemData(ILandroid/view/View;Z)V
    .locals 21

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, p2

    .line 8463
    iget-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x4

    if-lt v1, v3, :cond_0

    .line 8464
    invoke-direct/range {p0 .. p3}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->checkCoverHeightAndSetBackground(ILandroid/view/View;Z)V

    .line 8465
    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_0
    const/4 v3, 0x0

    .line 8468
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 8469
    sget v5, Lcom/flyersoft/moonreaderp/R$id;->delete:I

    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    const/16 v6, 0x8

    invoke-virtual {v5, v6}, Landroid/view/View;->setVisibility(I)V

    .line 8471
    iget v5, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->focustItem:I

    const/4 v7, -0x1

    if-ne v5, v1, :cond_1

    .line 8472
    iput v7, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->focustItem:I

    const/high16 v5, 0x3f800000    # 1.0f

    .line 8473
    invoke-static {v2, v5, v3}, Lcom/flyersoft/tools/miscellaneous/AnimalTools;->startJdllyAnimal(Landroid/view/View;FZ)V

    .line 8476
    :cond_1
    sget v5, Lcom/flyersoft/moonreaderp/R$id;->myBookImage:I

    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/flyersoft/views/ShelfImageView;

    const/4 v8, 0x1

    .line 8477
    iput-boolean v8, v5, Lcom/flyersoft/views/ShelfImageView;->isShelfCover:Z

    .line 8478
    iget-boolean v9, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->isGrid:Z

    if-nez v9, :cond_2

    sget-boolean v9, Lcom/flyersoft/tools/A;->mainNightTheme:Z

    if-nez v9, :cond_2

    sget-boolean v9, Lcom/flyersoft/tools/A;->woody:Z

    if-nez v9, :cond_2

    .line 8479
    iput-boolean v8, v5, Lcom/flyersoft/views/ShelfImageView;->forceHasShadow:Z

    .line 8480
    sget v9, Lcom/flyersoft/moonreaderp/R$drawable;->list_bookshadow_light:I

    iput v9, v5, Lcom/flyersoft/views/ShelfImageView;->shadowRes:I

    .line 8482
    :cond_2
    invoke-virtual {v5}, Lcom/flyersoft/views/ShelfImageView;->initPadding()V

    .line 8483
    instance-of v9, v2, Lcom/flyersoft/views/recyclerview/SizeLinearLayout;

    if-eqz v9, :cond_3

    .line 8484
    move-object v9, v2

    check-cast v9, Lcom/flyersoft/views/recyclerview/SizeLinearLayout;

    iget-object v10, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-boolean v10, v10, Lcom/flyersoft/moonreaderp/ActivityMain;->mergeTargetAtRight:Z

    move/from16 v11, p3

    invoke-virtual {v9, v11, v10}, Lcom/flyersoft/views/recyclerview/SizeLinearLayout;->setReduceSize(ZZ)V

    goto :goto_0

    :cond_3
    move/from16 v11, p3

    .line 8486
    :goto_0
    sget v9, Lcom/flyersoft/moonreaderp/R$id;->nameLay:I

    invoke-virtual {v2, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    .line 8487
    sget v10, Lcom/flyersoft/moonreaderp/R$id;->myBookName:I

    invoke-virtual {v2, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    .line 8488
    iget-boolean v12, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->isGrid:Z

    const/4 v13, 0x0

    if-eqz v12, :cond_4

    sget v12, Lcom/flyersoft/moonreaderp/R$id;->myAuthor:I

    invoke-virtual {v2, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/TextView;

    goto :goto_1

    :cond_4
    move-object v12, v13

    .line 8489
    :goto_1
    iget-boolean v14, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->isGrid:Z

    if-eqz v14, :cond_5

    sget v13, Lcom/flyersoft/moonreaderp/R$id;->myBookName2:I

    invoke-virtual {v2, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v13

    check-cast v13, Landroid/widget/TextView;

    .line 8490
    :cond_5
    sget v14, Lcom/flyersoft/moonreaderp/R$id;->progresTv:I

    invoke-virtual {v2, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v14

    check-cast v14, Landroid/widget/TextView;

    .line 8491
    sget v15, Lcom/flyersoft/moonreaderp/R$id;->progressLine:I

    invoke-virtual {v2, v15}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v15

    check-cast v15, Lcom/flyersoft/views/ProgressViews/ProgressLineView;

    .line 8492
    sget v7, Lcom/flyersoft/moonreaderp/R$id;->overflow1:I

    invoke-virtual {v2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/ImageView;

    .line 8494
    iget-object v4, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 8495
    invoke-virtual {v4}, Lcom/flyersoft/tools/BookDb$BookInfo;->isGroup()Z

    move-result v17

    if-eqz v17, :cond_6

    .line 8496
    iget-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v3, v4, v13}, Lcom/flyersoft/moonreaderp/ActivityMain;->getGroupCovers(Lcom/flyersoft/tools/BookDb$BookInfo;Landroid/view/View;)Ljava/util/ArrayList;

    move-result-object v3

    iput-object v3, v5, Lcom/flyersoft/views/ShelfImageView;->gridCovers:Ljava/util/ArrayList;

    goto :goto_3

    .line 8498
    :cond_6
    iget-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v6, v4, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    iget-object v8, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v8, v8, Lcom/flyersoft/moonreaderp/ActivityMain;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    const/4 v1, 0x6

    if-ge v8, v1, :cond_7

    const/4 v1, 0x1

    goto :goto_2

    :cond_7
    const/4 v1, 0x0

    :goto_2
    invoke-virtual {v3, v5, v6, v1, v13}, Lcom/flyersoft/moonreaderp/ActivityMain;->drawBookView(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;ZLandroid/view/View;)V

    .line 8500
    :goto_3
    iget-boolean v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->isGrid:Z

    const/4 v3, 0x2

    if-eqz v1, :cond_9

    sget-boolean v1, Lcom/flyersoft/tools/A;->woody:Z

    if-nez v1, :cond_9

    .line 8501
    sget v1, Lcom/flyersoft/tools/A;->shelf_sort_by:I

    const/4 v6, 0x1

    if-ne v1, v6, :cond_8

    iget-object v1, v4, Lcom/flyersoft/tools/BookDb$BookInfo;->author:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_8

    .line 8502
    invoke-virtual {v10, v6}, Landroid/widget/TextView;->setLines(I)V

    goto :goto_4

    .line 8504
    :cond_8
    invoke-virtual {v10, v3}, Landroid/widget/TextView;->setLines(I)V

    const/16 v1, 0x8

    .line 8505
    invoke-virtual {v12, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 8509
    :cond_9
    :goto_4
    sget-boolean v1, Lcom/flyersoft/tools/A;->isLargeTablet:Z

    if-eqz v1, :cond_b

    :cond_a
    const/4 v1, 0x0

    goto :goto_5

    :cond_b
    sget-boolean v1, Lcom/flyersoft/tools/A;->isSmalltablet:Z

    if-eqz v1, :cond_c

    const/4 v1, -0x1

    goto :goto_5

    :cond_c
    invoke-static {}, Lcom/flyersoft/tools/A;->isLandscape()Z

    move-result v1

    if-eqz v1, :cond_a

    const/4 v1, 0x2

    .line 8510
    :goto_5
    iget-object v6, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v8, v4, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-virtual {v6, v8}, Lcom/flyersoft/moonreaderp/ActivityMain;->getReadProgress(Ljava/lang/String;)I

    move-result v6

    .line 8512
    sget-boolean v8, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-nez v8, :cond_d

    sget-boolean v8, Lcom/flyersoft/tools/A;->mainNightTheme:Z

    if-eqz v8, :cond_10

    :cond_d
    sget-boolean v8, Lcom/flyersoft/tools/A;->woody:Z

    if-nez v8, :cond_10

    .line 8513
    sget v8, Lcom/flyersoft/moonreaderp/R$id;->cardView:I

    invoke-virtual {v2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroidx/cardview/widget/CardView;

    .line 8514
    iget-boolean v3, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->isGrid:Z

    if-eqz v3, :cond_e

    sget-boolean v3, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-nez v3, :cond_e

    invoke-static {}, Lcom/flyersoft/tools/C;->getOtherFrameColor()I

    move-result v3

    goto :goto_6

    :cond_e
    invoke-static {}, Lcom/flyersoft/tools/C;->getBookCardColor()I

    move-result v3

    .line 8513
    :goto_6
    invoke-virtual {v8, v3}, Landroidx/cardview/widget/CardView;->setCardBackgroundColor(I)V

    .line 8515
    invoke-static {}, Lcom/flyersoft/tools/C;->getBookTitleColor()I

    move-result v3

    invoke-virtual {v10, v3}, Landroid/widget/TextView;->setTextColor(I)V

    if-eqz v12, :cond_f

    .line 8517
    invoke-static {}, Lcom/flyersoft/tools/C;->getBookTitleColor()I

    move-result v3

    invoke-virtual {v12, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 8518
    :cond_f
    invoke-static {}, Lcom/flyersoft/tools/C;->getBookTitleColor()I

    move-result v3

    const/16 v8, -0x50

    invoke-static {v3, v8}, Lcom/flyersoft/tools/A;->getAlphaColor(II)I

    move-result v3

    invoke-virtual {v14, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 8520
    :cond_10
    sget-boolean v3, Lcom/flyersoft/tools/A;->woody:Z

    if-eqz v3, :cond_11

    .line 8521
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->cardView:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroidx/cardview/widget/CardView;

    const/4 v8, 0x0

    invoke-virtual {v3, v8}, Landroidx/cardview/widget/CardView;->setCardBackgroundColor(I)V

    .line 8523
    :cond_11
    iget-boolean v3, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->isGrid:Z

    const-string v8, ""

    if-nez v3, :cond_1e

    .line 8524
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->myBookAuthor:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 8525
    sget v9, Lcom/flyersoft/moonreaderp/R$id;->myBookMore:I

    invoke-virtual {v2, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    .line 8526
    sget v13, Lcom/flyersoft/moonreaderp/R$id;->description:I

    invoke-virtual {v2, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v13

    check-cast v13, Landroid/widget/TextView;

    .line 8527
    sget-boolean v18, Lcom/flyersoft/tools/A;->isTablet:Z

    if-eqz v18, :cond_12

    move/from16 v18, v1

    const/4 v1, 0x4

    .line 8528
    invoke-virtual {v13, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    goto :goto_7

    :cond_12
    move/from16 v18, v1

    :goto_7
    const/16 v16, 0x4

    .line 8529
    sget v1, Lcom/flyersoft/tools/A;->shelfFontSize:I

    const/16 v11, 0xf

    if-le v1, v11, :cond_13

    sget v1, Lcom/flyersoft/tools/A;->shelfFontSize:I

    add-int/lit8 v1, v1, -0x4

    goto :goto_8

    :cond_13
    const/16 v1, 0xc

    :goto_8
    sub-int v1, v1, v18

    int-to-float v1, v1

    .line 8530
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 8531
    invoke-virtual {v9, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 8532
    invoke-virtual {v13, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 8533
    sget v1, Lcom/flyersoft/tools/A;->shelfFontSize:I

    sub-int v1, v1, v18

    int-to-float v1, v1

    invoke-virtual {v10, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 8534
    invoke-virtual {v10}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v1

    sget-boolean v11, Lcom/flyersoft/tools/A;->shelfBoldFont:Z

    invoke-virtual {v1, v11}, Landroid/text/TextPaint;->setFakeBoldText(Z)V

    .line 8536
    sget-boolean v1, Lcom/flyersoft/tools/A;->woody:Z

    if-eqz v1, :cond_15

    .line 8537
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->isWoodyDark()Z

    move-result v1

    if-eqz v1, :cond_14

    const v1, -0x777778

    goto :goto_9

    :cond_14
    const v1, -0xbbbbbc

    .line 8538
    :goto_9
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 8539
    invoke-virtual {v9, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 8540
    invoke-virtual {v13, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 8541
    invoke-virtual {v14, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 8542
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->isWoodyDark()Z

    move-result v1

    if-eqz v1, :cond_15

    const v1, -0x333334

    .line 8543
    invoke-virtual {v10, v1}, Landroid/widget/TextView;->setTextColor(I)V

    :cond_15
    const/16 v1, 0x8

    .line 8546
    invoke-virtual {v9, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 8548
    invoke-virtual {v4}, Lcom/flyersoft/tools/BookDb$BookInfo;->isGroup()Z

    move-result v11

    if-eqz v11, :cond_16

    .line 8549
    invoke-virtual {v9, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    const/4 v1, 0x0

    .line 8550
    invoke-virtual {v4, v1}, Lcom/flyersoft/tools/BookDb$BookInfo;->getGroupListName(Z)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8551
    invoke-virtual {v9, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 8552
    invoke-virtual {v3, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8553
    invoke-virtual {v13, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    move-object/from16 v18, v5

    move-object/from16 v19, v15

    goto/16 :goto_d

    .line 8555
    :cond_16
    invoke-static {v4}, Lcom/flyersoft/tools/BookDb;->createSerialText(Lcom/flyersoft/tools/BookDb$BookInfo;)Ljava/lang/String;

    move-result-object v1

    .line 8556
    sget v11, Lcom/flyersoft/tools/A;->shelf_category:I

    move-object/from16 v18, v5

    const-string v5, "\n"

    move-object/from16 v19, v15

    const/4 v15, 0x1

    if-eq v11, v15, :cond_18

    iget-object v11, v4, Lcom/flyersoft/tools/BookDb$BookInfo;->favorite:Ljava/lang/String;

    invoke-virtual {v11, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_18

    .line 8557
    new-instance v11, Ljava/lang/StringBuilder;

    const-string v15, "\u2665"

    invoke-direct {v11, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v15, v4, Lcom/flyersoft/tools/BookDb$BookInfo;->favorite:Ljava/lang/String;

    invoke-static {v15}, Lcom/flyersoft/tools/BookDb;->getFavName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v11, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_17

    move-object v1, v8

    goto :goto_a

    :cond_17
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_a
    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 8558
    :cond_18
    invoke-static {v4}, Lcom/flyersoft/tools/BookDb;->getRating(Lcom/flyersoft/tools/BookDb$BookInfo;)I

    move-result v11

    if-lez v11, :cond_1a

    .line 8560
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v20

    if-eqz v20, :cond_19

    move-object v1, v8

    move/from16 v20, v11

    goto :goto_b

    :cond_19
    move/from16 v20, v11

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_b
    invoke-virtual {v15, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static/range {v20 .. v20}, Lcom/flyersoft/tools/BookDb;->getRatingText(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v15, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 8561
    :cond_1a
    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v11

    const/4 v15, 0x3

    if-nez v11, :cond_1b

    .line 8562
    invoke-virtual {v9, v15}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 8563
    invoke-virtual {v9, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v1, 0x0

    .line 8564
    invoke-virtual {v9, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 8568
    :cond_1b
    sget v1, Lcom/flyersoft/tools/A;->shelf_sort_by:I

    const/4 v9, 0x1

    if-ne v1, v9, :cond_1d

    .line 8569
    iget-object v1, v4, Lcom/flyersoft/tools/BookDb$BookInfo;->author:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1c

    move-object v1, v8

    goto :goto_c

    :cond_1c
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v9, "<u><b>"

    invoke-direct {v1, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v9, v4, Lcom/flyersoft/tools/BookDb$BookInfo;->author:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "</b></u>"

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_c

    .line 8571
    :cond_1d
    iget-object v1, v4, Lcom/flyersoft/tools/BookDb$BookInfo;->author:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 8572
    :goto_c
    const-string v9, " & "

    invoke-virtual {v1, v5, v9}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    .line 8573
    invoke-static {v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8574
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v5, v4, Lcom/flyersoft/tools/BookDb$BookInfo;->description:Ljava/lang/String;

    invoke-virtual {v1, v5}, Lcom/flyersoft/moonreaderp/ActivityMain;->trimDescription(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    invoke-virtual {v13, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8576
    sget v1, Lcom/flyersoft/tools/A;->shelf_category:I

    const/4 v5, 0x2

    if-eq v1, v5, :cond_20

    sget v1, Lcom/flyersoft/tools/A;->shelf_category:I

    if-eq v1, v15, :cond_20

    .line 8577
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 8578
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->onBookAuthorClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 8579
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v1}, Lcom/flyersoft/tools/A;->getSelectedRes(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setBackgroundResource(I)V

    goto :goto_d

    :cond_1e
    move-object/from16 v18, v5

    move-object/from16 v19, v15

    if-eqz v13, :cond_1f

    .line 8583
    invoke-virtual {v13}, Landroid/widget/TextView;->getVisibility()I

    move-result v1

    if-nez v1, :cond_1f

    .line 8584
    iget-object v1, v4, Lcom/flyersoft/tools/BookDb$BookInfo;->book:Ljava/lang/String;

    invoke-virtual {v13, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8585
    :cond_1f
    sget-boolean v1, Lcom/flyersoft/tools/A;->woody:Z

    if-nez v1, :cond_20

    .line 8586
    sget v1, Lcom/flyersoft/tools/A;->shelfFontSize:I

    const/16 v16, 0x4

    add-int/lit8 v1, v1, -0x4

    int-to-float v1, v1

    invoke-virtual {v10, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 8587
    sget v1, Lcom/flyersoft/tools/A;->shelfFontSize:I

    add-int/lit8 v1, v1, -0x4

    int-to-float v1, v1

    invoke-virtual {v12, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 8588
    invoke-virtual {v9, v7}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 8589
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->onShelfItemOverflowClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v9, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 8590
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v1}, Lcom/flyersoft/tools/A;->getSelectedRes(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {v9, v1}, Landroid/view/View;->setBackgroundResource(I)V

    const/high16 v1, 0x41a00000    # 20.0f

    .line 8591
    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    const/4 v5, 0x0

    invoke-static {v5}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v5

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    const/high16 v9, 0x42700000    # 60.0f

    invoke-static {v9}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v9

    invoke-virtual {v13, v3, v5, v1, v9}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 8595
    :cond_20
    :goto_d
    invoke-direct/range {p0 .. p3}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->checkCoverHeightAndSetBackground(ILandroid/view/View;Z)V

    .line 8597
    iget-boolean v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->isGrid:Z

    const-string v3, "0%"

    const-string v5, "%"

    if-eqz v1, :cond_22

    sget-boolean v1, Lcom/flyersoft/tools/A;->woody:Z

    if-nez v1, :cond_21

    goto :goto_e

    :cond_21
    const/4 v15, 0x1

    goto :goto_11

    .line 8598
    :cond_22
    :goto_e
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->progressLay:I

    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 8599
    invoke-virtual {v4}, Lcom/flyersoft/tools/BookDb$BookInfo;->isGroup()Z

    move-result v9

    if-eqz v9, :cond_23

    const/4 v15, 0x1

    .line 8600
    invoke-virtual {v4, v15}, Lcom/flyersoft/tools/BookDb$BookInfo;->getGroupName(Z)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v10, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v9, 0x4

    .line 8601
    invoke-virtual {v1, v9}, Landroid/view/View;->setVisibility(I)V

    if-eqz v12, :cond_27

    .line 8603
    invoke-virtual {v12, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_11

    :cond_23
    const/4 v8, 0x0

    const/4 v15, 0x1

    .line 8605
    invoke-virtual {v1, v8}, Landroid/view/View;->setVisibility(I)V

    .line 8606
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v8, v4, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    iget-boolean v9, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->isGrid:Z

    invoke-virtual {v1, v8, v4, v9}, Lcom/flyersoft/moonreaderp/ActivityMain;->getBookName2(Ljava/lang/String;Lcom/flyersoft/tools/BookDb$BookInfo;Z)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v10, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    if-eqz v12, :cond_24

    .line 8607
    invoke-virtual {v12}, Landroid/widget/TextView;->getVisibility()I

    move-result v1

    if-nez v1, :cond_24

    .line 8608
    iget-object v1, v4, Lcom/flyersoft/tools/BookDb$BookInfo;->author:Ljava/lang/String;

    invoke-virtual {v12, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_24
    if-gez v6, :cond_25

    move-object v1, v3

    goto :goto_f

    .line 8609
    :cond_25
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_f
    invoke-virtual {v14, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    if-gez v6, :cond_26

    const/4 v8, 0x0

    goto :goto_10

    :cond_26
    move v8, v6

    :goto_10
    move-object/from16 v1, v19

    .line 8610
    iput v8, v1, Lcom/flyersoft/views/ProgressViews/ProgressLineView;->progress:I

    .line 8611
    invoke-virtual {v1}, Lcom/flyersoft/views/ProgressViews/ProgressLineView;->postInvalidate()V

    .line 8615
    :cond_27
    :goto_11
    iget-boolean v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->isGrid:Z

    if-eqz v1, :cond_2c

    .line 8616
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->gauge:I

    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/views/ProgressViews/ProgressGaugeTV;

    .line 8617
    invoke-virtual {v4}, Lcom/flyersoft/tools/BookDb$BookInfo;->isGroup()Z

    move-result v8

    if-nez v8, :cond_2b

    sget-boolean v8, Lcom/flyersoft/tools/A;->woody:Z

    if-eqz v8, :cond_2b

    sget-boolean v8, Lcom/flyersoft/tools/A;->coverWithProgress:Z

    if-eqz v8, :cond_2b

    const/4 v8, -0x1

    if-eq v6, v8, :cond_2b

    .line 8618
    sget-boolean v8, Lcom/flyersoft/tools/A;->isTablet:Z

    if-eqz v8, :cond_28

    .line 8619
    invoke-virtual {v1}, Lcom/flyersoft/views/ProgressViews/ProgressGaugeTV;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    const/high16 v9, 0x42200000    # 40.0f

    invoke-static {v9}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v10

    iput v10, v8, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 8620
    invoke-virtual {v1}, Lcom/flyersoft/views/ProgressViews/ProgressGaugeTV;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    invoke-static {v9}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v9

    iput v9, v8, Landroid/view/ViewGroup$LayoutParams;->height:I

    const/high16 v8, 0x41200000    # 10.0f

    .line 8621
    invoke-virtual {v1, v8}, Lcom/flyersoft/views/ProgressViews/ProgressGaugeTV;->setTextSize(F)V

    :cond_28
    const/4 v8, 0x0

    .line 8623
    invoke-virtual {v1, v8}, Lcom/flyersoft/views/ProgressViews/ProgressGaugeTV;->setVisibility(I)V

    if-gez v6, :cond_29

    const/4 v9, 0x0

    goto :goto_12

    :cond_29
    move v9, v6

    .line 8624
    :goto_12
    invoke-virtual {v1, v9}, Lcom/flyersoft/views/ProgressViews/ProgressGaugeTV;->setProgress(I)V

    if-gez v6, :cond_2a

    goto :goto_13

    .line 8625
    :cond_2a
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_13
    invoke-virtual {v1, v3}, Lcom/flyersoft/views/ProgressViews/ProgressGaugeTV;->setText(Ljava/lang/CharSequence;)V

    goto :goto_14

    :cond_2b
    const/4 v8, 0x0

    const/16 v3, 0x8

    .line 8627
    invoke-virtual {v1, v3}, Lcom/flyersoft/views/ProgressViews/ProgressGaugeTV;->setVisibility(I)V

    .line 8628
    :goto_14
    sget-boolean v1, Lcom/flyersoft/tools/A;->isTablet:Z

    if-eqz v1, :cond_2e

    .line 8629
    invoke-virtual {v7}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    const/high16 v3, 0x40a00000    # 5.0f

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    iput v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    goto :goto_16

    :cond_2c
    const/4 v8, 0x0

    .line 8630
    sget-boolean v1, Lcom/flyersoft/tools/A;->woody:Z

    if-eqz v1, :cond_2e

    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->isWoodyDark()Z

    move-result v1

    if-nez v1, :cond_2e

    .line 8631
    invoke-virtual {v7}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-static {}, Lcom/flyersoft/tools/A;->woodyRes()I

    move-result v3

    const/4 v5, 0x2

    if-ne v3, v5, :cond_2d

    const v3, -0x99999a

    goto :goto_15

    :cond_2d
    const v3, -0xbbbbbc

    :goto_15
    sget-object v5, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v1, v3, v5}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 8633
    :cond_2e
    :goto_16
    invoke-virtual {v7, v4}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 8634
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->onShelfItemOverflowClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v7, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 8636
    iget v1, v4, Lcom/flyersoft/tools/BookDb$BookInfo;->topId:I

    if-ltz v1, :cond_2f

    const/4 v3, 0x1

    goto :goto_17

    :cond_2f
    const/4 v3, 0x0

    :goto_17
    move-object/from16 v5, v18

    iput-boolean v3, v5, Lcom/flyersoft/views/ShelfImageView;->drawPutOnTop:Z

    .line 8637
    invoke-virtual {v5, v4}, Lcom/flyersoft/views/ShelfImageView;->setCloudIcon(Lcom/flyersoft/tools/BookDb$BookInfo;)V

    .line 8638
    invoke-virtual {v2, v4}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 8639
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->onBookClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v2, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 8640
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfAllowDrag()Z

    move-result v1

    if-nez v1, :cond_30

    .line 8641
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->onBookLongClick:Landroid/view/View$OnLongClickListener;

    invoke-virtual {v2, v1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    :cond_30
    return-void
.end method

.method public getFirstSelected()I
    .locals 3

    const/4 v0, 0x0

    .line 8327
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->checked:[Z

    array-length v2, v1

    if-ge v0, v2, :cond_1

    .line 8328
    aget-boolean v1, v1, v0

    if-eqz v1, :cond_0

    return v0

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, -0x1

    return v0
.end method

.method public getItemCount()I
    .locals 5

    .line 8425
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 8426
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->itemCount:Ljava/lang/Integer;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->bookCount:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 8427
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->itemCount:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0

    .line 8429
    :cond_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->bookCount:Ljava/lang/Integer;

    .line 8430
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetshelfColumn(Lcom/flyersoft/moonreaderp/ActivityMain;)I

    move-result v1

    div-int v1, v0, v1

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetshelfColumn(Lcom/flyersoft/moonreaderp/ActivityMain;)I

    move-result v2

    const/4 v3, 0x1

    if-le v2, v3, :cond_1

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetshelfColumn(Lcom/flyersoft/moonreaderp/ActivityMain;)I

    move-result v2

    rem-int/2addr v0, v2

    if-lez v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    add-int/2addr v1, v0

    .line 8431
    sget-boolean v0, Lcom/flyersoft/tools/A;->woody:Z

    if-eqz v0, :cond_3

    .line 8432
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->isGrid:Z

    const/high16 v2, 0x41a00000    # 20.0f

    if-eqz v0, :cond_2

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->gridWidth:I

    mul-int/lit8 v2, v2, 0x5a

    div-int/lit8 v2, v2, 0x46

    goto :goto_1

    :cond_2
    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v4, Lcom/flyersoft/tools/A;->shelfCoverSize:I

    invoke-virtual {v2, v4}, Lcom/flyersoft/moonreaderp/ActivityMain;->listStyleBookHeight(I)I

    move-result v2

    :goto_1
    add-int/2addr v0, v2

    .line 8433
    invoke-static {}, Lcom/flyersoft/tools/A;->getScreenHeight()I

    move-result v2

    const/high16 v4, 0x42340000    # 45.0f

    invoke-static {v4}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    sub-int/2addr v2, v4

    .line 8434
    div-int/2addr v2, v0

    add-int/2addr v2, v3

    if-ge v1, v2, :cond_3

    move v1, v2

    .line 8438
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetshelfColumn(Lcom/flyersoft/moonreaderp/ActivityMain;)I

    move-result v0

    mul-int v1, v1, v0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->itemCount:Ljava/lang/Integer;

    .line 8439
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getSelectedBooks()Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$BookInfo;",
            ">;"
        }
    .end annotation

    .line 8310
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    .line 8311
    :goto_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 8312
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->checked:[Z

    array-length v3, v2

    if-ge v1, v3, :cond_0

    aget-boolean v2, v2, v1

    if-eqz v2, :cond_0

    .line 8313
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public getSelectedCount()I
    .locals 4

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 8320
    :goto_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->checked:[Z

    array-length v3, v2

    if-ge v0, v3, :cond_1

    .line 8321
    aget-boolean v2, v2, v0

    if-eqz v2, :cond_0

    add-int/lit8 v1, v1, 0x1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return v1
.end method

.method public inverseChecked(I)V
    .locals 3

    .line 8366
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->checked:[Z

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->validIndex(I[Z)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 8368
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->checked:[Z

    aget-boolean v1, v0, p1

    xor-int/lit8 v1, v1, 0x1

    aput-boolean v1, v0, p1

    .line 8369
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$msetActionItemsVisible(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 8370
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->actionbar:Landroidx/appcompat/app/ActionBar;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, ""

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->getSelectedCount()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 8371
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->getSelectedCount()I

    move-result v0

    if-nez v0, :cond_1

    .line 8372
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mforceHideSelectState(Lcom/flyersoft/moonreaderp/ActivityMain;)Z

    :cond_1
    const/4 v0, 0x0

    .line 8373
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->notifyItemChanged(ILjava/lang/Object;)V

    return-void
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 4

    .line 8444
    iget-object v0, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 8445
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->coverWidth:I

    if-nez v1, :cond_0

    .line 8446
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v2, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->gridWidth:I

    iput v2, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->coverWidth:I

    .line 8447
    sget-boolean v1, Lcom/flyersoft/tools/A;->woody:Z

    if-nez v1, :cond_0

    .line 8448
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->cardView:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 8449
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v2, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->gridWidth:I

    iget v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    sub-int/2addr v2, v3

    iget v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    sub-int/2addr v2, v0

    const/high16 v0, 0x40800000    # 4.0f

    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    div-int/lit8 v0, v0, 0x3

    sub-int/2addr v2, v0

    iput v2, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->coverWidth:I

    .line 8452
    :cond_0
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

    invoke-super {p0, p2, p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain$MultiSelectRvAdapter;->fillData(ILandroid/view/View;Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;)V

    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 7

    .line 8395
    iget-boolean p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->isGrid:Z

    if-eqz p2, :cond_0

    sget p2, Lcom/flyersoft/moonreaderp/R$layout;->shelf_grid_item:I

    goto :goto_0

    :cond_0
    sget p2, Lcom/flyersoft/moonreaderp/R$layout;->shelf_list_item:I

    .line 8396
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 8397
    sget-boolean p2, Lcom/flyersoft/tools/A;->mainNightTheme:Z

    if-eqz p2, :cond_1

    iget-boolean p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->isGrid:Z

    if-nez p2, :cond_2

    :cond_1
    sget-boolean p2, Lcom/flyersoft/tools/A;->woody:Z

    if-eqz p2, :cond_5

    .line 8398
    :cond_2
    sget p2, Lcom/flyersoft/moonreaderp/R$id;->cardView:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroidx/cardview/widget/CardView;

    .line 8399
    invoke-virtual {p2}, Landroidx/cardview/widget/CardView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    const/4 v2, 0x0

    .line 8400
    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    iput v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    iput v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iput v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    iput v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 8401
    invoke-virtual {p2, v1, v1, v1, v1}, Landroidx/cardview/widget/CardView;->setPadding(IIII)V

    .line 8402
    invoke-virtual {p2, v2}, Landroidx/cardview/widget/CardView;->setElevation(F)V

    .line 8403
    invoke-virtual {p2, v2}, Landroidx/cardview/widget/CardView;->setCardElevation(F)V

    .line 8404
    invoke-virtual {p2, v2}, Landroidx/cardview/widget/CardView;->setRadius(F)V

    .line 8406
    iget-boolean p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->isGrid:Z

    const/high16 v0, 0x41a80000    # 21.0f

    const/high16 v2, 0x41700000    # 15.0f

    if-eqz p2, :cond_3

    .line 8407
    sget p2, Lcom/flyersoft/moonreaderp/R$id;->nameLay:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    const/high16 v3, 0x40800000    # 4.0f

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-static {v4}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    invoke-virtual {p2, v3, v1, v4, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 8408
    sget-boolean p2, Lcom/flyersoft/tools/A;->woody:Z

    if-eqz p2, :cond_3

    .line 8409
    sget p2, Lcom/flyersoft/moonreaderp/R$id;->nameLay:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    const/16 v3, 0x8

    invoke-virtual {p2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 8410
    sget p2, Lcom/flyersoft/moonreaderp/R$id;->overflow1:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v5

    const/high16 v6, 0x40400000    # 3.0f

    invoke-static {v6}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v6

    invoke-virtual {p2, v3, v4, v5, v6}, Landroid/view/View;->setPadding(IIII)V

    .line 8413
    :cond_3
    sget-boolean p2, Lcom/flyersoft/tools/A;->woody:Z

    if-eqz p2, :cond_5

    .line 8414
    sget-boolean p2, Lcom/flyersoft/tools/A;->isTablet:Z

    if-eqz p2, :cond_4

    goto :goto_1

    :cond_4
    const/high16 v0, 0x41700000    # 15.0f

    :goto_1
    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result p2

    const/high16 v0, 0x41400000    # 12.0f

    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    invoke-virtual {p1, v1, p2, v1, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 8417
    :cond_5
    new-instance p2, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$Holder;

    invoke-direct {p2, p0, p1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$Holder;-><init>(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;Landroid/view/View;)V

    return-object p2
.end method

.method public resetChecked()V
    .locals 1

    .line 8306
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Z

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->checked:[Z

    return-void
.end method

.method public selectAll()V
    .locals 5

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 8340
    :goto_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->checked:[Z

    array-length v3, v2

    if-ge v1, v3, :cond_0

    const/4 v3, 0x1

    .line 8341
    aput-boolean v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 8343
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfLv:Lcom/flyersoft/views/BookShelfView;

    invoke-virtual {v1}, Lcom/flyersoft/views/BookShelfView;->findFirstVisibleItem()I

    move-result v1

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetshelfColumn(Lcom/flyersoft/moonreaderp/ActivityMain;)I

    move-result v2

    sub-int/2addr v1, v2

    .line 8344
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfLv:Lcom/flyersoft/views/BookShelfView;

    invoke-virtual {v2}, Lcom/flyersoft/views/BookShelfView;->findLastVisibleItem()I

    move-result v2

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v3}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetshelfColumn(Lcom/flyersoft/moonreaderp/ActivityMain;)I

    move-result v3

    add-int/2addr v2, v3

    const/4 v3, 0x0

    .line 8345
    :goto_1
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->checked:[Z

    array-length v4, v4

    if-ge v3, v4, :cond_2

    if-lt v3, v1, :cond_1

    if-gt v3, v2, :cond_1

    .line 8347
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->notifyItemChanged(ILjava/lang/Object;)V

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 8349
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->actionbar:Landroidx/appcompat/app/ActionBar;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, ""

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->checked:[Z

    array-length v2, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setChecked(I)V
    .locals 3

    .line 8377
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->checked:[Z

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->validIndex(I[Z)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 8379
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->checked:[Z

    const/4 v1, 0x1

    aput-boolean v1, v0, p1

    .line 8380
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$msetActionItemsVisible(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 8381
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->actionbar:Landroidx/appcompat/app/ActionBar;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, ""

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->getSelectedCount()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    const/4 v0, 0x0

    .line 8382
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->notifyItemChanged(ILjava/lang/Object;)V

    return-void
.end method

.method public setLongTapSelectItem(I)V
    .locals 2

    .line 8387
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->checked:[Z

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->validIndex(I[Z)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 8389
    :cond_0
    iput p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->longTapSelectItem:I

    .line 8390
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->checked:[Z

    const/4 v1, 0x1

    aput-boolean v1, v0, p1

    return-void
.end method

.method public showFocusItem(I)V
    .locals 1

    .line 8335
    iput p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->focustItem:I

    const/4 v0, 0x0

    .line 8336
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->notifyItemChanged(ILjava/lang/Object;)V

    return-void
.end method
