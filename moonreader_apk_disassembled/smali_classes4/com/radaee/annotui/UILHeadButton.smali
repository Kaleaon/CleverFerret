.class public Lcom/radaee/annotui/UILHeadButton;
.super Landroid/widget/Button;
.source "UILHeadButton.java"


# static fields
.field private static ms_density:F = -1.0f


# instance fields
.field private m_layout:Landroid/widget/LinearLayout;

.field private m_paint_fill:Landroid/graphics/Paint;

.field private m_paint_stroke:Landroid/graphics/Paint;

.field private m_popup:Lcom/radaee/annotui/UIAnnotPop;

.field private m_style:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 112
    invoke-direct {p0, p1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 113
    invoke-direct {p0}, Lcom/radaee/annotui/UILHeadButton;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 116
    invoke-direct {p0, p1, p2}, Landroid/widget/Button;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 117
    invoke-direct {p0}, Lcom/radaee/annotui/UILHeadButton;->init()V

    return-void
.end method

.method private Dp2Px(F)I
    .locals 2

    .line 23
    sget v0, Lcom/radaee/annotui/UILHeadButton;->ms_density:F

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    invoke-virtual {p0}, Lcom/radaee/annotui/UILHeadButton;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    sput v0, Lcom/radaee/annotui/UILHeadButton;->ms_density:F

    .line 24
    :cond_0
    sget v0, Lcom/radaee/annotui/UILHeadButton;->ms_density:F

    mul-float p1, p1, v0

    const/high16 v0, 0x3f000000    # 0.5f

    add-float/2addr p1, v0

    float-to-int p1, p1

    return p1
.end method

.method private Px2Dp(F)I
    .locals 2

    .line 28
    sget v0, Lcom/radaee/annotui/UILHeadButton;->ms_density:F

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    invoke-virtual {p0}, Lcom/radaee/annotui/UILHeadButton;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    sput v0, Lcom/radaee/annotui/UILHeadButton;->ms_density:F

    .line 29
    :cond_0
    sget v0, Lcom/radaee/annotui/UILHeadButton;->ms_density:F

    div-float/2addr p1, v0

    const/high16 v0, 0x3f000000    # 0.5f

    add-float/2addr p1, v0

    float-to-int p1, p1

    return p1
.end method

.method static synthetic access$000(Lcom/radaee/annotui/UILHeadButton;)Lcom/radaee/annotui/UIAnnotPop;
    .locals 0

    .line 19
    iget-object p0, p0, Lcom/radaee/annotui/UILHeadButton;->m_popup:Lcom/radaee/annotui/UIAnnotPop;

    return-object p0
.end method

.method static synthetic access$100(Lcom/radaee/annotui/UILHeadButton;F)I
    .locals 0

    .line 19
    invoke-direct {p0, p1}, Lcom/radaee/annotui/UILHeadButton;->Dp2Px(F)I

    move-result p0

    return p0
.end method

.method private init()V
    .locals 5

    const/4 v0, -0x1

    .line 37
    invoke-virtual {p0, v0}, Lcom/radaee/annotui/UILHeadButton;->setBackgroundColor(I)V

    .line 38
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/radaee/annotui/UILHeadButton;->m_paint_stroke:Landroid/graphics/Paint;

    .line 39
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 40
    iget-object v0, p0, Lcom/radaee/annotui/UILHeadButton;->m_paint_stroke:Landroid/graphics/Paint;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {p0, v1}, Lcom/radaee/annotui/UILHeadButton;->Dp2Px(F)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 41
    iget-object v0, p0, Lcom/radaee/annotui/UILHeadButton;->m_paint_stroke:Landroid/graphics/Paint;

    const/high16 v1, -0x1000000

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 43
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/radaee/annotui/UILHeadButton;->m_paint_fill:Landroid/graphics/Paint;

    .line 44
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 45
    iget-object v0, p0, Lcom/radaee/annotui/UILHeadButton;->m_paint_fill:Landroid/graphics/Paint;

    const v1, -0x7f7f80

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 47
    invoke-virtual {p0}, Lcom/radaee/annotui/UILHeadButton;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/radaee/viewlib/R$layout;->pop_lhead:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/radaee/annotui/UILHeadButton;->m_layout:Landroid/widget/LinearLayout;

    .line 48
    new-instance v0, Lcom/radaee/annotui/UILHeadButton$1;

    invoke-direct {v0, p0}, Lcom/radaee/annotui/UILHeadButton$1;-><init>(Lcom/radaee/annotui/UILHeadButton;)V

    .line 55
    iget-object v1, p0, Lcom/radaee/annotui/UILHeadButton;->m_layout:Landroid/widget/LinearLayout;

    sget v2, Lcom/radaee/viewlib/R$id;->vw_lhead0:I

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/radaee/annotui/UILHeadView;

    .line 56
    invoke-virtual {v1, v0}, Lcom/radaee/annotui/UILHeadView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 58
    iget-object v1, p0, Lcom/radaee/annotui/UILHeadButton;->m_layout:Landroid/widget/LinearLayout;

    sget v2, Lcom/radaee/viewlib/R$id;->vw_lhead1:I

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/radaee/annotui/UILHeadView;

    const/4 v2, 0x1

    .line 59
    invoke-virtual {v1, v2}, Lcom/radaee/annotui/UILHeadView;->setStyle(I)V

    .line 60
    invoke-virtual {v1, v0}, Lcom/radaee/annotui/UILHeadView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 62
    iget-object v1, p0, Lcom/radaee/annotui/UILHeadButton;->m_layout:Landroid/widget/LinearLayout;

    sget v3, Lcom/radaee/viewlib/R$id;->vw_lhead2:I

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/radaee/annotui/UILHeadView;

    const/4 v3, 0x2

    .line 63
    invoke-virtual {v1, v3}, Lcom/radaee/annotui/UILHeadView;->setStyle(I)V

    .line 64
    invoke-virtual {v1, v0}, Lcom/radaee/annotui/UILHeadView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 66
    iget-object v1, p0, Lcom/radaee/annotui/UILHeadButton;->m_layout:Landroid/widget/LinearLayout;

    sget v3, Lcom/radaee/viewlib/R$id;->vw_lhead3:I

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/radaee/annotui/UILHeadView;

    const/4 v3, 0x3

    .line 67
    invoke-virtual {v1, v3}, Lcom/radaee/annotui/UILHeadView;->setStyle(I)V

    .line 68
    invoke-virtual {v1, v0}, Lcom/radaee/annotui/UILHeadView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 70
    iget-object v1, p0, Lcom/radaee/annotui/UILHeadButton;->m_layout:Landroid/widget/LinearLayout;

    sget v3, Lcom/radaee/viewlib/R$id;->vw_lhead4:I

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/radaee/annotui/UILHeadView;

    const/4 v3, 0x4

    .line 71
    invoke-virtual {v1, v3}, Lcom/radaee/annotui/UILHeadView;->setStyle(I)V

    .line 72
    invoke-virtual {v1, v0}, Lcom/radaee/annotui/UILHeadView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 74
    iget-object v1, p0, Lcom/radaee/annotui/UILHeadButton;->m_layout:Landroid/widget/LinearLayout;

    sget v3, Lcom/radaee/viewlib/R$id;->vw_lhead5:I

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/radaee/annotui/UILHeadView;

    const/4 v3, 0x5

    .line 75
    invoke-virtual {v1, v3}, Lcom/radaee/annotui/UILHeadView;->setStyle(I)V

    .line 76
    invoke-virtual {v1, v0}, Lcom/radaee/annotui/UILHeadView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 78
    iget-object v1, p0, Lcom/radaee/annotui/UILHeadButton;->m_layout:Landroid/widget/LinearLayout;

    sget v3, Lcom/radaee/viewlib/R$id;->vw_lhead6:I

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/radaee/annotui/UILHeadView;

    const/4 v3, 0x6

    .line 79
    invoke-virtual {v1, v3}, Lcom/radaee/annotui/UILHeadView;->setStyle(I)V

    .line 80
    invoke-virtual {v1, v0}, Lcom/radaee/annotui/UILHeadView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 82
    iget-object v1, p0, Lcom/radaee/annotui/UILHeadButton;->m_layout:Landroid/widget/LinearLayout;

    sget v3, Lcom/radaee/viewlib/R$id;->vw_lhead7:I

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/radaee/annotui/UILHeadView;

    const/4 v3, 0x7

    .line 83
    invoke-virtual {v1, v3}, Lcom/radaee/annotui/UILHeadView;->setStyle(I)V

    .line 84
    invoke-virtual {v1, v0}, Lcom/radaee/annotui/UILHeadView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 86
    iget-object v1, p0, Lcom/radaee/annotui/UILHeadButton;->m_layout:Landroid/widget/LinearLayout;

    sget v3, Lcom/radaee/viewlib/R$id;->vw_lhead8:I

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/radaee/annotui/UILHeadView;

    const/16 v3, 0x8

    .line 87
    invoke-virtual {v1, v3}, Lcom/radaee/annotui/UILHeadView;->setStyle(I)V

    .line 88
    invoke-virtual {v1, v0}, Lcom/radaee/annotui/UILHeadView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 90
    iget-object v1, p0, Lcom/radaee/annotui/UILHeadButton;->m_layout:Landroid/widget/LinearLayout;

    sget v3, Lcom/radaee/viewlib/R$id;->vw_lhead9:I

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/radaee/annotui/UILHeadView;

    const/16 v3, 0x9

    .line 91
    invoke-virtual {v1, v3}, Lcom/radaee/annotui/UILHeadView;->setStyle(I)V

    .line 92
    invoke-virtual {v1, v0}, Lcom/radaee/annotui/UILHeadView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 94
    new-instance v0, Lcom/radaee/annotui/UIAnnotPop;

    iget-object v1, p0, Lcom/radaee/annotui/UILHeadButton;->m_layout:Landroid/widget/LinearLayout;

    const/high16 v3, 0x42b40000    # 90.0f

    invoke-direct {p0, v3}, Lcom/radaee/annotui/UILHeadButton;->Dp2Px(F)I

    move-result v3

    iget-object v4, p0, Lcom/radaee/annotui/UILHeadButton;->m_layout:Landroid/widget/LinearLayout;

    invoke-virtual {v4}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v4

    mul-int/lit8 v4, v4, 0x19

    int-to-float v4, v4

    invoke-direct {p0, v4}, Lcom/radaee/annotui/UILHeadButton;->Dp2Px(F)I

    move-result v4

    invoke-direct {v0, v1, v3, v4}, Lcom/radaee/annotui/UIAnnotPop;-><init>(Landroid/view/View;II)V

    iput-object v0, p0, Lcom/radaee/annotui/UILHeadButton;->m_popup:Lcom/radaee/annotui/UIAnnotPop;

    .line 95
    invoke-virtual {v0, v2}, Lcom/radaee/annotui/UIAnnotPop;->setFocusable(Z)V

    .line 96
    iget-object v0, p0, Lcom/radaee/annotui/UILHeadButton;->m_popup:Lcom/radaee/annotui/UIAnnotPop;

    invoke-virtual {v0, v2}, Lcom/radaee/annotui/UIAnnotPop;->setTouchable(Z)V

    .line 97
    iget-object v0, p0, Lcom/radaee/annotui/UILHeadButton;->m_popup:Lcom/radaee/annotui/UIAnnotPop;

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Lcom/radaee/annotui/UIAnnotPop;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 98
    new-instance v0, Lcom/radaee/annotui/UILHeadButton$2;

    invoke-direct {v0, p0}, Lcom/radaee/annotui/UILHeadButton$2;-><init>(Lcom/radaee/annotui/UILHeadButton;)V

    invoke-virtual {p0, v0}, Lcom/radaee/annotui/UILHeadButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method protected getStyle()I
    .locals 1

    .line 189
    iget v0, p0, Lcom/radaee/annotui/UILHeadButton;->m_style:I

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 14

    const/high16 v0, 0x3f800000    # 1.0f

    .line 121
    invoke-direct {p0, v0}, Lcom/radaee/annotui/UILHeadButton;->Dp2Px(F)I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x41000000    # 8.0f

    mul-float v3, v0, v1

    .line 123
    invoke-virtual {p0}, Lcom/radaee/annotui/UILHeadButton;->getWidth()I

    move-result v1

    int-to-float v1, v1

    sub-float v5, v1, v0

    .line 124
    invoke-virtual {p0}, Lcom/radaee/annotui/UILHeadButton;->getHeight()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x3f000000    # 0.5f

    mul-float v4, v0, v1

    .line 125
    iget-object v7, p0, Lcom/radaee/annotui/UILHeadButton;->m_paint_stroke:Landroid/graphics/Paint;

    move v6, v4

    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 126
    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    .line 128
    iget v0, p0, Lcom/radaee/annotui/UILHeadButton;->m_style:I

    const/high16 v1, 0x40a00000    # 5.0f

    const v8, 0x410a8f5c    # 8.66f

    const/high16 v9, 0x40200000    # 2.5f

    packed-switch v0, :pswitch_data_0

    return-void

    .line 176
    :pswitch_0
    invoke-direct {p0, v9}, Lcom/radaee/annotui/UILHeadButton;->Dp2Px(F)I

    move-result p1

    int-to-float p1, p1

    add-float/2addr p1, v3

    const v0, 0x408a8f5c    # 4.33f

    invoke-direct {p0, v0}, Lcom/radaee/annotui/UILHeadButton;->Dp2Px(F)I

    move-result v1

    int-to-float v1, v1

    sub-float v10, v4, v1

    invoke-direct {p0, v9}, Lcom/radaee/annotui/UILHeadButton;->Dp2Px(F)I

    move-result v1

    int-to-float v1, v1

    sub-float v11, v3, v1

    invoke-direct {p0, v0}, Lcom/radaee/annotui/UILHeadButton;->Dp2Px(F)I

    move-result v0

    int-to-float v0, v0

    add-float v12, v4, v0

    iget-object v13, p0, Lcom/radaee/annotui/UILHeadButton;->m_paint_stroke:Landroid/graphics/Paint;

    move v9, p1

    move-object v8, v2

    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    return-void

    .line 168
    :pswitch_1
    invoke-direct {p0, v8}, Lcom/radaee/annotui/UILHeadButton;->Dp2Px(F)I

    move-result v0

    int-to-float v0, v0

    sub-float v0, v3, v0

    invoke-direct {p0, v9}, Lcom/radaee/annotui/UILHeadButton;->Dp2Px(F)I

    move-result v1

    int-to-float v1, v1

    sub-float v1, v4, v1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Path;->moveTo(FF)V

    .line 169
    invoke-virtual {p1, v3, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 170
    invoke-direct {p0, v8}, Lcom/radaee/annotui/UILHeadButton;->Dp2Px(F)I

    move-result v0

    int-to-float v0, v0

    sub-float/2addr v3, v0

    invoke-direct {p0, v9}, Lcom/radaee/annotui/UILHeadButton;->Dp2Px(F)I

    move-result v0

    int-to-float v0, v0

    add-float/2addr v4, v0

    invoke-virtual {p1, v3, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 171
    invoke-virtual {p1}, Landroid/graphics/Path;->close()V

    .line 172
    iget-object v0, p0, Lcom/radaee/annotui/UILHeadButton;->m_paint_fill:Landroid/graphics/Paint;

    invoke-virtual {v2, p1, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 173
    iget-object v0, p0, Lcom/radaee/annotui/UILHeadButton;->m_paint_stroke:Landroid/graphics/Paint;

    invoke-virtual {v2, p1, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    return-void

    .line 164
    :pswitch_2
    invoke-direct {p0, v8}, Lcom/radaee/annotui/UILHeadButton;->Dp2Px(F)I

    move-result p1

    int-to-float p1, p1

    sub-float p1, v3, p1

    invoke-direct {p0, v9}, Lcom/radaee/annotui/UILHeadButton;->Dp2Px(F)I

    move-result v0

    int-to-float v0, v0

    sub-float v0, v4, v0

    iget-object v7, p0, Lcom/radaee/annotui/UILHeadButton;->m_paint_stroke:Landroid/graphics/Paint;

    move v5, v3

    move v6, v4

    move v3, p1

    move v4, v0

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move v3, v5

    move v4, v6

    .line 165
    invoke-direct {p0, v8}, Lcom/radaee/annotui/UILHeadButton;->Dp2Px(F)I

    move-result p1

    int-to-float p1, p1

    sub-float v5, v3, p1

    invoke-direct {p0, v9}, Lcom/radaee/annotui/UILHeadButton;->Dp2Px(F)I

    move-result p1

    int-to-float p1, p1

    add-float v6, v4, p1

    iget-object v7, p0, Lcom/radaee/annotui/UILHeadButton;->m_paint_stroke:Landroid/graphics/Paint;

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    return-void

    :pswitch_3
    const v0, 0x40623d71    # 3.535f

    .line 155
    invoke-direct {p0, v0}, Lcom/radaee/annotui/UILHeadButton;->Dp2Px(F)I

    move-result v1

    int-to-float v1, v1

    sub-float v1, v3, v1

    invoke-virtual {p1, v1, v4}, Landroid/graphics/Path;->moveTo(FF)V

    .line 156
    invoke-direct {p0, v0}, Lcom/radaee/annotui/UILHeadButton;->Dp2Px(F)I

    move-result v1

    int-to-float v1, v1

    sub-float v1, v4, v1

    invoke-virtual {p1, v3, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 157
    invoke-direct {p0, v0}, Lcom/radaee/annotui/UILHeadButton;->Dp2Px(F)I

    move-result v1

    int-to-float v1, v1

    add-float/2addr v1, v3

    invoke-virtual {p1, v1, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 158
    invoke-direct {p0, v0}, Lcom/radaee/annotui/UILHeadButton;->Dp2Px(F)I

    move-result v0

    int-to-float v0, v0

    add-float/2addr v4, v0

    invoke-virtual {p1, v3, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 159
    invoke-virtual {p1}, Landroid/graphics/Path;->close()V

    .line 160
    iget-object v0, p0, Lcom/radaee/annotui/UILHeadButton;->m_paint_fill:Landroid/graphics/Paint;

    invoke-virtual {v2, p1, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 161
    iget-object v0, p0, Lcom/radaee/annotui/UILHeadButton;->m_paint_stroke:Landroid/graphics/Paint;

    invoke-virtual {v2, p1, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    return-void

    .line 152
    :pswitch_4
    invoke-direct {p0, v1}, Lcom/radaee/annotui/UILHeadButton;->Dp2Px(F)I

    move-result p1

    int-to-float p1, p1

    sub-float p1, v4, p1

    invoke-direct {p0, v1}, Lcom/radaee/annotui/UILHeadButton;->Dp2Px(F)I

    move-result v0

    int-to-float v0, v0

    add-float v6, v4, v0

    iget-object v7, p0, Lcom/radaee/annotui/UILHeadButton;->m_paint_stroke:Landroid/graphics/Paint;

    move v5, v3

    move v4, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    return-void

    .line 148
    :pswitch_5
    invoke-direct {p0, v1}, Lcom/radaee/annotui/UILHeadButton;->Dp2Px(F)I

    move-result p1

    int-to-float p1, p1

    iget-object v0, p0, Lcom/radaee/annotui/UILHeadButton;->m_paint_fill:Landroid/graphics/Paint;

    invoke-virtual {v2, v3, v4, p1, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 149
    invoke-direct {p0, v1}, Lcom/radaee/annotui/UILHeadButton;->Dp2Px(F)I

    move-result p1

    int-to-float p1, p1

    iget-object v0, p0, Lcom/radaee/annotui/UILHeadButton;->m_paint_stroke:Landroid/graphics/Paint;

    invoke-virtual {v2, v3, v4, p1, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    return-void

    .line 143
    :pswitch_6
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p0, v1}, Lcom/radaee/annotui/UILHeadButton;->Dp2Px(F)I

    move-result v0

    int-to-float v0, v0

    sub-float v0, v3, v0

    invoke-direct {p0, v1}, Lcom/radaee/annotui/UILHeadButton;->Dp2Px(F)I

    move-result v5

    int-to-float v5, v5

    sub-float v5, v4, v5

    invoke-direct {p0, v1}, Lcom/radaee/annotui/UILHeadButton;->Dp2Px(F)I

    move-result v6

    int-to-float v6, v6

    add-float/2addr v3, v6

    invoke-direct {p0, v1}, Lcom/radaee/annotui/UILHeadButton;->Dp2Px(F)I

    move-result v1

    int-to-float v1, v1

    add-float/2addr v4, v1

    invoke-direct {p1, v0, v5, v3, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 144
    iget-object v0, p0, Lcom/radaee/annotui/UILHeadButton;->m_paint_fill:Landroid/graphics/Paint;

    invoke-virtual {v2, p1, v0}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 145
    iget-object v0, p0, Lcom/radaee/annotui/UILHeadButton;->m_paint_stroke:Landroid/graphics/Paint;

    invoke-virtual {v2, p1, v0}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    return-void

    .line 135
    :pswitch_7
    invoke-direct {p0, v8}, Lcom/radaee/annotui/UILHeadButton;->Dp2Px(F)I

    move-result v0

    int-to-float v0, v0

    add-float/2addr v0, v3

    invoke-direct {p0, v9}, Lcom/radaee/annotui/UILHeadButton;->Dp2Px(F)I

    move-result v1

    int-to-float v1, v1

    sub-float v1, v4, v1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Path;->moveTo(FF)V

    .line 136
    invoke-virtual {p1, v3, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 137
    invoke-direct {p0, v8}, Lcom/radaee/annotui/UILHeadButton;->Dp2Px(F)I

    move-result v0

    int-to-float v0, v0

    add-float/2addr v3, v0

    invoke-direct {p0, v9}, Lcom/radaee/annotui/UILHeadButton;->Dp2Px(F)I

    move-result v0

    int-to-float v0, v0

    add-float/2addr v4, v0

    invoke-virtual {p1, v3, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 138
    invoke-virtual {p1}, Landroid/graphics/Path;->close()V

    .line 139
    iget-object v0, p0, Lcom/radaee/annotui/UILHeadButton;->m_paint_fill:Landroid/graphics/Paint;

    invoke-virtual {v2, p1, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 140
    iget-object v0, p0, Lcom/radaee/annotui/UILHeadButton;->m_paint_stroke:Landroid/graphics/Paint;

    invoke-virtual {v2, p1, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    return-void

    .line 131
    :pswitch_8
    invoke-direct {p0, v8}, Lcom/radaee/annotui/UILHeadButton;->Dp2Px(F)I

    move-result p1

    int-to-float p1, p1

    add-float/2addr p1, v3

    invoke-direct {p0, v9}, Lcom/radaee/annotui/UILHeadButton;->Dp2Px(F)I

    move-result v0

    int-to-float v0, v0

    sub-float v0, v4, v0

    iget-object v7, p0, Lcom/radaee/annotui/UILHeadButton;->m_paint_stroke:Landroid/graphics/Paint;

    move v5, v3

    move v6, v4

    move v3, p1

    move v4, v0

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move v3, v5

    move v4, v6

    .line 132
    invoke-direct {p0, v8}, Lcom/radaee/annotui/UILHeadButton;->Dp2Px(F)I

    move-result p1

    int-to-float p1, p1

    add-float v5, v3, p1

    invoke-direct {p0, v9}, Lcom/radaee/annotui/UILHeadButton;->Dp2Px(F)I

    move-result p1

    int-to-float p1, p1

    add-float v6, v4, p1

    iget-object v7, p0, Lcom/radaee/annotui/UILHeadButton;->m_paint_stroke:Landroid/graphics/Paint;

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

    .line 184
    iput p1, p0, Lcom/radaee/annotui/UILHeadButton;->m_style:I

    .line 185
    invoke-virtual {p0}, Lcom/radaee/annotui/UILHeadButton;->invalidate()V

    return-void
.end method
