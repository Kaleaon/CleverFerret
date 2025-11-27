.class public Lcom/flyersoft/moonreaderp/PrefGroupBooks;
.super Landroid/app/Dialog;
.source "PrefGroupBooks.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/moonreaderp/PrefGroupBooks$OnGroupMoveOut;,
        Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;,
        Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedDragItem;
    }
.end annotation


# static fields
.field public static selfPref:Lcom/flyersoft/moonreaderp/PrefGroupBooks;


# instance fields
.field act:Lcom/flyersoft/moonreaderp/ActivityMain;

.field coverWidth:I

.field dismissed:Z

.field gridWidth:I

.field groupAdapter:Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;

.field isGrid:Z

.field listShelfBooks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$BookInfo;",
            ">;"
        }
    .end annotation
.end field

.field mShowRemoveButton:Z

.field modifyLevel:I

.field onOutsite:Lcom/flyersoft/moonreaderp/PrefGroupBooks$OnGroupMoveOut;

.field onShelfItemOverflowClick:Landroid/view/View$OnClickListener;

.field removeOutsideFile:Ljava/lang/String;

.field root:Lcom/flyersoft/views/recyclerview/MergedLinearLayout;

.field rootBi:Lcom/flyersoft/tools/BookDb$BookInfo;

.field rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

.field rvCard:Landroidx/cardview/widget/CardView;

.field private shelfColumn:I

.field shelfCoverSize:I

.field showInputTitle:Z

.field startHolder:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

.field titleEt:Lcom/flyersoft/views/ClearableEditText;


