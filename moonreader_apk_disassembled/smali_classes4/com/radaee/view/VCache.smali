.class public Lcom/radaee/view/VCache;
.super Ljava/lang/Object;
.source "VCache.java"


# instance fields
.field private m_dib:Lcom/radaee/pdf/DIB;

.field private m_doc:Lcom/radaee/pdf/Document;

.field private m_h:I

.field private m_page:Lcom/radaee/pdf/Page;

.field private m_pageno:I

.field private m_render:Z

.field private m_scale:F

.field private m_status:I

.field private m_w:I

.field private m_x:I

.field private m_y:I


# direct methods
.method protected constructor <init>(Lcom/radaee/pdf/Document;IFIIII)V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p1, p0, Lcom/radaee/view/VCache;->m_doc:Lcom/radaee/pdf/Document;

    .line 25
    iput p2, p0, Lcom/radaee/view/VCache;->m_pageno:I

    const/4 p1, 0x0

    .line 26
    iput-object p1, p0, Lcom/radaee/view/VCache;->m_page:Lcom/radaee/pdf/Page;

    .line 27
    iput p3, p0, Lcom/radaee/view/VCache;->m_scale:F

    .line 28
    iput p4, p0, Lcom/radaee/view/VCache;->m_x:I

    .line 29
    iput p5, p0, Lcom/radaee/view/VCache;->m_y:I

    .line 30
    iput p6, p0, Lcom/radaee/view/VCache;->m_w:I

    .line 31
    iput p7, p0, Lcom/radaee/view/VCache;->m_h:I

    .line 32
    iput-object p1, p0, Lcom/radaee/view/VCache;->m_dib:Lcom/radaee/pdf/DIB;

    const/4 p1, 0x0

    .line 33
    iput p1, p0, Lcom/radaee/view/VCache;->m_status:I

    .line 34
    iput-boolean p1, p0, Lcom/radaee/view/VCache;->m_render:Z

    return-void
.end method


# virtual methods
.method protected final clone()Lcom/radaee/view/VCache;
    .locals 8

    .line 42
    new-instance v0, Lcom/radaee/view/VCache;

    iget-object v1, p0, Lcom/radaee/view/VCache;->m_doc:Lcom/radaee/pdf/Document;

    iget v2, p0, Lcom/radaee/view/VCache;->m_pageno:I

    iget v3, p0, Lcom/radaee/view/VCache;->m_scale:F

    iget v4, p0, Lcom/radaee/view/VCache;->m_x:I

    iget v5, p0, Lcom/radaee/view/VCache;->m_y:I

    iget v6, p0, Lcom/radaee/view/VCache;->m_w:I

    iget v7, p0, Lcom/radaee/view/VCache;->m_h:I

    invoke-direct/range {v0 .. v7}, Lcom/radaee/view/VCache;-><init>(Lcom/radaee/pdf/Document;IFIIII)V

    return-object v0
.end method

.method protected bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 9
    invoke-virtual {p0}, Lcom/radaee/view/VCache;->clone()Lcom/radaee/view/VCache;

    move-result-object v0

    return-object v0
.end method

.method protected finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 142
    invoke-virtual {p0}, Lcom/radaee/view/VCache;->vDestroy()V

    .line 143
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method

.method protected vDestroy()V
    .locals 2

    .line 113
    iget-object v0, p0, Lcom/radaee/view/VCache;->m_dib:Lcom/radaee/pdf/DIB;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/radaee/pdf/DIB;->Free()V

    .line 114
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/VCache;->m_page:Lcom/radaee/pdf/Page;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->Close()V

    :cond_1
    const/4 v0, 0x0

    .line 115
    iput v0, p0, Lcom/radaee/view/VCache;->m_status:I

    const/4 v1, 0x0

    .line 116
    iput-object v1, p0, Lcom/radaee/view/VCache;->m_dib:Lcom/radaee/pdf/DIB;

    .line 117
    iput-object v1, p0, Lcom/radaee/view/VCache;->m_page:Lcom/radaee/pdf/Page;

    .line 118
    iput-boolean v0, p0, Lcom/radaee/view/VCache;->m_render:Z

    return-void
