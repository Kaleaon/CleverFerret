.class public interface abstract Lcom/radaee/view/PDFView$PDFViewListener;
.super Ljava/lang/Object;
.source "PDFView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/radaee/view/PDFView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "PDFViewListener"
.end annotation


# virtual methods
.method public abstract OnPDFDoubleTapped(FF)Z
.end method

.method public abstract OnPDFFound(Z)V
.end method

.method public abstract OnPDFInvalidate(Z)V
.end method

.method public abstract OnPDFLongPressed(FF)V
.end method

.method public abstract OnPDFPageChanged(I)V
.end method

.method public abstract OnPDFPageDisplayed(Landroid/graphics/Canvas;Lcom/radaee/view/PDFVPage;)V
.end method

.method public abstract OnPDFPageRendered(I)V
.end method

.method public abstract OnPDFSelectEnd()V
.end method

.method public abstract OnPDFSelecting(Landroid/graphics/Canvas;[I[I)V
.end method

.method public abstract OnPDFShowPressed(FF)V
.end method

.method public abstract OnPDFSingleTapped(FF)Z
.end method

.method public abstract OnPDFZoomEnd()V
.end method

.method public abstract OnPDFZoomStart()V
.end method
