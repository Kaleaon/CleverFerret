.class public Lcom/flyersoft/staticlayout/MyMarginSpan;
.super Ljava/lang/Object;
.source "MyMarginSpan.java"

# interfaces
.implements Landroid/text/style/ParagraphStyle;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/staticlayout/MyMarginSpan$MarginLevelComparable;
    }
.end annotation


# instance fields
.field public b:F

.field public baseline:I

.field public bottom:I

.field public bottomMargin:F

.field public bottomPadding:F

.field public cssStyle:Lcom/flyersoft/components/CSS$Style;

.field public end:I

.field public endLine:I

.field fromIndex:I

.field public indent:F

.field public isTable:Z

.field public isULSpan:Z

.field public l:F

.field public leftMargin:F

.field public leftPadding:F

.field private mDrawableRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation
.end field

.field public noindent:Z

.field public r:F

.field public rightMargin:F

.field public rightPadding:F

.field public spEnd:I

.field public spStart:I

.field public start:I

.field public startLine:I

.field public t:F

.field public tag:Ljava/lang/String;

.field public top:I

.field public topMargin:F

.field public topPadding:F


# direct methods
.method public constructor <init>(FFFF)V
    .locals 0

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    iput p1, p0, Lcom/flyersoft/staticlayout/MyMarginSpan;->leftMargin:F

    .line 71
    iput p2, p0, Lcom/flyersoft/staticlayout/MyMarginSpan;->topMargin:F

    .line 72
    iput p3, p0, Lcom/flyersoft/staticlayout/MyMarginSpan;->rightMargin:F

    .line 73
    iput p4, p0, Lcom/flyersoft/staticlayout/MyMarginSpan;->bottomMargin:F

    return-void
.end method

.method public constructor <init>(I)V
    .locals 5

    .line 63
    invoke-static {}, Lcom/flyersoft/components/CSS;->MARGIN_HORI()F

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x2

    if-ne p1, v2, :cond_0

    const/4 v3, 0x0

    goto :goto_0

    .line 64
    :cond_0
    invoke-static {}, Lcom/flyersoft/components/CSS;->MARGIN_VERT()F

    move-result v3

    invoke-static {}, Lcom/flyersoft/tools/A;->getParagraphRatio()F

    move-result v4

    mul-float v3, v3, v4

    :goto_0
    const/4 v4, 0x1

    if-ne p1, v4, :cond_1

    const/4 v4, 0x0

    goto :goto_1

    .line 65
    :cond_1
    invoke-static {}, Lcom/flyersoft/components/CSS;->MARGIN_HORI()F

    move-result v4

    :goto_1
    if-ne p1, v2, :cond_2

    goto :goto_2

    .line 66
    :cond_2
    invoke-static {}, Lcom/flyersoft/components/CSS;->MARGIN_VERT()F

    move-result p1

    invoke-static {}, Lcom/flyersoft/tools/A;->getParagraphRatio()F

    move-result v1

    mul-float v1, v1, p1

    .line 63
    :goto_2
    invoke-direct {p0, v0, v3, v4, v1}, Lcom/flyersoft/staticlayout/MyMarginSpan;-><init>(FFFF)V

    return-void
.end method

.method private extendBottomFromFloatSpan(FLjava/util/ArrayList;)F
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/staticlayout/MyMarginSpan;",
            ">;)F"
        }
    .end annotation

    .line 229
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/staticlayout/MyMarginSpan;

    .line 230
    instance-of v1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;

    if-eqz v1, :cond_0

    .line 231
    iget v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->spStart:I

    iget v2, p0, Lcom/flyersoft/staticlayout/MyMarginSpan;->spStart:I

    if-lt v1, v2, :cond_0

    iget v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->spEnd:I

    iget v2, p0, Lcom/flyersoft/staticlayout/MyMarginSpan;->spEnd:I

    if-gt v1, v2, :cond_0

    .line 232
    check-cast v0, Lcom/flyersoft/staticlayout/MyFloatSpan;

    .line 233
    iget v1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_v:F

    iget v0, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_height:F

    add-float/2addr v1, v0

    const/high16 v0, 0x40000000    # 2.0f

    invoke-static {v0}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v0

    add-float/2addr v1, v0

    cmpg-float v0, p1, v1

    if-gez v0, :cond_0

    return v1

    :cond_1
    return p1
.end method

.method private getCachedDrawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 496
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyMarginSpan;->mDrawableRef:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    .line 499
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/Drawable;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_1

    .line 502
    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/flyersoft/books/BaseEBook;->getDrawableFromSource(Ljava/lang/String;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    .line 503
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/flyersoft/staticlayout/MyMarginSpan;->mDrawableRef:Ljava/lang/ref/WeakReference;

    return-object p1

    :cond_1
    return-object v0
.end method

.method private innerBottomMargins(Ljava/util/ArrayList;)F
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/staticlayout/MyMarginSpan;",
            ">;)F"
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 531
    :goto_0
    iget v2, p0, Lcom/flyersoft/staticlayout/MyMarginSpan;->fromIndex:I

    if-ge v1, v2, :cond_1

    .line 532
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/staticlayout/MyMarginSpan;

    .line 533
    iget v3, v2, Lcom/flyersoft/staticlayout/MyMarginSpan;->spStart:I

    iget v4, p0, Lcom/flyersoft/staticlayout/MyMarginSpan;->spStart:I

    if-lt v3, v4, :cond_0

    iget v3, v2, Lcom/flyersoft/staticlayout/MyMarginSpan;->spEnd:I

    iget v4, p0, Lcom/flyersoft/staticlayout/MyMarginSpan;->spEnd:I

    if-ne v3, v4, :cond_0

    .line 534
    iget v2, v2, Lcom/flyersoft/staticlayout/MyMarginSpan;->bottomMargin:F

    add-float/2addr v0, v2

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return v0
.end method

.method private marginOfFloatSpan(Ljava/util/ArrayList;)F
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/staticlayout/MyMarginSpan;",
            ">;)F"
        }
    .end annotation

    .line 241
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/staticlayout/MyMarginSpan;

    .line 242
    instance-of v1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;

    if-eqz v1, :cond_0

    .line 243
    check-cast v0, Lcom/flyersoft/staticlayout/MyFloatSpan;

    .line 244
    iget v1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->spStart:I

    iget v2, p0, Lcom/flyersoft/staticlayout/MyMarginSpan;->spStart:I

    if-lt v1, v2, :cond_0

    iget v1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->spEnd:I

    iget v2, p0, Lcom/flyersoft/staticlayout/MyMarginSpan;->spEnd:I

    if-gt v1, v2, :cond_0

    .line 245
    iget-boolean p1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->isLeft:Z

    if-eqz p1, :cond_1

    iget p1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_width:F

    return p1

    :cond_1
    iget p1, v0, Lcom/flyersoft/staticlayout/MyFloatSpan;->float_width:F

    neg-float p1, p1

    return p1

    :cond_2
    const/4 p1, 0x0

    return p1
.end method

