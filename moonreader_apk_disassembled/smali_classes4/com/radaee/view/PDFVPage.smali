.class public Lcom/radaee/view/PDFVPage;
.super Ljava/lang/Object;
.source "PDFVPage.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static m_thumb_paint:Landroid/graphics/Paint; = null

.field private static size_limit:I = 0x300000


# instance fields
.field protected m_bmp:Landroid/graphics/Bitmap;

.field public m_cache:Lcom/radaee/view/PDFVCache;

.field protected m_doc:Lcom/radaee/pdf/Document;

.field protected m_h:I

.field protected m_pageno:I

.field protected m_scale:F

.field protected m_sel:Lcom/radaee/view/PDFVSel;

.field protected m_w:I

.field protected m_x:I

.field protected m_y:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method protected constructor <init>(Lcom/radaee/pdf/Document;I)V
    .locals 1

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 25
    iput v0, p0, Lcom/radaee/view/PDFVPage;->m_w:I

    .line 26
    iput v0, p0, Lcom/radaee/view/PDFVPage;->m_h:I

    const/4 v0, 0x0

    .line 29
    iput-object v0, p0, Lcom/radaee/view/PDFVPage;->m_bmp:Landroid/graphics/Bitmap;

    .line 33
    iput p2, p0, Lcom/radaee/view/PDFVPage;->m_pageno:I

    .line 34
    iput-object p1, p0, Lcom/radaee/view/PDFVPage;->m_doc:Lcom/radaee/pdf/Document;

    .line 35
    sget-object p1, Lcom/radaee/view/PDFVPage;->m_thumb_paint:Landroid/graphics/Paint;

    if-nez p1, :cond_0

    .line 37
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    sput-object p1, Lcom/radaee/view/PDFVPage;->m_thumb_paint:Landroid/graphics/Paint;

    .line 38
    sget-object p2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 39
    sget-object p1, Lcom/radaee/view/PDFVPage;->m_thumb_paint:Landroid/graphics/Paint;

    const/4 p2, -0x1

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    :cond_0
    return-void
.end method


# virtual methods
.method protected CancelRender()Lcom/radaee/view/PDFVCache;
    .locals 2

    .line 73
    iget-object v0, p0, Lcom/radaee/view/PDFVPage;->m_cache:Lcom/radaee/view/PDFVCache;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 74
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/PDFVPage;->m_sel:Lcom/radaee/view/PDFVSel;

    if-eqz v0, :cond_1

    .line 76
    invoke-virtual {v0}, Lcom/radaee/view/PDFVSel;->Clear()V

    .line 77
    iput-object v1, p0, Lcom/radaee/view/PDFVPage;->m_sel:Lcom/radaee/view/PDFVSel;

    .line 79
    :cond_1
    iget-object v0, p0, Lcom/radaee/view/PDFVPage;->m_cache:Lcom/radaee/view/PDFVCache;

    .line 80
    iput-object v1, p0, Lcom/radaee/view/PDFVPage;->m_cache:Lcom/radaee/view/PDFVCache;

    .line 81
    invoke-virtual {v0}, Lcom/radaee/view/PDFVCache;->UIRenderCancel()V

    return-object v0
.end method

.method protected final ClearSel()V
    .locals 2

    .line 102
    iget-object v0, p0, Lcom/radaee/view/PDFVPage;->m_sel:Lcom/radaee/view/PDFVSel;

    if-eqz v0, :cond_0

    const/4 v1, -0x1

    .line 104
    iput v1, v0, Lcom/radaee/view/PDFVSel;->m_index1:I

    .line 105
    iget-object v0, p0, Lcom/radaee/view/PDFVPage;->m_sel:Lcom/radaee/view/PDFVSel;

    iput v1, v0, Lcom/radaee/view/PDFVSel;->m_index2:I

    :cond_0
    return-void
.end method

