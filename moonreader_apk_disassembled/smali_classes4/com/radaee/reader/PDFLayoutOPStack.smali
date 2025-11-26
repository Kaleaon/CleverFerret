.class public Lcom/radaee/reader/PDFLayoutOPStack;
.super Ljava/lang/Object;
.source "PDFLayoutOPStack.java"


# instance fields
.field private m_pos:I

.field private m_stack:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector<",
            "Lcom/radaee/reader/OPItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 158
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 160
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/radaee/reader/PDFLayoutOPStack;->m_stack:Ljava/util/Vector;

    const/4 v0, -0x1

    .line 161
    iput v0, p0, Lcom/radaee/reader/PDFLayoutOPStack;->m_pos:I

    return-void
.end method


# virtual methods
.method public can_redo()Z
    .locals 3

    .line 188
    iget v0, p0, Lcom/radaee/reader/PDFLayoutOPStack;->m_pos:I

    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutOPStack;->m_stack:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    if-ge v0, v1, :cond_0

    return v2

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public can_undo()Z
    .locals 1

    .line 184
    iget v0, p0, Lcom/radaee/reader/PDFLayoutOPStack;->m_pos:I

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public push(Lcom/radaee/reader/OPItem;)V
    .locals 2

    .line 164
    iget v0, p0, Lcom/radaee/reader/PDFLayoutOPStack;->m_pos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/radaee/reader/PDFLayoutOPStack;->m_pos:I

    .line 165
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutOPStack;->m_stack:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->setSize(I)V

    .line 166
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutOPStack;->m_stack:Ljava/util/Vector;

    iget v1, p0, Lcom/radaee/reader/PDFLayoutOPStack;->m_pos:I

    invoke-virtual {v0, v1, p1}, Ljava/util/Vector;->add(ILjava/lang/Object;)V

    return-void
.end method

.method public redo()Lcom/radaee/reader/OPItem;
    .locals 2

    .line 177
    iget v0, p0, Lcom/radaee/reader/PDFLayoutOPStack;->m_pos:I

    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutOPStack;->m_stack:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x2

    if-le v0, v1, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 178
    :cond_0
    iget v0, p0, Lcom/radaee/reader/PDFLayoutOPStack;->m_pos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/radaee/reader/PDFLayoutOPStack;->m_pos:I

    .line 179
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutOPStack;->m_stack:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/radaee/reader/OPItem;

    return-object v0
.end method

.method public undo()Lcom/radaee/reader/OPItem;
    .locals 2

    .line 170
    iget v0, p0, Lcom/radaee/reader/PDFLayoutOPStack;->m_pos:I

    if-gez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 171
    :cond_0
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutOPStack;->m_stack:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/radaee/reader/OPItem;

    .line 172
    iget v1, p0, Lcom/radaee/reader/PDFLayoutOPStack;->m_pos:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/radaee/reader/PDFLayoutOPStack;->m_pos:I

    return-object v0
.end method
