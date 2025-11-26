.class public Lcom/flyersoft/views/ScrollView2;
.super Landroid/widget/ScrollView;
.source "ScrollView2.java"


# static fields
.field static clipL:I

.field static clipR:I

.field static direction:I


# instance fields
.field public disableDraw:Z

.field public drawCount:I

.field public lastDrawTime:J

.field public recordDrawCount:Z

.field shadow_l:Landroid/graphics/Bitmap;

.field shadow_ld:Landroid/graphics/drawable/Drawable;

.field shiftX:F

.field shiftY:F

.field srcR:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 19
    invoke-direct {p0, p1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 23
    invoke-direct {p0, p1, p2}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 27
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private drawBackground(Landroid/graphics/Canvas;)V
    .locals 3

    .line 130
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 131
    iget v0, p0, Lcom/flyersoft/views/ScrollView2;->shiftX:F

    invoke-virtual {p0}, Lcom/flyersoft/views/ScrollView2;->getScrollY()I

    move-result v1

    int-to-float v1, v1

    iget v2, p0, Lcom/flyersoft/views/ScrollView2;->shiftY:F

    add-float/2addr v1, v2

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 132
    invoke-static {p1}, Lcom/flyersoft/tools/A;->setBackgroundImage(Landroid/graphics/Canvas;)V

    .line 133
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method private drawVertShadow(Landroid/graphics/Canvas;II)V
    .locals 3

    .line 140
    invoke-static {}, Lcom/flyersoft/tools/A;->getDensity()F

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    const/high16 v0, 0x41a00000    # 20.0f

    goto :goto_0

    :cond_0
    const/high16 v0, 0x41700000    # 15.0f

    :goto_0
    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    .line 148
    iget-object v1, p0, Lcom/flyersoft/views/ScrollView2;->shadow_ld:Landroid/graphics/drawable/Drawable;

    if-nez v1, :cond_1

    .line 149
    invoke-virtual {p0}, Lcom/flyersoft/views/ScrollView2;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$drawable;->shadow_l2:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/flyersoft/views/ScrollView2;->shadow_ld:Landroid/graphics/drawable/Drawable;

    .line 151
    :cond_1
    iget-object v1, p0, Lcom/flyersoft/views/ScrollView2;->shadow_ld:Landroid/graphics/drawable/Drawable;

    add-int/2addr v0, p2

    invoke-virtual {p0}, Lcom/flyersoft/views/ScrollView2;->getHeight()I

    move-result v2

    add-int/2addr v2, p3

    invoke-virtual {v1, p2, p3, v0, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 152
    iget-object p2, p0, Lcom/flyersoft/views/ScrollView2;->shadow_ld:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public static setClipPos(III)V
    .locals 0

    .line 75
    sput p0, Lcom/flyersoft/views/ScrollView2;->clipL:I

    .line 76
    sput p1, Lcom/flyersoft/views/ScrollView2;->clipR:I

    .line 77
    sput p2, Lcom/flyersoft/views/ScrollView2;->direction:I

    return-void
.end method


# virtual methods
.method public computeScroll()V
    .locals 0

    .line 60
    invoke-super {p0}, Landroid/widget/ScrollView;->computeScroll()V

    return-void
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 6

    .line 86
    invoke-virtual {p0}, Lcom/flyersoft/views/ScrollView2;->isInEditMode()Z

    move-result v0

    if-nez v0, :cond_b

    iget-boolean v0, p0, Lcom/flyersoft/views/ScrollView2;->disableDraw:Z

    if-eqz v0, :cond_0

    goto/16 :goto_5

    .line 88
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/views/ScrollView2;->recordDrawCount:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    .line 89
    iget v0, p0, Lcom/flyersoft/views/ScrollView2;->drawCount:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/flyersoft/views/ScrollView2;->drawCount:I

    .line 95
    :cond_1
    sget-object v0, Lcom/flyersoft/tools/A;->scrollCache:Landroid/widget/ScrollView;

    const/4 v2, 0x0

    if-ne p0, v0, :cond_2

    sget-object v0, Lcom/flyersoft/tools/A;->txtCache:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getHeight()I

    move-result v0

    invoke-virtual {p0}, Lcom/flyersoft/views/ScrollView2;->getHeight()I

    move-result v3

    if-ge v0, v3, :cond_2

    .line 96
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "--------------txtCache height:"

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v3, Lcom/flyersoft/tools/A;->txtCache:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v3}, Lcom/flyersoft/staticlayout/MRTextView;->getHeight()I

    move-result v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " sv height:"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/flyersoft/views/ScrollView2;->getHeight()I

    move-result v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-array v3, v1, [Ljava/lang/Object;

    aput-object v0, v3, v2

    invoke-static {v3}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 97
    sget-object v0, Lcom/flyersoft/tools/A;->txtCache:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {p0}, Lcom/flyersoft/views/ScrollView2;->getHeight()I

    move-result v3

    mul-int/lit8 v3, v3, 0x2

    invoke-static {v0, v3}, Lcom/flyersoft/tools/A;->setViewBottom(Landroid/view/View;I)V

    .line 104
    :cond_2
    sget v0, Lcom/flyersoft/views/ScrollView2;->clipL:I

    if-nez v0, :cond_4

    sget v0, Lcom/flyersoft/views/ScrollView2;->clipR:I

    if-eqz v0, :cond_3

    goto :goto_0

    :cond_3
    const/4 v0, 0x0

    goto :goto_1

    :cond_4
    :goto_0
    const/4 v0, 0x1

    :goto_1
    if-eqz v0, :cond_5

    .line 105
    sget-object v3, Lcom/flyersoft/tools/A;->scrollCache:Landroid/widget/ScrollView;

    if-ne p0, v3, :cond_5

    .line 106
    sget v3, Lcom/flyersoft/views/ScrollView2;->clipL:I

    sget v4, Lcom/flyersoft/views/ScrollView2;->clipR:I

    sget-object v5, Lcom/flyersoft/tools/A;->txtCache:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v5}, Lcom/flyersoft/staticlayout/MRTextView;->getHeight()I

    move-result v5

    invoke-virtual {p1, v3, v2, v4, v5}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    .line 108
    :cond_5
    iget v2, p0, Lcom/flyersoft/views/ScrollView2;->shiftX:F

    const/4 v3, 0x0

    cmpl-float v2, v2, v3

    if-nez v2, :cond_8

    iget v2, p0, Lcom/flyersoft/views/ScrollView2;->shiftY:F

    cmpl-float v2, v2, v3

    if-eqz v2, :cond_6

    goto :goto_2

    .line 115
    :cond_6
    sget-object v2, Lcom/flyersoft/tools/A;->scrollCache:Landroid/widget/ScrollView;

    if-ne p0, v2, :cond_7

    .line 116
    invoke-direct {p0, p1}, Lcom/flyersoft/views/ScrollView2;->drawBackground(Landroid/graphics/Canvas;)V

    .line 117
    :cond_7
    invoke-super {p0, p1}, Landroid/widget/ScrollView;->dispatchDraw(Landroid/graphics/Canvas;)V

    goto :goto_3

    .line 109
    :cond_8
    :goto_2
    invoke-direct {p0, p1}, Lcom/flyersoft/views/ScrollView2;->drawBackground(Landroid/graphics/Canvas;)V

    .line 110
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 111
    iget v2, p0, Lcom/flyersoft/views/ScrollView2;->shiftX:F

    iget v3, p0, Lcom/flyersoft/views/ScrollView2;->shiftY:F

    invoke-virtual {p1, v2, v3}, Landroid/graphics/Canvas;->translate(FF)V

    .line 112
    invoke-super {p0, p1}, Landroid/widget/ScrollView;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 113
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    :goto_3
    if-eqz v0, :cond_b

    .line 121
    invoke-static {}, Lcom/flyersoft/tools/A;->isFlipNone()Z

    move-result v0

    if-eqz v0, :cond_9

    sget v0, Lcom/flyersoft/tools/A;->hori_fling_animation:I

    goto :goto_4

    :cond_9
    sget v0, Lcom/flyersoft/tools/A;->flip_animation:I

    .line 122
    :goto_4
    sget-object v2, Lcom/flyersoft/tools/A;->scrollCache:Landroid/widget/ScrollView;

    const/4 v3, 0x6

    if-ne p0, v2, :cond_a

    sget v2, Lcom/flyersoft/views/ScrollView2;->direction:I

    const/4 v4, -0x1

    if-ne v2, v4, :cond_a

    if-ne v0, v3, :cond_a

    .line 123
    sget v2, Lcom/flyersoft/views/ScrollView2;->clipL:I

    invoke-virtual {p0}, Lcom/flyersoft/views/ScrollView2;->getScrollY()I

    move-result v4

    invoke-direct {p0, p1, v2, v4}, Lcom/flyersoft/views/ScrollView2;->drawVertShadow(Landroid/graphics/Canvas;II)V

    .line 124
    :cond_a
    sget-object v2, Lcom/flyersoft/tools/A;->txtScroll:Landroid/widget/ScrollView;

    if-ne p0, v2, :cond_b

    sget v2, Lcom/flyersoft/views/ScrollView2;->direction:I

    if-ne v2, v1, :cond_b

    if-ne v0, v3, :cond_b

    .line 125
    sget v0, Lcom/flyersoft/views/ScrollView2;->clipR:I

    invoke-virtual {p0}, Lcom/flyersoft/views/ScrollView2;->getScrollY()I

    move-result v1

    invoke-direct {p0, p1, v0, v1}, Lcom/flyersoft/views/ScrollView2;->drawVertShadow(Landroid/graphics/Canvas;II)V

    :cond_b
    :goto_5
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 0

    .line 54
    invoke-super {p0, p1}, Landroid/widget/ScrollView;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method protected drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z
    .locals 1

    .line 40
    invoke-virtual {p0}, Lcom/flyersoft/views/ScrollView2;->isInEditMode()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 43
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/views/ScrollView2;->getWidth()I

    move-result v0

    if-lez v0, :cond_1

    sget-object v0, Lcom/flyersoft/tools/A;->contentLay:Lcom/flyersoft/views/ContentLay;

    if-eqz v0, :cond_1

    .line 44
    invoke-virtual {p2}, Landroid/view/View;->invalidate()V

    .line 45
    sget-object v0, Lcom/flyersoft/tools/A;->contentLay:Lcom/flyersoft/views/ContentLay;

    iget-object v0, v0, Lcom/flyersoft/views/ContentLay;->visualBookmarks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 46
    sget-object v0, Lcom/flyersoft/tools/A;->contentLay:Lcom/flyersoft/views/ContentLay;

    invoke-virtual {v0}, Lcom/flyersoft/views/ContentLay;->invalidate()V

    .line 48
    :cond_1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/ScrollView;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    move-result p1

    return p1
.end method

.method protected onRequestFocusInDescendants(ILandroid/graphics/Rect;)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method

.method public scrollTo(II)V
    .locals 0

    .line 33
    invoke-super {p0, p1, p2}, Landroid/widget/ScrollView;->scrollTo(II)V

    return-void
.end method

.method public setShift(FFZ)V
    .locals 0

    .line 65
    iput p1, p0, Lcom/flyersoft/views/ScrollView2;->shiftX:F

    .line 66
    iput p2, p0, Lcom/flyersoft/views/ScrollView2;->shiftY:F

    if-eqz p3, :cond_0

    .line 68
    invoke-virtual {p0}, Lcom/flyersoft/views/ScrollView2;->postInvalidate()V

    return-void

    .line 70
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/views/ScrollView2;->invalidate()V

    return-void
.end method
