.class public Lcom/flyersoft/moonreaderp/PrefGroupPick;
.super Landroid/app/Dialog;
.source "PrefGroupPick.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/moonreaderp/PrefGroupPick$OnGroupSelect;,
        Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;
    }
.end annotation


# instance fields
.field act:Lcom/flyersoft/moonreaderp/ActivityMain;

.field coverWidth:I

.field gridWidth:I

.field groupAdapter:Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;

.field groups:Ljava/util/ArrayList;
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

.field onGroupSelect:Lcom/flyersoft/moonreaderp/PrefGroupPick$OnGroupSelect;

.field root:Lcom/flyersoft/views/recyclerview/MergedLinearLayout;

.field rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

.field rvCard:Landroidx/cardview/widget/CardView;

.field selected:Lcom/flyersoft/tools/BookDb$BookInfo;

.field private shelfColumn:I

.field shelfCoverSize:I

.field titleEt:Landroid/widget/EditText;


# direct methods
.method static bridge synthetic -$$Nest$fgetshelfColumn(Lcom/flyersoft/moonreaderp/PrefGroupPick;)I
    .locals 0

    iget p0, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->shelfColumn:I

    return p0
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/util/ArrayList;Lcom/flyersoft/moonreaderp/PrefGroupPick$OnGroupSelect;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$BookInfo;",
            ">;",
            "Lcom/flyersoft/moonreaderp/PrefGroupPick$OnGroupSelect;",
            ")V"
        }
    .end annotation

    .line 58
    sget-boolean v0, Lcom/flyersoft/tools/A;->eink:Z

    if-eqz v0, :cond_0

    sget v0, Lcom/flyersoft/moonreaderp/R$style;->dialog_fullscreen_ink:I

    goto :goto_0

    :cond_0
    sget v0, Lcom/flyersoft/moonreaderp/R$style;->dialog_fullscreen:I

    :goto_0
    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    const/4 p1, 0x1

    .line 293
    iput p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->shelfColumn:I

    .line 59
    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->onGroupSelect:Lcom/flyersoft/moonreaderp/PrefGroupPick$OnGroupSelect;

    .line 60
    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->groups:Ljava/util/ArrayList;

    .line 62
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->act:Lcom/flyersoft/moonreaderp/ActivityMain;

    .line 63
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefGroupPick;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    sget p2, Lcom/flyersoft/moonreaderp/R$layout;->merged_popup:I

    const/4 p3, 0x0

    invoke-virtual {p1, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->root:Lcom/flyersoft/views/recyclerview/MergedLinearLayout;

    .line 64
    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/PrefGroupPick;->setContentView(Landroid/view/View;)V

    return-void
.end method

.method private initView()V
    .locals 6

    .line 81
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->root:Lcom/flyersoft/views/recyclerview/MergedLinearLayout;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->card:I

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/cardview/widget/CardView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->rvCard:Landroidx/cardview/widget/CardView;

    .line 82
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->root:Lcom/flyersoft/views/recyclerview/MergedLinearLayout;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->rv:I

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    .line 83
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->root:Lcom/flyersoft/views/recyclerview/MergedLinearLayout;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->tv:I

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->titleEt:Landroid/widget/EditText;

    const/4 v1, 0x4

    .line 84
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setVisibility(I)V

    .line 86
    invoke-static {}, Lcom/flyersoft/tools/A;->isLandscape()Z

    move-result v0

    const/high16 v1, 0x41200000    # 10.0f

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    .line 87
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->root:Lcom/flyersoft/views/recyclerview/MergedLinearLayout;

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v5

    invoke-virtual {v0, v3, v4, v2, v5}, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->setPadding(IIII)V

    goto :goto_2

    .line 88
    :cond_0
    sget-boolean v0, Lcom/flyersoft/tools/A;->isTablet:Z

    const/high16 v3, 0x42200000    # 40.0f

    if-nez v0, :cond_1

    sget-boolean v0, Lcom/flyersoft/tools/A;->isLargePhone:Z

    if-nez v0, :cond_1

    invoke-static {}, Lcom/flyersoft/tools/A;->isFullScreenPhone()Z

    move-result v0

    if-nez v0, :cond_1

    .line 89
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->root:Lcom/flyersoft/views/recyclerview/MergedLinearLayout;

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v5

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    invoke-virtual {v0, v4, v5, v2, v3}, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->setPadding(IIII)V

    goto :goto_2

    .line 91
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

    .line 92
    :goto_1
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->root:Lcom/flyersoft/views/recyclerview/MergedLinearLayout;

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v5

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    add-int/2addr v3, v0

    invoke-virtual {v4, v5, v0, v2, v3}, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->setPadding(IIII)V

    .line 95
    :goto_2
    sget-boolean v0, Lcom/flyersoft/tools/A;->woody:Z

    if-nez v0, :cond_4

    .line 96
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getPaddingLeft()I

    move-result v2

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v4}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getPaddingRight()I

    move-result v4

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    invoke-virtual {v0, v2, v3, v4, v1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setPadding(IIII)V

    .line 98
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->root:Lcom/flyersoft/views/recyclerview/MergedLinearLayout;

    invoke-virtual {v0, p0}, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 100
    sget-boolean v0, Lcom/flyersoft/tools/A;->woody:Z

    if-eqz v0, :cond_5

    .line 101
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefGroupPick;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/flyersoft/tools/A;->getWoodyDrawable(Landroid/content/Context;Z)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_3

    .line 103
    :cond_5
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-static {}, Lcom/flyersoft/tools/C;->getOtherFrameColor()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setBackgroundColor(I)V

    .line 105
    :goto_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->root:Lcom/flyersoft/views/recyclerview/MergedLinearLayout;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefGroupPick$1;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefGroupPick$1;-><init>(Lcom/flyersoft/moonreaderp/PrefGroupPick;)V

    const-wide/16 v2, 0x32

    invoke-virtual {v0, v1, v2, v3}, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method


# virtual methods
.method public dismiss()V
    .locals 3

    .line 312
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    .line 313
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->onGroupSelect:Lcom/flyersoft/moonreaderp/PrefGroupPick$OnGroupSelect;

    if-eqz v0, :cond_0

    .line 314
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->selected:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget v2, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->modifyLevel:I

    invoke-interface {v0, v1, v2}, Lcom/flyersoft/moonreaderp/PrefGroupPick$OnGroupSelect;->done(Lcom/flyersoft/tools/BookDb$BookInfo;I)V

    :cond_0
    return-void
.end method

.method public initColumnCount()V
    .locals 3

    .line 297
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->shelfCoverSize:I

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

    .line 298
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getWidth()I

    move-result v1

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v2}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getPaddingLeft()I

    move-result v2

    sub-int/2addr v1, v2

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v2}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getPaddingRight()I

    move-result v2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    int-to-float v0, v0

    div-float/2addr v1, v0

    .line 299
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v0

    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->shelfColumn:I

    const/4 v1, 0x2

    if-ge v0, v1, :cond_2

    .line 301
    iput v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->shelfColumn:I

    .line 302
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

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

    iget v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->shelfColumn:I

    div-int/2addr v0, v1

    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->gridWidth:I

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 306
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->root:Lcom/flyersoft/views/recyclerview/MergedLinearLayout;

    if-ne p1, v0, :cond_0

    .line 307
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefGroupPick;->dismiss()V

    :cond_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 69
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 71
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefGroupPick;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object p1

    .line 72
    invoke-static {}, Lcom/flyersoft/tools/A;->myOptionDialogWidth()I

    move-result v0

    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->width:I

    const/4 v0, -0x1

    .line 73
    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->height:I

    const v0, 0x3f6147ae    # 0.88f

    .line 74
    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->dimAmount:F

    const/16 v0, 0x11

    .line 75
    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 77
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefGroupPick;->initView()V

    return-void
.end method
