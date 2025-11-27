.class public Lcom/flyersoft/staticlayout/MyFloatSpan;
.super Lcom/flyersoft/staticlayout/MyMarginSpan;
.source "MyFloatSpan.java"


# instance fields
.field public float_height:F

.field public float_sl:Landroid/text/StaticLayout;

.field public float_sl_v:F

.field public float_text:Ljava/lang/CharSequence;

.field public float_tv_h:F

.field public float_tv_w:F

.field public float_v:F

.field public float_width:F

.field public imageSpan:Lcom/flyersoft/staticlayout/MyImageSpan;

.field public isDropcap:Z

.field public isLeft:Z

.field private mDrawableRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation
.end field

.field public margin:Landroid/graphics/RectF;

.field public padding:Landroid/graphics/RectF;

.field public workPaint:Landroid/text/TextPaint;


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 50
    invoke-direct {p0, v0, v0, v0, v0}, Lcom/flyersoft/staticlayout/MyMarginSpan;-><init>(FFFF)V

    .line 46
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/staticlayout/MyFloatSpan;->padding:Landroid/graphics/RectF;

    .line 47
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/staticlayout/MyFloatSpan;->margin:Landroid/graphics/RectF;

    return-void
.end method

.method private drawBorderAndBackground(Landroid/graphics/Canvas;Lcom/flyersoft/staticlayout/MRTextView;F)V
    .locals 17

    move-object/from16 v0, p0

    .line 160
    iget-boolean v1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->isLeft:Z

    const/high16 v2, 0x3f800000    # 1.0f

    if-eqz v1, :cond_0

    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->margin:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    goto :goto_0

    :cond_0
    invoke-virtual/range {p2 .. p2}, Lcom/flyersoft/staticlayout/MRTextView;->getWidth()I

    move-result v1

    int-to-float v1, v1

    iget v3, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_width:F

    sub-float/2addr v1, v3

    iget-object v3, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->margin:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->left:F

    add-float/2addr v1, v3

    invoke-static {v2}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v3

    add-float/2addr v1, v3

    :goto_0
    move v3, v1

    .line 161
    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->margin:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->top:F

    add-float v4, p3, v1

    .line 162
    iget-boolean v1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->isLeft:Z

    if-eqz v1, :cond_1

    iget v1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_width:F

    iget-object v5, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->margin:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->right:F

    sub-float/2addr v1, v5

    invoke-static {v2}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v2

    goto :goto_1

    :cond_1
    invoke-virtual/range {p2 .. p2}, Lcom/flyersoft/staticlayout/MRTextView;->getWidth()I

    move-result v1

    int-to-float v1, v1

    iget-object v2, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->margin:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->right:F

    :goto_1
    sub-float/2addr v1, v2

    move v5, v1

    .line 163
    iget v1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_height:F

    add-float v1, p3, v1

    iget-object v2, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->margin:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    sub-float v6, v1, v2

    .line 165
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MyFloatSpan;->getBackgroundColor()I

    move-result v2

    .line 166
    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    invoke-static {v1}, Lcom/flyersoft/components/CSS;->hasBorder(Lcom/flyersoft/components/CSS$Style;)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 167
    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v10, v1, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    .line 168
    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    iget-object v7, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v7, v7, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    const/4 v9, 0x0

    invoke-static {v1, v7, v9}, Lcom/flyersoft/components/CSS;->getBorder([Ljava/lang/String;Landroid/graphics/RectF;I)F

    move-result v1

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v7

    mul-float v1, v1, v7

    const/high16 v11, 0x40000000    # 2.0f

    div-float/2addr v1, v11

    add-float/2addr v3, v1

    .line 169
    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    iget-object v7, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v7, v7, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    const/4 v12, 0x2

    invoke-static {v1, v7, v12}, Lcom/flyersoft/components/CSS;->getBorder([Ljava/lang/String;Landroid/graphics/RectF;I)F

    move-result v1

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v7

    mul-float v1, v1, v7

    div-float/2addr v1, v11

    sub-float/2addr v5, v1

    .line 171
    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    iget-object v7, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v7, v7, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    invoke-virtual {v0, v10, v1, v7}, Lcom/flyersoft/staticlayout/MyFloatSpan;->sameBorders(Landroid/graphics/RectF;[Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v1

    const/4 v13, 0x0

    if-eqz v1, :cond_5

    .line 172
    iget v1, v10, Landroid/graphics/RectF;->left:F

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v7

    mul-float v10, v1, v7

    .line 173
    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    aget-object v11, v1, v9

    .line 174
    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    if-nez v1, :cond_2

    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->color:Ljava/lang/String;

    goto :goto_2

    :cond_2
    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    aget-object v1, v1, v9

    :goto_2
    invoke-virtual {v0, v1, v11}, Lcom/flyersoft/staticlayout/MyFloatSpan;->getBorderColor(Ljava/lang/String;Ljava/lang/String;)I

    move-result v9

    .line 175
    new-instance v8, Landroid/graphics/Paint;

    invoke-direct {v8}, Landroid/graphics/Paint;-><init>()V

    .line 177
    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->borderRadius:Ljava/lang/Float;

    if-eqz v1, :cond_4

    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->borderRadius:Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    cmpl-float v1, v1, v13

    if-nez v1, :cond_3

    goto :goto_3

    .line 183
    :cond_3
    invoke-static {v10}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v7

    move-object/from16 v1, p1

    .line 184
    invoke-virtual/range {v0 .. v8}, Lcom/flyersoft/staticlayout/MyFloatSpan;->drawBackgroundColor(Landroid/graphics/Canvas;IFFFFFLandroid/graphics/Paint;)V

    .line 185
    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setColor(I)V

    .line 186
    invoke-virtual {v0, v8, v11, v10}, Lcom/flyersoft/staticlayout/MyFloatSpan;->updatePaintStyles(Landroid/graphics/Paint;Ljava/lang/String;F)Z

    .line 187
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1, v3, v4, v5, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    move-object/from16 v2, p1

    invoke-virtual {v2, v1, v7, v7, v8}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    return-void

    :cond_4
    :goto_3
    const/high16 v7, -0x40800000    # -1.0f

    move-object/from16 v1, p1

    .line 178
    invoke-virtual/range {v0 .. v8}, Lcom/flyersoft/staticlayout/MyFloatSpan;->drawBackgroundColor(Landroid/graphics/Canvas;IFFFFFLandroid/graphics/Paint;)V

    .line 179
    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setColor(I)V

    .line 180
    invoke-virtual {v0, v8, v11, v10}, Lcom/flyersoft/staticlayout/MyFloatSpan;->updatePaintStyles(Landroid/graphics/Paint;Ljava/lang/String;F)Z

    move v7, v5

    move-object v9, v8

    move v5, v3

    move v8, v6

    move v6, v4

    move-object/from16 v4, p1

    .line 181
    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    return-void

    .line 190
    :cond_5
    new-instance v8, Landroid/graphics/Paint;

    invoke-direct {v8}, Landroid/graphics/Paint;-><init>()V

    const/high16 v7, -0x40800000    # -1.0f

    move-object/from16 v1, p1

    invoke-virtual/range {v0 .. v8}, Lcom/flyersoft/staticlayout/MyFloatSpan;->drawBackgroundColor(Landroid/graphics/Canvas;IFFFFFLandroid/graphics/Paint;)V

    move v14, v5

    .line 191
    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    iget-object v2, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v2, v2, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    const/4 v15, 0x1

    invoke-static {v1, v2, v15}, Lcom/flyersoft/components/CSS;->getBorder([Ljava/lang/String;Landroid/graphics/RectF;I)F

    move-result v1

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v2

    mul-float v1, v1, v2

    div-float/2addr v1, v11

    sub-float/2addr v4, v1

    .line 192
    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    iget-object v2, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v2, v2, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    const/4 v5, 0x3

    invoke-static {v1, v2, v5}, Lcom/flyersoft/components/CSS;->getBorder([Ljava/lang/String;Landroid/graphics/RectF;I)F

    move-result v1

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v2

    mul-float v1, v1, v2

    div-float/2addr v1, v11

    add-float/2addr v6, v1

    .line 193
    iget v1, v10, Landroid/graphics/RectF;->left:F

    cmpl-float v1, v1, v13

    if-lez v1, :cond_7

    iget v7, v10, Landroid/graphics/RectF;->left:F

    .line 194
    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    if-nez v1, :cond_6

    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->color:Ljava/lang/String;

    goto :goto_4

    :cond_6
    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    aget-object v1, v1, v9

    :goto_4
    move-object v8, v1

    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    aget-object v9, v1, v9

    const/4 v1, 0x0

    const/4 v2, 0x3

    move v5, v3

    move-object/from16 v2, p1

    const/4 v11, 0x3

    .line 193
    invoke-virtual/range {v0 .. v9}, Lcom/flyersoft/staticlayout/MyFloatSpan;->drawLine(ILandroid/graphics/Canvas;FFFFFLjava/lang/String;Ljava/lang/String;)V

    goto :goto_5

    :cond_7
    const/4 v11, 0x3

    :goto_5
    move/from16 v16, v6

    .line 195
    iget v1, v10, Landroid/graphics/RectF;->top:F

    cmpl-float v1, v1, v13

    if-lez v1, :cond_9

    iget v7, v10, Landroid/graphics/RectF;->top:F

    .line 196
    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    if-nez v1, :cond_8

    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->color:Ljava/lang/String;

    goto :goto_6

    :cond_8
    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    aget-object v1, v1, v15

    :goto_6
    move-object v8, v1

    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    aget-object v9, v1, v15

    const/4 v1, 0x1

    move v6, v4

    move-object/from16 v2, p1

    move v5, v14

    .line 195
    invoke-virtual/range {v0 .. v9}, Lcom/flyersoft/staticlayout/MyFloatSpan;->drawLine(ILandroid/graphics/Canvas;FFFFFLjava/lang/String;Ljava/lang/String;)V

    goto :goto_7

    :cond_9
    move v5, v14

    :goto_7
    move v14, v3

    .line 197
    iget v1, v10, Landroid/graphics/RectF;->right:F

    cmpl-float v1, v1, v13

    if-lez v1, :cond_b

    iget v7, v10, Landroid/graphics/RectF;->right:F

    .line 198
    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    if-nez v1, :cond_a

    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->color:Ljava/lang/String;

    goto :goto_8

    :cond_a
    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    aget-object v1, v1, v12

    :goto_8
    move-object v8, v1

    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    aget-object v9, v1, v12

    const/4 v1, 0x2

    move v3, v5

    move-object/from16 v2, p1

    move/from16 v6, v16

    .line 197
    invoke-virtual/range {v0 .. v9}, Lcom/flyersoft/staticlayout/MyFloatSpan;->drawLine(ILandroid/graphics/Canvas;FFFFFLjava/lang/String;Ljava/lang/String;)V

    goto :goto_9

    :cond_b
    move/from16 v6, v16

    .line 199
    :goto_9
    iget v1, v10, Landroid/graphics/RectF;->bottom:F

    cmpl-float v1, v1, v13

    if-lez v1, :cond_d

    iget v7, v10, Landroid/graphics/RectF;->bottom:F

    .line 200
    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    if-nez v1, :cond_c

    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->color:Ljava/lang/String;

    goto :goto_a

    :cond_c
    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    aget-object v1, v1, v11

    :goto_a
    move-object v8, v1

    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    aget-object v9, v1, v11

    const/4 v1, 0x3

    move/from16 v16, v6

    move-object/from16 v2, p1

    move v3, v14

    move/from16 v4, v16

    .line 199
    invoke-virtual/range {v0 .. v9}, Lcom/flyersoft/staticlayout/MyFloatSpan;->drawLine(ILandroid/graphics/Canvas;FFFFFLjava/lang/String;Ljava/lang/String;)V

    :cond_d
    return-void

    .line 203
    :cond_e
    new-instance v8, Landroid/graphics/Paint;

    invoke-direct {v8}, Landroid/graphics/Paint;-><init>()V

    const/high16 v7, -0x40800000    # -1.0f

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual/range {v0 .. v8}, Lcom/flyersoft/staticlayout/MyFloatSpan;->drawBackgroundColor(Landroid/graphics/Canvas;IFFFFFLandroid/graphics/Paint;)V

    return-void
.end method

.method private getCachedDrawable()Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 222
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyFloatSpan;->imageSpan:Lcom/flyersoft/staticlayout/MyImageSpan;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 224
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyFloatSpan;->mDrawableRef:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_1

    .line 227
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Landroid/graphics/drawable/Drawable;

    :cond_1
    if-nez v1, :cond_2

    .line 229
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyFloatSpan;->imageSpan:Lcom/flyersoft/staticlayout/MyImageSpan;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MyImageSpan;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 239
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/flyersoft/staticlayout/MyFloatSpan;->mDrawableRef:Ljava/lang/ref/WeakReference;

    return-object v0

    :cond_2
    return-object v1
.end method


# virtual methods
.method public drawFrameMargin(Landroid/graphics/Canvas;Landroid/text/TextPaint;Lcom/flyersoft/staticlayout/MRTextView;Ljava/util/ArrayList;I)V
    .locals 17
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

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    .line 55
    invoke-virtual {v2}, Lcom/flyersoft/staticlayout/MRTextView;->lastIgnoreLine()I

    move-result v3

    if-lez v3, :cond_0

    iget v3, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->startLine:I

    invoke-virtual {v2}, Lcom/flyersoft/staticlayout/MRTextView;->lastIgnoreLine()I

    move-result v4

    if-lt v3, v4, :cond_0

    goto/16 :goto_0

    .line 57
    :cond_0
    iget v3, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->startLine:I

    iget v4, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->endLine:I

    if-ne v3, v4, :cond_1

    .line 58
    iget v3, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->startLine:I

    invoke-virtual {v2, v3}, Lcom/flyersoft/staticlayout/MRTextView;->isLastHalfLine(I)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 59
    iget v3, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->startLine:I

    invoke-virtual {v2, v3}, Lcom/flyersoft/staticlayout/MRTextView;->isNormalImageLine(I)Z

    move-result v3

    if-nez v3, :cond_1

    goto :goto_0

    .line 62
    :cond_1
    iget v3, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_v:F

    .line 63
    invoke-direct {v0, v1, v2, v3}, Lcom/flyersoft/staticlayout/MyFloatSpan;->drawBorderAndBackground(Landroid/graphics/Canvas;Lcom/flyersoft/staticlayout/MRTextView;F)V

    .line 65
    iget-boolean v4, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->isDropcap:Z

    const/high16 v5, 0x40a00000    # 5.0f

    if-eqz v4, :cond_4

    .line 66
    new-instance v4, Landroid/graphics/Paint$FontMetricsInt;

    invoke-direct {v4}, Landroid/graphics/Paint$FontMetricsInt;-><init>()V

    .line 67
    iget-object v6, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->workPaint:Landroid/text/TextPaint;

    invoke-virtual {v6, v4}, Landroid/text/TextPaint;->getFontMetricsInt(Landroid/graphics/Paint$FontMetricsInt;)I

    .line 68
    iget v6, v4, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    neg-int v6, v6

    iget v7, v4, Landroid/graphics/Paint$FontMetricsInt;->top:I

    iget v4, v4, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    sub-int/2addr v7, v4

    add-int/2addr v6, v7

    int-to-float v4, v6

    const/high16 v6, 0x3f000000    # 0.5f

    invoke-static {v6}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v6

    add-float/2addr v4, v6

    .line 69
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x18

    if-lt v6, v7, :cond_2

    div-float v5, v4, v5

    sub-float/2addr v4, v5

    :cond_2
    add-float/2addr v4, v3

    .line 72
    iget-object v7, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->workPaint:Landroid/text/TextPaint;

    .line 73
    invoke-virtual {v7}, Landroid/text/TextPaint;->getColor()I

    move-result v3

    const/high16 v5, -0x1000000

    if-ne v3, v5, :cond_3

    .line 74
    sget v3, Lcom/flyersoft/tools/A;->fontColor:I

    invoke-virtual {v7, v3}, Landroid/text/TextPaint;->setColor(I)V

    .line 75
    :cond_3
    invoke-virtual {v2}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    iget v3, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->spStart:I

    move v5, v4

    iget v4, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->spEnd:I

    iget-object v6, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->padding:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->left:F

    iget-object v8, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->padding:Landroid/graphics/RectF;

    iget v8, v8, Landroid/graphics/RectF;->top:F

    add-float/2addr v8, v5

    move v5, v6

    move v6, v8

    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Canvas;->drawText(Ljava/lang/CharSequence;IIFFLandroid/graphics/Paint;)V

    return-void

    .line 79
    :cond_4
    invoke-direct {v0}, Lcom/flyersoft/staticlayout/MyFloatSpan;->getCachedDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    if-nez v4, :cond_5

    :goto_0
    return-void

    .line 83
    :cond_5
    iget-boolean v6, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->isLeft:Z

    const/4 v7, 0x0

    if-eqz v6, :cond_6

    const/4 v6, 0x0

    goto :goto_1

    :cond_6
    const/4 v6, 0x2

    :goto_1
    move-object/from16 v8, p4

    invoke-virtual {v0, v8, v6, v7}, Lcom/flyersoft/staticlayout/MyFloatSpan;->outerMargin(Ljava/util/ArrayList;IZ)F

    move-result v6

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v8

    mul-float v6, v6, v8

    const/high16 v8, 0x40800000    # 4.0f

    mul-float v6, v6, v8

    div-float/2addr v6, v5

    .line 84
    iget v8, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_height:F

    iget v9, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_tv_h:F

    sub-float/2addr v8, v9

    .line 86
    iget-object v9, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->padding:Landroid/graphics/RectF;

    iget v9, v9, Landroid/graphics/RectF;->left:F

    iget-object v10, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->margin:Landroid/graphics/RectF;

    iget v10, v10, Landroid/graphics/RectF;->left:F

    add-float/2addr v9, v10

    .line 87
    iget-object v10, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->padding:Landroid/graphics/RectF;

    iget v10, v10, Landroid/graphics/RectF;->right:F

    iget-object v11, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->margin:Landroid/graphics/RectF;

    iget v11, v11, Landroid/graphics/RectF;->right:F

    add-float/2addr v10, v11

    .line 88
    iget-boolean v11, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->isLeft:Z

    if-eqz v11, :cond_7

    move v11, v9

    goto :goto_2

    :cond_7
    invoke-virtual {v2}, Lcom/flyersoft/staticlayout/MRTextView;->getWidth()I

    move-result v11

    int-to-float v11, v11

    iget v12, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_width:F

    sub-float/2addr v11, v12

    add-float/2addr v11, v9

    :goto_2
    float-to-int v11, v11

    .line 89
    iget-object v12, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->padding:Landroid/graphics/RectF;

    iget v12, v12, Landroid/graphics/RectF;->top:F

    add-float/2addr v12, v3

    iget-object v13, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->margin:Landroid/graphics/RectF;

    iget v13, v13, Landroid/graphics/RectF;->top:F

    add-float/2addr v12, v13

    float-to-int v12, v12

    int-to-float v13, v12

    const/high16 v14, 0x40000000    # 2.0f

    div-float v15, v8, v14

    add-float/2addr v15, v3

    cmpl-float v13, v13, v15

    if-lez v13, :cond_8

    float-to-int v12, v15

    .line 93
    :cond_8
    iget v13, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_width:F

    sub-float v9, v13, v9

    sub-float/2addr v9, v10

    float-to-int v9, v9

    const/4 v10, 0x0

    cmpl-float v15, v6, v10

    if-lez v15, :cond_b

    int-to-float v15, v9

    add-float v16, v6, v15

    const/high16 p2, 0x40a00000    # 5.0f

    .line 95
    invoke-static/range {p2 .. p2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v5

    int-to-float v5, v5

    sub-float/2addr v13, v5

    cmpl-float v5, v16, v13

    if-lez v5, :cond_9

    .line 96
    iget v5, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_width:F

    sub-float/2addr v5, v15

    invoke-static/range {p2 .. p2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v6

    int-to-float v6, v6

    sub-float v6, v5, v6

    .line 97
    :cond_9
    iget-boolean v5, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->isLeft:Z

    if-eqz v5, :cond_a

    int-to-float v13, v11

    cmpl-float v13, v6, v13

    if-lez v13, :cond_a

    float-to-int v11, v6

    goto :goto_3

    :cond_a
    if-nez v5, :cond_b

    .line 99
    invoke-virtual {v2}, Lcom/flyersoft/staticlayout/MRTextView;->getWidth()I

    move-result v5

    sub-int/2addr v5, v9

    int-to-float v5, v5

    sub-float/2addr v5, v6

    int-to-float v13, v11

    cmpg-float v5, v5, v13

    if-gez v5, :cond_b

    .line 100
    invoke-virtual {v2}, Lcom/flyersoft/staticlayout/MRTextView;->getWidth()I

    move-result v5

    sub-int/2addr v5, v9

    int-to-float v5, v5

    sub-float/2addr v5, v6

    float-to-int v11, v5

    .line 102
    :cond_b
    :goto_3
    iget-object v5, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->imageSpan:Lcom/flyersoft/staticlayout/MyImageSpan;

    iget-object v5, v5, Lcom/flyersoft/staticlayout/MyImageSpan;->mRect:Landroid/graphics/Rect;

    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    move-result v5

    mul-int v5, v5, v9

    iget-object v6, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->imageSpan:Lcom/flyersoft/staticlayout/MyImageSpan;

    iget-object v6, v6, Lcom/flyersoft/staticlayout/MyImageSpan;->mRect:Landroid/graphics/Rect;

    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v6

    div-int/2addr v5, v6

    .line 104
    iget-object v6, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->padding:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->bottom:F

    iget-object v13, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->margin:Landroid/graphics/RectF;

    iget v13, v13, Landroid/graphics/RectF;->bottom:F

    add-float/2addr v6, v13

    add-float/2addr v3, v8

    add-int v8, v12, v5

    int-to-float v8, v8

    sub-float/2addr v3, v8

    const/high16 v8, 0x3f800000    # 1.0f

    cmpl-float v6, v6, v3

    if-lez v6, :cond_d

    .line 105
    iget-object v6, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->padding:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->bottom:F

    iget-object v13, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->margin:Landroid/graphics/RectF;

    iget v13, v13, Landroid/graphics/RectF;->bottom:F

    add-float/2addr v6, v13

    sub-float/2addr v6, v3

    int-to-float v3, v5

    div-float/2addr v6, v3

    sub-float v5, v8, v6

    const v6, 0x3f4ccccd    # 0.8f

    cmpg-float v13, v5, v6

    if-gez v13, :cond_c

    const v5, 0x3f4ccccd    # 0.8f

    :cond_c
    int-to-float v6, v9

    mul-float v6, v6, v5

    float-to-int v9, v6

    mul-float v5, v5, v3

    float-to-int v5, v5

    .line 114
    :cond_d
    iget-object v3, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_sl:Landroid/text/StaticLayout;

    if-eqz v3, :cond_13

    .line 115
    iget v6, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_v:F

    iget v13, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_height:F

    iget v15, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_tv_h:F

    sub-float/2addr v13, v15

    add-float/2addr v6, v13

    iput v6, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_sl_v:F

    .line 116
    invoke-virtual {v3}, Landroid/text/StaticLayout;->getHeight()I

    move-result v3

    int-to-float v3, v3

    .line 117
    invoke-virtual {v2}, Lcom/flyersoft/staticlayout/MRTextView;->getLineHeight2()I

    move-result v6

    int-to-float v6, v6

    mul-float v6, v6, v14

    .line 118
    invoke-virtual {v2}, Lcom/flyersoft/staticlayout/MRTextView;->getScrollView()Landroid/view/View;

    move-result-object v13

    invoke-virtual {v13}, Landroid/view/View;->getScrollY()I

    move-result v13

    invoke-static {}, Lcom/flyersoft/tools/A;->getPageHeight()I

    move-result v15

    add-int/2addr v13, v15

    .line 119
    iget v15, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_sl_v:F

    int-to-float v13, v13

    iget-object v7, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_sl:Landroid/text/StaticLayout;

    const/high16 p4, 0x3f800000    # 1.0f

    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Landroid/text/StaticLayout;->getLineTop(I)I

    move-result v7

    int-to-float v7, v7

    const v16, 0x3f666666    # 0.9f

    mul-float v7, v7, v16

    sub-float v7, v13, v7

    cmpg-float v7, v15, v7

    if-gez v7, :cond_e

    const/4 v7, 0x1

    goto :goto_4

    :cond_e
    const/4 v7, 0x0

    .line 120
    :goto_4
    sget-boolean v15, Lcom/flyersoft/tools/A;->moveStart:Z

    if-nez v15, :cond_10

    iget v15, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_sl_v:F

    add-float/2addr v15, v3

    invoke-virtual {v2}, Lcom/flyersoft/staticlayout/MRTextView;->getScrollView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getScrollY()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v15, v2

    cmpl-float v2, v15, v6

    if-lez v2, :cond_f

    goto :goto_5

    :cond_f
    const/4 v8, 0x0

    :cond_10
    :goto_5
    if-eqz v7, :cond_14

    if-eqz v8, :cond_14

    .line 123
    iget v2, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_sl_v:F

    add-float/2addr v3, v2

    sub-float/2addr v3, v13

    cmpl-float v7, v3, v10

    if-lez v7, :cond_12

    cmpg-float v6, v3, v6

    if-gez v6, :cond_12

    add-int v6, v12, v5

    int-to-float v6, v6

    sub-float/2addr v2, v6

    .line 125
    invoke-static {v14}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v6

    int-to-float v6, v6

    sub-float/2addr v2, v6

    cmpg-float v6, v2, v3

    if-gez v6, :cond_11

    int-to-float v6, v5

    sub-float v2, v3, v2

    sub-float/2addr v6, v2

    .line 127
    div-int/lit8 v7, v5, 0x2

    int-to-float v7, v7

    cmpl-float v6, v6, v7

    if-lez v6, :cond_12

    .line 129
    iget v6, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_sl_v:F

    sub-float/2addr v6, v3

    iput v6, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_sl_v:F

    goto :goto_6

    .line 132
    :cond_11
    iget v2, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_sl_v:F

    sub-float/2addr v2, v3

    iput v2, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_sl_v:F

    :cond_12
    const/4 v2, 0x0

    .line 134
    :goto_6
    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    int-to-float v3, v11

    .line 135
    iget v6, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_sl_v:F

    invoke-virtual {v1, v3, v6}, Landroid/graphics/Canvas;->translate(FF)V

    .line 136
    iget-object v3, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_sl:Landroid/text/StaticLayout;

    invoke-virtual {v3, v1}, Landroid/text/StaticLayout;->draw(Landroid/graphics/Canvas;)V

    .line 137
    invoke-virtual {v1}, Landroid/graphics/Canvas;->restore()V

    goto :goto_7

    :cond_13
    const/high16 p4, 0x3f800000    # 1.0f

    :cond_14
    const/4 v2, 0x0

    :goto_7
    cmpl-float v3, v2, v10

    if-lez v3, :cond_15

    int-to-float v3, v5

    div-float/2addr v2, v3

    sub-float v8, p4, v2

    int-to-float v2, v9

    mul-float v2, v2, v8

    float-to-int v9, v2

    mul-float v8, v8, v3

    float-to-int v5, v8

    .line 147
    :cond_15
    new-instance v2, Landroid/graphics/Rect;

    add-int/2addr v9, v11

    add-int/2addr v5, v12

    invoke-direct {v2, v11, v12, v9, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 148
    invoke-virtual {v4, v2}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 149
    invoke-virtual {v4, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 155
    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/flyersoft/staticlayout/DynamicDrawableSpan;->reduceImageBrightness(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V

    return-void
.end method

.method protected outerMargin(Ljava/util/ArrayList;IZ)F
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/staticlayout/MyMarginSpan;",
            ">;IZ)F"
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 209
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_6

    .line 210
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/staticlayout/MyMarginSpan;

    if-eq v2, p0, :cond_5

    if-eqz p3, :cond_0

    .line 212
    iget v3, v2, Lcom/flyersoft/staticlayout/MyMarginSpan;->spStart:I

    iget v4, p0, Lcom/flyersoft/staticlayout/MyFloatSpan;->spStart:I

    if-eq v3, v4, :cond_1

    :cond_0
    if-nez p3, :cond_5

    iget v3, v2, Lcom/flyersoft/staticlayout/MyMarginSpan;->spStart:I

    iget v4, p0, Lcom/flyersoft/staticlayout/MyFloatSpan;->spStart:I

    if-gt v3, v4, :cond_5

    :cond_1
    iget v3, v2, Lcom/flyersoft/staticlayout/MyMarginSpan;->spEnd:I

    iget v4, p0, Lcom/flyersoft/staticlayout/MyFloatSpan;->spEnd:I

    if-lt v3, v4, :cond_5

    if-nez p2, :cond_2

    .line 214
    iget v2, v2, Lcom/flyersoft/staticlayout/MyMarginSpan;->leftMargin:F

    goto :goto_1

    :cond_2
    const/4 v3, 0x1

    if-ne p2, v3, :cond_3

    iget v2, v2, Lcom/flyersoft/staticlayout/MyMarginSpan;->topMargin:F

    goto :goto_1

    :cond_3
    const/4 v3, 0x2

    if-ne p2, v3, :cond_4

    iget v2, v2, Lcom/flyersoft/staticlayout/MyMarginSpan;->rightMargin:F

    goto :goto_1

    :cond_4
    iget v2, v2, Lcom/flyersoft/staticlayout/MyMarginSpan;->bottomMargin:F

    :goto_1
    add-float/2addr v0, v2

    :cond_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_6
    return v0
.end method
