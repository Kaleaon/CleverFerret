.class public Lcom/flyersoft/moonreaderp/ActivityMain$MainPagerAdapter;
.super Landroidx/viewpager/widget/PagerAdapter;
.source "ActivityMain.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "MainPagerAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

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
.method public constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1111
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$MainPagerAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Landroidx/viewpager/widget/PagerAdapter;-><init>()V

    .line 1120
    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$MainPagerAdapter;->views:Landroid/util/SparseArray;

    return-void
.end method


# virtual methods
.method public destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0

    return-void
.end method

.method public getCount()I
    .locals 1

    const v0, 0xf4240

    return v0
.end method

.method public instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 3

    .line 1122
    rem-int/lit8 p2, p2, 0x5

    .line 1123
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$MainPagerAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "layout_inflater"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/LayoutInflater;

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->mainPagerInflater:Landroid/view/LayoutInflater;

    .line 1124
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$MainPagerAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->mainPagerContainer:Landroid/view/ViewGroup;

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eq p2, v0, :cond_3

    const/4 v0, 0x2

    if-eq p2, v0, :cond_2

    const/4 v0, 0x3

    if-eq p2, v0, :cond_1

    const/4 v0, 0x4

    if-eq p2, v0, :cond_0

    .line 1141
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$MainPagerAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->show_main_dash(Z)Landroid/view/View;

    move-result-object v0

    goto :goto_0

    .line 1138
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$MainPagerAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->show_main_bookmarks(Z)Landroid/view/View;

    move-result-object v0

    goto :goto_0

    .line 1132
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$MainPagerAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->show_main_library(Z)Landroid/view/View;

    move-result-object v0

    goto :goto_0

    .line 1129
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$MainPagerAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->show_main_files(Z)Landroid/view/View;

    move-result-object v0

    goto :goto_0

    .line 1135
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$MainPagerAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->show_main_shelf(Z)Landroid/view/View;

    move-result-object v0

    .line 1144
    :goto_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$MainPagerAdapter;->views:Landroid/util/SparseArray;

    invoke-virtual {v2, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_4

    .line 1145
    check-cast p1, Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {p1, v0, v1}, Landroidx/viewpager/widget/ViewPager;->addView(Landroid/view/View;I)V

    .line 1146
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$MainPagerAdapter;->views:Landroid/util/SparseArray;

    invoke-virtual {p1, p2, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    return-object v0

    .line 1148
    :cond_4
    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    return-object v0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0

    .line 1154
    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method
