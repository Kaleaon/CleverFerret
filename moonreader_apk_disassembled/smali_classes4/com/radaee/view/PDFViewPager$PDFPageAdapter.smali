.class Lcom/radaee/view/PDFViewPager$PDFPageAdapter;
.super Landroidx/viewpager/widget/PagerAdapter;
.source "PDFViewPager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/radaee/view/PDFViewPager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PDFPageAdapter"
.end annotation


# instance fields
.field private m_ctx:Landroid/content/Context;

.field private m_doc:Lcom/radaee/pdf/Document;

.field final synthetic this$0:Lcom/radaee/view/PDFViewPager;


# direct methods
.method public constructor <init>(Lcom/radaee/view/PDFViewPager;Landroid/content/Context;Lcom/radaee/pdf/Document;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x0,
            0x0
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .line 72
    iput-object p1, p0, Lcom/radaee/view/PDFViewPager$PDFPageAdapter;->this$0:Lcom/radaee/view/PDFViewPager;

    invoke-direct {p0}, Landroidx/viewpager/widget/PagerAdapter;-><init>()V

    .line 73
    iput-object p3, p0, Lcom/radaee/view/PDFViewPager$PDFPageAdapter;->m_doc:Lcom/radaee/pdf/Document;

    .line 74
    iput-object p2, p0, Lcom/radaee/view/PDFViewPager$PDFPageAdapter;->m_ctx:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0

    .line 99
    iget-object p3, p0, Lcom/radaee/view/PDFViewPager$PDFPageAdapter;->this$0:Lcom/radaee/view/PDFViewPager;

    invoke-static {p3}, Lcom/radaee/view/PDFViewPager;->access$000(Lcom/radaee/view/PDFViewPager;)[Lcom/radaee/view/PDFPageView;

    move-result-object p3

    aget-object p3, p3, p2

    invoke-virtual {p3}, Lcom/radaee/view/PDFPageView;->vFreeCache()V

    .line 100
    iget-object p3, p0, Lcom/radaee/view/PDFViewPager$PDFPageAdapter;->this$0:Lcom/radaee/view/PDFViewPager;

    invoke-static {p3}, Lcom/radaee/view/PDFViewPager;->access$000(Lcom/radaee/view/PDFViewPager;)[Lcom/radaee/view/PDFPageView;

    move-result-object p3

    aget-object p3, p3, p2

    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 101
    iget-object p1, p0, Lcom/radaee/view/PDFViewPager$PDFPageAdapter;->this$0:Lcom/radaee/view/PDFViewPager;

    invoke-static {p1}, Lcom/radaee/view/PDFViewPager;->access$000(Lcom/radaee/view/PDFViewPager;)[Lcom/radaee/view/PDFPageView;

    move-result-object p1

    aget-object p1, p1, p2

    invoke-virtual {p1}, Lcom/radaee/view/PDFPageView;->vClose()V

    .line 102
    iget-object p1, p0, Lcom/radaee/view/PDFViewPager$PDFPageAdapter;->this$0:Lcom/radaee/view/PDFViewPager;

    invoke-static {p1}, Lcom/radaee/view/PDFViewPager;->access$000(Lcom/radaee/view/PDFViewPager;)[Lcom/radaee/view/PDFPageView;

    move-result-object p1

    const/4 p3, 0x0

    aput-object p3, p1, p2

    return-void
.end method

.method public getCount()I
    .locals 1

    .line 94
    iget-object v0, p0, Lcom/radaee/view/PDFViewPager$PDFPageAdapter;->this$0:Lcom/radaee/view/PDFViewPager;

    invoke-static {v0}, Lcom/radaee/view/PDFViewPager;->access$000(Lcom/radaee/view/PDFViewPager;)[Lcom/radaee/view/PDFPageView;

    move-result-object v0

    array-length v0, v0

    return v0
.end method

.method public getPageTitle(I)Ljava/lang/CharSequence;
    .locals 2

    .line 110
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Page:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 7

    .line 84
    iget-object v0, p0, Lcom/radaee/view/PDFViewPager$PDFPageAdapter;->this$0:Lcom/radaee/view/PDFViewPager;

    invoke-static {v0}, Lcom/radaee/view/PDFViewPager;->access$000(Lcom/radaee/view/PDFViewPager;)[Lcom/radaee/view/PDFPageView;

    move-result-object v0

    new-instance v1, Lcom/radaee/view/PDFPageView;

    iget-object v2, p0, Lcom/radaee/view/PDFViewPager$PDFPageAdapter;->m_ctx:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/radaee/view/PDFPageView;-><init>(Landroid/content/Context;)V

    aput-object v1, v0, p2

    .line 87
    iget-object v0, p0, Lcom/radaee/view/PDFViewPager$PDFPageAdapter;->this$0:Lcom/radaee/view/PDFViewPager;

    invoke-static {v0}, Lcom/radaee/view/PDFViewPager;->access$000(Lcom/radaee/view/PDFViewPager;)[Lcom/radaee/view/PDFPageView;

    move-result-object v0

    aget-object v1, v0, p2

    iget-object v0, p0, Lcom/radaee/view/PDFViewPager$PDFPageAdapter;->this$0:Lcom/radaee/view/PDFViewPager;

    invoke-static {v0}, Lcom/radaee/view/PDFViewPager;->access$100(Lcom/radaee/view/PDFViewPager;)Lcom/radaee/view/VThread;

    move-result-object v2

    iget-object v0, p0, Lcom/radaee/view/PDFViewPager$PDFPageAdapter;->this$0:Lcom/radaee/view/PDFViewPager;

    invoke-static {v0}, Lcom/radaee/view/PDFViewPager;->access$100(Lcom/radaee/view/PDFViewPager;)Lcom/radaee/view/VThread;

    move-result-object v3

    iget-object v4, p0, Lcom/radaee/view/PDFViewPager$PDFPageAdapter;->m_doc:Lcom/radaee/pdf/Document;

    iget-object v0, p0, Lcom/radaee/view/PDFViewPager$PDFPageAdapter;->this$0:Lcom/radaee/view/PDFViewPager;

    invoke-static {v0}, Lcom/radaee/view/PDFViewPager;->access$200(Lcom/radaee/view/PDFViewPager;)I

    move-result v6

    move v5, p2

    invoke-virtual/range {v1 .. v6}, Lcom/radaee/view/PDFPageView;->vOpen(Lcom/radaee/view/VThread;Lcom/radaee/view/VThread;Lcom/radaee/pdf/Document;II)V

    .line 88
    iget-object p2, p0, Lcom/radaee/view/PDFViewPager$PDFPageAdapter;->this$0:Lcom/radaee/view/PDFViewPager;

    invoke-static {p2}, Lcom/radaee/view/PDFViewPager;->access$000(Lcom/radaee/view/PDFViewPager;)[Lcom/radaee/view/PDFPageView;

    move-result-object p2

    aget-object p2, p2, v5

    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 89
    iget-object p1, p0, Lcom/radaee/view/PDFViewPager$PDFPageAdapter;->this$0:Lcom/radaee/view/PDFViewPager;

    invoke-static {p1}, Lcom/radaee/view/PDFViewPager;->access$000(Lcom/radaee/view/PDFViewPager;)[Lcom/radaee/view/PDFPageView;

    move-result-object p1

    aget-object p1, p1, v5

    invoke-virtual {p1}, Lcom/radaee/view/PDFPageView;->invalidate()V

    .line 90
    iget-object p1, p0, Lcom/radaee/view/PDFViewPager$PDFPageAdapter;->this$0:Lcom/radaee/view/PDFViewPager;

    invoke-static {p1}, Lcom/radaee/view/PDFViewPager;->access$000(Lcom/radaee/view/PDFViewPager;)[Lcom/radaee/view/PDFPageView;

    move-result-object p1

    aget-object p1, p1, v5

    return-object p1
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0

    if-ne p1, p2, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method
