.class public Lcom/radaee/reader/PDFBotBar;
.super Ljava/lang/Object;
.source "PDFBotBar.java"


# instance fields
.field private m_parent:Landroid/widget/RelativeLayout;

.field private m_view:Landroid/view/View;


# direct methods
.method constructor <init>(Landroid/widget/RelativeLayout;I)V
    .locals 2

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 13
    iput-object v0, p0, Lcom/radaee/reader/PDFBotBar;->m_parent:Landroid/widget/RelativeLayout;

    .line 14
    iput-object v0, p0, Lcom/radaee/reader/PDFBotBar;->m_view:Landroid/view/View;

    .line 17
    invoke-virtual {p1}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 18
    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    invoke-virtual {v1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/radaee/reader/PDFBotBar;->m_view:Landroid/view/View;

    .line 19
    iput-object p1, p0, Lcom/radaee/reader/PDFBotBar;->m_parent:Landroid/widget/RelativeLayout;

    .line 20
    new-instance p1, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 p2, -0x1

    const/4 v0, -0x2

    invoke-direct {p1, p2, v0}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 p2, 0xe

    .line 21
    invoke-virtual {p1, p2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    const/16 p2, 0xc

    .line 22
    invoke-virtual {p1, p2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 23
    iget-object p2, p0, Lcom/radaee/reader/PDFBotBar;->m_parent:Landroid/widget/RelativeLayout;

    iget-object v0, p0, Lcom/radaee/reader/PDFBotBar;->m_view:Landroid/view/View;

    invoke-virtual {p2, v0, p1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 24
    iget-object p1, p0, Lcom/radaee/reader/PDFBotBar;->m_view:Landroid/view/View;

    const/4 p2, 0x4

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method static synthetic access$000(Lcom/radaee/reader/PDFBotBar;)Landroid/view/View;
    .locals 0

    .line 11
    iget-object p0, p0, Lcom/radaee/reader/PDFBotBar;->m_view:Landroid/view/View;

    return-object p0
.end method


# virtual methods
.method public final BarGetView()Landroid/view/View;
    .locals 1

    .line 26
    iget-object v0, p0, Lcom/radaee/reader/PDFBotBar;->m_view:Landroid/view/View;

    return-object v0
.end method

.method public final BarHide()V
    .locals 3

    .line 49
    iget-object v0, p0, Lcom/radaee/reader/PDFBotBar;->m_view:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->clearAnimation()V

    .line 50
    new-instance v0, Landroid/view/animation/TranslateAnimation;

    iget-object v1, p0, Lcom/radaee/reader/PDFBotBar;->m_view:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    int-to-float v1, v1

    const/4 v2, 0x0

    invoke-direct {v0, v2, v2, v2, v1}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    const-wide/16 v1, 0xc8

    .line 51
    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 52
    new-instance v1, Lcom/radaee/reader/PDFBotBar$2;

    invoke-direct {v1, p0}, Lcom/radaee/reader/PDFBotBar$2;-><init>(Lcom/radaee/reader/PDFBotBar;)V

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 65
    iget-object v1, p0, Lcom/radaee/reader/PDFBotBar;->m_view:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    return-void
.end method

.method public final BarShow()V
    .locals 3

    .line 29
    iget-object v0, p0, Lcom/radaee/reader/PDFBotBar;->m_view:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->clearAnimation()V

    .line 30
    new-instance v0, Landroid/view/animation/TranslateAnimation;

    iget-object v1, p0, Lcom/radaee/reader/PDFBotBar;->m_view:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    int-to-float v1, v1

    const/4 v2, 0x0

    invoke-direct {v0, v2, v2, v1, v2}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    const-wide/16 v1, 0xc8

    .line 31
    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 32
    new-instance v1, Lcom/radaee/reader/PDFBotBar$1;

    invoke-direct {v1, p0}, Lcom/radaee/reader/PDFBotBar$1;-><init>(Lcom/radaee/reader/PDFBotBar;)V

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 45
    iget-object v1, p0, Lcom/radaee/reader/PDFBotBar;->m_view:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    return-void
.end method
