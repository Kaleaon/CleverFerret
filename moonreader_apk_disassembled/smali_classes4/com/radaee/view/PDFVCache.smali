.class public Lcom/radaee/view/PDFVCache;
.super Ljava/lang/Object;
.source "PDFVCache.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field protected m_dib:Lcom/radaee/pdf/DIB;

.field protected m_dibh:I

.field protected m_dibw:I

.field protected m_doc:Lcom/radaee/pdf/Document;

.field protected m_page:Lcom/radaee/pdf/Page;

.field protected m_pageno:I

.field protected m_scale:F

.field protected m_status:I


# direct methods
.method protected constructor <init>(Lcom/radaee/pdf/Document;IFII)V
    .locals 1

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 13
    iput-object v0, p0, Lcom/radaee/view/PDFVCache;->m_page:Lcom/radaee/pdf/Page;

    .line 21
    iput-object p1, p0, Lcom/radaee/view/PDFVCache;->m_doc:Lcom/radaee/pdf/Document;

    .line 22
    iput p2, p0, Lcom/radaee/view/PDFVCache;->m_pageno:I

    .line 23
    iput p3, p0, Lcom/radaee/view/PDFVCache;->m_scale:F

    .line 24
    iput-object v0, p0, Lcom/radaee/view/PDFVCache;->m_dib:Lcom/radaee/pdf/DIB;

    .line 25
    iput p4, p0, Lcom/radaee/view/PDFVCache;->m_dibw:I

    .line 26
    iput p5, p0, Lcom/radaee/view/PDFVCache;->m_dibh:I

    const/4 p1, 0x0

    .line 27
    iput p1, p0, Lcom/radaee/view/PDFVCache;->m_status:I

    return-void
.end method


# virtual methods
.method protected Clear()V
    .locals 1

    .line 35
    iget-object v0, p0, Lcom/radaee/view/PDFVCache;->m_dib:Lcom/radaee/pdf/DIB;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/radaee/pdf/DIB;->Free()V

    .line 36
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/PDFVCache;->m_page:Lcom/radaee/pdf/Page;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->Close()V

    :cond_1
    const/4 v0, 0x0

    .line 37
    iput-object v0, p0, Lcom/radaee/view/PDFVCache;->m_page:Lcom/radaee/pdf/Page;

    .line 38
    iput-object v0, p0, Lcom/radaee/view/PDFVCache;->m_dib:Lcom/radaee/pdf/DIB;

    const/4 v0, 0x0

    .line 39
    iput v0, p0, Lcom/radaee/view/PDFVCache;->m_status:I

    return-void
.end method

