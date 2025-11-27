.class public Lcom/radaee/view/VPageCache;
.super Ljava/lang/Object;
.source "VPageCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/radaee/view/VPageCache$VBlock;
    }
.end annotation


# instance fields
.field private m_blks:[Lcom/radaee/view/VPageCache$VBlock;

.field private m_bmp_format:Landroid/graphics/Bitmap$Config;

.field private m_dir:I

.field private m_doc:Lcom/radaee/pdf/Document;

.field private m_pageno:I

.field private m_paint:Landroid/graphics/Paint;

.field private m_scale:F

.field private m_size:I


# direct methods
.method protected constructor <init>(Lcom/radaee/pdf/Document;IILandroid/graphics/Bitmap$Config;)V
    .locals 2

    .line 116
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    iput-object v0, p0, Lcom/radaee/view/VPageCache;->m_bmp_format:Landroid/graphics/Bitmap$Config;

    const/16 v0, 0x64

    if-ge p3, v0, :cond_0

    const/16 p3, 0x64

    .line 118
    :cond_0
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/radaee/view/VPageCache;->m_paint:Landroid/graphics/Paint;

    .line 119
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 120
    iget-object v0, p0, Lcom/radaee/view/VPageCache;->m_paint:Landroid/graphics/Paint;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 121
    iput-object p1, p0, Lcom/radaee/view/VPageCache;->m_doc:Lcom/radaee/pdf/Document;

    .line 122
    iput p2, p0, Lcom/radaee/view/VPageCache;->m_pageno:I

    .line 123
    iput p3, p0, Lcom/radaee/view/VPageCache;->m_size:I

    .line 124
    iput-object p4, p0, Lcom/radaee/view/VPageCache;->m_bmp_format:Landroid/graphics/Bitmap$Config;

    .line 125
    invoke-direct {p0}, Lcom/radaee/view/VPageCache;->init()V

    return-void
.end method

.method static synthetic access$000(Lcom/radaee/view/VPageCache;)Landroid/graphics/Bitmap$Config;
    .locals 0

    .line 15
    iget-object p0, p0, Lcom/radaee/view/VPageCache;->m_bmp_format:Landroid/graphics/Bitmap$Config;

    return-object p0
.end method

.method static synthetic access$100(Lcom/radaee/view/VPageCache;)I
    .locals 0

    .line 15
    iget p0, p0, Lcom/radaee/view/VPageCache;->m_dir:I

    return p0
.end method

.method static synthetic access$200(Lcom/radaee/view/VPageCache;)F
    .locals 0

    .line 15
    iget p0, p0, Lcom/radaee/view/VPageCache;->m_scale:F

    return p0
.end method

.method static synthetic access$300(Lcom/radaee/view/VPageCache;)I
    .locals 0

    .line 15
    iget p0, p0, Lcom/radaee/view/VPageCache;->m_pageno:I

    return p0
.end method

.method static synthetic access$400(Lcom/radaee/view/VPageCache;)Lcom/radaee/pdf/Document;
    .locals 0

    .line 15
    iget-object p0, p0, Lcom/radaee/view/VPageCache;->m_doc:Lcom/radaee/pdf/Document;

    return-object p0
.end method

.method static synthetic access$500(Lcom/radaee/view/VPageCache;)I
    .locals 0

    .line 15
    iget p0, p0, Lcom/radaee/view/VPageCache;->m_size:I

    return p0
.end method

.method static synthetic access$600(Lcom/radaee/view/VPageCache;)Landroid/graphics/Paint;
    .locals 0

    .line 15
    iget-object p0, p0, Lcom/radaee/view/VPageCache;->m_paint:Landroid/graphics/Paint;

    return-object p0
.end method

.method private init()V
    .locals 8

    .line 129
    iget-object v0, p0, Lcom/radaee/view/VPageCache;->m_doc:Lcom/radaee/pdf/Document;

    iget v1, p0, Lcom/radaee/view/VPageCache;->m_pageno:I

    invoke-virtual {v0, v1}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v0

    .line 130
    iget-object v1, p0, Lcom/radaee/view/VPageCache;->m_doc:Lcom/radaee/pdf/Document;

    iget v2, p0, Lcom/radaee/view/VPageCache;->m_pageno:I

    invoke-virtual {v1, v2}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    cmpl-float v5, v0, v1

    if-lez v5, :cond_1

    .line 133
    iput v3, p0, Lcom/radaee/view/VPageCache;->m_dir:I

    .line 134
    iget v5, p0, Lcom/radaee/view/VPageCache;->m_size:I

    int-to-float v6, v5

    div-float/2addr v6, v1

    iput v6, p0, Lcom/radaee/view/VPageCache;->m_scale:F

    mul-float v6, v6, v0

    float-to-int v0, v6

    .line 136
    div-int v1, v0, v5

    .line 137
    new-array v5, v1, [Lcom/radaee/view/VPageCache$VBlock;

    iput-object v5, p0, Lcom/radaee/view/VPageCache;->m_blks:[Lcom/radaee/view/VPageCache$VBlock;

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v1, :cond_0

    .line 140
    new-instance v6, Lcom/radaee/view/VPageCache$VBlock;

    invoke-direct {v6, p0, v2}, Lcom/radaee/view/VPageCache$VBlock;-><init>(Lcom/radaee/view/VPageCache;Lcom/radaee/view/VPageCache$1;)V

    .line 141
    iget-object v7, p0, Lcom/radaee/view/VPageCache;->m_blks:[Lcom/radaee/view/VPageCache$VBlock;

    aput-object v6, v7, v5

    .line 142
    iget v7, p0, Lcom/radaee/view/VPageCache;->m_size:I

    mul-int v7, v7, v5

    iput v7, v6, Lcom/radaee/view/VPageCache$VBlock;->x:I

    .line 143
    iput v4, v6, Lcom/radaee/view/VPageCache$VBlock;->y:I

    .line 144
    iget v7, p0, Lcom/radaee/view/VPageCache;->m_size:I

    iput v7, v6, Lcom/radaee/view/VPageCache$VBlock;->size:I

    .line 145
    iput v4, v6, Lcom/radaee/view/VPageCache$VBlock;->status:I

    .line 146
    iput-object v2, v6, Lcom/radaee/view/VPageCache$VBlock;->bmp:Landroid/graphics/Bitmap;

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_0
    if-lez v1, :cond_3

    .line 149
    iget-object v2, p0, Lcom/radaee/view/VPageCache;->m_blks:[Lcom/radaee/view/VPageCache$VBlock;

    sub-int/2addr v1, v3

    aget-object v1, v2, v1

    iget v2, v1, Lcom/radaee/view/VPageCache$VBlock;->x:I

    sub-int/2addr v0, v2

    iput v0, v1, Lcom/radaee/view/VPageCache$VBlock;->size:I

    return-void

    .line 153
    :cond_1
    iput v4, p0, Lcom/radaee/view/VPageCache;->m_dir:I

    .line 154
    iget v5, p0, Lcom/radaee/view/VPageCache;->m_size:I

    int-to-float v6, v5

    div-float/2addr v6, v0

    iput v6, p0, Lcom/radaee/view/VPageCache;->m_scale:F

    mul-float v6, v6, v1

    float-to-int v0, v6

    .line 156
    div-int v1, v0, v5

    .line 157
    new-array v5, v1, [Lcom/radaee/view/VPageCache$VBlock;

    iput-object v5, p0, Lcom/radaee/view/VPageCache;->m_blks:[Lcom/radaee/view/VPageCache$VBlock;

    const/4 v5, 0x0

    :goto_1
    if-ge v5, v1, :cond_2

    .line 160
    new-instance v6, Lcom/radaee/view/VPageCache$VBlock;

    invoke-direct {v6, p0, v2}, Lcom/radaee/view/VPageCache$VBlock;-><init>(Lcom/radaee/view/VPageCache;Lcom/radaee/view/VPageCache$1;)V

    .line 161
    iget-object v7, p0, Lcom/radaee/view/VPageCache;->m_blks:[Lcom/radaee/view/VPageCache$VBlock;

    aput-object v6, v7, v5

    .line 162
    iput v4, v6, Lcom/radaee/view/VPageCache$VBlock;->x:I

    .line 163
    iget v7, p0, Lcom/radaee/view/VPageCache;->m_size:I

    mul-int v7, v7, v5

    iput v7, v6, Lcom/radaee/view/VPageCache$VBlock;->y:I

    .line 164
    iget v7, p0, Lcom/radaee/view/VPageCache;->m_size:I

    iput v7, v6, Lcom/radaee/view/VPageCache$VBlock;->size:I

    .line 165
    iput v4, v6, Lcom/radaee/view/VPageCache$VBlock;->status:I

    .line 166
    iput-object v2, v6, Lcom/radaee/view/VPageCache$VBlock;->bmp:Landroid/graphics/Bitmap;

    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_2
    if-lez v1, :cond_3

    .line 169
    iget-object v2, p0, Lcom/radaee/view/VPageCache;->m_blks:[Lcom/radaee/view/VPageCache$VBlock;

    sub-int/2addr v1, v3

    aget-object v1, v2, v1

    iget v2, v1, Lcom/radaee/view/VPageCache$VBlock;->y:I

    sub-int/2addr v0, v2

    iput v0, v1, Lcom/radaee/view/VPageCache$VBlock;->size:I

    :cond_3
    return-void
.end method


# virtual methods
.method protected final blk_cancel(I)Lcom/radaee/view/VPageCache$VBlock;
    .locals 4

    .line 194
    iget-object v0, p0, Lcom/radaee/view/VPageCache;->m_blks:[Lcom/radaee/view/VPageCache$VBlock;

    aget-object v0, v0, p1

    .line 195
    iget v1, v0, Lcom/radaee/view/VPageCache$VBlock;->status:I

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v1, v2, :cond_0

    .line 197
    invoke-virtual {v0}, Lcom/radaee/view/VPageCache$VBlock;->Cancel()V

    .line 198
    iget-object v1, p0, Lcom/radaee/view/VPageCache;->m_blks:[Lcom/radaee/view/VPageCache$VBlock;

    new-instance v2, Lcom/radaee/view/VPageCache$VBlock;

    invoke-direct {v2, p0, v0, v3}, Lcom/radaee/view/VPageCache$VBlock;-><init>(Lcom/radaee/view/VPageCache;Lcom/radaee/view/VPageCache$VBlock;Lcom/radaee/view/VPageCache$1;)V

    aput-object v2, v1, p1

    return-object v0

    .line 201
    :cond_0
    iget v1, v0, Lcom/radaee/view/VPageCache$VBlock;->status:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_1

    .line 203
    iget-object v1, p0, Lcom/radaee/view/VPageCache;->m_blks:[Lcom/radaee/view/VPageCache$VBlock;

    new-instance v2, Lcom/radaee/view/VPageCache$VBlock;

    invoke-direct {v2, p0, v0, v3}, Lcom/radaee/view/VPageCache$VBlock;-><init>(Lcom/radaee/view/VPageCache;Lcom/radaee/view/VPageCache$VBlock;Lcom/radaee/view/VPageCache$1;)V

    aput-object v2, v1, p1

    return-object v0

    :cond_1
    return-object v3
.end method

.method protected blk_draw(Landroid/graphics/Canvas;FFFFIIF)Z
    .locals 16

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    move/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    const/4 v8, 0x0

    .line 239
    :try_start_0
    invoke-virtual {v1, v2, v3}, Lcom/radaee/view/VPageCache;->blk_get(FF)I

    move-result v9

    .line 240
    invoke-virtual {v1, v4, v5}, Lcom/radaee/view/VPageCache;->blk_get(FF)I

    move-result v10

    .line 241
    new-instance v11, Landroid/graphics/Rect;

    invoke-direct {v11}, Landroid/graphics/Rect;-><init>()V

    .line 242
    new-instance v12, Landroid/graphics/Rect;

    invoke-direct {v12}, Landroid/graphics/Rect;-><init>()V

    .line 244
    iget v13, v1, Lcom/radaee/view/VPageCache;->m_scale:F

    div-float v14, p8, v13

    .line 245
    iget v15, v1, Lcom/radaee/view/VPageCache;->m_dir:I

    if-nez v15, :cond_3

    mul-float v13, v13, v2

    float-to-int v13, v13

    .line 247
    iput v13, v11, Landroid/graphics/Rect;->left:I

    .line 248
    iget v13, v1, Lcom/radaee/view/VPageCache;->m_scale:F

    mul-float v13, v13, v4

    float-to-int v13, v13

    iput v13, v11, Landroid/graphics/Rect;->right:I

    .line 249
    iput v6, v12, Landroid/graphics/Rect;->left:I

    sub-float v2, v4, v2

    mul-float v2, v2, p8

    float-to-int v2, v2

    add-int/2addr v2, v6

    .line 250
    iput v2, v12, Landroid/graphics/Rect;->right:I

    :goto_0
    if-ge v9, v10, :cond_1

    .line 253
    iget-object v2, v1, Lcom/radaee/view/VPageCache;->m_blks:[Lcom/radaee/view/VPageCache$VBlock;

    aget-object v2, v2, v9

    .line 254
    iget-object v4, v1, Lcom/radaee/view/VPageCache;->m_doc:Lcom/radaee/pdf/Document;

    iget v6, v1, Lcom/radaee/view/VPageCache;->m_pageno:I

    invoke-virtual {v4, v6}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v4

    sub-float/2addr v4, v3

    iget v3, v1, Lcom/radaee/view/VPageCache;->m_scale:F

    mul-float v4, v4, v3

    float-to-int v3, v4

    iget v4, v2, Lcom/radaee/view/VPageCache$VBlock;->y:I

    sub-int/2addr v3, v4

    iput v3, v11, Landroid/graphics/Rect;->top:I

    .line 255
    iget v3, v2, Lcom/radaee/view/VPageCache$VBlock;->size:I

    iput v3, v11, Landroid/graphics/Rect;->bottom:I

    .line 256
    iput v7, v12, Landroid/graphics/Rect;->top:I

    .line 257
    invoke-virtual {v11}, Landroid/graphics/Rect;->height()I

    move-result v3

    int-to-float v3, v3

    mul-float v3, v3, v14

    float-to-int v3, v3

    add-int/2addr v7, v3

    iput v7, v12, Landroid/graphics/Rect;->bottom:I

    .line 258
    invoke-virtual {v2, v0, v11, v12}, Lcom/radaee/view/VPageCache$VBlock;->Draw(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Rect;)Z

    move-result v3

    if-nez v3, :cond_0

    return v8

    .line 259
    :cond_0
    iget-object v3, v1, Lcom/radaee/view/VPageCache;->m_doc:Lcom/radaee/pdf/Document;

    iget v4, v1, Lcom/radaee/view/VPageCache;->m_pageno:I

    invoke-virtual {v3, v4}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v3

    iget v4, v2, Lcom/radaee/view/VPageCache$VBlock;->y:I

    iget v2, v2, Lcom/radaee/view/VPageCache$VBlock;->size:I

    add-int/2addr v4, v2

    int-to-float v2, v4

    iget v4, v1, Lcom/radaee/view/VPageCache;->m_scale:F

    div-float/2addr v2, v4

    sub-float/2addr v3, v2

    .line 260
    iget v7, v12, Landroid/graphics/Rect;->bottom:I

    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    :cond_1
    if-gez v9, :cond_2

    const/4 v9, 0x0

    .line 264
    :cond_2
    iget-object v2, v1, Lcom/radaee/view/VPageCache;->m_blks:[Lcom/radaee/view/VPageCache$VBlock;

    aget-object v2, v2, v9

    .line 265
    iget-object v4, v1, Lcom/radaee/view/VPageCache;->m_doc:Lcom/radaee/pdf/Document;

    iget v6, v1, Lcom/radaee/view/VPageCache;->m_pageno:I

    invoke-virtual {v4, v6}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v4

    sub-float/2addr v4, v3

    iget v3, v1, Lcom/radaee/view/VPageCache;->m_scale:F

    mul-float v4, v4, v3

    float-to-int v3, v4

    iget v4, v2, Lcom/radaee/view/VPageCache$VBlock;->y:I

    sub-int/2addr v3, v4

    iput v3, v11, Landroid/graphics/Rect;->top:I

    .line 266
    iget-object v3, v1, Lcom/radaee/view/VPageCache;->m_doc:Lcom/radaee/pdf/Document;

    iget v4, v1, Lcom/radaee/view/VPageCache;->m_pageno:I

    invoke-virtual {v3, v4}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v3

    sub-float/2addr v3, v5

    iget v4, v1, Lcom/radaee/view/VPageCache;->m_scale:F

    mul-float v3, v3, v4

    float-to-int v3, v3

    iget v4, v2, Lcom/radaee/view/VPageCache$VBlock;->y:I

    sub-int/2addr v3, v4

    iput v3, v11, Landroid/graphics/Rect;->bottom:I

    .line 267
    iput v7, v12, Landroid/graphics/Rect;->top:I

    .line 268
    invoke-virtual {v11}, Landroid/graphics/Rect;->height()I

    move-result v3

    int-to-float v3, v3

    mul-float v3, v3, v14

    float-to-int v3, v3

    add-int/2addr v7, v3

    iput v7, v12, Landroid/graphics/Rect;->bottom:I

    .line 269
    invoke-virtual {v2, v0, v11, v12}, Lcom/radaee/view/VPageCache$VBlock;->Draw(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Rect;)Z

    move-result v0

    return v0

    .line 273
    :cond_3
    iget-object v13, v1, Lcom/radaee/view/VPageCache;->m_doc:Lcom/radaee/pdf/Document;

    iget v15, v1, Lcom/radaee/view/VPageCache;->m_pageno:I

    invoke-virtual {v13, v15}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v13

    sub-float/2addr v13, v3

    iget v15, v1, Lcom/radaee/view/VPageCache;->m_scale:F

    mul-float v13, v13, v15

    float-to-int v13, v13

    iput v13, v11, Landroid/graphics/Rect;->top:I

    .line 274
    iget-object v13, v1, Lcom/radaee/view/VPageCache;->m_doc:Lcom/radaee/pdf/Document;

    iget v15, v1, Lcom/radaee/view/VPageCache;->m_pageno:I

    invoke-virtual {v13, v15}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v13

    sub-float/2addr v13, v5

    iget v15, v1, Lcom/radaee/view/VPageCache;->m_scale:F

    mul-float v13, v13, v15

    float-to-int v13, v13

    iput v13, v11, Landroid/graphics/Rect;->bottom:I

    .line 275
    iput v7, v12, Landroid/graphics/Rect;->top:I

    sub-float/2addr v3, v5

    mul-float v3, v3, p8

    float-to-int v3, v3

    add-int/2addr v3, v7

    .line 276
    iput v3, v12, Landroid/graphics/Rect;->bottom:I

    :goto_1
    if-ge v9, v10, :cond_5

    .line 279
    iget-object v3, v1, Lcom/radaee/view/VPageCache;->m_blks:[Lcom/radaee/view/VPageCache$VBlock;

    aget-object v3, v3, v9

    .line 280
    iget v5, v1, Lcom/radaee/view/VPageCache;->m_scale:F

    mul-float v2, v2, v5

    float-to-int v2, v2

    iget v5, v3, Lcom/radaee/view/VPageCache$VBlock;->x:I

    sub-int/2addr v2, v5

    iput v2, v11, Landroid/graphics/Rect;->left:I

    .line 281
    iget v2, v3, Lcom/radaee/view/VPageCache$VBlock;->size:I

    iput v2, v11, Landroid/graphics/Rect;->right:I

    .line 282
    iput v6, v12, Landroid/graphics/Rect;->left:I

    .line 283
    invoke-virtual {v11}, Landroid/graphics/Rect;->width()I

    move-result v2

    int-to-float v2, v2

    mul-float v2, v2, v14

    float-to-int v2, v2

    add-int/2addr v6, v2

    iput v6, v12, Landroid/graphics/Rect;->right:I

    .line 284
    invoke-virtual {v3, v0, v11, v12}, Lcom/radaee/view/VPageCache$VBlock;->Draw(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Rect;)Z

    move-result v2

    if-nez v2, :cond_4

    return v8

    .line 285
    :cond_4
    iget v2, v3, Lcom/radaee/view/VPageCache$VBlock;->x:I

    iget v3, v3, Lcom/radaee/view/VPageCache$VBlock;->size:I

    add-int/2addr v2, v3

    int-to-float v2, v2

    iget v3, v1, Lcom/radaee/view/VPageCache;->m_scale:F

    div-float/2addr v2, v3

    .line 286
    iget v6, v12, Landroid/graphics/Rect;->right:I

    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    :cond_5
    if-gez v9, :cond_6

    const/4 v9, 0x0

    .line 290
    :cond_6
    iget-object v3, v1, Lcom/radaee/view/VPageCache;->m_blks:[Lcom/radaee/view/VPageCache$VBlock;

    aget-object v3, v3, v9

    .line 291
    iget v5, v1, Lcom/radaee/view/VPageCache;->m_scale:F

    mul-float v2, v2, v5

    float-to-int v2, v2

    iget v5, v3, Lcom/radaee/view/VPageCache$VBlock;->x:I

    sub-int/2addr v2, v5

    iput v2, v11, Landroid/graphics/Rect;->left:I

    .line 292
    iget v2, v1, Lcom/radaee/view/VPageCache;->m_scale:F

    mul-float v2, v2, v4

    float-to-int v2, v2

    iget v4, v3, Lcom/radaee/view/VPageCache$VBlock;->x:I

    sub-int/2addr v2, v4

    iput v2, v11, Landroid/graphics/Rect;->right:I

    .line 293
    iput v6, v12, Landroid/graphics/Rect;->left:I

    .line 294
    invoke-virtual {v11}, Landroid/graphics/Rect;->width()I

    move-result v2

    int-to-float v2, v2

    mul-float v2, v2, v14

    float-to-int v2, v2

    add-int/2addr v6, v2

    iput v6, v12, Landroid/graphics/Rect;->right:I

    .line 295
    invoke-virtual {v3, v0, v11, v12}, Lcom/radaee/view/VPageCache$VBlock;->Draw(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Rect;)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    move-exception v0

    .line 298
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    return v8
.end method

.method protected final blk_get(FF)I
    .locals 1

    .line 213
    iget v0, p0, Lcom/radaee/view/VPageCache;->m_dir:I

    if-nez v0, :cond_0

    .line 214
    iget-object p1, p0, Lcom/radaee/view/VPageCache;->m_doc:Lcom/radaee/pdf/Document;

    iget v0, p0, Lcom/radaee/view/VPageCache;->m_pageno:I

    invoke-virtual {p1, v0}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result p1

    sub-float/2addr p1, p2

    iget p2, p0, Lcom/radaee/view/VPageCache;->m_scale:F

    mul-float p1, p1, p2

    float-to-int p1, p1

    iget p2, p0, Lcom/radaee/view/VPageCache;->m_size:I

    div-int/2addr p1, p2

    goto :goto_0

    .line 216
    :cond_0
    iget p2, p0, Lcom/radaee/view/VPageCache;->m_scale:F

    mul-float p1, p1, p2

    float-to-int p1, p1

    iget p2, p0, Lcom/radaee/view/VPageCache;->m_size:I

    div-int/2addr p1, p2

    :goto_0
    if-gez p1, :cond_1

    const/4 p1, 0x0

    .line 218
    :cond_1
    iget-object p2, p0, Lcom/radaee/view/VPageCache;->m_blks:[Lcom/radaee/view/VPageCache$VBlock;

    array-length v0, p2

    if-lt p1, v0, :cond_2

    array-length p1, p2

    add-int/lit8 p1, p1, -0x1

    :cond_2
    return p1
.end method

.method protected final blk_get_count()I
    .locals 1

    .line 224
    iget-object v0, p0, Lcom/radaee/view/VPageCache;->m_blks:[Lcom/radaee/view/VPageCache$VBlock;

    array-length v0, v0

    return v0
.end method

.method protected final blk_render(I)Lcom/radaee/view/VPageCache$VBlock;
    .locals 5

    const/4 v0, 0x0

    .line 177
    :try_start_0
    iget-object v1, p0, Lcom/radaee/view/VPageCache;->m_blks:[Lcom/radaee/view/VPageCache$VBlock;

    aget-object v1, v1, p1

    .line 178
    iget v2, v1, Lcom/radaee/view/VPageCache$VBlock;->status:I

    const/4 v3, 0x1

    if-eq v2, v3, :cond_2

    iget v2, v1, Lcom/radaee/view/VPageCache$VBlock;->status:I

    const/4 v4, 0x2

    if-ne v2, v4, :cond_0

    goto :goto_0

    .line 179
    :cond_0
    iget v2, v1, Lcom/radaee/view/VPageCache$VBlock;->status:I

    const/4 v4, -0x1

    if-ne v2, v4, :cond_1

    .line 181
    new-instance v2, Lcom/radaee/view/VPageCache$VBlock;

    invoke-direct {v2, p0, v1, v0}, Lcom/radaee/view/VPageCache$VBlock;-><init>(Lcom/radaee/view/VPageCache;Lcom/radaee/view/VPageCache$VBlock;Lcom/radaee/view/VPageCache$1;)V

    .line 182
    iget-object v1, p0, Lcom/radaee/view/VPageCache;->m_blks:[Lcom/radaee/view/VPageCache$VBlock;

    aput-object v2, v1, p1

    move-object v1, v2

    .line 184
    :cond_1
    iput v3, v1, Lcom/radaee/view/VPageCache$VBlock;->status:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :cond_2
    :goto_0
    return-object v0

    :catch_0
    move-exception p1

    .line 187
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    return-object v0
.end method

.method protected final blk_rendered()Z
    .locals 6

    .line 228
    iget-object v0, p0, Lcom/radaee/view/VPageCache;->m_blks:[Lcom/radaee/view/VPageCache$VBlock;

    array-length v0, v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    .line 231
    iget-object v3, p0, Lcom/radaee/view/VPageCache;->m_blks:[Lcom/radaee/view/VPageCache$VBlock;

    aget-object v3, v3, v2

    .line 232
    iget v4, v3, Lcom/radaee/view/VPageCache$VBlock;->status:I

    const/4 v5, 0x2

    if-eq v4, v5, :cond_0

    iget v3, v3, Lcom/radaee/view/VPageCache$VBlock;->status:I

    if-eqz v3, :cond_0

    return v1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    return v0
.end method
