.class public interface abstract Lcom/radaee/view/ILayoutView$PDFLayoutListener;
.super Ljava/lang/Object;
.source "ILayoutView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/radaee/view/ILayoutView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "PDFLayoutListener"
.end annotation


# virtual methods
.method public abstract OnPDFAnnotTapped(ILcom/radaee/pdf/Page$Annotation;)V
.end method

.method public abstract OnPDFBlankTapped(I)V
.end method

.method public abstract OnPDFDoubleTapped(IFF)Z
.end method

.method public abstract OnPDFLongPressed(IFF)V
.end method

.method public abstract OnPDFOpen3D(Ljava/lang/String;)V
.end method

.method public abstract OnPDFOpenAttachment(Ljava/lang/String;)V
.end method

.method public abstract OnPDFOpenJS(Ljava/lang/String;)V
.end method

.method public abstract OnPDFOpenMovie(Ljava/lang/String;)V
.end method

.method public abstract OnPDFOpenRendition(Ljava/lang/String;)V
.end method

.method public abstract OnPDFOpenSound([ILjava/lang/String;)V
.end method

.method public abstract OnPDFOpenURI(Ljava/lang/String;)V
.end method

.method public abstract OnPDFPageChanged(I)V
.end method

.method public abstract OnPDFPageDisplayed(Landroid/graphics/Canvas;Lcom/radaee/view/ILayoutView$IVPage;)V
.end method

.method public abstract OnPDFPageModified(I)V
.end method

.method public abstract OnPDFPageRendered(Lcom/radaee/view/ILayoutView$IVPage;)V
.end method

.method public abstract OnPDFSearchFinished(Z)V
.end method

.method public abstract OnPDFSelectEnd(Ljava/lang/String;)V
.end method

.method public abstract OnPDFZoomEnd()V
.end method

.method public abstract OnPDFZoomStart()V
.end method
