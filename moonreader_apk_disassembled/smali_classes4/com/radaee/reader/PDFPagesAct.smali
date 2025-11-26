.class public Lcom/radaee/reader/PDFPagesAct;
.super Landroid/app/Activity;
.source "PDFPagesAct.java"


# static fields
.field protected static ms_tran_doc:Lcom/radaee/pdf/Document;


# instance fields
.field private m_doc:Lcom/radaee/pdf/Document;

.field private m_view:Lcom/radaee/util/PDFPageGridView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/radaee/reader/PDFPagesAct;)Lcom/radaee/util/PDFPageGridView;
    .locals 0

    .line 13
    iget-object p0, p0, Lcom/radaee/reader/PDFPagesAct;->m_view:Lcom/radaee/util/PDFPageGridView;

    return-object p0
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 19
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 20
    sget-object p1, Lcom/radaee/reader/PDFPagesAct;->ms_tran_doc:Lcom/radaee/pdf/Document;

    iput-object p1, p0, Lcom/radaee/reader/PDFPagesAct;->m_doc:Lcom/radaee/pdf/Document;

    const/4 p1, 0x0

    .line 21
    sput-object p1, Lcom/radaee/reader/PDFPagesAct;->ms_tran_doc:Lcom/radaee/pdf/Document;

    .line 22
    sget p1, Lcom/radaee/viewlib/R$layout;->pdf_pages:I

    invoke-virtual {p0, p1}, Lcom/radaee/reader/PDFPagesAct;->setContentView(I)V

    .line 23
    sget p1, Lcom/radaee/viewlib/R$id;->vw_pages:I

    invoke-virtual {p0, p1}, Lcom/radaee/reader/PDFPagesAct;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/radaee/util/PDFPageGridView;

    iput-object p1, p0, Lcom/radaee/reader/PDFPagesAct;->m_view:Lcom/radaee/util/PDFPageGridView;

    .line 24
    iget-object v0, p0, Lcom/radaee/reader/PDFPagesAct;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {p1, v0}, Lcom/radaee/util/PDFPageGridView;->PDFOpen(Lcom/radaee/pdf/Document;)V

    const/4 p1, 0x0

    .line 25
    invoke-virtual {p0, p1}, Lcom/radaee/reader/PDFPagesAct;->setResult(I)V

    .line 27
    sget p1, Lcom/radaee/viewlib/R$id;->btn_back:I

    invoke-virtual {p0, p1}, Lcom/radaee/reader/PDFPagesAct;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    .line 28
    new-instance v0, Lcom/radaee/reader/PDFPagesAct$1;

    invoke-direct {v0, p0}, Lcom/radaee/reader/PDFPagesAct$1;-><init>(Lcom/radaee/reader/PDFPagesAct;)V

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 34
    sget p1, Lcom/radaee/viewlib/R$id;->btn_ok:I

    invoke-virtual {p0, p1}, Lcom/radaee/reader/PDFPagesAct;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    .line 35
    new-instance v0, Lcom/radaee/reader/PDFPagesAct$2;

    invoke-direct {v0, p0}, Lcom/radaee/reader/PDFPagesAct$2;-><init>(Lcom/radaee/reader/PDFPagesAct;)V

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .line 55
    iget-object v0, p0, Lcom/radaee/reader/PDFPagesAct;->m_view:Lcom/radaee/util/PDFPageGridView;

    invoke-virtual {v0}, Lcom/radaee/util/PDFPageGridView;->PDFClose()V

    .line 56
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method