.end method

.method protected final vDraw(Lcom/radaee/pdf/BMP;II)V
    .locals 8

    .line 122
    iget-boolean v0, p0, Lcom/radaee/view/VCache;->m_render:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/radaee/view/VCache;->m_dib:Lcom/radaee/pdf/DIB;

    if-eqz v0, :cond_0

    .line 123
    invoke-virtual {v0, p1, p2, p3}, Lcom/radaee/pdf/DIB;->DrawToBmp(Lcom/radaee/pdf/BMP;II)V

    return-void

    .line 125
    :cond_0
    iget v5, p0, Lcom/radaee/view/VCache;->m_w:I

    iget v6, p0, Lcom/radaee/view/VCache;->m_h:I

    const/4 v7, 0x1

    const/4 v2, -0x1

    move-object v1, p1

    move v3, p2

    move v4, p3

    invoke-virtual/range {v1 .. v7}, Lcom/radaee/pdf/BMP;->DrawRect(IIIIII)V

    return-void
.end method

.method protected final vDraw(Lcom/radaee/pdf/BMP;IIII)V
    .locals 9

    .line 129
    iget-boolean v0, p0, Lcom/radaee/view/VCache;->m_render:Z

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/radaee/view/VCache;->m_dib:Lcom/radaee/pdf/DIB;

    if-eqz v1, :cond_0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    .line 130
    invoke-virtual/range {v1 .. v6}, Lcom/radaee/pdf/DIB;->DrawToBmp2(Lcom/radaee/pdf/BMP;IIII)V

    return-void

    :cond_0
    move-object v2, p1

    move v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    const/4 v3, -0x1

    const/4 v8, 0x1

    .line 132
    invoke-virtual/range {v2 .. v8}, Lcom/radaee/pdf/BMP;->DrawRect(IIIIII)V

    return-void
.end method

.method protected final vEnd()Z
    .locals 2

    .line 57
    iget-boolean v0, p0, Lcom/radaee/view/VCache;->m_render:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 59
    iput-boolean v1, p0, Lcom/radaee/view/VCache;->m_render:Z

    .line 60
    iget v0, p0, Lcom/radaee/view/VCache;->m_status:I

    if-gtz v0, :cond_0

    const/4 v0, -0x1

    iput v0, p0, Lcom/radaee/view/VCache;->m_status:I

    .line 61
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/VCache;->m_page:Lcom/radaee/pdf/Page;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->RenderCancel()V

    :cond_1
    const/4 v0, 0x1

    return v0

    :cond_2
    return v1
.end method

.method protected final vFinished()Z
    .locals 2

    .line 73
    iget-boolean v0, p0, Lcom/radaee/view/VCache;->m_render:Z

    if-nez v0, :cond_0

    iget v1, p0, Lcom/radaee/view/VCache;->m_status:I

    if-eqz v1, :cond_1

    :cond_0
    if-eqz v0, :cond_2

    iget v0, p0, Lcom/radaee/view/VCache;->m_status:I

    if-lez v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    return v0

    :cond_2
    const/4 v0, 0x0

    return v0
.end method

.method protected final vGetH()I
    .locals 1

    .line 135
    iget v0, p0, Lcom/radaee/view/VCache;->m_h:I

    return v0
.end method

.method protected final vGetPageNO()I
    .locals 1

    .line 138
    iget v0, p0, Lcom/radaee/view/VCache;->m_pageno:I

    return v0
.end method

.method protected final vGetW()I
    .locals 1

    .line 134
    iget v0, p0, Lcom/radaee/view/VCache;->m_w:I

    return v0
.end method

