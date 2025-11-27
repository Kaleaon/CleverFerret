.class public Lcom/flyersoft/views/ContentLay;
.super Landroid/widget/FrameLayout;
.source "ContentLay.java"


# instance fields
.field public animationStart:Z

.field private canvasCache:Landroid/graphics/Canvas;

.field public disableDraw:Z

.field public drawCache:Landroid/graphics/Bitmap;

.field public finished:Z

.field private fullImage:Landroid/graphics/drawable/Drawable;

.field private fullImageName:Ljava/lang/String;

.field public magnifierStart:Z

.field public pdfBookmarkIndex:I

.field private visualBm:Landroid/graphics/Bitmap;

.field public visualBookmarks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/A$Bookmark;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 25
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 106
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/views/ContentLay;->visualBookmarks:Ljava/util/ArrayList;

    const/4 p1, -0x1

    .line 113
    iput p1, p0, Lcom/flyersoft/views/ContentLay;->pdfBookmarkIndex:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 29
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 106
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/views/ContentLay;->visualBookmarks:Ljava/util/ArrayList;

    const/4 p1, -0x1

    .line 113
    iput p1, p0, Lcom/flyersoft/views/ContentLay;->pdfBookmarkIndex:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 33
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 106
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/views/ContentLay;->visualBookmarks:Ljava/util/ArrayList;

    const/4 p1, -0x1

    .line 113
    iput p1, p0, Lcom/flyersoft/views/ContentLay;->pdfBookmarkIndex:I

    return-void
.end method

.method private dispatchDraw2(Landroid/graphics/Canvas;)V
    .locals 1

    .line 108
    iget-object v0, p0, Lcom/flyersoft/views/ContentLay;->visualBookmarks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 109
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 110
    invoke-direct {p0, p1}, Lcom/flyersoft/views/ContentLay;->drawBookmarks(Landroid/graphics/Canvas;)V

    return-void
.end method

