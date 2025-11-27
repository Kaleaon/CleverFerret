.class public Lcom/flyersoft/staticlayout/Styled;
.super Ljava/lang/Object;
.source "Styled.java"


# static fields
.field public static leftMargin:F

.field public static rightMargin:F


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static doUpdateProc(Landroid/text/TextPaint;Landroid/text/TextPaint;Landroid/text/style/CharacterStyle;ZZLcom/flyersoft/staticlayout/ReplacementSpan;)Lcom/flyersoft/staticlayout/ReplacementSpan;
    .locals 1

    .line 191
    instance-of v0, p2, Lcom/flyersoft/staticlayout/ReplacementSpan;

    if-eqz v0, :cond_0

    .line 192
    check-cast p2, Lcom/flyersoft/staticlayout/ReplacementSpan;

    return-object p2

    .line 194
    :cond_0
    instance-of v0, p2, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;

    if-eqz v0, :cond_4

    .line 195
    move-object p3, p2

    check-cast p3, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;

    if-eqz p4, :cond_2

    .line 196
    iget p4, p3, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;->fontSize:F

    const v0, 0x3a83126f    # 0.001f

    cmpl-float p4, p4, v0

    if-lez p4, :cond_1

    goto :goto_0

    :cond_1
    return-object p5

    .line 197
    :cond_2
    :goto_0
    iget-boolean p4, p3, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;->inherited:Z

    if-eqz p4, :cond_3

    .line 198
    invoke-virtual {p2, p1}, Landroid/text/style/CharacterStyle;->updateDrawState(Landroid/text/TextPaint;)V

    return-object p5

    .line 200
    :cond_3
    invoke-virtual {p0}, Landroid/text/TextPaint;->getTextSize()F

    move-result p0

    invoke-virtual {p3}, Lcom/flyersoft/staticlayout/MyRelativeSizeSpan;->getSizeChange()F

    move-result p2

    mul-float p0, p0, p2

    invoke-virtual {p1, p0}, Landroid/text/TextPaint;->setTextSize(F)V

    return-object p5

    :cond_4
    if-eqz p3, :cond_5

    .line 204
    check-cast p2, Landroid/text/style/MetricAffectingSpan;

    invoke-virtual {p2, p1}, Landroid/text/style/MetricAffectingSpan;->updateMeasureState(Landroid/text/TextPaint;)V

    return-object p5

    .line 206
    :cond_5
    invoke-virtual {p2, p1}, Landroid/text/style/CharacterStyle;->updateDrawState(Landroid/text/TextPaint;)V

    return-object p5
.end method

.method public static drawText(Lcom/flyersoft/staticlayout/MRTextView;Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIIFIIILandroid/text/TextPaint;Landroid/text/TextPaint;Z)F
    .locals 15

    if-ltz p5, :cond_0

    const/4 v0, 0x1

    const/4 v6, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, -0x1

    const/4 v6, -0x1

    :goto_0
    const/4 v7, 0x0

    move-object v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move/from16 v4, p3

    move/from16 v5, p4

    move/from16 v8, p6

    move/from16 v9, p7

    move/from16 v10, p8

    move/from16 v11, p9

    move-object/from16 v12, p10

    move-object/from16 v13, p11

    move/from16 v14, p12

    .line 447
    invoke-static/range {v1 .. v14}, Lcom/flyersoft/staticlayout/Styled;->drawText(Lcom/flyersoft/staticlayout/MRTextView;Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIIZFIIILandroid/text/TextPaint;Landroid/text/TextPaint;Z)F

    move-result p0

    return p0
.end method

