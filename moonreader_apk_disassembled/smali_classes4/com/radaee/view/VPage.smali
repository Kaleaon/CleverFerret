.class public Lcom/radaee/view/VPage;
.super Ljava/lang/Object;
.source "VPage.java"

# interfaces
.implements Lcom/radaee/view/ILayoutView$IVPage;


# instance fields
.field private final m_ph:F

.field private final m_pw:F

.field private final m_rect:Landroid/graphics/Rect;

.field private m_result:J

.field private m_scale:F

.field private m_vpage:J

.field private m_zoom_bmp:Landroid/graphics/Bitmap;


# direct methods
.method protected constructor <init>(Lcom/radaee/pdf/Document;IIILandroid/graphics/Bitmap$Config;)V
    .locals 2

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/radaee/view/VPage;->m_rect:Landroid/graphics/Rect;

    const/4 v0, 0x0

    .line 23
    iput-object v0, p0, Lcom/radaee/view/VPage;->m_zoom_bmp:Landroid/graphics/Bitmap;

    const-wide/16 v0, 0x0

    .line 24
    iput-wide v0, p0, Lcom/radaee/view/VPage;->m_result:J

    .line 25
    invoke-virtual {p1, p2, p3, p4, p5}, Lcom/radaee/pdf/Document;->CreateVNPage(IIILandroid/graphics/Bitmap$Config;)J

    move-result-wide p3

    iput-wide p3, p0, Lcom/radaee/view/VPage;->m_vpage:J

    .line 26
    invoke-virtual {p1, p2}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result p3

    iput p3, p0, Lcom/radaee/view/VPage;->m_pw:F

    .line 27
    invoke-virtual {p1, p2}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result p1

    iput p1, p0, Lcom/radaee/view/VPage;->m_ph:F

    const/4 p1, 0x0

    .line 28
    iput p1, p0, Lcom/radaee/view/VPage;->m_scale:F

    return-void
.end method


# virtual methods
.method public final CreateInvertMatrix(FF)Lcom/radaee/pdf/Matrix;
    .locals 2

    .line 192
    iget-wide v0, p0, Lcom/radaee/view/VPage;->m_vpage:J

    invoke-static {v0, v1, p1, p2}, Lcom/radaee/pdf/VNPage;->InvertMatrix(JFF)Lcom/radaee/pdf/Matrix;

    move-result-object p1

    return-object p1
.end method

.method protected final GetHeight()I
    .locals 2

    .line 34
    iget-wide v0, p0, Lcom/radaee/view/VPage;->m_vpage:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/VNPage;->getHeight(J)I

    move-result v0

    return v0
.end method

.method protected final GetPDFX(I)F
    .locals 2

    .line 35
    iget-wide v0, p0, Lcom/radaee/view/VPage;->m_vpage:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/VNPage;->getPDFX(JI)F

    move-result p1

    return p1
.end method

.method protected final GetPDFY(I)F
    .locals 2

    .line 36
    iget-wide v0, p0, Lcom/radaee/view/VPage;->m_vpage:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/VNPage;->getPDFY(JI)F

    move-result p1

    return p1
.end method

.method public final GetPageNo()I
    .locals 2

    .line 37
    iget-wide v0, p0, Lcom/radaee/view/VPage;->m_vpage:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/VNPage;->getPageNo(J)I

    move-result v0

    return v0
.end method

.method public final GetVX(F)I
    .locals 2

    .line 38
    iget-wide v0, p0, Lcom/radaee/view/VPage;->m_vpage:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/VNPage;->getVX(JF)I

    move-result p1

    return p1
.end method

.method public final GetVY(F)I
    .locals 2

    .line 39
    iget-wide v0, p0, Lcom/radaee/view/VPage;->m_vpage:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/VNPage;->getVY(JF)I

    move-result p1

    return p1
.end method

.method protected final GetWidth()I
    .locals 2

    .line 33
    iget-wide v0, p0, Lcom/radaee/view/VPage;->m_vpage:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/VNPage;->getWidth(J)I

    move-result v0

    return v0
.end method

.method public final GetX()I
    .locals 2

    .line 30
    iget-wide v0, p0, Lcom/radaee/view/VPage;->m_vpage:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/VNPage;->getX(J)I

    move-result v0

    return v0
