.class public interface abstract Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;
.super Ljava/lang/Object;
.source "RadaeePluginCallback.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/radaee/util/RadaeePluginCallback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "PDFControllerListener"
.end annotation


# virtual methods
.method public abstract flatAnnotAtPage(I)Z
.end method

.method public abstract flatAnnots()Z
.end method

.method public abstract onAddAnnotAttachment(Ljava/lang/String;)Z
.end method

.method public abstract onAddMarkupAnnotation(IIII)V
.end method

.method public abstract onAddTextAnnotation(IFFLjava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract onEncryptDocAs(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;II[B)Z
.end method

.method public abstract onGetCharIndex(IFF)I
.end method

.method public abstract onGetJsonFormFields()Ljava/lang/String;
.end method

.method public abstract onGetJsonFormFieldsAtPage(I)Ljava/lang/String;
.end method

.method public abstract onGetMarkupAnnotationDetails(I)Ljava/lang/String;
.end method

.method public abstract onGetPDFCoordinates(II)Ljava/lang/String;
.end method

.method public abstract onGetPDFRect(IIII)Ljava/lang/String;
.end method

.method public abstract onGetPageCount()I
.end method

.method public abstract onGetPageText(I)Ljava/lang/String;
.end method

.method public abstract onGetScreenCoordinates(IFF)Ljava/lang/String;
.end method

.method public abstract onGetScreenRect(IFFFF)Ljava/lang/String;
.end method

.method public abstract onGetTextAnnotationDetails(I)Ljava/lang/String;
.end method

.method public abstract onSetFormFieldsWithJSON(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract onSetIconsBGColor(I)V
.end method

.method public abstract onSetImmersive(Z)V
.end method

.method public abstract onSetToolbarBGColor(I)V
.end method

.method public abstract renderAnnotToFile(IILjava/lang/String;II)Ljava/lang/String;
.end method

.method public abstract saveDocumentToPath(Ljava/lang/String;Ljava/lang/String;)Z
.end method