.method protected final vGetX()I
    .locals 1

    .line 136
    iget v0, p0, Lcom/radaee/view/VCache;->m_x:I

    return v0
.end method

.method protected final vGetY()I
    .locals 1

    .line 137
    iget v0, p0, Lcom/radaee/view/VCache;->m_y:I

    return v0
.end method

.method protected final vIsRender()Z
    .locals 1

    .line 38
    iget-boolean v0, p0, Lcom/radaee/view/VCache;->m_render:Z

    if-nez v0, :cond_1

    iget v0, p0, Lcom/radaee/view/VCache;->m_status:I

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/radaee/view/VCache;->m_dib:Lcom/radaee/pdf/DIB;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x1

    return v0
.end method

.method protected vRender()V
    .locals 7

    .line 77
    new-instance v0, Lcom/radaee/pdf/DIB;

    invoke-direct {v0}, Lcom/radaee/pdf/DIB;-><init>()V

    .line 78
    iget v1, p0, Lcom/radaee/view/VCache;->m_w:I

    iget v2, p0, Lcom/radaee/view/VCache;->m_h:I

    invoke-virtual {v0, v1, v2}, Lcom/radaee/pdf/DIB;->CreateOrResize(II)V

    .line 79
    iget v1, p0, Lcom/radaee/view/VCache;->m_status:I

    if-gez v1, :cond_0

    .line 81
    invoke-virtual {v0}, Lcom/radaee/pdf/DIB;->Free()V

    return-void

    .line 84
    :cond_0
    iget-object v1, p0, Lcom/radaee/view/VCache;->m_doc:Lcom/radaee/pdf/Document;

    iget v2, p0, Lcom/radaee/view/VCache;->m_pageno:I

    invoke-virtual {v1, v2}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v1

    iput-object v1, p0, Lcom/radaee/view/VCache;->m_page:Lcom/radaee/pdf/Page;

    .line 85
    invoke-virtual {v1, v0}, Lcom/radaee/pdf/Page;->RenderPrepare(Lcom/radaee/pdf/DIB;)V

    .line 86
    iput-object v0, p0, Lcom/radaee/view/VCache;->m_dib:Lcom/radaee/pdf/DIB;

    .line 87
    iget v1, p0, Lcom/radaee/view/VCache;->m_status:I

    if-gez v1, :cond_1

    goto :goto_0

    .line 88
    :cond_1
    new-instance v1, Lcom/radaee/pdf/Matrix;

    iget v2, p0, Lcom/radaee/view/VCache;->m_scale:F

    neg-float v3, v2

    iget v4, p0, Lcom/radaee/view/VCache;->m_x:I

    neg-int v4, v4

    int-to-float v4, v4

    iget-object v5, p0, Lcom/radaee/view/VCache;->m_doc:Lcom/radaee/pdf/Document;

    iget v6, p0, Lcom/radaee/view/VCache;->m_pageno:I

    invoke-virtual {v5, v6}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v5

    iget v6, p0, Lcom/radaee/view/VCache;->m_scale:F

    mul-float v5, v5, v6

    iget v6, p0, Lcom/radaee/view/VCache;->m_y:I

    int-to-float v6, v6

    sub-float/2addr v5, v6

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/radaee/pdf/Matrix;-><init>(FFFF)V

    .line 89
    iget-object v2, p0, Lcom/radaee/view/VCache;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v2, v0, v1}, Lcom/radaee/pdf/Page;->Render(Lcom/radaee/pdf/DIB;Lcom/radaee/pdf/Matrix;)Z

    .line 90
    invoke-virtual {v1}, Lcom/radaee/pdf/Matrix;->Destroy()V

    .line 91
    iget v0, p0, Lcom/radaee/view/VCache;->m_status:I

    if-ltz v0, :cond_2

    const/4 v0, 0x1

    iput v0, p0, Lcom/radaee/view/VCache;->m_status:I

    :cond_2
    :goto_0
    return-void
