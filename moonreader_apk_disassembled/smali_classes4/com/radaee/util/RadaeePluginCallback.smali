.class public Lcom/radaee/util/RadaeePluginCallback;
.super Ljava/lang/Object;
.source "RadaeePluginCallback.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/radaee/util/RadaeePluginCallback$PDFReaderListener;,
        Lcom/radaee/util/RadaeePluginCallback$PDFThumbListener;,
        Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;,
        Lcom/radaee/util/RadaeePluginCallback$PDFActivityListener;
    }
.end annotation


# static fields
.field private static mInstance:Lcom/radaee/util/RadaeePluginCallback;


# instance fields
.field private mActivityListener:Lcom/radaee/util/RadaeePluginCallback$PDFActivityListener;

.field private mControlListener:Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;

.field private mListener:Lcom/radaee/util/RadaeePluginCallback$PDFReaderListener;

.field private mThumbListener:Lcom/radaee/util/RadaeePluginCallback$PDFThumbListener;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/radaee/util/RadaeePluginCallback;
    .locals 1

    .line 22
    sget-object v0, Lcom/radaee/util/RadaeePluginCallback;->mInstance:Lcom/radaee/util/RadaeePluginCallback;

    if-nez v0, :cond_0

    .line 23
    new-instance v0, Lcom/radaee/util/RadaeePluginCallback;

    invoke-direct {v0}, Lcom/radaee/util/RadaeePluginCallback;-><init>()V

    sput-object v0, Lcom/radaee/util/RadaeePluginCallback;->mInstance:Lcom/radaee/util/RadaeePluginCallback;

    .line 25
    :cond_0
    sget-object v0, Lcom/radaee/util/RadaeePluginCallback;->mInstance:Lcom/radaee/util/RadaeePluginCallback;

    return-object v0
.end method


# virtual methods
.method public closeReader()V
    .locals 1

    .line 147
    iget-object v0, p0, Lcom/radaee/util/RadaeePluginCallback;->mActivityListener:Lcom/radaee/util/RadaeePluginCallback$PDFActivityListener;

    if-eqz v0, :cond_0

    .line 148
    invoke-interface {v0}, Lcom/radaee/util/RadaeePluginCallback$PDFActivityListener;->closeReader()V

    :cond_0
    return-void
.end method

.method public didChangePage(I)V
    .locals 1

    .line 61
    iget-object v0, p0, Lcom/radaee/util/RadaeePluginCallback;->mListener:Lcom/radaee/util/RadaeePluginCallback$PDFReaderListener;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lcom/radaee/util/RadaeePluginCallback$PDFReaderListener;->didChangePage(I)V

    :cond_0
    return-void
.end method

.method public didCloseReader()V
    .locals 1

    .line 57
    iget-object v0, p0, Lcom/radaee/util/RadaeePluginCallback;->mListener:Lcom/radaee/util/RadaeePluginCallback$PDFReaderListener;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/radaee/util/RadaeePluginCallback$PDFReaderListener;->didCloseReader()V

    :cond_0
    return-void
.end method

.method public didSearchTerm(Ljava/lang/String;Z)V
    .locals 1

    .line 65
    iget-object v0, p0, Lcom/radaee/util/RadaeePluginCallback;->mListener:Lcom/radaee/util/RadaeePluginCallback$PDFReaderListener;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1, p2}, Lcom/radaee/util/RadaeePluginCallback$PDFReaderListener;->didSearchTerm(Ljava/lang/String;Z)V

    :cond_0
    return-void
.end method

.method public didShowReader()V
    .locals 1

    .line 49
    iget-object v0, p0, Lcom/radaee/util/RadaeePluginCallback;->mListener:Lcom/radaee/util/RadaeePluginCallback$PDFReaderListener;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/radaee/util/RadaeePluginCallback$PDFReaderListener;->didShowReader()V

    :cond_0
    return-void
.end method

