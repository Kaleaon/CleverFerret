.class Lcom/flyersoft/views/RoundButton$RoundDrawable;
.super Landroid/graphics/drawable/GradientDrawable;
.source "RoundButton.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/views/RoundButton;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "RoundDrawable"
.end annotation


# instance fields
.field private mFillColor:I

.field private mIsStadium:Z

.field private mSolidColors:Landroid/content/res/ColorStateList;


# direct methods
.method public constructor <init>(Z)V
    .locals 0

    .line 171
    invoke-direct {p0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 172
    iput-boolean p1, p0, Lcom/flyersoft/views/RoundButton$RoundDrawable;->mIsStadium:Z

    return-void
.end method


# virtual methods
.method public isStateful()Z
    .locals 1

    .line 209
    invoke-super {p0}, Landroid/graphics/drawable/GradientDrawable;->isStateful()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/flyersoft/views/RoundButton$RoundDrawable;->mSolidColors:Landroid/content/res/ColorStateList;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->isStateful()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x1

    return v0
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .locals 2

    .line 182
    invoke-super {p0, p1}, Landroid/graphics/drawable/GradientDrawable;->onBoundsChange(Landroid/graphics/Rect;)V

    .line 183
    iget-boolean p1, p0, Lcom/flyersoft/views/RoundButton$RoundDrawable;->mIsStadium:Z

    if-eqz p1, :cond_1

    .line 184
    new-instance p1, Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/flyersoft/views/RoundButton$RoundDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 185
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v1

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result p1

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result p1

    :goto_0
    const/high16 v0, 0x40000000    # 2.0f

    div-float/2addr p1, v0

    invoke-virtual {p0, p1}, Lcom/flyersoft/views/RoundButton$RoundDrawable;->setCornerRadius(F)V

    :cond_1
    return-void
.end method

.method protected onStateChange([I)Z
    .locals 2

    .line 197
    iget-object v0, p0, Lcom/flyersoft/views/RoundButton$RoundDrawable;->mSolidColors:Landroid/content/res/ColorStateList;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 198
    invoke-virtual {v0, p1, v1}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result p1

    .line 199
    iget v0, p0, Lcom/flyersoft/views/RoundButton$RoundDrawable;->mFillColor:I

    if-eq v0, p1, :cond_0

    .line 200
    invoke-virtual {p0, p1}, Lcom/flyersoft/views/RoundButton$RoundDrawable;->setColor(I)V

    const/4 p1, 0x1

    return p1

    :cond_0
    return v1
.end method

.method public setColor(I)V
    .locals 0

    .line 191
    iput p1, p0, Lcom/flyersoft/views/RoundButton$RoundDrawable;->mFillColor:I

    .line 192
    invoke-super {p0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    return-void
.end method

.method public setSolidColors(Landroid/content/res/ColorStateList;)V
    .locals 0

    .line 176
    iput-object p1, p0, Lcom/flyersoft/views/RoundButton$RoundDrawable;->mSolidColors:Landroid/content/res/ColorStateList;

    .line 177
    invoke-virtual {p1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/flyersoft/views/RoundButton$RoundDrawable;->setColor(I)V

    return-void
.end method
