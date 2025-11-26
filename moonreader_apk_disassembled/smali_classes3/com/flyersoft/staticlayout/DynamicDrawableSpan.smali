.class public abstract Lcom/flyersoft/staticlayout/DynamicDrawableSpan;
.super Lcom/flyersoft/staticlayout/ReplacementSpan;
.source "DynamicDrawableSpan.java"


# static fields
.field public static final ALIGN_BASELINE:I = 0x1

.field public static final ALIGN_BOTTOM:I = 0x0

.field private static final TAG:Ljava/lang/String; = "DynamicDrawableSpan"


# instance fields
.field public drawed:Z

.field public inline:Z

.field public isCenter:Z

.field public mDrawableRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation
.end field

.field protected mMyImageGetter:Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

.field protected mRect:Landroid/graphics/Rect;

.field protected mSource:Ljava/lang/String;

.field protected final mVerticalAlignment:I

.field public originalSize:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 60
    invoke-direct {p0}, Lcom/flyersoft/staticlayout/ReplacementSpan;-><init>()V

    const/4 v0, 0x0

    .line 61
    iput v0, p0, Lcom/flyersoft/staticlayout/DynamicDrawableSpan;->mVerticalAlignment:I

    return-void
.end method

.method protected constructor <init>(I)V
    .locals 0

    .line 67
    invoke-direct {p0}, Lcom/flyersoft/staticlayout/ReplacementSpan;-><init>()V

    .line 68
    iput p1, p0, Lcom/flyersoft/staticlayout/DynamicDrawableSpan;->mVerticalAlignment:I

    return-void
.end method