.method public flatAnnotAtPage(I)Z
    .locals 1

    .line 135
    iget-object v0, p0, Lcom/radaee/util/RadaeePluginCallback;->mControlListener:Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;->flatAnnotAtPage(I)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public flatAnnots()Z
    .locals 1

    .line 139
    iget-object v0, p0, Lcom/radaee/util/RadaeePluginCallback;->mControlListener:Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;->flatAnnots()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public onAddAnnotAttachment(Ljava/lang/String;)Z
    .locals 1

    .line 126
    iget-object v0, p0, Lcom/radaee/util/RadaeePluginCallback;->mControlListener:Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;->onAddAnnotAttachment(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public onAddMarkupAnnotation(IIII)V
    .locals 1

    .line 168
    iget-object v0, p0, Lcom/radaee/util/RadaeePluginCallback;->mControlListener:Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;->onAddMarkupAnnotation(IIII)V

    :cond_0
    return-void
.end method

.method public onAddTextAnnotation(IFFLjava/lang/String;Ljava/lang/String;)V
    .locals 6

    .line 164
    iget-object v0, p0, Lcom/radaee/util/RadaeePluginCallback;->mControlListener:Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;

    if-eqz v0, :cond_0

    move v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-interface/range {v0 .. v5}, Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;->onAddTextAnnotation(IFFLjava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onAnnotTapped(Lcom/radaee/pdf/Page$Annotation;)V
    .locals 1

    .line 73
    iget-object v0, p0, Lcom/radaee/util/RadaeePluginCallback;->mListener:Lcom/radaee/util/RadaeePluginCallback$PDFReaderListener;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lcom/radaee/util/RadaeePluginCallback$PDFReaderListener;->onAnnotTapped(Lcom/radaee/pdf/Page$Annotation;)V

    :cond_0
    return-void
.end method

.method public onBlankTapped(I)V
    .locals 1

    .line 69
    iget-object v0, p0, Lcom/radaee/util/RadaeePluginCallback;->mListener:Lcom/radaee/util/RadaeePluginCallback$PDFReaderListener;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lcom/radaee/util/RadaeePluginCallback$PDFReaderListener;->onBlankTapped(I)V

    :cond_0
    return-void
.end method

.method public onDoubleTapped(IFF)V
    .locals 1

    .line 82
    iget-object v0, p0, Lcom/radaee/util/RadaeePluginCallback;->mListener:Lcom/radaee/util/RadaeePluginCallback$PDFReaderListener;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1, p2, p3}, Lcom/radaee/util/RadaeePluginCallback$PDFReaderListener;->onDoubleTapped(IFF)V

    :cond_0
    return-void
.end method

.method public onEncryptDocAs(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;II[B)Z
    .locals 7

    .line 122
    iget-object v0, p0, Lcom/radaee/util/RadaeePluginCallback;->mControlListener:Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;

    if-eqz v0, :cond_0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move v5, p5

    move-object v6, p6

    invoke-interface/range {v0 .. v6}, Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;->onEncryptDocAs(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;II[B)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public onGetCharIndex(IFF)I
    .locals 1

    .line 160
    iget-object v0, p0, Lcom/radaee/util/RadaeePluginCallback;->mControlListener:Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1, p2, p3}, Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;->onGetCharIndex(IFF)I

    move-result p1

    return p1

    :cond_0
    const/4 p1, -0x1

    return p1
.end method

.method public onGetJsonFormFields()Ljava/lang/String;
    .locals 1

    .line 102
    iget-object v0, p0, Lcom/radaee/util/RadaeePluginCallback;->mControlListener:Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;->onGetJsonFormFields()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const-string v0, "ERROR"

    return-object v0
.end method

.method public onGetJsonFormFieldsAtPage(I)Ljava/lang/String;
    .locals 1

    .line 106
    iget-object v0, p0, Lcom/radaee/util/RadaeePluginCallback;->mControlListener:Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;->onGetJsonFormFieldsAtPage(I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const-string p1, "ERROR"

    return-object p1
.end method

.method public onGetMarkupAnnotationDetails(I)Ljava/lang/String;
    .locals 1

    .line 156
    iget-object v0, p0, Lcom/radaee/util/RadaeePluginCallback;->mControlListener:Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;->onGetMarkupAnnotationDetails(I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const-string p1, "ERROR"

    return-object p1
.end method

.method public onGetPDFCoordinates(II)Ljava/lang/String;
    .locals 1

    .line 172
    iget-object v0, p0, Lcom/radaee/util/RadaeePluginCallback;->mControlListener:Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1, p2}, Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;->onGetPDFCoordinates(II)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const-string p1, "ERROR"

    return-object p1
.end method

.method public onGetPDFRect(IIII)Ljava/lang/String;
    .locals 1

    .line 184
    iget-object v0, p0, Lcom/radaee/util/RadaeePluginCallback;->mControlListener:Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;->onGetPDFRect(IIII)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const-string p1, "ERROR"

    return-object p1
.end method

.method public onGetPageCount()I
    .locals 1

    .line 114
    iget-object v0, p0, Lcom/radaee/util/RadaeePluginCallback;->mControlListener:Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;->onGetPageCount()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, -0x1

    return v0
.end method

.method public onGetPageText(I)Ljava/lang/String;
    .locals 1

    .line 118
    iget-object v0, p0, Lcom/radaee/util/RadaeePluginCallback;->mControlListener:Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;->onGetPageText(I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const-string p1, "ERROR"

    return-object p1
.end method

.method public onGetScreenCoordinates(IFF)Ljava/lang/String;
    .locals 1

    .line 176
    iget-object v0, p0, Lcom/radaee/util/RadaeePluginCallback;->mControlListener:Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1, p2, p3}, Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;->onGetScreenCoordinates(IFF)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const-string p1, "ERROR"

    return-object p1
.end method

.method public onGetScreenRect(IFFFF)Ljava/lang/String;
    .locals 6

    .line 180
    iget-object v0, p0, Lcom/radaee/util/RadaeePluginCallback;->mControlListener:Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;

    if-eqz v0, :cond_0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-interface/range {v0 .. v5}, Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;->onGetScreenRect(IFFFF)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const-string p1, "ERROR"

    return-object p1
.end method

.method public onGetTextAnnotationDetails(I)Ljava/lang/String;
    .locals 1

    .line 152
    iget-object v0, p0, Lcom/radaee/util/RadaeePluginCallback;->mControlListener:Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;->onGetTextAnnotationDetails(I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const-string p1, "ERROR"

    return-object p1
.end method

.method public onLongPressed(IFF)V
    .locals 1

    .line 86
    iget-object v0, p0, Lcom/radaee/util/RadaeePluginCallback;->mListener:Lcom/radaee/util/RadaeePluginCallback$PDFReaderListener;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1, p2, p3}, Lcom/radaee/util/RadaeePluginCallback$PDFReaderListener;->onLongPressed(IFF)V

    :cond_0
    return-void
.end method

.method public onSetFormFieldsWithJSON(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 110
    iget-object v0, p0, Lcom/radaee/util/RadaeePluginCallback;->mControlListener:Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;->onSetFormFieldsWithJSON(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const-string p1, "ERROR"

    return-object p1
.end method

.method public onSetIconsBGColor(I)V
    .locals 1

    .line 90
    iget-object v0, p0, Lcom/radaee/util/RadaeePluginCallback;->mControlListener:Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;->onSetIconsBGColor(I)V

    :cond_0
    return-void
.end method

.method public onSetImmersive(Z)V
    .locals 1

    .line 98
    iget-object v0, p0, Lcom/radaee/util/RadaeePluginCallback;->mControlListener:Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;->onSetImmersive(Z)V

    :cond_0
    return-void
.end method

.method public onSetToolbarBGColor(I)V
    .locals 1

    .line 94
    iget-object v0, p0, Lcom/radaee/util/RadaeePluginCallback;->mControlListener:Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;->onSetToolbarBGColor(I)V

    :cond_0
    return-void
.end method

.method public onThumbPageClick(I)V
    .locals 1

    .line 77
    iget-object v0, p0, Lcom/radaee/util/RadaeePluginCallback;->mThumbListener:Lcom/radaee/util/RadaeePluginCallback$PDFThumbListener;

    if-eqz v0, :cond_0

    .line 78
    invoke-interface {v0, p1}, Lcom/radaee/util/RadaeePluginCallback$PDFThumbListener;->onPageClicked(I)V

    :cond_0
    return-void
.end method

.method public renderAnnotToFile(IILjava/lang/String;II)Ljava/lang/String;
    .locals 6

    .line 130
    iget-object v0, p0, Lcom/radaee/util/RadaeePluginCallback;->mControlListener:Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;

    if-eqz v0, :cond_0

    move v1, p1

    move v2, p2

    move-object v3, p3

    move v4, p4

    move v5, p5

    invoke-interface/range {v0 .. v5}, Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;->renderAnnotToFile(IILjava/lang/String;II)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 131
    :cond_0
    const-string p1, "ERROR"

    return-object p1
.end method

.method public saveDocumentToPath(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    .line 143
    iget-object v0, p0, Lcom/radaee/util/RadaeePluginCallback;->mControlListener:Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1, p2}, Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;->saveDocumentToPath(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setActivityListener(Lcom/radaee/util/RadaeePluginCallback$PDFActivityListener;)V
    .locals 0

    .line 41
    iput-object p1, p0, Lcom/radaee/util/RadaeePluginCallback;->mActivityListener:Lcom/radaee/util/RadaeePluginCallback$PDFActivityListener;

    return-void
.end method

.method public setControllerListener(Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;)V
    .locals 0

    .line 37
    iput-object p1, p0, Lcom/radaee/util/RadaeePluginCallback;->mControlListener:Lcom/radaee/util/RadaeePluginCallback$PDFControllerListener;

    return-void
.end method

.method public setListener(Lcom/radaee/util/RadaeePluginCallback$PDFReaderListener;)V
    .locals 0

    .line 29
    iput-object p1, p0, Lcom/radaee/util/RadaeePluginCallback;->mListener:Lcom/radaee/util/RadaeePluginCallback$PDFReaderListener;

    return-void
.end method

.method public setThumbListener(Lcom/radaee/util/RadaeePluginCallback$PDFThumbListener;)V
    .locals 0

    .line 33
    iput-object p1, p0, Lcom/radaee/util/RadaeePluginCallback;->mThumbListener:Lcom/radaee/util/RadaeePluginCallback$PDFThumbListener;

    return-void
.end method

.method public willCloseReader()V
    .locals 1

    .line 53
    iget-object v0, p0, Lcom/radaee/util/RadaeePluginCallback;->mListener:Lcom/radaee/util/RadaeePluginCallback$PDFReaderListener;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/radaee/util/RadaeePluginCallback$PDFReaderListener;->willCloseReader()V

    :cond_0
    return-void
.end method

.method public willShowReader()V
    .locals 1

    .line 45
    iget-object v0, p0, Lcom/radaee/util/RadaeePluginCallback;->mListener:Lcom/radaee/util/RadaeePluginCallback$PDFReaderListener;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/radaee/util/RadaeePluginCallback$PDFReaderListener;->willShowReader()V

    :cond_0
    return-void
.end method