.method static drawText(Lcom/flyersoft/staticlayout/MRTextView;Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIIZFIIILandroid/text/TextPaint;Landroid/text/TextPaint;Z)F
    .locals 22

    move/from16 v5, p5

    const/4 v0, -0x1

    if-ne v5, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const/4 v6, 0x0

    if-eqz v0, :cond_1

    const/16 v18, 0x0

    const/16 v21, 0x1

    const/4 v8, 0x0

    const/4 v12, 0x1

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    move-object/from16 v7, p0

    move-object/from16 v9, p2

    move/from16 v10, p3

    move/from16 v11, p4

    move-object/from16 v19, p11

    move-object/from16 v20, p12

    .line 390
    invoke-static/range {v7 .. v21}, Lcom/flyersoft/staticlayout/Styled;->foreach(Lcom/flyersoft/staticlayout/MRTextView;Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIIZFIIILandroid/graphics/Paint$FontMetricsInt;Landroid/text/TextPaint;Landroid/text/TextPaint;Z)F

    move-result v0

    int-to-float v1, v5

    mul-float v0, v0, v1

    const/4 v7, 0x0

    neg-int v6, v5

    add-float v8, p7, v0

    const/4 v12, 0x0

    const/4 v15, 0x1

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move/from16 v4, p3

    move/from16 v5, p4

    move/from16 v9, p8

    move/from16 v10, p9

    move/from16 v11, p10

    move-object/from16 v13, p11

    move-object/from16 v14, p12

    .line 393
    invoke-static/range {v1 .. v15}, Lcom/flyersoft/staticlayout/Styled;->foreach(Lcom/flyersoft/staticlayout/MRTextView;Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIIZFIIILandroid/graphics/Paint$FontMetricsInt;Landroid/text/TextPaint;Landroid/text/TextPaint;Z)F

    return v0

    :cond_1
    const/4 v7, 0x0

    const/4 v11, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move/from16 v7, p7

    move/from16 v8, p8

    move/from16 v9, p9

    move/from16 v10, p10

    move-object/from16 v12, p11

    move-object/from16 v13, p12

    move/from16 v14, p13

    const/4 v6, 0x0

    .line 400
    invoke-static/range {v0 .. v14}, Lcom/flyersoft/staticlayout/Styled;->foreach(Lcom/flyersoft/staticlayout/MRTextView;Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIIZFIIILandroid/graphics/Paint$FontMetricsInt;Landroid/text/TextPaint;Landroid/text/TextPaint;Z)F

    move-result v0

    return v0
.end method

