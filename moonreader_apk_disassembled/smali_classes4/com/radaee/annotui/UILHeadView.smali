.class public Lcom/radaee/annotui/UILHeadView;
.super Landroid/view/View;
.source "UILHeadView.java"


# static fields
.field private static ms_density:F = -1.0f


# instance fields
.field private m_paint_fill:Landroid/graphics/Paint;

.field private m_paint_stroke:Landroid/graphics/Paint;

.field private m_style:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 38
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 39
    invoke-direct {p0}, Lcom/radaee/annotui/UILHeadView;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 42
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 43
    invoke-direct {p0}, Lcom/radaee/annotui/UILHeadView;->init()V

    return-void
.end method

.method private Dp2Px(F)I
    .locals 2

    .line 15
    sget v0, Lcom/radaee/annotui/UILHeadView;->ms_density:F

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    invoke-virtual {p0}, Lcom/radaee/annotui/UILHeadView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    sput v0, Lcom/radaee/annotui/UILHeadView;->ms_density:F

    .line 16
    :cond_0
    sget v0, Lcom/radaee/annotui/UILHeadView;->ms_density:F

    mul-float p1, p1, v0

    const/high16 v0, 0x3f000000    # 0.5f

    add-float/2addr p1, v0

    float-to-int p1, p1

    return p1
.end method

.method private Px2Dp(F)I
    .locals 2

    .line 20
    sget v0, Lcom/radaee/annotui/UILHeadView;->ms_density:F

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    invoke-virtual {p0}, Lcom/radaee/annotui/UILHeadView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    sput v0, Lcom/radaee/annotui/UILHeadView;->ms_density:F

    .line 21
    :cond_0
    sget v0, Lcom/radaee/annotui/UILHeadView;->ms_density:F

    div-float/2addr p1, v0

    const/high16 v0, 0x3f000000    # 0.5f

    add-float/2addr p1, v0

    float-to-int p1, p1

    return p1
.end method

.method private init()V
    .locals 2

    const/4 v0, -0x1

    .line 27
    invoke-virtual {p0, v0}, Lcom/radaee/annotui/UILHeadView;->setBackgroundColor(I)V

    .line 28
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/radaee/annotui/UILHeadView;->m_paint_stroke:Landroid/graphics/Paint;

    .line 29
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 30
    iget-object v0, p0, Lcom/radaee/annotui/UILHeadView;->m_paint_stroke:Landroid/graphics/Paint;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {p0, v1}, Lcom/radaee/annotui/UILHeadView;->Dp2Px(F)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 31
    iget-object v0, p0, Lcom/radaee/annotui/UILHeadView;->m_paint_stroke:Landroid/graphics/Paint;

    const/high16 v1, -0x1000000

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 33
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/radaee/annotui/UILHeadView;->m_paint_fill:Landroid/graphics/Paint;

    .line 34
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 35
    iget-object v0, p0, Lcom/radaee/annotui/UILHeadView;->m_paint_fill:Landroid/graphics/Paint;

    const v1, -0x7f7f80

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    return-void
.end method


