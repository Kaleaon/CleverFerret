.class public Lcom/radaee/reader/PDFGLLayoutView;
.super Landroid/widget/RelativeLayout;
.source "PDFGLLayoutView.java"

# interfaces
.implements Lcom/radaee/view/ILayoutView;


# instance fields
.field public disabled:Z

.field private m_annot_menu:Lcom/radaee/annotui/UIAnnotMenu;

.field public m_canvas:Lcom/radaee/reader/GLCanvas;

.field public m_view:Lcom/radaee/reader/GLView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 23
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 24
    invoke-direct {p0, p1}, Lcom/radaee/reader/PDFGLLayoutView;->init(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 28
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 29
    invoke-direct {p0, p1}, Lcom/radaee/reader/PDFGLLayoutView;->init(Landroid/content/Context;)V

    return-void
.end method

.method private init(Landroid/content/Context;)V
    .locals 1

    .line 37
    new-instance v0, Lcom/radaee/reader/GLView;

    invoke-direct {v0, p1}, Lcom/radaee/reader/GLView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    .line 38
    new-instance v0, Lcom/radaee/reader/GLCanvas;

    invoke-direct {v0, p1}, Lcom/radaee/reader/GLCanvas;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_canvas:Lcom/radaee/reader/GLCanvas;

    .line 39
    iget-object p1, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/radaee/reader/PDFGLLayoutView;->addView(Landroid/view/View;I)V

    .line 40
    iget-object p1, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_canvas:Lcom/radaee/reader/GLCanvas;

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/radaee/reader/PDFGLLayoutView;->addView(Landroid/view/View;I)V

    return-void
.end method


# virtual methods
.method public BundleRestorePos(Landroid/os/Bundle;)V
    .locals 1

    .line 157
    iget-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0, p1}, Lcom/radaee/reader/GLView;->BundleRestorePos(Landroid/os/Bundle;)V

    return-void
.end method

.method public BundleSavePos(Landroid/os/Bundle;)V
    .locals 1

    .line 153
    iget-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0, p1}, Lcom/radaee/reader/GLView;->BundleSavePos(Landroid/os/Bundle;)V

    return-void
.end method

.method public GetScreenX(FI)I
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public GetScreenY(FI)I
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public PDFCanSave()Z
    .locals 1

    .line 176
    iget-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->PDFCanSave()Z

    move-result v0

    return v0
.end method

.method public PDFCancelAnnot()V
    .locals 1

    .line 112
    iget-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->PDFCancelAnnot()V

    return-void
.end method

.method public PDFClose()V
    .locals 1

    .line 63
    iget-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->PDFClose()V

    return-void
.end method

.method public PDFCloseOnUI()V
    .locals 1

    .line 60
    iget-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->PDFCloseOnUI()V

    return-void
.end method

.method public PDFEndAnnot()V
    .locals 1

    .line 120
    iget-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->PDFEndAnnot()V

    return-void
.end method

.method public final PDFFind(I)V
    .locals 1

    .line 132
    iget-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0, p1}, Lcom/radaee/reader/GLView;->PDFFind(I)V

    return-void
.end method

.method public PDFFindEnd()V
    .locals 1

    .line 137
    iget-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->PDFFindEnd()V

    return-void
.end method

.method public final PDFFindStart(Ljava/lang/String;ZZ)V
    .locals 1

    .line 128
    iget-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0, p1, p2, p3}, Lcom/radaee/reader/GLView;->PDFFindStart(Ljava/lang/String;ZZ)V

    return-void
.end method

.method public PDFGetDoc()Lcom/radaee/pdf/Document;
    .locals 1

    .line 149
    iget-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->PDFGetDoc()Lcom/radaee/pdf/Document;

    move-result-object v0

    return-object v0
.end method

.method public final PDFGetPos(II)Lcom/radaee/view/GLLayout$PDFPos;
    .locals 1

    .line 231
    iget-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    if-eqz v0, :cond_0

    .line 232
    invoke-virtual {v0, p1, p2}, Lcom/radaee/reader/GLView;->PDFGetPos(II)Lcom/radaee/view/GLLayout$PDFPos;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public PDFGetView()I
    .locals 1

    .line 57
    iget-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->PDFGetView()I

    move-result v0

    return v0
.end method

.method public PDFGotoPage(I)V
    .locals 1

    .line 161
    iget-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0, p1}, Lcom/radaee/reader/GLView;->PDFGotoPage(I)V

    return-void
.end method

.method public PDFOpen(Lcom/radaee/pdf/Document;Lcom/radaee/view/ILayoutView$PDFLayoutListener;)V
    .locals 2

    const/4 v0, 0x4

    const v1, -0x3f3f40

    .line 51
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/radaee/reader/PDFGLLayoutView;->PDFOpen(Lcom/radaee/pdf/Document;Lcom/radaee/view/ILayoutView$PDFLayoutListener;II)V

    return-void
.end method

.method public PDFOpen(Lcom/radaee/pdf/Document;Lcom/radaee/view/ILayoutView$PDFLayoutListener;II)V
    .locals 6

    .line 45
    iget-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iget-object v3, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_canvas:Lcom/radaee/reader/GLCanvas;

    move-object v1, p1

    move-object v2, p2

    move v4, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/radaee/reader/GLView;->PDFOpen(Lcom/radaee/pdf/Document;Lcom/radaee/view/ILayoutView$PDFLayoutListener;Lcom/radaee/reader/GLCanvas;II)V

    .line 47
    iget-object p1, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_canvas:Lcom/radaee/reader/GLCanvas;

    iget-object p2, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {p1, p2}, Lcom/radaee/reader/GLCanvas;->vOpen(Lcom/radaee/reader/GLCanvas$CanvasListener;)V

    return-void