.end method

.method public final GetY()I
    .locals 2

    .line 32
    iget-wide v0, p0, Lcom/radaee/view/VPage;->m_vpage:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/VNPage;->getY(J)I

    move-result v0

    return v0
.end method

.method protected LocHorz(II)I
    .locals 2

    .line 41
    iget-wide v0, p0, Lcom/radaee/view/VPage;->m_vpage:J

    invoke-static {v0, v1, p1, p2}, Lcom/radaee/pdf/VNPage;->lovHorz(JII)I

    move-result p1

    return p1
.end method

.method protected LocVert(II)I
    .locals 2

    .line 40
    iget-wide v0, p0, Lcom/radaee/view/VPage;->m_vpage:J

    invoke-static {v0, v1, p1, p2}, Lcom/radaee/pdf/VNPage;->locVert(JII)I

    move-result p1

    return p1
.end method

.method protected final SetX(I)V
    .locals 2

    .line 31
    iget-wide v0, p0, Lcom/radaee/view/VPage;->m_vpage:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/VNPage;->setX(JI)V

    return-void
.end method

.method public final ToDIBX(F)F
    .locals 2

    .line 173
    iget-wide v0, p0, Lcom/radaee/view/VPage;->m_vpage:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/VNPage;->toDIBX(JF)F

    move-result p1

    return p1
.end method

.method public final ToDIBY(F)F
    .locals 2

    .line 179
    iget-wide v0, p0, Lcom/radaee/view/VPage;->m_vpage:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/VNPage;->toDIBY(JF)F

    move-result p1

    return p1
.end method

.method public final ToPDFSize(F)F
    .locals 2

    .line 182
    iget-wide v0, p0, Lcom/radaee/view/VPage;->m_vpage:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/VNPage;->toPDFSize(JF)F

    move-result p1

    return p1
.end method

.method public final ToPDFX(FF)F
    .locals 2

    .line 160
    iget-wide v0, p0, Lcom/radaee/view/VPage;->m_vpage:J

    invoke-static {v0, v1, p1, p2}, Lcom/radaee/pdf/VNPage;->toPDFX(JFF)F

    move-result p1

    return p1
.end method

.method public final ToPDFY(FF)F
    .locals 2

    .line 167
    iget-wide v0, p0, Lcom/radaee/view/VPage;->m_vpage:J

    invoke-static {v0, v1, p1, p2}, Lcom/radaee/pdf/VNPage;->toPDFY(JFF)F

    move-result p1

    return p1
.end method

.method protected vCacheEnd(Lcom/radaee/pdf/VNPage$VNPageListener;)V
    .locals 2

    .line 82
    iget-wide v0, p0, Lcom/radaee/view/VPage;->m_vpage:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/VNPage;->blkEnd(JLcom/radaee/pdf/VNPage$VNPageListener;)V

    return-void
.end method

.method protected vCacheStart(Lcom/radaee/pdf/VNPage$VNPageListener;FFFF)V
    .locals 7

    .line 71
    iget-wide v0, p0, Lcom/radaee/view/VPage;->m_vpage:J

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-static/range {v0 .. v6}, Lcom/radaee/pdf/VNPage;->blkStart(JLcom/radaee/pdf/VNPage$VNPageListener;FFFF)V

    return-void
.end method

.method protected vCacheStart0(Lcom/radaee/pdf/VNPage$VNPageListener;FF)V
    .locals 2

    .line 75
    iget-wide v0, p0, Lcom/radaee/view/VPage;->m_vpage:J

    invoke-static {v0, v1, p1, p2, p3}, Lcom/radaee/pdf/VNPage;->blkStart0(JLcom/radaee/pdf/VNPage$VNPageListener;FF)V

    return-void
.end method

.method protected vCacheStart1(Lcom/radaee/pdf/VNPage$VNPageListener;)V
    .locals 2

    .line 77
    iget-wide v0, p0, Lcom/radaee/view/VPage;->m_vpage:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/VNPage;->blkStart1(JLcom/radaee/pdf/VNPage$VNPageListener;)V

    return-void
.end method

