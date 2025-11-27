.class public interface abstract Lcom/radaee/view/ILayoutView;
.super Ljava/lang/Object;
.source "ILayoutView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/radaee/view/ILayoutView$IVPage;,
        Lcom/radaee/view/ILayoutView$PDFLayoutListener;
    }
.end annotation


# virtual methods
.method public abstract BundleRestorePos(Landroid/os/Bundle;)V
.end method

.method public abstract BundleSavePos(Landroid/os/Bundle;)V
.end method

.method public abstract GetScreenX(FI)I
.end method

.method public abstract GetScreenY(FI)I
.end method

.method public abstract PDFCanSave()Z
.end method

.method public abstract PDFCancelAnnot()V
.end method

.method public abstract PDFClose()V
.end method

.method public abstract PDFEndAnnot()V
.end method

.method public abstract PDFFind(I)V
.end method

.method public abstract PDFFindEnd()V
.end method

.method public abstract PDFFindStart(Ljava/lang/String;ZZ)V
.end method

.method public abstract PDFGetDoc()Lcom/radaee/pdf/Document;
.end method

.method public abstract PDFGotoPage(I)V
.end method

.method public abstract PDFOpen(Lcom/radaee/pdf/Document;Lcom/radaee/view/ILayoutView$PDFLayoutListener;)V
.end method

.method public abstract PDFPerformAnnot()V
.end method

.method public abstract PDFRedo()V
.end method

.method public abstract PDFRemoveAnnot()V
.end method

.method public abstract PDFSave()Z
.end method

.method public abstract PDFScrolltoPage(I)V
.end method

.method public abstract PDFSetAttachment(Ljava/lang/String;)Z
.end method

.method public abstract PDFSetEditbox(I)V
.end method

.method public abstract PDFSetEllipse(I)V
.end method

.method public abstract PDFSetInk(I)V
.end method

.method public abstract PDFSetLine(I)V
.end method

.method public abstract PDFSetNote(I)V
.end method

.method public abstract PDFSetPolygon(I)V
.end method

.method public abstract PDFSetPolyline(I)V
.end method

.method public abstract PDFSetRect(I)V
.end method

.method public abstract PDFSetSelMarkup(I)Z
.end method

.method public abstract PDFSetSelect()V
.end method

.method public abstract PDFSetStamp(I)V
.end method

.method public abstract PDFSetView(I)V
.end method

.method public abstract PDFUndo()V
.end method

.method public abstract PDFUpdatePage(I)V
.end method