.method private getCachedDrawable()Landroid/graphics/drawable/Drawable;
    .locals 5

    .line 327
    iget-object v0, p0, Lcom/flyersoft/staticlayout/DynamicDrawableSpan;->mDrawableRef:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    .line 331
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/Drawable;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_3

    .line 335
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/DynamicDrawableSpan;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 336
    iget-object v1, p0, Lcom/flyersoft/staticlayout/DynamicDrawableSpan;->mRect:Landroid/graphics/Rect;

    if-nez v1, :cond_1

    .line 337
    new-instance v1, Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v3

    const/4 v4, 0x0

    invoke-direct {v1, v4, v4, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v1, p0, Lcom/flyersoft/staticlayout/DynamicDrawableSpan;->mRect:Landroid/graphics/Rect;

    .line 339
    :cond_1
    sget-boolean v1, Lcom/flyersoft/tools/A;->verticalAlignment:Z

    if-eqz v1, :cond_2

    sget-boolean v1, Lcom/flyersoft/tools/A;->isJapanese:Z

    if-eqz v1, :cond_2

    invoke-static {}, Lcom/flyersoft/tools/A;->getBookType()I

    move-result v1

    if-nez v1, :cond_2

    .line 340
    invoke-static {v0}, Lcom/flyersoft/tools/A;->getDisplayDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 342
    :cond_2
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/flyersoft/staticlayout/DynamicDrawableSpan;->mDrawableRef:Ljava/lang/ref/WeakReference;

    :cond_3
    return-object v0
.end method

.method private isSingleImage(Ljava/lang/CharSequence;I)Z
    .locals 4

    const/4 v0, 0x0

    const/16 v1, 0xa

    if-eqz p2, :cond_0

    add-int/lit8 v2, p2, -0x1

    .line 309
    invoke-interface {p1, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    if-ne v2, v1, :cond_4

    .line 310
    :cond_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v2

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    if-ne p2, v2, :cond_1

    return v3

    :cond_1
    add-int/2addr p2, v3

    .line 312
    :goto_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-ge p2, v2, :cond_4

    .line 313
    invoke-interface {p1, p2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    if-ne v2, v1, :cond_2

    return v3

    .line 316
    :cond_2
    invoke-static {v2}, Lcom/flyersoft/tools/A;->isSpaceChar(C)Z

    move-result v2

    if-nez v2, :cond_3

    return v0

    :cond_3
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_4
    return v0
.end method

.method public static reduceImageBrightness(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
    .locals 2

    .line 297
    sget-boolean v0, Lcom/flyersoft/tools/A;->reduceImageBrightness:Z

    if-eqz v0, :cond_0

    sget v0, Lcom/flyersoft/tools/A;->nightImageBright:I

    const/16 v1, 0x64

    if-ge v0, v1, :cond_0

    sget v0, Lcom/flyersoft/tools/A;->nightImageBright:I

    if-lez v0, :cond_0

    .line 298
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 299
    sget v0, Lcom/flyersoft/tools/A;->nightImageBright:I

    rsub-int/lit8 v0, v0, 0x64

    mul-int/lit16 v0, v0, 0xff

    div-int/2addr v0, v1

    const/4 v1, 0x0

    .line 300
    invoke-static {v0, v1, v1, v1}, Landroid/graphics/Color;->argb(IIII)I

    move-result v0

    .line 301
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 303
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 304
    invoke-virtual {p0, p1, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public draw(Lcom/flyersoft/staticlayout/MRTextView;Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIFIIILandroid/graphics/Paint;)V
    .locals 18

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v3, p4

    move/from16 v4, p9

    const/4 v5, 0x0

    .line 135
    iput-boolean v5, v0, Lcom/flyersoft/staticlayout/DynamicDrawableSpan;->drawed:Z

    .line 137
    iget-object v6, v0, Lcom/flyersoft/staticlayout/DynamicDrawableSpan;->mSource:Ljava/lang/String;

    const-string v7, "#audio#"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    const/4 v7, 0x1

    if-eqz v6, :cond_0

    .line 138
    sget-object v6, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    if-eqz v6, :cond_0

    .line 139
    iget v8, v6, Lcom/flyersoft/moonreaderp/ActivityTxt;->mp3PlayState:I

    if-ne v8, v7, :cond_0

    iget-object v6, v6, Lcom/flyersoft/moonreaderp/ActivityTxt;->mp3_file:Ljava/lang/String;

    .line 140
    invoke-static {v6}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iget-object v8, v0, Lcom/flyersoft/staticlayout/DynamicDrawableSpan;->mSource:Ljava/lang/String;

    invoke-static {v8}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    goto/16 :goto_d

    .line 144
    :cond_0
    iget-object v6, v0, Lcom/flyersoft/staticlayout/DynamicDrawableSpan;->mSource:Ljava/lang/String;

    const-string v8, "#video#"

    invoke-virtual {v6, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 145
    sget-object v6, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    if-eqz v6, :cond_1

    .line 146
    iget-boolean v6, v6, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPaused:Z

    if-eqz v6, :cond_1

    goto/16 :goto_d

    .line 150
    :cond_1
    invoke-static {}, Lcom/flyersoft/tools/A;->currentChapterWithImageOnly()Z

    move-result v6

    if-eqz v6, :cond_2

    goto/16 :goto_d

    .line 153
    :cond_2
    invoke-direct {v0}, Lcom/flyersoft/staticlayout/DynamicDrawableSpan;->getCachedDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v6

    if-eqz v6, :cond_2e

    if-nez v1, :cond_3

    goto/16 :goto_d

    .line 157
    :cond_3
    iget-object v8, v0, Lcom/flyersoft/staticlayout/DynamicDrawableSpan;->mRect:Landroid/graphics/Rect;

    if-eqz v8, :cond_4

    goto :goto_0

    :cond_4
    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v8

    .line 158
    :goto_0
    invoke-virtual {v8}, Landroid/graphics/Rect;->width()I

    move-result v9

    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v10

    invoke-virtual {v10}, Landroid/graphics/Rect;->width()I

    move-result v10

    if-eq v9, v10, :cond_5

    .line 159
    iget v9, v8, Landroid/graphics/Rect;->right:I

    iget v10, v8, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v6, v5, v5, v9, v10}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 161
    :cond_5
    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v9

    invoke-virtual {v9, v3}, Lcom/flyersoft/staticlayout/MyLayout;->getLineForOffset(I)I

    move-result v9

    .line 162
    invoke-static {}, Lcom/flyersoft/tools/A;->dualPageEnabled()Z

    move-result v10

    if-eqz v10, :cond_6

    .line 163
    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v10

    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getParent()Landroid/view/ViewParent;

    move-result-object v11

    check-cast v11, Landroid/view/View;

    invoke-virtual {v11}, Landroid/view/View;->getScrollY()I

    move-result v11

    invoke-virtual {v10, v11}, Lcom/flyersoft/staticlayout/MyLayout;->getLineForVertical(I)I

    move-result v10

    if-ne v10, v9, :cond_6

    const/4 v10, 0x1

    goto :goto_1

    :cond_6
    const/4 v10, 0x0

    .line 165
    :goto_1
    sget-boolean v11, Lcom/flyersoft/tools/A;->moveStart:Z

    const/4 v12, 0x2

    if-nez v11, :cond_b

    sget-boolean v11, Lcom/flyersoft/tools/A;->isInAutoScroll:Z

    if-nez v11, :cond_b

    .line 166
    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->lastIgnoreLine()I

    move-result v11

    if-lez v11, :cond_7

    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->lastIgnoreLine()I

    move-result v11

    if-lt v9, v11, :cond_7

    goto/16 :goto_d

    .line 168
    :cond_7
    invoke-static {}, Lcom/flyersoft/tools/A;->dualPageEnabled()Z

    move-result v11

    if-eqz v11, :cond_8

    .line 169
    invoke-virtual {v1, v9}, Lcom/flyersoft/staticlayout/MRTextView;->isLastHalfLine(I)Z

    move-result v11

    if-eqz v11, :cond_b

    if-nez v10, :cond_b

    goto/16 :goto_d

    .line 172
    :cond_8
    invoke-virtual {v1, v9}, Lcom/flyersoft/staticlayout/MRTextView;->lineTopBorderSp(I)Lcom/flyersoft/staticlayout/MyMarginSpan;

    move-result-object v11

    if-nez v11, :cond_b

    invoke-virtual {v8}, Landroid/graphics/Rect;->height()I

    move-result v11

    invoke-static {}, Lcom/flyersoft/tools/A;->getPageHeight()I

    move-result v13

    mul-int/lit8 v13, v13, 0x9

    div-int/lit8 v13, v13, 0xa

    if-ge v11, v13, :cond_b

    .line 173
    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getScrollView()Landroid/view/View;

    move-result-object v11

    invoke-virtual {v11}, Landroid/view/View;->getScrollY()I

    move-result v11

    sub-int v11, p7, v11

    invoke-static {}, Lcom/flyersoft/tools/A;->getPageHeight()I

    move-result v13

    div-int/2addr v13, v12

    if-le v11, v13, :cond_b

    .line 174
    invoke-virtual {v1, v9}, Lcom/flyersoft/staticlayout/MRTextView;->isLastHalfLine(I)Z

    move-result v11

    if-eqz v11, :cond_9

    goto/16 :goto_d

    .line 176
    :cond_9
    invoke-virtual {v1, v9}, Lcom/flyersoft/staticlayout/MRTextView;->isNormalImageLine(I)Z

    move-result v11

    if-eqz v11, :cond_b

    .line 177
    sget-object v11, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    if-ne v1, v11, :cond_a

    sget-object v11, Lcom/flyersoft/tools/A;->txtScroll2:Landroid/widget/ScrollView;

    goto :goto_2

    :cond_a
    sget-object v11, Lcom/flyersoft/tools/A;->txtScroll:Landroid/widget/ScrollView;

    :goto_2
    invoke-static {v11}, Lcom/flyersoft/tools/A;->getLastDisplayLine2(Landroid/widget/ScrollView;)I

    move-result v11

    if-ne v11, v9, :cond_b

    goto/16 :goto_d

    .line 182
    :cond_b
    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getLineHeight()I

    move-result v11

    .line 183
    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getWidth2()I

    move-result v13

    int-to-float v13, v13

    .line 184
    invoke-virtual {v8}, Landroid/graphics/Rect;->width()I

    move-result v14

    const/4 v15, 0x0

    cmpg-float v16, p6, v15

    if-gez v16, :cond_c

    const/16 v16, 0x0

    goto :goto_3

    :cond_c
    move/from16 v16, p6

    .line 189
    :goto_3
    sget v17, Lcom/flyersoft/tools/A;->lineSpace:I

    if-gez v17, :cond_f

    .line 190
    sget v17, Lcom/flyersoft/tools/A;->lineSpace:I

    const/16 p5, 0x2

    sget v12, Lcom/flyersoft/tools/A;->lineSpace:I

    if-ne v12, v7, :cond_d

    const/4 v12, 0x1

    goto :goto_4

    :cond_d
    const/4 v12, 0x2

    :goto_4
    mul-int v17, v17, v12

    mul-int v17, v17, v11

    invoke-static/range {v17 .. v17}, Ljava/lang/Math;->abs(I)I

    move-result v12

    add-int v12, p7, v12

    const/16 p8, 0x0

    sub-int v15, v4, v12

    if-ge v15, v11, :cond_e

    sub-int v11, v4, v11

    goto :goto_5

    :cond_e
    move v11, v12

    goto :goto_5

    :cond_f
    const/16 p5, 0x2

    const/16 p8, 0x0

    move/from16 v11, p7

    :goto_5
    sub-int v12, v4, v11

    .line 195
    invoke-virtual {v8}, Landroid/graphics/Rect;->height()I

    move-result v15

    const/high16 v17, 0x3f800000    # 1.0f

    if-ge v12, v15, :cond_10

    int-to-float v12, v12

    .line 196
    invoke-virtual {v8}, Landroid/graphics/Rect;->height()I

    move-result v15

    int-to-float v15, v15

    div-float/2addr v12, v15

    .line 197
    iget v15, v8, Landroid/graphics/Rect;->right:I

    int-to-float v15, v15

    mul-float v15, v15, v12

    sub-float v15, v15, v17

    float-to-int v15, v15

    iget v8, v8, Landroid/graphics/Rect;->bottom:I

    int-to-float v8, v8

    mul-float v12, v12, v8

    sub-float v12, v12, v17

    float-to-int v8, v12

    invoke-virtual {v6, v5, v5, v15, v8}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 198
    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v8

    :cond_10
    move-object/from16 v12, p3

    .line 201
    invoke-direct {v0, v12, v3}, Lcom/flyersoft/staticlayout/DynamicDrawableSpan;->isSingleImage(Ljava/lang/CharSequence;I)Z

    move-result v3

    if-eqz v3, :cond_23

    .line 202
    invoke-virtual {v1, v9}, Lcom/flyersoft/staticlayout/MRTextView;->getCssMargins(I)Lcom/flyersoft/staticlayout/MRTextView$MarginF;

    move-result-object v3

    .line 203
    iget-boolean v15, v0, Lcom/flyersoft/staticlayout/DynamicDrawableSpan;->isCenter:Z

    if-nez v15, :cond_12

    invoke-virtual {v1, v9}, Lcom/flyersoft/staticlayout/MRTextView;->getLineAlign(I)I

    move-result v15

    const/high16 p3, 0x40000000    # 2.0f

    const/4 v12, 0x3

    if-eq v15, v12, :cond_11

    invoke-static {}, Lcom/flyersoft/tools/A;->getFileType()I

    move-result v12

    const/4 v15, 0x5

    if-ne v12, v15, :cond_13

    .line 204
    :cond_11
    iput-boolean v7, v0, Lcom/flyersoft/staticlayout/DynamicDrawableSpan;->isCenter:Z

    goto :goto_6

    :cond_12
    const/high16 p3, 0x40000000    # 2.0f

    :cond_13
    :goto_6
    int-to-float v12, v14

    cmpl-float v14, v13, v12

    if-ltz v14, :cond_16

    .line 206
    iget-boolean v14, v0, Lcom/flyersoft/staticlayout/DynamicDrawableSpan;->isCenter:Z

    if-nez v14, :cond_15

    const/high16 v14, 0x40400000    # 3.0f

    div-float v14, v13, v14

    cmpl-float v14, v12, v14

    if-lez v14, :cond_16

    cmpl-float v14, v16, p8

    if-eqz v14, :cond_15

    iget v14, v3, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->left:F

    cmpl-float v14, v16, v14

    if-nez v14, :cond_14

    iget v14, v3, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->right:F

    cmpl-float v14, v16, v14

    if-eqz v14, :cond_15

    .line 207
    :cond_14
    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->indentWidth()F

    move-result v14

    cmpl-float v14, v16, v14

    if-nez v14, :cond_16

    :cond_15
    sub-float v12, v13, v12

    div-float v16, v12, p3

    const/4 v12, 0x1

    goto :goto_7

    :cond_16
    const/4 v12, 0x0

    :goto_7
    const/high16 v14, 0x40a00000    # 5.0f

    div-float v14, v13, v14

    if-nez v12, :cond_1d

    .line 213
    iget v12, v3, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->left:F

    cmpl-float v12, v12, p8

    if-gtz v12, :cond_17

    iget v12, v3, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->right:F

    cmpl-float v12, v12, p8

    if-lez v12, :cond_1d

    .line 214
    :cond_17
    iget v12, v3, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->left:F

    cmpg-float v12, v12, p8

    if-gez v12, :cond_18

    const/4 v12, 0x0

    iput v12, v3, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->left:F

    .line 215
    :cond_18
    iget v12, v3, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->left:F

    cmpl-float v12, v12, v14

    if-lez v12, :cond_19

    iput v14, v3, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->left:F

    .line 216
    :cond_19
    iget v12, v3, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->right:F

    cmpl-float v12, v12, v14

    if-lez v12, :cond_1a

    iput v14, v3, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->right:F

    :cond_1a
    cmpl-float v12, v16, v14

    if-lez v12, :cond_1b

    move/from16 v16, v14

    .line 218
    :cond_1b
    iget v12, v3, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->left:F

    cmpg-float v12, v16, v12

    if-gez v12, :cond_1c

    iget v12, v3, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->left:F

    move/from16 v16, v12

    .line 219
    :cond_1c
    iget v12, v3, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->left:F

    sub-float v12, v13, v12

    iget v3, v3, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->right:F

    sub-float/2addr v12, v3

    div-float/2addr v12, v13

    .line 220
    iget v3, v8, Landroid/graphics/Rect;->right:I

    int-to-float v3, v3

    mul-float v3, v3, v12

    sub-float v3, v3, v17

    float-to-int v3, v3

    iget v8, v8, Landroid/graphics/Rect;->bottom:I

    int-to-float v8, v8

    mul-float v12, v12, v8

    sub-float v12, v12, v17

    float-to-int v8, v12

    invoke-virtual {v6, v5, v5, v3, v8}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 221
    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v8

    :cond_1d
    const/4 v12, 0x0

    cmpl-float v3, v16, v12

    if-lez v3, :cond_1f

    .line 224
    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result v3

    int-to-float v3, v3

    add-float v3, v16, v3

    cmpl-float v3, v3, v13

    if-lez v3, :cond_1f

    .line 225
    invoke-virtual {v8}, Landroid/graphics/Rect;->width()I

    move-result v3

    int-to-float v3, v3

    sub-float v3, v13, v3

    cmpl-float v15, v3, v12

    if-lez v15, :cond_1e

    cmpl-float v12, v16, v3

    if-lez v12, :cond_1e

    move v14, v3

    goto :goto_8

    :cond_1e
    cmpl-float v3, v16, v14

    if-lez v3, :cond_1f

    goto :goto_8

    :cond_1f
    move/from16 v14, v16

    .line 231
    :goto_8
    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result v3

    int-to-float v3, v3

    add-float/2addr v3, v14

    cmpl-float v3, v3, v13

    if-lez v3, :cond_20

    sub-float v3, v13, v14

    .line 232
    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v12

    invoke-virtual {v12}, Landroid/graphics/Rect;->width()I

    move-result v12

    int-to-float v12, v12

    div-float/2addr v3, v12

    .line 233
    iget v12, v8, Landroid/graphics/Rect;->right:I

    int-to-float v12, v12

    mul-float v12, v12, v3

    sub-float v12, v12, v17

    float-to-int v12, v12

    iget v8, v8, Landroid/graphics/Rect;->bottom:I

    int-to-float v8, v8

    mul-float v3, v3, v8

    sub-float v3, v3, v17

    float-to-int v3, v3

    invoke-virtual {v6, v5, v5, v12, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 234
    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v8

    :cond_20
    if-eqz v10, :cond_22

    .line 238
    invoke-static {}, Lcom/flyersoft/tools/A;->getPageHeight()I

    move-result v3

    mul-int/lit8 v3, v3, 0x9

    div-int/lit8 v3, v3, 0xa

    .line 239
    invoke-virtual {v8}, Landroid/graphics/Rect;->height()I

    move-result v12

    if-le v12, v3, :cond_22

    int-to-float v3, v3

    .line 240
    invoke-virtual {v8}, Landroid/graphics/Rect;->height()I

    move-result v12

    int-to-float v12, v12

    div-float/2addr v3, v12

    .line 241
    iget v12, v8, Landroid/graphics/Rect;->right:I

    int-to-float v12, v12

    mul-float v12, v12, v3

    sub-float v12, v12, v17

    float-to-int v12, v12

    iget v8, v8, Landroid/graphics/Rect;->bottom:I

    int-to-float v8, v8

    mul-float v3, v3, v8

    sub-float v3, v3, v17

    float-to-int v3, v3

    invoke-virtual {v6, v5, v5, v12, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 242
    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v3

    .line 243
    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result v8

    invoke-static {}, Lcom/flyersoft/tools/A;->getPageWidth2()I

    move-result v12

    if-ge v8, v12, :cond_21

    .line 244
    invoke-static {}, Lcom/flyersoft/tools/A;->getPageWidth2()I

    move-result v8

    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result v12

    sub-int/2addr v8, v12

    div-int/lit8 v8, v8, 0x2

    int-to-float v8, v8

    move/from16 v16, v8

    move-object v8, v3

    goto :goto_9

    :cond_21
    move-object v8, v3

    :cond_22
    move/from16 v16, v14

    :goto_9
    move/from16 v3, v16

    const/4 v12, 0x0

    goto :goto_b

    :cond_23
    const/high16 p3, 0x40000000    # 2.0f

    .line 249
    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v3

    invoke-virtual {v3, v9}, Lcom/flyersoft/staticlayout/MyLayout;->getLineFloat(I)I

    move-result v3

    int-to-float v3, v3

    const/4 v12, 0x0

    cmpl-float v14, v3, v12

    if-eqz v14, :cond_25

    .line 251
    invoke-virtual {v1, v9}, Lcom/flyersoft/staticlayout/MRTextView;->getCssMargins(I)Lcom/flyersoft/staticlayout/MRTextView$MarginF;

    move-result-object v15

    if-lez v14, :cond_24

    .line 252
    iget v14, v15, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->left:F

    cmpg-float v14, v16, v14

    if-gez v14, :cond_24

    .line 253
    iget v3, v15, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->left:F

    move/from16 v16, v3

    goto :goto_a

    :cond_24
    cmpg-float v3, v3, v12

    if-gez v3, :cond_26

    .line 255
    iget v3, v15, Lcom/flyersoft/staticlayout/MRTextView$MarginF;->right:F

    sub-float/2addr v13, v3

    goto :goto_a

    .line 257
    :cond_25
    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v3

    invoke-virtual {v3, v9}, Lcom/flyersoft/staticlayout/MyLayout;->getParagraphDirection(I)I

    move-result v3

    const/4 v14, -0x1

    if-ne v3, v14, :cond_26

    sub-float v3, v13, v16

    .line 259
    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v14

    invoke-virtual {v14}, Landroid/graphics/Rect;->width()I

    move-result v14

    int-to-float v14, v14

    sub-float v16, v3, v14

    :cond_26
    :goto_a
    move/from16 v3, v16

    .line 264
    :goto_b
    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v14

    invoke-virtual {v14}, Landroid/graphics/Rect;->width()I

    move-result v14

    int-to-float v14, v14

    add-float/2addr v14, v3

    cmpl-float v14, v14, v13

    if-lez v14, :cond_27

    sub-float/2addr v13, v3

    .line 265
    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v14

    invoke-virtual {v14}, Landroid/graphics/Rect;->width()I

    move-result v14

    int-to-float v14, v14

    div-float/2addr v13, v14

    .line 266
    iget v14, v8, Landroid/graphics/Rect;->right:I

    int-to-float v14, v14

    mul-float v14, v14, v13

    sub-float v14, v14, v17

    float-to-int v14, v14

    iget v15, v8, Landroid/graphics/Rect;->bottom:I

    int-to-float v15, v15

    mul-float v13, v13, v15

    sub-float v13, v13, v17

    float-to-int v13, v13

    invoke-virtual {v6, v5, v5, v14, v13}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 269
    :cond_27
    invoke-virtual {v1, v9}, Lcom/flyersoft/staticlayout/MRTextView;->getLineTop3(I)I

    move-result v13

    int-to-float v13, v13

    if-eqz v10, :cond_28

    const/4 v15, 0x0

    goto :goto_c

    :cond_28
    int-to-float v10, v4

    sub-float/2addr v10, v13

    .line 270
    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v12

    iget v12, v12, Landroid/graphics/Rect;->bottom:I

    int-to-float v12, v12

    sub-float/2addr v10, v12

    div-float v15, v10, p3

    :goto_c
    add-float/2addr v13, v15

    .line 272
    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v10

    invoke-virtual {v10}, Landroid/graphics/Rect;->height()I

    move-result v10

    int-to-float v10, v10

    add-float/2addr v10, v13

    int-to-float v12, v4

    cmpl-float v10, v10, v12

    if-lez v10, :cond_29

    sub-float/2addr v13, v15

    .line 274
    :cond_29
    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v10

    invoke-virtual {v10}, Landroid/graphics/Rect;->height()I

    move-result v10

    int-to-float v10, v10

    add-float/2addr v10, v13

    cmpl-float v10, v10, v12

    if-lez v10, :cond_2a

    .line 275
    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v10

    invoke-virtual {v10}, Landroid/graphics/Rect;->height()I

    move-result v10

    sub-int/2addr v4, v10

    int-to-float v13, v4

    .line 277
    :cond_2a
    iget-boolean v4, v0, Lcom/flyersoft/staticlayout/DynamicDrawableSpan;->inline:Z

    if-eqz v4, :cond_2b

    .line 280
    invoke-virtual {v8}, Landroid/graphics/Rect;->height()I

    move-result v4

    .line 281
    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v8

    invoke-virtual {v8, v9}, Lcom/flyersoft/staticlayout/MyLayout;->getLineBaseline(I)I

    move-result v8

    mul-int/lit8 v4, v4, 0x58

    div-int/lit8 v4, v4, 0x64

    sub-int/2addr v8, v4

    int-to-float v13, v8

    :cond_2b
    int-to-float v4, v11

    cmpg-float v8, v13, v4

    if-gez v8, :cond_2c

    move v13, v4

    .line 287
    :cond_2c
    invoke-virtual {v2}, Landroid/graphics/Canvas;->save()I

    .line 288
    invoke-virtual {v2, v3, v13}, Landroid/graphics/Canvas;->translate(FF)V

    .line 289
    invoke-virtual {v6, v2}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 290
    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/flyersoft/staticlayout/DynamicDrawableSpan;->reduceImageBrightness(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V

    .line 291
    invoke-virtual {v2}, Landroid/graphics/Canvas;->restore()V

    .line 293
    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v2

    int-to-float v2, v2

    add-float/2addr v13, v2

    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getScrollView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getScrollY()I

    move-result v1

    invoke-static {}, Lcom/flyersoft/tools/A;->getPageHeight()I

    move-result v2

    add-int/2addr v1, v2

    int-to-float v1, v1

    cmpg-float v1, v13, v1

    if-gez v1, :cond_2d

    const/4 v5, 0x1

    :cond_2d
    iput-boolean v5, v0, Lcom/flyersoft/staticlayout/DynamicDrawableSpan;->drawed:Z

    :cond_2e
    :goto_d
    return-void
.end method

.method public abstract getDrawable()Landroid/graphics/drawable/Drawable;
.end method

.method public getSize(Landroid/graphics/Paint;Ljava/lang/CharSequence;IILandroid/graphics/Paint$FontMetricsInt;)I
    .locals 0

    .line 96
    iget-object p1, p0, Lcom/flyersoft/staticlayout/DynamicDrawableSpan;->mRect:Landroid/graphics/Rect;

    if-nez p1, :cond_0

    .line 97
    iget-object p1, p0, Lcom/flyersoft/staticlayout/DynamicDrawableSpan;->mMyImageGetter:Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;

    if-eqz p1, :cond_0

    iget-object p2, p0, Lcom/flyersoft/staticlayout/DynamicDrawableSpan;->mSource:Ljava/lang/String;

    if-eqz p2, :cond_0

    .line 98
    iget-boolean p3, p0, Lcom/flyersoft/staticlayout/DynamicDrawableSpan;->originalSize:Z

    invoke-interface {p1, p2, p3}, Lcom/flyersoft/staticlayout/MyHtml$MyImageGetter;->getDrawableBounds(Ljava/lang/String;Z)Landroid/graphics/Rect;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/staticlayout/DynamicDrawableSpan;->mRect:Landroid/graphics/Rect;

    .line 99
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/staticlayout/DynamicDrawableSpan;->mRect:Landroid/graphics/Rect;

    if-nez p1, :cond_1

    .line 100
    invoke-direct {p0}, Lcom/flyersoft/staticlayout/DynamicDrawableSpan;->getCachedDrawable()Landroid/graphics/drawable/Drawable;

    .line 101
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/staticlayout/DynamicDrawableSpan;->mRect:Landroid/graphics/Rect;

    const/4 p2, 0x0

    if-nez p1, :cond_2

    return p2

    :cond_2
    if-eqz p5, :cond_3

    .line 121
    iget p3, p1, Landroid/graphics/Rect;->bottom:I

    neg-int p3, p3

    iput p3, p5, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    .line 122
    iput p2, p5, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    .line 124
    iget p3, p5, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    iput p3, p5, Landroid/graphics/Paint$FontMetricsInt;->top:I

    .line 125
    iput p2, p5, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    .line 128
    :cond_3
    iget p1, p1, Landroid/graphics/Rect;->right:I

    return p1
.end method

.method public getVerticalAlignment()I
    .locals 1

    .line 76
    iget v0, p0, Lcom/flyersoft/staticlayout/DynamicDrawableSpan;->mVerticalAlignment:I

    return v0
.end method