.end method

.method protected final vRenderFinished()Z
    .locals 1

    .line 69
    iget-boolean v0, p0, Lcom/radaee/view/VCache;->m_render:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/radaee/view/VCache;->m_status:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method protected vRenderThumb()V
    .locals 7

    .line 95
    new-instance v0, Lcom/radaee/pdf/DIB;

    invoke-direct {v0}, Lcom/radaee/pdf/DIB;-><init>()V

    .line 96
    iget v1, p0, Lcom/radaee/view/VCache;->m_w:I

    iget v2, p0, Lcom/radaee/view/VCache;->m_h:I

    invoke-virtual {v0, v1, v2}, Lcom/radaee/pdf/DIB;->CreateOrResize(II)V

    .line 97
    iget v1, p0, Lcom/radaee/view/VCache;->m_status:I

    if-gez v1, :cond_0

    .line 99
    invoke-virtual {v0}, Lcom/radaee/pdf/DIB;->Free()V

    return-void

    .line 102
    :cond_0
    iget-object v1, p0, Lcom/radaee/view/VCache;->m_doc:Lcom/radaee/pdf/Document;

    iget v2, p0, Lcom/radaee/view/VCache;->m_pageno:I

    invoke-virtual {v1, v2}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v1

    iput-object v1, p0, Lcom/radaee/view/VCache;->m_page:Lcom/radaee/pdf/Page;

    .line 103
    invoke-virtual {v1, v0}, Lcom/radaee/pdf/Page;->RenderPrepare(Lcom/radaee/pdf/DIB;)V

    .line 104
    iput-object v0, p0, Lcom/radaee/view/VCache;->m_dib:Lcom/radaee/pdf/DIB;

    .line 105
    iget v1, p0, Lcom/radaee/view/VCache;->m_status:I

    if-gez v1, :cond_1

    goto :goto_0

    .line 106
    :cond_1
    new-instance v1, Lcom/radaee/pdf/Matrix;

    iget v2, p0, Lcom/radaee/view/VCache;->m_scale:F

    neg-float v3, v2

    iget v4, p0, Lcom/radaee/view/VCache;->m_x:I

    neg-int v4, v4

    int-to-float v4, v4

    iget-object v5, p0, Lcom/radaee/view/VCache;->m_doc:Lcom/radaee/pdf/Document;

    iget v6, p0, Lcom/radaee/view/VCache;->m_pageno:I

    invoke-virtual {v5, v6}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v5

    iget v6, p0, Lcom/radaee/view/VCache;->m_scale:F

    mul-float v5, v5, v6

    iget v6, p0, Lcom/radaee/view/VCache;->m_y:I

    int-to-float v6, v6

    sub-float/2addr v5, v6

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/radaee/pdf/Matrix;-><init>(FFFF)V

    .line 107
    iget-object v2, p0, Lcom/radaee/view/VCache;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v2, v0, v1}, Lcom/radaee/pdf/Page;->Render(Lcom/radaee/pdf/DIB;Lcom/radaee/pdf/Matrix;)Z

    .line 108
    invoke-virtual {v1}, Lcom/radaee/pdf/Matrix;->Destroy()V

    .line 109
    iget v0, p0, Lcom/radaee/view/VCache;->m_status:I

    if-ltz v0, :cond_2

    const/4 v0, 0x1

    iput v0, p0, Lcom/radaee/view/VCache;->m_status:I

    :cond_2
    :goto_0
    return-void
.end method

.method protected final vStart()Z
    .locals 2

    .line 46
    iget-boolean v0, p0, Lcom/radaee/view/VCache;->m_render:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 48
    iput-boolean v0, p0, Lcom/radaee/view/VCache;->m_render:Z

    .line 49
    iput v1, p0, Lcom/radaee/view/VCache;->m_status:I

    return v0

    :cond_0
    return v1
.end method