.method protected CreateBmp(Landroid/graphics/Bitmap$Config;)V
    .locals 9

    .line 188
    iget-object v0, p0, Lcom/radaee/view/PDFVPage;->m_cache:Lcom/radaee/view/PDFVCache;

    if-eqz v0, :cond_5

    iget v0, v0, Lcom/radaee/view/PDFVCache;->m_status:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_5

    iget-object v0, p0, Lcom/radaee/view/PDFVPage;->m_bmp:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    goto/16 :goto_4

    .line 189
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/PDFVPage;->m_cache:Lcom/radaee/view/PDFVCache;

    iget v0, v0, Lcom/radaee/view/PDFVCache;->m_dibw:I

    if-lez v0, :cond_4

    iget-object v0, p0, Lcom/radaee/view/PDFVPage;->m_cache:Lcom/radaee/view/PDFVCache;

    iget v0, v0, Lcom/radaee/view/PDFVCache;->m_dibh:I

    if-lez v0, :cond_4

    .line 192
    iget-object v0, p0, Lcom/radaee/view/PDFVPage;->m_cache:Lcom/radaee/view/PDFVCache;

    iget v0, v0, Lcom/radaee/view/PDFVCache;->m_dibw:I

    iget-object v2, p0, Lcom/radaee/view/PDFVPage;->m_cache:Lcom/radaee/view/PDFVCache;

    iget v2, v2, Lcom/radaee/view/PDFVCache;->m_dibh:I

    mul-int v0, v0, v2

    const v2, 0xf4240

    if-le v0, v2, :cond_1

    .line 193
    iget-object v0, p0, Lcom/radaee/view/PDFVPage;->m_cache:Lcom/radaee/view/PDFVCache;

    iget v0, v0, Lcom/radaee/view/PDFVCache;->m_dibw:I

    iget-object v2, p0, Lcom/radaee/view/PDFVPage;->m_cache:Lcom/radaee/view/PDFVCache;

    iget v2, v2, Lcom/radaee/view/PDFVCache;->m_dibh:I

    mul-int v0, v0, v2

    int-to-float v0, v0

    const v2, 0x49742400    # 1000000.0f

    div-float/2addr v2, v0

    invoke-static {v2}, Lcom/radaee/pdf/Global;->sqrtf(F)F

    move-result v0

    goto :goto_0

    :cond_1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 194
    :goto_0
    iget-object v2, p0, Lcom/radaee/view/PDFVPage;->m_cache:Lcom/radaee/view/PDFVCache;

    iget v2, v2, Lcom/radaee/view/PDFVCache;->m_dibw:I

    int-to-float v2, v2

    mul-float v2, v2, v0

    float-to-int v2, v2

    .line 195
    iget-object v3, p0, Lcom/radaee/view/PDFVPage;->m_cache:Lcom/radaee/view/PDFVCache;

    iget v3, v3, Lcom/radaee/view/PDFVCache;->m_dibh:I

    int-to-float v3, v3

    mul-float v3, v3, v0

    float-to-int v0, v3

    if-gtz v2, :cond_2

    const/4 v7, 0x1

    goto :goto_1

    :cond_2
    move v7, v2

    :goto_1
    if-gtz v0, :cond_3

    const/4 v8, 0x1

    goto :goto_2

    :cond_3
    move v8, v0

    .line 200
    :goto_2
    :try_start_0
    invoke-static {v7, v8, p1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/radaee/view/PDFVPage;->m_bmp:Landroid/graphics/Bitmap;

    .line 201
    new-instance v4, Lcom/radaee/pdf/BMP;

    invoke-direct {v4}, Lcom/radaee/pdf/BMP;-><init>()V

    .line 202
    iget-object p1, p0, Lcom/radaee/view/PDFVPage;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {v4, p1}, Lcom/radaee/pdf/BMP;->Create(Landroid/graphics/Bitmap;)V

    .line 203
    iget-object p1, p0, Lcom/radaee/view/PDFVPage;->m_cache:Lcom/radaee/view/PDFVCache;

    iget-object v3, p1, Lcom/radaee/view/PDFVCache;->m_dib:Lcom/radaee/pdf/DIB;

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v3 .. v8}, Lcom/radaee/pdf/DIB;->DrawToBmp2(Lcom/radaee/pdf/BMP;IIII)V

    .line 204
    iget-object p1, p0, Lcom/radaee/view/PDFVPage;->m_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {v4, p1}, Lcom/radaee/pdf/BMP;->Free(Landroid/graphics/Bitmap;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :catch_0
    nop

    .line 210
    :cond_4
    :goto_3
    iget-object p1, p0, Lcom/radaee/view/PDFVPage;->m_cache:Lcom/radaee/view/PDFVCache;

    invoke-virtual {p1}, Lcom/radaee/view/PDFVCache;->Clear()V

    const/4 p1, 0x0

    .line 211
    iput-object p1, p0, Lcom/radaee/view/PDFVPage;->m_cache:Lcom/radaee/view/PDFVCache;

    .line 212
    iget-object v0, p0, Lcom/radaee/view/PDFVPage;->m_sel:Lcom/radaee/view/PDFVSel;

    if-eqz v0, :cond_5

    .line 214
    invoke-virtual {v0}, Lcom/radaee/view/PDFVSel;->Clear()V

    .line 215
    iput-object p1, p0, Lcom/radaee/view/PDFVPage;->m_sel:Lcom/radaee/view/PDFVSel;

    :cond_5
    :goto_4
    return-void
.end method

.method public final CreateInvertMatrix(FF)Lcom/radaee/pdf/Matrix;
    .locals 6

    .line 353
    new-instance v0, Lcom/radaee/pdf/Matrix;

    iget v1, p0, Lcom/radaee/view/PDFVPage;->m_scale:F

    const/high16 v2, 0x3f800000    # 1.0f

    div-float/2addr v2, v1

    const/high16 v3, -0x40800000    # -1.0f

    div-float/2addr v3, v1

    iget v4, p0, Lcom/radaee/view/PDFVPage;->m_x:I

    int-to-float v4, v4

    sub-float/2addr p1, v4

    div-float/2addr p1, v1

    iget v4, p0, Lcom/radaee/view/PDFVPage;->m_y:I

    iget v5, p0, Lcom/radaee/view/PDFVPage;->m_h:I

    add-int/2addr v4, v5

    int-to-float v4, v4

    sub-float/2addr v4, p2

    div-float/2addr v4, v1

    invoke-direct {v0, v2, v3, p1, v4}, Lcom/radaee/pdf/Matrix;-><init>(FFFF)V

    return-object v0
.end method

.method public final CreateMatrix()Lcom/radaee/pdf/Matrix;
    .locals 5

    .line 343
    new-instance v0, Lcom/radaee/pdf/Matrix;

    iget v1, p0, Lcom/radaee/view/PDFVPage;->m_scale:F

    neg-float v2, v1

    iget v3, p0, Lcom/radaee/view/PDFVPage;->m_h:I

    int-to-float v3, v3

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v4, v3}, Lcom/radaee/pdf/Matrix;-><init>(FFFF)V

    return-object v0
