.class public Lcom/radaee/util/PDFPageGridView;
.super Landroid/widget/GridView;
.source "PDFPageGridView.java"


# instance fields
.field private m_adt:Lcom/radaee/util/PDFPageGridAdt;

.field private m_doc:Lcom/radaee/pdf/Document;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 23
    invoke-direct {p0, p1}, Landroid/widget/GridView;-><init>(Landroid/content/Context;)V

    .line 24
    invoke-direct {p0}, Lcom/radaee/util/PDFPageGridView;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 27
    invoke-direct {p0, p1, p2}, Landroid/widget/GridView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 28
    invoke-direct {p0}, Lcom/radaee/util/PDFPageGridView;->init()V

    return-void
.end method

.method static synthetic access$000(Lcom/radaee/util/PDFPageGridView;)Lcom/radaee/util/PDFPageGridAdt;
    .locals 0

    .line 8
    iget-object p0, p0, Lcom/radaee/util/PDFPageGridView;->m_adt:Lcom/radaee/util/PDFPageGridAdt;

    return-object p0
.end method

.method private init()V
    .locals 1

    .line 11
    new-instance v0, Lcom/radaee/util/PDFPageGridView$1;

    invoke-direct {v0, p0}, Lcom/radaee/util/PDFPageGridView$1;-><init>(Lcom/radaee/util/PDFPageGridView;)V

    invoke-virtual {p0, v0}, Lcom/radaee/util/PDFPageGridView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    return-void
.end method


# virtual methods
.method public PDFClose()V
    .locals 1

    .line 41
    iget-object v0, p0, Lcom/radaee/util/PDFPageGridView;->m_adt:Lcom/radaee/util/PDFPageGridAdt;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/radaee/util/PDFPageGridAdt;->close()V

    :cond_0
    const/4 v0, 0x0

    .line 42
    iput-object v0, p0, Lcom/radaee/util/PDFPageGridView;->m_adt:Lcom/radaee/util/PDFPageGridAdt;

    return-void
.end method

.method public PDFGetRemoval()[Z
    .locals 1

    .line 46
    iget-object v0, p0, Lcom/radaee/util/PDFPageGridView;->m_adt:Lcom/radaee/util/PDFPageGridAdt;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 47
    :cond_0
    invoke-virtual {v0}, Lcom/radaee/util/PDFPageGridAdt;->getRemoval()[Z

    move-result-object v0

    return-object v0
.end method

.method public PDFGetRotate()[I
    .locals 1

    .line 51
    iget-object v0, p0, Lcom/radaee/util/PDFPageGridView;->m_adt:Lcom/radaee/util/PDFPageGridAdt;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 52
    :cond_0
    invoke-virtual {v0}, Lcom/radaee/util/PDFPageGridAdt;->getRotate()[I

    move-result-object v0

    return-object v0
.end method

.method public PDFIsModified()Z
    .locals 1

    .line 56
    iget-object v0, p0, Lcom/radaee/util/PDFPageGridView;->m_adt:Lcom/radaee/util/PDFPageGridAdt;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 57
    :cond_0
    invoke-virtual {v0}, Lcom/radaee/util/PDFPageGridAdt;->isModified()Z

    move-result v0

    return v0
.end method

.method public PDFOpen(Lcom/radaee/pdf/Document;)V
    .locals 2

    const/4 v0, 0x3

    .line 34
    invoke-virtual {p0, v0}, Lcom/radaee/util/PDFPageGridView;->setNumColumns(I)V

    .line 35
    iput-object p1, p0, Lcom/radaee/util/PDFPageGridView;->m_doc:Lcom/radaee/pdf/Document;

    .line 36
    new-instance p1, Lcom/radaee/util/PDFPageGridAdt;

    invoke-virtual {p0}, Lcom/radaee/util/PDFPageGridView;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/radaee/util/PDFPageGridView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-direct {p1, v0, v1}, Lcom/radaee/util/PDFPageGridAdt;-><init>(Landroid/content/Context;Lcom/radaee/pdf/Document;)V

    iput-object p1, p0, Lcom/radaee/util/PDFPageGridView;->m_adt:Lcom/radaee/util/PDFPageGridAdt;

    .line 37
    invoke-virtual {p0, p1}, Lcom/radaee/util/PDFPageGridView;->setAdapter(Landroid/widget/ListAdapter;)V

    return-void
.end method