.method public Render()V
    .locals 6

    .line 52
    iget v0, p0, Lcom/radaee/view/PDFVCache;->m_status:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    goto :goto_1

    .line 53
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/PDFVCache;->m_page:Lcom/radaee/pdf/Page;

    if-nez v0, :cond_1

    .line 54
    iget-object v0, p0, Lcom/radaee/view/PDFVCache;->m_doc:Lcom/radaee/pdf/Document;

    iget v2, p0, Lcom/radaee/view/PDFVCache;->m_pageno:I

    invoke-virtual {v0, v2}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v0

    iput-object v0, p0, Lcom/radaee/view/PDFVCache;->m_page:Lcom/radaee/pdf/Page;

    .line 55
    :cond_1
    iget-object v0, p0, Lcom/radaee/view/PDFVCache;->m_dib:Lcom/radaee/pdf/DIB;

    if-nez v0, :cond_2

    .line 57
    new-instance v0, Lcom/radaee/pdf/DIB;

    invoke-direct {v0}, Lcom/radaee/pdf/DIB;-><init>()V

    .line 58
    iget v2, p0, Lcom/radaee/view/PDFVCache;->m_dibw:I

    iget v3, p0, Lcom/radaee/view/PDFVCache;->m_dibh:I

    invoke-virtual {v0, v2, v3}, Lcom/radaee/pdf/DIB;->CreateOrResize(II)V

    .line 59
    iget-object v2, p0, Lcom/radaee/view/PDFVCache;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v2, v0}, Lcom/radaee/pdf/Page;->RenderPrepare(Lcom/radaee/pdf/DIB;)V

    .line 60
    iput-object v0, p0, Lcom/radaee/view/PDFVCache;->m_dib:Lcom/radaee/pdf/DIB;

    goto :goto_0

    .line 62
    :cond_2
    iget-object v2, p0, Lcom/radaee/view/PDFVCache;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v2, v0}, Lcom/radaee/pdf/Page;->RenderPrepare(Lcom/radaee/pdf/DIB;)V

    .line 63
    :goto_0
    iget v0, p0, Lcom/radaee/view/PDFVCache;->m_status:I

    if-ne v0, v1, :cond_3

    goto :goto_1

    .line 64
    :cond_3
    new-instance v0, Lcom/radaee/pdf/Matrix;

    iget v2, p0, Lcom/radaee/view/PDFVCache;->m_scale:F

    neg-float v3, v2

    iget v4, p0, Lcom/radaee/view/PDFVCache;->m_dibh:I

    int-to-float v4, v4

    const/4 v5, 0x0

    invoke-direct {v0, v2, v3, v5, v4}, Lcom/radaee/pdf/Matrix;-><init>(FFFF)V

    .line 65
    iget-object v2, p0, Lcom/radaee/view/PDFVCache;->m_page:Lcom/radaee/pdf/Page;

    iget-object v3, p0, Lcom/radaee/view/PDFVCache;->m_dib:Lcom/radaee/pdf/DIB;

    invoke-virtual {v2, v3, v0}, Lcom/radaee/pdf/Page;->Render(Lcom/radaee/pdf/DIB;Lcom/radaee/pdf/Matrix;)Z

    .line 66
    invoke-virtual {v0}, Lcom/radaee/pdf/Matrix;->Destroy()V

    .line 67
    iget v0, p0, Lcom/radaee/view/PDFVCache;->m_status:I

    if-eq v0, v1, :cond_4

    const/4 v0, 0x1

    .line 68
    iput v0, p0, Lcom/radaee/view/PDFVCache;->m_status:I

    :cond_4
    :goto_1
    return-void
.end method