.method private drawBookmarks(Landroid/graphics/Canvas;)V
    .locals 17

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 115
    sget-object v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    .line 116
    invoke-static {v2}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v3

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v5, 0x0

    if-nez v3, :cond_3

    iget-object v3, v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    if-eqz v3, :cond_3

    iget-object v3, v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-wide v6, v3, Lcom/flyersoft/books/PDFReader;->fileOperateTime:J

    const-wide/16 v8, 0x0

    cmp-long v3, v6, v8

    if-lez v3, :cond_3

    .line 117
    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfGetCurrPageNo()I

    move-result v2

    const/4 v3, -0x1

    .line 118
    iput v3, v0, Lcom/flyersoft/views/ContentLay;->pdfBookmarkIndex:I

    .line 119
    invoke-static {}, Lcom/flyersoft/tools/A;->getBookmarks()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_13

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/flyersoft/tools/A$Bookmark;

    .line 120
    iget-wide v7, v6, Lcom/flyersoft/tools/A$Bookmark;->position:J

    int-to-long v9, v2

    cmp-long v11, v7, v9

    if-nez v11, :cond_0

    .line 121
    iget-object v3, v0, Lcom/flyersoft/views/ContentLay;->visualBm:Landroid/graphics/Bitmap;

    if-nez v3, :cond_1

    .line 122
    invoke-virtual {v0}, Lcom/flyersoft/views/ContentLay;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v7, Lcom/flyersoft/moonreaderp/R$drawable;->bookmark_tag:I

    invoke-static {v3, v7}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v3

    iput-object v3, v0, Lcom/flyersoft/views/ContentLay;->visualBm:Landroid/graphics/Bitmap;

    .line 123
    :cond_1
    sget-boolean v3, Lcom/flyersoft/tools/A;->isLargeTablet:Z

    if-eqz v3, :cond_2

    const/high16 v3, 0x41f00000    # 30.0f

    goto :goto_0

    :cond_2
    const/high16 v3, 0x41c00000    # 24.0f

    :goto_0
    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    mul-int/lit8 v7, v3, 0x28

    .line 124
    div-int/lit8 v7, v7, 0x46

    mul-int/lit8 v8, v3, 0x9

    .line 125
    div-int/lit8 v8, v8, 0x64

    .line 126
    invoke-virtual {v0}, Lcom/flyersoft/views/ContentLay;->getWidth()I

    move-result v9

    sub-int/2addr v9, v7

    sub-int/2addr v9, v8

    .line 127
    invoke-static {v4}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    iget v6, v6, Lcom/flyersoft/tools/A$Bookmark;->color:I

    invoke-static {v4, v5, v6}, Lcom/flyersoft/tools/A;->createBookmarkPaint(III)Landroid/graphics/Paint;

    move-result-object v4

    .line 128
    iget-object v6, v0, Lcom/flyersoft/views/ContentLay;->visualBm:Landroid/graphics/Bitmap;

    new-instance v10, Landroid/graphics/Rect;

    iget-object v11, v0, Lcom/flyersoft/views/ContentLay;->visualBm:Landroid/graphics/Bitmap;

    .line 129
    invoke-virtual {v11}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v11

    iget-object v12, v0, Lcom/flyersoft/views/ContentLay;->visualBm:Landroid/graphics/Bitmap;

    invoke-virtual {v12}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v12

    invoke-direct {v10, v5, v5, v11, v12}, Landroid/graphics/Rect;-><init>(IIII)V

    new-instance v5, Landroid/graphics/Rect;

    add-int/2addr v7, v9

    add-int/2addr v3, v8

    invoke-direct {v5, v9, v8, v7, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 128
    invoke-virtual {v1, v6, v10, v5, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 132
    iput v2, v0, Lcom/flyersoft/views/ContentLay;->pdfBookmarkIndex:I

    return-void

    .line 138
    :cond_3
    sget-boolean v3, Lcom/flyersoft/tools/A;->showBookmarkIcon:Z

    const/4 v6, 0x1

    if-eqz v3, :cond_4

    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->dotVisible()Z

    move-result v2

    if-eqz v2, :cond_4

    const/4 v2, 0x1

    goto :goto_1

    :cond_4
    const/4 v2, 0x0

    .line 140
    :goto_1
    sget-object v3, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    if-eqz v3, :cond_13

    sget-object v3, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    if-eqz v3, :cond_13

    if-nez v2, :cond_5

    sget-object v3, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    iget-object v3, v3, Lcom/flyersoft/staticlayout/MRTextView;->visualBookmarks:Ljava/util/ArrayList;

    .line 141
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-gtz v3, :cond_5

    sget-object v3, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    iget-object v3, v3, Lcom/flyersoft/staticlayout/MRTextView;->visualBookmarks:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_13

    .line 143
    :cond_5
    sget-object v3, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    iget-object v3, v3, Lcom/flyersoft/staticlayout/MRTextView;->visualBookmarks:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_6
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_7

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/flyersoft/tools/A$Bookmark;

    .line 144
    iget v8, v7, Lcom/flyersoft/tools/A$Bookmark;->drawY:I

    sget-object v9, Lcom/flyersoft/tools/A;->txtScroll:Landroid/widget/ScrollView;

    invoke-virtual {v9}, Landroid/widget/ScrollView;->getScrollY()I

    move-result v9

    sub-int/2addr v8, v9

    sget-object v9, Lcom/flyersoft/tools/A;->txtScroll:Landroid/widget/ScrollView;

    invoke-virtual {v9}, Landroid/widget/ScrollView;->getPaddingTop()I

    move-result v9

    add-int/2addr v8, v9

    iput v8, v7, Lcom/flyersoft/tools/A$Bookmark;->drawY2:I

    .line 145
    iget-object v8, v0, Lcom/flyersoft/views/ContentLay;->visualBookmarks:Ljava/util/ArrayList;

    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_6

    .line 146
    iget-object v8, v0, Lcom/flyersoft/views/ContentLay;->visualBookmarks:Ljava/util/ArrayList;

    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 149
    :cond_7
    sget-object v3, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    iget-object v3, v3, Lcom/flyersoft/staticlayout/MRTextView;->visualBookmarks:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_8
    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_9

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/flyersoft/tools/A$Bookmark;

    .line 150
    iget v8, v7, Lcom/flyersoft/tools/A$Bookmark;->drawY:I

    sget-object v9, Lcom/flyersoft/tools/A;->txtScroll2:Landroid/widget/ScrollView;

    invoke-virtual {v9}, Landroid/widget/ScrollView;->getScrollY()I

    move-result v9

    sub-int/2addr v8, v9

    sget-object v9, Lcom/flyersoft/tools/A;->txtScroll2:Landroid/widget/ScrollView;

    invoke-virtual {v9}, Landroid/widget/ScrollView;->getPaddingTop()I

    move-result v9

    add-int/2addr v8, v9

    iput v8, v7, Lcom/flyersoft/tools/A$Bookmark;->drawY2:I

    .line 151
    iget-object v8, v0, Lcom/flyersoft/views/ContentLay;->visualBookmarks:Ljava/util/ArrayList;

    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_8

    .line 152
    iget-object v8, v0, Lcom/flyersoft/views/ContentLay;->visualBookmarks:Ljava/util/ArrayList;

    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :cond_9
    if-eqz v2, :cond_a

    .line 155
    iget-object v2, v0, Lcom/flyersoft/views/ContentLay;->visualBookmarks:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_a

    .line 156
    new-instance v7, Lcom/flyersoft/tools/A$Bookmark;

    const-wide/16 v14, 0x0

    const/16 v16, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const-wide/16 v12, 0x0

    invoke-direct/range {v7 .. v16}, Lcom/flyersoft/tools/A$Bookmark;-><init>(Ljava/lang/String;Ljava/lang/String;IIJJI)V

    .line 157
    sget-object v2, Lcom/flyersoft/tools/A;->txtScroll2:Landroid/widget/ScrollView;

    invoke-virtual {v2}, Landroid/widget/ScrollView;->getScrollY()I

    move-result v2

    neg-int v2, v2

    sget-object v3, Lcom/flyersoft/tools/A;->txtScroll2:Landroid/widget/ScrollView;

    invoke-virtual {v3}, Landroid/widget/ScrollView;->getPaddingTop()I

    move-result v3

    add-int/2addr v2, v3

    iput v2, v7, Lcom/flyersoft/tools/A$Bookmark;->drawY2:I

    .line 158
    iget-object v2, v0, Lcom/flyersoft/views/ContentLay;->visualBookmarks:Ljava/util/ArrayList;

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 161
    :cond_a
    sget-object v2, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v2}, Lcom/flyersoft/staticlayout/MRTextView;->getLineHeight()I

    move-result v2

    mul-int/lit8 v2, v2, 0x50

    div-int/lit8 v2, v2, 0x64

    .line 162
    sget-object v3, Lcom/flyersoft/tools/A;->txtScroll:Landroid/widget/ScrollView;

    invoke-virtual {v3}, Landroid/widget/ScrollView;->getPaddingRight()I

    move-result v3

    mul-int/lit8 v7, v2, 0x28

    .line 163
    div-int/lit8 v7, v7, 0x46

    mul-int/lit8 v8, v3, 0x5a

    .line 164
    div-int/lit8 v8, v8, 0x64

    if-le v7, v8, :cond_c

    mul-int/lit8 v9, v7, 0x4b

    .line 165
    div-int/lit8 v9, v9, 0x64

    if-le v3, v9, :cond_b

    move v7, v8

    goto :goto_4

    :cond_b
    mul-int/lit8 v7, v7, 0x46

    div-int/lit8 v7, v7, 0x64

    .line 166
    :cond_c
    :goto_4
    invoke-virtual {v0}, Lcom/flyersoft/views/ContentLay;->getWidth()I

    move-result v8

    sub-int/2addr v8, v7

    const/high16 v9, 0x41980000    # 19.0f

    invoke-static {v9}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v9

    add-int/2addr v9, v7

    if-le v3, v9, :cond_d

    const/high16 v9, 0x41200000    # 10.0f

    invoke-static {v9}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v9

    goto :goto_5

    :cond_d
    invoke-static {v4}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v9

    add-int/2addr v9, v7

    if-le v3, v9, :cond_e

    sub-int v9, v3, v7

    div-int/lit8 v9, v9, 0x2

    goto :goto_5

    :cond_e
    invoke-static {v4}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v9

    :goto_5
    sub-int/2addr v8, v9

    .line 167
    iget-object v9, v0, Lcom/flyersoft/views/ContentLay;->visualBm:Landroid/graphics/Bitmap;

    if-nez v9, :cond_f

    .line 168
    invoke-virtual {v0}, Lcom/flyersoft/views/ContentLay;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    sget v10, Lcom/flyersoft/moonreaderp/R$drawable;->bookmark_tag:I

    invoke-static {v9, v10}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v9

    iput-object v9, v0, Lcom/flyersoft/views/ContentLay;->visualBm:Landroid/graphics/Bitmap;

    .line 170
    :cond_f
    iget-object v9, v0, Lcom/flyersoft/views/ContentLay;->visualBookmarks:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_6
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_13

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/flyersoft/tools/A$Bookmark;

    .line 171
    iget v11, v10, Lcom/flyersoft/tools/A$Bookmark;->color:I

    invoke-static {v3, v7, v11}, Lcom/flyersoft/tools/A;->createBookmarkPaint(III)Landroid/graphics/Paint;

    move-result-object v11

    .line 172
    iget v12, v10, Lcom/flyersoft/tools/A$Bookmark;->drawY2:I

    mul-int/lit8 v13, v2, 0x9

    div-int/lit8 v13, v13, 0x64

    add-int/2addr v12, v13

    .line 173
    iget-object v13, v0, Lcom/flyersoft/views/ContentLay;->visualBookmarks:Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v13

    if-ne v13, v6, :cond_10

    iget v13, v10, Lcom/flyersoft/tools/A$Bookmark;->drawY2:I

    sget-object v14, Lcom/flyersoft/tools/A;->txtScroll:Landroid/widget/ScrollView;

    invoke-virtual {v14}, Landroid/widget/ScrollView;->getPaddingTop()I

    move-result v14

    add-int/2addr v14, v2

    if-ge v13, v14, :cond_10

    .line 174
    invoke-virtual {v0}, Lcom/flyersoft/views/ContentLay;->getWidth()I

    move-result v12

    sub-int/2addr v12, v8

    sub-int/2addr v12, v7

    .line 175
    invoke-static {v4}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v13

    sub-int v13, v3, v13

    if-le v13, v7, :cond_10

    iget v10, v10, Lcom/flyersoft/tools/A$Bookmark;->color:I

    if-nez v10, :cond_10

    const/4 v11, 0x0

    .line 178
    :cond_10
    sget-object v10, Lcom/flyersoft/tools/A;->txtScroll:Landroid/widget/ScrollView;

    invoke-virtual {v10}, Landroid/widget/ScrollView;->getPaddingTop()I

    move-result v10

    const/high16 v13, 0x40000000    # 2.0f

    invoke-static {v13}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v13

    add-int/2addr v10, v13

    if-ge v12, v10, :cond_12

    .line 179
    invoke-static {}, Lcom/flyersoft/tools/A;->getBookmarkYoff()I

    move-result v10

    if-nez v10, :cond_11

    .line 180
    invoke-static {}, Lcom/flyersoft/tools/A;->isFullScreenPhone()Z

    move-result v13

    if-eqz v13, :cond_11

    sget-boolean v13, Lcom/flyersoft/tools/A;->fullscreen:Z

    if-eqz v13, :cond_11

    const/high16 v10, 0x41600000    # 14.0f

    .line 181
    invoke-static {v10}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v12

    goto :goto_7

    :cond_11
    add-int/2addr v12, v10

    .line 185
    :cond_12
    :goto_7
    iget-object v10, v0, Lcom/flyersoft/views/ContentLay;->visualBm:Landroid/graphics/Bitmap;

    new-instance v13, Landroid/graphics/Rect;

    iget-object v14, v0, Lcom/flyersoft/views/ContentLay;->visualBm:Landroid/graphics/Bitmap;

    .line 186
    invoke-virtual {v14}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v14

    iget-object v15, v0, Lcom/flyersoft/views/ContentLay;->visualBm:Landroid/graphics/Bitmap;

    invoke-virtual {v15}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v15

    invoke-direct {v13, v5, v5, v14, v15}, Landroid/graphics/Rect;-><init>(IIII)V

    new-instance v14, Landroid/graphics/Rect;

    add-int v15, v8, v7

    add-int v4, v12, v2

    invoke-direct {v14, v8, v12, v15, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 185
    invoke-virtual {v1, v10, v13, v14, v11}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    const/high16 v4, 0x3f800000    # 1.0f

    goto/16 :goto_6

    :cond_13
    return-void
.end method

.method private drawFullImageOnly(Landroid/graphics/Canvas;)Z
    .locals 10

    .line 196
    iget-object v0, p0, Lcom/flyersoft/views/ContentLay;->fullImage:Landroid/graphics/drawable/Drawable;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/views/ContentLay;->fullImageName:Ljava/lang/String;

    if-eqz v0, :cond_0

    sget-object v2, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    sget v3, Lcom/flyersoft/tools/A;->lastChapter:I

    .line 197
    invoke-virtual {v2, v3}, Lcom/flyersoft/books/BaseEBook;->get(I)Lcom/flyersoft/books/BaseEBook$Chapter;

    move-result-object v2

    iget-object v2, v2, Lcom/flyersoft/books/BaseEBook$Chapter;->hasImageOnly:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 198
    :cond_0
    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    sget v2, Lcom/flyersoft/tools/A;->lastChapter:I

    invoke-virtual {v0, v2}, Lcom/flyersoft/books/BaseEBook;->get(I)Lcom/flyersoft/books/BaseEBook$Chapter;

    move-result-object v0

    iget-object v0, v0, Lcom/flyersoft/books/BaseEBook$Chapter;->hasImageOnly:Ljava/lang/String;

    iput-object v0, p0, Lcom/flyersoft/views/ContentLay;->fullImageName:Ljava/lang/String;

    .line 199
    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    iget-object v2, p0, Lcom/flyersoft/views/ContentLay;->fullImageName:Ljava/lang/String;

    invoke-virtual {v0, v2, v1}, Lcom/flyersoft/books/BaseEBook;->getDrawableFromSource(Ljava/lang/String;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/views/ContentLay;->fullImage:Landroid/graphics/drawable/Drawable;

    .line 203
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/views/ContentLay;->fullImage:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_2

    return v1

    .line 205
    :cond_2
    sget-object v0, Lcom/flyersoft/tools/A;->contentLay:Lcom/flyersoft/views/ContentLay;

    invoke-virtual {v0}, Lcom/flyersoft/views/ContentLay;->getWidth()I

    move-result v0

    .line 206
    sget-object v2, Lcom/flyersoft/tools/A;->contentLay:Lcom/flyersoft/views/ContentLay;

    invoke-virtual {v2}, Lcom/flyersoft/views/ContentLay;->getHeight()I

    move-result v2

    .line 207
    sget-object v3, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    .line 208
    iget-object v4, v3, Lcom/flyersoft/moonreaderp/ActivityTxt;->statusLayHori:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    move-result v4

    if-nez v4, :cond_3

    .line 209
    iget-object v4, v3, Lcom/flyersoft/moonreaderp/ActivityTxt;->statusLayHori:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    move-result v4

    sub-int/2addr v2, v4

    .line 211
    :cond_3
    invoke-virtual {v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->dualPageEnabled()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 212
    sget v3, Lcom/flyersoft/tools/A;->leftMargin:I

    mul-int/lit8 v3, v3, 0x7

    div-int/lit8 v3, v3, 0x5

    .line 213
    div-int/lit8 v0, v0, 0x2

    sget v4, Lcom/flyersoft/tools/A;->leftMargin:I

    sub-int/2addr v0, v4

    sget v4, Lcom/flyersoft/tools/A;->rightMargin:I

    sub-int/2addr v0, v4

    .line 214
    invoke-static {}, Lcom/flyersoft/tools/A;->getTopMargin()I

    move-result v4

    mul-int/lit8 v4, v4, 0x7

    div-int/lit8 v4, v4, 0x5

    sub-int/2addr v2, v4

    goto :goto_1

    .line 217
    :cond_4
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    .line 218
    invoke-static {}, Lcom/flyersoft/tools/A;->useAmoled()Z

    move-result v4

    if-eqz v4, :cond_5

    const/high16 v4, -0x1000000

    goto :goto_0

    :cond_5
    const v4, -0x11cccccd

    :goto_0
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 219
    new-instance v4, Landroid/graphics/Rect;

    invoke-direct {v4, v1, v1, v0, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {p1, v4, v3}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 222
    :goto_1
    iget-object v5, p0, Lcom/flyersoft/views/ContentLay;->fullImage:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v5

    .line 223
    iget-object v6, p0, Lcom/flyersoft/views/ContentLay;->fullImage:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v6

    int-to-float v7, v0

    int-to-float v8, v5

    div-float/2addr v7, v8

    int-to-float v8, v2

    int-to-float v9, v6

    div-float/2addr v8, v9

    const/4 v9, 0x1

    cmpg-float v7, v7, v8

    if-gez v7, :cond_6

    const/4 v1, 0x1

    :cond_6
    if-eqz v1, :cond_7

    mul-int v6, v6, v0

    .line 230
    div-int/2addr v6, v5

    move v5, v0

    goto :goto_2

    :cond_7
    mul-int v5, v5, v2

    .line 233
    div-int/2addr v5, v6

    move v6, v2

    :goto_2
    if-eqz v1, :cond_8

    .line 236
    new-instance v1, Landroid/graphics/Rect;

    sub-int/2addr v2, v6

    div-int/lit8 v2, v2, 0x2

    add-int/2addr v0, v3

    add-int/2addr v6, v2

    invoke-direct {v1, v3, v2, v0, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    goto :goto_3

    .line 237
    :cond_8
    new-instance v1, Landroid/graphics/Rect;

    sub-int/2addr v0, v5

    div-int/lit8 v0, v0, 0x2

    add-int/2addr v5, v0

    add-int/2addr v2, v4

    invoke-direct {v1, v0, v4, v5, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 239
    :goto_3
    iget-object v0, p0, Lcom/flyersoft/views/ContentLay;->fullImage:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 240
    iget-object v0, p0, Lcom/flyersoft/views/ContentLay;->fullImage:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 242
    sget p1, Lcom/flyersoft/tools/A;->flip_animation:I

    if-nez p1, :cond_9

    .line 243
    invoke-virtual {p0}, Lcom/flyersoft/views/ContentLay;->invalidate()V

    :cond_9
    return v9
.end method


# virtual methods
.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 6

    .line 65
    invoke-virtual {p0}, Lcom/flyersoft/views/ContentLay;->isInEditMode()Z

    move-result v0

    if-nez v0, :cond_8

    iget-boolean v0, p0, Lcom/flyersoft/views/ContentLay;->disableDraw:Z

    if-eqz v0, :cond_0

    goto/16 :goto_0

    .line 68
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/views/ContentLay;->finished:Z

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    .line 69
    iget-object v0, p0, Lcom/flyersoft/views/ContentLay;->drawCache:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_8

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_8

    .line 70
    iget-object v0, p0, Lcom/flyersoft/views/ContentLay;->drawCache:Landroid/graphics/Bitmap;

    invoke-virtual {p1, v0, v1, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    return-void

    .line 73
    :cond_1
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    .line 74
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v3

    if-eqz v3, :cond_2

    goto/16 :goto_0

    .line 78
    :cond_2
    :try_start_0
    iget-boolean v3, p0, Lcom/flyersoft/views/ContentLay;->magnifierStart:Z

    if-eqz v3, :cond_4

    .line 79
    iget-object v3, p0, Lcom/flyersoft/views/ContentLay;->drawCache:Landroid/graphics/Bitmap;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->recycle(Landroid/graphics/Bitmap;)Z

    .line 80
    invoke-virtual {p0}, Lcom/flyersoft/views/ContentLay;->getWidth()I

    move-result v3

    invoke-virtual {p0}, Lcom/flyersoft/views/ContentLay;->getHeight()I

    move-result v4

    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v4, v5}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v3

    iput-object v3, p0, Lcom/flyersoft/views/ContentLay;->drawCache:Landroid/graphics/Bitmap;

    .line 81
    new-instance v3, Landroid/graphics/Canvas;

    iget-object v4, p0, Lcom/flyersoft/views/ContentLay;->drawCache:Landroid/graphics/Bitmap;

    invoke-direct {v3, v4}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v3, p0, Lcom/flyersoft/views/ContentLay;->canvasCache:Landroid/graphics/Canvas;

    .line 82
    invoke-direct {p0, v3}, Lcom/flyersoft/views/ContentLay;->dispatchDraw2(Landroid/graphics/Canvas;)V

    .line 83
    iget-object v3, p0, Lcom/flyersoft/views/ContentLay;->drawCache:Landroid/graphics/Bitmap;

    invoke-virtual {p1, v3, v1, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 89
    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->web:Lcom/flyersoft/views/MRBookView;

    if-nez v0, :cond_3

    invoke-static {}, Lcom/flyersoft/tools/A;->currentChapterWithImageOnly()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 90
    invoke-direct {p0, p1}, Lcom/flyersoft/views/ContentLay;->drawFullImageOnly(Landroid/graphics/Canvas;)Z

    return-void

    .line 92
    :cond_3
    iget-object p1, p0, Lcom/flyersoft/views/ContentLay;->fullImage:Landroid/graphics/drawable/Drawable;

    if-eqz p1, :cond_8

    .line 93
    iput-object v2, p0, Lcom/flyersoft/views/ContentLay;->fullImage:Landroid/graphics/drawable/Drawable;

    .line 94
    sget p1, Lcom/flyersoft/tools/A;->flip_animation:I

    if-nez p1, :cond_8

    .line 95
    invoke-virtual {p0}, Lcom/flyersoft/views/ContentLay;->invalidate()V

    return-void

    .line 87
    :cond_4
    :try_start_1
    invoke-direct {p0, p1}, Lcom/flyersoft/views/ContentLay;->dispatchDraw2(Landroid/graphics/Canvas;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 89
    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->web:Lcom/flyersoft/views/MRBookView;

    if-nez v0, :cond_5

    invoke-static {}, Lcom/flyersoft/tools/A;->currentChapterWithImageOnly()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 90
    invoke-direct {p0, p1}, Lcom/flyersoft/views/ContentLay;->drawFullImageOnly(Landroid/graphics/Canvas;)Z

    return-void

    .line 92
    :cond_5
    iget-object p1, p0, Lcom/flyersoft/views/ContentLay;->fullImage:Landroid/graphics/drawable/Drawable;

    if-eqz p1, :cond_8

    .line 93
    iput-object v2, p0, Lcom/flyersoft/views/ContentLay;->fullImage:Landroid/graphics/drawable/Drawable;

    .line 94
    sget p1, Lcom/flyersoft/tools/A;->flip_animation:I

    if-nez p1, :cond_8

    .line 95
    invoke-virtual {p0}, Lcom/flyersoft/views/ContentLay;->invalidate()V

    return-void

    :catchall_0
    move-exception v1

    .line 89
    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->web:Lcom/flyersoft/views/MRBookView;

    if-nez v0, :cond_6

    invoke-static {}, Lcom/flyersoft/tools/A;->currentChapterWithImageOnly()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 90
    invoke-direct {p0, p1}, Lcom/flyersoft/views/ContentLay;->drawFullImageOnly(Landroid/graphics/Canvas;)Z

    goto :goto_0

    .line 92
    :cond_6
    iget-object p1, p0, Lcom/flyersoft/views/ContentLay;->fullImage:Landroid/graphics/drawable/Drawable;

    if-eqz p1, :cond_7

    .line 93
    iput-object v2, p0, Lcom/flyersoft/views/ContentLay;->fullImage:Landroid/graphics/drawable/Drawable;

    .line 94
    sget p1, Lcom/flyersoft/tools/A;->flip_animation:I

    if-nez p1, :cond_7

    .line 95
    invoke-virtual {p0}, Lcom/flyersoft/views/ContentLay;->invalidate()V

    .line 102
    :cond_7
    throw v1

    :cond_8
    :goto_0
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 0

    .line 39
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public releaseCache()V
    .locals 1

    .line 55
    iget-object v0, p0, Lcom/flyersoft/views/ContentLay;->drawCache:Landroid/graphics/Bitmap;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->recycle(Landroid/graphics/Bitmap;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 56
    iput-object v0, p0, Lcom/flyersoft/views/ContentLay;->drawCache:Landroid/graphics/Bitmap;

    .line 57
    iput-object v0, p0, Lcom/flyersoft/views/ContentLay;->canvasCache:Landroid/graphics/Canvas;

    :cond_0
    return-void
.end method

.method public saveShot()V
    .locals 3

    .line 248
    invoke-virtual {p0}, Lcom/flyersoft/views/ContentLay;->releaseCache()V

    .line 249
    invoke-virtual {p0}, Lcom/flyersoft/views/ContentLay;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/flyersoft/views/ContentLay;->getHeight()I

    move-result v1

    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/views/ContentLay;->drawCache:Landroid/graphics/Bitmap;

    .line 250
    new-instance v0, Landroid/graphics/Canvas;

    iget-object v1, p0, Lcom/flyersoft/views/ContentLay;->drawCache:Landroid/graphics/Bitmap;

    invoke-direct {v0, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v0, p0, Lcom/flyersoft/views/ContentLay;->canvasCache:Landroid/graphics/Canvas;

    .line 251
    invoke-virtual {p0, v0}, Lcom/flyersoft/views/ContentLay;->dispatchDraw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public setAnimationState(Z)V
    .locals 0

    if-nez p1, :cond_0

    .line 49
    invoke-virtual {p0}, Lcom/flyersoft/views/ContentLay;->releaseCache()V

    .line 51
    :cond_0
    iput-boolean p1, p0, Lcom/flyersoft/views/ContentLay;->animationStart:Z

    return-void
.end method
