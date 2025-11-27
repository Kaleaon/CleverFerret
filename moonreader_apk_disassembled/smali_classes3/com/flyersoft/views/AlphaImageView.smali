.class public Lcom/flyersoft/views/AlphaImageView;
.super Landroid/widget/ImageView;
.source "AlphaImageView.java"


# instance fields
.field public alpa:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 18
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 22
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 2

    .line 29
    invoke-super {p0, p1}, Landroid/widget/ImageView;->onDraw(Landroid/graphics/Canvas;)V

    .line 30
    invoke-virtual {p0}, Lcom/flyersoft/views/AlphaImageView;->isInEditMode()Z

    move-result v0

    if-nez v0, :cond_1

    .line 31
    sget-boolean v0, Lcom/flyersoft/tools/A;->mainNightTheme:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/flyersoft/views/AlphaImageView;->alpa:I

    if-lez v0, :cond_0

    const/4 v1, 0x0

    .line 32
    invoke-static {v0, v1, v1, v1}, Landroid/graphics/Color;->argb(IIII)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 33
    :cond_0
    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v0, :cond_1

    .line 34
    sget v0, Lcom/flyersoft/tools/C;->colorPrimary:I

    const/16 v1, -0xb4

    invoke-static {v0, v1}, Lcom/flyersoft/tools/A;->getAlphaColor(II)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    :cond_1
    return-void
.end method
