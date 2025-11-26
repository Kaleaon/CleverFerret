.class public Lcom/radaee/annotui/UISignView;
.super Landroid/view/View;
.source "UISignView.java"


# instance fields
.field private m_paint:Landroid/graphics/Paint;

.field private m_paint_border:Landroid/graphics/Paint;

.field private m_path_a:Landroid/graphics/Path;

.field private m_path_r:Lcom/radaee/pdf/Path;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 19
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 20
    invoke-direct {p0}, Lcom/radaee/annotui/UISignView;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 23
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 24
    invoke-direct {p0}, Lcom/radaee/annotui/UISignView;->init()V

    return-void
.end method

.method private init()V
    .locals 2

    .line 33
    new-instance v0, Lcom/radaee/pdf/Path;

    invoke-direct {v0}, Lcom/radaee/pdf/Path;-><init>()V

    iput-object v0, p0, Lcom/radaee/annotui/UISignView;->m_path_r:Lcom/radaee/pdf/Path;

    .line 34
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/radaee/annotui/UISignView;->m_path_a:Landroid/graphics/Path;

    .line 35
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/radaee/annotui/UISignView;->m_paint:Landroid/graphics/Paint;

    const v1, -0xffff01

    .line 40
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 41
    iget-object v0, p0, Lcom/radaee/annotui/UISignView;->m_paint:Landroid/graphics/Paint;

    const/16 v1, 0xff

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 42
    iget-object v0, p0, Lcom/radaee/annotui/UISignView;->m_paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 43
    iget-object v0, p0, Lcom/radaee/annotui/UISignView;->m_paint:Landroid/graphics/Paint;

    const/high16 v1, 0x40000000    # 2.0f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 44
    iget-object v0, p0, Lcom/radaee/annotui/UISignView;->m_paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 45
    iget-object v0, p0, Lcom/radaee/annotui/UISignView;->m_paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 46
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/radaee/annotui/UISignView;->m_paint_border:Landroid/graphics/Paint;

    const/high16 v1, -0x1000000

    .line 47
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 48
    iget-object v0, p0, Lcom/radaee/annotui/UISignView;->m_paint_border:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 49
    iget-object v0, p0, Lcom/radaee/annotui/UISignView;->m_paint_border:Landroid/graphics/Paint;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    return-void
.end method


# virtual methods
.method public SignGetBmp()Landroid/graphics/Bitmap;
    .locals 3

    .line 68
    invoke-virtual {p0}, Lcom/radaee/annotui/UISignView;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/radaee/annotui/UISignView;->getHeight()I

    move-result v1

    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 69
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {p0, v1}, Lcom/radaee/annotui/UISignView;->draw(Landroid/graphics/Canvas;)V

    return-object v0
.end method

.method public SignGetPath()Lcom/radaee/pdf/Path;
    .locals 1

    .line 63
    iget-object v0, p0, Lcom/radaee/annotui/UISignView;->m_path_r:Lcom/radaee/pdf/Path;

    return-object v0
.end method

.method public SignMakeForm(Lcom/radaee/pdf/Document;Lcom/radaee/pdf/Page$Annotation;)Lcom/radaee/pdf/Document$DocForm;
    .locals 6

    .line 80
    iget-object p2, p0, Lcom/radaee/annotui/UISignView;->m_path_a:Landroid/graphics/Path;

    invoke-virtual {p2}, Landroid/graphics/Path;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 81
    :cond_0
    invoke-virtual {p1}, Lcom/radaee/pdf/Document;->NewForm()Lcom/radaee/pdf/Document$DocForm;

    move-result-object v0

    .line 82
    new-instance v1, Lcom/radaee/pdf/PageContent;

    invoke-direct {v1}, Lcom/radaee/pdf/PageContent;-><init>()V

    .line 83
    invoke-virtual {p0}, Lcom/radaee/annotui/UISignView;->getWidth()I

    move-result p1

    .line 84
    invoke-virtual {p0}, Lcom/radaee/annotui/UISignView;->getHeight()I

    move-result p2

    .line 85
    invoke-virtual {v1}, Lcom/radaee/pdf/PageContent;->Create()V

    .line 86
    invoke-virtual {v1}, Lcom/radaee/pdf/PageContent;->GSSave()V

    .line 87
    new-instance v2, Lcom/radaee/pdf/Matrix;

    int-to-float v5, p2

    const/high16 p2, 0x3f800000    # 1.0f

    const/high16 v3, -0x40800000    # -1.0f

    const/4 v4, 0x0

    invoke-direct {v2, p2, v3, v4, v5}, Lcom/radaee/pdf/Matrix;-><init>(FFFF)V

    .line 88
    invoke-virtual {v1, v2}, Lcom/radaee/pdf/PageContent;->GSSetMatrix(Lcom/radaee/pdf/Matrix;)V

    .line 89
    invoke-virtual {v2}, Lcom/radaee/pdf/Matrix;->Destroy()V

    const/4 p2, 0x1

    .line 90
    invoke-virtual {v1, p2}, Lcom/radaee/pdf/PageContent;->SetStrokeCap(I)V

    .line 91
    invoke-virtual {v1, p2}, Lcom/radaee/pdf/PageContent;->SetStrokeJoin(I)V

    .line 92
    iget-object p2, p0, Lcom/radaee/annotui/UISignView;->m_paint:Landroid/graphics/Paint;

    invoke-virtual {p2}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result p2

    invoke-virtual {v1, p2}, Lcom/radaee/pdf/PageContent;->SetStrokeWidth(F)V

    .line 93
    iget-object p2, p0, Lcom/radaee/annotui/UISignView;->m_paint:Landroid/graphics/Paint;

    invoke-virtual {p2}, Landroid/graphics/Paint;->getColor()I

    move-result p2

    invoke-virtual {v1, p2}, Lcom/radaee/pdf/PageContent;->SetStrokeColor(I)V

    .line 94
    iget-object p2, p0, Lcom/radaee/annotui/UISignView;->m_path_r:Lcom/radaee/pdf/Path;

    invoke-virtual {v1, p2}, Lcom/radaee/pdf/PageContent;->StrokePath(Lcom/radaee/pdf/Path;)V

    .line 95
    invoke-virtual {v1}, Lcom/radaee/pdf/PageContent;->GSRestore()V

    const/4 v3, 0x0

    int-to-float v4, p1

    const/4 v2, 0x0

    .line 96
    invoke-virtual/range {v0 .. v5}, Lcom/radaee/pdf/Document$DocForm;->SetContent(Lcom/radaee/pdf/PageContent;FFFF)V

    .line 97
    invoke-virtual {v1}, Lcom/radaee/pdf/PageContent;->Destroy()V

    return-object v0
