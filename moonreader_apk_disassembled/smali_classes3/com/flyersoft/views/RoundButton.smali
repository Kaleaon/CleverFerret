.class public final Lcom/flyersoft/views/RoundButton;
.super Landroid/widget/TextView;
.source "RoundButton.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/views/RoundButton$RoundDrawable;
    }
.end annotation


# instance fields
.field checkedStrokeColor:I

.field checkedStrokeWidth:I

.field cornerRadius:I

.field defaultStrokeColor:I

.field defaultStrokeWidth:I

.field private isChecked:Z

.field pressedRatio:F

.field solidColor:Landroid/content/res/ColorStateList;

.field strokeDashGap:I

.field strokeDashWidth:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 21
    invoke-direct {p0, p1, v0}, Lcom/flyersoft/views/RoundButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 25
    invoke-direct {p0, p1, p2, v0}, Lcom/flyersoft/views/RoundButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 29
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 30
    sget-object p3, Lcom/flyersoft/moonreaderp/R$styleable;->RoundButton:[I

    invoke-virtual {p1, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 33
    sget p2, Lcom/flyersoft/moonreaderp/R$styleable;->RoundButton_btnPressedRatio:I

    const p3, 0x3f4ccccd    # 0.8f

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result p2

    iput p2, p0, Lcom/flyersoft/views/RoundButton;->pressedRatio:F

    .line 34
    sget p2, Lcom/flyersoft/moonreaderp/R$styleable;->RoundButton_btnCornerRadius:I

    const/4 p3, 0x0

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getLayoutDimension(II)I

    move-result p2

    iput p2, p0, Lcom/flyersoft/views/RoundButton;->cornerRadius:I

    .line 36
    sget p2, Lcom/flyersoft/moonreaderp/R$styleable;->RoundButton_btnSolidColor:I

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object p2

    iput-object p2, p0, Lcom/flyersoft/views/RoundButton;->solidColor:Landroid/content/res/ColorStateList;

    .line 37
    sget p2, Lcom/flyersoft/moonreaderp/R$styleable;->RoundButton_btnStrokeColor:I

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p2

    iput p2, p0, Lcom/flyersoft/views/RoundButton;->defaultStrokeColor:I

    .line 38
    sget p2, Lcom/flyersoft/moonreaderp/R$styleable;->RoundButton_btnStrokeWidth:I

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    iput p2, p0, Lcom/flyersoft/views/RoundButton;->defaultStrokeWidth:I

    .line 39
    sget p2, Lcom/flyersoft/moonreaderp/R$styleable;->RoundButton_btnStrokeDashWidth:I

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    iput p2, p0, Lcom/flyersoft/views/RoundButton;->strokeDashWidth:I

    .line 40
    sget p2, Lcom/flyersoft/moonreaderp/R$styleable;->RoundButton_btnStrokeDashGap:I

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    iput p2, p0, Lcom/flyersoft/views/RoundButton;->strokeDashGap:I

    .line 42
    sget p2, Lcom/flyersoft/moonreaderp/R$styleable;->RoundButton_btnChecked:I

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    iput-boolean p2, p0, Lcom/flyersoft/views/RoundButton;->isChecked:Z

    .line 43
    sget p2, Lcom/flyersoft/moonreaderp/R$styleable;->RoundButton_btnCheckedColor:I

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p2

    iput p2, p0, Lcom/flyersoft/views/RoundButton;->checkedStrokeColor:I

    .line 44
    sget p2, Lcom/flyersoft/moonreaderp/R$styleable;->RoundButton_btnCheckedStrokeWidth:I

    const/4 p3, 0x1

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    iput p2, p0, Lcom/flyersoft/views/RoundButton;->checkedStrokeWidth:I

    .line 47
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 49
    invoke-virtual {p0, p3}, Lcom/flyersoft/views/RoundButton;->setSingleLine(Z)V

    const/16 p1, 0x11

    .line 50
    invoke-virtual {p0, p1}, Lcom/flyersoft/views/RoundButton;->setGravity(I)V

    .line 51
    invoke-direct {p0}, Lcom/flyersoft/views/RoundButton;->calRoundDrawable()V

    return-void
.end method

.method private calRoundDrawable()V
    .locals 6

    .line 63
    iget-boolean v0, p0, Lcom/flyersoft/views/RoundButton;->isChecked:Z

    if-eqz v0, :cond_0

    iget v1, p0, Lcom/flyersoft/views/RoundButton;->checkedStrokeColor:I

    goto :goto_0

    :cond_0
    iget v1, p0, Lcom/flyersoft/views/RoundButton;->defaultStrokeColor:I

    :goto_0
    if-eqz v0, :cond_1

    .line 64
    iget v0, p0, Lcom/flyersoft/views/RoundButton;->checkedStrokeWidth:I

    goto :goto_1

    :cond_1
    iget v0, p0, Lcom/flyersoft/views/RoundButton;->defaultStrokeWidth:I

    .line 66
    :goto_1
    new-instance v2, Lcom/flyersoft/views/RoundButton$RoundDrawable;

    iget v3, p0, Lcom/flyersoft/views/RoundButton;->cornerRadius:I

    const/4 v4, 0x0

    const/4 v5, -0x1

    if-ne v3, v5, :cond_2

    const/4 v3, 0x1

    goto :goto_2

    :cond_2
    const/4 v3, 0x0

    :goto_2
    invoke-direct {v2, v3}, Lcom/flyersoft/views/RoundButton$RoundDrawable;-><init>(Z)V

    .line 67
    iget v3, p0, Lcom/flyersoft/views/RoundButton;->cornerRadius:I

    if-ne v3, v5, :cond_3

    const/4 v3, 0x0

    goto :goto_3

    :cond_3
    int-to-float v3, v3

    :goto_3
    invoke-virtual {v2, v3}, Lcom/flyersoft/views/RoundButton$RoundDrawable;->setCornerRadius(F)V

    .line 68
    iget v3, p0, Lcom/flyersoft/views/RoundButton;->strokeDashWidth:I

    int-to-float v3, v3

    iget v5, p0, Lcom/flyersoft/views/RoundButton;->strokeDashGap:I

    int-to-float v5, v5

    invoke-virtual {v2, v0, v1, v3, v5}, Lcom/flyersoft/views/RoundButton$RoundDrawable;->setStroke(IIFF)V

    .line 70
    iget-object v0, p0, Lcom/flyersoft/views/RoundButton;->solidColor:Landroid/content/res/ColorStateList;

    if-nez v0, :cond_4

    .line 71
    invoke-static {v4}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/views/RoundButton;->solidColor:Landroid/content/res/ColorStateList;

    .line 73
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/views/RoundButton;->solidColor:Landroid/content/res/ColorStateList;

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->isStateful()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 74
    iget-object v0, p0, Lcom/flyersoft/views/RoundButton;->solidColor:Landroid/content/res/ColorStateList;

    invoke-virtual {v2, v0}, Lcom/flyersoft/views/RoundButton$RoundDrawable;->setSolidColors(Landroid/content/res/ColorStateList;)V

    goto :goto_4

    .line 75
    :cond_5
    iget v0, p0, Lcom/flyersoft/views/RoundButton;->pressedRatio:F

    const v1, 0x38d1b717    # 1.0E-4f

    cmpl-float v0, v0, v1

    if-lez v0, :cond_6

    .line 76
    iget-object v0, p0, Lcom/flyersoft/views/RoundButton;->solidColor:Landroid/content/res/ColorStateList;

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v0

    iget v1, p0, Lcom/flyersoft/views/RoundButton;->pressedRatio:F

    invoke-virtual {p0, v0, v1}, Lcom/flyersoft/views/RoundButton;->csl(IF)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {v2, v0}, Lcom/flyersoft/views/RoundButton$RoundDrawable;->setSolidColors(Landroid/content/res/ColorStateList;)V

    goto :goto_4

    .line 78
    :cond_6
    iget-object v0, p0, Lcom/flyersoft/views/RoundButton;->solidColor:Landroid/content/res/ColorStateList;

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v0

    invoke-virtual {v2, v0}, Lcom/flyersoft/views/RoundButton$RoundDrawable;->setColor(I)V

    .line 80
    :goto_4
    invoke-virtual {p0, v2}, Lcom/flyersoft/views/RoundButton;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method


# virtual methods
.method csl(IF)Landroid/content/res/ColorStateList;
    .locals 4

    .line 159
    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/views/RoundButton;->darker(IF)I

    move-result p2

    const/4 v0, 0x0

    .line 160
    new-array v1, v0, [I

    const/4 v2, 0x2

    new-array v2, v2, [[I

    const v3, 0x10100a7

    filled-new-array {v3}, [I

    move-result-object v3

    aput-object v3, v2, v0

    const/4 v0, 0x1

    aput-object v1, v2, v0

    .line 161
    filled-new-array {p2, p1}, [I

    move-result-object p1

    .line 162
    new-instance p2, Landroid/content/res/ColorStateList;

    invoke-direct {p2, v2, p1}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    return-object p2
.end method

.method darker(IF)I
    .locals 3

    shr-int/lit8 v0, p1, 0x18

    if-nez v0, :cond_0

    const p1, 0x22808080

    :cond_0
    const/4 v0, 0x3

    .line 151
    new-array v0, v0, [F

    .line 152
    invoke-static {p1, v0}, Landroid/graphics/Color;->colorToHSV(I[F)V

    const/4 v1, 0x2

    .line 153
    aget v2, v0, v1

    mul-float v2, v2, p2

    aput v2, v0, v1

    shr-int/lit8 p1, p1, 0x18

    .line 154
    invoke-static {p1, v0}, Landroid/graphics/Color;->HSVToColor(I[F)I

    move-result p1

    return p1
.end method

.method greyer(I)I
    .locals 3

    and-int/lit16 v0, p1, 0xff

    const v1, 0xff00

    and-int/2addr v1, p1

    shr-int/lit8 v1, v1, 0x8

    const/high16 v2, 0xff0000

    and-int/2addr p1, v2

    shr-int/lit8 p1, p1, 0x10

    int-to-float p1, p1

    const v2, 0x3e991687    # 0.299f

    mul-float p1, p1, v2

    int-to-float v1, v1

    const v2, 0x3f1645a2    # 0.587f

    mul-float v1, v1, v2

    add-float/2addr p1, v1

    int-to-float v0, v0

    const v1, 0x3de978d5    # 0.114f

    mul-float v0, v0, v1

    add-float/2addr p1, v0

    .line 144
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    const/16 v0, 0xff

    .line 145
    invoke-static {v0, p1, p1, p1}, Landroid/graphics/Color;->argb(IIII)I

    move-result p1

    return p1
.end method

.method public isChecked()Z
    .locals 1

    .line 85
    iget-boolean v0, p0, Lcom/flyersoft/views/RoundButton;->isChecked:Z

    return v0
.end method

.method public setChecked(Z)V
    .locals 0

    .line 89
    iput-boolean p1, p0, Lcom/flyersoft/views/RoundButton;->isChecked:Z

    .line 90
    invoke-direct {p0}, Lcom/flyersoft/views/RoundButton;->calRoundDrawable()V

    return-void
.end method

.method public setSolidColor(I)V
    .locals 0

    .line 94
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/views/RoundButton;->solidColor:Landroid/content/res/ColorStateList;

    .line 95
    invoke-direct {p0}, Lcom/flyersoft/views/RoundButton;->calRoundDrawable()V

    .line 96
    invoke-virtual {p0}, Lcom/flyersoft/views/RoundButton;->postInvalidate()V

    return-void
.end method
