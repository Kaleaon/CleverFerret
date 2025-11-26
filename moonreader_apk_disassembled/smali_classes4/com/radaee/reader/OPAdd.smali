.class Lcom/radaee/reader/OPAdd;
.super Lcom/radaee/reader/OPItem;
.source "PDFLayoutOPStack.java"


# instance fields
.field hand:J


# direct methods
.method constructor <init>(ILcom/radaee/pdf/Page;I)V
    .locals 0

    .line 57
    invoke-direct {p0, p1, p3}, Lcom/radaee/reader/OPItem;-><init>(II)V

    .line 58
    invoke-virtual {p2, p3}, Lcom/radaee/pdf/Page;->GetAnnot(I)Lcom/radaee/pdf/Page$Annotation;

    move-result-object p1

    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetRef()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/radaee/reader/OPAdd;->hand:J

    return-void
.end method


# virtual methods
.method op_redo(Lcom/radaee/pdf/Document;)V
    .locals 3

    .line 71
    iget v0, p0, Lcom/radaee/reader/OPAdd;->m_pageno:I

    invoke-virtual {p1, v0}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object p1

    .line 72
    invoke-virtual {p1}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 73
    iget-wide v0, p0, Lcom/radaee/reader/OPAdd;->hand:J

    iget v2, p0, Lcom/radaee/reader/OPAdd;->m_idx:I

    invoke-virtual {p1, v0, v1, v2}, Lcom/radaee/pdf/Page;->AddAnnot(JI)Z

    .line 74
    invoke-virtual {p1}, Lcom/radaee/pdf/Page;->Close()V

    return-void
.end method

.method op_undo(Lcom/radaee/pdf/Document;)V
    .locals 1

    .line 62
    iget v0, p0, Lcom/radaee/reader/OPAdd;->m_pageno:I

    invoke-virtual {p1, v0}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object p1

    .line 63
    invoke-virtual {p1}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 64
    iget v0, p0, Lcom/radaee/reader/OPAdd;->m_idx:I

    invoke-virtual {p1, v0}, Lcom/radaee/pdf/Page;->GetAnnot(I)Lcom/radaee/pdf/Page$Annotation;

    move-result-object v0

    .line 65
    invoke-virtual {v0}, Lcom/radaee/pdf/Page$Annotation;->RemoveFromPage()Z

    .line 66
    invoke-virtual {p1}, Lcom/radaee/pdf/Page;->Close()V

    return-void
.end method
