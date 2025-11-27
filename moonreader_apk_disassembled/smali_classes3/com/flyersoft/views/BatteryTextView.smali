.class public Lcom/flyersoft/views/BatteryTextView;
.super Landroid/widget/TextView;
.source "BatteryTextView.java"


# instance fields
.field dayBm:Landroid/graphics/Bitmap;

.field nightBm:Landroid/graphics/Bitmap;

.field useDayIcon:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 16
    invoke-direct {p0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x1

    .line 46
    iput-boolean p1, p0, Lcom/flyersoft/views/BatteryTextView;->useDayIcon:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 20
    invoke-direct {p0, p1, p2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x1

    .line 46
    iput-boolean p1, p0, Lcom/flyersoft/views/BatteryTextView;->useDayIcon:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 24
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x1

    .line 46
    iput-boolean p1, p0, Lcom/flyersoft/views/BatteryTextView;->useDayIcon:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 28
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const/4 p1, 0x1

    .line 46
    iput-boolean p1, p0, Lcom/flyersoft/views/BatteryTextView;->useDayIcon:Z

    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 6

    .line 33
    invoke-virtual {p0}, Lcom/flyersoft/views/BatteryTextView;->isInEditMode()Z

    move-result v0

    if-nez v0, :cond_3

    .line 34
    iget-boolean v0, p0, Lcom/flyersoft/views/BatteryTextView;->useDayIcon:Z

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/flyersoft/views/BatteryTextView;->dayBm:Landroid/graphics/Bitmap;

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/flyersoft/views/BatteryTextView;->nightBm:Landroid/graphics/Bitmap;

    :goto_0
    if-nez v1, :cond_2

    if-eqz v0, :cond_1

    .line 37
    invoke-virtual {p0}, Lcom/flyersoft/views/BatteryTextView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$drawable;->battery:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->drawableToBitmap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lcom/flyersoft/views/BatteryTextView;->dayBm:Landroid/graphics/Bitmap;

    goto :goto_1

    .line 39
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/views/BatteryTextView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$drawable;->battery2:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->drawableToBitmap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lcom/flyersoft/views/BatteryTextView;->nightBm:Landroid/graphics/Bitmap;

    .line 40
    :cond_2
    :goto_1
    new-instance v0, Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    const/4 v4, 0x0

    invoke-direct {v0, v4, v4, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    new-instance v2, Landroid/graphics/Rect;

    invoke-virtual {p0}, Lcom/flyersoft/views/BatteryTextView;->getWidth()I

    move-result v3

    invoke-virtual {p0}, Lcom/flyersoft/views/BatteryTextView;->getHeight()I

    move-result v5

    invoke-direct {v2, v4, v4, v3, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    const/4 v3, 0x0

    invoke-virtual {p1, v1, v0, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 42
    :cond_3
    invoke-super {p0, p1}, Landroid/widget/TextView;->onDraw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public setBatteryIcon(Z)V
    .locals 0

    .line 48
    iput-boolean p1, p0, Lcom/flyersoft/views/BatteryTextView;->useDayIcon:Z

    .line 49
    invoke-virtual {p0}, Lcom/flyersoft/views/BatteryTextView;->getWidth()I

    move-result p1

    if-lez p1, :cond_0

    .line 50
    invoke-virtual {p0}, Lcom/flyersoft/views/BatteryTextView;->postInvalidate()V

    :cond_0
    return-void
.end method