.end method

.method public PDFPerformAnnot()V
    .locals 1

    .line 124
    iget-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->PDFPerformAnnot()V

    return-void
.end method

.method public PDFRedo()V
    .locals 1

    .line 172
    iget-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->PDFRedo()V

    return-void
.end method

.method public PDFRemoveAnnot()V
    .locals 1

    .line 116
    iget-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->PDFRemoveAnnot()V

    return-void
.end method

.method public PDFRestoreView()V
    .locals 1

    .line 228
    iget-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->PDFRestoreView()V

    return-void
.end method

.method public PDFSave()Z
    .locals 1

    .line 181
    iget-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->PDFSave()Z

    move-result v0

    return v0
.end method

.method public PDFSaveView()V
    .locals 1

    .line 224
    iget-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->PDFSaveView()V

    return-void
.end method

.method public PDFScrolltoPage(I)V
    .locals 1

    .line 164
    iget-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0, p1}, Lcom/radaee/reader/GLView;->PDFScrolltoPage(I)V

    return-void
.end method

.method public PDFSetAttachment(Ljava/lang/String;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public PDFSetBGColor(I)V
    .locals 1

    .line 194
    iget-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0, p1}, Lcom/radaee/reader/GLView;->PDFSetBGColor(I)V

    return-void
.end method

.method public PDFSetEditbox(I)V
    .locals 1

    .line 104
    iget-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0, p1}, Lcom/radaee/reader/GLView;->PDFSetEditbox(I)V

    return-void
.end method

.method public PDFSetEllipse(I)V
    .locals 1

    .line 83
    iget-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0, p1}, Lcom/radaee/reader/GLView;->PDFSetEllipse(I)V

    return-void
.end method

.method public PDFSetInk(I)V
    .locals 1

    .line 67
    iget-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0, p1}, Lcom/radaee/reader/GLView;->PDFSetInk(I)V

    return-void
.end method

.method public PDFSetLine(I)V
    .locals 1

    .line 95
    iget-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0, p1}, Lcom/radaee/reader/GLView;->PDFSetLine(I)V

    return-void
.end method

.method public PDFSetNote(I)V
    .locals 1

    .line 91
    iget-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0, p1}, Lcom/radaee/reader/GLView;->PDFSetNote(I)V

    return-void
.end method

.method public PDFSetPolygon(I)V
    .locals 1

    .line 71
    iget-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0, p1}, Lcom/radaee/reader/GLView;->PDFSetPolygon(I)V

    return-void
.end method

.method public PDFSetPolyline(I)V
    .locals 1

    .line 75
    iget-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0, p1}, Lcom/radaee/reader/GLView;->PDFSetPolyline(I)V

    return-void
.end method

.method public PDFSetRect(I)V
    .locals 1

    .line 79
    iget-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0, p1}, Lcom/radaee/reader/GLView;->PDFSetRect(I)V

    return-void
.end method

.method public PDFSetSelMarkup(I)Z
    .locals 1

    const/4 v0, 0x0

    .line 141
    invoke-virtual {p0, p1, v0}, Lcom/radaee/reader/PDFGLLayoutView;->PDFSetSelMarkup(ILjava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public PDFSetSelMarkup(ILjava/lang/String;)Z
    .locals 1

    .line 145
    iget-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0, p1, p2}, Lcom/radaee/reader/GLView;->PDFSetSelMarkup(ILjava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public PDFSetSelect()V
    .locals 1

    .line 87
    iget-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->PDFSetSelect()V

    return-void
.end method

.method public PDFSetStamp(I)V
    .locals 1

    .line 99
    iget-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0, p1}, Lcom/radaee/reader/GLView;->PDFSetStamp(I)V

    return-void
.end method

.method public PDFSetView(I)V
    .locals 1

    .line 55
    iget-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0, p1}, Lcom/radaee/reader/GLView;->PDFSetView(I)V

    return-void
.end method

.method public PDFUndo()V
    .locals 1

    .line 168
    iget-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->PDFUndo()V

    return-void
.end method

.method public PDFUpdateCurrPage()V
    .locals 1

    .line 185
    iget-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->PDFUpdateCurrPage()V

    return-void
.end method

.method public PDFUpdatePage(I)V
    .locals 1

    .line 190
    iget-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0, p1}, Lcom/radaee/reader/GLView;->PDFUpdatePage(I)V

    return-void
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 2

    .line 255
    iget-boolean v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->disabled:Z

    if-nez v0, :cond_2

    sget-boolean v0, Lcom/radaee/pdf/Global;->textReflow:Z

    if-eqz v0, :cond_0

    goto :goto_1

    .line 257
    :cond_0
    sget v0, Lcom/radaee/pdf/Global;->pdf_theme:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    sput-boolean v1, Lcom/radaee/pdf/Global;->dark_mode:Z

    .line 258
    invoke-super {p0, p1}, Landroid/widget/RelativeLayout;->dispatchDraw(Landroid/graphics/Canvas;)V

    :cond_2
    :goto_1
    return-void
.end method

.method public onPause()V
    .locals 1

    .line 237
    iget-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->onPause()V

    return-void
.end method

.method public onResume()V
    .locals 1

    .line 241
    iget-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->onResume()V

    return-void
.end method

.method public setReadOnly(Z)V
    .locals 1

    .line 219
    iget-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0, p1}, Lcom/radaee/reader/GLView;->setReadOnly(Z)V

    return-void
.end method

.method public toPDFRect([F)[F
    .locals 1

    .line 215
    iget-object v0, p0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0, p1}, Lcom/radaee/reader/GLView;->toPDFRect([F)[F

    move-result-object p1

    return-object p1
.end method