.method protected RenderThumb()V
    .locals 6

    .line 72
    iget v0, p0, Lcom/radaee/view/PDFVCache;->m_status:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    goto :goto_1

    .line 73
    :cond_0
    iget-object v0, p0, Lcom/radaee/view/PDFVCache;->m_page:Lcom/radaee/pdf/Page;

    if-nez v0, :cond_1

    .line 74
    iget-object v0, p0, Lcom/radaee/view/PDFVCache;->m_doc:Lcom/radaee/pdf/Document;

    iget v2, p0, Lcom/radaee/view/PDFVCache;->m_pageno:I

    invoke-virtual {v0, v2}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v0

    iput-object v0, p0, Lcom/radaee/view/PDFVCache;->m_page:Lcom/radaee/pdf/Page;

    .line 75
    :cond_1
    iget-object v0, p0, Lcom/radaee/view/PDFVCache;->m_dib:Lcom/radaee/pdf/DIB;

    if-nez v0, :cond_2

    .line 77
    new-instance v0, Lcom/radaee/pdf/DIB;

    invoke-direct {v0}, Lcom/radaee/pdf/DIB;-><init>()V

    .line 78
    iget v2, p0, Lcom/radaee/view/PDFVCache;->m_dibw:I

    iget v3, p0, Lcom/radaee/view/PDFVCache;->m_dibh:I

    invoke-virtual {v0, v2, v3}, Lcom/radaee/pdf/DIB;->CreateOrResize(II)V

    .line 79
    iget-object v2, p0, Lcom/radaee/view/PDFVCache;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v2, v0}, Lcom/radaee/pdf/Page;->RenderPrepare(Lcom/radaee/pdf/DIB;)V

    .line 80
    iput-object v0, p0, Lcom/radaee/view/PDFVCache;->m_dib:Lcom/radaee/pdf/DIB;

    goto :goto_0

    .line 82
    :cond_2
    iget-object v2, p0, Lcom/radaee/view/PDFVCache;->m_page:Lcom/radaee/pdf/Page;

    invoke-virtual {v2, v0}, Lcom/radaee/pdf/Page;->RenderPrepare(Lcom/radaee/pdf/DIB;)V

    .line 83
    :goto_0
    iget v0, p0, Lcom/radaee/view/PDFVCache;->m_status:I

    if-ne v0, v1, :cond_3

    goto :goto_1

    .line 84
    :cond_3
    iget-object v0, p0, Lcom/radaee/view/PDFVCache;->m_page:Lcom/radaee/pdf/Page;

    iget-object v2, p0, Lcom/radaee/view/PDFVCache;->m_dib:Lcom/radaee/pdf/DIB;

    invoke-virtual {v0, v2}, Lcom/radaee/pdf/Page;->RenderThumbToDIB(Lcom/radaee/pdf/DIB;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 86
    new-instance v0, Lcom/radaee/pdf/Matrix;

    iget v2, p0, Lcom/radaee/view/PDFVCache;->m_scale:F

    neg-float v3, v2

    iget v4, p0, Lcom/radaee/view/PDFVCache;->m_dibh:I

    int-to-float v4, v4

    const/4 v5, 0x0

    invoke-direct {v0, v2, v3, v5, v4}, Lcom/radaee/pdf/Matrix;-><init>(FFFF)V

    .line 87
    iget-object v2, p0, Lcom/radaee/view/PDFVCache;->m_page:Lcom/radaee/pdf/Page;

    iget-object v3, p0, Lcom/radaee/view/PDFVCache;->m_dib:Lcom/radaee/pdf/DIB;

    invoke-virtual {v2, v3, v0}, Lcom/radaee/pdf/Page;->Render(Lcom/radaee/pdf/DIB;Lcom/radaee/pdf/Matrix;)Z

    .line 88
    invoke-virtual {v0}, Lcom/radaee/pdf/Matrix;->Destroy()V

    .line 90
    :cond_4
    iget v0, p0, Lcom/radaee/view/PDFVCache;->m_status:I

    if-eq v0, v1, :cond_5

    const/4 v0, 0x1

    .line 91
    iput v0, p0, Lcom/radaee/view/PDFVCache;->m_status:I

    :cond_5
    :goto_1
    return-void
.end method

.method protected final UIIsSame(FII)Z
    .locals 1

    .line 31
    iget v0, p0, Lcom/radaee/view/PDFVCache;->m_scale:F

    cmpl-float p1, v0, p1

    if-nez p1, :cond_0

    iget p1, p0, Lcom/radaee/view/PDFVCache;->m_dibw:I

    if-ne p1, p2, :cond_0

    iget p1, p0, Lcom/radaee/view/PDFVCache;->m_dibh:I

    if-ne p1, p3, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method protected final UIRenderCancel()V
    .locals 1

    .line 43
    iget v0, p0, Lcom/radaee/view/PDFVCache;->m_status:I

    if-nez v0, :cond_0

    const/4 v0, 0x2

    .line 45
    iput v0, p0, Lcom/radaee/view/PDFVCache;->m_status:I

    .line 46
    iget-object v0, p0, Lcom/radaee/view/PDFVCache;->m_page:Lcom/radaee/pdf/Page;

    if-eqz v0, :cond_0

    .line 47
    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->RenderCancel()V

    :cond_0
    return-void
.end method

.method protected finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 96
    invoke-virtual {p0}, Lcom/radaee/view/PDFVCache;->Clear()V

    .line 97
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method
