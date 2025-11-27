.class Lcom/radaee/reader/OPMove;
.super Lcom/radaee/reader/OPItem;
.source "PDFLayoutOPStack.java"


# instance fields
.field m_pageno0:I

.field m_pageno1:I

.field m_rect0:[F

.field m_rect1:[F


# direct methods
.method constructor <init>(I[FII[F)V
    .locals 4

    const/4 v0, -0x1

    .line 86
    invoke-direct {p0, v0, p4}, Lcom/radaee/reader/OPItem;-><init>(II)V

    const/4 p4, 0x4

    .line 82
    new-array v0, p4, [F

    iput-object v0, p0, Lcom/radaee/reader/OPMove;->m_rect0:[F

    .line 83
    new-array p4, p4, [F

    iput-object p4, p0, Lcom/radaee/reader/OPMove;->m_rect1:[F

    .line 87
    iput p1, p0, Lcom/radaee/reader/OPMove;->m_pageno0:I

    const/4 p1, 0x0

    .line 88
    aget v1, p2, p1

    aput v1, v0, p1

    const/4 v1, 0x1

    .line 89
    aget v2, p2, v1

    aput v2, v0, v1

    const/4 v2, 0x2

    .line 90
    aget v3, p2, v2

    aput v3, v0, v2

    const/4 v3, 0x3

    .line 91
    aget p2, p2, v3

    aput p2, v0, v3

    .line 93
    iput p3, p0, Lcom/radaee/reader/OPMove;->m_pageno1:I

    .line 94
    aget p2, p5, p1

    aput p2, p4, p1

    .line 95
    aget p1, p5, v1

    aput p1, p4, v1

    .line 96
    aget p1, p5, v2

    aput p1, p4, v2

    .line 97
    aget p1, p5, v3

    aput p1, p4, v3

    return-void
.end method


# virtual methods
.method get_pgno(I)I
    .locals 0

    if-nez p1, :cond_0

    .line 152
    iget p1, p0, Lcom/radaee/reader/OPMove;->m_pageno0:I

    return p1

    .line 154
    :cond_0
    iget p1, p0, Lcom/radaee/reader/OPMove;->m_pageno1:I

    return p1
.end method

.method op_redo(Lcom/radaee/pdf/Document;)V
    .locals 6

    .line 128
    iget v0, p0, Lcom/radaee/reader/OPMove;->m_pageno1:I

    iput v0, p0, Lcom/radaee/reader/OPMove;->m_pageno:I

    .line 129
    iget v0, p0, Lcom/radaee/reader/OPMove;->m_pageno:I

    iget v1, p0, Lcom/radaee/reader/OPMove;->m_pageno0:I

    const/4 v2, 0x1

    if-ne v0, v1, :cond_0

    .line 131
    iget v0, p0, Lcom/radaee/reader/OPMove;->m_pageno:I

    invoke-virtual {p1, v0}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object p1

    .line 132
    invoke-virtual {p1}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 133
    iget v0, p0, Lcom/radaee/reader/OPMove;->m_idx:I

    invoke-virtual {p1, v0}, Lcom/radaee/pdf/Page;->GetAnnot(I)Lcom/radaee/pdf/Page$Annotation;

    move-result-object v0

    .line 134
    iget-object v1, p0, Lcom/radaee/reader/OPMove;->m_rect1:[F

    const/4 v3, 0x0

    aget v3, v1, v3

    aget v2, v1, v2

    const/4 v4, 0x2

    aget v4, v1, v4

    const/4 v5, 0x3

    aget v1, v1, v5

    invoke-virtual {v0, v3, v2, v4, v1}, Lcom/radaee/pdf/Page$Annotation;->SetRect(FFFF)V

    .line 135
    invoke-virtual {p1}, Lcom/radaee/pdf/Page;->Close()V

    return-void

    .line 139
    :cond_0
    invoke-virtual {p1, v1}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v0

    .line 140
    iget v1, p0, Lcom/radaee/reader/OPMove;->m_pageno1:I

    invoke-virtual {p1, v1}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object p1

    .line 141
    invoke-virtual {p1}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 142
    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 143
    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->GetAnnotCount()I

    move-result v1

    sub-int/2addr v1, v2

    invoke-virtual {v0, v1}, Lcom/radaee/pdf/Page;->GetAnnot(I)Lcom/radaee/pdf/Page$Annotation;

    move-result-object v1

    .line 144
    iget-object v2, p0, Lcom/radaee/reader/OPMove;->m_rect1:[F

    invoke-virtual {v1, p1, v2}, Lcom/radaee/pdf/Page$Annotation;->MoveToPage(Lcom/radaee/pdf/Page;[F)Z

    .line 145
    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->Close()V

    .line 146
    invoke-virtual {p1}, Lcom/radaee/pdf/Page;->Close()V

    return-void
.end method

.method op_undo(Lcom/radaee/pdf/Document;)V
    .locals 6

    .line 102
    iget v0, p0, Lcom/radaee/reader/OPMove;->m_pageno0:I

    iput v0, p0, Lcom/radaee/reader/OPMove;->m_pageno:I

    .line 103
    iget v0, p0, Lcom/radaee/reader/OPMove;->m_pageno:I

    iget v1, p0, Lcom/radaee/reader/OPMove;->m_pageno1:I

    if-ne v0, v1, :cond_0

    .line 105
    iget v0, p0, Lcom/radaee/reader/OPMove;->m_pageno:I

    invoke-virtual {p1, v0}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object p1

    .line 106
    invoke-virtual {p1}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 107
    iget v0, p0, Lcom/radaee/reader/OPMove;->m_idx:I

    invoke-virtual {p1, v0}, Lcom/radaee/pdf/Page;->GetAnnot(I)Lcom/radaee/pdf/Page$Annotation;

    move-result-object v0

    .line 108
    iget-object v1, p0, Lcom/radaee/reader/OPMove;->m_rect0:[F

    const/4 v2, 0x0

    aget v2, v1, v2

    const/4 v3, 0x1

    aget v3, v1, v3

    const/4 v4, 0x2

    aget v4, v1, v4

    const/4 v5, 0x3

    aget v1, v1, v5

    invoke-virtual {v0, v2, v3, v4, v1}, Lcom/radaee/pdf/Page$Annotation;->SetRect(FFFF)V

    .line 109
    invoke-virtual {p1}, Lcom/radaee/pdf/Page;->Close()V

    return-void

    .line 113
    :cond_0
    iget v0, p0, Lcom/radaee/reader/OPMove;->m_pageno0:I

    invoke-virtual {p1, v0}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v0

    .line 114
    iget v1, p0, Lcom/radaee/reader/OPMove;->m_pageno1:I

    invoke-virtual {p1, v1}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object p1

    .line 115
    invoke-virtual {p1}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 116
    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 117
    iget v1, p0, Lcom/radaee/reader/OPMove;->m_idx:I

    invoke-virtual {p1, v1}, Lcom/radaee/pdf/Page;->GetAnnot(I)Lcom/radaee/pdf/Page$Annotation;

    move-result-object v1

    .line 118
    iget-object v2, p0, Lcom/radaee/reader/OPMove;->m_rect0:[F

    invoke-virtual {v1, v0, v2}, Lcom/radaee/pdf/Page$Annotation;->MoveToPage(Lcom/radaee/pdf/Page;[F)Z

    .line 119
    invoke-virtual {p1}, Lcom/radaee/pdf/Page;->GetAnnotCount()I

    move-result v1

    iput v1, p0, Lcom/radaee/reader/OPMove;->m_idx:I

    .line 120
    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->Close()V

    .line 121
    invoke-virtual {p1}, Lcom/radaee/pdf/Page;->Close()V

    return-void
.end method