.end method

.method protected final DeleteBmp()V
    .locals 1

    .line 180
    iget-object v0, p0, Lcom/radaee/view/PDFVPage;->m_bmp:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    .line 182
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    const/4 v0, 0x0

    .line 183
    iput-object v0, p0, Lcom/radaee/view/PDFVPage;->m_bmp:Landroid/graphics/Bitmap;

    :cond_0
    return-void
.end method

.method protected Draw(Landroid/graphics/Canvas;II)V
    .locals 9

    .line 161
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 162
    iget v1, p0, Lcom/radaee/view/PDFVPage;->m_x:I

    sub-int/2addr v1, p2

    iput v1, v0, Landroid/graphics/Rect;->left:I

    .line 163
    iget v1, p0, Lcom/radaee/view/PDFVPage;->m_y:I

    sub-int/2addr v1, p3

    iput v1, v0, Landroid/graphics/Rect;->top:I

    .line 164
    iget v1, v0, Landroid/graphics/Rect;->left:I

    iget v2, p0, Lcom/radaee/view/PDFVPage;->m_w:I

    add-int/2addr v1, v2

    iput v1, v0, Landroid/graphics/Rect;->right:I

    .line 165
    iget v1, v0, Landroid/graphics/Rect;->top:I

    iget v2, p0, Lcom/radaee/view/PDFVPage;->m_h:I

    add-int/2addr v1, v2

    iput v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 166
    iget-object v1, p0, Lcom/radaee/view/PDFVPage;->m_bmp:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_0

    const/4 p2, 0x0

    .line 168
    invoke-virtual {p1, v1, p2, v0, p2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    return-void

    .line 171
    :cond_0
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 172
    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/4 v2, -0x1

    .line 173
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 174
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 175
    iget-object v3, p0, Lcom/radaee/view/PDFVPage;->m_sel:Lcom/radaee/view/PDFVSel;

    if-eqz v3, :cond_1

    .line 176
    iget v5, p0, Lcom/radaee/view/PDFVPage;->m_scale:F

    iget-object v0, p0, Lcom/radaee/view/PDFVPage;->m_doc:Lcom/radaee/pdf/Document;

    iget v1, p0, Lcom/radaee/view/PDFVPage;->m_pageno:I

    invoke-virtual {v0, v1}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v6

    iget v0, p0, Lcom/radaee/view/PDFVPage;->m_x:I

    sub-int v7, v0, p2

    iget p2, p0, Lcom/radaee/view/PDFVPage;->m_y:I

    sub-int v8, p2, p3

    move-object v4, p1

    invoke-virtual/range {v3 .. v8}, Lcom/radaee/view/PDFVSel;->DrawSel(Landroid/graphics/Canvas;FFII)V

    :cond_1
    return-void
.end method

.method public Draw(Lcom/radaee/pdf/BMP;II)V
    .locals 10

    .line 128
    iget-object v0, p0, Lcom/radaee/view/PDFVPage;->m_cache:Lcom/radaee/view/PDFVCache;

    if-eqz v0, :cond_1

    .line 129
    iget-object v1, v0, Lcom/radaee/view/PDFVCache;->m_dib:Lcom/radaee/pdf/DIB;

    if-eqz v1, :cond_1

    .line 131
    iget v1, p0, Lcom/radaee/view/PDFVPage;->m_scale:F

    iget v2, p0, Lcom/radaee/view/PDFVPage;->m_w:I

    iget v3, p0, Lcom/radaee/view/PDFVPage;->m_h:I

    invoke-virtual {v0, v1, v2, v3}, Lcom/radaee/view/PDFVCache;->UIIsSame(FII)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 134
    iget-object v0, v0, Lcom/radaee/view/PDFVCache;->m_dib:Lcom/radaee/pdf/DIB;

    iget v1, p0, Lcom/radaee/view/PDFVPage;->m_x:I

    sub-int/2addr v1, p2

    iget v2, p0, Lcom/radaee/view/PDFVPage;->m_y:I

    sub-int/2addr v2, p3

    invoke-virtual {v0, p1, v1, v2}, Lcom/radaee/pdf/DIB;->DrawToBmp(Lcom/radaee/pdf/BMP;II)V

    goto :goto_0

    .line 138
    :cond_0
    iget-object v3, v0, Lcom/radaee/view/PDFVCache;->m_dib:Lcom/radaee/pdf/DIB;

    iget v0, p0, Lcom/radaee/view/PDFVPage;->m_x:I

    sub-int v5, v0, p2

    iget v0, p0, Lcom/radaee/view/PDFVPage;->m_y:I

    sub-int v6, v0, p3

    iget v7, p0, Lcom/radaee/view/PDFVPage;->m_w:I

    iget v8, p0, Lcom/radaee/view/PDFVPage;->m_h:I

    move-object v4, p1

    invoke-virtual/range {v3 .. v8}, Lcom/radaee/pdf/DIB;->DrawToBmp2(Lcom/radaee/pdf/BMP;IIII)V

    goto :goto_0

    .line 141
    :cond_1
    iget v0, p0, Lcom/radaee/view/PDFVPage;->m_x:I

    sub-int v5, v0, p2

    iget v0, p0, Lcom/radaee/view/PDFVPage;->m_y:I

    sub-int v6, v0, p3

    iget v7, p0, Lcom/radaee/view/PDFVPage;->m_w:I

    iget v8, p0, Lcom/radaee/view/PDFVPage;->m_h:I

    const/4 v9, 0x1

    const/4 v4, -0x1

    move-object v3, p1

    invoke-virtual/range {v3 .. v9}, Lcom/radaee/pdf/BMP;->DrawRect(IIIIII)V

    .line 142
    :goto_0
    iget-object v3, p0, Lcom/radaee/view/PDFVPage;->m_sel:Lcom/radaee/view/PDFVSel;

    if-eqz v3, :cond_2

    .line 143
    iget v5, p0, Lcom/radaee/view/PDFVPage;->m_scale:F

    iget-object v0, p0, Lcom/radaee/view/PDFVPage;->m_doc:Lcom/radaee/pdf/Document;

    iget v1, p0, Lcom/radaee/view/PDFVPage;->m_pageno:I

    invoke-virtual {v0, v1}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v6

    iget v0, p0, Lcom/radaee/view/PDFVPage;->m_x:I

    sub-int v7, v0, p2

    iget v0, p0, Lcom/radaee/view/PDFVPage;->m_y:I

    sub-int v8, v0, p3

    move-object v4, p1

    invoke-virtual/range {v3 .. v8}, Lcom/radaee/view/PDFVSel;->DrawSel(Lcom/radaee/pdf/BMP;FFII)V

    :cond_2
    return-void
.end method

.method protected DrawDIB(Lcom/radaee/pdf/DIB;II)V
    .locals 10

    .line 110
    iget-object v0, p0, Lcom/radaee/view/PDFVPage;->m_cache:Lcom/radaee/view/PDFVCache;

    if-eqz v0, :cond_0

    .line 111
    iget-object v1, v0, Lcom/radaee/view/PDFVCache;->m_dib:Lcom/radaee/pdf/DIB;

    if-eqz v1, :cond_0

    .line 113
    iget-object v0, v0, Lcom/radaee/view/PDFVCache;->m_dib:Lcom/radaee/pdf/DIB;

    iget v1, p0, Lcom/radaee/view/PDFVPage;->m_x:I

    sub-int/2addr v1, p2

    iget v2, p0, Lcom/radaee/view/PDFVPage;->m_y:I

    sub-int/2addr v2, p3

    invoke-virtual {v0, p1, v1, v2}, Lcom/radaee/pdf/DIB;->DrawToDIB(Lcom/radaee/pdf/DIB;II)V

    goto :goto_0

    .line 116
    :cond_0
    iget v0, p0, Lcom/radaee/view/PDFVPage;->m_x:I

    sub-int v5, v0, p2

    iget v0, p0, Lcom/radaee/view/PDFVPage;->m_y:I

    sub-int v6, v0, p3

    iget v7, p0, Lcom/radaee/view/PDFVPage;->m_w:I

    iget v8, p0, Lcom/radaee/view/PDFVPage;->m_h:I

    const/4 v9, 0x1

    const/4 v4, -0x1

    move-object v3, p1

    invoke-virtual/range {v3 .. v9}, Lcom/radaee/pdf/DIB;->DrawRect(IIIIII)V

    .line 117
    :goto_0
    iget-object v3, p0, Lcom/radaee/view/PDFVPage;->m_sel:Lcom/radaee/view/PDFVSel;

    if-eqz v3, :cond_1

    .line 118
    iget v5, p0, Lcom/radaee/view/PDFVPage;->m_scale:F

    iget-object v0, p0, Lcom/radaee/view/PDFVPage;->m_doc:Lcom/radaee/pdf/Document;

    iget v1, p0, Lcom/radaee/view/PDFVPage;->m_pageno:I

    invoke-virtual {v0, v1}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v6

    iget v0, p0, Lcom/radaee/view/PDFVPage;->m_x:I

    sub-int v7, v0, p2

    iget v0, p0, Lcom/radaee/view/PDFVPage;->m_y:I

    sub-int v8, v0, p3

    move-object v4, p1

    invoke-virtual/range {v3 .. v8}, Lcom/radaee/view/PDFVSel;->DrawSelToDIB(Lcom/radaee/pdf/DIB;FFII)V

    :cond_1
    return-void
.end method

.method public final GetHeight()I
    .locals 1

    .line 335
    iget v0, p0, Lcom/radaee/view/PDFVPage;->m_h:I

    return v0
.end method

.method public final GetPage()Lcom/radaee/pdf/Page;
    .locals 1

    .line 272
    iget-object v0, p0, Lcom/radaee/view/PDFVPage;->m_cache:Lcom/radaee/view/PDFVCache;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 273
    :cond_0
    iget-object v0, v0, Lcom/radaee/view/PDFVCache;->m_page:Lcom/radaee/pdf/Page;

    return-object v0
.end method

.method public final GetPageNo()I
    .locals 1

    .line 281
    iget v0, p0, Lcom/radaee/view/PDFVPage;->m_pageno:I

    return v0
.end method

.method public final GetScale()F
    .locals 1

    .line 301
    iget v0, p0, Lcom/radaee/view/PDFVPage;->m_scale:F

    return v0
.end method

.method protected final GetSel()Ljava/lang/String;
    .locals 1

    .line 97
    iget-object v0, p0, Lcom/radaee/view/PDFVPage;->m_sel:Lcom/radaee/view/PDFVSel;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 98
    :cond_0
    invoke-virtual {v0}, Lcom/radaee/view/PDFVSel;->GetSelString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected final GetSelRect1(II)[I
    .locals 4

    .line 147
    iget-object v0, p0, Lcom/radaee/view/PDFVPage;->m_sel:Lcom/radaee/view/PDFVSel;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 148
    :cond_0
    iget v1, p0, Lcom/radaee/view/PDFVPage;->m_scale:F

    iget-object v2, p0, Lcom/radaee/view/PDFVPage;->m_doc:Lcom/radaee/pdf/Document;

    iget v3, p0, Lcom/radaee/view/PDFVPage;->m_pageno:I

    invoke-virtual {v2, v3}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v2

    iget v3, p0, Lcom/radaee/view/PDFVPage;->m_x:I

    sub-int/2addr v3, p1

    iget p1, p0, Lcom/radaee/view/PDFVPage;->m_y:I

    sub-int/2addr p1, p2

    invoke-virtual {v0, v1, v2, v3, p1}, Lcom/radaee/view/PDFVSel;->GetRect1(FFII)[I

    move-result-object p1

    return-object p1
.end method

.method protected final GetSelRect2(II)[I
    .locals 4

    .line 152
    iget-object v0, p0, Lcom/radaee/view/PDFVPage;->m_sel:Lcom/radaee/view/PDFVSel;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 153
    :cond_0
    iget v1, p0, Lcom/radaee/view/PDFVPage;->m_scale:F

    iget-object v2, p0, Lcom/radaee/view/PDFVPage;->m_doc:Lcom/radaee/pdf/Document;

    iget v3, p0, Lcom/radaee/view/PDFVPage;->m_pageno:I

    invoke-virtual {v2, v3}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v2

    iget v3, p0, Lcom/radaee/view/PDFVPage;->m_x:I

    sub-int/2addr v3, p1

    iget p1, p0, Lcom/radaee/view/PDFVPage;->m_y:I

    sub-int/2addr p1, p2

    invoke-virtual {v0, v1, v2, v3, p1}, Lcom/radaee/view/PDFVSel;->GetRect2(FFII)[I

    move-result-object p1

    return-object p1
.end method

.method public final GetVX(F)I
    .locals 1

    .line 310
    iget v0, p0, Lcom/radaee/view/PDFVPage;->m_x:I

    float-to-int p1, p1

    sub-int/2addr v0, p1

    return v0
.end method

.method public final GetVY(F)I
    .locals 1

    .line 319
    iget v0, p0, Lcom/radaee/view/PDFVPage;->m_y:I

    float-to-int p1, p1

    sub-int/2addr v0, p1

    return v0
.end method

.method public final GetWidth()I
    .locals 1

    .line 327
    iget v0, p0, Lcom/radaee/view/PDFVPage;->m_w:I

    return v0
.end method

.method public final GetX()I
    .locals 1

    .line 289
    iget v0, p0, Lcom/radaee/view/PDFVPage;->m_x:I

    return v0
.end method

.method public final GetY()I
    .locals 1

    .line 297
    iget v0, p0, Lcom/radaee/view/PDFVPage;->m_y:I

    return v0
.end method

.method public final IsFinished()Z
    .locals 2

    .line 54
    iget-object v0, p0, Lcom/radaee/view/PDFVPage;->m_cache:Lcom/radaee/view/PDFVCache;

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    iget v0, v0, Lcom/radaee/view/PDFVCache;->m_status:I

    if-ne v0, v1, :cond_0

    return v1

    :cond_0
    const/4 v0, 0x0

    return v0

    :cond_1
    return v1
.end method

.method protected NeedBmp()Z
    .locals 6

    .line 220
    iget-object v0, p0, Lcom/radaee/view/PDFVPage;->m_bmp:Landroid/graphics/Bitmap;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 221
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/PDFVPage;->m_cache:Lcom/radaee/view/PDFVCache;

    const/4 v2, 0x1

    if-eqz v0, :cond_2

    .line 222
    iget v0, v0, Lcom/radaee/view/PDFVCache;->m_status:I

    if-ne v0, v2, :cond_2

    iget-object v0, p0, Lcom/radaee/view/PDFVPage;->m_cache:Lcom/radaee/view/PDFVCache;

    iget v3, p0, Lcom/radaee/view/PDFVPage;->m_scale:F

    iget v4, p0, Lcom/radaee/view/PDFVPage;->m_w:I

    iget v5, p0, Lcom/radaee/view/PDFVPage;->m_h:I

    invoke-virtual {v0, v3, v4, v5}, Lcom/radaee/view/PDFVCache;->UIIsSame(FII)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    return v1

    :cond_2
    :goto_0
    return v2
.end method

.method public Reflow(IFZ)Landroid/graphics/Bitmap;
    .locals 2

    .line 367
    iget-object v0, p0, Lcom/radaee/view/PDFVPage;->m_doc:Lcom/radaee/pdf/Document;

    iget v1, p0, Lcom/radaee/view/PDFVPage;->m_pageno:I

    invoke-virtual {v0, v1}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v0

    int-to-float v1, p1

    .line 368
    invoke-virtual {v0, v1, p2, p3}, Lcom/radaee/pdf/Page;->ReflowStart(FFZ)F

    move-result p2

    float-to-int p2, p2

    mul-int p3, p1, p2

    .line 369
    sget v1, Lcom/radaee/view/PDFVPage;->size_limit:I

    if-le p3, v1, :cond_0

    .line 370
    div-int p2, v1, p1

    :cond_0
    mul-int p3, p1, p2

    if-gtz p3, :cond_1

    const/4 p1, 0x0

    return-object p1

    .line 372
    :cond_1
    sget-object p3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, p2, p3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    const/4 p2, -0x1

    .line 373
    invoke-virtual {p1, p2}, Landroid/graphics/Bitmap;->eraseColor(I)V

    const/4 p2, 0x0

    .line 374
    invoke-virtual {v0, p1, p2, p2}, Lcom/radaee/pdf/Page;->ReflowToBmp(Landroid/graphics/Bitmap;FF)Z

    .line 375
    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->Close()V

    return-object p1
.end method

.method public RenderPrepare()I
    .locals 7

    .line 59
    iget-object v0, p0, Lcom/radaee/view/PDFVPage;->m_cache:Lcom/radaee/view/PDFVCache;

    if-nez v0, :cond_0

    .line 61
    new-instance v1, Lcom/radaee/view/PDFVCache;

    iget-object v2, p0, Lcom/radaee/view/PDFVPage;->m_doc:Lcom/radaee/pdf/Document;

    iget v3, p0, Lcom/radaee/view/PDFVPage;->m_pageno:I

    iget v4, p0, Lcom/radaee/view/PDFVPage;->m_scale:F

    iget v5, p0, Lcom/radaee/view/PDFVPage;->m_w:I

    iget v6, p0, Lcom/radaee/view/PDFVPage;->m_h:I

    invoke-direct/range {v1 .. v6}, Lcom/radaee/view/PDFVCache;-><init>(Lcom/radaee/pdf/Document;IFII)V

    iput-object v1, p0, Lcom/radaee/view/PDFVPage;->m_cache:Lcom/radaee/view/PDFVCache;

    const/4 v0, 0x0

    return v0

    .line 64
    :cond_0
    iget v1, p0, Lcom/radaee/view/PDFVPage;->m_scale:F

    iget v2, p0, Lcom/radaee/view/PDFVPage;->m_w:I

    iget v3, p0, Lcom/radaee/view/PDFVPage;->m_h:I

    invoke-virtual {v0, v1, v2, v3}, Lcom/radaee/view/PDFVCache;->UIIsSame(FII)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    return v0

    :cond_1
    const/4 v0, 0x2

    return v0
.end method

.method protected SetRect(IIF)Z
    .locals 1

    .line 44
    iget v0, p0, Lcom/radaee/view/PDFVPage;->m_x:I

    if-ne v0, p1, :cond_0

    iget v0, p0, Lcom/radaee/view/PDFVPage;->m_y:I

    if-ne v0, p2, :cond_0

    iget v0, p0, Lcom/radaee/view/PDFVPage;->m_scale:F

    cmpl-float v0, v0, p3

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 45
    :cond_0
    iput p1, p0, Lcom/radaee/view/PDFVPage;->m_x:I

    .line 46
    iput p2, p0, Lcom/radaee/view/PDFVPage;->m_y:I

    .line 47
    iput p3, p0, Lcom/radaee/view/PDFVPage;->m_scale:F

    .line 48
    iget-object p1, p0, Lcom/radaee/view/PDFVPage;->m_doc:Lcom/radaee/pdf/Document;

    iget p2, p0, Lcom/radaee/view/PDFVPage;->m_pageno:I

    invoke-virtual {p1, p2}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result p1

    mul-float p3, p3, p1

    float-to-int p1, p3

    iput p1, p0, Lcom/radaee/view/PDFVPage;->m_w:I

    .line 49
    iget p1, p0, Lcom/radaee/view/PDFVPage;->m_scale:F

    iget-object p2, p0, Lcom/radaee/view/PDFVPage;->m_doc:Lcom/radaee/pdf/Document;

    iget p3, p0, Lcom/radaee/view/PDFVPage;->m_pageno:I

    invoke-virtual {p2, p3}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result p2

    mul-float p1, p1, p2

    float-to-int p1, p1

    iput p1, p0, Lcom/radaee/view/PDFVPage;->m_h:I

    const/4 p1, 0x1

    return p1
.end method

.method protected final SetSel(FFFFII)V
    .locals 3

    .line 86
    iget-object v0, p0, Lcom/radaee/view/PDFVPage;->m_sel:Lcom/radaee/view/PDFVSel;

    if-nez v0, :cond_0

    new-instance v0, Lcom/radaee/view/PDFVSel;

    iget-object v1, p0, Lcom/radaee/view/PDFVPage;->m_doc:Lcom/radaee/pdf/Document;

    iget v2, p0, Lcom/radaee/view/PDFVPage;->m_pageno:I

    invoke-virtual {v1, v2}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/radaee/view/PDFVSel;-><init>(Lcom/radaee/pdf/Page;)V

    iput-object v0, p0, Lcom/radaee/view/PDFVPage;->m_sel:Lcom/radaee/view/PDFVSel;

    .line 87
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/PDFVPage;->m_sel:Lcom/radaee/view/PDFVSel;

    int-to-float p5, p5

    invoke-virtual {p0, p1, p5}, Lcom/radaee/view/PDFVPage;->ToPDFX(FF)F

    move-result p1

    int-to-float p6, p6

    invoke-virtual {p0, p2, p6}, Lcom/radaee/view/PDFVPage;->ToPDFY(FF)F

    move-result p2

    invoke-virtual {p0, p3, p5}, Lcom/radaee/view/PDFVPage;->ToPDFX(FF)F

    move-result p3

    invoke-virtual {p0, p4, p6}, Lcom/radaee/view/PDFVPage;->ToPDFY(FF)F

    move-result p4

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/radaee/view/PDFVSel;->SetSel(FFFF)V

    return-void
.end method

.method protected final SetSelMarkup(I)Z
    .locals 1

    .line 91
    iget-object v0, p0, Lcom/radaee/view/PDFVPage;->m_sel:Lcom/radaee/view/PDFVSel;

    if-eqz v0, :cond_0

    .line 92
    invoke-virtual {v0, p1}, Lcom/radaee/view/PDFVSel;->SetSelMarkup(I)Z

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public final ToDIBX(F)F
    .locals 1

    .line 255
    iget v0, p0, Lcom/radaee/view/PDFVPage;->m_scale:F

    mul-float p1, p1, v0

    return p1
.end method

.method public final ToDIBY(F)F
    .locals 2

    .line 264
    iget-object v0, p0, Lcom/radaee/view/PDFVPage;->m_doc:Lcom/radaee/pdf/Document;

    iget v1, p0, Lcom/radaee/view/PDFVPage;->m_pageno:I

    invoke-virtual {v0, v1}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v0

    sub-float/2addr v0, p1

    iget p1, p0, Lcom/radaee/view/PDFVPage;->m_scale:F

    mul-float v0, v0, p1

    return v0
.end method

.method public final ToPDFSize(F)F
    .locals 1

    .line 362
    iget v0, p0, Lcom/radaee/view/PDFVPage;->m_scale:F

    div-float/2addr p1, v0

    return p1
.end method

.method public final ToPDFX(FF)F
    .locals 0

    add-float/2addr p2, p1

    .line 234
    iget p1, p0, Lcom/radaee/view/PDFVPage;->m_x:I

    int-to-float p1, p1

    sub-float/2addr p2, p1

    .line 235
    iget p1, p0, Lcom/radaee/view/PDFVPage;->m_scale:F

    div-float/2addr p2, p1

    return p2
.end method

.method public final ToPDFY(FF)F
    .locals 0

    add-float/2addr p2, p1

    .line 245
    iget p1, p0, Lcom/radaee/view/PDFVPage;->m_y:I

    int-to-float p1, p1

    sub-float/2addr p2, p1

    .line 246
    iget p1, p0, Lcom/radaee/view/PDFVPage;->m_h:I

    int-to-float p1, p1

    sub-float/2addr p1, p2

    iget p2, p0, Lcom/radaee/view/PDFVPage;->m_scale:F

    div-float/2addr p1, p2

    return p1
.end method