# virtual methods
.method protected getStyle()I
    .locals 1

    .line 115
    iget v0, p0, Lcom/radaee/annotui/UILHeadView;->m_style:I

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 14

    const/high16 v0, 0x3f800000    # 1.0f

    .line 47
    invoke-direct {p0, v0}, Lcom/radaee/annotui/UILHeadView;->Dp2Px(F)I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x41000000    # 8.0f

    mul-float v3, v0, v1

    .line 49
    invoke-virtual {p0}, Lcom/radaee/annotui/UILHeadView;->getWidth()I

    move-result v1

    int-to-float v1, v1

    sub-float v5, v1, v0

    .line 50
    invoke-virtual {p0}, Lcom/radaee/annotui/UILHeadView;->getHeight()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x3f000000    # 0.5f

    mul-float v4, v0, v1

    .line 51
    iget-object v7, p0, Lcom/radaee/annotui/UILHeadView;->m_paint_stroke:Landroid/graphics/Paint;

    move v6, v4

    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 52
    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    .line 54
    iget v0, p0, Lcom/radaee/annotui/UILHeadView;->m_style:I

    const/high16 v1, 0x40a00000    # 5.0f

    const v8, 0x410a8f5c    # 8.66f

    const/high16 v9, 0x40200000    # 2.5f

    packed-switch v0, :pswitch_data_0

    return-void

    .line 102
    :pswitch_0
    invoke-direct {p0, v9}, Lcom/radaee/annotui/UILHeadView;->Dp2Px(F)I

    move-result p1

    int-to-float p1, p1

    add-float/2addr p1, v3

    const v0, 0x408a8f5c    # 4.33f

    invoke-direct {p0, v0}, Lcom/radaee/annotui/UILHeadView;->Dp2Px(F)I

    move-result v1

    int-to-float v1, v1

    sub-float v10, v4, v1

    invoke-direct {p0, v9}, Lcom/radaee/annotui/UILHeadView;->Dp2Px(F)I

    move-result v1

    int-to-float v1, v1

    sub-float v11, v3, v1

    invoke-direct {p0, v0}, Lcom/radaee/annotui/UILHeadView;->Dp2Px(F)I

    move-result v0

    int-to-float v0, v0

    add-float v12, v4, v0

    iget-object v13, p0, Lcom/radaee/annotui/UILHeadView;->m_paint_stroke:Landroid/graphics/Paint;

    move v9, p1

    move-object v8, v2

    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    return-void

    .line 94
    :pswitch_1
    invoke-direct {p0, v8}, Lcom/radaee/annotui/UILHeadView;->Dp2Px(F)I

    move-result v0

    int-to-float v0, v0

    sub-float v0, v3, v0

    invoke-direct {p0, v9}, Lcom/radaee/annotui/UILHeadView;->Dp2Px(F)I

    move-result v1

    int-to-float v1, v1

    sub-float v1, v4, v1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Path;->moveTo(FF)V

    .line 95
    invoke-virtual {p1, v3, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 96
    invoke-direct {p0, v8}, Lcom/radaee/annotui/UILHeadView;->Dp2Px(F)I

    move-result v0

    int-to-float v0, v0

    sub-float/2addr v3, v0

    invoke-direct {p0, v9}, Lcom/radaee/annotui/UILHeadView;->Dp2Px(F)I

    move-result v0

    int-to-float v0, v0

    add-float/2addr v4, v0

    invoke-virtual {p1, v3, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 97
    invoke-virtual {p1}, Landroid/graphics/Path;->close()V

    .line 98
    iget-object v0, p0, Lcom/radaee/annotui/UILHeadView;->m_paint_fill:Landroid/graphics/Paint;

    invoke-virtual {v2, p1, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 99
    iget-object v0, p0, Lcom/radaee/annotui/UILHeadView;->m_paint_stroke:Landroid/graphics/Paint;

    invoke-virtual {v2, p1, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    return-void

    .line 90
    :pswitch_2
    invoke-direct {p0, v8}, Lcom/radaee/annotui/UILHeadView;->Dp2Px(F)I

    move-result p1

    int-to-float p1, p1

    sub-float p1, v3, p1

    invoke-direct {p0, v9}, Lcom/radaee/annotui/UILHeadView;->Dp2Px(F)I

    move-result v0

    int-to-float v0, v0

    sub-float v0, v4, v0

    iget-object v7, p0, Lcom/radaee/annotui/UILHeadView;->m_paint_stroke:Landroid/graphics/Paint;

    move v5, v3

    move v6, v4

    move v3, p1

    move v4, v0

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move v3, v5

    move v4, v6

    .line 91
    invoke-direct {p0, v8}, Lcom/radaee/annotui/UILHeadView;->Dp2Px(F)I

    move-result p1

    int-to-float p1, p1

    sub-float v5, v3, p1

    invoke-direct {p0, v9}, Lcom/radaee/annotui/UILHeadView;->Dp2Px(F)I

    move-result p1

    int-to-float p1, p1

    add-float v6, v4, p1

    iget-object v7, p0, Lcom/radaee/annotui/UILHeadView;->m_paint_stroke:Landroid/graphics/Paint;

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    return-void

    :pswitch_3
    const v0, 0x40623d71    # 3.535f

    .line 81
    invoke-direct {p0, v0}, Lcom/radaee/annotui/UILHeadView;->Dp2Px(F)I

    move-result v1

    int-to-float v1, v1

    sub-float v1, v3, v1

    invoke-virtual {p1, v1, v4}, Landroid/graphics/Path;->moveTo(FF)V

    .line 82
    invoke-direct {p0, v0}, Lcom/radaee/annotui/UILHeadView;->Dp2Px(F)I

    move-result v1

    int-to-float v1, v1

    sub-float v1, v4, v1

    invoke-virtual {p1, v3, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 83
    invoke-direct {p0, v0}, Lcom/radaee/annotui/UILHeadView;->Dp2Px(F)I

    move-result v1

    int-to-float v1, v1

    add-float/2addr v1, v3

    invoke-virtual {p1, v1, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 84
    invoke-direct {p0, v0}, Lcom/radaee/annotui/UILHeadView;->Dp2Px(F)I

    move-result v0

    int-to-float v0, v0

    add-float/2addr v4, v0

    invoke-virtual {p1, v3, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 85
    invoke-virtual {p1}, Landroid/graphics/Path;->close()V

    .line 86
    iget-object v0, p0, Lcom/radaee/annotui/UILHeadView;->m_paint_fill:Landroid/graphics/Paint;

    invoke-virtual {v2, p1, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 87
    iget-object v0, p0, Lcom/radaee/annotui/UILHeadView;->m_paint_stroke:Landroid/graphics/Paint;

    invoke-virtual {v2, p1, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    return-void

    .line 78
    :pswitch_4
    invoke-direct {p0, v1}, Lcom/radaee/annotui/UILHeadView;->Dp2Px(F)I

    move-result p1

    int-to-float p1, p1

    sub-float p1, v4, p1

    invoke-direct {p0, v1}, Lcom/radaee/annotui/UILHeadView;->Dp2Px(F)I

    move-result v0

    int-to-float v0, v0

    add-float v6, v4, v0

    iget-object v7, p0, Lcom/radaee/annotui/UILHeadView;->m_paint_stroke:Landroid/graphics/Paint;

    move v5, v3

    move v4, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    return-void

    .line 74
    :pswitch_5
    invoke-direct {p0, v1}, Lcom/radaee/annotui/UILHeadView;->Dp2Px(F)I

    move-result p1

    int-to-float p1, p1

    iget-object v0, p0, Lcom/radaee/annotui/UILHeadView;->m_paint_fill:Landroid/graphics/Paint;

    invoke-virtual {v2, v3, v4, p1, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 75
    invoke-direct {p0, v1}, Lcom/radaee/annotui/UILHeadView;->Dp2Px(F)I

    move-result p1

    int-to-float p1, p1

    iget-object v0, p0, Lcom/radaee/annotui/UILHeadView;->m_paint_stroke:Landroid/graphics/Paint;

    invoke-virtual {v2, v3, v4, p1, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    return-void

    .line 69
    :pswitch_6
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p0, v1}, Lcom/radaee/annotui/UILHeadView;->Dp2Px(F)I

    move-result v0

    int-to-float v0, v0

    sub-float v0, v3, v0

    invoke-direct {p0, v1}, Lcom/radaee/annotui/UILHeadView;->Dp2Px(F)I

    move-result v5

    int-to-float v5, v5

    sub-float v5, v4, v5

    invoke-direct {p0, v1}, Lcom/radaee/annotui/UILHeadView;->Dp2Px(F)I

    move-result v6

    int-to-float v6, v6

    add-float/2addr v3, v6

    invoke-direct {p0, v1}, Lcom/radaee/annotui/UILHeadView;->Dp2Px(F)I

    move-result v1

    int-to-float v1, v1

    add-float/2addr v4, v1

    invoke-direct {p1, v0, v5, v3, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 70
    iget-object v0, p0, Lcom/radaee/annotui/UILHeadView;->m_paint_fill:Landroid/graphics/Paint;

    invoke-virtual {v2, p1, v0}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 71
    iget-object v0, p0, Lcom/radaee/annotui/UILHeadView;->m_paint_stroke:Landroid/graphics/Paint;

    invoke-virtual {v2, p1, v0}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    return-void

    .line 61
    :pswitch_7
    invoke-direct {p0, v8}, Lcom/radaee/annotui/UILHeadView;->Dp2Px(F)I

    move-result v0

    int-to-float v0, v0

    add-float/2addr v0, v3

    invoke-direct {p0, v9}, Lcom/radaee/annotui/UILHeadView;->Dp2Px(F)I

    move-result v1

    int-to-float v1, v1

    sub-float v1, v4, v1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Path;->moveTo(FF)V

    .line 62
    invoke-virtual {p1, v3, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 63
    invoke-direct {p0, v8}, Lcom/radaee/annotui/UILHeadView;->Dp2Px(F)I

    move-result v0

    int-to-float v0, v0

    add-float/2addr v3, v0

    invoke-direct {p0, v9}, Lcom/radaee/annotui/UILHeadView;->Dp2Px(F)I

    move-result v0

    int-to-float v0, v0

    add-float/2addr v4, v0

    invoke-virtual {p1, v3, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 64
    invoke-virtual {p1}, Landroid/graphics/Path;->close()V

    .line 65
    iget-object v0, p0, Lcom/radaee/annotui/UILHeadView;->m_paint_fill:Landroid/graphics/Paint;

    invoke-virtual {v2, p1, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 66
    iget-object v0, p0, Lcom/radaee/annotui/UILHeadView;->m_paint_stroke:Landroid/graphics/Paint;

    invoke-virtual {v2, p1, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    return-void

    .line 57
    :pswitch_8
    invoke-direct {p0, v8}, Lcom/radaee/annotui/UILHeadView;->Dp2Px(F)I

    move-result p1

    int-to-float p1, p1

    add-float/2addr p1, v3

    invoke-direct {p0, v9}, Lcom/radaee/annotui/UILHeadView;->Dp2Px(F)I

    move-result v0

    int-to-float v0, v0

    sub-float v0, v4, v0

    iget-object v7, p0, Lcom/radaee/annotui/UILHeadView;->m_paint_stroke:Landroid/graphics/Paint;

    move v5, v3

    move v6, v4

    move v3, p1

    move v4, v0

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move v3, v5

    move v4, v6

    .line 58
    invoke-direct {p0, v8}, Lcom/radaee/annotui/UILHeadView;->Dp2Px(F)I

    move-result p1

    int-to-float p1, p1

    add-float v5, v3, p1

    invoke-direct {p0, v9}, Lcom/radaee/annotui/UILHeadView;->Dp2Px(F)I

    move-result p1

    int-to-float p1, p1

    add-float v6, v4, p1

    iget-object v7, p0, Lcom/radaee/annotui/UILHeadView;->m_paint_stroke:Landroid/graphics/Paint;

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected setStyle(I)V
    .locals 0

    .line 110
    iput p1, p0, Lcom/radaee/annotui/UILHeadView;->m_style:I

    .line 111
    invoke-virtual {p0}, Lcom/radaee/annotui/UILHeadView;->invalidate()V

    return-void
.end method
