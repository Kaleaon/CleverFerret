.class Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;
.super Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;
.source "PrefGroupBooks.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefGroupBooks;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MergedAdapter"
.end annotation


# instance fields
.field bookCount:Ljava/lang/Integer;

.field itemCount:Ljava/lang/Integer;

.field measureNameLayHeight:Ljava/lang/Integer;

.field onBookAuthorClick:Landroid/view/View$OnClickListener;

.field onBookClick:Landroid/view/View$OnClickListener;

.field onBookRemove:Landroid/view/View$OnClickListener;

.field onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

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

    .line 196
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    invoke-direct {p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;-><init>()V

    .line 237
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter$1;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter$1;-><init>(Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

    .line 412
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter$2;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter$2;-><init>(Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->onBookAuthorClick:Landroid/view/View$OnClickListener;

    .line 430
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter$3;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter$3;-><init>(Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->onBookRemove:Landroid/view/View$OnClickListener;

    .line 506
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter$4;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter$4;-><init>(Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->onBookClick:Landroid/view/View$OnClickListener;

    return-void
.end method

.method private checkCoverHeightAndSetBackground(ILandroid/view/View;)V
    .locals 8

    .line 453
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->myBookImage:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 455
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-boolean v1, v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->isGrid:Z

    const/16 v2, 0x46

    const/16 v3, 0x64

    const/4 v4, -0x1

    const/4 v5, 0x0

    if-nez v1, :cond_3

    .line 456
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v1

    if-nez v1, :cond_2

    .line 457
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->act:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v6, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget v6, v6, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->shelfCoverSize:I

    invoke-virtual {v1, v6}, Lcom/flyersoft/moonreaderp/ActivityMain;->listStyleBookHeight(I)I

    move-result v1

    .line 458
    invoke-virtual {p2, v5, v5}, Landroid/view/View;->measure(II)V

    .line 459
    new-instance v6, Landroid/widget/FrameLayout$LayoutParams;

    .line 460
    sget-boolean v7, Lcom/flyersoft/tools/A;->woody:Z

    if-eqz v7, :cond_0

    const/16 v2, 0x4a

    :cond_0
    mul-int v2, v2, v1

    div-int/2addr v2, v3

    invoke-direct {v6, v2, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v1, 0x11

    .line 461
    iput v1, v6, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 462
    invoke-virtual {v0, v6}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 463
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->-$$Nest$fgetshelfColumn(Lcom/flyersoft/moonreaderp/PrefGroupBooks;)I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, -0x2

    if-le v0, v1, :cond_1

    .line 464
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v4, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v1, 0x40a00000    # 5.0f

    .line 465
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 466
    invoke-virtual {p2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0

    .line 468
    :cond_1
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v0, v4, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 470
    :cond_2
    :goto_0
    invoke-virtual {p0, p1, p2, v5}, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->drawSelectedState(ILandroid/view/View;Z)V

    return-void

    .line 472
    :cond_3
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->act:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->isCoverHeightError(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 473
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget v1, v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->coverWidth:I

    sget-boolean v6, Lcom/flyersoft/tools/A;->woody:Z

    if-eqz v6, :cond_4

    const/16 v3, 0x5e

    :cond_4
    mul-int v1, v1, v3

    div-int/2addr v1, v2

    .line 474
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v4, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 475
    sget-boolean v0, Lcom/flyersoft/tools/A;->woody:Z

    if-nez v0, :cond_7

    .line 476
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->nameLay:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 477
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->measureNameLayHeight:Ljava/lang/Integer;

    if-nez v2, :cond_5

    .line 478
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->myBookName:I

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 479
    sget v3, Lcom/flyersoft/tools/A;->shelfFontSize:I

    add-int/lit8 v3, v3, -0x4

    int-to-float v3, v3

    const v6, 0x3dcccccd    # 0.1f

    add-float/2addr v3, v6

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 480
    invoke-virtual {v0, v5, v5}, Landroid/view/View;->measure(II)V

    .line 481
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v2

    const/4 v3, 0x0

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    add-int/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iput-object v2, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->measureNameLayHeight:Ljava/lang/Integer;

    .line 484
    :cond_5
    sget v2, Lcom/flyersoft/tools/A;->shelfFontSize:I

    mul-int/lit8 v2, v2, 0x20

    mul-int v1, v1, v2

    div-int/lit16 v1, v1, 0x640

    .line 485
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->measureNameLayHeight:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ge v1, v2, :cond_6

    .line 486
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->measureNameLayHeight:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 487
    :cond_6
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v4, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 490
    :cond_7
    invoke-virtual {p0, p1, p2, v5}, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->drawSelectedState(ILandroid/view/View;Z)V

    return-void
.end method


# virtual methods
.method public drawSelectedState(ILandroid/view/View;Z)V
    .locals 1

    .line 495
    sget p1, Lcom/flyersoft/moonreaderp/R$id;->overLay:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    if-nez p1, :cond_0

    return-void

    :cond_0
    if-eqz p3, :cond_1

    .line 498
    new-instance p2, Landroid/graphics/drawable/ColorDrawable;

    const p3, 0x502196f3

    invoke-direct {p2, p3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    goto :goto_0

    .line 499
    :cond_1
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->getContext()Landroid/content/Context;

    move-result-object p2

    sget p3, Lcom/flyersoft/material/components/icons/R$drawable;->my_list_selector:I

    invoke-virtual {p2, p3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    .line 500
    :goto_0
    sget p3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x17

    if-lt p3, v0, :cond_2

    .line 501
    invoke-static {p1, p2}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    return-void

    .line 503
    :cond_2
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public fillItemData(ILandroid/view/View;Z)V
    .locals 19

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, p2

    .line 258
    iget-object v3, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x4

    if-lt v1, v3, :cond_0

    .line 259
    invoke-direct/range {p0 .. p2}, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->checkCoverHeightAndSetBackground(ILandroid/view/View;)V

    .line 260
    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_0
    const/4 v3, 0x0

    .line 263
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 265
    sget v5, Lcom/flyersoft/moonreaderp/R$id;->myBookImage:I

    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/flyersoft/views/ShelfImageView;

    const/4 v6, 0x1

    .line 266
    iput-boolean v6, v5, Lcom/flyersoft/views/ShelfImageView;->isShelfCover:Z

    .line 267
    iget-object v7, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-boolean v7, v7, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->isGrid:Z

    if-nez v7, :cond_1

    sget-boolean v7, Lcom/flyersoft/tools/A;->mainNightTheme:Z

    if-nez v7, :cond_1

    sget-boolean v7, Lcom/flyersoft/tools/A;->woody:Z

    if-nez v7, :cond_1

    .line 268
    iput-boolean v6, v5, Lcom/flyersoft/views/ShelfImageView;->forceHasShadow:Z

    .line 269
    sget v7, Lcom/flyersoft/moonreaderp/R$drawable;->list_bookshadow_light:I

    iput v7, v5, Lcom/flyersoft/views/ShelfImageView;->shadowRes:I

    .line 271
    :cond_1
    invoke-virtual {v5}, Lcom/flyersoft/views/ShelfImageView;->initPadding()V

    .line 273
    sget v7, Lcom/flyersoft/moonreaderp/R$id;->nameLay:I

    invoke-virtual {v2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    .line 274
    sget v8, Lcom/flyersoft/moonreaderp/R$id;->myBookName:I

    invoke-virtual {v2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    .line 275
    sget v9, Lcom/flyersoft/moonreaderp/R$id;->myAuthor:I

    invoke-virtual {v2, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    .line 276
    iget-object v10, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-boolean v10, v10, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->isGrid:Z

    if-eqz v10, :cond_2

    sget v10, Lcom/flyersoft/moonreaderp/R$id;->myBookName2:I

    invoke-virtual {v2, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    goto :goto_0

    :cond_2
    const/4 v10, 0x0

    .line 277
    :goto_0
    sget v11, Lcom/flyersoft/moonreaderp/R$id;->progresTv:I

    invoke-virtual {v2, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/TextView;

    .line 278
    sget v12, Lcom/flyersoft/moonreaderp/R$id;->progressLine:I

    invoke-virtual {v2, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Lcom/flyersoft/views/ProgressViews/ProgressLineView;

    .line 279
    sget v13, Lcom/flyersoft/moonreaderp/R$id;->overflow1:I

    invoke-virtual {v2, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v13

    check-cast v13, Landroid/widget/ImageView;

    .line 280
    sget v14, Lcom/flyersoft/moonreaderp/R$id;->delete:I

    invoke-virtual {v2, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v14

    .line 281
    iget-object v15, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-boolean v15, v15, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->mShowRemoveButton:Z

    if-nez v15, :cond_4

    if-eqz p3, :cond_3

    goto :goto_1

    :cond_3
    const/16 v15, 0x8

    goto :goto_2

    :cond_4
    :goto_1
    const/4 v15, 0x0

    :goto_2
    invoke-virtual {v14, v15}, Landroid/view/View;->setVisibility(I)V

    .line 283
    iget-object v15, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v15, v15, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {v15, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 284
    iget-object v3, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->act:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v4, v15, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    iget-object v6, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v6, v6, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    const/4 v1, 0x6

    if-ge v6, v1, :cond_5

    const/4 v1, 0x1

    goto :goto_3

    :cond_5
    const/4 v1, 0x0

    :goto_3
    invoke-virtual {v3, v5, v4, v1, v10}, Lcom/flyersoft/moonreaderp/ActivityMain;->drawBookView(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;ZLandroid/view/View;)V

    .line 285
    invoke-virtual {v5, v15}, Lcom/flyersoft/views/ShelfImageView;->setCloudIcon(Lcom/flyersoft/tools/BookDb$BookInfo;)V

    .line 287
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-boolean v1, v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->isGrid:Z

    const/4 v3, 0x2

    if-eqz v1, :cond_7

    sget-boolean v1, Lcom/flyersoft/tools/A;->woody:Z

    if-nez v1, :cond_7

    .line 288
    sget v1, Lcom/flyersoft/tools/A;->shelf_sort_by:I

    const/4 v4, 0x1

    if-ne v1, v4, :cond_6

    iget-object v1, v15, Lcom/flyersoft/tools/BookDb$BookInfo;->author:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_6

    .line 289
    invoke-virtual {v8, v4}, Landroid/widget/TextView;->setLines(I)V

    goto :goto_4

    .line 291
    :cond_6
    invoke-virtual {v8, v3}, Landroid/widget/TextView;->setLines(I)V

    const/16 v1, 0x8

    .line 292
    invoke-virtual {v9, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 296
    :cond_7
    :goto_4
    sget-boolean v1, Lcom/flyersoft/tools/A;->isLargeTablet:Z

    if-eqz v1, :cond_9

    :cond_8
    const/4 v1, 0x0

    goto :goto_5

    :cond_9
    sget-boolean v1, Lcom/flyersoft/tools/A;->isSmalltablet:Z

    if-eqz v1, :cond_a

    const/4 v1, -0x1

    goto :goto_5

    :cond_a
    invoke-static {}, Lcom/flyersoft/tools/A;->isLandscape()Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v1, 0x2

    .line 297
    :goto_5
    iget-object v5, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->act:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v6, v15, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-virtual {v5, v6}, Lcom/flyersoft/moonreaderp/ActivityMain;->getReadProgress(Ljava/lang/String;)I

    move-result v5

    .line 299
    sget-boolean v6, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-nez v6, :cond_b

    sget-boolean v6, Lcom/flyersoft/tools/A;->mainNightTheme:Z

    if-eqz v6, :cond_e

    :cond_b
    sget-boolean v6, Lcom/flyersoft/tools/A;->woody:Z

    if-nez v6, :cond_e

    .line 300
    sget v6, Lcom/flyersoft/moonreaderp/R$id;->cardView:I

    invoke-virtual {v2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroidx/cardview/widget/CardView;

    .line 301
    iget-object v3, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-boolean v3, v3, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->isGrid:Z

    if-eqz v3, :cond_c

    sget-boolean v3, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-nez v3, :cond_c

    invoke-static {}, Lcom/flyersoft/tools/C;->getOtherFrameColor()I

    move-result v3

    goto :goto_6

    :cond_c
    invoke-static {}, Lcom/flyersoft/tools/C;->getBookCardColor()I

    move-result v3

    .line 300
    :goto_6
    invoke-virtual {v6, v3}, Landroidx/cardview/widget/CardView;->setCardBackgroundColor(I)V

    .line 302
    invoke-static {}, Lcom/flyersoft/tools/C;->getBookTitleColor()I

    move-result v3

    invoke-virtual {v8, v3}, Landroid/widget/TextView;->setTextColor(I)V

    if-eqz v9, :cond_d

    .line 304
    invoke-static {}, Lcom/flyersoft/tools/C;->getBookTitleColor()I

    move-result v3

    invoke-virtual {v9, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 305
    :cond_d
    invoke-static {}, Lcom/flyersoft/tools/C;->getBookTitleColor()I

    move-result v3

    const/16 v6, -0x50

    invoke-static {v3, v6}, Lcom/flyersoft/tools/A;->getAlphaColor(II)I

    move-result v3

    invoke-virtual {v11, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 307
    :cond_e
    sget-boolean v3, Lcom/flyersoft/tools/A;->woody:Z

    if-eqz v3, :cond_f

    .line 308
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->cardView:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroidx/cardview/widget/CardView;

    const/4 v6, 0x0

    invoke-virtual {v3, v6}, Landroidx/cardview/widget/CardView;->setCardBackgroundColor(I)V

    .line 310
    :cond_f
    iget-object v3, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-boolean v3, v3, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->isGrid:Z

    if-nez v3, :cond_1b

    .line 311
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->myBookAuthor:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 312
    sget v7, Lcom/flyersoft/moonreaderp/R$id;->myBookMore:I

    invoke-virtual {v2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    .line 313
    sget v10, Lcom/flyersoft/moonreaderp/R$id;->description:I

    invoke-virtual {v2, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    .line 314
    sget-boolean v17, Lcom/flyersoft/tools/A;->isTablet:Z

    if-eqz v17, :cond_10

    const/4 v6, 0x4

    .line 315
    invoke-virtual {v10, v6}, Landroid/widget/TextView;->setMaxLines(I)V

    :cond_10
    const/16 v16, 0x4

    .line 316
    sget v6, Lcom/flyersoft/tools/A;->shelfFontSize:I

    const/16 v4, 0xf

    if-le v6, v4, :cond_11

    sget v4, Lcom/flyersoft/tools/A;->shelfFontSize:I

    add-int/lit8 v4, v4, -0x4

    goto :goto_7

    :cond_11
    const/16 v4, 0xc

    :goto_7
    sub-int/2addr v4, v1

    int-to-float v4, v4

    .line 317
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 318
    invoke-virtual {v7, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 319
    invoke-virtual {v10, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 320
    sget v4, Lcom/flyersoft/tools/A;->shelfFontSize:I

    sub-int/2addr v4, v1

    int-to-float v1, v4

    invoke-virtual {v8, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 321
    invoke-virtual {v8}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v1

    sget-boolean v4, Lcom/flyersoft/tools/A;->shelfBoldFont:Z

    invoke-virtual {v1, v4}, Landroid/text/TextPaint;->setFakeBoldText(Z)V

    .line 323
    sget-boolean v1, Lcom/flyersoft/tools/A;->woody:Z

    if-eqz v1, :cond_13

    .line 324
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->act:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->isWoodyDark()Z

    move-result v1

    if-eqz v1, :cond_12

    const v1, -0x777778

    goto :goto_8

    :cond_12
    const v1, -0xbbbbbc

    .line 325
    :goto_8
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 326
    invoke-virtual {v7, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 327
    invoke-virtual {v10, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 328
    invoke-virtual {v11, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 329
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->act:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->isWoodyDark()Z

    move-result v1

    if-eqz v1, :cond_13

    const v1, -0x333334

    .line 330
    invoke-virtual {v8, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 334
    :cond_13
    sget v1, Lcom/flyersoft/tools/A;->shelf_sort_by:I

    const-string v4, ""

    const/4 v6, 0x1

    if-ne v1, v6, :cond_15

    .line 335
    iget-object v1, v15, Lcom/flyersoft/tools/BookDb$BookInfo;->author:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_14

    move-object v1, v4

    goto :goto_9

    :cond_14
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v6, "<u><b>"

    invoke-direct {v1, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, v15, Lcom/flyersoft/tools/BookDb$BookInfo;->author:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "</b></u>"

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_9

    .line 337
    :cond_15
    iget-object v1, v15, Lcom/flyersoft/tools/BookDb$BookInfo;->author:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 338
    :goto_9
    const-string v6, " & "

    move-object/from16 v18, v14

    const-string v14, "\n"

    invoke-virtual {v1, v14, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    .line 339
    invoke-static {v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 341
    invoke-static {v15}, Lcom/flyersoft/tools/BookDb;->createSerialText(Lcom/flyersoft/tools/BookDb$BookInfo;)Ljava/lang/String;

    move-result-object v1

    .line 342
    sget v6, Lcom/flyersoft/tools/A;->shelf_category:I

    const/4 v2, 0x1

    if-eq v6, v2, :cond_17

    iget-object v2, v15, Lcom/flyersoft/tools/BookDb$BookInfo;->favorite:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_17

    .line 343
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v6, "\u2665"

    invoke-direct {v2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, v15, Lcom/flyersoft/tools/BookDb$BookInfo;->favorite:Ljava/lang/String;

    invoke-static {v6}, Lcom/flyersoft/tools/BookDb;->getFavName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_16

    move-object v1, v4

    goto :goto_a

    :cond_16
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_a
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 344
    :cond_17
    invoke-static {v15}, Lcom/flyersoft/tools/BookDb;->getRating(Lcom/flyersoft/tools/BookDb$BookInfo;)I

    move-result v2

    if-lez v2, :cond_19

    .line 346
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v16

    if-eqz v16, :cond_18

    goto :goto_b

    :cond_18
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    :goto_b
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v2}, Lcom/flyersoft/tools/BookDb;->getRatingText(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 347
    :cond_19
    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1a

    .line 348
    invoke-virtual {v7, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v6, 0x0

    .line 349
    invoke-virtual {v7, v6}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_c

    :cond_1a
    const/16 v1, 0x8

    .line 351
    invoke-virtual {v7, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 353
    :goto_c
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->act:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v15, Lcom/flyersoft/tools/BookDb$BookInfo;->description:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->trimDescription(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    invoke-virtual {v10, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 356
    invoke-virtual {v3, v15}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 357
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->onBookAuthorClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 358
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/tools/A;->getSelectedRes(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setBackgroundResource(I)V

    goto :goto_d

    :cond_1b
    move-object/from16 v18, v14

    if-eqz v10, :cond_1c

    .line 361
    invoke-virtual {v10}, Landroid/widget/TextView;->getVisibility()I

    move-result v1

    if-nez v1, :cond_1c

    .line 362
    iget-object v1, v15, Lcom/flyersoft/tools/BookDb$BookInfo;->book:Ljava/lang/String;

    invoke-virtual {v10, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 363
    :cond_1c
    sget-boolean v1, Lcom/flyersoft/tools/A;->woody:Z

    if-nez v1, :cond_1e

    .line 364
    sget v1, Lcom/flyersoft/tools/A;->shelfFontSize:I

    const/16 v16, 0x4

    add-int/lit8 v1, v1, -0x4

    int-to-float v1, v1

    invoke-virtual {v8, v1}, Landroid/widget/TextView;->setTextSize(F)V

    if-eqz v9, :cond_1d

    .line 366
    sget v1, Lcom/flyersoft/tools/A;->shelfFontSize:I

    add-int/lit8 v1, v1, -0x4

    int-to-float v1, v1

    invoke-virtual {v9, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 367
    :cond_1d
    invoke-virtual {v7, v13}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 368
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->onShelfItemOverflowClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v7, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 369
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/tools/A;->getSelectedRes(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {v7, v1}, Landroid/view/View;->setBackgroundResource(I)V

    const/high16 v1, 0x41a00000    # 20.0f

    .line 370
    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    const/4 v3, 0x0

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    const/high16 v4, 0x42700000    # 60.0f

    invoke-static {v4}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    invoke-virtual {v10, v2, v3, v1, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 374
    :cond_1e
    :goto_d
    invoke-direct/range {p0 .. p2}, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->checkCoverHeightAndSetBackground(ILandroid/view/View;)V

    .line 376
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-boolean v1, v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->isGrid:Z

    const-string v2, "0%"

    const-string v3, "%"

    if-eqz v1, :cond_1f

    sget-boolean v1, Lcom/flyersoft/tools/A;->woody:Z

    if-nez v1, :cond_23

    .line 377
    :cond_1f
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->act:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v4, v15, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    iget-object v6, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-boolean v6, v6, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->isGrid:Z

    invoke-virtual {v1, v4, v15, v6}, Lcom/flyersoft/moonreaderp/ActivityMain;->getBookName2(Ljava/lang/String;Lcom/flyersoft/tools/BookDb$BookInfo;Z)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v8, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    if-eqz v9, :cond_20

    .line 378
    invoke-virtual {v9}, Landroid/widget/TextView;->getVisibility()I

    move-result v1

    if-nez v1, :cond_20

    .line 379
    iget-object v1, v15, Lcom/flyersoft/tools/BookDb$BookInfo;->author:Ljava/lang/String;

    invoke-virtual {v9, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_20
    if-gez v5, :cond_21

    move-object v1, v2

    goto :goto_e

    .line 380
    :cond_21
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_e
    invoke-virtual {v11, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    if-gez v5, :cond_22

    const/4 v6, 0x0

    goto :goto_f

    :cond_22
    move v6, v5

    .line 381
    :goto_f
    iput v6, v12, Lcom/flyersoft/views/ProgressViews/ProgressLineView;->progress:I

    .line 382
    invoke-virtual {v12}, Lcom/flyersoft/views/ProgressViews/ProgressLineView;->postInvalidate()V

    .line 385
    :cond_23
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-boolean v1, v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->isGrid:Z

    if-eqz v1, :cond_28

    .line 386
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->gauge:I

    move-object/from16 v4, p2

    invoke-virtual {v4, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/views/ProgressViews/ProgressGaugeTV;

    .line 387
    sget-boolean v6, Lcom/flyersoft/tools/A;->woody:Z

    if-eqz v6, :cond_27

    sget-boolean v6, Lcom/flyersoft/tools/A;->coverWithProgress:Z

    if-eqz v6, :cond_27

    const/4 v6, -0x1

    if-eq v5, v6, :cond_27

    .line 388
    sget-boolean v6, Lcom/flyersoft/tools/A;->isTablet:Z

    if-eqz v6, :cond_24

    .line 389
    invoke-virtual {v1}, Lcom/flyersoft/views/ProgressViews/ProgressGaugeTV;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    const/high16 v7, 0x42200000    # 40.0f

    invoke-static {v7}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v8

    iput v8, v6, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 390
    invoke-virtual {v1}, Lcom/flyersoft/views/ProgressViews/ProgressGaugeTV;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    invoke-static {v7}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v7

    iput v7, v6, Landroid/view/ViewGroup$LayoutParams;->height:I

    const/high16 v6, 0x41200000    # 10.0f

    .line 391
    invoke-virtual {v1, v6}, Lcom/flyersoft/views/ProgressViews/ProgressGaugeTV;->setTextSize(F)V

    :cond_24
    const/4 v6, 0x0

    .line 393
    invoke-virtual {v1, v6}, Lcom/flyersoft/views/ProgressViews/ProgressGaugeTV;->setVisibility(I)V

    if-gez v5, :cond_25

    goto :goto_10

    :cond_25
    move v6, v5

    .line 394
    :goto_10
    invoke-virtual {v1, v6}, Lcom/flyersoft/views/ProgressViews/ProgressGaugeTV;->setProgress(I)V

    if-gez v5, :cond_26

    goto :goto_11

    .line 395
    :cond_26
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_11
    invoke-virtual {v1, v2}, Lcom/flyersoft/views/ProgressViews/ProgressGaugeTV;->setText(Ljava/lang/CharSequence;)V

    goto :goto_12

    :cond_27
    const/16 v2, 0x8

    .line 397
    invoke-virtual {v1, v2}, Lcom/flyersoft/views/ProgressViews/ProgressGaugeTV;->setVisibility(I)V

    .line 398
    :goto_12
    sget-boolean v1, Lcom/flyersoft/tools/A;->isTablet:Z

    if-eqz v1, :cond_2a

    .line 399
    invoke-virtual {v13}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    const/high16 v2, 0x40a00000    # 5.0f

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    iput v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    goto :goto_14

    :cond_28
    move-object/from16 v4, p2

    .line 400
    sget-boolean v1, Lcom/flyersoft/tools/A;->woody:Z

    if-eqz v1, :cond_2a

    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->act:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->isWoodyDark()Z

    move-result v1

    if-nez v1, :cond_2a

    .line 401
    invoke-virtual {v13}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-static {}, Lcom/flyersoft/tools/A;->woodyRes()I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_29

    const v6, -0x99999a

    goto :goto_13

    :cond_29
    const v6, -0xbbbbbc

    :goto_13
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v1, v6, v2}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 403
    :cond_2a
    :goto_14
    invoke-virtual {v13, v15}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 404
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->onShelfItemOverflowClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v13, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    move-object/from16 v1, v18

    .line 405
    invoke-virtual {v1, v15}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 406
    iget-object v2, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->onBookRemove:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 408
    invoke-virtual {v4, v15}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 409
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->onBookClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v4, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public getItemCount()I
    .locals 4

    .line 248
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 249
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->itemCount:Ljava/lang/Integer;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->bookCount:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 250
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->itemCount:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0

    .line 251
    :cond_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->bookCount:Ljava/lang/Integer;

    .line 252
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    invoke-static {v1}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->-$$Nest$fgetshelfColumn(Lcom/flyersoft/moonreaderp/PrefGroupBooks;)I

    move-result v1

    div-int v1, v0, v1

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    invoke-static {v2}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->-$$Nest$fgetshelfColumn(Lcom/flyersoft/moonreaderp/PrefGroupBooks;)I

    move-result v2

    const/4 v3, 0x1

    if-le v2, v3, :cond_1

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    invoke-static {v2}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->-$$Nest$fgetshelfColumn(Lcom/flyersoft/moonreaderp/PrefGroupBooks;)I

    move-result v2

    rem-int/2addr v0, v2

    if-lez v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    :goto_0
    add-int/2addr v1, v3

    .line 253
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->-$$Nest$fgetshelfColumn(Lcom/flyersoft/moonreaderp/PrefGroupBooks;)I

    move-result v0

    mul-int v1, v1, v0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->itemCount:Ljava/lang/Integer;

    .line 254
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 4

    .line 226
    iget-object v0, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 227
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget v1, v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->coverWidth:I

    if-nez v1, :cond_0

    .line 228
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget v2, v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->gridWidth:I

    iput v2, v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->coverWidth:I

    .line 229
    sget-boolean v1, Lcom/flyersoft/tools/A;->woody:Z

    if-nez v1, :cond_0

    .line 230
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->cardView:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 231
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget v2, v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->gridWidth:I

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

    iput v2, v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->coverWidth:I

    .line 234
    :cond_0
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

    invoke-super {p0, p2, p1, v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;->fillData(ILandroid/view/View;Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;)V

    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 7

    .line 199
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-boolean p2, p2, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->isGrid:Z

    if-eqz p2, :cond_0

    sget p2, Lcom/flyersoft/moonreaderp/R$layout;->shelf_grid_item:I

    goto :goto_0

    :cond_0
    sget p2, Lcom/flyersoft/moonreaderp/R$layout;->shelf_list_item:I

    .line 200
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 201
    sget-boolean p2, Lcom/flyersoft/tools/A;->mainNightTheme:Z

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-boolean p2, p2, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->isGrid:Z

    if-nez p2, :cond_2

    :cond_1
    sget-boolean p2, Lcom/flyersoft/tools/A;->woody:Z

    if-eqz p2, :cond_5

    .line 202
    :cond_2
    sget p2, Lcom/flyersoft/moonreaderp/R$id;->cardView:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroidx/cardview/widget/CardView;

    .line 203
    invoke-virtual {p2}, Landroidx/cardview/widget/CardView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    const/4 v2, 0x0

    .line 204
    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    iput v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    iput v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iput v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    iput v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 205
    invoke-virtual {p2, v1, v1, v1, v1}, Landroidx/cardview/widget/CardView;->setPadding(IIII)V

    .line 206
    invoke-virtual {p2, v2}, Landroidx/cardview/widget/CardView;->setElevation(F)V

    .line 207
    invoke-virtual {p2, v2}, Landroidx/cardview/widget/CardView;->setCardElevation(F)V

    .line 208
    invoke-virtual {p2, v2}, Landroidx/cardview/widget/CardView;->setRadius(F)V

    .line 210
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-boolean p2, p2, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->isGrid:Z

    const/high16 v0, 0x41a80000    # 21.0f

    const/high16 v2, 0x41700000    # 15.0f

    if-eqz p2, :cond_3

    .line 211
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

    .line 212
    sget-boolean p2, Lcom/flyersoft/tools/A;->woody:Z

    if-eqz p2, :cond_3

    .line 213
    sget p2, Lcom/flyersoft/moonreaderp/R$id;->nameLay:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    const/16 v3, 0x8

    invoke-virtual {p2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 214
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

    .line 217
    :cond_3
    sget-boolean p2, Lcom/flyersoft/tools/A;->woody:Z

    if-eqz p2, :cond_5

    .line 218
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

    .line 221
    :cond_5
    new-instance p2, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$Holder;

    invoke-direct {p2, p0, p1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$Holder;-><init>(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;Landroid/view/View;)V

    return-object p2
.end method

.method public removeBookFromGroup(Lcom/flyersoft/tools/BookDb$BookInfo;)V
    .locals 2

    .line 438
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rootBi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v0, v0, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    iget-object v1, p1, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 439
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rootBi:Lcom/flyersoft/tools/BookDb$BookInfo;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/flyersoft/tools/BookDb;->insertBook(Lcom/flyersoft/tools/BookDb$BookInfo;Z)J

    .line 441
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p1

    .line 442
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    .line 444
    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->notifyItemRemoved(I)V

    .line 445
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-le v0, p1, :cond_1

    .line 446
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->notifyItemRangeChanged(II)V

    goto :goto_0

    .line 448
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->notifyDataSetChanged()V

    .line 449
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    const/4 v0, 0x2

    iput v0, p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->modifyLevel:I

    return-void
.end method
