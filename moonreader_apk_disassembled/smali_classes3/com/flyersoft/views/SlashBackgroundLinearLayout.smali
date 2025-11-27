.class public Lcom/flyersoft/views/SlashBackgroundLinearLayout;
.super Landroid/widget/LinearLayout;
.source "SlashBackgroundLinearLayout.java"


# instance fields
.field public degress:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 16
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 p1, 0x3c

    .line 31
    iput p1, p0, Lcom/flyersoft/views/SlashBackgroundLinearLayout;->degress:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 20
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/16 p1, 0x3c

    .line 31
    iput p1, p0, Lcom/flyersoft/views/SlashBackgroundLinearLayout;->degress:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 24
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/16 p1, 0x3c

    .line 31
    iput p1, p0, Lcom/flyersoft/views/SlashBackgroundLinearLayout;->degress:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 28
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const/16 p1, 0x3c

    .line 31
    iput p1, p0, Lcom/flyersoft/views/SlashBackgroundLinearLayout;->degress:I

    return-void
.end method


# virtual methods
.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 10

    .line 35
    new-instance v5, Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-direct {v5, v0}, Landroid/graphics/Paint;-><init>(I)V

    .line 36
    invoke-virtual {p0}, Lcom/flyersoft/views/SlashBackgroundLinearLayout;->isInEditMode()Z

    move-result v0

    if-eqz v0, :cond_0

    const/high16 v0, 0x40000000    # 2.0f

    goto :goto_0

    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {v0}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v0

    :goto_0
    invoke-virtual {v5, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    const v0, 0x55888888

    .line 37
    invoke-virtual {v5, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 39
    invoke-virtual {p0}, Lcom/flyersoft/views/SlashBackgroundLinearLayout;->getWidth()I

    move-result v6

    .line 40
    invoke-virtual {p0}, Lcom/flyersoft/views/SlashBackgroundLinearLayout;->getHeight()I

    move-result v7

    .line 41
    invoke-virtual {p0}, Lcom/flyersoft/views/SlashBackgroundLinearLayout;->isInEditMode()Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 v0, 0x32

    const/16 v8, 0x32

    goto :goto_1

    :cond_1
    const/high16 v0, 0x41c80000    # 25.0f

    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    move v8, v0

    :goto_1
    move v9, v8

    :goto_2
    mul-int/lit8 v0, v6, 0x2

    if-lt v9, v0, :cond_3

    mul-int/lit8 v0, v7, 0x2

    if-ge v9, v0, :cond_2

    goto :goto_3

    .line 49
    :cond_2
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->dispatchDraw(Landroid/graphics/Canvas;)V

    return-void

    :cond_3
    :goto_3
    int-to-float v2, v9

    int-to-float v3, v6

    .line 45
    iget v0, p0, Lcom/flyersoft/views/SlashBackgroundLinearLayout;->degress:I

    mul-int v0, v0, v6

    div-int/lit8 v0, v0, 0x64

    sub-int v0, v9, v0

    int-to-float v4, v0

    const/4 v1, 0x0

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    add-int/2addr v9, v8

    goto :goto_2
.end method
