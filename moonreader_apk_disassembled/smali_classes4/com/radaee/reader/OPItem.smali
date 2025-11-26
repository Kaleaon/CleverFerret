.class abstract Lcom/radaee/reader/OPItem;
.super Ljava/lang/Object;
.source "PDFLayoutOPStack.java"


# instance fields
.field m_idx:I

.field m_pageno:I


# direct methods
.method constructor <init>(II)V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput p1, p0, Lcom/radaee/reader/OPItem;->m_pageno:I

    .line 17
    iput p2, p0, Lcom/radaee/reader/OPItem;->m_idx:I

    return-void
.end method


# virtual methods
.method get_pgno(I)I
    .locals 0

    .line 23
    iget p1, p0, Lcom/radaee/reader/OPItem;->m_pageno:I

    return p1
.end method

.method abstract op_redo(Lcom/radaee/pdf/Document;)V
.end method

.method abstract op_undo(Lcom/radaee/pdf/Document;)V
.end method
