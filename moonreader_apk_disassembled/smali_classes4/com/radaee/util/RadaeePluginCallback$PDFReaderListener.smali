.class public interface abstract Lcom/radaee/util/RadaeePluginCallback$PDFReaderListener;
.super Ljava/lang/Object;
.source "RadaeePluginCallback.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/radaee/util/RadaeePluginCallback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "PDFReaderListener"
.end annotation


# virtual methods
.method public abstract didChangePage(I)V
.end method

.method public abstract didCloseReader()V
.end method

.method public abstract didSearchTerm(Ljava/lang/String;Z)V
.end method

.method public abstract didShowReader()V
.end method

.method public abstract onAnnotTapped(Lcom/radaee/pdf/Page$Annotation;)V
.end method

.method public abstract onBlankTapped(I)V
.end method

.method public abstract onDoubleTapped(IFF)V
.end method

.method public abstract onLongPressed(IFF)V
.end method

.method public abstract willCloseReader()V
.end method

.method public abstract willShowReader()V
.end method
