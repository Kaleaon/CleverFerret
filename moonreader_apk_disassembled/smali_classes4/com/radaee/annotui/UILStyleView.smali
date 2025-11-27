.class public Lcom/radaee/annotui/UILStyleView;
.super Landroid/view/View;
.source "UILStyleView.java"


# static fields
.field private static ms_density:F = -1.0f


# instance fields
.field private mPath:Landroid/graphics/Path;

.field private m_dashs_org:[F

.field private m_paint:Landroid/graphics/Paint;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 31
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 32
    invoke-direct {p0}, Lcom/radaee/annotui/UILStyleView;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 36
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 37
    invoke-direct {p0}, Lcom/radaee/annotui/UILStyleView;->init()V

    return-void
.end method

.method private Dp2Px(F)I
    .locals 2

    .line 16
    sget v0, Lcom/radaee/annotui/UILStyleView;->ms_density:F

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    invoke-virtual {p0}, Lcom/radaee/annotui/UILStyleView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    sput v0, Lcom/radaee/annotui/UILStyleView;->ms_density:F

    .line 17
    :cond_0
    sget v0, Lcom/radaee/annotui/UILStyleView;->ms_density:F

    mul-float p1, p1, v0

    const/high16 v0, 0x3f000000    # 0.5f

    add-float/2addr p1, v0

    float-to-int p1, p1

    return p1
.end method

.method private Px2Dp(F)I
    .locals 2

    .line 21
    sget v0, Lcom/radaee/annotui/UILStyleView;->ms_density:F

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    invoke-virtual {p0}, Lcom/radaee/annotui/UILStyleView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    sput v0, Lcom/radaee/annotui/UILStyleView;->ms_density:F

    .line 22
    :cond_0
    sget v0, Lcom/radaee/annotui/UILStyleView;->ms_density:F

    div-float/2addr p1, v0

    const/high16 v0, 0x3f000000    # 0.5f

    add-float/2addr p1, v0

    float-to-int p1, p1

    return p1
.end method

.method private init()V
    .locals 1

    const/4 v0, 0x0

    .line 26
    invoke-virtual {p0, v0}, Lcom/radaee/annotui/UILStyleView;->setDash([F)V

    const/4 v0, -0x1

    .line 27
    invoke-virtual {p0, v0}, Lcom/radaee/annotui/UILStyleView;->setBackgroundColor(I)V

    return-void
.end method


# virtual methods
.method protected getDash()[F
    .locals 1

    .line 62
    iget-object v0, p0, Lcom/radaee/annotui/UILStyleView;->m_dashs_org:[F

    return-object v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 4

    const/high16 v0, 0x3f800000    # 1.0f

    .line 66
    invoke-direct {p0, v0}, Lcom/radaee/annotui/UILStyleView;->Dp2Px(F)I

    move-result v0

    int-to-float v0, v0

    .line 67
    invoke-virtual {p0}, Lcom/radaee/annotui/UILStyleView;->getWidth()I

    move-result v1

    int-to-float v1, v1

    sub-float/2addr v1, v0

    .line 68
    invoke-virtual {p0}, Lcom/radaee/annotui/UILStyleView;->getHeight()I

    move-result v2

    int-to-float v2, v2

    const/high16 v3, 0x3f000000    # 0.5f

    mul-float v2, v2, v3

    .line 69
    iget-object v3, p0, Lcom/radaee/annotui/UILStyleView;->mPath:Landroid/graphics/Path;

    invoke-virtual {v3, v0, v2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 70
    iget-object v3, p0, Lcom/radaee/annotui/UILStyleView;->mPath:Landroid/graphics/Path;

    invoke-virtual {v3, v0, v2, v1, v2}, Landroid/graphics/Path;->quadTo(FFFF)V

    .line 71
    iget-object v0, p0, Lcom/radaee/annotui/UILStyleView;->mPath:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/radaee/annotui/UILStyleView;->m_paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    return-void
.end method

.method protected setDash([F)V
    .locals 5

    .line 45
    iput-object p1, p0, Lcom/radaee/annotui/UILStyleView;->m_dashs_org:[F

    .line 46
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/radaee/annotui/UILStyleView;->mPath:Landroid/graphics/Path;

    .line 47
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/radaee/annotui/UILStyleView;->m_paint:Landroid/graphics/Paint;

    .line 48
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/high16 v0, 0x3f800000    # 1.0f

    if-eqz p1, :cond_1

    .line 49
    array-length v1, p1

    if-lez v1, :cond_1

    .line 50
    array-length v1, p1

    new-array v1, v1, [F

    .line 51
    invoke-direct {p0, v0}, Lcom/radaee/annotui/UILStyleView;->Dp2Px(F)I

    move-result v2

    int-to-float v2, v2

    const/4 v3, 0x0

    .line 52
    :goto_0
    array-length v4, p1

    if-ge v3, v4, :cond_0

    .line 53
    aget v4, p1, v3

    mul-float v4, v4, v2

    aput v4, v1, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 54
    :cond_0
    iget-object p1, p0, Lcom/radaee/annotui/UILStyleView;->m_paint:Landroid/graphics/Paint;

    new-instance v2, Landroid/graphics/DashPathEffect;

    const/4 v3, 0x0

    invoke-direct {v2, v1, v3}, Landroid/graphics/DashPathEffect;-><init>([FF)V

    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    .line 56
    :cond_1
    iget-object p1, p0, Lcom/radaee/annotui/UILStyleView;->m_paint:Landroid/graphics/Paint;

    invoke-direct {p0, v0}, Lcom/radaee/annotui/UILStyleView;->Dp2Px(F)I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 57
    iget-object p1, p0, Lcom/radaee/annotui/UILStyleView;->m_paint:Landroid/graphics/Paint;

    const/high16 v0, -0x1000000

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 58
    invoke-virtual {p0}, Lcom/radaee/annotui/UILStyleView;->invalidate()V

    return-void
.end method