.method private setTileRepeat(Landroid/graphics/drawable/BitmapDrawable;Ljava/lang/String;)V
    .locals 3

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p2, :cond_0

    .line 389
    const-string v2, "repeat-x"

    invoke-virtual {p2, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v0, 0x1

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    if-eqz p2, :cond_1

    .line 391
    const-string v2, "repeat-y"

    invoke-virtual {p2, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    :goto_0
    if-eqz v0, :cond_2

    .line 394
    sget-object p2, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    invoke-virtual {p1, p2}, Landroid/graphics/drawable/BitmapDrawable;->setTileModeX(Landroid/graphics/Shader$TileMode;)V

    :cond_2
    if-eqz v1, :cond_3

    .line 396
    sget-object p2, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    invoke-virtual {p1, p2}, Landroid/graphics/drawable/BitmapDrawable;->setTileModeY(Landroid/graphics/Shader$TileMode;)V

    :cond_3
    return-void
.end method

.method public static sortDrawMargins(Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/staticlayout/MyMarginSpan;",
            ">;)V"
        }
    .end annotation

    if-eqz p0, :cond_1

    .line 540
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_0

    goto :goto_0

    .line 543
    :cond_0
    :try_start_0
    new-instance v0, Lcom/flyersoft/staticlayout/MyMarginSpan$MarginLevelComparable;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/flyersoft/staticlayout/MyMarginSpan$MarginLevelComparable;-><init>(Lcom/flyersoft/staticlayout/MyMarginSpan-IA;)V

    invoke-static {p0, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p0

    const/4 v0, 0x0

    .line 545
    invoke-static {p0, v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;Z)V

    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method protected drawBackgroundColor(Landroid/graphics/Canvas;IFFFFFLandroid/graphics/Paint;)V
    .locals 6

    if-nez p2, :cond_0

    return-void

    .line 413
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v0, v0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    iget-object v1, p0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/flyersoft/components/CSS;->getBorder([Ljava/lang/String;Landroid/graphics/RectF;I)F

    move-result v0

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v1

    mul-float v0, v0, v1

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    sub-float/2addr p3, v0

    .line 414
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v0, v0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    iget-object v3, p0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v3, v3, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    const/4 v4, 0x1

    invoke-static {v0, v3, v4}, Lcom/flyersoft/components/CSS;->getBorder([Ljava/lang/String;Landroid/graphics/RectF;I)F

    move-result v0

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v3

    mul-float v0, v0, v3

    div-float/2addr v0, v1

    sub-float/2addr p4, v0

    .line 415
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v0, v0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    iget-object v3, p0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v3, v3, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    const/4 v5, 0x2

    invoke-static {v0, v3, v5}, Lcom/flyersoft/components/CSS;->getBorder([Ljava/lang/String;Landroid/graphics/RectF;I)F

    move-result v0

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v3

    mul-float v0, v0, v3

    div-float/2addr v0, v1

    add-float/2addr p5, v0

    .line 416
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v0, v0, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    iget-object v3, p0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v3, v3, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    const/4 v5, 0x3

    invoke-static {v0, v3, v5}, Lcom/flyersoft/components/CSS;->getBorder([Ljava/lang/String;Landroid/graphics/RectF;I)F

    move-result v0

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v3

    mul-float v0, v0, v3

    div-float/2addr v0, v1

    add-float/2addr p6, v0

    const/high16 v0, -0x40800000    # -1.0f

    cmpl-float v1, p7, v0

    if-nez v1, :cond_1

    .line 418
    iget-object v1, p0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->css_text:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 419
    iget-object v1, p0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->css_text:Ljava/lang/String;

    const-string v3, "border-radius"

    invoke-virtual {v1, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v3, -0x1

    if-eq v1, v3, :cond_1

    .line 421
    iget-object v3, p0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v3, v3, Lcom/flyersoft/components/CSS$Style;->css_text:Ljava/lang/String;

    add-int/lit8 v1, v1, 0xe

    invoke-static {v3, v1, v4}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v1

    .line 422
    invoke-static {v1, v2}, Lcom/flyersoft/components/CSS;->getCssSize(Ljava/lang/String;Z)F

    move-result v1

    const/4 v2, 0x0

    cmpl-float v2, v1, v2

    if-lez v2, :cond_1

    .line 424
    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result p7

    mul-float p7, p7, v1

    .line 428
    :cond_1
    invoke-virtual {p8, p2}, Landroid/graphics/Paint;->setColor(I)V

    cmpl-float p2, p7, v0

    if-nez p2, :cond_2

    move p2, p3

    move p3, p4

    move p4, p5

    move p5, p6

    move-object p6, p8

    .line 430
    invoke-virtual/range {p1 .. p6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    return-void

    :cond_2
    move p2, p3

    move p3, p4

    move p4, p5

    move p5, p6

    move-object p6, p8

    .line 432
    new-instance p8, Landroid/graphics/RectF;

    invoke-direct {p8, p2, p3, p4, p5}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {p1, p8, p7, p7, p6}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    return-void
.end method

.method protected drawBackgroundImage(Landroid/graphics/Canvas;IIII)V
    .locals 20

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    move/from16 v2, p5

    .line 266
    iget-object v3, v1, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v3, v3, Lcom/flyersoft/components/CSS$Style;->backgroundImage:Ljava/lang/String;

    .line 267
    const-string v4, "("

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    const-string v5, ")"

    invoke-virtual {v3, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    const/4 v6, -0x1

    if-eq v4, v6, :cond_28

    if-le v5, v4, :cond_28

    const/4 v6, 0x1

    add-int/2addr v4, v6

    .line 269
    :try_start_0
    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 270
    invoke-static {v3}, Lcom/flyersoft/tools/T;->deleteQuotes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 271
    invoke-direct {v1, v3}, Lcom/flyersoft/staticlayout/MyMarginSpan;->getCachedDrawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    if-nez v3, :cond_0

    goto/16 :goto_13

    :cond_0
    const/4 v4, 0x0

    if-gez p2, :cond_1

    const/4 v5, 0x0

    goto :goto_0

    :cond_1
    move/from16 v5, p2

    :goto_0
    if-gez p3, :cond_2

    const/4 v7, 0x0

    goto :goto_1

    :cond_2
    move/from16 v7, p3

    .line 278
    :goto_1
    invoke-static {}, Lcom/flyersoft/tools/A;->getPageWidth()I

    move-result v8

    move/from16 v9, p4

    if-le v9, v8, :cond_3

    invoke-static {}, Lcom/flyersoft/tools/A;->getPageWidth()I

    move-result v8

    goto :goto_2

    :cond_3
    move v8, v9

    .line 280
    :goto_2
    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v9

    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v10

    sub-int v11, v8, v5

    sub-int v12, v2, v7

    if-lez v9, :cond_28

    if-gtz v10, :cond_4

    goto/16 :goto_13

    .line 285
    :cond_4
    iget-object v13, v1, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v13, v13, Lcom/flyersoft/components/CSS$Style;->css_text:Ljava/lang/String;

    if-eqz v13, :cond_5

    iget-object v13, v1, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v13, v13, Lcom/flyersoft/components/CSS$Style;->css_text:Ljava/lang/String;

    goto :goto_3

    :cond_5
    const-string v13, ""

    .line 286
    :goto_3
    const-string v14, "no-repeat"

    invoke-virtual {v13, v14}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v14

    .line 287
    const-string v15, "contain;"

    invoke-virtual {v13, v15}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v15

    if-nez v15, :cond_6

    .line 288
    const-string v6, "cover;"

    invoke-virtual {v13, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_6

    const/16 p2, 0x1

    goto :goto_4

    :cond_6
    const/16 p2, 0x0

    .line 291
    :goto_4
    const-string v6, "background-size"

    invoke-static {v13, v6, v4}, Lcom/flyersoft/components/CSS;->propertyTagValue(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v6

    .line 292
    invoke-static {v6}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v16

    if-nez v16, :cond_8

    .line 293
    const-string v4, "100%"

    invoke-virtual {v6, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 294
    invoke-virtual {v3, v5, v7, v8, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 295
    invoke-virtual {v3, v0}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    return-void

    .line 298
    :cond_7
    const-string v4, "px"

    invoke-virtual {v6, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_8

    goto/16 :goto_13

    .line 311
    :cond_8
    iget-object v4, v1, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v4, v4, Lcom/flyersoft/components/CSS$Style;->backgroundPosition:Ljava/lang/String;

    if-eqz v4, :cond_1e

    if-gt v9, v11, :cond_9

    if-le v10, v12, :cond_b

    :cond_9
    int-to-float v4, v10

    int-to-float v6, v12

    div-float/2addr v4, v6

    int-to-float v6, v9

    move/from16 p4, v4

    int-to-float v4, v11

    div-float/2addr v6, v4

    cmpl-float v4, p4, v6

    if-lez v4, :cond_a

    .line 314
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    mul-int v9, v9, v12

    div-int/2addr v9, v10

    invoke-static {v4, v3, v9, v12}, Lcom/flyersoft/tools/T;->zoomDrawable(Landroid/content/res/Resources;Landroid/graphics/drawable/Drawable;II)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    goto :goto_5

    .line 316
    :cond_a
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    mul-int v10, v10, v11

    div-int/2addr v10, v9

    invoke-static {v4, v3, v11, v10}, Lcom/flyersoft/tools/T;->zoomDrawable(Landroid/content/res/Resources;Landroid/graphics/drawable/Drawable;II)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 317
    :goto_5
    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v9

    .line 318
    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v10

    .line 321
    :cond_b
    iget-object v4, v1, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v4, v4, Lcom/flyersoft/components/CSS$Style;->backgroundPosition:Ljava/lang/String;

    .line 323
    const-string v6, "top"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    const/high16 v17, 0x3f800000    # 1.0f

    if-nez v6, :cond_1b

    const-string v6, "top center"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_c

    goto/16 :goto_d

    .line 326
    :cond_c
    const-string v6, "top left"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_d

    .line 327
    new-instance v4, Landroid/graphics/Rect;

    const/4 v6, 0x0

    invoke-direct {v4, v6, v6, v9, v10}, Landroid/graphics/Rect;-><init>(IIII)V

    move/from16 v19, v8

    move/from16 p4, v14

    :goto_6
    move/from16 v18, v15

    goto/16 :goto_e

    .line 328
    :cond_d
    const-string v6, "top right"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_e

    .line 329
    new-instance v4, Landroid/graphics/Rect;

    sub-int v6, v11, v9

    move/from16 p4, v14

    const/4 v14, 0x0

    invoke-direct {v4, v6, v14, v11, v10}, Landroid/graphics/Rect;-><init>(IIII)V

    :goto_7
    move/from16 v19, v8

    goto :goto_6

    :cond_e
    move/from16 p4, v14

    .line 330
    const-string v6, "center"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_19

    const-string v6, "center center"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_f

    goto/16 :goto_c

    .line 333
    :cond_f
    const-string v6, "center left"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_18

    const-string v6, "left"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_10

    goto/16 :goto_a

    .line 335
    :cond_10
    const-string v6, "center right"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_17

    const-string v6, "right"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_11

    goto/16 :goto_9

    .line 337
    :cond_11
    const-string v6, "bottom"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_15

    const-string v6, "bottom center"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_15

    const-string v6, "center bottom"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_12

    goto :goto_8

    .line 340
    :cond_12
    const-string v6, "bottom left"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_13

    .line 341
    new-instance v4, Landroid/graphics/Rect;

    sub-int v6, v12, v10

    const/4 v14, 0x0

    invoke-direct {v4, v14, v6, v9, v12}, Landroid/graphics/Rect;-><init>(IIII)V

    goto :goto_7

    .line 342
    :cond_13
    const-string v6, "bottom right"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_14

    .line 343
    new-instance v4, Landroid/graphics/Rect;

    sub-int v6, v11, v9

    sub-int v14, v12, v10

    invoke-direct {v4, v6, v14, v11, v12}, Landroid/graphics/Rect;-><init>(IIII)V

    goto :goto_7

    :cond_14
    move/from16 v19, v8

    move/from16 v18, v15

    const/4 v4, 0x0

    goto/16 :goto_e

    :cond_15
    :goto_8
    if-eqz p4, :cond_16

    .line 338
    new-instance v4, Landroid/graphics/Rect;

    sub-int v6, v11, v9

    div-int/lit8 v14, v6, 0x2

    move/from16 v17, v6

    sub-int v6, v12, v10

    div-int/lit8 v17, v17, 0x2

    move/from16 v18, v15

    add-int v15, v17, v9

    invoke-direct {v4, v14, v6, v15, v12}, Landroid/graphics/Rect;-><init>(IIII)V

    goto :goto_b

    :cond_16
    move/from16 v18, v15

    .line 339
    new-instance v4, Landroid/graphics/Rect;

    sub-int v6, v12, v10

    invoke-static/range {v17 .. v17}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v14

    add-int/2addr v6, v14

    const/4 v14, 0x0

    invoke-direct {v4, v14, v6, v11, v12}, Landroid/graphics/Rect;-><init>(IIII)V

    goto :goto_b

    :cond_17
    :goto_9
    move/from16 v18, v15

    .line 336
    new-instance v4, Landroid/graphics/Rect;

    sub-int v6, v11, v9

    sub-int v14, v12, v10

    div-int/lit8 v15, v14, 0x2

    div-int/lit8 v14, v14, 0x2

    add-int/2addr v14, v10

    invoke-direct {v4, v6, v15, v11, v14}, Landroid/graphics/Rect;-><init>(IIII)V

    goto :goto_b

    :cond_18
    :goto_a
    move/from16 v18, v15

    .line 334
    new-instance v4, Landroid/graphics/Rect;

    sub-int v6, v12, v10

    div-int/lit8 v14, v6, 0x2

    div-int/lit8 v6, v6, 0x2

    add-int/2addr v6, v10

    const/4 v15, 0x0

    invoke-direct {v4, v15, v14, v9, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    :goto_b
    move/from16 v19, v8

    goto :goto_e

    :cond_19
    :goto_c
    move/from16 v18, v15

    if-eqz p4, :cond_1a

    .line 331
    new-instance v4, Landroid/graphics/Rect;

    sub-int v6, v11, v9

    div-int/lit8 v14, v6, 0x2

    sub-int v15, v12, v10

    move/from16 v17, v6

    div-int/lit8 v6, v15, 0x2

    div-int/lit8 v17, v17, 0x2

    move/from16 v19, v15

    add-int v15, v17, v9

    div-int/lit8 v17, v19, 0x2

    move/from16 v19, v8

    add-int v8, v17, v10

    invoke-direct {v4, v14, v6, v15, v8}, Landroid/graphics/Rect;-><init>(IIII)V

    goto :goto_e

    :cond_1a
    move/from16 v19, v8

    .line 332
    new-instance v4, Landroid/graphics/Rect;

    sub-int v6, v12, v10

    div-int/lit8 v8, v6, 0x2

    div-int/lit8 v6, v6, 0x2

    add-int/2addr v6, v10

    invoke-static/range {v17 .. v17}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v14

    sub-int/2addr v6, v14

    const/4 v14, 0x0

    invoke-direct {v4, v14, v8, v11, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    goto :goto_e

    :cond_1b
    :goto_d
    move/from16 v19, v8

    move/from16 p4, v14

    move/from16 v18, v15

    if-eqz p4, :cond_1c

    .line 324
    new-instance v4, Landroid/graphics/Rect;

    sub-int v6, v11, v9

    div-int/lit8 v8, v6, 0x2

    div-int/lit8 v6, v6, 0x2

    add-int/2addr v6, v9

    const/4 v14, 0x0

    invoke-direct {v4, v8, v14, v6, v10}, Landroid/graphics/Rect;-><init>(IIII)V

    goto :goto_e

    .line 325
    :cond_1c
    new-instance v4, Landroid/graphics/Rect;

    invoke-static/range {v17 .. v17}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v6

    sub-int v6, v10, v6

    const/4 v14, 0x0

    invoke-direct {v4, v14, v14, v11, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    :goto_e
    if-eqz v4, :cond_1f

    .line 345
    new-instance v2, Landroid/graphics/Rect;

    iget v6, v4, Landroid/graphics/Rect;->left:I

    add-int/2addr v6, v5

    iget v8, v4, Landroid/graphics/Rect;->top:I

    add-int/2addr v8, v7

    iget v11, v4, Landroid/graphics/Rect;->right:I

    add-int/2addr v11, v5

    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v4, v7

    invoke-direct {v2, v6, v8, v11, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    if-nez p4, :cond_1d

    .line 346
    instance-of v4, v3, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v4, :cond_1d

    .line 347
    move-object v4, v3

    check-cast v4, Landroid/graphics/drawable/BitmapDrawable;

    const/4 v5, 0x0

    invoke-direct {v1, v4, v5}, Lcom/flyersoft/staticlayout/MyMarginSpan;->setTileRepeat(Landroid/graphics/drawable/BitmapDrawable;Ljava/lang/String;)V

    .line 348
    invoke-virtual {v3, v2}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 349
    invoke-virtual {v3, v0}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    return-void

    .line 351
    :cond_1d
    invoke-static {v3}, Lcom/flyersoft/tools/T;->drawableToBitmap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 352
    new-instance v4, Landroid/graphics/Rect;

    const/4 v14, 0x0

    invoke-direct {v4, v14, v14, v9, v10}, Landroid/graphics/Rect;-><init>(IIII)V

    const/4 v5, 0x0

    invoke-virtual {v0, v3, v4, v2, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    return-void

    :cond_1e
    move/from16 v19, v8

    move/from16 p4, v14

    move/from16 v18, v15

    :cond_1f
    if-eqz v18, :cond_21

    int-to-float v4, v10

    int-to-float v6, v12

    div-float/2addr v4, v6

    int-to-float v6, v9

    int-to-float v8, v11

    div-float/2addr v6, v8

    cmpl-float v4, v4, v6

    if-lez v4, :cond_20

    .line 361
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    mul-int v9, v9, v12

    div-int/2addr v9, v10

    invoke-static {v4, v3, v9, v12}, Lcom/flyersoft/tools/T;->zoomDrawable(Landroid/content/res/Resources;Landroid/graphics/drawable/Drawable;II)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    goto :goto_f

    .line 363
    :cond_20
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    mul-int v10, v10, v11

    div-int/2addr v10, v9

    invoke-static {v4, v3, v11, v10}, Lcom/flyersoft/tools/T;->zoomDrawable(Landroid/content/res/Resources;Landroid/graphics/drawable/Drawable;II)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    goto :goto_f

    :cond_21
    if-eqz p2, :cond_22

    .line 365
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    mul-int v10, v10, v11

    div-int/2addr v10, v9

    invoke-static {v4, v3, v11, v10}, Lcom/flyersoft/tools/T;->zoomDrawable(Landroid/content/res/Resources;Landroid/graphics/drawable/Drawable;II)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    :cond_22
    :goto_f
    if-nez p4, :cond_23

    .line 367
    instance-of v4, v3, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v4, :cond_23

    .line 368
    move-object v4, v3

    check-cast v4, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v1, v4, v13}, Lcom/flyersoft/staticlayout/MyMarginSpan;->setTileRepeat(Landroid/graphics/drawable/BitmapDrawable;Ljava/lang/String;)V

    :cond_23
    if-eqz p2, :cond_25

    .line 372
    invoke-static {v3}, Lcom/flyersoft/tools/T;->drawableToBitmap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    move-result-object v4

    .line 373
    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v6

    if-le v6, v2, :cond_24

    move v6, v2

    goto :goto_10

    :cond_24
    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v6

    .line 374
    :goto_10
    new-instance v8, Landroid/graphics/Rect;

    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v3

    const/4 v14, 0x0

    invoke-direct {v8, v14, v14, v3, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    new-instance v3, Landroid/graphics/RectF;

    int-to-float v5, v5

    int-to-float v6, v7

    move/from16 v9, v19

    int-to-float v7, v9

    int-to-float v2, v2

    invoke-direct {v3, v5, v6, v7, v2}, Landroid/graphics/RectF;-><init>(FFFF)V

    const/4 v5, 0x0

    invoke-virtual {v0, v4, v8, v3, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    return-void

    :cond_25
    move/from16 v9, v19

    if-nez v18, :cond_27

    if-eqz p4, :cond_26

    goto :goto_11

    .line 379
    :cond_26
    invoke-virtual {v3, v5, v7, v9, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    goto :goto_12

    .line 377
    :cond_27
    :goto_11
    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    add-int/2addr v2, v5

    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v4

    add-int/2addr v4, v7

    invoke-virtual {v3, v5, v7, v2, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 380
    :goto_12
    invoke-virtual {v3, v0}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 383
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_28
    :goto_13
    return-void
.end method

.method public drawFrameMargin(Landroid/graphics/Canvas;Landroid/text/TextPaint;Lcom/flyersoft/staticlayout/MRTextView;Ljava/util/ArrayList;I)V
    .locals 23
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

    move-object/from16 v9, p3

    move-object/from16 v10, p4

    move/from16 v1, p5

    .line 78
    iget-object v2, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    if-nez v2, :cond_0

    goto/16 :goto_13

    .line 80
    :cond_0
    iget-object v2, v2, Lcom/flyersoft/components/CSS$Style;->backgroundImage:Ljava/lang/String;

    if-nez v2, :cond_1

    iget-object v2, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    invoke-static {v2}, Lcom/flyersoft/components/CSS;->hasBorderOrBackgroundColor(Lcom/flyersoft/components/CSS$Style;)Z

    move-result v2

    if-nez v2, :cond_1

    goto/16 :goto_13

    .line 82
    :cond_1
    invoke-virtual {v9}, Lcom/flyersoft/staticlayout/MRTextView;->lastIgnoreLine()I

    move-result v2

    if-lez v2, :cond_2

    iget v2, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->startLine:I

    invoke-virtual {v9}, Lcom/flyersoft/staticlayout/MRTextView;->lastIgnoreLine()I

    move-result v3

    if-lt v2, v3, :cond_2

    goto/16 :goto_13

    .line 84
    :cond_2
    iget v2, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->startLine:I

    iget v3, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->endLine:I

    if-ne v2, v3, :cond_3

    .line 85
    invoke-virtual {v9, v2}, Lcom/flyersoft/staticlayout/MRTextView;->isLastHalfLine(I)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 86
    iget v2, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->startLine:I

    invoke-virtual {v9, v2}, Lcom/flyersoft/staticlayout/MRTextView;->isNormalImageLine(I)Z

    move-result v2

    if-nez v2, :cond_3

    goto/16 :goto_13

    .line 89
    :cond_3
    iput v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->fromIndex:I

    .line 90
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MyMarginSpan;->getBackgroundColor()I

    move-result v2

    .line 92
    iget v3, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->startLine:I

    const/4 v11, 0x0

    .line 93
    iput v11, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->l:F

    const/4 v12, 0x0

    .line 94
    invoke-virtual {v0, v10, v12}, Lcom/flyersoft/staticlayout/MyMarginSpan;->outerHoriMargins(Ljava/util/ArrayList;I)F

    move-result v4

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v5

    mul-float v4, v4, v5

    add-float/2addr v4, v11

    iput v4, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->l:F

    .line 95
    iget v5, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->leftMargin:F

    iget v6, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->leftPadding:F

    sub-float/2addr v5, v6

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v6

    mul-float v5, v5, v6

    add-float/2addr v4, v5

    iput v4, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->l:F

    .line 97
    iget v4, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->start:I

    if-nez v4, :cond_4

    const/4 v5, 0x0

    goto :goto_0

    :cond_4
    iget v5, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->top:I

    int-to-float v5, v5

    :goto_0
    iput v5, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->t:F

    .line 98
    iget v5, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->spStart:I

    if-eq v4, v5, :cond_6

    .line 99
    invoke-virtual {v9}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v3

    iget v4, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->spStart:I

    invoke-virtual {v3, v4}, Lcom/flyersoft/staticlayout/MyLayout;->getLineForOffset(I)I

    move-result v3

    if-nez v3, :cond_5

    const/4 v4, 0x0

    goto :goto_1

    .line 100
    :cond_5
    invoke-virtual {v9, v3}, Lcom/flyersoft/staticlayout/MRTextView;->getLineTop(I)I

    move-result v4

    int-to-float v4, v4

    :goto_1
    iput v4, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->t:F

    .line 102
    :cond_6
    iget v4, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->t:F

    invoke-virtual {v0, v10}, Lcom/flyersoft/staticlayout/MyMarginSpan;->outerTopMargins(Ljava/util/ArrayList;)F

    move-result v5

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v6

    mul-float v5, v5, v6

    add-float/2addr v4, v5

    iput v4, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->t:F

    .line 103
    iget v5, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->topMargin:F

    iget v6, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->topPadding:F

    sub-float/2addr v5, v6

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v6

    mul-float v5, v5, v6

    add-float/2addr v4, v5

    iput v4, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->t:F

    .line 104
    invoke-virtual {v9}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v5

    invoke-virtual {v5, v3}, Lcom/flyersoft/staticlayout/MyLayout;->getLineTopAdded2(I)I

    move-result v3

    int-to-float v3, v3

    add-float/2addr v4, v3

    iput v4, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->t:F

    .line 106
    invoke-virtual {v9}, Lcom/flyersoft/staticlayout/MRTextView;->getWidth2()I

    move-result v3

    int-to-float v3, v3

    iput v3, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->r:F

    const/4 v13, 0x2

    .line 107
    invoke-virtual {v0, v10, v13}, Lcom/flyersoft/staticlayout/MyMarginSpan;->outerHoriMargins(Ljava/util/ArrayList;I)F

    move-result v4

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v5

    mul-float v4, v4, v5

    sub-float/2addr v3, v4

    iput v3, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->r:F

    .line 108
    iget v4, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->rightMargin:F

    iget v5, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->rightPadding:F

    sub-float/2addr v4, v5

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v5

    mul-float v4, v4, v5

    sub-float/2addr v3, v4

    iput v3, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->r:F

    .line 110
    iget v3, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->spEnd:I

    iget v4, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->end:I

    add-int/lit8 v5, v4, 0x1

    const/4 v14, 0x1

    if-eq v3, v5, :cond_8

    if-ne v3, v4, :cond_7

    invoke-virtual {v9}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    move-result v3

    if-ne v4, v3, :cond_7

    goto :goto_2

    :cond_7
    const/4 v3, 0x0

    goto :goto_3

    :cond_8
    :goto_2
    const/4 v3, 0x1

    :goto_3
    if-eqz v3, :cond_9

    .line 111
    iget v4, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->endLine:I

    goto :goto_4

    :cond_9
    invoke-virtual {v9}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v4

    iget v5, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->spEnd:I

    sub-int/2addr v5, v14

    invoke-virtual {v4, v5}, Lcom/flyersoft/staticlayout/MyLayout;->getLineForOffset(I)I

    move-result v4

    :goto_4
    if-eqz v3, :cond_a

    .line 112
    iget v3, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->bottom:I

    goto :goto_5

    :cond_a
    add-int/2addr v4, v14

    invoke-virtual {v9, v4}, Lcom/flyersoft/staticlayout/MRTextView;->getLineTop(I)I

    move-result v3

    :goto_5
    int-to-float v3, v3

    iput v3, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->b:F

    .line 114
    iget v3, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->bottomPadding:F

    .line 115
    invoke-direct {v0, v10}, Lcom/flyersoft/staticlayout/MyMarginSpan;->innerBottomMargins(Ljava/util/ArrayList;)F

    move-result v4

    add-float/2addr v3, v4

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v4

    mul-float v3, v3, v4

    .line 116
    iget v4, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->b:F

    add-float/2addr v4, v3

    iput v4, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->b:F

    .line 118
    invoke-virtual {v9}, Lcom/flyersoft/staticlayout/MRTextView;->getRealHeight()I

    move-result v3

    int-to-float v3, v3

    cmpl-float v3, v4, v3

    if-lez v3, :cond_b

    .line 119
    invoke-virtual {v9}, Lcom/flyersoft/staticlayout/MRTextView;->getRealHeight()I

    move-result v3

    int-to-float v3, v3

    iput v3, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->b:F

    .line 121
    :cond_b
    iget v3, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->t:F

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-static {v4}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v5

    sub-float/2addr v3, v5

    iput v3, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->t:F

    .line 122
    iget v3, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->b:F

    invoke-static {v4}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v4

    sub-float/2addr v3, v4

    iput v3, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->b:F

    .line 124
    invoke-direct {v0, v3, v10}, Lcom/flyersoft/staticlayout/MyMarginSpan;->extendBottomFromFloatSpan(FLjava/util/ArrayList;)F

    move-result v3

    .line 126
    invoke-virtual {v9}, Lcom/flyersoft/staticlayout/MRTextView;->lastIgnoreLine()I

    move-result v4

    if-lez v4, :cond_c

    invoke-virtual {v9}, Lcom/flyersoft/staticlayout/MRTextView;->lastIgnoreLine()I

    move-result v4

    invoke-virtual {v9, v4}, Lcom/flyersoft/staticlayout/MRTextView;->getLineTop2(I)I

    move-result v4

    goto :goto_6

    :cond_c
    const/4 v4, 0x0

    :goto_6
    if-lez v4, :cond_d

    int-to-float v4, v4

    cmpl-float v5, v3, v4

    if-lez v5, :cond_d

    move v6, v4

    goto :goto_7

    :cond_d
    move v6, v3

    .line 131
    :goto_7
    iget-object v4, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    invoke-static {v4}, Lcom/flyersoft/components/CSS;->hasBorder(Lcom/flyersoft/components/CSS$Style;)Z

    move-result v4

    const/4 v15, 0x3

    const/high16 v16, 0x40000000    # 2.0f

    if-eqz v4, :cond_1d

    .line 132
    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    .line 133
    iget-object v4, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v4, v4, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    iget-object v5, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v5, v5, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    invoke-static {v4, v5, v12}, Lcom/flyersoft/components/CSS;->getBorder([Ljava/lang/String;Landroid/graphics/RectF;I)F

    move-result v17

    .line 134
    iget-object v4, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v4, v4, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    iget-object v5, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v5, v5, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    invoke-static {v4, v5, v14}, Lcom/flyersoft/components/CSS;->getBorder([Ljava/lang/String;Landroid/graphics/RectF;I)F

    move-result v18

    .line 135
    iget-object v4, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v4, v4, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    iget-object v5, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v5, v5, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    invoke-static {v4, v5, v13}, Lcom/flyersoft/components/CSS;->getBorder([Ljava/lang/String;Landroid/graphics/RectF;I)F

    move-result v19

    .line 136
    iget-object v4, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v4, v4, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    iget-object v5, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v5, v5, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    invoke-static {v4, v5, v15}, Lcom/flyersoft/components/CSS;->getBorder([Ljava/lang/String;Landroid/graphics/RectF;I)F

    move-result v20

    .line 137
    iget v4, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->l:F

    div-float v5, v17, v16

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v7

    mul-float v5, v5, v7

    sub-float/2addr v4, v5

    iput v4, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->l:F

    .line 138
    iget v4, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->t:F

    div-float v5, v18, v16

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v7

    mul-float v5, v5, v7

    sub-float/2addr v4, v5

    iput v4, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->t:F

    .line 139
    iget v4, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->r:F

    div-float v5, v19, v16

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v7

    mul-float v5, v5, v7

    add-float/2addr v4, v5

    iput v4, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->r:F

    .line 141
    iget-object v4, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v4, v4, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    iget-object v5, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v5, v5, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    invoke-virtual {v0, v1, v4, v5}, Lcom/flyersoft/staticlayout/MyMarginSpan;->sameBorders(Landroid/graphics/RectF;[Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_13

    .line 142
    iput v3, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->b:F

    .line 143
    invoke-virtual {v9}, Lcom/flyersoft/staticlayout/MRTextView;->getRealLineCount()I

    move-result v1

    invoke-virtual {v9, v1}, Lcom/flyersoft/staticlayout/MRTextView;->getLineTop3(I)I

    move-result v1

    int-to-float v1, v1

    cmpl-float v1, v3, v1

    if-lez v1, :cond_e

    .line 144
    invoke-virtual {v9}, Lcom/flyersoft/staticlayout/MRTextView;->getRealLineCount()I

    move-result v1

    invoke-virtual {v9, v1}, Lcom/flyersoft/staticlayout/MRTextView;->getLineTop3(I)I

    move-result v1

    sub-int/2addr v1, v14

    int-to-float v1, v1

    iput v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->b:F

    .line 146
    :cond_e
    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v1

    mul-float v9, v17, v1

    .line 147
    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    aget-object v10, v1, v12

    .line 148
    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    if-nez v1, :cond_f

    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->color:Ljava/lang/String;

    goto :goto_8

    :cond_f
    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    aget-object v1, v1, v12

    :goto_8
    invoke-virtual {v0, v1, v10}, Lcom/flyersoft/staticlayout/MyMarginSpan;->getBorderColor(Ljava/lang/String;Ljava/lang/String;)I

    move-result v12

    .line 149
    new-instance v22, Landroid/graphics/Paint;

    invoke-direct/range {v22 .. v22}, Landroid/graphics/Paint;-><init>()V

    .line 151
    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->borderRadius:Ljava/lang/Float;

    if-eqz v1, :cond_11

    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->borderRadius:Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    cmpl-float v1, v1, v11

    if-nez v1, :cond_10

    goto :goto_9

    .line 162
    :cond_10
    invoke-static {v9}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v7

    .line 163
    iget v3, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->l:F

    iget v4, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->t:F

    iget v5, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->r:F

    move-object/from16 v1, p1

    move-object/from16 v8, v22

    invoke-virtual/range {v0 .. v8}, Lcom/flyersoft/staticlayout/MyMarginSpan;->drawBackgroundColor(Landroid/graphics/Canvas;IFFFFFLandroid/graphics/Paint;)V

    .line 164
    invoke-virtual {v8, v12}, Landroid/graphics/Paint;->setColor(I)V

    .line 165
    invoke-virtual {v0, v8, v10, v9}, Lcom/flyersoft/staticlayout/MyMarginSpan;->updatePaintStyles(Landroid/graphics/Paint;Ljava/lang/String;F)Z

    .line 166
    new-instance v1, Landroid/graphics/RectF;

    iget v2, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->l:F

    iget v3, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->t:F

    iget v4, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->r:F

    iget v5, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->b:F

    invoke-direct {v1, v2, v3, v4, v5}, Landroid/graphics/RectF;-><init>(FFFF)V

    move-object/from16 v2, p1

    invoke-virtual {v2, v1, v7, v7, v8}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    goto/16 :goto_12

    :cond_11
    :goto_9
    move-object/from16 v8, v22

    .line 152
    iget v3, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->l:F

    iget v4, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->t:F

    iget v5, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->r:F

    const/high16 v7, -0x40800000    # -1.0f

    move-object/from16 v1, p1

    invoke-virtual/range {v0 .. v8}, Lcom/flyersoft/staticlayout/MyMarginSpan;->drawBackgroundColor(Landroid/graphics/Canvas;IFFFFFLandroid/graphics/Paint;)V

    .line 153
    invoke-virtual {v8, v12}, Landroid/graphics/Paint;->setColor(I)V

    .line 154
    invoke-virtual {v0, v8, v10, v9}, Lcom/flyersoft/staticlayout/MyMarginSpan;->updatePaintStyles(Landroid/graphics/Paint;Ljava/lang/String;F)Z

    .line 155
    const-string v1, "double"

    invoke-virtual {v10, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_12

    const/high16 v1, 0x40400000    # 3.0f

    div-float v1, v9, v1

    .line 156
    invoke-virtual {v8, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 157
    iget v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->l:F

    iget v2, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->t:F

    iget v3, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->r:F

    iget v4, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->b:F

    move-object/from16 v17, p1

    move/from16 v18, v1

    move/from16 v19, v2

    move/from16 v20, v3

    move/from16 v21, v4

    move-object/from16 v22, v8

    invoke-virtual/range {v17 .. v22}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 158
    iget v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->l:F

    div-float v9, v9, v16

    add-float v18, v1, v9

    iget v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->t:F

    add-float v19, v1, v9

    iget v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->r:F

    sub-float v20, v1, v9

    iget v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->b:F

    sub-float v21, v1, v9

    invoke-virtual/range {v17 .. v22}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_12

    .line 160
    :cond_12
    iget v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->l:F

    iget v2, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->t:F

    iget v3, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->r:F

    iget v4, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->b:F

    move-object/from16 v17, p1

    move/from16 v18, v1

    move/from16 v19, v2

    move/from16 v20, v3

    move/from16 v21, v4

    move-object/from16 v22, v8

    invoke-virtual/range {v17 .. v22}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_12

    .line 170
    :cond_13
    iget v3, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->l:F

    iget v4, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->t:F

    iget v5, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->r:F

    new-instance v8, Landroid/graphics/Paint;

    invoke-direct {v8}, Landroid/graphics/Paint;-><init>()V

    const/high16 v7, -0x40800000    # -1.0f

    move-object/from16 v1, p1

    invoke-virtual/range {v0 .. v8}, Lcom/flyersoft/staticlayout/MyMarginSpan;->drawBackgroundColor(Landroid/graphics/Canvas;IFFFFFLandroid/graphics/Paint;)V

    .line 172
    invoke-direct {v0, v10}, Lcom/flyersoft/staticlayout/MyMarginSpan;->marginOfFloatSpan(Ljava/util/ArrayList;)F

    move-result v1

    cmpl-float v2, v1, v11

    if-eqz v2, :cond_15

    if-lez v2, :cond_14

    .line 174
    iget v2, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->l:F

    cmpg-float v2, v2, v1

    if-gez v2, :cond_14

    .line 175
    iput v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->l:F

    goto :goto_a

    :cond_14
    cmpg-float v2, v1, v11

    if-gez v2, :cond_15

    .line 176
    iget v2, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->r:F

    invoke-virtual {v9}, Lcom/flyersoft/staticlayout/MRTextView;->getWidth2()I

    move-result v3

    int-to-float v3, v3

    add-float/2addr v3, v1

    cmpl-float v2, v2, v3

    if-lez v2, :cond_15

    .line 177
    invoke-virtual {v9}, Lcom/flyersoft/staticlayout/MRTextView;->getWidth2()I

    move-result v2

    int-to-float v2, v2

    add-float/2addr v2, v1

    iput v2, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->r:F

    :cond_15
    :goto_a
    cmpl-float v1, v17, v11

    if-lez v1, :cond_17

    .line 180
    iget v3, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->l:F

    iget v4, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->t:F

    iget v6, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->b:F

    .line 181
    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    if-nez v1, :cond_16

    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->color:Ljava/lang/String;

    goto :goto_b

    :cond_16
    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    aget-object v1, v1, v12

    :goto_b
    move-object v8, v1

    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    aget-object v9, v1, v12

    const/4 v1, 0x0

    move v5, v3

    move-object/from16 v2, p1

    move/from16 v7, v17

    .line 180
    invoke-virtual/range {v0 .. v9}, Lcom/flyersoft/staticlayout/MyMarginSpan;->drawLine(ILandroid/graphics/Canvas;FFFFFLjava/lang/String;Ljava/lang/String;)V

    :cond_17
    cmpl-float v1, v18, v11

    if-lez v1, :cond_19

    .line 182
    iget v3, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->l:F

    iget v4, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->t:F

    iget v5, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->r:F

    .line 183
    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    if-nez v1, :cond_18

    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->color:Ljava/lang/String;

    goto :goto_c

    :cond_18
    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    aget-object v1, v1, v14

    :goto_c
    move-object v8, v1

    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    aget-object v9, v1, v14

    const/4 v1, 0x1

    move v6, v4

    move-object/from16 v2, p1

    move/from16 v7, v18

    .line 182
    invoke-virtual/range {v0 .. v9}, Lcom/flyersoft/staticlayout/MyMarginSpan;->drawLine(ILandroid/graphics/Canvas;FFFFFLjava/lang/String;Ljava/lang/String;)V

    :cond_19
    cmpl-float v1, v19, v11

    if-lez v1, :cond_1b

    .line 184
    iget v3, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->r:F

    iget v4, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->t:F

    iget v6, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->b:F

    .line 185
    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    if-nez v1, :cond_1a

    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->color:Ljava/lang/String;

    goto :goto_d

    :cond_1a
    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    aget-object v1, v1, v13

    :goto_d
    move-object v8, v1

    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    aget-object v9, v1, v13

    const/4 v1, 0x2

    move v5, v3

    move-object/from16 v2, p1

    move/from16 v7, v19

    .line 184
    invoke-virtual/range {v0 .. v9}, Lcom/flyersoft/staticlayout/MyMarginSpan;->drawLine(ILandroid/graphics/Canvas;FFFFFLjava/lang/String;Ljava/lang/String;)V

    :cond_1b
    cmpl-float v1, v20, v11

    if-lez v1, :cond_24

    .line 186
    iget v3, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->l:F

    iget v4, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->b:F

    iget v5, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->r:F

    .line 187
    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    if-nez v1, :cond_1c

    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->color:Ljava/lang/String;

    goto :goto_e

    :cond_1c
    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->borderColor:[Ljava/lang/String;

    aget-object v1, v1, v15

    :goto_e
    move-object v8, v1

    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    aget-object v9, v1, v15

    const/4 v1, 0x3

    move v6, v4

    move-object/from16 v2, p1

    move/from16 v7, v20

    .line 186
    invoke-virtual/range {v0 .. v9}, Lcom/flyersoft/staticlayout/MyMarginSpan;->drawLine(ILandroid/graphics/Canvas;FFFFFLjava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_12

    :cond_1d
    add-int/2addr v1, v14

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 191
    :goto_f
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v1, v5, :cond_20

    .line 192
    invoke-virtual {v10, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/flyersoft/staticlayout/MyMarginSpan;

    .line 193
    iget-object v7, v5, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    if-eqz v7, :cond_1f

    .line 194
    iget-object v7, v7, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    iget-object v8, v5, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v8, v8, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    invoke-static {v7, v8, v15}, Lcom/flyersoft/components/CSS;->getBorder([Ljava/lang/String;Landroid/graphics/RectF;I)F

    move-result v7

    cmpl-float v8, v7, v11

    if-lez v8, :cond_1f

    .line 196
    iget v5, v5, Lcom/flyersoft/staticlayout/MyMarginSpan;->spEnd:I

    iget v8, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->spStart:I

    if-ne v5, v8, :cond_1e

    move v3, v7

    goto :goto_10

    .line 198
    :cond_1e
    iget v8, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->spEnd:I

    if-ne v5, v8, :cond_1f

    move v4, v7

    :cond_1f
    :goto_10
    add-int/lit8 v1, v1, 0x1

    goto :goto_f

    :cond_20
    cmpl-float v1, v3, v11

    if-nez v1, :cond_21

    cmpl-float v5, v4, v11

    if-nez v5, :cond_21

    .line 204
    iget v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->t:F

    const/high16 v3, 0x3fc00000    # 1.5f

    invoke-static {v3}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v4

    sub-float/2addr v1, v4

    iput v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->t:F

    .line 205
    iget v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->b:F

    invoke-static {v3}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v3

    sub-float/2addr v1, v3

    iput v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->b:F

    goto :goto_11

    :cond_21
    if-lez v1, :cond_22

    .line 208
    iget v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->t:F

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v5

    mul-float v3, v3, v5

    div-float v3, v3, v16

    add-float/2addr v1, v3

    iput v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->t:F

    :cond_22
    cmpl-float v1, v4, v11

    if-lez v1, :cond_23

    .line 210
    iget v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->b:F

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v3

    mul-float v4, v4, v3

    div-float v4, v4, v16

    sub-float/2addr v1, v4

    iput v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->b:F

    .line 213
    :cond_23
    :goto_11
    iget v3, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->l:F

    iget v4, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->t:F

    iget v5, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->r:F

    new-instance v8, Landroid/graphics/Paint;

    invoke-direct {v8}, Landroid/graphics/Paint;-><init>()V

    const/high16 v7, -0x40800000    # -1.0f

    move-object/from16 v1, p1

    invoke-virtual/range {v0 .. v8}, Lcom/flyersoft/staticlayout/MyMarginSpan;->drawBackgroundColor(Landroid/graphics/Canvas;IFFFFFLandroid/graphics/Paint;)V

    .line 216
    :cond_24
    :goto_12
    iget-object v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v1, v1, Lcom/flyersoft/components/CSS$Style;->backgroundImage:Ljava/lang/String;

    if-eqz v1, :cond_25

    sget-object v1, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    if-eqz v1, :cond_25

    .line 217
    iget v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->l:F

    iget v2, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->leftPadding:F

    sub-float/2addr v1, v2

    float-to-int v2, v1

    iget v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->t:F

    iget v3, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->topPadding:F

    sub-float/2addr v1, v3

    float-to-int v3, v1

    iget v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->r:F

    iget v4, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->rightPadding:F

    add-float/2addr v1, v4

    float-to-int v4, v1

    iget v1, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->b:F

    iget v5, v0, Lcom/flyersoft/staticlayout/MyMarginSpan;->bottomPadding:F

    add-float/2addr v1, v5

    float-to-int v5, v1

    move-object/from16 v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/flyersoft/staticlayout/MyMarginSpan;->drawBackgroundImage(Landroid/graphics/Canvas;IIII)V

    :cond_25
    :goto_13
    return-void
.end method

.method protected drawLine(ILandroid/graphics/Canvas;FFFFFLjava/lang/String;Ljava/lang/String;)V
    .locals 9

    move-object/from16 v0, p9

    if-eqz v0, :cond_7

    .line 436
    const-string v1, "none"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto/16 :goto_3

    :cond_0
    const/high16 v1, 0x40000000    # 2.0f

    if-eqz p1, :cond_2

    const/4 v2, 0x2

    if-ne p1, v2, :cond_1

    goto :goto_0

    :cond_1
    move p1, p4

    move v7, p6

    goto :goto_1

    .line 440
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object p1, p1, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    iget-object v2, p0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v2, v2, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    const/4 v4, 0x1

    invoke-static {p1, v2, v4}, Lcom/flyersoft/components/CSS;->getBorder([Ljava/lang/String;Landroid/graphics/RectF;I)F

    move-result p1

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v2

    mul-float p1, p1, v2

    div-float/2addr p1, v1

    sub-float p1, p4, p1

    .line 441
    iget-object v2, p0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v2, v2, Lcom/flyersoft/components/CSS$Style;->borderStyle:[Ljava/lang/String;

    iget-object v4, p0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v4, v4, Lcom/flyersoft/components/CSS$Style;->border:Landroid/graphics/RectF;

    const/4 v5, 0x3

    invoke-static {v2, v4, v5}, Lcom/flyersoft/components/CSS;->getBorder([Ljava/lang/String;Landroid/graphics/RectF;I)F

    move-result v2

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v4

    mul-float v2, v2, v4

    div-float/2addr v2, v1

    add-float/2addr v2, p6

    move v7, v2

    .line 444
    :goto_1
    new-instance v5, Landroid/graphics/Paint;

    invoke-direct {v5}, Landroid/graphics/Paint;-><init>()V

    move-object/from16 v2, p8

    .line 445
    invoke-virtual {p0, v2, v0}, Lcom/flyersoft/staticlayout/MyMarginSpan;->getBorderColor(Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v5, v2}, Landroid/graphics/Paint;->setColor(I)V

    const/high16 v2, 0x3d800000    # 0.0625f

    cmpl-float v2, p7, v2

    if-nez v2, :cond_3

    const/high16 v2, 0x3f800000    # 1.0f

    goto :goto_2

    .line 447
    :cond_3
    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v2

    mul-float v2, v2, p7

    .line 448
    :goto_2
    invoke-virtual {p0, v5, v0, v2}, Lcom/flyersoft/staticlayout/MyMarginSpan;->updatePaintStyles(Landroid/graphics/Paint;Ljava/lang/String;F)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 449
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 450
    invoke-virtual {v0, p3, p1}, Landroid/graphics/Path;->moveTo(FF)V

    .line 451
    invoke-virtual {v0, p5, v7}, Landroid/graphics/Path;->lineTo(FF)V

    .line 452
    invoke-virtual {p2, v0, v5}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    return-void

    .line 453
    :cond_4
    const-string v4, "double"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    const/high16 v0, 0x40400000    # 3.0f

    div-float v0, v2, v0

    .line 454
    invoke-virtual {v5, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    cmpl-float v4, p1, v7

    if-nez v4, :cond_5

    div-float v6, v2, v1

    add-float v2, p1, v6

    div-float v8, v0, v1

    sub-float/2addr v2, v8

    add-float v0, v7, v6

    sub-float v4, v0, v8

    move-object v0, p2

    move v1, p3

    move v3, p5

    .line 456
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    sub-float/2addr p1, v6

    add-float v2, p1, v8

    sub-float/2addr v7, v6

    add-float v4, v7, v8

    .line 457
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    return-void

    :cond_5
    div-float/2addr v2, v1

    add-float v3, p3, v2

    div-float/2addr v0, v1

    sub-float v4, v3, v0

    add-float v1, p5, v2

    sub-float v6, v1, v0

    move-object v3, p2

    move-object v8, v5

    move v5, p1

    .line 459
    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move-object v5, v8

    sub-float/2addr p3, v2

    add-float/2addr p3, v0

    sub-float v1, p5, v2

    add-float/2addr v1, v0

    move p5, p1

    move p4, p3

    move p6, v1

    move-object/from16 p8, v5

    move/from16 p7, v7

    move-object p3, p2

    .line 460
    invoke-virtual/range {p3 .. p8}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    return-void

    .line 463
    :cond_6
    invoke-virtual {v5, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    move v2, p1

    move-object v0, p2

    move v1, p3

    move v3, p5

    move v4, v7

    .line 464
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    :cond_7
    :goto_3
    return-void
.end method

.method protected getBackgroundColor()I
    .locals 3

    .line 400
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyMarginSpan;->cssStyle:Lcom/flyersoft/components/CSS$Style;

    iget-object v0, v0, Lcom/flyersoft/components/CSS$Style;->backgroundColor:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getHtmlColorInt(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 403
    :cond_0
    sget v1, Lcom/flyersoft/tools/A;->fontColor:I

    invoke-static {v1}, Lcom/flyersoft/tools/A;->colorValue(I)I

    move-result v1

    .line 404
    invoke-static {v0}, Lcom/flyersoft/tools/A;->colorValue(I)I

    move-result v2

    sub-int/2addr v1, v2

    .line 405
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    const/16 v2, 0xc8

    if-ge v1, v2, :cond_1

    const/16 v1, -0x64

    invoke-static {v0, v1}, Lcom/flyersoft/tools/A;->getAlphaColor(II)I

    move-result v0

    :cond_1
    return v0
.end method

.method protected getBorderColor(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2

    .line 480
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getHtmlColorInt(Ljava/lang/String;)I

    move-result p1

    if-nez p1, :cond_2

    .line 482
    const-string p1, "solid"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    const-string p1, "dotted"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    const-string p1, "dashed"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    const-string p1, "double"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    .line 485
    :cond_0
    sget p1, Lcom/flyersoft/tools/A;->fontColor:I

    const/16 p2, -0x64

    invoke-static {p1, p2}, Lcom/flyersoft/tools/A;->getAlphaColor(II)I

    move-result p1

    goto :goto_1

    .line 483
    :cond_1
    :goto_0
    sget p1, Lcom/flyersoft/tools/A;->fontColor:I

    .line 487
    :cond_2
    :goto_1
    iget-object p2, p0, Lcom/flyersoft/staticlayout/MyMarginSpan;->tag:Ljava/lang/String;

    const-string v0, "table"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    const/16 v0, -0x96

    if-eqz p2, :cond_3

    .line 488
    invoke-static {p1, v0}, Lcom/flyersoft/tools/A;->getAlphaColor(II)I

    move-result p1

    return p1

    .line 489
    :cond_3
    iget-object p2, p0, Lcom/flyersoft/staticlayout/MyMarginSpan;->tag:Ljava/lang/String;

    const-string v1, "tr"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_4

    .line 490
    invoke-static {p1, v0}, Lcom/flyersoft/tools/A;->getAlphaColor(II)I

    move-result p1

    :cond_4
    return p1
.end method

.method public outerHoriMargins(Ljava/util/ArrayList;I)F
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/staticlayout/MyMarginSpan;",
            ">;I)F"
        }
    .end annotation

    .line 511
    iget v0, p0, Lcom/flyersoft/staticlayout/MyMarginSpan;->fromIndex:I

    add-int/lit8 v0, v0, 0x1

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_2

    .line 512
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/staticlayout/MyMarginSpan;

    .line 513
    iget v3, v2, Lcom/flyersoft/staticlayout/MyMarginSpan;->spStart:I

    iget v4, p0, Lcom/flyersoft/staticlayout/MyMarginSpan;->spStart:I

    if-gt v3, v4, :cond_1

    iget v3, v2, Lcom/flyersoft/staticlayout/MyMarginSpan;->spEnd:I

    iget v4, p0, Lcom/flyersoft/staticlayout/MyMarginSpan;->spEnd:I

    if-lt v3, v4, :cond_1

    if-nez p2, :cond_0

    .line 514
    iget v2, v2, Lcom/flyersoft/staticlayout/MyMarginSpan;->leftMargin:F

    goto :goto_1

    :cond_0
    iget v2, v2, Lcom/flyersoft/staticlayout/MyMarginSpan;->rightMargin:F

    :goto_1
    add-float/2addr v1, v2

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return v1
.end method

.method protected outerTopMargins(Ljava/util/ArrayList;)F
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/staticlayout/MyMarginSpan;",
            ">;)F"
        }
    .end annotation

    .line 521
    iget v0, p0, Lcom/flyersoft/staticlayout/MyMarginSpan;->fromIndex:I

    add-int/lit8 v0, v0, 0x1

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 522
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/staticlayout/MyMarginSpan;

    .line 523
    iget v3, v2, Lcom/flyersoft/staticlayout/MyMarginSpan;->spStart:I

    iget v4, p0, Lcom/flyersoft/staticlayout/MyMarginSpan;->spStart:I

    if-ne v3, v4, :cond_0

    iget v3, v2, Lcom/flyersoft/staticlayout/MyMarginSpan;->spEnd:I

    iget v4, p0, Lcom/flyersoft/staticlayout/MyMarginSpan;->spEnd:I

    if-lt v3, v4, :cond_0

    .line 524
    iget v2, v2, Lcom/flyersoft/staticlayout/MyMarginSpan;->topMargin:F

    add-float/2addr v1, v2

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return v1
.end method

.method protected sameBorders(Landroid/graphics/RectF;[Ljava/lang/String;[Ljava/lang/String;)Z
    .locals 6

    .line 251
    iget v0, p1, Landroid/graphics/RectF;->left:F

    iget v1, p1, Landroid/graphics/RectF;->top:F

    const/4 v2, 0x0

    cmpl-float v0, v0, v1

    if-nez v0, :cond_5

    iget v0, p1, Landroid/graphics/RectF;->top:F

    iget v1, p1, Landroid/graphics/RectF;->right:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_5

    iget v0, p1, Landroid/graphics/RectF;->right:F

    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    cmpl-float p1, v0, p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    if-eqz p2, :cond_5

    .line 253
    aget-object p1, p2, v2

    if-eqz p1, :cond_5

    const/4 v0, 0x1

    aget-object v1, p2, v0

    if-eqz v1, :cond_5

    const/4 v3, 0x2

    aget-object v4, p2, v3

    if-eqz v4, :cond_5

    const/4 v4, 0x3

    aget-object v5, p2, v4

    if-nez v5, :cond_1

    goto :goto_0

    .line 255
    :cond_1
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    aget-object p1, p2, v0

    aget-object v1, p2, v3

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    aget-object p1, p2, v3

    aget-object p2, p2, v4

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    goto :goto_0

    :cond_2
    if-eqz p3, :cond_4

    .line 258
    aget-object p1, p3, v2

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    aget-object p2, p3, v0

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    aget-object p1, p3, v0

    .line 259
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    aget-object p2, p3, v3

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    aget-object p1, p3, v3

    .line 260
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    aget-object p2, p3, v4

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_4

    :cond_3
    return v2

    :cond_4
    return v0

    :cond_5
    :goto_0
    return v2
.end method

.method protected updatePaintStyles(Landroid/graphics/Paint;Ljava/lang/String;F)Z
    .locals 3

    .line 469
    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 470
    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 471
    const-string v0, "dotted"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_1

    const-string v1, "dashed"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    return v2

    .line 472
    :cond_1
    :goto_0
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_3

    const/high16 p2, 0x3f800000    # 1.0f

    cmpl-float p2, p3, p2

    if-lez p2, :cond_2

    goto :goto_1

    :cond_2
    const/high16 p3, 0x3fc00000    # 1.5f

    goto :goto_1

    :cond_3
    const/high16 p2, 0x40800000    # 4.0f

    mul-float p3, p3, p2

    .line 473
    :goto_1
    new-instance p2, Landroid/graphics/DashPathEffect;

    const/4 v0, 0x2

    new-array v0, v0, [F

    aput p3, v0, v2

    const/4 v1, 0x1

    aput p3, v0, v1

    const/4 p3, 0x0

    invoke-direct {p2, v0, p3}, Landroid/graphics/DashPathEffect;-><init>([FF)V

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    return v1
.end method
