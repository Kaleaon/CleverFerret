.class public Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView$MainPagerAdapter;
.super Landroidx/viewpager/widget/PagerAdapter;
.source "NamesReplacementPreview.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "MainPagerAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;

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
.method public constructor <init>(Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 77
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView$MainPagerAdapter;->this$0:Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;

    invoke-direct {p0}, Landroidx/viewpager/widget/PagerAdapter;-><init>()V

    .line 84
    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView$MainPagerAdapter;->views:Landroid/util/SparseArray;

    return-void
.end method


# virtual methods
.method public destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0

    return-void
.end method

.method public getCount()I
    .locals 1

    const/4 v0, 0x4

    return v0
.end method

.method public getPageTitle(I)Ljava/lang/CharSequence;
    .locals 1

    if-nez p1, :cond_0

    .line 115
    const-string p1, "Preview"

    return-object p1

    :cond_0
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    .line 116
    const-string p1, "Original"

    return-object p1

    :cond_1
    const/4 v0, 0x2

    if-ne p1, v0, :cond_2

    .line 117
    const-string p1, "HTML(Before)"

    return-object p1

    :cond_2
    const-string p1, "HTML(After)"

    return-object p1
.end method

.method public instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 2

    if-eqz p2, :cond_2

    const/4 v0, 0x1

    if-eq p2, v0, :cond_1

    const/4 v0, 0x2

    if-eq p2, v0, :cond_0

    .line 99
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView$MainPagerAdapter;->this$0:Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;->-$$Nest$mcreate_html_after(Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;)Landroid/view/View;

    move-result-object v0

    goto :goto_0

    .line 96
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView$MainPagerAdapter;->this$0:Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;->-$$Nest$mcreate_html_before(Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;)Landroid/view/View;

    move-result-object v0

    goto :goto_0

    .line 93
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView$MainPagerAdapter;->this$0:Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;->-$$Nest$mcreate_original(Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;)Landroid/view/View;

    move-result-object v0

    goto :goto_0

    .line 90
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView$MainPagerAdapter;->this$0:Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;->-$$Nest$mcreate_preview(Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;)Landroid/view/View;

    move-result-object v0

    .line 101
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView$MainPagerAdapter;->views:Landroid/util/SparseArray;

    invoke-virtual {v1, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_3

    const/4 v1, 0x0

    .line 102
    invoke-virtual {p1, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 103
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView$MainPagerAdapter;->views:Landroid/util/SparseArray;

    invoke-virtual {p1, p2, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    return-object v0

    .line 105
    :cond_3
    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    return-object v0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0

    .line 110
    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method