.end method

.method public SignReset()V
    .locals 1

    .line 74
    new-instance v0, Lcom/radaee/pdf/Path;

    invoke-direct {v0}, Lcom/radaee/pdf/Path;-><init>()V

    iput-object v0, p0, Lcom/radaee/annotui/UISignView;->m_path_r:Lcom/radaee/pdf/Path;

    .line 75
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/radaee/annotui/UISignView;->m_path_a:Landroid/graphics/Path;

    .line 76
    invoke-virtual {p0}, Lcom/radaee/annotui/UISignView;->invalidate()V

    return-void
.end method

.method public SignSetParameter(IF)V
    .locals 1

    .line 53
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/radaee/annotui/UISignView;->m_paint:Landroid/graphics/Paint;

    .line 54
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 55
    iget-object p1, p0, Lcom/radaee/annotui/UISignView;->m_paint:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 56
    iget-object p1, p0, Lcom/radaee/annotui/UISignView;->m_paint:Landroid/graphics/Paint;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 57
    iget-object p1, p0, Lcom/radaee/annotui/UISignView;->m_paint:Landroid/graphics/Paint;

    sget-object p2, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 58
    iget-object p1, p0, Lcom/radaee/annotui/UISignView;->m_paint:Landroid/graphics/Paint;

    sget-object p2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 59
    invoke-virtual {p0}, Lcom/radaee/annotui/UISignView;->invalidate()V

    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 7

    .line 103
    iget-object v0, p0, Lcom/radaee/annotui/UISignView;->m_path_a:Landroid/graphics/Path;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, -0x1

    .line 104
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 105
    iget-object v0, p0, Lcom/radaee/annotui/UISignView;->m_path_a:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/radaee/annotui/UISignView;->m_paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 106
    invoke-virtual {p0}, Lcom/radaee/annotui/UISignView;->getWidth()I

    move-result v0

    int-to-float v4, v0

    invoke-virtual {p0}, Lcom/radaee/annotui/UISignView;->getHeight()I

    move-result v0

    int-to-float v5, v0

    iget-object v6, p0, Lcom/radaee/annotui/UISignView;->m_paint_border:Landroid/graphics/Paint;

    const/high16 v2, 0x3f800000    # 1.0f

    const/high16 v3, 0x3f800000    # 1.0f

    move-object v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 111
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    .line 112
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    .line 113
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    const/4 v2, 0x1

    if-eqz p1, :cond_2

    if-eq p1, v2, :cond_1

    const/4 v3, 0x2

    if-eq p1, v3, :cond_0

    const/4 v3, 0x3

    if-eq p1, v3, :cond_1

    goto :goto_0

    .line 120
    :cond_0
    iget-object p1, p0, Lcom/radaee/annotui/UISignView;->m_path_r:Lcom/radaee/pdf/Path;

    invoke-virtual {p1, v0, v1}, Lcom/radaee/pdf/Path;->LineTo(FF)V

    .line 121
    iget-object p1, p0, Lcom/radaee/annotui/UISignView;->m_path_a:Landroid/graphics/Path;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 122
    invoke-virtual {p0}, Lcom/radaee/annotui/UISignView;->invalidate()V

    goto :goto_0

    .line 126
    :cond_1
    iget-object p1, p0, Lcom/radaee/annotui/UISignView;->m_path_r:Lcom/radaee/pdf/Path;

    invoke-virtual {p1, v0, v1}, Lcom/radaee/pdf/Path;->LineTo(FF)V

    .line 127
    iget-object p1, p0, Lcom/radaee/annotui/UISignView;->m_path_a:Landroid/graphics/Path;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 128
    invoke-virtual {p0}, Lcom/radaee/annotui/UISignView;->invalidate()V

    goto :goto_0

    .line 116
    :cond_2
    iget-object p1, p0, Lcom/radaee/annotui/UISignView;->m_path_r:Lcom/radaee/pdf/Path;

    invoke-virtual {p1, v0, v1}, Lcom/radaee/pdf/Path;->MoveTo(FF)V

    .line 117
    iget-object p1, p0, Lcom/radaee/annotui/UISignView;->m_path_a:Landroid/graphics/Path;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Path;->moveTo(FF)V

    :goto_0
    return v2
.end method