.method private static each(Lcom/flyersoft/staticlayout/MRTextView;Landroid/graphics/Canvas;Landroid/text/Spanned;IIIZFIIILandroid/graphics/Paint$FontMetricsInt;Landroid/text/TextPaint;Landroid/text/TextPaint;Z)F
    .locals 18

    move/from16 v4, p3

    move/from16 v5, p4

    move/from16 v11, p5

    move/from16 v7, p8

    move/from16 v9, p10

    move-object/from16 v0, p11

    move-object/from16 v13, p12

    move-object/from16 v10, p13

    const/4 v1, 0x0

    .line 52
    iput v1, v13, Landroid/text/TextPaint;->bgColor:I

    .line 53
    iput v1, v13, Landroid/text/TextPaint;->baselineShift:I

    .line 55
    invoke-virtual {v10, v13}, Landroid/text/TextPaint;->set(Landroid/text/TextPaint;)V

    .line 56
    const-class v2, Landroid/text/style/CharacterStyle;

    move-object/from16 v3, p2

    invoke-interface {v3, v4, v5, v2}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v2

    move-object v15, v2

    check-cast v15, [Landroid/text/style/CharacterStyle;

    const/16 v16, 0x0

    const/16 v17, 0x0

    move-object v12, v3

    move-object v14, v10

    .line 58
    invoke-static/range {v12 .. v17}, Lcom/flyersoft/staticlayout/Styled;->getReplacementAndUpdateState(Landroid/text/Spanned;Landroid/text/TextPaint;Landroid/text/TextPaint;[Landroid/text/style/CharacterStyle;ZZ)Lcom/flyersoft/staticlayout/ReplacementSpan;

    move-result-object v2

    const/4 v12, -0x1

    if-nez v2, :cond_8

    if-eqz p6, :cond_0

    .line 65
    invoke-static/range {p2 .. p4}, Lcom/flyersoft/staticlayout/TextUtils;->getReverse(Ljava/lang/CharSequence;II)Ljava/lang/CharSequence;

    move-result-object v2

    sub-int v3, v5, v4

    move-object v6, v2

    move v13, v3

    const/4 v8, 0x0

    goto :goto_0

    :cond_0
    move-object/from16 v6, p2

    move v8, v4

    move v13, v5

    :goto_0
    if-eqz v0, :cond_1

    .line 75
    invoke-virtual {v10, v0}, Landroid/text/TextPaint;->getFontMetricsInt(Landroid/graphics/Paint$FontMetricsInt;)I

    :cond_1
    const/4 v0, 0x0

    if-eqz p1, :cond_7

    .line 79
    iget v2, v10, Landroid/text/TextPaint;->bgColor:I

    if-eqz v2, :cond_3

    .line 80
    invoke-virtual {v10}, Landroid/text/TextPaint;->getColor()I

    move-result v14

    .line 81
    invoke-virtual {v10}, Landroid/text/TextPaint;->getStyle()Landroid/graphics/Paint$Style;

    move-result-object v15

    .line 82
    iget v0, v10, Landroid/text/TextPaint;->bgColor:I

    invoke-virtual {v10, v0}, Landroid/text/TextPaint;->setColor(I)V

    .line 83
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v10, v0}, Landroid/text/TextPaint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 86
    invoke-static {v10, v6, v8, v13}, Lcom/flyersoft/staticlayout/Styled;->getMeasureWidth(Landroid/text/TextPaint;Ljava/lang/CharSequence;II)F

    move-result v16

    if-ne v11, v12, :cond_2

    sub-float v1, p7, v16

    int-to-float v2, v7

    int-to-float v4, v9

    move-object/from16 v0, p1

    move/from16 v3, p7

    move-object v5, v10

    .line 91
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move-object/from16 v10, p13

    goto :goto_1

    :cond_2
    int-to-float v2, v7

    add-float v3, p7, v16

    int-to-float v4, v9

    move-object/from16 v0, p1

    move/from16 v1, p7

    move-object/from16 v5, p13

    .line 93
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move-object v10, v5

    .line 95
    :goto_1
    invoke-virtual {v10, v15}, Landroid/text/TextPaint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 96
    invoke-virtual {v10, v14}, Landroid/text/TextPaint;->setColor(I)V

    const/4 v1, 0x1

    move/from16 v0, v16

    :cond_3
    if-ne v11, v12, :cond_5

    if-nez v1, :cond_4

    .line 101
    invoke-static {v10, v6, v8, v13}, Lcom/flyersoft/staticlayout/Styled;->getMeasureWidth(Landroid/text/TextPaint;Ljava/lang/CharSequence;II)F

    move-result v0

    :cond_4
    move v9, v0

    sub-float v5, p7, v9

    .line 104
    iget v0, v10, Landroid/text/TextPaint;->baselineShift:I

    add-int v0, p9, v0

    int-to-float v0, v0

    move-object/from16 v1, p1

    move-object v2, v6

    move v3, v8

    move-object v7, v10

    move v4, v13

    move v6, v0

    move-object/from16 v0, p0

    invoke-virtual/range {v0 .. v7}, Lcom/flyersoft/staticlayout/MRTextView;->mrDrawText(Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIFFLandroid/text/TextPaint;)V

    move v0, v9

    goto/16 :goto_3

    :cond_5
    move-object v2, v6

    move v3, v8

    move v4, v13

    if-eqz p14, :cond_6

    if-nez v1, :cond_6

    .line 109
    invoke-static {v10, v2, v3, v4}, Lcom/flyersoft/staticlayout/Styled;->getMeasureWidth(Landroid/text/TextPaint;Ljava/lang/CharSequence;II)F

    move-result v0

    :cond_6
    move v8, v0

    .line 113
    iget v0, v10, Landroid/text/TextPaint;->baselineShift:I

    add-int v0, p9, v0

    int-to-float v6, v0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v5, p7

    move-object v7, v10

    invoke-virtual/range {v0 .. v7}, Lcom/flyersoft/staticlayout/MRTextView;->mrDrawText(Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIFFLandroid/text/TextPaint;)V

    move v0, v8

    goto :goto_3

    :cond_7
    move-object v2, v6

    move v3, v8

    move v4, v13

    if-eqz p14, :cond_b

    .line 118
    invoke-static {v10, v2, v3, v4}, Lcom/flyersoft/staticlayout/Styled;->getMeasureWidth(Landroid/text/TextPaint;Ljava/lang/CharSequence;II)F

    move-result v0

    goto :goto_3

    :cond_8
    move v3, v4

    move v4, v5

    move-object v1, v10

    move-object v5, v0

    move-object v0, v2

    move-object/from16 v2, p2

    .line 122
    invoke-virtual/range {v0 .. v5}, Lcom/flyersoft/staticlayout/ReplacementSpan;->getSize(Landroid/graphics/Paint;Ljava/lang/CharSequence;IILandroid/graphics/Paint$FontMetricsInt;)I

    move-result v5

    int-to-float v13, v5

    if-eqz p1, :cond_a

    if-ne v11, v12, :cond_9

    sub-float v6, p7, v13

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move/from16 v4, p3

    move/from16 v5, p4

    move/from16 v8, p9

    move-object/from16 v10, p13

    .line 126
    invoke-virtual/range {v0 .. v10}, Lcom/flyersoft/staticlayout/ReplacementSpan;->draw(Lcom/flyersoft/staticlayout/MRTextView;Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIFIIILandroid/graphics/Paint;)V

    goto :goto_2

    :cond_9
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move/from16 v4, p3

    move/from16 v5, p4

    move/from16 v6, p7

    move/from16 v8, p9

    move-object/from16 v10, p13

    .line 129
    invoke-virtual/range {v0 .. v10}, Lcom/flyersoft/staticlayout/ReplacementSpan;->draw(Lcom/flyersoft/staticlayout/MRTextView;Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIFIIILandroid/graphics/Paint;)V

    :cond_a
    :goto_2
    move v0, v13

    :cond_b
    :goto_3
    if-ne v11, v12, :cond_c

    neg-float v0, v0

    :cond_c
    return v0
.end method

.method private static foreach(Lcom/flyersoft/staticlayout/MRTextView;Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIIZFIIILandroid/graphics/Paint$FontMetricsInt;Landroid/text/TextPaint;Landroid/text/TextPaint;Z)F
    .locals 20

    move-object/from16 v2, p2

    move/from16 v4, p4

    move/from16 v9, p9

    move-object/from16 v11, p11

    if-nez p12, :cond_0

    .line 299
    sget-object v0, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    move-object v7, v0

    goto :goto_0

    :cond_0
    move-object/from16 v7, p12

    .line 301
    :goto_0
    instance-of v0, v2, Landroid/text/Spanned;

    const/4 v15, 0x0

    if-nez v0, :cond_8

    const/4 v0, 0x0

    if-eqz p6, :cond_4

    move/from16 v1, p3

    .line 305
    invoke-static/range {p2 .. p4}, Lcom/flyersoft/staticlayout/TextUtils;->getReverse(Ljava/lang/CharSequence;II)Ljava/lang/CharSequence;

    move-result-object v3

    sub-int v5, v4, v1

    if-nez p1, :cond_1

    if-eqz p14, :cond_2

    .line 309
    :cond_1
    invoke-virtual {v7, v3, v15, v5}, Landroid/text/TextPaint;->measureText(Ljava/lang/CharSequence;II)F

    move-result v0

    :cond_2
    if-eqz p1, :cond_3

    sub-float v6, p7, v0

    move-object v8, v7

    int-to-float v7, v9

    const/4 v4, 0x0

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    .line 312
    invoke-virtual/range {v1 .. v8}, Lcom/flyersoft/staticlayout/MRTextView;->mrDrawText(Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIFFLandroid/text/TextPaint;)V

    goto :goto_2

    :cond_3
    move-object v8, v7

    goto :goto_2

    :cond_4
    move/from16 v1, p3

    move-object v8, v7

    if-eqz p14, :cond_5

    .line 315
    invoke-static {v8, v2, v1, v4}, Lcom/flyersoft/staticlayout/Styled;->getMeasureWidth(Landroid/text/TextPaint;Ljava/lang/CharSequence;II)F

    move-result v0

    move v10, v0

    goto :goto_1

    :cond_5
    const/4 v10, 0x0

    :goto_1
    if-eqz p1, :cond_6

    int-to-float v6, v9

    move-object/from16 v0, p0

    move/from16 v5, p7

    move v3, v1

    move-object v7, v8

    move-object/from16 v1, p1

    .line 318
    invoke-virtual/range {v0 .. v7}, Lcom/flyersoft/staticlayout/MRTextView;->mrDrawText(Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIFFLandroid/text/TextPaint;)V

    :cond_6
    move v0, v10

    :goto_2
    if-eqz v11, :cond_7

    .line 322
    invoke-virtual {v8, v11}, Landroid/text/TextPaint;->getFontMetricsInt(Landroid/graphics/Paint$FontMetricsInt;)I

    :cond_7
    move/from16 v5, p5

    int-to-float v1, v5

    mul-float v0, v0, v1

    return v0

    :cond_8
    move/from16 v5, p5

    move v0, v4

    move-object v8, v7

    .line 332
    move-object/from16 v2, p2

    check-cast v2, Landroid/text/Spanned;

    if-nez p1, :cond_9

    .line 336
    const-class v1, Landroid/text/style/MetricAffectingSpan;

    goto :goto_3

    .line 338
    :cond_9
    const-class v1, Landroid/text/style/CharacterStyle;

    :goto_3
    move/from16 v3, p3

    move/from16 v7, p7

    const/4 v4, 0x0

    const/4 v6, 0x0

    const/4 v10, 0x0

    const/4 v12, 0x0

    :goto_4
    if-ge v3, v0, :cond_11

    move v13, v4

    .line 342
    invoke-interface {v2, v3, v0, v1}, Landroid/text/Spanned;->nextSpanTransition(IILjava/lang/Class;)I

    move-result v4

    if-nez p14, :cond_b

    if-eq v4, v0, :cond_a

    goto :goto_5

    :cond_a
    const/4 v14, 0x0

    goto :goto_6

    :cond_b
    :goto_5
    const/4 v14, 0x1

    :goto_6
    move-object/from16 v0, p0

    move-object/from16 v19, v1

    move/from16 v16, v6

    move/from16 v17, v10

    move/from16 v18, v12

    move v15, v13

    move-object/from16 v1, p1

    move/from16 v6, p6

    move/from16 v10, p10

    move-object/from16 v13, p13

    move-object v12, v8

    move/from16 v8, p8

    .line 344
    invoke-static/range {v0 .. v14}, Lcom/flyersoft/staticlayout/Styled;->each(Lcom/flyersoft/staticlayout/MRTextView;Landroid/graphics/Canvas;Landroid/text/Spanned;IIIZFIIILandroid/graphics/Paint$FontMetricsInt;Landroid/text/TextPaint;Landroid/text/TextPaint;Z)F

    move-result v3

    move-object v8, v12

    add-float/2addr v7, v3

    if-eqz v11, :cond_f

    .line 349
    iget v0, v11, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    if-ge v0, v15, :cond_c

    .line 350
    iget v0, v11, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    move v15, v0

    .line 351
    :cond_c
    iget v0, v11, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    move/from16 v1, v16

    if-le v0, v1, :cond_d

    .line 352
    iget v6, v11, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    goto :goto_7

    :cond_d
    move v6, v1

    .line 354
    :goto_7
    iget v0, v11, Landroid/graphics/Paint$FontMetricsInt;->top:I

    move/from16 v3, v17

    if-ge v0, v3, :cond_e

    .line 355
    iget v10, v11, Landroid/graphics/Paint$FontMetricsInt;->top:I

    goto :goto_8

    :cond_e
    move v10, v3

    .line 356
    :goto_8
    iget v0, v11, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    move/from16 v5, v18

    if-le v0, v5, :cond_10

    .line 357
    iget v12, v11, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    goto :goto_9

    :cond_f
    move/from16 v1, v16

    move/from16 v3, v17

    move/from16 v5, v18

    move v6, v1

    move v10, v3

    :cond_10
    move v12, v5

    :goto_9
    move/from16 v0, p4

    move/from16 v5, p5

    move/from16 v9, p9

    move v3, v4

    move v4, v15

    move-object/from16 v1, v19

    const/4 v15, 0x0

    goto :goto_4

    :cond_11
    move v15, v4

    move v1, v6

    move v3, v10

    move v5, v12

    if-eqz v11, :cond_13

    move/from16 v0, p3

    move/from16 v4, p4

    if-ne v0, v4, :cond_12

    .line 363
    invoke-virtual {v8, v11}, Landroid/text/TextPaint;->getFontMetricsInt(Landroid/graphics/Paint$FontMetricsInt;)I

    goto :goto_a

    .line 365
    :cond_12
    iput v15, v11, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    .line 366
    iput v1, v11, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    .line 367
    iput v3, v11, Landroid/graphics/Paint$FontMetricsInt;->top:I

    .line 368
    iput v5, v11, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    :cond_13
    :goto_a
    sub-float v7, v7, p7

    return v7
.end method

.method private static getMeasureWidth(Landroid/text/TextPaint;Ljava/lang/CharSequence;II)F
    .locals 1

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    if-ne p2, p3, :cond_1

    return v0

    .line 246
    :cond_1
    invoke-virtual {p0, p1, p2, p3}, Landroid/text/TextPaint;->measureText(Ljava/lang/CharSequence;II)F

    move-result p0

    return p0
.end method

.method public static getReplacementAndUpdateState(Landroid/text/Spanned;Landroid/text/TextPaint;Landroid/text/TextPaint;[Landroid/text/style/CharacterStyle;ZZ)Lcom/flyersoft/staticlayout/ReplacementSpan;
    .locals 13

    move-object/from16 v0, p3

    .line 144
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x17

    const/4 v3, 0x0

    if-eq v1, v2, :cond_1

    .line 145
    invoke-static {v0}, Lcom/flyersoft/staticlayout/Styled;->putTypefaceAtFirst([Landroid/text/style/CharacterStyle;)[Landroid/text/style/CharacterStyle;

    move-result-object p0

    .line 146
    array-length v0, p0

    add-int/lit8 v0, v0, -0x1

    move-object v6, v3

    :goto_0
    if-ltz v0, :cond_0

    .line 147
    aget-object v3, p0, v0

    move-object v1, p1

    move-object v2, p2

    move/from16 v4, p4

    move/from16 v5, p5

    invoke-static/range {v1 .. v6}, Lcom/flyersoft/staticlayout/Styled;->doUpdateProc(Landroid/text/TextPaint;Landroid/text/TextPaint;Landroid/text/style/CharacterStyle;ZZLcom/flyersoft/staticlayout/ReplacementSpan;)Lcom/flyersoft/staticlayout/ReplacementSpan;

    move-result-object v6

    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_0
    return-object v6

    .line 149
    :cond_1
    invoke-static {p0, v0}, Lcom/flyersoft/staticlayout/Styled;->sortSpansForAndroid6(Landroid/text/Spanned;[Landroid/text/style/CharacterStyle;)V

    const/4 p0, 0x0

    move-object v12, v3

    .line 150
    :goto_1
    array-length v1, v0

    if-ge p0, v1, :cond_2

    .line 151
    aget-object v9, v0, p0

    move-object v7, p1

    move-object v8, p2

    move/from16 v10, p4

    move/from16 v11, p5

    invoke-static/range {v7 .. v12}, Lcom/flyersoft/staticlayout/Styled;->doUpdateProc(Landroid/text/TextPaint;Landroid/text/TextPaint;Landroid/text/style/CharacterStyle;ZZLcom/flyersoft/staticlayout/ReplacementSpan;)Lcom/flyersoft/staticlayout/ReplacementSpan;

    move-result-object v12

    add-int/lit8 p0, p0, 0x1

    goto :goto_1

    :cond_2
    return-object v12
.end method

.method public static getTextWidths(Landroid/text/TextPaint;Landroid/text/TextPaint;Landroid/text/Spanned;II[FLandroid/graphics/Paint$FontMetricsInt;)I
    .locals 6

    .line 269
    invoke-virtual {p1, p0}, Landroid/text/TextPaint;->set(Landroid/text/TextPaint;)V

    .line 270
    const-class v2, Landroid/text/style/MetricAffectingSpan;

    invoke-interface {p2, p3, p4, v2}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Landroid/text/style/MetricAffectingSpan;

    const/4 v4, 0x1

    const/4 v5, 0x0

    move-object v1, p0

    move-object v0, p2

    move-object v3, v2

    move-object v2, p1

    .line 271
    invoke-static/range {v0 .. v5}, Lcom/flyersoft/staticlayout/Styled;->getReplacementAndUpdateState(Landroid/text/Spanned;Landroid/text/TextPaint;Landroid/text/TextPaint;[Landroid/text/style/CharacterStyle;ZZ)Lcom/flyersoft/staticlayout/ReplacementSpan;

    move-result-object v1

    if-nez v1, :cond_0

    .line 274
    invoke-virtual {p1, p6}, Landroid/text/TextPaint;->getFontMetricsInt(Landroid/graphics/Paint$FontMetricsInt;)I

    .line 275
    invoke-virtual/range {p1 .. p5}, Landroid/text/TextPaint;->getTextWidths(Ljava/lang/CharSequence;II[F)I

    goto :goto_1

    :cond_0
    move-object v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p6

    move-object v0, v1

    move-object v1, p1

    .line 277
    invoke-virtual/range {v0 .. v5}, Lcom/flyersoft/staticlayout/ReplacementSpan;->getSize(Landroid/graphics/Paint;Ljava/lang/CharSequence;IILandroid/graphics/Paint$FontMetricsInt;)I

    move-result v0

    if-le p4, p3, :cond_1

    const/4 v1, 0x0

    int-to-float v0, v0

    .line 280
    aput v0, p5, v1

    add-int/lit8 v0, p3, 0x1

    :goto_0
    if-ge v0, p4, :cond_1

    sub-int v1, v0, p3

    const/4 v2, 0x0

    .line 283
    aput v2, p5, v1

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    sub-int v0, p4, p3

    return v0
.end method

.method public static measureText(Lcom/flyersoft/staticlayout/MRTextView;Landroid/text/TextPaint;Landroid/text/TextPaint;Ljava/lang/CharSequence;IILandroid/graphics/Paint$FontMetricsInt;)F
    .locals 15

    const/4 v10, 0x0

    const/4 v14, 0x1

    const/4 v1, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v0, p0

    move-object/from16 v12, p1

    move-object/from16 v13, p2

    move-object/from16 v2, p3

    move/from16 v3, p4

    move/from16 v4, p5

    move-object/from16 v11, p6

    .line 469
    invoke-static/range {v0 .. v14}, Lcom/flyersoft/staticlayout/Styled;->foreach(Lcom/flyersoft/staticlayout/MRTextView;Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIIZFIIILandroid/graphics/Paint$FontMetricsInt;Landroid/text/TextPaint;Landroid/text/TextPaint;Z)F

    move-result p0

    return p0
.end method

.method private static putTypefaceAtFirst([Landroid/text/style/CharacterStyle;)[Landroid/text/style/CharacterStyle;
    .locals 6

    .line 169
    array-length v0, p0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v0, :cond_2

    aget-object v4, p0, v3

    .line 170
    instance-of v5, v4, Lcom/flyersoft/staticlayout/MyTypefaceSpan;

    if-eqz v5, :cond_1

    if-nez v1, :cond_0

    .line 172
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 173
    :cond_0
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 175
    :cond_2
    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    if-nez v0, :cond_6

    .line 176
    array-length v0, p0

    new-array v0, v0, [Landroid/text/style/CharacterStyle;

    .line 178
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v3, 0x0

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/text/style/CharacterStyle;

    add-int/lit8 v5, v3, 0x1

    .line 179
    aput-object v4, v0, v3

    move v3, v5

    goto :goto_1

    .line 180
    :cond_3
    array-length v1, p0

    :goto_2
    if-ge v2, v1, :cond_5

    aget-object v4, p0, v2

    .line 181
    instance-of v5, v4, Lcom/flyersoft/staticlayout/MyTypefaceSpan;

    if-nez v5, :cond_4

    add-int/lit8 v5, v3, 0x1

    .line 182
    aput-object v4, v0, v3

    move v3, v5

    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_5
    return-object v0

    :cond_6
    return-object p0
.end method

.method public static sortSpansForAndroid6(Landroid/text/Spanned;[Landroid/text/style/CharacterStyle;)V
    .locals 5

    .line 220
    array-length v0, p1

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-lez v0, :cond_3

    const/4 v1, 0x0

    :goto_1
    if-ge v1, v0, :cond_2

    .line 222
    aget-object v2, p1, v0

    invoke-interface {p0, v2}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    move-result v2

    aget-object v3, p1, v1

    invoke-interface {p0, v3}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    move-result v3

    if-ne v2, v3, :cond_1

    move v2, v1

    .line 225
    :cond_0
    aget-object v3, p1, v0

    .line 226
    aget-object v4, p1, v2

    aput-object v4, p1, v0

    .line 227
    aput-object v3, p1, v2

    add-int/lit8 v0, v0, -0x1

    add-int/lit8 v2, v2, 0x1

    if-lt v2, v0, :cond_0

    move v0, v1

    goto :goto_2

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_2
    :goto_2
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_3
    return-void
.end method
