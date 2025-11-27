.class public Lcom/flyersoft/staticlayout/MyBulletSpan;
.super Lcom/flyersoft/staticlayout/MyMarginSpan;
.source "MyBulletSpan.java"


# instance fields
.field public bullet:Ljava/lang/String;

.field public level:I


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 33
    invoke-direct {p0, v0, v0, v0, v0}, Lcom/flyersoft/staticlayout/MyMarginSpan;-><init>(FFFF)V

    return-void
.end method


# virtual methods
.method public drawFrameMargin(Landroid/graphics/Canvas;Landroid/text/TextPaint;Lcom/flyersoft/staticlayout/MRTextView;Ljava/util/ArrayList;I)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Canvas;",
            "Landroid/text/TextPaint;",
            "Lcom/flyersoft/staticlayout/MRTextView;",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/staticlayout/MyMarginSpan;",
            ">;I)V"
        }
    .end annotation

    .line 38
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyBulletSpan;->bullet:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_1

    .line 41
    :cond_0
    iget v0, p0, Lcom/flyersoft/staticlayout/MyBulletSpan;->startLine:I

    invoke-virtual {p3, v0}, Lcom/flyersoft/staticlayout/MRTextView;->isLastHalfLine(I)Z

    move-result v0

    if-eqz v0, :cond_1

    goto/16 :goto_1

    .line 44
    :cond_1
    iget v0, p0, Lcom/flyersoft/staticlayout/MyBulletSpan;->start:I

    iget v1, p0, Lcom/flyersoft/staticlayout/MyBulletSpan;->spStart:I

    if-eq v0, v1, :cond_2

    goto/16 :goto_1

    .line 47
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyBulletSpan;->bullet:Ljava/lang/String;

    invoke-static {v0, p2}, Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;Landroid/text/TextPaint;)F

    move-result v0

    .line 48
    iget v1, p0, Lcom/flyersoft/staticlayout/MyBulletSpan;->level:I

    int-to-float v1, v1

    invoke-static {}, Lcom/flyersoft/components/CSS;->MARGIN_HORI()F

    move-result v2

    mul-float v1, v1, v2

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v2

    mul-float v1, v1, v2

    sub-float/2addr v1, v0

    .line 50
    invoke-virtual {p3}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v2

    iget v3, p0, Lcom/flyersoft/staticlayout/MyBulletSpan;->startLine:I

    invoke-virtual {v2, v3}, Lcom/flyersoft/staticlayout/MyLayout;->getParagraphDirection(I)I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_3

    .line 51
    invoke-virtual {p3}, Lcom/flyersoft/staticlayout/MRTextView;->getWidth2()I

    move-result p4

    int-to-float p4, p4

    sub-float/2addr p4, v0

    add-float/2addr p4, v1

    goto :goto_0

    :cond_3
    add-int/lit8 p5, p5, 0x1

    .line 56
    invoke-virtual {p4}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p5, v0, :cond_4

    .line 57
    invoke-virtual {p4, p5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/staticlayout/MyMarginSpan;

    iget-boolean v0, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->isULSpan:Z

    if-eqz v0, :cond_3

    move v3, p5

    :cond_4
    if-lez v3, :cond_5

    const/4 p5, 0x0

    .line 62
    invoke-virtual {p0, p4, p0, v3, p5}, Lcom/flyersoft/staticlayout/MyBulletSpan;->outerHoriMargins(Ljava/util/ArrayList;Lcom/flyersoft/staticlayout/MyMarginSpan;II)F

    move-result p4

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result p5

    mul-float p4, p4, p5

    add-float/2addr v1, p4

    :cond_5
    const/4 p4, 0x0

    cmpg-float p5, v1, p4

    if-gez p5, :cond_6

    goto :goto_0

    :cond_6
    move p4, v1

    .line 69
    :goto_0
    invoke-virtual {p3}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object p3

    iget p5, p0, Lcom/flyersoft/staticlayout/MyBulletSpan;->startLine:I

    invoke-virtual {p3, p5}, Lcom/flyersoft/staticlayout/MyLayout;->getLineFloatSp(I)Lcom/flyersoft/staticlayout/MyFloatSpan;

    move-result-object p3

    if-eqz p3, :cond_7

    .line 70
    iget-boolean p5, p3, Lcom/flyersoft/staticlayout/MyFloatSpan;->isLeft:Z

    if-eqz p5, :cond_7

    iget-object p5, p3, Lcom/flyersoft/staticlayout/MyFloatSpan;->padding:Landroid/graphics/RectF;

    iget p5, p5, Landroid/graphics/RectF;->left:F

    iget-object v0, p3, Lcom/flyersoft/staticlayout/MyFloatSpan;->margin:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->left:F

    add-float/2addr p5, v0

    iget p3, p3, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_width:F

    add-float/2addr p5, p3

    cmpg-float p3, p4, p5

    if-gez p3, :cond_7

    :goto_1
    return-void

    .line 73
    :cond_7
    iget-object p3, p0, Lcom/flyersoft/staticlayout/MyBulletSpan;->bullet:Ljava/lang/String;

    iget p5, p0, Lcom/flyersoft/staticlayout/MyBulletSpan;->baseline:I

    int-to-float p5, p5

    invoke-virtual {p1, p3, p4, p5, p2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    return-void
.end method

.method public outerHoriMargins(Ljava/util/ArrayList;Lcom/flyersoft/staticlayout/MyMarginSpan;II)F
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/staticlayout/MyMarginSpan;",
            ">;",
            "Lcom/flyersoft/staticlayout/MyMarginSpan;",
            "II)F"
        }
    .end annotation

    add-int/lit8 p3, p3, 0x1

    const/4 v0, 0x0

    .line 81
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge p3, v1, :cond_2

    .line 82
    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/staticlayout/MyMarginSpan;

    .line 83
    iget-boolean v2, v1, Lcom/flyersoft/staticlayout/MyMarginSpan;->isULSpan:Z

    if-nez v2, :cond_1

    iget v2, v1, Lcom/flyersoft/staticlayout/MyMarginSpan;->spStart:I

    iget v3, p2, Lcom/flyersoft/staticlayout/MyMarginSpan;->spStart:I

    if-gt v2, v3, :cond_1

    iget v2, v1, Lcom/flyersoft/staticlayout/MyMarginSpan;->spEnd:I

    iget v3, p2, Lcom/flyersoft/staticlayout/MyMarginSpan;->spEnd:I

    if-lt v2, v3, :cond_1

    if-nez p4, :cond_0

    .line 84
    iget v1, v1, Lcom/flyersoft/staticlayout/MyMarginSpan;->leftMargin:F

    goto :goto_1

    :cond_0
    iget v1, v1, Lcom/flyersoft/staticlayout/MyMarginSpan;->rightMargin:F

    :goto_1
    add-float/2addr v0, v1

    :cond_1
    add-int/lit8 p3, p3, 0x1

    goto :goto_0

    :cond_2
    return v0
.end method
