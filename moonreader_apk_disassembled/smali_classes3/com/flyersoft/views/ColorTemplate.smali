.class public Lcom/flyersoft/views/ColorTemplate;
.super Landroid/view/View;
.source "ColorTemplate.java"


# instance fields
.field colors:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field fontBm:Landroid/graphics/Bitmap;

.field fontBmRes:I

.field fw:I

.field public pressed:Z

.field tipBm:Landroid/graphics/Bitmap;

.field tipRes:I

.field public x:F

.field public y:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 32
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 35
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/views/ColorTemplate;->colors:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 28
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 35
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/views/ColorTemplate;->colors:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 24
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 35
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/views/ColorTemplate;->colors:Ljava/util/ArrayList;

    return-void
.end method

.method private getHighlightColor()I
    .locals 2

    .line 79
    invoke-static {}, Lcom/flyersoft/tools/A;->getBookType()I

    move-result v0

    const/4 v1, 0x7

    if-ne v0, v1, :cond_0

    sget v0, Lcom/flyersoft/tools/A;->pdf_select_color:I

    return v0

    :cond_0
    sget v0, Lcom/flyersoft/tools/A;->highlight_color:I

    return v0
.end method

.method private initCharBounds()V
    .locals 2

    .line 98
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_0

    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->font_t:I

    goto :goto_0

    :cond_0
    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->font_t2:I

    .line 99
    :goto_0
    iget v1, p0, Lcom/flyersoft/views/ColorTemplate;->fontBmRes:I

    if-ne v1, v0, :cond_1

    iget-object v1, p0, Lcom/flyersoft/views/ColorTemplate;->fontBm:Landroid/graphics/Bitmap;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 100
    :cond_1
    iget-object v1, p0, Lcom/flyersoft/views/ColorTemplate;->fontBm:Landroid/graphics/Bitmap;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->recycle(Landroid/graphics/Bitmap;)Z

    .line 101
    iput v0, p0, Lcom/flyersoft/views/ColorTemplate;->fontBmRes:I

    .line 102
    invoke-virtual {p0}, Lcom/flyersoft/views/ColorTemplate;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget v1, p0, Lcom/flyersoft/views/ColorTemplate;->fontBmRes:I

    invoke-static {v0, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/views/ColorTemplate;->fontBm:Landroid/graphics/Bitmap;

    .line 104
    :cond_2
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_3

    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->tip_share:I

    goto :goto_1

    :cond_3
    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->tip_share2:I

    .line 105
    :goto_1
    iget v1, p0, Lcom/flyersoft/views/ColorTemplate;->tipRes:I

    if-ne v1, v0, :cond_4

    iget-object v1, p0, Lcom/flyersoft/views/ColorTemplate;->tipBm:Landroid/graphics/Bitmap;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 106
    :cond_4
    iget-object v1, p0, Lcom/flyersoft/views/ColorTemplate;->tipBm:Landroid/graphics/Bitmap;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->recycle(Landroid/graphics/Bitmap;)Z

    .line 107
    iput v0, p0, Lcom/flyersoft/views/ColorTemplate;->tipRes:I

    .line 108
    invoke-virtual {p0}, Lcom/flyersoft/views/ColorTemplate;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget v1, p0, Lcom/flyersoft/views/ColorTemplate;->tipRes:I

    invoke-static {v0, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/views/ColorTemplate;->tipBm:Landroid/graphics/Bitmap;

    .line 110
    :cond_5
    invoke-virtual {p0}, Lcom/flyersoft/views/ColorTemplate;->getHeight()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    const/high16 v1, 0x41800000    # 16.0f

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/flyersoft/views/ColorTemplate;->fw:I

    return-void
.end method


# virtual methods
.method public getClicked()I
    .locals 2

    .line 48
    invoke-virtual {p0}, Lcom/flyersoft/views/ColorTemplate;->getWidth()I

    move-result v0

    .line 49
    iget v1, p0, Lcom/flyersoft/views/ColorTemplate;->x:F

    div-int/lit8 v0, v0, 0x5

    add-int/lit8 v0, v0, 0x1

    int-to-float v0, v0

    div-float/2addr v1, v0

    float-to-int v0, v1

    .line 50
    iget-object v1, p0, Lcom/flyersoft/views/ColorTemplate;->colors:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-le v0, v1, :cond_0

    .line 51
    iget-object v0, p0, Lcom/flyersoft/views/ColorTemplate;->colors:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :cond_0
    return v0
.end method

.method public getClickedColor()I
    .locals 2

    .line 60
    invoke-virtual {p0}, Lcom/flyersoft/views/ColorTemplate;->initColors()V

    .line 61
    invoke-virtual {p0}, Lcom/flyersoft/views/ColorTemplate;->isClickTop()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 62
    sget v0, Lcom/flyersoft/tools/A;->highlightMode:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    sget v0, Lcom/flyersoft/tools/A;->squiggly_color:I

    return v0

    :cond_0
    sget v0, Lcom/flyersoft/tools/A;->highlightMode:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    sget v0, Lcom/flyersoft/tools/A;->strikethrough_color:I

    return v0

    .line 63
    :cond_1
    sget v0, Lcom/flyersoft/tools/A;->highlightMode:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_2

    sget v0, Lcom/flyersoft/tools/A;->underline_color:I

    return v0

    :cond_2
    invoke-direct {p0}, Lcom/flyersoft/views/ColorTemplate;->getHighlightColor()I

    move-result v0

    return v0

    .line 65
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/views/ColorTemplate;->colors:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/flyersoft/views/ColorTemplate;->getClicked()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getLongClickedColor()I
    .locals 2

    .line 69
    invoke-virtual {p0}, Lcom/flyersoft/views/ColorTemplate;->initColors()V

    .line 70
    invoke-virtual {p0}, Lcom/flyersoft/views/ColorTemplate;->isClickTop()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 71
    invoke-virtual {p0}, Lcom/flyersoft/views/ColorTemplate;->getClicked()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    .line 72
    sget v0, Lcom/flyersoft/tools/A;->squiggly_color:I

    return v0

    :cond_0
    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    sget v0, Lcom/flyersoft/tools/A;->strikethrough_color:I

    return v0

    :cond_1
    const/4 v1, 0x1

    if-ne v0, v1, :cond_2

    .line 73
    sget v0, Lcom/flyersoft/tools/A;->underline_color:I

    return v0

    :cond_2
    invoke-direct {p0}, Lcom/flyersoft/views/ColorTemplate;->getHighlightColor()I

    move-result v0

    return v0

    .line 75
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/views/ColorTemplate;->colors:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/flyersoft/views/ColorTemplate;->getClicked()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method initColors()V
    .locals 2

    .line 37
    iget-object v0, p0, Lcom/flyersoft/views/ColorTemplate;->colors:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 39
    iget-object v0, p0, Lcom/flyersoft/views/ColorTemplate;->colors:Ljava/util/ArrayList;

    sget v1, Lcom/flyersoft/tools/A;->highlight_color1:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 40
    iget-object v0, p0, Lcom/flyersoft/views/ColorTemplate;->colors:Ljava/util/ArrayList;

    sget v1, Lcom/flyersoft/tools/A;->highlight_color2:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 41
    iget-object v0, p0, Lcom/flyersoft/views/ColorTemplate;->colors:Ljava/util/ArrayList;

    sget v1, Lcom/flyersoft/tools/A;->highlight_color3:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 42
    iget-object v0, p0, Lcom/flyersoft/views/ColorTemplate;->colors:Ljava/util/ArrayList;

    sget v1, Lcom/flyersoft/tools/A;->highlight_color4:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 43
    iget-object v0, p0, Lcom/flyersoft/views/ColorTemplate;->colors:Ljava/util/ArrayList;

    sget v1, Lcom/flyersoft/tools/A;->highlight_color5:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public isClickTop()Z
    .locals 2

    .line 56
    iget v0, p0, Lcom/flyersoft/views/ColorTemplate;->y:F

    invoke-virtual {p0}, Lcom/flyersoft/views/ColorTemplate;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 24

    move-object/from16 v1, p0

    .line 115
    invoke-virtual {v1}, Lcom/flyersoft/views/ColorTemplate;->isInEditMode()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_9

    .line 120
    :cond_0
    invoke-virtual {v1}, Lcom/flyersoft/views/ColorTemplate;->initColors()V

    .line 121
    invoke-virtual {v1}, Lcom/flyersoft/views/ColorTemplate;->getWidth()I

    move-result v0

    const/4 v9, 0x5

    div-int/2addr v0, v9

    .line 122
    invoke-virtual {v1}, Lcom/flyersoft/views/ColorTemplate;->getHeight()I

    move-result v10

    const/high16 v11, 0x3f800000    # 1.0f

    .line 123
    invoke-static {v11}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v12

    .line 124
    new-instance v7, Landroid/text/TextPaint;

    invoke-direct {v7}, Landroid/text/TextPaint;-><init>()V

    const/4 v13, 0x1

    .line 125
    invoke-virtual {v7, v13}, Landroid/text/TextPaint;->setAntiAlias(Z)V

    .line 126
    invoke-virtual {v7, v11}, Landroid/text/TextPaint;->setStrokeWidth(F)V

    const v14, -0x11666667

    .line 127
    invoke-virtual {v7, v14}, Landroid/text/TextPaint;->setColor(I)V

    .line 128
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v15

    if-eqz v15, :cond_1

    const v2, -0x77000001

    const v8, -0x77000001

    goto :goto_0

    :cond_1
    const v2, -0x118a8a8b

    const v8, -0x118a8a8b

    :goto_0
    int-to-float v3, v12

    sub-int v2, v10, v12

    int-to-float v4, v2

    .line 130
    invoke-virtual {v1}, Lcom/flyersoft/views/ColorTemplate;->getWidth()I

    move-result v2

    sub-int/2addr v2, v12

    int-to-float v5, v2

    move v6, v4

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 132
    invoke-direct {v1}, Lcom/flyersoft/views/ColorTemplate;->initCharBounds()V

    .line 133
    sget-object v3, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v5, 0x2

    if-eqz v3, :cond_3

    .line 134
    invoke-virtual {v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdfNoflow()Z

    move-result v6

    if-eqz v6, :cond_3

    iget-object v6, v3, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-boolean v6, v6, Lcom/flyersoft/books/PDFReader;->isPdf:Z

    if-eqz v6, :cond_3

    invoke-virtual {v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isClickOnAnnot()Z

    move-result v3

    if-eqz v3, :cond_3

    const/high16 v20, 0x3f800000    # 1.0f

    :cond_2
    const/16 v19, 0x2

    const/16 v23, 0x5

    goto/16 :goto_5

    :cond_3
    if-eqz v15, :cond_4

    const v3, 0x33cccccc

    goto :goto_1

    :cond_4
    const v3, 0x44cccccc    # 1638.3999f

    .line 136
    :goto_1
    invoke-virtual {v7, v3}, Landroid/text/TextPaint;->setColor(I)V

    .line 137
    new-instance v3, Landroid/graphics/Rect;

    sget v6, Lcom/flyersoft/tools/A;->highlightMode:I

    mul-int v6, v6, v0

    const/high16 v16, 0x40000000    # 2.0f

    invoke-static/range {v16 .. v16}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v17

    add-int v6, v6, v17

    invoke-static/range {v16 .. v16}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    sget v18, Lcom/flyersoft/tools/A;->highlightMode:I

    mul-int v18, v18, v0

    add-int v18, v0, v18

    invoke-static/range {v16 .. v16}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v19

    sub-int v14, v18, v19

    div-int/lit8 v18, v10, 0x2

    const/high16 v19, 0x40400000    # 3.0f

    invoke-static/range {v19 .. v19}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v19

    const/high16 v20, 0x3f800000    # 1.0f

    sub-int v11, v18, v19

    invoke-direct {v3, v6, v4, v14, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {v2, v3, v7}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    const/4 v11, 0x0

    :goto_2
    if-ge v11, v9, :cond_2

    mul-int v3, v11, v0

    add-int/2addr v3, v12

    .line 139
    iget v4, v1, Lcom/flyersoft/views/ColorTemplate;->fw:I

    sub-int v6, v0, v4

    div-int/2addr v6, v5

    add-int v14, v3, v6

    sub-int v3, v18, v4

    .line 140
    div-int/2addr v3, v5

    if-eqz v11, :cond_8

    const/high16 v4, 0x40200000    # 2.5f

    if-eq v11, v13, :cond_7

    if-eq v11, v5, :cond_6

    const/4 v4, 0x3

    if-eq v11, v4, :cond_5

    move v9, v3

    move v13, v8

    const/16 v19, 0x2

    const/16 v23, 0x5

    goto/16 :goto_3

    .line 157
    :cond_5
    invoke-virtual {v7, v8}, Landroid/text/TextPaint;->setColor(I)V

    .line 158
    invoke-static/range {v20 .. v20}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v7, v4}, Landroid/text/TextPaint;->setStrokeWidth(F)V

    .line 159
    invoke-static/range {v16 .. v16}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    add-int/2addr v4, v14

    int-to-float v4, v4

    iget v6, v1, Lcom/flyersoft/views/ColorTemplate;->fw:I

    add-int v5, v3, v6

    int-to-float v5, v5

    add-int/2addr v6, v14

    invoke-static/range {v16 .. v16}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v21

    sub-int v6, v6, v21

    int-to-float v6, v6

    iget v13, v1, Lcom/flyersoft/views/ColorTemplate;->fw:I

    add-int/2addr v13, v3

    int-to-float v13, v13

    const v22, 0x400ccccd    # 2.2f

    const/16 v23, 0x5

    invoke-static/range {v22 .. v22}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v9

    int-to-float v9, v9

    move/from16 v19, v9

    move v9, v3

    move v3, v4

    move v4, v5

    move v5, v6

    move v6, v13

    move v13, v8

    move/from16 v8, v19

    const/16 v19, 0x2

    invoke-static/range {v2 .. v8}, Lcom/flyersoft/tools/A;->drawSquiggly(Landroid/graphics/Canvas;FFFFLandroid/graphics/Paint;F)V

    move-object/from16 v2, p1

    goto/16 :goto_3

    :cond_6
    move v9, v3

    move v13, v8

    const/16 v19, 0x2

    const/16 v23, 0x5

    .line 152
    invoke-virtual {v7, v13}, Landroid/text/TextPaint;->setColor(I)V

    .line 153
    invoke-static/range {v16 .. v16}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v7, v2}, Landroid/text/TextPaint;->setStrokeWidth(F)V

    .line 154
    invoke-static {v4}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    add-int/2addr v2, v14

    int-to-float v3, v2

    iget v2, v1, Lcom/flyersoft/views/ColorTemplate;->fw:I

    div-int/lit8 v5, v2, 0x2

    add-int/2addr v5, v9

    int-to-float v5, v5

    add-int/2addr v2, v14

    invoke-static {v4}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    sub-int/2addr v2, v4

    int-to-float v2, v2

    iget v4, v1, Lcom/flyersoft/views/ColorTemplate;->fw:I

    div-int/lit8 v4, v4, 0x2

    add-int/2addr v4, v9

    int-to-float v6, v4

    move v4, v5

    move v5, v2

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_3

    :cond_7
    move v9, v3

    move v13, v8

    const/16 v19, 0x2

    const/16 v23, 0x5

    .line 147
    invoke-virtual {v7, v13}, Landroid/text/TextPaint;->setColor(I)V

    .line 148
    invoke-static/range {v16 .. v16}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v7, v2}, Landroid/text/TextPaint;->setStrokeWidth(F)V

    .line 149
    invoke-static {v4}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    add-int/2addr v2, v14

    int-to-float v3, v2

    iget v2, v1, Lcom/flyersoft/views/ColorTemplate;->fw:I

    add-int v5, v9, v2

    int-to-float v5, v5

    add-int/2addr v2, v14

    invoke-static {v4}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    sub-int/2addr v2, v4

    int-to-float v2, v2

    iget v4, v1, Lcom/flyersoft/views/ColorTemplate;->fw:I

    add-int/2addr v4, v9

    int-to-float v6, v4

    move v4, v5

    move v5, v2

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto :goto_3

    :cond_8
    move v9, v3

    move v13, v8

    const/16 v19, 0x2

    const/16 v23, 0x5

    .line 143
    invoke-direct {v1}, Lcom/flyersoft/views/ColorTemplate;->getHighlightColor()I

    move-result v3

    const/16 v4, -0x28

    invoke-static {v3, v4}, Lcom/flyersoft/tools/A;->getAlphaColor(II)I

    move-result v3

    invoke-virtual {v7, v3}, Landroid/text/TextPaint;->setColor(I)V

    .line 144
    new-instance v3, Landroid/graphics/RectF;

    invoke-static/range {v20 .. v20}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    add-int/2addr v4, v14

    int-to-float v4, v4

    invoke-static/range {v16 .. v16}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v5

    sub-int v5, v9, v5

    int-to-float v5, v5

    iget v6, v1, Lcom/flyersoft/views/ColorTemplate;->fw:I

    add-int/2addr v6, v14

    invoke-static/range {v20 .. v20}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v8

    sub-int/2addr v6, v8

    int-to-float v6, v6

    iget v8, v1, Lcom/flyersoft/views/ColorTemplate;->fw:I

    add-int/2addr v8, v9

    invoke-static/range {v16 .. v16}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v22

    add-int v8, v8, v22

    int-to-float v8, v8

    invoke-direct {v3, v4, v5, v6, v8}, Landroid/graphics/RectF;-><init>(FFFF)V

    const/high16 v4, 0x40a00000    # 5.0f

    const/high16 v5, 0x41200000    # 10.0f

    invoke-virtual {v2, v3, v4, v5, v7}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    :goto_3
    const/4 v3, 0x4

    if-ne v11, v3, :cond_9

    .line 162
    iget-object v3, v1, Lcom/flyersoft/views/ColorTemplate;->tipBm:Landroid/graphics/Bitmap;

    goto :goto_4

    :cond_9
    iget-object v3, v1, Lcom/flyersoft/views/ColorTemplate;->fontBm:Landroid/graphics/Bitmap;

    .line 164
    :goto_4
    new-instance v4, Landroid/graphics/Rect;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    const/4 v8, 0x0

    invoke-direct {v4, v8, v8, v5, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    new-instance v5, Landroid/graphics/Rect;

    iget v6, v1, Lcom/flyersoft/views/ColorTemplate;->fw:I

    add-int v8, v14, v6

    add-int/2addr v6, v9

    invoke-direct {v5, v14, v9, v8, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    const/4 v6, 0x0

    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    add-int/lit8 v11, v11, 0x1

    move v8, v13

    const/4 v5, 0x2

    const/4 v9, 0x5

    const/4 v13, 0x1

    goto/16 :goto_2

    .line 169
    :goto_5
    iget-boolean v0, v1, Lcom/flyersoft/views/ColorTemplate;->pressed:Z

    if-eqz v0, :cond_a

    invoke-virtual {v1}, Lcom/flyersoft/views/ColorTemplate;->isClickTop()Z

    move-result v0

    if-nez v0, :cond_a

    .line 171
    :try_start_0
    iget-object v0, v1, Lcom/flyersoft/views/ColorTemplate;->colors:Ljava/util/ArrayList;

    invoke-virtual {v1}, Lcom/flyersoft/views/ColorTemplate;->getClicked()I

    move-result v3

    iget-object v4, v1, Lcom/flyersoft/views/ColorTemplate;->colors:Ljava/util/ArrayList;

    invoke-virtual {v1}, Lcom/flyersoft/views/ColorTemplate;->getClicked()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/16 v5, -0x78

    invoke-static {v4, v5}, Lcom/flyersoft/tools/A;->getAlphaColor(II)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_6

    :catch_0
    move-exception v0

    .line 173
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_a
    :goto_6
    const/high16 v3, 0x3f800000    # 1.0f

    .line 177
    invoke-virtual {v7, v3}, Landroid/text/TextPaint;->setStrokeWidth(F)V

    .line 178
    invoke-virtual {v1}, Lcom/flyersoft/views/ColorTemplate;->getWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x5

    if-eqz v15, :cond_b

    const v14, -0x11666667

    goto :goto_7

    :cond_b
    const v14, 0x33aaaaaa

    :goto_7
    const/4 v4, 0x0

    :goto_8
    const/4 v3, 0x5

    if-ge v4, v3, :cond_c

    mul-int v5, v4, v0

    mul-int/lit8 v6, v12, 0xa

    add-int/2addr v5, v6

    .line 182
    div-int/lit8 v6, v10, 0x2

    const/high16 v8, 0x40e00000    # 7.0f

    invoke-static {v8}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v8

    add-int/2addr v6, v8

    add-int v8, v5, v0

    mul-int/lit8 v9, v12, 0xf

    sub-int/2addr v8, v9

    const/high16 v9, 0x41400000    # 12.0f

    .line 184
    invoke-static {v9}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v9

    sub-int v9, v10, v9

    .line 185
    invoke-virtual {v7, v14}, Landroid/text/TextPaint;->setColor(I)V

    .line 186
    new-instance v11, Landroid/graphics/RectF;

    add-int v13, v5, v12

    int-to-float v13, v13

    add-int v15, v6, v12

    int-to-float v15, v15

    sub-int v3, v8, v12

    int-to-float v3, v3

    move/from16 v16, v0

    sub-int v0, v9, v12

    int-to-float v0, v0

    invoke-direct {v11, v13, v15, v3, v0}, Landroid/graphics/RectF;-><init>(FFFF)V

    const/16 v0, 0x18

    int-to-float v0, v0

    const/16 v3, 0x24

    int-to-float v3, v3

    invoke-virtual {v2, v11, v0, v3, v7}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 187
    iget-object v11, v1, Lcom/flyersoft/views/ColorTemplate;->colors:Ljava/util/ArrayList;

    invoke-virtual {v11, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Integer;

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    invoke-virtual {v7, v11}, Landroid/text/TextPaint;->setColor(I)V

    .line 188
    new-instance v11, Landroid/graphics/RectF;

    mul-int/lit8 v13, v12, 0x2

    add-int/2addr v5, v13

    int-to-float v5, v5

    add-int/2addr v6, v13

    int-to-float v6, v6

    sub-int/2addr v8, v13

    int-to-float v8, v8

    sub-int/2addr v9, v13

    int-to-float v9, v9

    invoke-direct {v11, v5, v6, v8, v9}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {v2, v11, v0, v3, v7}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    add-int/lit8 v4, v4, 0x1

    move/from16 v0, v16

    goto :goto_8

    :cond_c
    :goto_9
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 87
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lcom/flyersoft/views/ColorTemplate;->x:F

    .line 88
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iput v0, p0, Lcom/flyersoft/views/ColorTemplate;->y:F

    .line 89
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    iput-boolean v0, p0, Lcom/flyersoft/views/ColorTemplate;->pressed:Z

    .line 90
    invoke-virtual {p0}, Lcom/flyersoft/views/ColorTemplate;->postInvalidate()V

    .line 91
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method
