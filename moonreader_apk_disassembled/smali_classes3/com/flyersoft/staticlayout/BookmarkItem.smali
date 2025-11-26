.class public Lcom/flyersoft/staticlayout/BookmarkItem;
.super Landroid/widget/TextView;
.source "BookmarkItem.java"


# instance fields
.field public annot:Lcom/flyersoft/tools/BookDb$NoteInfo;

.field public s_end:I

.field public s_start:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 20
    invoke-direct {p0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 24
    invoke-direct {p0, p1, p2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 28
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 13

    .line 35
    invoke-super {p0, p1}, Landroid/widget/TextView;->onDraw(Landroid/graphics/Canvas;)V

    .line 38
    iget-object v0, p0, Lcom/flyersoft/staticlayout/BookmarkItem;->annot:Lcom/flyersoft/tools/BookDb$NoteInfo;

    if-nez v0, :cond_0

    goto/16 :goto_4

    .line 40
    :cond_0
    iget-boolean v0, v0, Lcom/flyersoft/tools/BookDb$NoteInfo;->underline:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/flyersoft/staticlayout/BookmarkItem;->annot:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-boolean v0, v0, Lcom/flyersoft/tools/BookDb$NoteInfo;->strikethrough:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/flyersoft/staticlayout/BookmarkItem;->annot:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-boolean v0, v0, Lcom/flyersoft/tools/BookDb$NoteInfo;->squiggly:Z

    if-nez v0, :cond_1

    goto/16 :goto_4

    :cond_1
    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 44
    :goto_0
    :try_start_0
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/BookmarkItem;->getLineCount()I

    move-result v2

    if-ge v1, v2, :cond_d

    const/4 v2, 0x0

    .line 45
    invoke-virtual {p0, v1, v2}, Lcom/flyersoft/staticlayout/BookmarkItem;->getLineBounds(ILandroid/graphics/Rect;)I

    move-result v2

    .line 46
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/BookmarkItem;->getLayout()Landroid/text/Layout;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/text/Layout;->getLineStart(I)I

    move-result v3

    .line 47
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/BookmarkItem;->getLayout()Landroid/text/Layout;

    move-result-object v4

    invoke-virtual {v4, v1}, Landroid/text/Layout;->getLineEnd(I)I

    move-result v4

    .line 48
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/BookmarkItem;->getLineCount()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    if-ge v1, v5, :cond_2

    add-int/lit8 v4, v4, -0x1

    .line 50
    :cond_2
    iget v5, p0, Lcom/flyersoft/staticlayout/BookmarkItem;->s_end:I

    if-le v3, v5, :cond_4

    :cond_3
    :goto_1
    move-object v6, p1

    goto/16 :goto_3

    :cond_4
    if-nez v1, :cond_5

    .line 53
    iget v3, p0, Lcom/flyersoft/staticlayout/BookmarkItem;->s_start:I

    :cond_5
    if-le v4, v5, :cond_6

    move v4, v5

    :cond_6
    if-nez v1, :cond_7

    .line 56
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/BookmarkItem;->getText()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/BookmarkItem;->getPaint()Landroid/text/TextPaint;

    move-result-object v6

    invoke-static {v5, v0, v3, v6}, Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;IILandroid/text/TextPaint;)F

    move-result v5

    goto :goto_2

    :cond_7
    const/4 v5, 0x0

    .line 57
    :goto_2
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/BookmarkItem;->getText()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/BookmarkItem;->getPaint()Landroid/text/TextPaint;

    move-result-object v7

    invoke-static {v6, v3, v4, v7}, Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;IILandroid/text/TextPaint;)F

    move-result v3

    add-float/2addr v3, v5

    .line 58
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/BookmarkItem;->getPaddingLeft()I

    move-result v4

    int-to-float v4, v4

    add-float v7, v5, v4

    .line 59
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/BookmarkItem;->getPaddingLeft()I

    move-result v4

    int-to-float v4, v4

    add-float v9, v3, v4

    .line 61
    new-instance v11, Landroid/graphics/Paint;

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/BookmarkItem;->getPaint()Landroid/text/TextPaint;

    move-result-object v3

    invoke-direct {v11, v3}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    .line 62
    iget-object v3, p0, Lcom/flyersoft/staticlayout/BookmarkItem;->annot:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget v3, v3, Lcom/flyersoft/tools/BookDb$NoteInfo;->highlightColor:I

    .line 64
    iget-object v4, p0, Lcom/flyersoft/staticlayout/BookmarkItem;->annot:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-boolean v4, v4, Lcom/flyersoft/tools/BookDb$NoteInfo;->underline:Z

    const v5, -0xaaaaab

    const/high16 v6, 0x3f800000    # 1.0f

    if-eqz v4, :cond_9

    .line 65
    invoke-static {v6}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v11, v4}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    if-nez v3, :cond_8

    const v3, -0xaaaaab

    .line 66
    :cond_8
    invoke-virtual {v11, v3}, Landroid/graphics/Paint;->setColor(I)V

    const/high16 v3, 0x3fc00000    # 1.5f

    .line 67
    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    add-int/2addr v2, v3

    int-to-float v8, v2

    move v10, v8

    move-object v6, p1

    .line 68
    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto :goto_1

    .line 69
    :cond_9
    iget-object v4, p0, Lcom/flyersoft/staticlayout/BookmarkItem;->annot:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-boolean v4, v4, Lcom/flyersoft/tools/BookDb$NoteInfo;->strikethrough:Z

    if-eqz v4, :cond_b

    const v4, 0x3f99999a    # 1.2f

    .line 70
    invoke-static {v4}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v11, v4}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    if-nez v3, :cond_a

    const v3, -0xaaaaab

    .line 71
    :cond_a
    invoke-virtual {v11, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 72
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/BookmarkItem;->getLineHeight()I

    move-result v3

    mul-int/lit8 v3, v3, 0x1a

    div-int/lit8 v3, v3, 0x64

    sub-int/2addr v2, v3

    int-to-float v8, v2

    move v10, v8

    move-object v6, p1

    .line 73
    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_1

    .line 74
    :cond_b
    iget-object v4, p0, Lcom/flyersoft/staticlayout/BookmarkItem;->annot:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-boolean v4, v4, Lcom/flyersoft/tools/BookDb$NoteInfo;->squiggly:Z

    if-eqz v4, :cond_3

    .line 75
    invoke-static {v6}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v11, v4}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    if-nez v3, :cond_c

    const v3, -0xff0100

    .line 76
    :cond_c
    invoke-virtual {v11, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 77
    invoke-static {v6}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    add-int/2addr v2, v3

    int-to-float v8, v2

    const v2, 0x40333333    # 2.8f

    .line 78
    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    int-to-float v12, v2

    move v10, v8

    move-object v6, p1

    invoke-static/range {v6 .. v12}, Lcom/flyersoft/tools/A;->drawSquiggly(Landroid/graphics/Canvas;FFFFLandroid/graphics/Paint;F)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_3
    add-int/lit8 v1, v1, 0x1

    move-object p1, v6

    goto/16 :goto_0

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 82
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_d
    :goto_4
    return-void
.end method
