.class public Lcom/radaee/annotui/UILStyleButton;
.super Landroid/widget/Button;
.source "UILStyleButton.java"


# static fields
.field private static ms_density:F = -1.0f


# instance fields
.field private mPath:Landroid/graphics/Path;

.field private m_dashs_org:[F

.field private m_layout:Landroid/widget/LinearLayout;

.field private m_paint:Landroid/graphics/Paint;

.field private m_popup:Lcom/radaee/annotui/UIAnnotPop;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 89
    invoke-direct {p0, p1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 90
    invoke-direct {p0}, Lcom/radaee/annotui/UILStyleButton;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 94
    invoke-direct {p0, p1, p2}, Landroid/widget/Button;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 95
    invoke-direct {p0}, Lcom/radaee/annotui/UILStyleButton;->init()V

    return-void
.end method

.method private Dp2Px(F)I
    .locals 2

    .line 24
    sget v0, Lcom/radaee/annotui/UILStyleButton;->ms_density:F

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    invoke-virtual {p0}, Lcom/radaee/annotui/UILStyleButton;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    sput v0, Lcom/radaee/annotui/UILStyleButton;->ms_density:F

    .line 25
    :cond_0
    sget v0, Lcom/radaee/annotui/UILStyleButton;->ms_density:F

    mul-float p1, p1, v0

    const/high16 v0, 0x3f000000    # 0.5f

    add-float/2addr p1, v0

    float-to-int p1, p1

    return p1
.end method

.method private Px2Dp(F)I
    .locals 2

    .line 29
    sget v0, Lcom/radaee/annotui/UILStyleButton;->ms_density:F

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    invoke-virtual {p0}, Lcom/radaee/annotui/UILStyleButton;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    sput v0, Lcom/radaee/annotui/UILStyleButton;->ms_density:F

    .line 30
    :cond_0
    sget v0, Lcom/radaee/annotui/UILStyleButton;->ms_density:F

    div-float/2addr p1, v0

    const/high16 v0, 0x3f000000    # 0.5f

    add-float/2addr p1, v0

    float-to-int p1, p1

    return p1
.end method

.method static synthetic access$000(Lcom/radaee/annotui/UILStyleButton;)Lcom/radaee/annotui/UIAnnotPop;
    .locals 0

    .line 20
    iget-object p0, p0, Lcom/radaee/annotui/UILStyleButton;->m_popup:Lcom/radaee/annotui/UIAnnotPop;

    return-object p0
.end method

.method static synthetic access$100(Lcom/radaee/annotui/UILStyleButton;F)I
    .locals 0

    .line 20
    invoke-direct {p0, p1}, Lcom/radaee/annotui/UILStyleButton;->Dp2Px(F)I

    move-result p0

    return p0
.end method

.method private init()V
    .locals 4

    const/4 v0, 0x0

    .line 37
    invoke-virtual {p0, v0}, Lcom/radaee/annotui/UILStyleButton;->setDash([F)V

    const/4 v1, -0x1

    .line 38
    invoke-virtual {p0, v1}, Lcom/radaee/annotui/UILStyleButton;->setBackgroundColor(I)V

    .line 40
    invoke-virtual {p0}, Lcom/radaee/annotui/UILStyleButton;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/radaee/viewlib/R$layout;->pop_lstyle:I

    invoke-virtual {v1, v2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/radaee/annotui/UILStyleButton;->m_layout:Landroid/widget/LinearLayout;

    .line 41
    new-instance v0, Lcom/radaee/annotui/UILStyleButton$1;

    invoke-direct {v0, p0}, Lcom/radaee/annotui/UILStyleButton$1;-><init>(Lcom/radaee/annotui/UILStyleButton;)V

    .line 49
    iget-object v1, p0, Lcom/radaee/annotui/UILStyleButton;->m_layout:Landroid/widget/LinearLayout;

    sget v2, Lcom/radaee/viewlib/R$id;->vw_lsolid:I

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/radaee/annotui/UILStyleView;

    .line 50
    invoke-virtual {v1, v0}, Lcom/radaee/annotui/UILStyleView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 52
    iget-object v1, p0, Lcom/radaee/annotui/UILStyleButton;->m_layout:Landroid/widget/LinearLayout;

    sget v2, Lcom/radaee/viewlib/R$id;->vw_ldash11:I

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/radaee/annotui/UILStyleView;

    const/4 v2, 0x2

    .line 53
    new-array v3, v2, [F

    fill-array-data v3, :array_0

    invoke-virtual {v1, v3}, Lcom/radaee/annotui/UILStyleView;->setDash([F)V

    .line 54
    invoke-virtual {v1, v0}, Lcom/radaee/annotui/UILStyleView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 56
    iget-object v1, p0, Lcom/radaee/annotui/UILStyleButton;->m_layout:Landroid/widget/LinearLayout;

    sget v3, Lcom/radaee/viewlib/R$id;->vw_ldash22:I

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/radaee/annotui/UILStyleView;

    .line 57
    new-array v3, v2, [F

    fill-array-data v3, :array_1

    invoke-virtual {v1, v3}, Lcom/radaee/annotui/UILStyleView;->setDash([F)V

    .line 58
    invoke-virtual {v1, v0}, Lcom/radaee/annotui/UILStyleView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 60
    iget-object v1, p0, Lcom/radaee/annotui/UILStyleButton;->m_layout:Landroid/widget/LinearLayout;

    sget v3, Lcom/radaee/viewlib/R$id;->vw_ldash44:I

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/radaee/annotui/UILStyleView;

    .line 61
    new-array v2, v2, [F

    fill-array-data v2, :array_2

    invoke-virtual {v1, v2}, Lcom/radaee/annotui/UILStyleView;->setDash([F)V

    .line 62
    invoke-virtual {v1, v0}, Lcom/radaee/annotui/UILStyleView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 64
    iget-object v1, p0, Lcom/radaee/annotui/UILStyleButton;->m_layout:Landroid/widget/LinearLayout;

    sget v2, Lcom/radaee/viewlib/R$id;->vw_ldash4222:I

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/radaee/annotui/UILStyleView;

    const/4 v2, 0x4

    .line 65
    new-array v3, v2, [F

    fill-array-data v3, :array_3

    invoke-virtual {v1, v3}, Lcom/radaee/annotui/UILStyleView;->setDash([F)V

    .line 66
    invoke-virtual {v1, v0}, Lcom/radaee/annotui/UILStyleView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 68
    iget-object v1, p0, Lcom/radaee/annotui/UILStyleButton;->m_layout:Landroid/widget/LinearLayout;

    sget v3, Lcom/radaee/viewlib/R$id;->vw_ldash16242:I

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/radaee/annotui/UILStyleView;

    .line 69
    new-array v2, v2, [F

    fill-array-data v2, :array_4

    invoke-virtual {v1, v2}, Lcom/radaee/annotui/UILStyleView;->setDash([F)V

    .line 70
    invoke-virtual {v1, v0}, Lcom/radaee/annotui/UILStyleView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 72
    new-instance v0, Lcom/radaee/annotui/UIAnnotPop;

    iget-object v1, p0, Lcom/radaee/annotui/UILStyleButton;->m_layout:Landroid/widget/LinearLayout;

    const/high16 v2, 0x42b40000    # 90.0f

    invoke-direct {p0, v2}, Lcom/radaee/annotui/UILStyleButton;->Dp2Px(F)I

    move-result v2

    iget-object v3, p0, Lcom/radaee/annotui/UILStyleButton;->m_layout:Landroid/widget/LinearLayout;

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v3

    mul-int/lit8 v3, v3, 0x19

    int-to-float v3, v3

    invoke-direct {p0, v3}, Lcom/radaee/annotui/UILStyleButton;->Dp2Px(F)I

    move-result v3

    invoke-direct {v0, v1, v2, v3}, Lcom/radaee/annotui/UIAnnotPop;-><init>(Landroid/view/View;II)V

    iput-object v0, p0, Lcom/radaee/annotui/UILStyleButton;->m_popup:Lcom/radaee/annotui/UIAnnotPop;

    const/4 v1, 0x1

    .line 73
    invoke-virtual {v0, v1}, Lcom/radaee/annotui/UIAnnotPop;->setFocusable(Z)V

    .line 74
    iget-object v0, p0, Lcom/radaee/annotui/UILStyleButton;->m_popup:Lcom/radaee/annotui/UIAnnotPop;

    invoke-virtual {v0, v1}, Lcom/radaee/annotui/UIAnnotPop;->setTouchable(Z)V

    .line 75
    iget-object v0, p0, Lcom/radaee/annotui/UILStyleButton;->m_popup:Lcom/radaee/annotui/UIAnnotPop;

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Lcom/radaee/annotui/UIAnnotPop;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 76
    new-instance v0, Lcom/radaee/annotui/UILStyleButton$2;

    invoke-direct {v0, p0}, Lcom/radaee/annotui/UILStyleButton$2;-><init>(Lcom/radaee/annotui/UILStyleButton;)V

    invoke-virtual {p0, v0}, Lcom/radaee/annotui/UILStyleButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data

    :array_1
    .array-data 4
        0x40000000    # 2.0f
        0x40000000    # 2.0f
    .end array-data

    :array_2
    .array-data 4
        0x40800000    # 4.0f
        0x40800000    # 4.0f
    .end array-data

    :array_3
    .array-data 4
        0x40800000    # 4.0f
        0x40000000    # 2.0f
        0x40000000    # 2.0f
        0x40000000    # 2.0f
    .end array-data

    :array_4
    .array-data 4
        0x41800000    # 16.0f
        0x40000000    # 2.0f
        0x40800000    # 4.0f
        0x40000000    # 2.0f
    .end array-data
.end method


# virtual methods
.method protected getDash()[F
    .locals 1

    .line 120
    iget-object v0, p0, Lcom/radaee/annotui/UILStyleButton;->m_dashs_org:[F

    return-object v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 4

    const/high16 v0, 0x3f800000    # 1.0f

    .line 124
    invoke-direct {p0, v0}, Lcom/radaee/annotui/UILStyleButton;->Dp2Px(F)I

    move-result v0

    int-to-float v0, v0

    .line 125
    invoke-virtual {p0}, Lcom/radaee/annotui/UILStyleButton;->getWidth()I

    move-result v1

    int-to-float v1, v1

    sub-float/2addr v1, v0

    .line 126
    invoke-virtual {p0}, Lcom/radaee/annotui/UILStyleButton;->getHeight()I

    move-result v2

    int-to-float v2, v2

    const/high16 v3, 0x3f000000    # 0.5f

    mul-float v2, v2, v3

    .line 127
    iget-object v3, p0, Lcom/radaee/annotui/UILStyleButton;->mPath:Landroid/graphics/Path;

    invoke-virtual {v3, v0, v2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 128
    iget-object v3, p0, Lcom/radaee/annotui/UILStyleButton;->mPath:Landroid/graphics/Path;

    invoke-virtual {v3, v0, v2, v1, v2}, Landroid/graphics/Path;->quadTo(FFFF)V

    .line 129
    iget-object v0, p0, Lcom/radaee/annotui/UILStyleButton;->mPath:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/radaee/annotui/UILStyleButton;->m_paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    return-void
.end method

.method protected setDash([F)V
    .locals 5

    .line 103
    iput-object p1, p0, Lcom/radaee/annotui/UILStyleButton;->m_dashs_org:[F

    .line 104
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/radaee/annotui/UILStyleButton;->mPath:Landroid/graphics/Path;

    .line 105
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/radaee/annotui/UILStyleButton;->m_paint:Landroid/graphics/Paint;

    .line 106
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/high16 v0, 0x3f800000    # 1.0f

    if-eqz p1, :cond_1

    .line 107
    array-length v1, p1

    if-lez v1, :cond_1

    .line 108
    array-length v1, p1

    new-array v1, v1, [F

    .line 109
    invoke-direct {p0, v0}, Lcom/radaee/annotui/UILStyleButton;->Dp2Px(F)I

    move-result v2

    int-to-float v2, v2

    const/4 v3, 0x0

    .line 110
    :goto_0
    array-length v4, p1

    if-ge v3, v4, :cond_0

    .line 111
    aget v4, p1, v3

    mul-float v4, v4, v2

    aput v4, v1, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 112
    :cond_0
    iget-object p1, p0, Lcom/radaee/annotui/UILStyleButton;->m_paint:Landroid/graphics/Paint;

    new-instance v2, Landroid/graphics/DashPathEffect;

    const/4 v3, 0x0

    invoke-direct {v2, v1, v3}, Landroid/graphics/DashPathEffect;-><init>([FF)V

    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    .line 114
    :cond_1
    iget-object p1, p0, Lcom/radaee/annotui/UILStyleButton;->m_paint:Landroid/graphics/Paint;

    invoke-direct {p0, v0}, Lcom/radaee/annotui/UILStyleButton;->Dp2Px(F)I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 115
    iget-object p1, p0, Lcom/radaee/annotui/UILStyleButton;->m_paint:Landroid/graphics/Paint;

    const/high16 v0, -0x1000000

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 116
    invoke-virtual {p0}, Lcom/radaee/annotui/UILStyleButton;->invalidate()V

    return-void
.end method