.method protected vCacheStart2(Lcom/radaee/pdf/VNPage$VNPageListener;FF)V
    .locals 2

    .line 80
    iget-wide v0, p0, Lcom/radaee/view/VPage;->m_vpage:J

    invoke-static {v0, v1, p1, p2, p3}, Lcom/radaee/pdf/VNPage;->blkStart2(JLcom/radaee/pdf/VNPage$VNPageListener;FF)V

    return-void
.end method

.method protected vClips(Lcom/radaee/pdf/VNPage$VNPageListener;Z)V
    .locals 2

    .line 56
    iget-wide v0, p0, Lcom/radaee/view/VPage;->m_vpage:J

    invoke-static {v0, v1, p1, p2}, Lcom/radaee/pdf/VNPage;->clips(JLcom/radaee/pdf/VNPage$VNPageListener;Z)V

    return-void
.end method

.method protected vDestroy(Lcom/radaee/pdf/VNPage$VNPageListener;)V
    .locals 2

    .line 44
    iget-wide v0, p0, Lcom/radaee/view/VPage;->m_vpage:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/VNPage;->destroy(JLcom/radaee/pdf/VNPage$VNPageListener;)V

    const-wide/16 v0, 0x0

    .line 45
    iput-wide v0, p0, Lcom/radaee/view/VPage;->m_vpage:J

    return-void
.end method

