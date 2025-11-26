.class public Lcom/flyersoft/moonreaderp/PrefChapters$MainPagerAdapter;
.super Landroidx/viewpager/widget/PagerAdapter;
.source "PrefChapters.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefChapters;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "MainPagerAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

.field views:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/flyersoft/moonreaderp/PrefChapters;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 271
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$MainPagerAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-direct {p0}, Landroidx/viewpager/widget/PagerAdapter;-><init>()V

    .line 280
    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$MainPagerAdapter;->views:Landroid/util/SparseArray;

    return-void
.end method


# virtual methods
.method public destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0

    return-void
.end method

.method public getCount()I
    .locals 1

    .line 273
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$MainPagerAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->showImageTab:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x3

    return v0

    :cond_0
    const/4 v0, 0x2

    return v0
.end method

.method public getPageTitle(I)Ljava/lang/CharSequence;
    .locals 1

    if-nez p1, :cond_0

    .line 309
    sget p1, Lcom/flyersoft/moonreaderp/R$string;->button_chapters:I

    invoke-static {p1}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    .line 310
    sget p1, Lcom/flyersoft/moonreaderp/R$string;->button_bookmarks:I

    invoke-static {p1}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 312
    :cond_1
    const-string p1, " "

    return-object p1
.end method

.method public instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 3

    .line 282
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$MainPagerAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "layout_inflater"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/LayoutInflater;

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->mainPagerInflater:Landroid/view/LayoutInflater;

    .line 283
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$MainPagerAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iput-object p1, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->mainPagerContainer:Landroid/view/ViewGroup;

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eq p2, v0, :cond_1

    const/4 v0, 0x2

    if-eq p2, v0, :cond_0

    .line 293
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$MainPagerAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$mshow_chapter(Lcom/flyersoft/moonreaderp/PrefChapters;Z)Landroid/view/View;

    move-result-object v0

    goto :goto_0

    .line 290
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$MainPagerAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$mshow_images(Lcom/flyersoft/moonreaderp/PrefChapters;Z)Landroid/view/View;

    move-result-object v0

    goto :goto_0

    .line 287
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$MainPagerAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$mshow_bookmark(Lcom/flyersoft/moonreaderp/PrefChapters;Z)Landroid/view/View;

    move-result-object v0

    .line 295
    :goto_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$MainPagerAdapter;->views:Landroid/util/SparseArray;

    invoke-virtual {v2, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_2

    .line 296
    invoke-virtual {p1, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 297
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$MainPagerAdapter;->views:Landroid/util/SparseArray;

    invoke-virtual {p1, p2, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    return-object v0

    .line 299
    :cond_2
    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    return-object v0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0

    .line 304
    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method