# direct methods
.method static bridge synthetic -$$Nest$fgetshelfColumn(Lcom/flyersoft/moonreaderp/PrefGroupBooks;)I
    .locals 0

    iget p0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->shelfColumn:I

    return p0
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/flyersoft/tools/BookDb$BookInfo;ZLcom/flyersoft/moonreaderp/PrefGroupBooks$OnGroupMoveOut;)V
    .locals 1

    .line 76
    sget-boolean v0, Lcom/flyersoft/tools/A;->eink:Z

    if-eqz v0, :cond_0

    sget v0, Lcom/flyersoft/moonreaderp/R$style;->dialog_fullscreen_ink:I

    goto :goto_0

    :cond_0
    sget v0, Lcom/flyersoft/moonreaderp/R$style;->dialog_fullscreen:I

    :goto_0
    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 61
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->listShelfBooks:Ljava/util/ArrayList;

    .line 526
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;-><init>(Lcom/flyersoft/moonreaderp/PrefGroupBooks;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->onShelfItemOverflowClick:Landroid/view/View$OnClickListener;

    const/4 p1, 0x1

    .line 610
    iput p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->shelfColumn:I

    .line 77
    sput-object p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->selfPref:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    .line 78
    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rootBi:Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 79
    iput-boolean p3, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->showInputTitle:Z

    .line 80
    iput-object p4, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->onOutsite:Lcom/flyersoft/moonreaderp/PrefGroupBooks$OnGroupMoveOut;

    .line 82
    iget-object p2, p2, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    sput-object p2, Lcom/flyersoft/tools/A;->shelf_last_pop:Ljava/lang/String;

    .line 83
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->createShelfBooks()V

    .line 85
    sget-object p2, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->act:Lcom/flyersoft/moonreaderp/ActivityMain;

    .line 86
    sget p2, Lcom/flyersoft/tools/A;->shelfStyle:I

    if-eqz p2, :cond_1

    goto :goto_1

    :cond_1
    const/4 p1, 0x0

    :goto_1
    iput-boolean p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->isGrid:Z

    .line 88
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    sget p2, Lcom/flyersoft/moonreaderp/R$layout;->merged_popup:I

    const/4 p3, 0x0

    invoke-virtual {p1, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->root:Lcom/flyersoft/views/recyclerview/MergedLinearLayout;

    .line 89
    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->setContentView(Landroid/view/View;)V

    return-void
.end method

.method private createShelfBooks()V
    .locals 4

    .line 93
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 94
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rootBi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v1, v1, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 95
    sget-object v3, Lcom/flyersoft/tools/A;->listShelfBookCaches:Ljava/util/HashMap;

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/tools/BookDb$BookInfo;

    if-nez v3, :cond_0

    .line 97
    invoke-static {v2}, Lcom/flyersoft/tools/BookDb;->getBook(Ljava/lang/String;)Lcom/flyersoft/tools/BookDb$BookInfo;

    move-result-object v3

    :cond_0
    if-eqz v3, :cond_1

    .line 99
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 101
    :cond_1
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 103
    :cond_2
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 104
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 105
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rootBi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v2, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_1

    .line 106
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rootBi:Lcom/flyersoft/tools/BookDb$BookInfo;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/flyersoft/tools/BookDb;->insertBook(Lcom/flyersoft/tools/BookDb$BookInfo;Z)J

    const/4 v0, 0x1

    .line 107
    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->modifyLevel:I

    :cond_4
    return-void
.end method

.method public static dismissNull()V
    .locals 3

    .line 744
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->selfPref:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 745
    invoke-virtual {v0, v2, v1, v2}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->dismiss(Ljava/lang/String;ILcom/flyersoft/moonreaderp/PrefGroupBooks$OnGroupMoveOut;)V

    :cond_0
    return-void
.end method

.method private initView()V
    .locals 6

    .line 125
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->root:Lcom/flyersoft/views/recyclerview/MergedLinearLayout;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->card:I

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/cardview/widget/CardView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rvCard:Landroidx/cardview/widget/CardView;

    .line 126
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->root:Lcom/flyersoft/views/recyclerview/MergedLinearLayout;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->rv:I

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    .line 127
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->root:Lcom/flyersoft/views/recyclerview/MergedLinearLayout;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->tv:I

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/views/ClearableEditText;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->titleEt:Lcom/flyersoft/views/ClearableEditText;

    const/4 v1, 0x4

    .line 128
    invoke-virtual {v0, v1}, Lcom/flyersoft/views/ClearableEditText;->setVisibility(I)V

    .line 129
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->titleEt:Lcom/flyersoft/views/ClearableEditText;

    invoke-virtual {v0}, Lcom/flyersoft/views/ClearableEditText;->setSingleLine()V

    .line 130
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->titleEt:Lcom/flyersoft/views/ClearableEditText;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rootBi:Lcom/flyersoft/tools/BookDb$BookInfo;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/flyersoft/tools/BookDb$BookInfo;->getGroupName(Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/ClearableEditText;->setText(Ljava/lang/CharSequence;)V

    .line 132
    invoke-static {}, Lcom/flyersoft/tools/A;->isLandscape()Z

    move-result v0

    const/high16 v1, 0x41a00000    # 20.0f

    if-eqz v0, :cond_0

    .line 133
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->root:Lcom/flyersoft/views/recyclerview/MergedLinearLayout;

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v5

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    invoke-virtual {v0, v3, v4, v5, v1}, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->setPadding(IIII)V

    goto :goto_2

    .line 134
    :cond_0
    sget-boolean v0, Lcom/flyersoft/tools/A;->isTablet:Z

    if-nez v0, :cond_1

    sget-boolean v0, Lcom/flyersoft/tools/A;->isLargePhone:Z

    if-nez v0, :cond_1

    invoke-static {}, Lcom/flyersoft/tools/A;->isFullScreenPhone()Z

    move-result v0

    if-nez v0, :cond_1

    .line 135
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->root:Lcom/flyersoft/views/recyclerview/MergedLinearLayout;

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    const/high16 v4, 0x42700000    # 60.0f

    invoke-static {v4}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v5

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    invoke-static {v4}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    invoke-virtual {v0, v3, v5, v1, v4}, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->setPadding(IIII)V

    goto :goto_2

    .line 137
    :cond_1
    sget-boolean v0, Lcom/flyersoft/tools/A;->isLargeTablet:Z

    if-eqz v0, :cond_2

    const/high16 v0, 0x43480000    # 200.0f

    :goto_0
    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    goto :goto_1

    :cond_2
    sget-boolean v0, Lcom/flyersoft/tools/A;->isTablet:Z

    if-nez v0, :cond_3

    sget-boolean v0, Lcom/flyersoft/tools/A;->isLargePhone:Z

    if-nez v0, :cond_3

    const/high16 v0, 0x43020000    # 130.0f

    goto :goto_0

    :cond_3
    const/high16 v0, 0x430c0000    # 140.0f

    goto :goto_0

    .line 138
    :goto_1
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->root:Lcom/flyersoft/views/recyclerview/MergedLinearLayout;

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    const/high16 v5, 0x42480000    # 50.0f

    invoke-static {v5}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v5

    add-int/2addr v5, v0

    invoke-virtual {v3, v4, v0, v1, v5}, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->setPadding(IIII)V

    .line 141
    :goto_2
    invoke-static {}, Lcom/flyersoft/tools/A;->getScreenWidth()I

    move-result v0

    invoke-static {}, Lcom/flyersoft/tools/A;->myOptionDialogWidth()I

    move-result v1

    sub-int/2addr v0, v1

    if-lez v0, :cond_4

    .line 143
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->root:Lcom/flyersoft/views/recyclerview/MergedLinearLayout;

    invoke-virtual {v1}, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->getPaddingLeft()I

    move-result v3

    div-int/lit8 v0, v0, 0x2

    add-int/2addr v3, v0

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->root:Lcom/flyersoft/views/recyclerview/MergedLinearLayout;

    invoke-virtual {v4}, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->getPaddingTop()I

    move-result v4

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->root:Lcom/flyersoft/views/recyclerview/MergedLinearLayout;

    invoke-virtual {v5}, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->getPaddingRight()I

    move-result v5

    add-int/2addr v5, v0

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->root:Lcom/flyersoft/views/recyclerview/MergedLinearLayout;

    invoke-virtual {v0}, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->getPaddingBottom()I

    move-result v0

    invoke-virtual {v1, v3, v4, v5, v0}, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->setPadding(IIII)V

    .line 145
    :cond_4
    sget-boolean v0, Lcom/flyersoft/tools/A;->woody:Z

    if-nez v0, :cond_5

    .line 146
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getPaddingLeft()I

    move-result v1

    const/high16 v3, 0x41200000    # 10.0f

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v5}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getPaddingRight()I

    move-result v5

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    invoke-virtual {v0, v1, v4, v5, v3}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setPadding(IIII)V

    .line 148
    :cond_5
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->root:Lcom/flyersoft/views/recyclerview/MergedLinearLayout;

    invoke-virtual {v0, p0}, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 149
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->root:Lcom/flyersoft/views/recyclerview/MergedLinearLayout;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$1;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefGroupBooks$1;-><init>(Lcom/flyersoft/moonreaderp/PrefGroupBooks;)V

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->setOnCoverHoldOutsite(Lcom/flyersoft/tools/T$OnResult;)V

    .line 157
    sget-boolean v0, Lcom/flyersoft/tools/A;->woody:Z

    if-eqz v0, :cond_6

    .line 158
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v2}, Lcom/flyersoft/tools/A;->getWoodyDrawable(Landroid/content/Context;Z)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_3

    .line 160
    :cond_6
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-static {}, Lcom/flyersoft/tools/C;->getOtherFrameColor()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setBackgroundColor(I)V

    .line 162
    :goto_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->root:Lcom/flyersoft/views/recyclerview/MergedLinearLayout;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$2;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefGroupBooks$2;-><init>(Lcom/flyersoft/moonreaderp/PrefGroupBooks;)V

    const-wide/16 v2, 0x32

    invoke-virtual {v0, v1, v2, v3}, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 184
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->titleEt:Lcom/flyersoft/views/ClearableEditText;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$3;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefGroupBooks$3;-><init>(Lcom/flyersoft/moonreaderp/PrefGroupBooks;)V

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/ClearableEditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    return-void
.end method

.method public static savePosition()V
    .locals 3

    .line 779
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->selfPref:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    if-eqz v0, :cond_0

    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->groupAdapter:Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;

    if-eqz v1, :cond_0

    .line 780
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "pop_group"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    sget-object v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->selfPref:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rootBi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v1, v1, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    sget-object v2, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->selfPref:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    .line 781
    invoke-virtual {v2}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->findFirstVisibleItem()I

    move-result v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->selfPref:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rootBi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v2, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "##"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->selfPref:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    .line 782
    invoke-virtual {v2}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getScrollOffset()I

    move-result v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 783
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    :cond_0
    return-void
.end method

.method public static updateGroupShelf()Z
    .locals 1

    .line 596
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->selfPref:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    if-eqz v0, :cond_0

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->groupAdapter:Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;

    if-eqz v0, :cond_0

    .line 597
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->notifyDataSetChanged()V

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method public dismiss()V
    .locals 4

    const/4 v0, 0x1

    .line 759
    iput-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->dismissed:Z

    .line 761
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->titleEt:Lcom/flyersoft/views/ClearableEditText;

    invoke-virtual {v1}, Lcom/flyersoft/views/ClearableEditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 762
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rootBi:Lcom/flyersoft/tools/BookDb$BookInfo;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/flyersoft/tools/BookDb$BookInfo;->getGroupName(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 763
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rootBi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iput-object v1, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->groupName:Ljava/lang/String;

    .line 764
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rootBi:Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-static {v1, v3}, Lcom/flyersoft/tools/BookDb;->insertBook(Lcom/flyersoft/tools/BookDb$BookInfo;Z)J

    .line 765
    iget v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->modifyLevel:I

    if-ge v1, v0, :cond_0

    .line 766
    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->modifyLevel:I

    .line 769
    :cond_0
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->savePosition()V

    const/4 v0, 0x0

    .line 771
    sput-object v0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->selfPref:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    .line 772
    const-string v0, ""

    sput-object v0, Lcom/flyersoft/tools/A;->shelf_last_pop:Ljava/lang/String;

    .line 773
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    .line 774
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->onOutsite:Lcom/flyersoft/moonreaderp/PrefGroupBooks$OnGroupMoveOut;

    if-eqz v0, :cond_1

    .line 775
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->removeOutsideFile:Ljava/lang/String;

    iget v2, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->modifyLevel:I

    invoke-interface {v0, v1, v2}, Lcom/flyersoft/moonreaderp/PrefGroupBooks$OnGroupMoveOut;->done(Ljava/lang/String;I)V

    :cond_1
    return-void
.end method

.method public dismiss(Ljava/lang/String;ILcom/flyersoft/moonreaderp/PrefGroupBooks$OnGroupMoveOut;)V
    .locals 0

    .line 749
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->removeOutsideFile:Ljava/lang/String;

    .line 750
    iput p2, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->modifyLevel:I

    .line 751
    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->onOutsite:Lcom/flyersoft/moonreaderp/PrefGroupBooks$OnGroupMoveOut;

    .line 752
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->dismiss()V

    return-void
.end method

.method public initColumnCount()V
    .locals 3

    .line 614
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->isGrid:Z

    if-eqz v0, :cond_4

    .line 615
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->shelfCoverSize:I

    int-to-float v0, v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    sget-boolean v1, Lcom/flyersoft/tools/A;->isLargeTablet:Z

    if-eqz v1, :cond_0

    const/16 v1, 0x8a

    goto :goto_0

    :cond_0
    sget-boolean v1, Lcom/flyersoft/tools/A;->isTablet:Z

    if-eqz v1, :cond_1

    const/16 v1, 0x88

    goto :goto_0

    :cond_1
    const/16 v1, 0x6e

    :goto_0
    mul-int v0, v0, v1

    div-int/lit8 v0, v0, 0x64

    .line 616
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getWidth()I

    move-result v1

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v2}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getPaddingLeft()I

    move-result v2

    sub-int/2addr v1, v2

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v2}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getPaddingRight()I

    move-result v2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    int-to-float v0, v0

    div-float/2addr v1, v0

    .line 617
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v0

    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->shelfColumn:I

    const/4 v1, 0x2

    if-ge v0, v1, :cond_2

    .line 619
    iput v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->shelfColumn:I

    .line 620
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getWidth()I

    move-result v0

    sget-boolean v1, Lcom/flyersoft/tools/A;->woody:Z

    if-eqz v1, :cond_3

    const/high16 v1, 0x41a00000    # 20.0f

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    goto :goto_1

    :cond_3
    const/4 v1, 0x0

    :goto_1
    sub-int/2addr v0, v1

    iget v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->shelfColumn:I

    div-int/2addr v0, v1

    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->gridWidth:I

    return-void

    :cond_4
    const/4 v0, 0x1

    .line 622
    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->shelfColumn:I

    return-void
.end method

.method public onBackPressed()V
    .locals 1

    .line 789
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->mShowRemoveButton:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 790
    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->showRemoveButton(Z)V

    return-void

    .line 793
    :cond_0
    invoke-super {p0}, Landroid/app/Dialog;->onBackPressed()V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 739
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->root:Lcom/flyersoft/views/recyclerview/MergedLinearLayout;

    if-ne p1, v0, :cond_0

    .line 740
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->dismiss()V

    :cond_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 113
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 115
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object p1

    const/4 v0, -0x1

    .line 116
    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 117
    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->height:I

    const v0, 0x3f6147ae    # 0.88f

    .line 118
    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->dimAmount:F

    const/16 v0, 0x11

    .line 119
    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 121
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->initView()V

    return-void
.end method

.method showRemoveButton(Z)V
    .locals 0

    .line 606
    iput-boolean p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->mShowRemoveButton:Z

    .line 607
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->updateGroupShelf()Z

    return-void
.end method