.method protected vDraw(Lcom/radaee/pdf/VNPage$VNPageListener;Landroid/graphics/Canvas;II)V
    .locals 10

    .line 90
    iget-wide v0, p0, Lcom/radaee/view/VPage;->m_vpage:J

    iget v5, p0, Lcom/radaee/view/VPage;->m_ph:F

    iget v6, p0, Lcom/radaee/view/VPage;->m_pw:F

    invoke-virtual {p0}, Lcom/radaee/view/VPage;->GetX()I

    move-result v2

    sub-int v8, v2, p3

    invoke-virtual {p0}, Lcom/radaee/view/VPage;->GetY()I

    move-result v2

    sub-int v9, v2, p4

    const/4 v4, 0x0

    const/4 v7, 0x0

    move-object v2, p1

    move-object v3, p2

    invoke-static/range {v0 .. v9}, Lcom/radaee/pdf/VNPage;->blkDraw(JLcom/radaee/pdf/VNPage$VNPageListener;Landroid/graphics/Canvas;FFFFII)Z

    move-result p1

    if-nez p1, :cond_1

    .line 92
    iget-object p1, p0, Lcom/radaee/view/VPage;->m_rect:Landroid/graphics/Rect;

    invoke-virtual {p0}, Lcom/radaee/view/VPage;->GetX()I

    move-result p2

    sub-int/2addr p2, p3

    iput p2, p1, Landroid/graphics/Rect;->left:I

    .line 93
    iget-object p1, p0, Lcom/radaee/view/VPage;->m_rect:Landroid/graphics/Rect;

    invoke-virtual {p0}, Lcom/radaee/view/VPage;->GetY()I

    move-result p2

    sub-int/2addr p2, p4

    iput p2, p1, Landroid/graphics/Rect;->top:I

    .line 94
    iget-object p1, p0, Lcom/radaee/view/VPage;->m_rect:Landroid/graphics/Rect;

    iget p2, p1, Landroid/graphics/Rect;->left:I

    invoke-virtual {p0}, Lcom/radaee/view/VPage;->GetWidth()I

    move-result p3

    add-int/2addr p2, p3

    iput p2, p1, Landroid/graphics/Rect;->right:I

    .line 95
    iget-object p1, p0, Lcom/radaee/view/VPage;->m_rect:Landroid/graphics/Rect;

    iget p2, p1, Landroid/graphics/Rect;->top:I

    invoke-virtual {p0}, Lcom/radaee/view/VPage;->GetHeight()I

    move-result p3

    add-int/2addr p2, p3

    iput p2, p1, Landroid/graphics/Rect;->bottom:I

    .line 96
    iget-object p1, p0, Lcom/radaee/view/VPage;->m_zoom_bmp:Landroid/graphics/Bitmap;

    if-eqz p1, :cond_0

    iget-object p2, p0, Lcom/radaee/view/VPage;->m_rect:Landroid/graphics/Rect;

    const/4 p3, 0x0

    invoke-virtual {v3, p1, p3, p2, p3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    return-void

    .line 99
    :cond_0
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 100
    sget-object p2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/4 p2, -0x1

    .line 101
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 102
    iget-object p2, p0, Lcom/radaee/view/VPage;->m_rect:Landroid/graphics/Rect;

    invoke-virtual {v3, p2, p1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    :cond_1
    return-void
.end method

.method protected vDraw(Lcom/radaee/pdf/VNPage$VNPageListener;Lcom/radaee/pdf/BMP;II)V
    .locals 6

    .line 83
    iget-wide v0, p0, Lcom/radaee/view/VPage;->m_vpage:J

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    invoke-static/range {v0 .. v5}, Lcom/radaee/pdf/VNPage;->Draw(JLcom/radaee/pdf/VNPage$VNPageListener;Lcom/radaee/pdf/BMP;II)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/radaee/view/VPage;->m_result:J

    return-void
.end method

.method protected vDrawEnd()V
    .locals 2

    .line 86
    iget-wide v0, p0, Lcom/radaee/view/VPage;->m_result:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/VNPage;->resultDestroy(J)V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/radaee/view/VPage;->m_result:J

    return-void
.end method

.method protected vDrawStep1(Lcom/radaee/pdf/VNPage$VNPageListener;Landroid/graphics/Canvas;)Z
    .locals 6

    .line 84
    iget-wide v0, p0, Lcom/radaee/view/VPage;->m_vpage:J

    iget-wide v4, p0, Lcom/radaee/view/VPage;->m_result:J

    move-object v2, p1

    move-object v3, p2

    invoke-static/range {v0 .. v5}, Lcom/radaee/pdf/VNPage;->drawStep1(JLcom/radaee/pdf/VNPage$VNPageListener;Landroid/graphics/Canvas;J)Z

    move-result p1

    return p1
.end method

.method protected vDrawStep2(Lcom/radaee/pdf/BMP;)V
    .locals 4

    .line 85
    iget-wide v0, p0, Lcom/radaee/view/VPage;->m_vpage:J

    iget-wide v2, p0, Lcom/radaee/view/VPage;->m_result:J

    invoke-static {v0, v1, p1, v2, v3}, Lcom/radaee/pdf/VNPage;->DrawStep2(JLcom/radaee/pdf/BMP;J)V

    return-void
.end method

.method protected vEndPage(Lcom/radaee/pdf/VNPage$VNPageListener;)V
    .locals 2

    .line 59
    iget-wide v0, p0, Lcom/radaee/view/VPage;->m_vpage:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/VNPage;->endPage(JLcom/radaee/pdf/VNPage$VNPageListener;)V

    .line 60
    iget-object p1, p0, Lcom/radaee/view/VPage;->m_zoom_bmp:Landroid/graphics/Bitmap;

    if-eqz p1, :cond_0

    .line 62
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    const/4 p1, 0x0

    .line 63
    iput-object p1, p0, Lcom/radaee/view/VPage;->m_zoom_bmp:Landroid/graphics/Bitmap;

    :cond_0
    return-void
.end method

.method protected vFinished()Z
    .locals 2

    .line 66
    iget-wide v0, p0, Lcom/radaee/view/VPage;->m_vpage:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/VNPage;->finished(J)Z

    move-result v0

    return v0
.end method

.method public vGetScale()F
    .locals 1

    .line 54
    iget v0, p0, Lcom/radaee/view/VPage;->m_scale:F

    return v0
.end method

.method protected vLayout(IIFZ)V
    .locals 6

    .line 49
    iget-wide v0, p0, Lcom/radaee/view/VPage;->m_vpage:J

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-static/range {v0 .. v5}, Lcom/radaee/pdf/VNPage;->layout(JIIFZ)V

    .line 50
    iput v4, p0, Lcom/radaee/view/VPage;->m_scale:F

    return-void
.end method

.method protected vRenderAsync(Lcom/radaee/pdf/VNPage$VNPageListener;IIII)V
    .locals 7

    .line 67
    iget-wide v0, p0, Lcom/radaee/view/VPage;->m_vpage:J

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-static/range {v0 .. v6}, Lcom/radaee/pdf/VNPage;->renderAsync(JLcom/radaee/pdf/VNPage$VNPageListener;IIII)V

    return-void
.end method

.method protected vRenderSync(Lcom/radaee/pdf/VNPage$VNPageListener;IIII)V
    .locals 7

    .line 68
    iget-wide v0, p0, Lcom/radaee/view/VPage;->m_vpage:J

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-static/range {v0 .. v6}, Lcom/radaee/pdf/VNPage;->renderSync(JLcom/radaee/pdf/VNPage$VNPageListener;IIII)V

    return-void
.end method

.method protected vZoomConfirmed(Lcom/radaee/pdf/VNPage$VNPageListener;IIII)V
    .locals 7

    .line 147
    iget-wide v0, p0, Lcom/radaee/view/VPage;->m_vpage:J

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-static/range {v0 .. v6}, Lcom/radaee/pdf/VNPage;->zoomConfirm(JLcom/radaee/pdf/VNPage$VNPageListener;IIII)V

    return-void
.end method

.method protected vZoomEnd()V
    .locals 1

    .line 151
    iget-object v0, p0, Lcom/radaee/view/VPage;->m_zoom_bmp:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    :cond_0
    const/4 v0, 0x0

    .line 152
    iput-object v0, p0, Lcom/radaee/view/VPage;->m_zoom_bmp:Landroid/graphics/Bitmap;

    return-void
.end method

.method protected vZoomStart(Landroid/graphics/Bitmap$Config;)V
    .locals 8

    .line 109
    :try_start_0
    iget-wide v0, p0, Lcom/radaee/view/VPage;->m_vpage:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/VNPage;->blkRendered(J)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_2

    .line 110
    :cond_0
    invoke-virtual {p0}, Lcom/radaee/view/VPage;->GetWidth()I

    move-result v0

    .line 111
    invoke-virtual {p0}, Lcom/radaee/view/VPage;->GetHeight()I

    move-result v1

    mul-int v2, v0, v1

    int-to-long v2, v2

    const/4 v4, 0x0

    :goto_0
    const-wide/32 v5, 0x100000

    cmp-long v7, v2, v5

    if-lez v7, :cond_1

    const/4 v5, 0x2

    shr-long/2addr v2, v5

    shr-int/lit8 v0, v0, 0x1

    shr-int/lit8 v1, v1, 0x1

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 121
    :cond_1
    iget-object v2, p0, Lcom/radaee/view/VPage;->m_zoom_bmp:Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1

    if-nez v2, :cond_2

    .line 125
    :try_start_1
    invoke-static {v0, v1, p1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    iput-object v2, p0, Lcom/radaee/view/VPage;->m_zoom_bmp:Landroid/graphics/Bitmap;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_0
    shr-int/lit8 v0, v0, 0x1

    shr-int/lit8 v1, v1, 0x1

    add-int/lit8 v4, v4, 0x1

    :goto_1
    const/16 v2, 0x8

    if-le v4, v2, :cond_1

    goto :goto_2

    .line 137
    :cond_2
    :try_start_2
    iget-wide v0, p0, Lcom/radaee/view/VPage;->m_vpage:J

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-nez p1, :cond_3

    goto :goto_2

    .line 138
    :cond_3
    new-instance p1, Lcom/radaee/pdf/BMP;

    invoke-direct {p1}, Lcom/radaee/pdf/BMP;-><init>()V

    .line 139
    iget-object v0, p0, Lcom/radaee/view/VPage;->m_zoom_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {p1, v0}, Lcom/radaee/pdf/BMP;->Create(Landroid/graphics/Bitmap;)V

    .line 140
    iget-wide v0, p0, Lcom/radaee/view/VPage;->m_vpage:J

    invoke-static {v0, v1, p1, v4}, Lcom/radaee/pdf/VNPage;->ZoomStart(JLcom/radaee/pdf/BMP;I)V

    .line 141
    iget-object v0, p0, Lcom/radaee/view/VPage;->m_zoom_bmp:Landroid/graphics/Bitmap;

    invoke-virtual {p1, v0}, Lcom/radaee/pdf/BMP;->Free(Landroid/graphics/Bitmap;)V
    :try_end_2
    .catch Ljava/lang/OutOfMemoryError; {:try_start_2 .. :try_end_2} :catch_1

    :catch_1
    :goto_2
    return-void
.end method
