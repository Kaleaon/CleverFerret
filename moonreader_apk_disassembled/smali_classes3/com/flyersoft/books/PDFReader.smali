.class public Lcom/flyersoft/books/PDFReader;
.super Landroid/widget/FrameLayout;
.source "PDFReader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/books/PDFReader$XPos;,
        Lcom/flyersoft/books/PDFReader$PDFNote;,
        Lcom/flyersoft/books/PDFReader$PdfAnnotItem;
    }
.end annotation


# instance fields
.field private act:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field cbzListener:Lorg/comic/ICLayoutView$CLayoutListener;

.field public cbzView:Lorg/comic/CLayoutView;

.field comic:Lcom/flyersoft/books/BaseEBook;

.field djvuListener:Lorg/djvu/IDLayoutView$DjvuLayoutListener;

.field public djvuView:Lorg/djvu/DLayoutView;

.field public fileOperateTime:J

.field filename:Ljava/lang/String;

.field public forbid_immersive_mode:Z

.field private fromPausedResumeOfLandscape:Z

.field public fullLoaded:Z

.field public gl:Z

.field public glView:Lcom/radaee/reader/PDFGLLayoutView;

.field public isCbz:Z

.field public isDjvu:Z

.field isMultiTouch:Z

.field public isOnPaused:Z

.field public isPdf:Z

.field lastVisualBookmark:I

.field private maxH:I

.field private page_chars:[Ljava/lang/Integer;

.field private page_words:[Ljava/lang/Integer;

.field pdfListener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

.field public pdfView:Lcom/radaee/reader/PDFLayoutView;

.field pressDown:Z

.field releaseFromMultiTouch:Z

.field public remotePdfNotes:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/books/PDFReader$PDFNote;",
            ">;"
        }
    .end annotation
.end field

.field public selIndex1:I

.field public selIndex2:I

.field public selR1:[I

.field public selR2:[I

.field public selectedText:Ljava/lang/String;

.field public thumbView:Lcom/radaee/util/PDFThumbView;

.field touchDisabled:Z

.field touchX:I

.field touchY:I

.field public turnedPages:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field warningDlg:Lcom/flyersoft/components/MyDialog;


# direct methods
.method static bridge synthetic -$$Nest$fgetact(Lcom/flyersoft/books/PDFReader;)Lcom/flyersoft/moonreaderp/ActivityTxt;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/books/PDFReader;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mafterPageChanged(Lcom/flyersoft/books/PDFReader;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/books/PDFReader;->afterPageChanged(I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 97
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x1

    .line 80
    iput-boolean p1, p0, Lcom/flyersoft/books/PDFReader;->isPdf:Z

    .line 82
    iput-boolean p1, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    .line 90
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/books/PDFReader;->turnedPages:Ljava/util/ArrayList;

    const/4 p1, -0x1

    .line 969
    iput p1, p0, Lcom/flyersoft/books/PDFReader;->lastVisualBookmark:I

    .line 985
    new-instance p1, Lcom/flyersoft/books/PDFReader$12;

    invoke-direct {p1, p0}, Lcom/flyersoft/books/PDFReader$12;-><init>(Lcom/flyersoft/books/PDFReader;)V

    iput-object p1, p0, Lcom/flyersoft/books/PDFReader;->cbzListener:Lorg/comic/ICLayoutView$CLayoutListener;

    .line 996
    new-instance p1, Lcom/flyersoft/books/PDFReader$13;

    invoke-direct {p1, p0}, Lcom/flyersoft/books/PDFReader$13;-><init>(Lcom/flyersoft/books/PDFReader;)V

    iput-object p1, p0, Lcom/flyersoft/books/PDFReader;->djvuListener:Lorg/djvu/IDLayoutView$DjvuLayoutListener;

    .line 1007
    new-instance p1, Lcom/flyersoft/books/PDFReader$14;

    invoke-direct {p1, p0}, Lcom/flyersoft/books/PDFReader$14;-><init>(Lcom/flyersoft/books/PDFReader;)V

    iput-object p1, p0, Lcom/flyersoft/books/PDFReader;->pdfListener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 101
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x1

    .line 80
    iput-boolean p1, p0, Lcom/flyersoft/books/PDFReader;->isPdf:Z

    .line 82
    iput-boolean p1, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    .line 90
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/books/PDFReader;->turnedPages:Ljava/util/ArrayList;

    const/4 p1, -0x1

    .line 969
    iput p1, p0, Lcom/flyersoft/books/PDFReader;->lastVisualBookmark:I

    .line 985
    new-instance p1, Lcom/flyersoft/books/PDFReader$12;

    invoke-direct {p1, p0}, Lcom/flyersoft/books/PDFReader$12;-><init>(Lcom/flyersoft/books/PDFReader;)V

    iput-object p1, p0, Lcom/flyersoft/books/PDFReader;->cbzListener:Lorg/comic/ICLayoutView$CLayoutListener;

    .line 996
    new-instance p1, Lcom/flyersoft/books/PDFReader$13;

    invoke-direct {p1, p0}, Lcom/flyersoft/books/PDFReader$13;-><init>(Lcom/flyersoft/books/PDFReader;)V

    iput-object p1, p0, Lcom/flyersoft/books/PDFReader;->djvuListener:Lorg/djvu/IDLayoutView$DjvuLayoutListener;

    .line 1007
    new-instance p1, Lcom/flyersoft/books/PDFReader$14;

    invoke-direct {p1, p0}, Lcom/flyersoft/books/PDFReader$14;-><init>(Lcom/flyersoft/books/PDFReader;)V

    iput-object p1, p0, Lcom/flyersoft/books/PDFReader;->pdfListener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    return-void
.end method

.method public static addNameTagToLastAnnot(Lcom/radaee/pdf/Page;Ljava/lang/String;)Lcom/radaee/pdf/Page$Annotation;
    .locals 2

    if-eqz p0, :cond_0

    .line 1552
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/radaee/pdf/Page;->GetAnnotCount()I

    move-result v0

    if-lez v0, :cond_0

    .line 1553
    invoke-virtual {p0}, Lcom/radaee/pdf/Page;->GetAnnotCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Lcom/radaee/pdf/Page;->GetAnnot(I)Lcom/radaee/pdf/Page$Annotation;

    move-result-object p0

    .line 1554
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, ""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/radaee/pdf/Page$Annotation;->SetName(Ljava/lang/String;)Z

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method private afterPageChanged(I)V
    .locals 6

    .line 1169
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "*onPageChanged: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-static {v2}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 1170
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->turnedPages:Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    const/4 v2, -0x1

    if-ne v0, v2, :cond_0

    .line 1171
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->turnedPages:Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1172
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->fullLoaded:Z

    if-eqz v0, :cond_1

    int-to-long v4, p1

    .line 1173
    sput-wide v4, Lcom/flyersoft/tools/A;->lastPosition:J

    .line 1174
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0, v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showReadProgress(I)V

    .line 1176
    :cond_1
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->fullLoaded:Z

    if-eqz v0, :cond_2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/flyersoft/books/PDFReader;->fileOperateTime:J

    sub-long/2addr v2, v4

    const-wide/16 v4, 0x2710

    cmp-long v0, v2, v4

    if-lez v0, :cond_2

    .line 1177
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/flyersoft/books/PDFReader;->fileOperateTime:J

    .line 1178
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->saveLastPostion(Z)V

    .line 1179
    sput-boolean v1, Lcom/flyersoft/tools/A;->forceRebootToTxt:Z

    .line 1180
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->SaveOptions(Landroid/content/Context;)V

    .line 1182
    :cond_2
    invoke-direct {p0, p1}, Lcom/flyersoft/books/PDFReader;->drawVisualBookmark(I)V

    return-void
.end method

.method public static createBitmapOfCbzPage(Lorg/comic/CDocument;ILandroid/util/DisplayMetrics;)Landroid/graphics/Bitmap;
    .locals 2

    .line 1607
    iget-object v0, p0, Lorg/comic/CDocument;->filename:Ljava/lang/String;

    iget-object v1, p0, Lorg/comic/CDocument;->zipper:Lcom/flyersoft/tools/compress/BaseCompressor;

    iget-object p0, p0, Lorg/comic/CDocument;->imageFiles:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-static {v0, v1, p0, p2}, Lcom/flyersoft/tools/compress/BaseCompressor;->getCbzCoverBitmap(Ljava/lang/String;Lcom/flyersoft/tools/compress/BaseCompressor;Ljava/lang/String;Landroid/util/DisplayMetrics;)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method public static createBitmapOfDjvuPage(Lorg/djvu/DDocument;ILandroid/util/DisplayMetrics;)Landroid/graphics/Bitmap;
    .locals 0

    .line 1612
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/djvu/DDocument;->GetPage(I)Lorg/djvu/DPage;

    move-result-object p0

    if-eqz p2, :cond_0

    .line 1613
    iget p1, p2, Landroid/util/DisplayMetrics;->widthPixels:I

    goto :goto_0

    :cond_0
    const/16 p1, 0x280

    .line 1614
    :goto_0
    iget-object p0, p0, Lorg/djvu/DPage;->_page:Lorg/mydroid/droids/djvu/codec/DjvuPage;

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2, p2}, Lorg/mydroid/droids/djvu/codec/DjvuPage;->renderBitmap(IZZ)Landroid/graphics/Bitmap;

    move-result-object p0

    .line 1615
    invoke-static {p0}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result p1
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-nez p1, :cond_1

    return-object p0

    :catch_0
    move-exception p0

    .line 1619
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :catch_1
    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public static createBitmapOfPdfPage(Lcom/radaee/pdf/Document;ILandroid/util/DisplayMetrics;)Landroid/graphics/Bitmap;
    .locals 7

    .line 1627
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v0

    if-eqz p2, :cond_0

    .line 1631
    iget v1, p2, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 1632
    iget p2, p2, Landroid/util/DisplayMetrics;->heightPixels:I

    goto :goto_0

    :cond_0
    const/16 v1, 0x280

    const/16 p2, 0x1e0

    .line 1638
    :goto_0
    invoke-virtual {p0, p1}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v2

    .line 1639
    invoke-virtual {p0, p1}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v3

    mul-int/lit8 v1, v1, 0x48

    int-to-float v1, v1

    div-float/2addr v1, v2

    .line 1640
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    int-to-float v1, v1

    add-int/lit8 p2, p2, -0x32

    mul-int/lit8 p2, p2, 0x48

    int-to-float p2, p2

    div-float/2addr p2, v3

    .line 1641
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    int-to-float p2, p2

    cmpl-float v2, v1, p2

    if-lez v2, :cond_1

    move v1, p2

    .line 1645
    :cond_1
    invoke-virtual {p0, p1}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result p2

    mul-float p2, p2, v1

    const/high16 v2, 0x42900000    # 72.0f

    div-float/2addr p2, v2

    float-to-int p2, p2

    .line 1646
    invoke-virtual {p0, p1}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v3

    mul-float v3, v3, v1

    div-float/2addr v3, v2

    float-to-int v3, v3

    .line 1647
    new-instance v4, Lcom/radaee/pdf/Matrix;

    div-float v5, v1, v2

    neg-float v6, v1

    div-float/2addr v6, v2

    .line 1649
    invoke-virtual {p0, p1}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result p0

    mul-float v1, v1, p0

    div-float/2addr v1, v2

    const/4 p0, 0x0

    invoke-direct {v4, v5, v6, p0, v1}, Lcom/radaee/pdf/Matrix;-><init>(FFFF)V

    .line 1651
    sget-object p0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p2, v3, p0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p0

    const/4 p1, -0x1

    .line 1652
    invoke-virtual {p0, p1}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 1654
    invoke-virtual {v0, p0}, Lcom/radaee/pdf/Page;->RenderPrepare(Landroid/graphics/Bitmap;)V

    .line 1655
    invoke-virtual {v0, p0, v4}, Lcom/radaee/pdf/Page;->RenderToBmp(Landroid/graphics/Bitmap;Lcom/radaee/pdf/Matrix;)Z

    .line 1657
    invoke-virtual {v4}, Lcom/radaee/pdf/Matrix;->Destroy()V

    .line 1658
    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->Close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    :catchall_0
    move-exception p0

    .line 1661
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method private doSelectMoveEvent(Landroid/view/MotionEvent;)V
    .locals 9

    .line 738
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v0, :cond_0

    goto :goto_0

    .line 740
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    float-to-int v6, v0

    .line 741
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    float-to-int v7, p1

    .line 742
    iget-boolean p1, p0, Lcom/flyersoft/books/PDFReader;->isPdf:Z

    if-nez p1, :cond_1

    .line 743
    iget-object v1, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    new-instance v8, Lcom/flyersoft/books/PDFReader$7;

    invoke-direct {v8, p0}, Lcom/flyersoft/books/PDFReader$7;-><init>(Lcom/flyersoft/books/PDFReader;)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v1 .. v8}, Lorg/djvu/DLayoutView;->zSetSelect(ZZIIIILorg/djvu/DLayoutView$OnAfterSelect;)V

    return-void

    .line 750
    :cond_1
    iget-boolean p1, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object p1, p1, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iget-object p1, p1, Lcom/radaee/reader/GLView;->m_sel:Lcom/radaee/view/VSel;

    if-eqz p1, :cond_2

    .line 751
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v1, p1, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    new-instance v8, Lcom/flyersoft/books/PDFReader$8;

    invoke-direct {v8, p0}, Lcom/flyersoft/books/PDFReader$8;-><init>(Lcom/flyersoft/books/PDFReader;)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v1 .. v8}, Lcom/radaee/reader/GLView;->zSetSelect(ZZIIIILcom/radaee/reader/GLView$OnAfterSelect;)V

    .line 758
    :cond_2
    iget-boolean p1, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-nez p1, :cond_3

    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iget-object p1, p1, Lcom/radaee/reader/PDFLayoutView;->m_sel:Lcom/radaee/view/VSel;

    if-eqz p1, :cond_3

    .line 759
    iget-object v1, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    new-instance v8, Lcom/flyersoft/books/PDFReader$9;

    invoke-direct {v8, p0}, Lcom/flyersoft/books/PDFReader$9;-><init>(Lcom/flyersoft/books/PDFReader;)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v1 .. v8}, Lcom/radaee/reader/PDFLayoutView;->zSetSelect(ZZIIIILcom/radaee/reader/PDFLayoutView$OnAfterSelect;)V

    :cond_3
    :goto_0
    return-void
.end method

.method private drawVisualBookmark(I)V
    .locals 6

    .line 971
    sget-object v0, Lcom/flyersoft/tools/A;->contentLay:Lcom/flyersoft/views/ContentLay;

    if-nez v0, :cond_0

    goto :goto_1

    .line 974
    :cond_0
    invoke-static {}, Lcom/flyersoft/tools/A;->getBookmarks()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/tools/A$Bookmark;

    .line 975
    iget-wide v1, v1, Lcom/flyersoft/tools/A$Bookmark;->position:J

    int-to-long v3, p1

    cmp-long v5, v1, v3

    if-nez v5, :cond_1

    goto :goto_0

    :cond_2
    const/4 p1, -0x1

    .line 979
    :goto_0
    iget v0, p0, Lcom/flyersoft/books/PDFReader;->lastVisualBookmark:I

    if-ne v0, p1, :cond_4

    sget-object v1, Lcom/flyersoft/tools/A;->contentLay:Lcom/flyersoft/views/ContentLay;

    iget v1, v1, Lcom/flyersoft/views/ContentLay;->pdfBookmarkIndex:I

    if-eq v0, v1, :cond_3

    goto :goto_2

    :cond_3
    :goto_1
    return-void

    .line 980
    :cond_4
    :goto_2
    iput p1, p0, Lcom/flyersoft/books/PDFReader;->lastVisualBookmark:I

    .line 981
    sget-object p1, Lcom/flyersoft/tools/A;->contentLay:Lcom/flyersoft/views/ContentLay;

    invoke-virtual {p1}, Lcom/flyersoft/views/ContentLay;->postInvalidate()V

    return-void
.end method

.method private initView(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/String;)V
    .locals 2

    .line 132
    sget-boolean v0, Lcom/flyersoft/tools/A;->gl:Z

    iput-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    .line 133
    iput-object p1, p0, Lcom/flyersoft/books/PDFReader;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    .line 134
    iput-object p2, p0, Lcom/flyersoft/books/PDFReader;->filename:Ljava/lang/String;

    .line 135
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/flyersoft/books/PDFReader;->fileOperateTime:J

    const/4 p1, 0x0

    .line 136
    iput-object p1, p0, Lcom/flyersoft/books/PDFReader;->remotePdfNotes:Ljava/util/ArrayList;

    .line 137
    invoke-static {p2}, Lcom/flyersoft/tools/T;->getFileExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 138
    const-string p2, ".pdf"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    iput-boolean p2, p0, Lcom/flyersoft/books/PDFReader;->isPdf:Z

    .line 139
    const-string p2, ".djvu"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/flyersoft/books/PDFReader;->isDjvu:Z

    .line 140
    iget-boolean p2, p0, Lcom/flyersoft/books/PDFReader;->isPdf:Z

    if-nez p2, :cond_0

    if-nez p1, :cond_0

    const/4 p2, 0x1

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    iput-boolean p2, p0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz p2, :cond_2

    .line 144
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->cbzView:Lorg/comic/CLayoutView;

    if-nez p1, :cond_1

    .line 145
    new-instance p1, Lorg/comic/CLayoutView;

    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {p1, p2}, Lorg/comic/CLayoutView;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/flyersoft/books/PDFReader;->cbzView:Lorg/comic/CLayoutView;

    .line 146
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->cbzView:Lorg/comic/CLayoutView;

    goto :goto_1

    :cond_2
    if-eqz p1, :cond_4

    .line 148
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    if-nez p1, :cond_3

    .line 149
    new-instance p1, Lorg/djvu/DLayoutView;

    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {p1, p2}, Lorg/djvu/DLayoutView;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    .line 150
    :cond_3
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    goto :goto_1

    .line 152
    :cond_4
    iget-boolean p1, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    if-nez p1, :cond_5

    .line 153
    new-instance p1, Lcom/radaee/reader/PDFGLLayoutView;

    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/radaee/reader/PDFGLLayoutView;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    .line 154
    iget-object p1, p1, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    new-instance p2, Lcom/flyersoft/books/PDFReader$1;

    invoke-direct {p2, p0}, Lcom/flyersoft/books/PDFReader$1;-><init>(Lcom/flyersoft/books/PDFReader;)V

    iput-object p2, p1, Lcom/radaee/reader/GLView;->beforePageJump:Lcom/radaee/reader/GLView$OnBeforeLinkJump;

    .line 164
    :cond_5
    iget-boolean p1, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-nez p1, :cond_6

    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    if-nez p1, :cond_6

    .line 165
    new-instance p1, Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/radaee/reader/PDFLayoutView;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    .line 166
    new-instance p2, Lcom/flyersoft/books/PDFReader$2;

    invoke-direct {p2, p0}, Lcom/flyersoft/books/PDFReader$2;-><init>(Lcom/flyersoft/books/PDFReader;)V

    iput-object p2, p1, Lcom/radaee/reader/PDFLayoutView;->beforePageJump:Lcom/radaee/reader/PDFLayoutView$OnBeforeLinkJump;

    .line 176
    :cond_6
    iget-boolean p1, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-eqz p1, :cond_7

    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    goto :goto_1

    :cond_7
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    .line 179
    :goto_1
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p2

    if-nez p2, :cond_8

    const/4 p2, -0x1

    .line 180
    invoke-virtual {p0, p1, p2, p2}, Lcom/flyersoft/books/PDFReader;->addView(Landroid/view/View;II)V

    .line 181
    :cond_8
    new-instance p2, Lcom/flyersoft/books/PDFReader$3;

    invoke-direct {p2, p0}, Lcom/flyersoft/books/PDFReader$3;-><init>(Lcom/flyersoft/books/PDFReader;)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    return-void
.end method

.method private pdfAddNoteOrImageOrFreeText(Landroid/view/MotionEvent;)V
    .locals 4

    .line 812
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iget v0, v0, Lcom/radaee/reader/GLView;->m_status:I

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iget v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    .line 813
    :goto_0
    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object p1

    const/16 v1, 0x8

    if-ne v0, v1, :cond_1

    .line 816
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/flyersoft/tools/A;->outerImagesFolder:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ".png"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 817
    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Lcom/flyersoft/books/PDFReader$10;

    invoke-direct {v2, p0, p1, v0}, Lcom/flyersoft/books/PDFReader$10;-><init>(Lcom/flyersoft/books/PDFReader;Landroid/view/MotionEvent;Ljava/lang/String;)V

    const/4 p1, 0x1

    invoke-static {v1, v0, p1, v2}, Lcom/flyersoft/moonreaderp/SelectImageAct;->selectImage(Landroid/content/Context;Ljava/lang/String;ZLcom/flyersoft/tools/T$FileResultOK;)V

    return-void

    .line 836
    :cond_1
    new-instance v1, Landroid/widget/EditText;

    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 837
    new-instance v2, Lcom/flyersoft/components/MyDialog;

    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v1}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v2

    new-instance v3, Lcom/flyersoft/books/PDFReader$11;

    invoke-direct {v3, p0, v1, v0, p1}, Lcom/flyersoft/books/PDFReader$11;-><init>(Lcom/flyersoft/books/PDFReader;Landroid/widget/EditText;ILandroid/view/MotionEvent;)V

    const p1, 0x104000a

    .line 838
    invoke-virtual {v2, p1, v3}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const/high16 v0, 0x1040000

    const/4 v1, 0x0

    .line 857
    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    .line 858
    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method

.method private pdfFinishAddAnnot(Landroid/view/MotionEvent;)V
    .locals 11

    .line 770
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    const/4 v1, 0x5

    const/4 v2, 0x4

    const/16 v3, 0x47

    const/4 v4, 0x7

    const/16 v5, 0xc8

    const/16 v6, 0x8

    const/4 v7, 0x6

    const/4 v8, 0x3

    const/4 v9, 0x0

    const/4 v10, 0x1

    if-eqz v0, :cond_7

    .line 771
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iget v0, v0, Lcom/radaee/reader/GLView;->m_status:I

    if-ne v0, v8, :cond_0

    goto :goto_2

    .line 773
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iget v0, v0, Lcom/radaee/reader/GLView;->m_status:I

    if-eq v0, v7, :cond_6

    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iget v0, v0, Lcom/radaee/reader/GLView;->m_status:I

    if-eq v0, v6, :cond_6

    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iget v0, v0, Lcom/radaee/reader/GLView;->m_status:I

    if-ne v0, v5, :cond_1

    goto :goto_0

    .line 776
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object p1, p1, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iget p1, p1, Lcom/radaee/reader/GLView;->m_status:I

    if-ne p1, v4, :cond_2

    .line 777
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    invoke-virtual {p1, v10}, Lcom/radaee/reader/PDFGLLayoutView;->PDFSetLine(I)V

    .line 778
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object p1, p1, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iget p1, p1, Lcom/radaee/reader/GLView;->m_status:I

    if-ne p1, v3, :cond_3

    .line 779
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object p1, p1, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {p1, v10}, Lcom/radaee/reader/GLView;->PDFSetArrow(I)V

    .line 780
    :cond_3
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object p1, p1, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iget p1, p1, Lcom/radaee/reader/GLView;->m_status:I

    if-ne p1, v2, :cond_4

    .line 781
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    invoke-virtual {p1, v10}, Lcom/radaee/reader/PDFGLLayoutView;->PDFSetRect(I)V

    .line 782
    :cond_4
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object p1, p1, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iget p1, p1, Lcom/radaee/reader/GLView;->m_status:I

    if-ne p1, v1, :cond_5

    .line 783
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    invoke-virtual {p1, v10}, Lcom/radaee/reader/PDFGLLayoutView;->PDFSetEllipse(I)V

    .line 784
    :cond_5
    sput-boolean v10, Lcom/flyersoft/tools/A;->pdfAnnotUpdated:Z

    goto :goto_1

    .line 774
    :cond_6
    :goto_0
    invoke-direct {p0, p1}, Lcom/flyersoft/books/PDFReader;->pdfAddNoteOrImageOrFreeText(Landroid/view/MotionEvent;)V

    .line 786
    :goto_1
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object p1, p1, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iput v9, p1, Lcom/radaee/reader/GLView;->m_status:I

    goto :goto_5

    .line 788
    :cond_7
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iget v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    if-ne v0, v8, :cond_8

    :goto_2
    return-void

    .line 790
    :cond_8
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iget v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    if-eq v0, v7, :cond_e

    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iget v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    if-eq v0, v6, :cond_e

    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iget v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    if-ne v0, v5, :cond_9

    goto :goto_3

    .line 793
    :cond_9
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iget p1, p1, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    if-ne p1, v4, :cond_a

    .line 794
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {p1, v10}, Lcom/radaee/reader/PDFLayoutView;->PDFSetLine(I)V

    .line 795
    :cond_a
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iget p1, p1, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    if-ne p1, v3, :cond_b

    .line 796
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {p1, v10}, Lcom/radaee/reader/PDFLayoutView;->PDFSetArrow(I)V

    .line 797
    :cond_b
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iget p1, p1, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    if-ne p1, v2, :cond_c

    .line 798
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {p1, v10}, Lcom/radaee/reader/PDFLayoutView;->PDFSetRect(I)V

    .line 799
    :cond_c
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iget p1, p1, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    if-ne p1, v1, :cond_d

    .line 800
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {p1, v10}, Lcom/radaee/reader/PDFLayoutView;->PDFSetEllipse(I)V

    .line 801
    :cond_d
    sput-boolean v10, Lcom/flyersoft/tools/A;->pdfAnnotUpdated:Z

    goto :goto_4

    .line 791
    :cond_e
    :goto_3
    invoke-direct {p0, p1}, Lcom/flyersoft/books/PDFReader;->pdfAddNoteOrImageOrFreeText(Landroid/view/MotionEvent;)V

    .line 803
    :goto_4
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iput v9, p1, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    .line 806
    :goto_5
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v0, 0x0

    iput-object v0, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->antSelected:Landroid/widget/ImageView;

    .line 807
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1, v9}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfShowAnnotLay(Z)V

    .line 808
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfSaveAnnotsForTime()V

    return-void
.end method

.method private pdfGetAnnotFromNote(Lcom/flyersoft/tools/BookDb$NoteInfo;Lcom/radaee/pdf/Page;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flyersoft/tools/BookDb$NoteInfo;",
            "Lcom/radaee/pdf/Page;",
            "Ljava/util/ArrayList<",
            "Lcom/radaee/pdf/Page$Annotation;",
            ">;",
            "Ljava/util/ArrayList<",
            "Lcom/radaee/pdf/Page$Annotation;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 1941
    :goto_0
    invoke-virtual {p2}, Lcom/radaee/pdf/Page;->GetAnnotCount()I

    move-result v2

    if-ge v1, v2, :cond_4

    .line 1942
    invoke-virtual {p2, v1}, Lcom/radaee/pdf/Page;->GetAnnot(I)Lcom/radaee/pdf/Page$Annotation;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 1943
    invoke-virtual {v2}, Lcom/radaee/pdf/Page$Annotation;->isHighlight()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 1944
    invoke-virtual {v2}, Lcom/radaee/pdf/Page$Annotation;->GetRect()[F

    move-result-object v3

    .line 1945
    new-instance v4, Lcom/radaee/view/VSel;

    invoke-direct {v4, p2}, Lcom/radaee/view/VSel;-><init>(Lcom/radaee/pdf/Page;)V

    .line 1946
    aget v5, v3, v0

    const/4 v10, 0x1

    aget v6, v3, v10

    const/4 v11, 0x2

    aget v7, v3, v11

    const/4 v8, 0x3

    aget v8, v3, v8

    const/4 v9, 0x1

    invoke-virtual/range {v4 .. v9}, Lcom/radaee/view/VSel;->SetSel(FFFFZ)V

    .line 1947
    iget v3, v4, Lcom/radaee/view/VSel;->m_index1:I

    iget v5, p1, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastChapter:I

    if-eq v3, v5, :cond_0

    iget v3, v4, Lcom/radaee/view/VSel;->m_index1:I

    iget v5, p1, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastChapter:I

    sub-int/2addr v5, v10

    if-ne v3, v5, :cond_1

    :cond_0
    iget v3, v4, Lcom/radaee/view/VSel;->m_index2:I

    iget v5, p1, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastSplitIndex:I

    if-eq v3, v5, :cond_2

    iget v3, v4, Lcom/radaee/view/VSel;->m_index2:I

    iget v5, p1, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastSplitIndex:I

    add-int/2addr v5, v10

    if-eq v3, v5, :cond_2

    iget v3, v4, Lcom/radaee/view/VSel;->m_index2:I

    iget v5, p1, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastSplitIndex:I

    add-int/2addr v5, v11

    if-ne v3, v5, :cond_1

    goto :goto_1

    .line 1950
    :cond_1
    iget v3, v4, Lcom/radaee/view/VSel;->m_index1:I

    iget v5, p1, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastChapter:I

    sub-int/2addr v5, v10

    if-lt v3, v5, :cond_3

    iget v3, v4, Lcom/radaee/view/VSel;->m_index2:I

    iget v4, p1, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastSplitIndex:I

    add-int/2addr v4, v11

    if-gt v3, v4, :cond_3

    move-object/from16 v3, p4

    .line 1951
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_2
    :goto_1
    move-object/from16 v3, p4

    .line 1949
    invoke-virtual {p3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_3
    move-object/from16 v3, p4

    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_4
    return-void
.end method

.method private pdfGetNoteFromAnnot(Lcom/radaee/pdf/Page$Annotation;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/radaee/pdf/Page$Annotation;",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$NoteInfo;",
            ">;",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$NoteInfo;",
            ">;)V"
        }
    .end annotation

    .line 2004
    iget-object v0, p1, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    iget v0, v0, Lcom/radaee/pdf/Page;->pageno:I

    .line 2005
    new-instance v1, Lcom/radaee/view/VSel;

    iget-object v2, p1, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    invoke-direct {v1, v2}, Lcom/radaee/view/VSel;-><init>(Lcom/radaee/pdf/Page;)V

    .line 2006
    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetRect()[F

    move-result-object p1

    const/4 v7, 0x0

    .line 2007
    aget v2, p1, v7

    const/4 v8, 0x1

    aget v3, p1, v8

    const/4 v9, 0x2

    aget v4, p1, v9

    const/4 v5, 0x3

    aget v5, p1, v5

    const/4 v6, 0x1

    invoke-virtual/range {v1 .. v6}, Lcom/radaee/view/VSel;->SetSel(FFFFZ)V

    .line 2009
    :goto_0
    invoke-static {}, Lcom/flyersoft/tools/A;->getHighlights()Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-ge v7, p1, :cond_4

    .line 2010
    invoke-static {}, Lcom/flyersoft/tools/A;->getHighlights()Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/tools/BookDb$NoteInfo;

    .line 2011
    iget-wide v2, p1, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J

    int-to-long v4, v0

    cmp-long v6, v2, v4

    if-nez v6, :cond_3

    .line 2012
    iget v2, v1, Lcom/radaee/view/VSel;->m_index1:I

    iget v3, p1, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastChapter:I

    if-eq v2, v3, :cond_0

    iget v2, v1, Lcom/radaee/view/VSel;->m_index1:I

    iget v3, p1, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastChapter:I

    sub-int/2addr v3, v8

    if-ne v2, v3, :cond_1

    :cond_0
    iget v2, v1, Lcom/radaee/view/VSel;->m_index2:I

    iget v3, p1, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastSplitIndex:I

    if-eq v2, v3, :cond_2

    iget v2, v1, Lcom/radaee/view/VSel;->m_index2:I

    iget v3, p1, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastSplitIndex:I

    add-int/2addr v3, v8

    if-eq v2, v3, :cond_2

    iget v2, v1, Lcom/radaee/view/VSel;->m_index2:I

    iget v3, p1, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastSplitIndex:I

    add-int/2addr v3, v9

    if-ne v2, v3, :cond_1

    goto :goto_1

    .line 2015
    :cond_1
    iget v2, v1, Lcom/radaee/view/VSel;->m_index1:I

    iget v3, p1, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastChapter:I

    sub-int/2addr v3, v8

    if-lt v2, v3, :cond_3

    iget v2, v1, Lcom/radaee/view/VSel;->m_index2:I

    iget v3, p1, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastSplitIndex:I

    add-int/2addr v3, v9

    if-gt v2, v3, :cond_3

    .line 2016
    invoke-virtual {p3, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 2014
    :cond_2
    :goto_1
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_3
    :goto_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    :cond_4
    return-void
.end method

.method private pdfHasAnnotFromPDFNote(Lcom/flyersoft/books/PDFReader$PDFNote;Lcom/radaee/pdf/Page;Z)Z
    .locals 11

    if-eqz p3, :cond_0

    .line 1958
    invoke-virtual {p2}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 1959
    :cond_0
    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, ""

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p1, Lcom/flyersoft/books/PDFReader$PDFNote;->original:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 1960
    :goto_0
    invoke-virtual {p2}, Lcom/radaee/pdf/Page;->GetAnnotCount()I

    move-result v2

    if-ge v1, v2, :cond_3

    .line 1961
    invoke-virtual {p2, v1}, Lcom/radaee/pdf/Page;->GetAnnot(I)Lcom/radaee/pdf/Page$Annotation;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 1962
    invoke-virtual {v2}, Lcom/radaee/pdf/Page$Annotation;->isHighlight()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1963
    invoke-virtual {v2}, Lcom/radaee/pdf/Page$Annotation;->GetName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p3, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_1

    return v4

    .line 1965
    :cond_1
    invoke-virtual {v2}, Lcom/radaee/pdf/Page$Annotation;->GetRect()[F

    move-result-object v2

    .line 1966
    new-instance v5, Lcom/radaee/view/VSel;

    invoke-direct {v5, p2}, Lcom/radaee/view/VSel;-><init>(Lcom/radaee/pdf/Page;)V

    .line 1967
    aget v6, v2, v0

    aget v7, v2, v4

    const/4 v3, 0x2

    aget v8, v2, v3

    const/4 v9, 0x3

    aget v9, v2, v9

    const/4 v10, 0x1

    invoke-virtual/range {v5 .. v10}, Lcom/radaee/view/VSel;->SetSel(FFFFZ)V

    .line 1968
    iget v2, v5, Lcom/radaee/view/VSel;->m_index1:I

    iget v6, p1, Lcom/flyersoft/books/PDFReader$PDFNote;->start:I

    sub-int/2addr v6, v4

    if-lt v2, v6, :cond_2

    iget v2, v5, Lcom/radaee/view/VSel;->m_index2:I

    iget v5, p1, Lcom/flyersoft/books/PDFReader$PDFNote;->end:I

    add-int/2addr v5, v3

    if-gt v2, v5, :cond_2

    return v4

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    return v0
.end method

.method private updateGlobalHighlightColors()V
    .locals 1

    .line 959
    sget v0, Lcom/flyersoft/tools/A;->pdf_highlight_color:I

    sput v0, Lcom/radaee/pdf/Global;->highlight_color:I

    .line 960
    sget v0, Lcom/flyersoft/tools/A;->underline_color:I

    sput v0, Lcom/radaee/pdf/Global;->underline_color:I

    .line 961
    sget v0, Lcom/flyersoft/tools/A;->strikethrough_color:I

    sput v0, Lcom/radaee/pdf/Global;->strikeout_color:I

    .line 962
    sget v0, Lcom/flyersoft/tools/A;->squiggly_color:I

    sput v0, Lcom/radaee/pdf/Global;->squiggle_color:I

    return-void
.end method

.method public static validatedPdfMetaTitle(Ljava/lang/String;)Z
    .locals 2

    .line 1733
    invoke-static {p0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 1735
    :cond_0
    const-string v0, "<"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, ">"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_1

    return v1

    :cond_1
    const/4 p0, 0x1

    return p0
.end method


# virtual methods
.method public RGB2PDfColor(III)I
    .locals 3

    .line 1569
    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v0

    add-int/2addr v0, p3

    .line 1570
    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v1

    add-int/2addr v1, p3

    .line 1571
    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result v2

    add-int/2addr v2, p3

    const/16 p3, 0xff

    if-le v0, p3, :cond_0

    const/16 v0, 0xff

    :cond_0
    if-le v1, p3, :cond_1

    const/16 v1, 0xff

    :cond_1
    if-le v2, p3, :cond_2

    const/16 v2, 0xff

    :cond_2
    const/4 p3, 0x0

    if-gez v0, :cond_3

    const/4 v0, 0x0

    :cond_3
    if-gez v1, :cond_4

    const/4 v1, 0x0

    :cond_4
    if-gez v2, :cond_5

    const/4 v2, 0x0

    :cond_5
    const/4 p3, -0x1

    if-ne p2, p3, :cond_6

    .line 1578
    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result p2

    .line 1579
    :cond_6
    invoke-static {p2, v0, v1, v2}, Landroid/graphics/Color;->argb(IIII)I

    move-result p1

    return p1
.end method

.method public addNewRemoteNote(JJIIIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1361
    invoke-virtual {p11}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    if-ne p5, p6, :cond_0

    return-void

    .line 1363
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->remotePdfNotes:Ljava/util/ArrayList;

    if-nez v0, :cond_1

    .line 1364
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/books/PDFReader;->remotePdfNotes:Ljava/util/ArrayList;

    :cond_1
    move-wide v0, p1

    .line 1365
    new-instance p1, Lcom/flyersoft/books/PDFReader$PDFNote;

    long-to-int p2, v0

    invoke-direct/range {p1 .. p11}, Lcom/flyersoft/books/PDFReader$PDFNote;-><init>(IJIIIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1366
    iget-object p2, p0, Lcom/flyersoft/books/PDFReader;->remotePdfNotes:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public canSave()Z
    .locals 2

    .line 1324
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    .line 1326
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isDjvu:Z

    if-eqz v0, :cond_1

    return v1

    .line 1329
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->pdfGetDoc()Lcom/radaee/pdf/Document;

    move-result-object v0

    invoke-virtual {v0}, Lcom/radaee/pdf/Document;->CanSave()Z

    move-result v0

    return v0
.end method

.method public closeDoc()V
    .locals 1

    .line 292
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->cbzView:Lorg/comic/CLayoutView;

    if-eqz v0, :cond_0

    .line 293
    iget-object v0, v0, Lorg/comic/CLayoutView;->m_doc:Lorg/comic/CDocument;

    invoke-virtual {v0}, Lorg/comic/CDocument;->Close()V

    .line 295
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    if-eqz v0, :cond_1

    .line 296
    invoke-virtual {v0}, Lorg/djvu/DLayoutView;->DjvuClose()V

    .line 297
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    iget-object v0, v0, Lorg/djvu/DLayoutView;->m_doc:Lorg/djvu/DDocument;

    if-eqz v0, :cond_1

    .line 298
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    iget-object v0, v0, Lorg/djvu/DLayoutView;->m_doc:Lorg/djvu/DDocument;

    invoke-virtual {v0}, Lorg/djvu/DDocument;->Close()V

    .line 300
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    if-eqz v0, :cond_2

    .line 301
    invoke-virtual {v0}, Lcom/radaee/reader/PDFGLLayoutView;->PDFClose()V

    .line 302
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    if-eqz v0, :cond_2

    .line 303
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v0}, Lcom/radaee/pdf/Document;->Close()V

    .line 305
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    if-eqz v0, :cond_3

    .line 306
    invoke-virtual {v0}, Lcom/radaee/reader/PDFLayoutView;->PDFClose()V

    .line 307
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    if-eqz v0, :cond_3

    .line 308
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v0}, Lcom/radaee/pdf/Document;->Close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    .line 311
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_3
    return-void
.end method

.method public comicInfo()Lcom/flyersoft/books/BaseEBook;
    .locals 2

    .line 1295
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 1297
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->comic:Lcom/flyersoft/books/BaseEBook;

    if-nez v0, :cond_1

    .line 1298
    new-instance v0, Lcom/flyersoft/books/ComicInfo;

    iget-object v1, p0, Lcom/flyersoft/books/PDFReader;->filename:Ljava/lang/String;

    invoke-direct {v0, v1}, Lcom/flyersoft/books/ComicInfo;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/flyersoft/books/PDFReader;->comic:Lcom/flyersoft/books/BaseEBook;

    .line 1299
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->comic:Lcom/flyersoft/books/BaseEBook;

    return-object v0
.end method

.method public createBitmapOfPage(ILandroid/util/DisplayMetrics;)Landroid/graphics/Bitmap;
    .locals 1

    .line 1597
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v0, :cond_0

    .line 1598
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->cbzView:Lorg/comic/CLayoutView;

    iget-object v0, v0, Lorg/comic/CLayoutView;->m_doc:Lorg/comic/CDocument;

    invoke-static {v0, p1, p2}, Lcom/flyersoft/books/PDFReader;->createBitmapOfCbzPage(Lorg/comic/CDocument;ILandroid/util/DisplayMetrics;)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1

    .line 1599
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isDjvu:Z

    if-eqz v0, :cond_1

    .line 1600
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    iget-object v0, v0, Lorg/djvu/DLayoutView;->m_doc:Lorg/djvu/DDocument;

    invoke-static {v0, p1, p2}, Lcom/flyersoft/books/PDFReader;->createBitmapOfDjvuPage(Lorg/djvu/DDocument;ILandroid/util/DisplayMetrics;)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1

    .line 1602
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->pdfGetDoc()Lcom/radaee/pdf/Document;

    move-result-object v0

    invoke-static {v0, p1, p2}, Lcom/flyersoft/books/PDFReader;->createBitmapOfPdfPage(Lcom/radaee/pdf/Document;ILandroid/util/DisplayMetrics;)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1
.end method

.method public delForceSel(Z)V
    .locals 1

    .line 267
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v0, :cond_0

    return-void

    .line 268
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isDjvu:Z

    if-eqz v0, :cond_1

    .line 269
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    invoke-virtual {v0, p1}, Lorg/djvu/DLayoutView;->delForceSel(Z)V

    return-void

    .line 271
    :cond_1
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-eqz v0, :cond_2

    .line 272
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0, p1}, Lcom/radaee/reader/GLView;->delForceSel(Z)V

    return-void

    .line 274
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {v0, p1}, Lcom/radaee/reader/PDFLayoutView;->delForceSel(Z)V

    return-void
.end method

.method public djvuGetCIndexAtPoint(FF)Lorg/djvu/DLayout$DjvuPos;
    .locals 5

    .line 442
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    iget-object v0, v0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    float-to-int v1, p1

    float-to-int v2, p2

    .line 443
    invoke-virtual {v0, v1, v2}, Lorg/djvu/DLayout;->vGetPos(II)Lorg/djvu/DLayout$DjvuPos;

    move-result-object v1

    .line 444
    iget v2, v1, Lorg/djvu/DLayout$DjvuPos;->pageno:I

    invoke-virtual {v0, v2}, Lorg/djvu/DLayout;->vGetPage(I)Lorg/djvu/VDPage;

    move-result-object v2

    .line 445
    sget v3, Lcom/radaee/pdf/Global;->def_view:I

    const/4 v4, 0x3

    if-ne v3, v4, :cond_0

    .line 446
    invoke-virtual {v2}, Lorg/djvu/VDPage;->getVyOff()F

    move-result v3

    sub-float/2addr p2, v3

    .line 449
    :cond_0
    invoke-virtual {v0}, Lorg/djvu/DLayout;->vGetX()I

    move-result v3

    int-to-float v3, v3

    add-float/2addr p1, v3

    invoke-virtual {v2, p1}, Lorg/djvu/VDPage;->GetDjvuX(F)F

    move-result p1

    .line 450
    invoke-virtual {v0}, Lorg/djvu/DLayout;->vGetY()I

    move-result v3

    int-to-float v3, v3

    add-float/2addr p2, v3

    invoke-virtual {v2, p2}, Lorg/djvu/VDPage;->GetDjvuY(F)F

    move-result p2

    const/4 v2, 0x2

    new-array v2, v2, [F

    const/4 v3, 0x0

    aput p1, v2, v3

    const/4 p1, 0x1

    aput p2, v2, p1

    .line 451
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    iget-object p1, p1, Lorg/djvu/DLayoutView;->m_doc:Lorg/djvu/DDocument;

    iget p2, v1, Lorg/djvu/DLayout$DjvuPos;->pageno:I

    invoke-virtual {p1, p2}, Lorg/djvu/DDocument;->GetPage(I)Lorg/djvu/DPage;

    move-result-object p1

    iget p2, v0, Lorg/djvu/DLayout;->m_scale:F

    invoke-virtual {p1, v2, p2}, Lorg/djvu/DPage;->ObjsGetCharIndex([FF)I

    move-result p1

    iput p1, v1, Lorg/djvu/DLayout$DjvuPos;->cindex:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    move-exception p1

    .line 454
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    const/4 p1, 0x0

    return-object p1
.end method

.method public djvuGetPointAtCIndex(II)Lorg/djvu/DLayout$DjvuPos;
    .locals 5

    .line 494
    new-instance v0, Lorg/djvu/DLayout$DjvuPos;

    invoke-direct {v0}, Lorg/djvu/DLayout$DjvuPos;-><init>()V

    .line 496
    :try_start_0
    iget-object v1, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    iget-object v1, v1, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    .line 497
    invoke-virtual {v1, p1}, Lorg/djvu/DLayout;->vGetPage(I)Lorg/djvu/VDPage;

    move-result-object v2

    .line 498
    iget-object v3, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    iget-object v3, v3, Lorg/djvu/DLayoutView;->m_doc:Lorg/djvu/DDocument;

    invoke-virtual {v3, p1}, Lorg/djvu/DDocument;->GetPage(I)Lorg/djvu/DPage;

    move-result-object p1

    invoke-virtual {p1, p2}, Lorg/djvu/DPage;->ObjsGetCharRect(I)Landroid/graphics/RectF;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 502
    :cond_0
    iget p2, p1, Landroid/graphics/RectF;->left:F

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v3

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v3, v4

    add-float/2addr p2, v3

    invoke-virtual {v2, p2}, Lorg/djvu/VDPage;->GetVX(F)I

    move-result p2

    invoke-virtual {v1}, Lorg/djvu/DLayout;->vGetX()I

    move-result v3

    sub-int/2addr p2, v3

    int-to-float p2, p2

    iput p2, v0, Lorg/djvu/DLayout$DjvuPos;->x:F

    .line 503
    iget p2, p1, Landroid/graphics/RectF;->top:F

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result p1

    div-float/2addr p1, v4

    add-float/2addr p2, p1

    invoke-virtual {v2, p2}, Lorg/djvu/VDPage;->GetVY(F)I

    move-result p1

    invoke-virtual {v1}, Lorg/djvu/DLayout;->vGetY()I

    move-result p2

    sub-int/2addr p1, p2

    int-to-float p1, p1

    iput p1, v0, Lorg/djvu/DLayout$DjvuPos;->y:F
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p1

    .line 505
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-object v0
.end method

.method public djvuGetVRectOfCIndex(II)Landroid/graphics/RectF;
    .locals 8

    const/4 v0, 0x0

    .line 513
    :try_start_0
    iget-object v1, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    iget-object v1, v1, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    .line 514
    invoke-virtual {v1, p1}, Lorg/djvu/DLayout;->vGetPage(I)Lorg/djvu/VDPage;

    move-result-object v2

    .line 515
    iget-object v3, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    iget-object v3, v3, Lorg/djvu/DLayoutView;->m_doc:Lorg/djvu/DDocument;

    invoke-virtual {v3, p1}, Lorg/djvu/DDocument;->GetPage(I)Lorg/djvu/DPage;

    move-result-object p1

    invoke-virtual {p1, p2}, Lorg/djvu/DPage;->ObjsGetCharRect(I)Landroid/graphics/RectF;

    move-result-object p1

    if-nez p1, :cond_0

    return-object v0

    .line 519
    :cond_0
    sget p2, Lcom/radaee/pdf/Global;->def_view:I

    const/4 v3, 0x3

    if-ne p2, v3, :cond_1

    invoke-virtual {v2}, Lorg/djvu/VDPage;->getVyOff()F

    move-result p2

    goto :goto_0

    :cond_1
    const/4 p2, 0x0

    .line 520
    :goto_0
    new-instance v3, Landroid/graphics/RectF;

    iget v4, p1, Landroid/graphics/RectF;->left:F

    invoke-virtual {v2, v4}, Lorg/djvu/VDPage;->GetVX(F)I

    move-result v4

    invoke-virtual {v1}, Lorg/djvu/DLayout;->vGetX()I

    move-result v5

    sub-int/2addr v4, v5

    int-to-float v4, v4

    iget v5, p1, Landroid/graphics/RectF;->top:F

    .line 521
    invoke-virtual {v2, v5}, Lorg/djvu/VDPage;->GetVY(F)I

    move-result v5

    invoke-virtual {v1}, Lorg/djvu/DLayout;->vGetY()I

    move-result v6

    sub-int/2addr v5, v6

    int-to-float v5, v5

    add-float/2addr v5, p2

    iget v6, p1, Landroid/graphics/RectF;->right:F

    .line 522
    invoke-virtual {v2, v6}, Lorg/djvu/VDPage;->GetVX(F)I

    move-result v6

    invoke-virtual {v1}, Lorg/djvu/DLayout;->vGetX()I

    move-result v7

    sub-int/2addr v6, v7

    int-to-float v6, v6

    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    .line 523
    invoke-virtual {v2, p1}, Lorg/djvu/VDPage;->GetVY(F)I

    move-result p1

    invoke-virtual {v1}, Lorg/djvu/DLayout;->vGetY()I

    move-result v1

    sub-int/2addr p1, v1

    int-to-float p1, p1

    add-float/2addr p1, p2

    invoke-direct {v3, v4, v5, v6, p1}, Landroid/graphics/RectF;-><init>(FFFF)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v3

    :catch_0
    move-exception p1

    .line 525
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-object v0
.end method

.method public djvuVDPageAtPoint(Landroid/view/MotionEvent;)Lorg/djvu/VDPage;
    .locals 2

    .line 413
    :try_start_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    .line 414
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    .line 415
    iget-object v1, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    iget-object v1, v1, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    float-to-int v0, v0

    float-to-int p1, p1

    .line 416
    invoke-virtual {v1, v0, p1}, Lorg/djvu/DLayout;->vGetPos(II)Lorg/djvu/DLayout$DjvuPos;

    move-result-object p1

    .line 417
    iget p1, p1, Lorg/djvu/DLayout$DjvuPos;->pageno:I

    invoke-virtual {v1, p1}, Lorg/djvu/DLayout;->vGetPage(I)Lorg/djvu/VDPage;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 420
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    const/4 p1, 0x0

    return-object p1
.end method

.method public doInvalidate()V
    .locals 0

    .line 885
    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->invalidate()V

    return-void
.end method

.method public doInvalidate2()V
    .locals 1

    .line 889
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v0, :cond_0

    .line 890
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->cbzView:Lorg/comic/CLayoutView;

    if-eqz v0, :cond_3

    .line 891
    invoke-virtual {v0}, Lorg/comic/CLayoutView;->invalidate()V

    return-void

    .line 892
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isDjvu:Z

    if-eqz v0, :cond_1

    .line 893
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    if-eqz v0, :cond_3

    .line 894
    invoke-virtual {v0}, Lorg/djvu/DLayoutView;->invalidate()V

    return-void

    .line 896
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    if-eqz v0, :cond_2

    .line 897
    invoke-virtual {v0}, Lcom/radaee/reader/PDFGLLayoutView;->invalidate()V

    .line 898
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    if-eqz v0, :cond_3

    .line 899
    invoke-virtual {v0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    :cond_3
    return-void
.end method

.method public doPostInvalidate()V
    .locals 1

    .line 869
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v0, :cond_0

    .line 870
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->cbzView:Lorg/comic/CLayoutView;

    if-eqz v0, :cond_3

    .line 871
    invoke-virtual {v0}, Lorg/comic/CLayoutView;->invalidate()V

    goto :goto_0

    .line 872
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isDjvu:Z

    if-eqz v0, :cond_1

    .line 873
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    if-eqz v0, :cond_3

    .line 874
    invoke-virtual {v0}, Lorg/djvu/DLayoutView;->invalidate()V

    goto :goto_0

    .line 876
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    if-eqz v0, :cond_2

    .line 877
    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->doInvalidate()V

    .line 878
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    if-eqz v0, :cond_3

    .line 879
    invoke-virtual {v0}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    .line 881
    :cond_3
    :goto_0
    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->postInvalidate()V

    return-void
.end method

.method public doSelectEnd(Ljava/lang/String;II[I[IZ)V
    .locals 4

    .line 1191
    iput-object p1, p0, Lcom/flyersoft/books/PDFReader;->selectedText:Ljava/lang/String;

    .line 1192
    iput p2, p0, Lcom/flyersoft/books/PDFReader;->selIndex1:I

    .line 1193
    iput p3, p0, Lcom/flyersoft/books/PDFReader;->selIndex2:I

    .line 1194
    iput-object p4, p0, Lcom/flyersoft/books/PDFReader;->selR1:[I

    .line 1195
    iput-object p5, p0, Lcom/flyersoft/books/PDFReader;->selR2:[I

    if-nez p1, :cond_0

    if-nez p4, :cond_0

    if-nez p5, :cond_0

    .line 1197
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->hideDotViews()Z

    return-void

    :cond_0
    if-eqz p6, :cond_2

    if-eqz p4, :cond_2

    if-nez p5, :cond_1

    goto :goto_0

    .line 1202
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->dot1:Lcom/flyersoft/views/DotImageView;

    invoke-virtual {p1}, Lcom/flyersoft/views/DotImageView;->getWidth()I

    move-result p1

    .line 1203
    iget-object p2, p0, Lcom/flyersoft/books/PDFReader;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p3, p2, Lcom/flyersoft/moonreaderp/ActivityTxt;->dot1:Lcom/flyersoft/views/DotImageView;

    const/4 p6, 0x0

    aget v0, p4, p6

    const/4 v1, 0x2

    div-int/2addr p1, v1

    sub-int/2addr v0, p1

    const/4 v2, 0x3

    aget p4, p4, v2

    const/4 v3, 0x1

    invoke-virtual {p2, p3, v0, p4, v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->dotLayout(Landroid/view/View;IIZ)V

    .line 1204
    iget-object p2, p0, Lcom/flyersoft/books/PDFReader;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p3, p2, Lcom/flyersoft/moonreaderp/ActivityTxt;->dot2:Lcom/flyersoft/views/DotImageView;

    aget p4, p5, v1

    sub-int/2addr p4, p1

    aget p1, p5, v2

    invoke-virtual {p2, p3, p4, p1, v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->dotLayout(Landroid/view/View;IIZ)V

    .line 1205
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1, p6}, Lcom/flyersoft/moonreaderp/ActivityTxt;->layoutHBar(Z)V

    :cond_2
    :goto_0
    return-void
.end method

.method public doTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 627
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    if-nez v0, :cond_0

    .line 628
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-object v0, p0, Lcom/flyersoft/books/PDFReader;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    .line 629
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_3

    .line 630
    iput-boolean v2, p0, Lcom/flyersoft/books/PDFReader;->pressDown:Z

    .line 631
    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->isDrawState()Z

    move-result v0

    if-nez v0, :cond_1

    .line 632
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    iput v3, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pressDownX:F

    .line 633
    iput-boolean v1, p0, Lcom/flyersoft/books/PDFReader;->releaseFromMultiTouch:Z

    .line 634
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isTouchInEdge(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 635
    iput-boolean v2, p0, Lcom/flyersoft/books/PDFReader;->touchDisabled:Z

    .line 637
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    const/16 v3, 0x64

    if-eqz v0, :cond_2

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iget v0, v0, Lcom/radaee/reader/GLView;->m_status:I

    if-ne v0, v3, :cond_2

    .line 638
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->hidePop(Z)Z

    .line 639
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    if-eqz v0, :cond_4

    iget v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    if-ne v0, v3, :cond_4

    .line 640
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->hidePop(Z)Z

    goto :goto_0

    .line 641
    :cond_3
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->pressDown:Z

    if-nez v0, :cond_4

    return v2

    .line 644
    :cond_4
    :goto_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-ne v0, v2, :cond_5

    .line 645
    iput-boolean v1, p0, Lcom/flyersoft/books/PDFReader;->pressDown:Z

    .line 647
    :cond_5
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->touchDisabled:Z

    const/4 v3, 0x2

    if-nez v0, :cond_13

    .line 649
    :try_start_0
    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->isDrawState()Z

    move-result v0

    if-nez v0, :cond_6

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    if-le v0, v2, :cond_6

    const/4 v0, 0x1

    goto :goto_1

    :cond_6
    const/4 v0, 0x0

    :goto_1
    iput-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isMultiTouch:Z

    .line 650
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/flyersoft/books/PDFReader;->touchX:I

    .line 651
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/flyersoft/books/PDFReader;->touchY:I

    .line 653
    sput-boolean v1, Lcom/flyersoft/tools/A;->pdfHighlightFromDot:Z

    .line 654
    sget-boolean v0, Lcom/radaee/pdf/Global;->textReflow:Z

    if-nez v0, :cond_d

    sget-boolean v0, Lcom/flyersoft/tools/A;->isInAutoScroll:Z

    if-nez v0, :cond_d

    sget-boolean v0, Lcom/flyersoft/tools/A;->isSpeaking:Z

    if-nez v0, :cond_d

    .line 655
    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->getStatus()I

    move-result v0

    if-ne v0, v3, :cond_9

    .line 656
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_7

    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->dotVisible()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 657
    invoke-virtual {p0, v2}, Lcom/flyersoft/books/PDFReader;->delForceSel(Z)V

    .line 658
    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->doInvalidate2()V

    .line 659
    iput-boolean v1, p0, Lcom/flyersoft/books/PDFReader;->pressDown:Z

    goto :goto_2

    .line 660
    :cond_7
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-ne v0, v2, :cond_8

    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->dotVisible()Z

    move-result v0

    if-nez v0, :cond_8

    .line 661
    invoke-virtual {p0, v2}, Lcom/flyersoft/books/PDFReader;->delForceSel(Z)V

    .line 662
    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->doInvalidate2()V

    goto :goto_2

    .line 663
    :cond_8
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-ne v0, v3, :cond_d

    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->dotVisible()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 664
    invoke-direct {p0, p1}, Lcom/flyersoft/books/PDFReader;->doSelectMoveEvent(Landroid/view/MotionEvent;)V

    goto :goto_2

    .line 666
    :cond_9
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v0, :cond_a

    .line 667
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->cbzView:Lorg/comic/CLayoutView;

    invoke-virtual {v0, p1}, Lorg/comic/CLayoutView;->doTouchEvent(Landroid/view/MotionEvent;)Z

    goto :goto_2

    .line 668
    :cond_a
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isDjvu:Z

    if-eqz v0, :cond_b

    .line 669
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    invoke-virtual {v0, p1}, Lorg/djvu/DLayoutView;->doTouchEvent(Landroid/view/MotionEvent;)Z

    goto :goto_2

    .line 671
    :cond_b
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-eqz v0, :cond_c

    .line 672
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0, p1}, Lcom/radaee/reader/GLView;->doTouchEvent(Landroid/view/MotionEvent;)Z

    goto :goto_2

    .line 674
    :cond_c
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {v0, p1}, Lcom/radaee/reader/PDFLayoutView;->doTouchEvent(Landroid/view/MotionEvent;)Z

    .line 678
    :cond_d
    :goto_2
    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->isDrawState()Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-ne v0, v2, :cond_e

    .line 679
    invoke-direct {p0, p1}, Lcom/flyersoft/books/PDFReader;->pdfFinishAddAnnot(Landroid/view/MotionEvent;)V

    .line 681
    :cond_e
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isMultiTouch:Z

    if-eqz v0, :cond_f

    .line 682
    iput-boolean v2, p0, Lcom/flyersoft/books/PDFReader;->releaseFromMultiTouch:Z

    .line 683
    :cond_f
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_13

    const/4 v0, 0x0

    .line 684
    iput-object v0, p0, Lcom/flyersoft/books/PDFReader;->selectedText:Ljava/lang/String;

    .line 685
    iget-boolean v4, p0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v4, :cond_10

    goto :goto_3

    .line 686
    :cond_10
    iget-boolean v4, p0, Lcom/flyersoft/books/PDFReader;->isDjvu:Z

    if-eqz v4, :cond_11

    .line 687
    iget-object v4, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    iput-object v0, v4, Lorg/djvu/DLayoutView;->ttsPara:Landroid/graphics/RectF;

    goto :goto_3

    .line 689
    :cond_11
    iget-boolean v4, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-eqz v4, :cond_12

    .line 690
    iget-object v4, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v4, v4, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iput-object v0, v4, Lcom/radaee/reader/GLView;->ttsPara:Landroid/graphics/RectF;

    goto :goto_3

    .line 692
    :cond_12
    iget-object v4, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iput-object v0, v4, Lcom/radaee/reader/PDFLayoutView;->ttsPara:Landroid/graphics/RectF;

    .line 694
    :goto_3
    iput-boolean v1, p0, Lcom/flyersoft/books/PDFReader;->releaseFromMultiTouch:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_4

    :catch_0
    move-exception p1

    .line 697
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return v2

    .line 702
    :cond_13
    :goto_4
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v0, :cond_14

    goto :goto_5

    .line 704
    :cond_14
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isDjvu:Z

    if-eqz v0, :cond_15

    .line 705
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    iget v0, v0, Lorg/djvu/DLayoutView;->m_status:I

    if-eqz v0, :cond_17

    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    iget v0, v0, Lorg/djvu/DLayoutView;->m_status:I

    if-ne v0, v3, :cond_19

    goto :goto_5

    .line 707
    :cond_15
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-eqz v0, :cond_16

    .line 708
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iget-boolean v0, v0, Lcom/radaee/reader/GLView;->tapDownForAnnot:Z

    if-nez v0, :cond_19

    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iget v0, v0, Lcom/radaee/reader/GLView;->m_status:I

    if-eqz v0, :cond_17

    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iget v0, v0, Lcom/radaee/reader/GLView;->m_status:I

    if-ne v0, v3, :cond_19

    goto :goto_5

    .line 710
    :cond_16
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iget-boolean v0, v0, Lcom/radaee/reader/PDFLayoutView;->tapDownForAnnot:Z

    if-nez v0, :cond_19

    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iget v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    if-eqz v0, :cond_17

    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iget v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    if-ne v0, v3, :cond_19

    .line 714
    :cond_17
    :goto_5
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->releaseFromMultiTouch:Z

    if-eqz v0, :cond_18

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-ne v0, v2, :cond_18

    .line 715
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfShowFullStatusBarInfoHandler()V

    .line 716
    :cond_18
    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->isDrawState()Z

    move-result v0

    if-nez v0, :cond_1a

    .line 717
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0, p0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    goto :goto_6

    .line 719
    :cond_19
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-boolean v1, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->longTimeTapEvent:Z

    .line 721
    :cond_1a
    :goto_6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    if-ne p1, v2, :cond_1c

    .line 722
    iput-boolean v1, p0, Lcom/flyersoft/books/PDFReader;->touchDisabled:Z

    .line 723
    iget-boolean p1, p0, Lcom/flyersoft/books/PDFReader;->isPdf:Z

    if-eqz p1, :cond_1c

    .line 724
    iget-boolean p1, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-eqz p1, :cond_1b

    .line 725
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object p1, p1, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iput-boolean v1, p1, Lcom/radaee/reader/GLView;->tapDownForAnnot:Z

    .line 726
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object p1, p1, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iput-boolean v1, p1, Lcom/radaee/reader/GLView;->disableAnnotCheck:Z

    goto :goto_7

    .line 728
    :cond_1b
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iput-boolean v1, p1, Lcom/radaee/reader/PDFLayoutView;->tapDownForAnnot:Z

    .line 729
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iput-boolean v1, p1, Lcom/radaee/reader/PDFLayoutView;->disableAnnotCheck:Z

    :cond_1c
    :goto_7
    return v2
.end method

.method public forcePageChangeForTts(Z)V
    .locals 2

    .line 549
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v0, :cond_0

    goto/16 :goto_0

    .line 550
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isDjvu:Z

    if-eqz v0, :cond_2

    if-eqz p1, :cond_1

    .line 551
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    iget v0, v0, Lorg/djvu/DLayoutView;->m_pageno:I

    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->getPageCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_1

    .line 552
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    iget v1, v0, Lorg/djvu/DLayoutView;->m_pageno:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lorg/djvu/DLayoutView;->m_pageno:I

    :cond_1
    if-nez p1, :cond_6

    .line 553
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    iget p1, p1, Lorg/djvu/DLayoutView;->m_pageno:I

    if-lez p1, :cond_6

    .line 554
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    iget v0, p1, Lorg/djvu/DLayoutView;->m_pageno:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p1, Lorg/djvu/DLayoutView;->m_pageno:I

    return-void

    .line 556
    :cond_2
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    if-eqz v0, :cond_4

    if-eqz p1, :cond_3

    .line 557
    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iget v0, v0, Lcom/radaee/reader/GLView;->m_cur_pageno:I

    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->getPageCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_3

    .line 558
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iget v1, v0, Lcom/radaee/reader/GLView;->m_cur_pageno:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lcom/radaee/reader/GLView;->m_cur_pageno:I

    :cond_3
    if-nez p1, :cond_4

    .line 559
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iget v0, v0, Lcom/radaee/reader/GLView;->m_cur_pageno:I

    if-lez v0, :cond_4

    .line 560
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iget v1, v0, Lcom/radaee/reader/GLView;->m_cur_pageno:I

    add-int/lit8 v1, v1, -0x1

    iput v1, v0, Lcom/radaee/reader/GLView;->m_cur_pageno:I

    .line 562
    :cond_4
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-nez v0, :cond_6

    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    if-eqz v0, :cond_6

    if-eqz p1, :cond_5

    .line 563
    iget v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_pageno:I

    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->getPageCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_5

    .line 564
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iget v1, v0, Lcom/radaee/reader/PDFLayoutView;->m_pageno:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lcom/radaee/reader/PDFLayoutView;->m_pageno:I

    :cond_5
    if-nez p1, :cond_6

    .line 565
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iget p1, p1, Lcom/radaee/reader/PDFLayoutView;->m_pageno:I

    if-lez p1, :cond_6

    .line 566
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iget v0, p1, Lcom/radaee/reader/PDFLayoutView;->m_pageno:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p1, Lcom/radaee/reader/PDFLayoutView;->m_pageno:I

    :cond_6
    :goto_0
    return-void
.end method

.method public getCIndexAtPoint(FF)I
    .locals 2

    const/4 v0, -0x1

    .line 427
    :try_start_0
    iget-boolean v1, p0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v1, :cond_0

    return v0

    .line 429
    :cond_0
    iget-boolean v1, p0, Lcom/flyersoft/books/PDFReader;->isDjvu:Z

    if-eqz v1, :cond_1

    .line 430
    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/books/PDFReader;->djvuGetCIndexAtPoint(FF)Lorg/djvu/DLayout$DjvuPos;

    move-result-object p1

    iget p1, p1, Lorg/djvu/DLayout$DjvuPos;->cindex:I

    return p1

    .line 432
    :cond_1
    iget-boolean v1, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-eqz v1, :cond_2

    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/books/PDFReader;->pdfGlGetCIndexAtPoint(FF)Lcom/radaee/view/GLLayout$PDFPos;

    move-result-object p1

    iget p1, p1, Lcom/radaee/view/GLLayout$PDFPos;->cindex:I

    return p1

    :cond_2
    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/books/PDFReader;->pdfGetCIndexAtPoint(FF)Lcom/radaee/view/PDFLayout$PDFPos;

    move-result-object p1

    iget p1, p1, Lcom/radaee/view/PDFLayout$PDFPos;->cindex:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception p1

    .line 435
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return v0
.end method

.method public getCurPageNo()I
    .locals 1

    .line 539
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v0, :cond_0

    .line 540
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->cbzView:Lorg/comic/CLayoutView;

    invoke-virtual {v0}, Lorg/comic/CLayoutView;->GetCurrPage()I

    move-result v0

    return v0

    .line 541
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isDjvu:Z

    if-eqz v0, :cond_1

    .line 542
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    invoke-virtual {v0}, Lorg/djvu/DLayoutView;->DjvuGetCurrPage()I

    move-result v0

    return v0

    .line 544
    :cond_1
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->PDFGetCurrPage()I

    move-result v0

    return v0

    :cond_2
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {v0}, Lcom/radaee/reader/PDFLayoutView;->PDFGetCurrPage()I

    move-result v0

    return v0
.end method

.method public getMeta(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1287
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isPdf:Z

    const-string v1, ""

    if-eqz v0, :cond_3

    .line 1288
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    if-eqz v0, :cond_3

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v0, p1}, Lcom/radaee/pdf/Document;->GetMeta(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    .line 1289
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    if-eqz v0, :cond_3

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    if-nez v0, :cond_2

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v0, p1}, Lcom/radaee/pdf/Document;->GetMeta(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_3
    :goto_0
    move-object p1, v1

    :goto_1
    if-eqz p1, :cond_4

    return-object p1

    :cond_4
    return-object v1
.end method

.method public getPageCharCount()[Ljava/lang/Integer;
    .locals 2

    .line 1591
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->page_chars:[Ljava/lang/Integer;

    if-eqz v0, :cond_0

    array-length v0, v0

    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->getPageCount()I

    move-result v1

    if-eq v0, v1, :cond_1

    .line 1592
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->getPageCount()I

    move-result v0

    new-array v0, v0, [Ljava/lang/Integer;

    iput-object v0, p0, Lcom/flyersoft/books/PDFReader;->page_chars:[Ljava/lang/Integer;

    .line 1593
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->page_chars:[Ljava/lang/Integer;

    return-object v0
.end method

.method public getPageCount()I
    .locals 1

    .line 572
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v0, :cond_0

    .line 573
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->cbzView:Lorg/comic/CLayoutView;

    iget-object v0, v0, Lorg/comic/CLayoutView;->m_doc:Lorg/comic/CDocument;

    invoke-virtual {v0}, Lorg/comic/CDocument;->GetPageCount()I

    move-result v0

    return v0

    .line 574
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isDjvu:Z

    if-eqz v0, :cond_1

    .line 575
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    iget-object v0, v0, Lorg/djvu/DLayoutView;->m_doc:Lorg/djvu/DDocument;

    invoke-virtual {v0}, Lorg/djvu/DDocument;->GetPageCount()I

    move-result v0

    return v0

    .line 577
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->pdfGetDoc()Lcom/radaee/pdf/Document;

    move-result-object v0

    invoke-virtual {v0}, Lcom/radaee/pdf/Document;->GetPageCount()I

    move-result v0

    return v0
.end method

.method public getPageHeight(I)F
    .locals 1

    .line 592
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v0, :cond_0

    .line 593
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->cbzView:Lorg/comic/CLayoutView;

    iget-object v0, v0, Lorg/comic/CLayoutView;->m_doc:Lorg/comic/CDocument;

    invoke-virtual {v0, p1}, Lorg/comic/CDocument;->GetPageHeight(I)I

    move-result p1

    int-to-float p1, p1

    return p1

    .line 594
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isDjvu:Z

    if-eqz v0, :cond_1

    .line 595
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    iget-object v0, v0, Lorg/djvu/DLayoutView;->m_doc:Lorg/djvu/DDocument;

    invoke-virtual {v0, p1}, Lorg/djvu/DDocument;->GetPageHeight(I)I

    move-result p1

    int-to-float p1, p1

    return p1

    .line 597
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->pdfGetDoc()Lcom/radaee/pdf/Document;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result p1

    return p1
.end method

.method public getPageText(I)Ljava/lang/String;
    .locals 3

    .line 1304
    const-string v0, ""

    :try_start_0
    iget-boolean v1, p0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v1, :cond_0

    return-object v0

    .line 1306
    :cond_0
    iget-boolean v1, p0, Lcom/flyersoft/books/PDFReader;->isDjvu:Z

    if-eqz v1, :cond_1

    .line 1307
    iget-object v1, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    iget-object v1, v1, Lorg/djvu/DLayoutView;->m_doc:Lorg/djvu/DDocument;

    invoke-virtual {v1, p1}, Lorg/djvu/DDocument;->GetPage(I)Lorg/djvu/DPage;

    move-result-object p1

    invoke-virtual {p1}, Lorg/djvu/DPage;->ObjsGetText()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 1309
    :cond_1
    invoke-virtual {p0, p1}, Lcom/flyersoft/books/PDFReader;->pdfGetPage(I)Lcom/radaee/pdf/Page;

    move-result-object p1

    if-nez p1, :cond_2

    return-object v0

    .line 1312
    :cond_2
    invoke-virtual {p1}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 1313
    invoke-virtual {p1}, Lcom/radaee/pdf/Page;->ObjsGetCharCount()I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v1}, Lcom/radaee/pdf/Page;->ObjsGetString(II)Ljava/lang/String;

    move-result-object v1

    .line 1314
    invoke-virtual {p1}, Lcom/radaee/pdf/Page;->Close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v1, :cond_3

    return-object v0

    :cond_3
    return-object v1

    :catch_0
    move-exception p1

    .line 1318
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-object v0
.end method

.method public getPageWidth(I)F
    .locals 1

    .line 582
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v0, :cond_0

    .line 583
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->cbzView:Lorg/comic/CLayoutView;

    iget-object v0, v0, Lorg/comic/CLayoutView;->m_doc:Lorg/comic/CDocument;

    invoke-virtual {v0, p1}, Lorg/comic/CDocument;->GetPageWidth(I)I

    move-result p1

    int-to-float p1, p1

    return p1

    .line 584
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isDjvu:Z

    if-eqz v0, :cond_1

    .line 585
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    iget-object v0, v0, Lorg/djvu/DLayoutView;->m_doc:Lorg/djvu/DDocument;

    invoke-virtual {v0, p1}, Lorg/djvu/DDocument;->GetPageWidth(I)I

    move-result p1

    int-to-float p1, p1

    return p1

    .line 587
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->pdfGetDoc()Lcom/radaee/pdf/Document;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result p1

    return p1
.end method

.method public getPageWordCount()[Ljava/lang/Integer;
    .locals 2

    .line 1584
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->page_words:[Ljava/lang/Integer;

    if-eqz v0, :cond_0

    array-length v0, v0

    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->getPageCount()I

    move-result v1

    if-eq v0, v1, :cond_1

    .line 1585
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->getPageCount()I

    move-result v0

    new-array v0, v0, [Ljava/lang/Integer;

    iput-object v0, p0, Lcom/flyersoft/books/PDFReader;->page_words:[Ljava/lang/Integer;

    .line 1586
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->page_words:[Ljava/lang/Integer;

    return-object v0
.end method

.method public getScale()F
    .locals 1

    .line 191
    :try_start_0
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v0, :cond_0

    .line 192
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->cbzView:Lorg/comic/CLayoutView;

    invoke-virtual {v0}, Lorg/comic/CLayoutView;->GetScale()F

    move-result v0

    return v0

    .line 193
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isDjvu:Z

    if-eqz v0, :cond_1

    .line 194
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    invoke-virtual {v0}, Lorg/djvu/DLayoutView;->DjvuGetScale()F

    move-result v0

    return v0

    .line 196
    :cond_1
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->PDFGetScale()F

    move-result v0

    return v0

    :cond_2
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {v0}, Lcom/radaee/reader/PDFLayoutView;->PDFGetScale()F

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    const/high16 v0, 0x3f800000    # 1.0f

    return v0
.end method

.method public getScroller()Landroid/widget/Scroller;
    .locals 1

    .line 374
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v0, :cond_0

    .line 375
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->cbzView:Lorg/comic/CLayoutView;

    iget-object v0, v0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    iget-object v0, v0, Lorg/comic/CLayout;->m_scroller:Landroid/widget/Scroller;

    return-object v0

    .line 376
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isDjvu:Z

    if-eqz v0, :cond_1

    .line 377
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    iget-object v0, v0, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    iget-object v0, v0, Lorg/djvu/DLayout;->m_scroller:Landroid/widget/Scroller;

    return-object v0

    .line 379
    :cond_1
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v0, v0, Lcom/radaee/view/GLLayout;->m_scroller:Landroid/widget/Scroller;

    return-object v0

    :cond_2
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget-object v0, v0, Lcom/radaee/view/PDFLayout;->m_scroller:Landroid/widget/Scroller;

    return-object v0
.end method

.method public getStatus()I
    .locals 1

    .line 602
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v0, :cond_0

    .line 603
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->cbzView:Lorg/comic/CLayoutView;

    iget v0, v0, Lorg/comic/CLayoutView;->m_status:I

    return v0

    .line 604
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isDjvu:Z

    if-eqz v0, :cond_1

    .line 605
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    iget v0, v0, Lorg/djvu/DLayoutView;->m_status:I

    return v0

    .line 607
    :cond_1
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iget v0, v0, Lcom/radaee/reader/GLView;->m_status:I

    return v0

    :cond_2
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iget v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    return v0
.end method

.method public getTtsPara()Landroid/graphics/RectF;
    .locals 1

    .line 364
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 366
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isDjvu:Z

    if-eqz v0, :cond_1

    .line 367
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    iget-object v0, v0, Lorg/djvu/DLayoutView;->ttsPara:Landroid/graphics/RectF;

    return-object v0

    .line 369
    :cond_1
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->ttsPara:Landroid/graphics/RectF;

    return-object v0

    :cond_2
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView;->ttsPara:Landroid/graphics/RectF;

    return-object v0
.end method

.method public getXPos(II)Lcom/flyersoft/books/PDFReader$XPos;
    .locals 2

    .line 218
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v0, :cond_0

    .line 219
    new-instance v0, Lcom/flyersoft/books/PDFReader$XPos;

    iget-object v1, p0, Lcom/flyersoft/books/PDFReader;->cbzView:Lorg/comic/CLayoutView;

    invoke-virtual {v1, p1, p2}, Lorg/comic/CLayoutView;->GetPos(II)Lorg/comic/CLayout$Pos;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/flyersoft/books/PDFReader$XPos;-><init>(Lorg/comic/CLayout$Pos;)V

    return-object v0

    .line 220
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isDjvu:Z

    if-eqz v0, :cond_1

    .line 221
    new-instance v0, Lcom/flyersoft/books/PDFReader$XPos;

    iget-object v1, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    invoke-virtual {v1, p1, p2}, Lorg/djvu/DLayoutView;->DjvuGetPos(II)Lorg/djvu/DLayout$DjvuPos;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/flyersoft/books/PDFReader$XPos;-><init>(Lorg/djvu/DLayout$DjvuPos;)V

    return-object v0

    .line 223
    :cond_1
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-eqz v0, :cond_2

    new-instance v0, Lcom/flyersoft/books/PDFReader$XPos;

    iget-object v1, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    invoke-virtual {v1, p1, p2}, Lcom/radaee/reader/PDFGLLayoutView;->PDFGetPos(II)Lcom/radaee/view/GLLayout$PDFPos;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/flyersoft/books/PDFReader$XPos;-><init>(Lcom/radaee/view/GLLayout$PDFPos;)V

    return-object v0

    :cond_2
    new-instance v0, Lcom/flyersoft/books/PDFReader$XPos;

    iget-object v1, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {v1, p1, p2}, Lcom/radaee/reader/PDFLayoutView;->PDFGetPos(II)Lcom/radaee/view/PDFLayout$PDFPos;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/flyersoft/books/PDFReader$XPos;-><init>(Lcom/radaee/view/PDFLayout$PDFPos;)V

    return-object v0
.end method

.method public getZoom()F
    .locals 1

    .line 205
    :try_start_0
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v0, :cond_0

    .line 206
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->cbzView:Lorg/comic/CLayoutView;

    invoke-virtual {v0}, Lorg/comic/CLayoutView;->GetZoom()F

    move-result v0

    return v0

    .line 207
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isDjvu:Z

    if-eqz v0, :cond_1

    .line 208
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    invoke-virtual {v0}, Lorg/djvu/DLayoutView;->GetZoom()F

    move-result v0

    return v0

    .line 210
    :cond_1
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->PDFGetZoom()F

    move-result v0

    return v0

    :cond_2
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {v0}, Lcom/radaee/reader/PDFLayoutView;->PDFGetZoom()F

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    const/high16 v0, 0x3f800000    # 1.0f

    return v0
.end method

.method public get_bg_color()I
    .locals 2

    .line 1563
    sget v0, Lcom/radaee/pdf/Global;->pdf_theme:I

    if-nez v0, :cond_1

    .line 1564
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v0, :cond_0

    sget v0, Lcom/flyersoft/tools/A;->cbz_back_color:I

    return v0

    :cond_0
    sget v0, Lcom/flyersoft/tools/A;->pdf_back_color:I

    return v0

    .line 1565
    :cond_1
    sget v0, Lcom/radaee/pdf/Global;->pdf_theme:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_2

    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isPdf:Z

    if-nez v0, :cond_2

    const/high16 v0, -0x1000000

    return v0

    :cond_2
    const/4 v0, -0x1

    return v0
.end method

.method public gotoPage(I)V
    .locals 1

    .line 254
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v0, :cond_0

    .line 255
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->cbzView:Lorg/comic/CLayoutView;

    invoke-virtual {v0, p1}, Lorg/comic/CLayoutView;->GotoPage(I)V

    return-void

    .line 256
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isDjvu:Z

    if-eqz v0, :cond_1

    .line 257
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    invoke-virtual {v0, p1}, Lorg/djvu/DLayoutView;->DjvuGotoPage(I)V

    return-void

    .line 259
    :cond_1
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-eqz v0, :cond_2

    .line 260
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    invoke-virtual {v0, p1}, Lcom/radaee/reader/PDFGLLayoutView;->PDFGotoPage(I)V

    return-void

    .line 262
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {v0, p1}, Lcom/radaee/reader/PDFLayoutView;->PDFGotoPage(I)V

    return-void
.end method

.method public isDrawState()Z
    .locals 3

    .line 862
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isPdf:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 863
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iget v0, v0, Lcom/radaee/reader/GLView;->m_status:I

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iget v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    :goto_0
    const/4 v2, 0x3

    if-eq v0, v2, :cond_3

    const/4 v2, 0x6

    if-eq v0, v2, :cond_3

    const/16 v2, 0x8

    if-eq v0, v2, :cond_3

    const/16 v2, 0xc8

    if-eq v0, v2, :cond_3

    const/4 v2, 0x7

    if-eq v0, v2, :cond_3

    const/16 v2, 0x47

    if-eq v0, v2, :cond_3

    const/4 v2, 0x4

    if-eq v0, v2, :cond_3

    const/4 v2, 0x5

    if-ne v0, v2, :cond_2

    goto :goto_1

    :cond_2
    return v1

    :cond_3
    :goto_1
    const/4 v0, 0x1

    return v0
.end method

.method protected onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1

    .line 1240
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->fromPausedResumeOfLandscape:Z

    if-nez v0, :cond_0

    .line 1241
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isOnPaused:Z

    iput-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->fromPausedResumeOfLandscape:Z

    .line 1242
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 3

    .line 1250
    iget-object p3, p0, Lcom/flyersoft/books/PDFReader;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    if-nez p3, :cond_0

    .line 1251
    sget-object p3, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-object p3, p0, Lcom/flyersoft/books/PDFReader;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    .line 1253
    :cond_0
    sget-boolean p3, Lcom/flyersoft/tools/A;->immersive_fullscreen:Z

    if-eqz p3, :cond_1

    invoke-static {}, Lcom/flyersoft/tools/A;->isLandscape()Z

    move-result p3

    if-eqz p3, :cond_1

    iget-boolean p3, p0, Lcom/flyersoft/books/PDFReader;->isOnPaused:Z

    if-eqz p3, :cond_1

    goto/16 :goto_1

    .line 1256
    :cond_1
    sget-boolean p3, Lcom/flyersoft/tools/A;->immersive_fullscreen:Z

    if-eqz p3, :cond_4

    sget p3, Lcom/radaee/pdf/Global;->def_view:I

    if-nez p3, :cond_4

    invoke-static {}, Lcom/flyersoft/tools/A;->isLandscape()Z

    move-result p3

    if-nez p3, :cond_4

    .line 1257
    iget-boolean p3, p0, Lcom/flyersoft/books/PDFReader;->isOnPaused:Z

    if-eqz p3, :cond_2

    goto/16 :goto_1

    .line 1259
    :cond_2
    iget-object p3, p0, Lcom/flyersoft/books/PDFReader;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    if-eqz p3, :cond_3

    iget-wide p3, p3, Lcom/flyersoft/moonreaderp/ActivityTxt;->pausedTime:J

    const-wide/16 v0, 0x0

    cmp-long v2, p3, v0

    if-lez v2, :cond_3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p3

    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-wide v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->resumeTime:J

    sub-long/2addr p3, v0

    const-wide/16 v0, 0x1f4

    cmp-long v2, p3, v0

    if-gez v2, :cond_3

    goto/16 :goto_1

    .line 1261
    :cond_3
    iget p3, p0, Lcom/flyersoft/books/PDFReader;->maxH:I

    if-lez p3, :cond_4

    if-ne p2, p3, :cond_4

    goto/16 :goto_1

    .line 1264
    :cond_4
    iget p3, p0, Lcom/flyersoft/books/PDFReader;->maxH:I

    if-le p2, p3, :cond_5

    .line 1265
    iput p2, p0, Lcom/flyersoft/books/PDFReader;->maxH:I

    .line 1267
    :cond_5
    iget-boolean p3, p0, Lcom/flyersoft/books/PDFReader;->fromPausedResumeOfLandscape:Z

    if-nez p3, :cond_9

    iget-boolean p3, p0, Lcom/flyersoft/books/PDFReader;->forbid_immersive_mode:Z

    if-nez p3, :cond_9

    .line 1269
    :try_start_0
    iget-boolean p3, p0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz p3, :cond_6

    iget-object p3, p0, Lcom/flyersoft/books/PDFReader;->cbzView:Lorg/comic/CLayoutView;

    if-eqz p3, :cond_6

    iget-object p3, p3, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    if-eqz p3, :cond_6

    .line 1270
    iget-object p3, p0, Lcom/flyersoft/books/PDFReader;->cbzView:Lorg/comic/CLayoutView;

    iget-object p3, p3, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    invoke-virtual {p3, p1, p2}, Lorg/comic/CLayout;->vResize(II)V

    .line 1271
    :cond_6
    iget-boolean p3, p0, Lcom/flyersoft/books/PDFReader;->isDjvu:Z

    if-eqz p3, :cond_7

    iget-object p3, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    if-eqz p3, :cond_7

    iget-object p3, p3, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    if-eqz p3, :cond_7

    .line 1272
    iget-object p3, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    iget-object p3, p3, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    invoke-virtual {p3, p1, p2}, Lorg/djvu/DLayout;->vResize(II)V

    .line 1273
    :cond_7
    iget-boolean p3, p0, Lcom/flyersoft/books/PDFReader;->isPdf:Z

    if-eqz p3, :cond_8

    iget-boolean p3, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-eqz p3, :cond_8

    iget-object p3, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    if-eqz p3, :cond_8

    iget-object p3, p3, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iget-object p3, p3, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    if-eqz p3, :cond_8

    .line 1274
    iget-object p3, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object p3, p3, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iget-object p3, p3, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {p3, p1, p2}, Lcom/radaee/view/GLLayout;->gl_resize(II)V

    .line 1275
    :cond_8
    iget-boolean p3, p0, Lcom/flyersoft/books/PDFReader;->isPdf:Z

    if-eqz p3, :cond_9

    iget-boolean p3, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-nez p3, :cond_9

    iget-object p3, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    if-eqz p3, :cond_9

    iget-object p3, p3, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    if-eqz p3, :cond_9

    .line 1276
    iget-object p3, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iget-object p3, p3, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {p3, p1, p2}, Lcom/radaee/view/PDFLayout;->vResize(II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 1279
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 1281
    :cond_9
    :goto_0
    iget-boolean p1, p0, Lcom/flyersoft/books/PDFReader;->isOnPaused:Z

    if-nez p1, :cond_a

    const/4 p1, 0x0

    .line 1282
    iput-boolean p1, p0, Lcom/flyersoft/books/PDFReader;->fromPausedResumeOfLandscape:Z

    :cond_a
    :goto_1
    return-void
.end method

.method public open(Lcom/flyersoft/moonreaderp/ActivityTxt;Lcom/radaee/pdf/Document;Ljava/lang/String;)V
    .locals 2

    .line 120
    invoke-direct {p0, p1, p3}, Lcom/flyersoft/books/PDFReader;->initView(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/String;)V

    const/4 p1, 0x0

    .line 121
    sput-boolean p1, Lcom/radaee/pdf/Global;->useSelIcons:Z

    .line 122
    iget-boolean p3, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-eqz p3, :cond_0

    .line 123
    iget-object p3, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object p3, p3, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iput-boolean p1, p3, Lcom/radaee/reader/GLView;->scoll_lock:Z

    .line 124
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object p3, p0, Lcom/flyersoft/books/PDFReader;->pdfListener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    sget v0, Lcom/flyersoft/tools/A;->pdf_page_gap:I

    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->get_bg_color()I

    move-result v1

    invoke-virtual {p1, p2, p3, v0, v1}, Lcom/radaee/reader/PDFGLLayoutView;->PDFOpen(Lcom/radaee/pdf/Document;Lcom/radaee/view/ILayoutView$PDFLayoutListener;II)V

    return-void

    .line 126
    :cond_0
    iget-object p3, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iput-boolean p1, p3, Lcom/radaee/reader/PDFLayoutView;->scoll_lock:Z

    .line 127
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iget-object p3, p0, Lcom/flyersoft/books/PDFReader;->pdfListener:Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    sget v0, Lcom/flyersoft/tools/A;->pdf_page_gap:I

    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->get_bg_color()I

    move-result v1

    invoke-virtual {p1, p2, p3, v0, v1}, Lcom/radaee/reader/PDFLayoutView;->PDFOpen(Lcom/radaee/pdf/Document;Lcom/radaee/view/ILayoutView$PDFLayoutListener;II)V

    return-void
.end method

.method public open(Lcom/flyersoft/moonreaderp/ActivityTxt;Lorg/comic/CDocument;Ljava/lang/String;)V
    .locals 1

    .line 105
    invoke-direct {p0, p1, p3}, Lcom/flyersoft/books/PDFReader;->initView(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/String;)V

    .line 106
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->cbzView:Lorg/comic/CLayoutView;

    const/4 p3, 0x0

    iput-boolean p3, p1, Lorg/comic/CLayoutView;->scoll_lock:Z

    .line 107
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->cbzView:Lorg/comic/CLayoutView;

    sget p3, Lcom/radaee/pdf/Global;->def_view:I

    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->cbzListener:Lorg/comic/ICLayoutView$CLayoutListener;

    invoke-virtual {p1, p2, p3, v0}, Lorg/comic/CLayoutView;->Open(Lorg/comic/CDocument;ILorg/comic/ICLayoutView$CLayoutListener;)V

    .line 108
    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->setBackgroundColor()V

    return-void
.end method

.method public open(Lcom/flyersoft/moonreaderp/ActivityTxt;Lorg/djvu/DDocument;Ljava/lang/String;)V
    .locals 1

    .line 112
    invoke-direct {p0, p1, p3}, Lcom/flyersoft/books/PDFReader;->initView(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/String;)V

    .line 113
    iput-object p1, p0, Lcom/flyersoft/books/PDFReader;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    .line 114
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    const/4 p3, 0x0

    iput-boolean p3, p1, Lorg/djvu/DLayoutView;->scoll_lock:Z

    .line 115
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    sget p3, Lcom/radaee/pdf/Global;->def_view:I

    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->djvuListener:Lorg/djvu/IDLayoutView$DjvuLayoutListener;

    invoke-virtual {p1, p2, p3, v0}, Lorg/djvu/DLayoutView;->DjvuOpen(Lorg/djvu/DDocument;ILorg/djvu/IDLayoutView$DjvuLayoutListener;)V

    .line 116
    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->setBackgroundColor()V

    return-void
.end method

.method public pdfAnnotEnd()V
    .locals 3

    .line 940
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isPdf:Z

    if-nez v0, :cond_0

    return-void

    .line 942
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->hideDotViews()Z

    .line 943
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    .line 944
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iput v1, v0, Lcom/radaee/reader/GLView;->m_status:I

    .line 945
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iput-object v2, v0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    .line 946
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iput-object v2, v0, Lcom/radaee/reader/GLView;->m_annot_pos:Lcom/radaee/view/GLLayout$PDFPos;

    .line 947
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iput-object v2, v0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    .line 948
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->doPostInvalidate()V

    goto :goto_0

    .line 950
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iput v1, v0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    .line 951
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iput-object v2, v0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    .line 952
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iput-object v2, v0, Lcom/radaee/reader/PDFLayoutView;->m_annot_pos:Lcom/radaee/view/PDFLayout$PDFPos;

    .line 953
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iput-object v2, v0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    .line 955
    :goto_0
    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->postInvalidate()V

    return-void
.end method

.method public pdfAnnotGetText()Ljava/lang/String;
    .locals 1

    .line 924
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    if-eqz v0, :cond_0

    .line 925
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v0}, Lcom/radaee/pdf/Page$Annotation;->GetPopupText()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 926
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    if-eqz v0, :cond_1

    .line 927
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v0}, Lcom/radaee/pdf/Page$Annotation;->GetPopupText()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public pdfAnnotRemove()V
    .locals 1

    .line 916
    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->pdfSelectedAnnot()Lcom/radaee/pdf/Page$Annotation;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/flyersoft/books/PDFReader;->pdfRemoveNoteFromAnnot(Lcom/radaee/pdf/Page$Annotation;)V

    .line 917
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-eqz v0, :cond_0

    .line 918
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    invoke-virtual {v0}, Lcom/radaee/reader/PDFGLLayoutView;->PDFRemoveAnnot()V

    return-void

    .line 920
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {v0}, Lcom/radaee/reader/PDFLayoutView;->PDFRemoveAnnot()V

    return-void
.end method

.method public pdfAnnotSetMarkup(I)Z
    .locals 1

    .line 910
    invoke-direct {p0}, Lcom/flyersoft/books/PDFReader;->updateGlobalHighlightColors()V

    .line 912
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    invoke-virtual {v0, p1}, Lcom/radaee/reader/PDFGLLayoutView;->PDFSetSelMarkup(I)Z

    move-result p1

    return p1

    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {v0, p1}, Lcom/radaee/reader/PDFLayoutView;->PDFSetSelMarkup(I)Z

    move-result p1

    return p1
.end method

.method public pdfAnnotSetText(Ljava/lang/String;)V
    .locals 1

    .line 932
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    if-eqz v0, :cond_0

    .line 933
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v0, p1}, Lcom/radaee/pdf/Page$Annotation;->SetPopupText(Ljava/lang/String;)Z

    .line 934
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    if-eqz v0, :cond_1

    .line 935
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v0, p1}, Lcom/radaee/pdf/Page$Annotation;->SetPopupText(Ljava/lang/String;)Z

    .line 936
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->pdfAnnotEnd()V

    return-void
.end method

.method public pdfCloseAnnotList(Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/books/PDFReader$PdfAnnotItem;",
            ">;)V"
        }
    .end annotation

    .line 1811
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 1813
    :cond_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/books/PDFReader$PdfAnnotItem;

    .line 1814
    iget-object v1, v1, Lcom/flyersoft/books/PDFReader$PdfAnnotItem;->annot:Lcom/radaee/pdf/Page$Annotation;

    iget-object v1, v1, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    invoke-virtual {v1}, Lcom/radaee/pdf/Page;->Close()V

    goto :goto_0

    .line 1815
    :cond_1
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    return-void
.end method

.method public pdfCreateNotesFromText(Ljava/lang/String;Z)Z
    .locals 45

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    .line 1409
    const-string v2, "#A6#"

    const-string v3, "#A5#"

    const-string v4, "#A4#"

    const-string v5, "#A3#"

    const-string v6, ""

    const-string v7, "#A2#"

    const-string v8, "#A1#"

    const-string v9, "#A8#"

    const-string v10, "#A7#"

    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    iput-object v11, v1, Lcom/flyersoft/books/PDFReader;->remotePdfNotes:Ljava/util/ArrayList;

    const/4 v11, 0x0

    const/4 v12, 0x0

    .line 1414
    :goto_0
    :try_start_0
    const-string v13, "#A*#"

    invoke-virtual {v0, v13, v12}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v13

    if-nez v12, :cond_0

    .line 1416
    invoke-virtual {v0, v11, v13}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result v12

    .line 1417
    invoke-virtual {v1}, Lcom/flyersoft/books/PDFReader;->getPageCount()I

    move-result v14

    if-eq v12, v14, :cond_0

    return v11

    :cond_0
    add-int/lit8 v12, v13, 0xa

    const/4 v14, -0x1

    if-ne v13, v14, :cond_1

    const/16 v26, 0x0

    goto/16 :goto_3

    :cond_1
    add-int/lit8 v14, v13, 0x4

    .line 1424
    invoke-virtual {v0, v8, v13}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v15

    invoke-virtual {v0, v14, v15}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v16

    .line 1425
    invoke-virtual {v0, v8, v13}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v14

    add-int/lit8 v14, v14, 0x4

    invoke-virtual {v0, v7, v13}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v15

    invoke-virtual {v0, v14, v15}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Long;->longValue()J

    move-result-wide v17

    .line 1426
    invoke-virtual {v0, v7, v13}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v14

    add-int/lit8 v14, v14, 0x4

    invoke-virtual {v0, v5, v13}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v15

    invoke-virtual {v0, v14, v15}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v19

    .line 1427
    invoke-virtual {v0, v5, v13}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v14

    add-int/lit8 v14, v14, 0x4

    invoke-virtual {v0, v4, v13}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v15

    invoke-virtual {v0, v14, v15}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v20

    .line 1428
    invoke-virtual {v0, v4, v13}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v14

    add-int/lit8 v14, v14, 0x4

    invoke-virtual {v0, v3, v13}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v15

    invoke-virtual {v0, v14, v15}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v21

    .line 1429
    invoke-virtual {v0, v3, v13}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v14

    add-int/lit8 v14, v14, 0x4

    invoke-virtual {v0, v2, v13}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v15

    invoke-virtual {v0, v14, v15}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v22

    .line 1430
    invoke-virtual {v0, v2, v13}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v14

    add-int/lit8 v14, v14, 0x4

    invoke-virtual {v0, v10, v13}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v15

    invoke-virtual {v0, v14, v15}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v23

    .line 1433
    invoke-virtual {v0, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v14
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    const-string v15, "#A@#"

    if-eqz v14, :cond_2

    .line 1434
    :try_start_1
    invoke-virtual {v0, v10, v13}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v14
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    add-int/lit8 v14, v14, 0x4

    const/16 v26, 0x0

    :try_start_2
    invoke-virtual {v0, v9, v13}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v11

    invoke-virtual {v0, v14, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v11

    .line 1435
    invoke-virtual {v0, v9, v13}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v14

    add-int/lit8 v14, v14, 0x4

    invoke-virtual {v0, v15, v13}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v13

    invoke-virtual {v0, v14, v13}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v13

    move-object/from16 v25, v13

    goto :goto_1

    :cond_2
    const/16 v26, 0x0

    .line 1437
    invoke-virtual {v0, v10, v13}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v11

    add-int/lit8 v11, v11, 0x4

    invoke-virtual {v0, v15, v13}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v13

    invoke-virtual {v0, v11, v13}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v11

    move-object/from16 v25, v6

    :goto_1
    move-object/from16 v24, v11

    .line 1438
    new-instance v15, Lcom/flyersoft/books/PDFReader$PDFNote;

    invoke-direct/range {v15 .. v25}, Lcom/flyersoft/books/PDFReader$PDFNote;-><init>(IJIIIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1439
    iget-object v11, v1, Lcom/flyersoft/books/PDFReader;->remotePdfNotes:Ljava/util/ArrayList;

    invoke-virtual {v11, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    const/4 v11, 0x0

    goto/16 :goto_0

    :catch_0
    move-exception v0

    goto :goto_2

    :catch_1
    move-exception v0

    const/16 v26, 0x0

    .line 1441
    :goto_2
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 1445
    :goto_3
    iget-object v0, v1, Lcom/flyersoft/books/PDFReader;->remotePdfNotes:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_3

    return v26

    :cond_3
    const/4 v0, 0x1

    .line 1447
    invoke-static {v0}, Lcom/flyersoft/tools/A;->getBookmarks(Z)Ljava/util/ArrayList;

    .line 1448
    invoke-static {v0}, Lcom/flyersoft/tools/A;->checkNotesHighlights(Z)V

    .line 1449
    iget-object v2, v1, Lcom/flyersoft/books/PDFReader;->remotePdfNotes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    sub-int/2addr v2, v0

    const/4 v3, 0x0

    :goto_4
    if-ltz v2, :cond_c

    .line 1450
    iget-object v4, v1, Lcom/flyersoft/books/PDFReader;->remotePdfNotes:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/books/PDFReader$PDFNote;

    .line 1452
    iget-object v5, v4, Lcom/flyersoft/books/PDFReader$PDFNote;->bookmark:Ljava/lang/String;

    invoke-static {v5}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_6

    .line 1453
    invoke-static {}, Lcom/flyersoft/tools/A;->getBookmarks()Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_4
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_5

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/flyersoft/tools/A$Bookmark;

    .line 1454
    iget-wide v7, v7, Lcom/flyersoft/tools/A$Bookmark;->position:J

    iget v9, v4, Lcom/flyersoft/books/PDFReader$PDFNote;->page:I

    int-to-long v9, v9

    cmp-long v11, v7, v9

    if-nez v11, :cond_4

    goto :goto_5

    .line 1459
    :cond_5
    new-instance v12, Lcom/flyersoft/tools/A$Bookmark;

    sget-object v13, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    iget-object v14, v4, Lcom/flyersoft/books/PDFReader$PDFNote;->bookmark:Ljava/lang/String;

    iget v5, v4, Lcom/flyersoft/books/PDFReader$PDFNote;->page:I

    int-to-long v7, v5

    iget-wide v9, v4, Lcom/flyersoft/books/PDFReader$PDFNote;->timeStamp:J

    iget v5, v4, Lcom/flyersoft/books/PDFReader$PDFNote;->color:I

    const/4 v15, 0x0

    const/16 v16, 0x0

    move/from16 v21, v5

    move-wide/from16 v17, v7

    move-wide/from16 v19, v9

    invoke-direct/range {v12 .. v21}, Lcom/flyersoft/tools/A$Bookmark;-><init>(Ljava/lang/String;Ljava/lang/String;IIJJI)V

    .line 1461
    invoke-static {}, Lcom/flyersoft/tools/A;->getBookmarks()Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1462
    invoke-static {v12}, Lcom/flyersoft/tools/BookDb;->addBookmark(Lcom/flyersoft/tools/A$Bookmark;)V

    .line 1464
    :goto_5
    iget-object v5, v1, Lcom/flyersoft/books/PDFReader;->remotePdfNotes:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto/16 :goto_9

    .line 1466
    :cond_6
    sget-object v5, Lcom/flyersoft/tools/A;->highlights:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_7
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_8

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/flyersoft/tools/BookDb$NoteInfo;

    .line 1467
    iget-wide v8, v7, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J

    iget v10, v4, Lcom/flyersoft/books/PDFReader$PDFNote;->page:I

    int-to-long v10, v10

    cmp-long v12, v8, v10

    if-nez v12, :cond_7

    iget v7, v7, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastChapter:I

    iget v8, v4, Lcom/flyersoft/books/PDFReader$PDFNote;->start:I

    if-ne v7, v8, :cond_7

    goto :goto_9

    .line 1474
    :cond_8
    new-instance v27, Lcom/flyersoft/tools/BookDb$NoteInfo;

    invoke-static {}, Lcom/flyersoft/tools/A;->getBookName()Ljava/lang/String;

    move-result-object v29

    iget-object v3, v1, Lcom/flyersoft/books/PDFReader;->filename:Ljava/lang/String;

    iget v5, v4, Lcom/flyersoft/books/PDFReader$PDFNote;->start:I

    iget v7, v4, Lcom/flyersoft/books/PDFReader$PDFNote;->end:I

    iget v8, v4, Lcom/flyersoft/books/PDFReader$PDFNote;->page:I

    int-to-long v8, v8

    iget v10, v4, Lcom/flyersoft/books/PDFReader$PDFNote;->end:I

    iget v11, v4, Lcom/flyersoft/books/PDFReader$PDFNote;->start:I

    sub-int v35, v10, v11

    iget v10, v4, Lcom/flyersoft/books/PDFReader$PDFNote;->color:I

    iget-wide v11, v4, Lcom/flyersoft/books/PDFReader$PDFNote;->timeStamp:J

    iget-object v13, v4, Lcom/flyersoft/books/PDFReader$PDFNote;->note_text:Ljava/lang/String;

    iget-object v14, v4, Lcom/flyersoft/books/PDFReader$PDFNote;->original:Ljava/lang/String;

    iget v15, v4, Lcom/flyersoft/books/PDFReader$PDFNote;->type:I

    if-ne v15, v0, :cond_9

    const/16 v42, 0x1

    goto :goto_6

    :cond_9
    const/16 v42, 0x0

    :goto_6
    iget v15, v4, Lcom/flyersoft/books/PDFReader$PDFNote;->type:I

    const/4 v0, 0x2

    if-ne v15, v0, :cond_a

    const/16 v43, 0x1

    goto :goto_7

    :cond_a
    const/16 v43, 0x0

    .line 1477
    :goto_7
    iget v0, v4, Lcom/flyersoft/books/PDFReader$PDFNote;->type:I

    const/4 v4, 0x3

    if-ne v0, v4, :cond_b

    const-string v0, "1"

    move-object/from16 v44, v0

    goto :goto_8

    :cond_b
    move-object/from16 v44, v6

    :goto_8
    const/16 v28, 0x0

    const-string v39, ""

    move-object/from16 v30, v3

    move/from16 v31, v5

    move/from16 v32, v7

    move-wide/from16 v33, v8

    move/from16 v36, v10

    move-wide/from16 v37, v11

    move-object/from16 v40, v13

    move-object/from16 v41, v14

    invoke-direct/range {v27 .. v44}, Lcom/flyersoft/tools/BookDb$NoteInfo;-><init>(ILjava/lang/String;Ljava/lang/String;IIJIIJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLjava/lang/String;)V

    .line 1478
    invoke-static/range {v27 .. v27}, Lcom/flyersoft/tools/A;->addNote(Lcom/flyersoft/tools/BookDb$NoteInfo;)V

    const/4 v3, 0x1

    :goto_9
    add-int/lit8 v2, v2, -0x1

    const/4 v0, 0x1

    goto/16 :goto_4

    :cond_c
    move/from16 v2, p2

    .line 1483
    invoke-virtual {v1, v2}, Lcom/flyersoft/books/PDFReader;->pdfUpdateNotesToFile(Z)Z

    move-result v0

    .line 1484
    iget-object v2, v1, Lcom/flyersoft/books/PDFReader;->remotePdfNotes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    if-nez v3, :cond_e

    if-eqz v0, :cond_d

    goto :goto_a

    :cond_d
    const/4 v11, 0x0

    goto :goto_b

    :cond_e
    :goto_a
    const/4 v11, 0x1

    :goto_b
    return v11
.end method

.method public pdfCreateTextFromNotes()Ljava/lang/String;
    .locals 6

    .line 1370
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->remotePdfNotes:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    const-string v1, ""

    if-eqz v0, :cond_0

    return-object v1

    .line 1372
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1373
    iget-object v2, p0, Lcom/flyersoft/books/PDFReader;->remotePdfNotes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    :goto_0
    if-ltz v2, :cond_2

    .line 1374
    iget-object v3, p0, Lcom/flyersoft/books/PDFReader;->remotePdfNotes:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/books/PDFReader$PDFNote;

    iget-object v3, v3, Lcom/flyersoft/books/PDFReader$PDFNote;->bookmark:Ljava/lang/String;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1375
    iget-object v3, p0, Lcom/flyersoft/books/PDFReader;->remotePdfNotes:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/books/PDFReader$PDFNote;

    iget v3, v3, Lcom/flyersoft/books/PDFReader$PDFNote;->page:I

    .line 1376
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/radaee/pdf/Page;

    if-nez v4, :cond_1

    .line 1378
    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->pdfGetDoc()Lcom/radaee/pdf/Document;

    move-result-object v4

    invoke-virtual {v4, v3}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v4

    .line 1379
    invoke-virtual {v4}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 1380
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    .line 1385
    :cond_2
    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 1386
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/radaee/pdf/Page;

    invoke-virtual {v3}, Lcom/radaee/pdf/Page;->Close()V

    goto :goto_1

    .line 1387
    :cond_3
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 1388
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->remotePdfNotes:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    if-eqz v0, :cond_4

    return-object v1

    .line 1391
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1392
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->pdfGetDoc()Lcom/radaee/pdf/Document;

    move-result-object v1

    invoke-virtual {v1}, Lcom/radaee/pdf/Document;->GetPageCount()I

    move-result v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1393
    iget-object v1, p0, Lcom/flyersoft/books/PDFReader;->remotePdfNotes:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/books/PDFReader$PDFNote;

    .line 1394
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "#A*#"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v4, v2, Lcom/flyersoft/books/PDFReader$PDFNote;->page:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1395
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "#A1#"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v4, v2, Lcom/flyersoft/books/PDFReader$PDFNote;->timeStamp:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1396
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "#A2#"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v4, v2, Lcom/flyersoft/books/PDFReader$PDFNote;->start:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1397
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "#A3#"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v4, v2, Lcom/flyersoft/books/PDFReader$PDFNote;->end:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1398
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "#A4#"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v4, v2, Lcom/flyersoft/books/PDFReader$PDFNote;->color:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1399
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "#A5#"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v4, v2, Lcom/flyersoft/books/PDFReader$PDFNote;->type:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1400
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "#A6#"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, v2, Lcom/flyersoft/books/PDFReader$PDFNote;->note_text:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1401
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "#A7#"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, v2, Lcom/flyersoft/books/PDFReader$PDFNote;->original:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1402
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "#A8#"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, v2, Lcom/flyersoft/books/PDFReader$PDFNote;->bookmark:Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1403
    const-string v2, "#A@#"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_2

    .line 1405
    :cond_5
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public pdfGetAnnotList()Ljava/util/ArrayList;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/books/PDFReader$PdfAnnotItem;",
            ">;"
        }
    .end annotation

    .line 1793
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1794
    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->getPageCount()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_2

    .line 1796
    invoke-virtual {p0, v3}, Lcom/flyersoft/books/PDFReader;->pdfGetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v4

    .line 1797
    invoke-virtual {v4}, Lcom/radaee/pdf/Page;->ObjsStart()V

    const/4 v5, 0x0

    const/4 v6, 0x0

    .line 1799
    :goto_1
    invoke-virtual {v4}, Lcom/radaee/pdf/Page;->GetAnnotCount()I

    move-result v7

    if-ge v5, v7, :cond_1

    .line 1800
    invoke-virtual {v4, v5}, Lcom/radaee/pdf/Page;->GetAnnot(I)Lcom/radaee/pdf/Page$Annotation;

    move-result-object v7

    if-eqz v7, :cond_0

    .line 1801
    invoke-virtual {v7}, Lcom/radaee/pdf/Page$Annotation;->isAnnotListType()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 1802
    new-instance v8, Lcom/flyersoft/books/PDFReader$PdfAnnotItem;

    add-int/lit8 v9, v6, 0x1

    invoke-direct {v8, v3, v6, v7}, Lcom/flyersoft/books/PDFReader$PdfAnnotItem;-><init>(IILcom/radaee/pdf/Page$Annotation;)V

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move v6, v9

    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 1805
    :cond_1
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "annot count:"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v7, 0x3

    new-array v7, v7, [Ljava/lang/Object;

    aput-object v4, v7, v2

    const/4 v4, 0x1

    aput-object v5, v7, v4

    const/4 v4, 0x2

    aput-object v6, v7, v4

    invoke-static {v7}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    return-object v0
.end method

.method public pdfGetAnnotListPageStart(Ljava/util/ArrayList;I)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/books/PDFReader$PdfAnnotItem;",
            ">;I)I"
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 1819
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 1820
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/books/PDFReader$PdfAnnotItem;

    iget v2, v2, Lcom/flyersoft/books/PDFReader$PdfAnnotItem;->pageno:I

    if-ne v2, p2, :cond_0

    return v1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1822
    :cond_1
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    :goto_1
    if-ltz v1, :cond_3

    .line 1823
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/books/PDFReader$PdfAnnotItem;

    iget v2, v2, Lcom/flyersoft/books/PDFReader$PdfAnnotItem;->pageno:I

    if-ge v2, p2, :cond_2

    return v1

    :cond_2
    add-int/lit8 v1, v1, -0x1

    goto :goto_1

    :cond_3
    return v0
.end method

.method public pdfGetCIndexAtPoint(FF)Lcom/radaee/view/PDFLayout$PDFPos;
    .locals 3

    .line 478
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    float-to-int p1, p1

    float-to-int p2, p2

    invoke-virtual {v0, p1, p2}, Lcom/radaee/view/PDFLayout;->vGetPos(II)Lcom/radaee/view/PDFLayout$PDFPos;

    move-result-object p1

    .line 480
    iget p2, p1, Lcom/radaee/view/PDFLayout$PDFPos;->x:F

    .line 481
    iget v0, p1, Lcom/radaee/view/PDFLayout$PDFPos;->y:F

    const/4 v1, 0x2

    new-array v1, v1, [F

    const/4 v2, 0x0

    aput p2, v1, v2

    const/4 p2, 0x1

    aput v0, v1, p2

    .line 482
    iget-object p2, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iget-object p2, p2, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    iget v0, p1, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    invoke-virtual {p2, v0}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object p2

    .line 483
    invoke-virtual {p2}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 484
    invoke-virtual {p2, v1}, Lcom/radaee/pdf/Page;->ObjsGetCharIndex([F)I

    move-result v0

    iput v0, p1, Lcom/radaee/view/PDFLayout$PDFPos;->cindex:I

    .line 485
    invoke-virtual {p2}, Lcom/radaee/pdf/Page;->Close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 488
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    const/4 p1, 0x0

    return-object p1
.end method

.method public pdfGetDoc()Lcom/radaee/pdf/Document;
    .locals 1

    .line 1757
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    return-object v0
.end method

.method public pdfGetPage(I)Lcom/radaee/pdf/Page;
    .locals 1

    .line 1761
    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->pdfGetDoc()Lcom/radaee/pdf/Document;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object p1

    return-object p1
.end method

.method public declared-synchronized pdfGetPageAnnotShot(Ljava/util/ArrayList;IILjava/util/HashMap;Z)Landroid/graphics/Bitmap;
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/books/PDFReader$PdfAnnotItem;",
            ">;II",
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/ref/Reference<",
            "Landroid/graphics/Bitmap;",
            ">;>;Z)",
            "Landroid/graphics/Bitmap;"
        }
    .end annotation

    move-object/from16 v1, p0

    move/from16 v0, p2

    move-object/from16 v2, p4

    monitor-enter p0

    .line 1830
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->size()I

    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    const/4 v5, 0x0

    if-le v0, v3, :cond_0

    .line 1831
    monitor-exit p0

    return-object v5

    .line 1832
    :cond_0
    :try_start_1
    invoke-virtual/range {p1 .. p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/books/PDFReader$PdfAnnotItem;

    iget-object v3, v3, Lcom/flyersoft/books/PDFReader$PdfAnnotItem;->annot:Lcom/radaee/pdf/Page$Annotation;

    iget-object v3, v3, Lcom/radaee/pdf/Page$Annotation;->page:Lcom/radaee/pdf/Page;

    .line 1833
    iget v6, v3, Lcom/radaee/pdf/Page;->pageno:I

    invoke-virtual {v1, v6}, Lcom/flyersoft/books/PDFReader;->getPageHeight(I)F

    move-result v6

    .line 1834
    iget v7, v3, Lcom/radaee/pdf/Page;->pageno:I

    invoke-virtual {v1, v7}, Lcom/flyersoft/books/PDFReader;->getPageWidth(I)F

    move-result v7

    .line 1835
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->size()I

    move-result v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    sub-int/2addr v8, v4

    if-le v0, v8, :cond_1

    .line 1836
    monitor-exit p0

    return-object v5

    .line 1837
    :cond_1
    :try_start_2
    invoke-virtual/range {p1 .. p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/books/PDFReader$PdfAnnotItem;

    iget-object v0, v0, Lcom/flyersoft/books/PDFReader$PdfAnnotItem;->annot:Lcom/radaee/pdf/Page$Annotation;

    .line 1838
    invoke-virtual {v0}, Lcom/radaee/pdf/Page$Annotation;->GetRect()[F

    move-result-object v8

    const/4 v9, 0x2

    .line 1839
    aget v10, v8, v9

    const/4 v11, 0x0

    aget v12, v8, v11

    sub-float/2addr v10, v12

    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    move-result v10

    const/4 v12, 0x3

    .line 1840
    aget v13, v8, v12

    aget v14, v8, v4

    sub-float/2addr v13, v14

    invoke-static {v13}, Ljava/lang/Math;->abs(F)F

    move-result v13

    const/high16 v14, 0x3fc00000    # 1.5f

    div-float v14, v7, v14

    div-float v14, v10, v14

    .line 1844
    invoke-virtual {v0}, Lcom/radaee/pdf/Page$Annotation;->isHighlight()Z

    move-result v15

    if-eqz v15, :cond_2

    const v15, 0x3e6147ae    # 0.22f

    goto :goto_0

    :cond_2
    const v15, 0x3df5c28f    # 0.12f

    :goto_0
    cmpg-float v16, v14, v15

    if-gez v16, :cond_3

    move v14, v15

    :cond_3
    const/high16 v15, 0x3f800000    # 1.0f

    cmpl-float v16, v14, v15

    if-lez v16, :cond_4

    const/high16 v14, 0x3f800000    # 1.0f

    :cond_4
    if-nez p3, :cond_5

    const/16 v15, 0x64

    goto :goto_1

    :cond_5
    move/from16 v15, p3

    :goto_1
    int-to-float v15, v15

    mul-float v14, v14, v15

    float-to-int v14, v14

    cmpl-float v15, v10, v13

    if-eqz v15, :cond_6

    int-to-float v15, v14

    mul-float v13, v13, v15

    div-float/2addr v13, v10

    float-to-int v10, v13

    goto :goto_2

    :cond_6
    move v10, v14

    .line 1856
    :goto_2
    sget-object v13, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v14, v10, v13}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v13

    if-eqz p5, :cond_7

    .line 1857
    invoke-virtual {v0}, Lcom/radaee/pdf/Page$Annotation;->GetType()I

    move-result v15

    const/16 v16, 0x1

    const/16 v4, 0xd

    if-ne v15, v4, :cond_8

    .line 1858
    invoke-virtual {v0, v13}, Lcom/radaee/pdf/Page$Annotation;->RenderToBmp(Landroid/graphics/Bitmap;)Z

    goto/16 :goto_5

    :cond_7
    const/16 v16, 0x1

    :cond_8
    if-eqz v2, :cond_9

    .line 1862
    iget v0, v3, Lcom/radaee/pdf/Page;->pageno:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/Reference;

    if-eqz v0, :cond_9

    .line 1864
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    goto :goto_3

    :cond_9
    move-object v0, v5

    :goto_3
    if-nez v0, :cond_b

    if-eqz p5, :cond_a

    .line 1868
    invoke-virtual {v1}, Lcom/flyersoft/books/PDFReader;->pdfGetDoc()Lcom/radaee/pdf/Document;

    move-result-object v0

    iget v4, v3, Lcom/radaee/pdf/Page;->pageno:I

    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v15

    invoke-virtual {v15}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v15

    invoke-virtual {v15}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v15

    invoke-static {v0, v4, v15}, Lcom/flyersoft/books/PDFReader;->createBitmapOfPdfPage(Lcom/radaee/pdf/Document;ILandroid/util/DisplayMetrics;)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_4

    :cond_a
    float-to-int v0, v7

    float-to-int v4, v6

    .line 1870
    sget-object v15, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v4, v15}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    :goto_4
    if-eqz v2, :cond_b

    .line 1872
    new-instance v4, Ljava/lang/ref/SoftReference;

    invoke-direct {v4, v0}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    .line 1873
    iget v15, v3, Lcom/radaee/pdf/Page;->pageno:I

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    invoke-virtual {v2, v15, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1876
    :cond_b
    invoke-virtual {v3, v0}, Lcom/radaee/pdf/Page;->RenderThumb(Landroid/graphics/Bitmap;)Z

    .line 1878
    new-instance v2, Landroid/graphics/Canvas;

    invoke-direct {v2, v13}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 1879
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v3, v7

    .line 1880
    new-instance v4, Landroid/graphics/Rect;

    aget v7, v8, v11

    mul-float v7, v7, v3

    float-to-int v7, v7

    aget v11, v8, v12

    sub-float v11, v6, v11

    mul-float v11, v11, v3

    float-to-int v11, v11

    aget v9, v8, v9

    mul-float v9, v9, v3

    float-to-int v9, v9

    aget v8, v8, v16

    sub-float/2addr v6, v8

    mul-float v6, v6, v3

    float-to-int v3, v6

    invoke-direct {v4, v7, v11, v9, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 1881
    new-instance v3, Landroid/graphics/RectF;

    int-to-float v6, v14

    int-to-float v7, v10

    const/4 v8, 0x0

    invoke-direct {v3, v8, v8, v6, v7}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {v2, v0, v4, v3, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1890
    :goto_5
    monitor-exit p0

    return-object v13

    :catchall_0
    move-exception v0

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v0
.end method

.method public pdfGetVSel()Lcom/radaee/view/VSel;
    .locals 1

    .line 906
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isPdf:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_sel:Lcom/radaee/view/VSel;

    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_sel:Lcom/radaee/view/VSel;

    return-object v0
.end method

.method public pdfGlGetCIndexAtPoint(FF)Lcom/radaee/view/GLLayout$PDFPos;
    .locals 3

    .line 461
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    float-to-int p1, p1

    float-to-int p2, p2

    invoke-virtual {v0, p1, p2}, Lcom/radaee/view/GLLayout;->vGetPos(II)Lcom/radaee/view/GLLayout$PDFPos;

    move-result-object p1

    .line 463
    iget p2, p1, Lcom/radaee/view/GLLayout$PDFPos;->x:F

    .line 464
    iget v0, p1, Lcom/radaee/view/GLLayout$PDFPos;->y:F

    const/4 v1, 0x2

    new-array v1, v1, [F

    const/4 v2, 0x0

    aput p2, v1, v2

    const/4 p2, 0x1

    aput v0, v1, p2

    .line 465
    iget-object p2, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object p2, p2, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iget-object p2, p2, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    iget v0, p1, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    invoke-virtual {p2, v0}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object p2

    .line 466
    invoke-virtual {p2}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 467
    invoke-virtual {p2, v1}, Lcom/radaee/pdf/Page;->ObjsGetCharIndex([F)I

    move-result v0

    iput v0, p1, Lcom/radaee/view/GLLayout$PDFPos;->cindex:I

    .line 468
    invoke-virtual {p2}, Lcom/radaee/pdf/Page;->Close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 471
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    const/4 p1, 0x0

    return-object p1
.end method

.method public pdfHasAnnotForList(I)Z
    .locals 3

    .line 1765
    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->getPageCount()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    const/4 v0, -0x1

    if-ne p1, v0, :cond_1

    .line 1768
    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->getCurPageNo()I

    move-result p1

    .line 1769
    :cond_1
    invoke-virtual {p0, p1}, Lcom/flyersoft/books/PDFReader;->pdfGetPage(I)Lcom/radaee/pdf/Page;

    move-result-object p1

    const/4 v0, 0x0

    .line 1770
    :goto_0
    invoke-virtual {p1}, Lcom/radaee/pdf/Page;->GetAnnotCount()I

    move-result v2

    if-ge v0, v2, :cond_3

    .line 1771
    invoke-virtual {p1, v0}, Lcom/radaee/pdf/Page;->GetAnnot(I)Lcom/radaee/pdf/Page$Annotation;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 1772
    invoke-virtual {v2}, Lcom/radaee/pdf/Page$Annotation;->isAnnotListType()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1773
    invoke-virtual {p1}, Lcom/radaee/pdf/Page;->Close()V

    const/4 p1, 0x1

    return p1

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1777
    :cond_3
    invoke-virtual {p1}, Lcom/radaee/pdf/Page;->Close()V

    return v1
.end method

.method public pdfRemoveAnnotFromNote(Lcom/flyersoft/tools/BookDb$NoteInfo;)Z
    .locals 6

    .line 1894
    iget-wide v0, p1, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J

    long-to-int v1, v0

    .line 1895
    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->getPageCount()I

    move-result v0

    const/4 v2, 0x1

    sub-int/2addr v0, v2

    const/4 v3, 0x0

    if-le v1, v0, :cond_0

    return v3

    .line 1897
    :cond_0
    invoke-virtual {p0, v1}, Lcom/flyersoft/books/PDFReader;->pdfGetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v0

    .line 1898
    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 1899
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1900
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 1901
    invoke-direct {p0, p1, v0, v1, v4}, Lcom/flyersoft/books/PDFReader;->pdfGetAnnotFromNote(Lcom/flyersoft/tools/BookDb$NoteInfo;Lcom/radaee/pdf/Page;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 1903
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/radaee/pdf/Page$Annotation;

    .line 1904
    invoke-virtual {v5}, Lcom/radaee/pdf/Page$Annotation;->RemoveFromPage()Z

    goto :goto_0

    .line 1905
    :cond_1
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-nez p1, :cond_2

    .line 1906
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/radaee/pdf/Page$Annotation;

    .line 1907
    invoke-virtual {v5}, Lcom/radaee/pdf/Page$Annotation;->RemoveFromPage()Z

    goto :goto_1

    .line 1908
    :cond_2
    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->Close()V

    .line 1909
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-gtz p1, :cond_4

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-lez p1, :cond_3

    goto :goto_2

    :cond_3
    return v3

    :cond_4
    :goto_2
    return v2
.end method

.method public pdfRemoveNoteFromAnnot(Lcom/radaee/pdf/Page$Annotation;)V
    .locals 3

    if-eqz p1, :cond_2

    .line 1976
    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->isHighlight()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_2

    .line 1978
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1979
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1980
    invoke-direct {p0, p1, v0, v1}, Lcom/flyersoft/books/PDFReader;->pdfGetNoteFromAnnot(Lcom/radaee/pdf/Page$Annotation;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 1982
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/tools/BookDb$NoteInfo;

    .line 1983
    invoke-static {v2}, Lcom/flyersoft/tools/A;->removeNote(Lcom/flyersoft/tools/BookDb$NoteInfo;)Z

    goto :goto_0

    .line 1984
    :cond_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-nez p1, :cond_2

    .line 1985
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/tools/BookDb$NoteInfo;

    .line 1986
    invoke-static {v0}, Lcom/flyersoft/tools/A;->removeNote(Lcom/flyersoft/tools/BookDb$NoteInfo;)Z

    goto :goto_1

    :cond_2
    :goto_2
    return-void
.end method

.method public pdfSelectedAnnot()Lcom/radaee/pdf/Page$Annotation;
    .locals 1

    .line 966
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isPdf:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    return-object v0
.end method

.method public pdfSetThumb(Lcom/radaee/util/PDFThumbView;)V
    .locals 0

    .line 1209
    iput-object p1, p0, Lcom/flyersoft/books/PDFReader;->thumbView:Lcom/radaee/util/PDFThumbView;

    return-void
.end method

.method public pdfUpdateAnnotTextFromNote(Lcom/flyersoft/tools/BookDb$NoteInfo;)Z
    .locals 6

    .line 1913
    iget-wide v0, p1, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J

    long-to-int v1, v0

    .line 1914
    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->getPageCount()I

    move-result v0

    const/4 v2, 0x1

    sub-int/2addr v0, v2

    const/4 v3, 0x0

    if-le v1, v0, :cond_0

    return v3

    .line 1916
    :cond_0
    invoke-virtual {p0, v1}, Lcom/flyersoft/books/PDFReader;->pdfGetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v0

    .line 1917
    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 1918
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1919
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 1920
    invoke-direct {p0, p1, v0, v1, v4}, Lcom/flyersoft/books/PDFReader;->pdfGetAnnotFromNote(Lcom/flyersoft/tools/BookDb$NoteInfo;Lcom/radaee/pdf/Page;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 1923
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lez v5, :cond_1

    .line 1924
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/radaee/pdf/Page$Annotation;

    .line 1925
    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Annotation;->GetPopupText()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 1926
    iget-object p1, p1, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    invoke-virtual {v1, p1}, Lcom/radaee/pdf/Page$Annotation;->SetPopupText(Ljava/lang/String;)Z

    goto :goto_0

    .line 1929
    :cond_1
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_2

    .line 1930
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/radaee/pdf/Page$Annotation;

    .line 1931
    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Annotation;->GetPopupText()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 1932
    iget-object p1, p1, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    invoke-virtual {v1, p1}, Lcom/radaee/pdf/Page$Annotation;->SetPopupText(Ljava/lang/String;)Z

    goto :goto_0

    :cond_2
    const/4 v2, 0x0

    .line 1936
    :goto_0
    invoke-virtual {v0}, Lcom/radaee/pdf/Page;->Close()V

    return v2
.end method

.method public pdfUpdateCurPage()V
    .locals 1

    .line 1748
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    if-eqz v0, :cond_0

    .line 1749
    invoke-virtual {v0}, Lcom/radaee/reader/PDFGLLayoutView;->PDFUpdateCurrPage()V

    .line 1750
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    if-eqz v0, :cond_1

    .line 1751
    invoke-virtual {v0}, Lcom/radaee/reader/PDFLayoutView;->PDFUpdateCurrPage()V

    :cond_1
    return-void
.end method

.method public pdfUpdateNoteTextFromAnnot(Lcom/radaee/pdf/Page$Annotation;Ljava/lang/String;)V
    .locals 3

    .line 1990
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1991
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1992
    invoke-direct {p0, p1, v0, v1}, Lcom/flyersoft/books/PDFReader;->pdfGetNoteFromAnnot(Lcom/radaee/pdf/Page$Annotation;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 1994
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p1

    const/4 v2, 0x0

    if-lez p1, :cond_0

    .line 1995
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/tools/BookDb$NoteInfo;

    iput-object p2, p1, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    .line 1996
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/tools/BookDb$NoteInfo;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->updateNote(Lcom/flyersoft/tools/BookDb$NoteInfo;)Z

    return-void

    .line 1997
    :cond_0
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-lez p1, :cond_1

    .line 1998
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/tools/BookDb$NoteInfo;

    iput-object p2, p1, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    .line 1999
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/tools/BookDb$NoteInfo;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->updateNote(Lcom/flyersoft/tools/BookDb$NoteInfo;)Z

    :cond_1
    return-void
.end method

.method public pdfUpdateNotesToFile(Z)Z
    .locals 20

    move-object/from16 v1, p0

    .line 1490
    iget-object v0, v1, Lcom/flyersoft/books/PDFReader;->remotePdfNotes:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    return v2

    .line 1492
    :cond_0
    sget v3, Lcom/flyersoft/tools/A;->pdf_highlight_color:I

    .line 1493
    sget v4, Lcom/flyersoft/tools/A;->underline_color:I

    .line 1494
    sget v5, Lcom/flyersoft/tools/A;->strikethrough_color:I

    .line 1495
    sget v6, Lcom/flyersoft/tools/A;->squiggly_color:I

    .line 1497
    :try_start_0
    new-instance v0, Ljava/io/File;

    iget-object v7, v1, Lcom/flyersoft/books/PDFReader;->filename:Ljava/lang/String;

    invoke-direct {v0, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v7

    .line 1498
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 1499
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 1501
    iget-object v10, v1, Lcom/flyersoft/books/PDFReader;->remotePdfNotes:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v10
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 v11, 0x0

    :goto_0
    :try_start_1
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_a

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/flyersoft/books/PDFReader$PDFNote;

    if-eqz p1, :cond_2

    .line 1502
    iget-wide v14, v12, Lcom/flyersoft/books/PDFReader$PDFNote;->timeStamp:J

    cmp-long v16, v14, v7

    if-lez v16, :cond_1

    goto :goto_1

    :cond_1
    const/4 v14, 0x0

    goto :goto_2

    :cond_2
    :goto_1
    const/4 v14, 0x1

    .line 1503
    :goto_2
    iget v15, v12, Lcom/flyersoft/books/PDFReader$PDFNote;->page:I

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    invoke-virtual {v0, v15}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_9

    if-eqz v14, :cond_9

    .line 1504
    iget v14, v12, Lcom/flyersoft/books/PDFReader$PDFNote;->page:I

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v0, v14}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 1505
    iget v14, v12, Lcom/flyersoft/books/PDFReader$PDFNote;->page:I

    invoke-virtual {v1, v14}, Lcom/flyersoft/books/PDFReader;->pdfGetPage(I)Lcom/radaee/pdf/Page;

    move-result-object v14

    .line 1506
    invoke-virtual {v14}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 1507
    iget-object v15, v1, Lcom/flyersoft/books/PDFReader;->remotePdfNotes:Ljava/util/ArrayList;

    invoke-virtual {v15}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :goto_3
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_8

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    const/16 v17, 0x1

    move-object/from16 v13, v16

    check-cast v13, Lcom/flyersoft/books/PDFReader$PDFNote;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-eqz p1, :cond_4

    move/from16 v16, v3

    .line 1508
    :try_start_2
    iget-wide v2, v13, Lcom/flyersoft/books/PDFReader$PDFNote;->timeStamp:J

    cmp-long v18, v2, v7

    if-lez v18, :cond_3

    goto :goto_4

    :cond_3
    move-object/from16 v18, v0

    move/from16 v19, v4

    goto :goto_6

    :catchall_0
    move-exception v0

    goto/16 :goto_a

    :catch_0
    move-exception v0

    goto/16 :goto_8

    :cond_4
    move/from16 v16, v3

    .line 1509
    :goto_4
    iget v2, v13, Lcom/flyersoft/books/PDFReader$PDFNote;->page:I

    iget v3, v12, Lcom/flyersoft/books/PDFReader$PDFNote;->page:I

    if-ne v2, v3, :cond_3

    const/4 v2, 0x0

    invoke-direct {v1, v13, v14, v2}, Lcom/flyersoft/books/PDFReader;->pdfHasAnnotFromPDFNote(Lcom/flyersoft/books/PDFReader$PDFNote;Lcom/radaee/pdf/Page;Z)Z

    move-result v3

    if-nez v3, :cond_3

    .line 1510
    iget v3, v12, Lcom/flyersoft/books/PDFReader$PDFNote;->page:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v9, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    .line 1511
    iget v3, v12, Lcom/flyersoft/books/PDFReader$PDFNote;->page:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v9, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1512
    :cond_5
    iget v3, v13, Lcom/flyersoft/books/PDFReader$PDFNote;->color:I

    sput v3, Lcom/flyersoft/tools/A;->pdf_highlight_color:I

    .line 1513
    iget v3, v13, Lcom/flyersoft/books/PDFReader$PDFNote;->color:I

    sput v3, Lcom/flyersoft/tools/A;->underline_color:I

    .line 1514
    iget v3, v13, Lcom/flyersoft/books/PDFReader$PDFNote;->color:I

    sput v3, Lcom/flyersoft/tools/A;->strikethrough_color:I

    .line 1515
    iget v3, v13, Lcom/flyersoft/books/PDFReader$PDFNote;->color:I

    sput v3, Lcom/flyersoft/tools/A;->squiggly_color:I

    .line 1516
    invoke-direct {v1}, Lcom/flyersoft/books/PDFReader;->updateGlobalHighlightColors()V

    .line 1517
    iget v3, v13, Lcom/flyersoft/books/PDFReader$PDFNote;->start:I

    iget v2, v13, Lcom/flyersoft/books/PDFReader$PDFNote;->end:I

    move-object/from16 v18, v0

    iget v0, v13, Lcom/flyersoft/books/PDFReader$PDFNote;->type:I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move/from16 v19, v4

    const/4 v4, 0x3

    if-ne v0, v4, :cond_6

    const/4 v0, 0x4

    goto :goto_5

    :cond_6
    :try_start_3
    iget v0, v13, Lcom/flyersoft/books/PDFReader$PDFNote;->type:I

    :goto_5
    invoke-virtual {v14, v3, v2, v0}, Lcom/radaee/pdf/Page;->AddAnnotMarkup(III)Z

    .line 1518
    iget-object v0, v13, Lcom/flyersoft/books/PDFReader$PDFNote;->original:Ljava/lang/String;

    invoke-static {v14, v0}, Lcom/flyersoft/books/PDFReader;->addNameTagToLastAnnot(Lcom/radaee/pdf/Page;Ljava/lang/String;)Lcom/radaee/pdf/Page$Annotation;

    move-result-object v0

    if-eqz v0, :cond_7

    .line 1519
    iget-object v2, v13, Lcom/flyersoft/books/PDFReader$PDFNote;->note_text:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_7

    .line 1520
    iget-object v2, v13, Lcom/flyersoft/books/PDFReader$PDFNote;->note_text:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/radaee/pdf/Page$Annotation;->SetPopupText(Ljava/lang/String;)Z

    :cond_7
    const/4 v11, 0x1

    :goto_6
    move/from16 v3, v16

    move-object/from16 v0, v18

    move/from16 v4, v19

    const/4 v2, 0x0

    goto/16 :goto_3

    :cond_8
    move-object/from16 v18, v0

    move/from16 v16, v3

    move/from16 v19, v4

    .line 1524
    invoke-virtual {v14}, Lcom/radaee/pdf/Page;->Close()V

    goto :goto_7

    :cond_9
    move-object/from16 v18, v0

    move/from16 v16, v3

    move/from16 v19, v4

    :goto_7
    move/from16 v3, v16

    move-object/from16 v0, v18

    move/from16 v4, v19

    const/4 v2, 0x0

    goto/16 :goto_0

    :cond_a
    move/from16 v16, v3

    move/from16 v19, v4

    const/16 v17, 0x1

    .line 1527
    invoke-static {v9}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    if-nez v0, :cond_b

    .line 1528
    invoke-virtual {v1}, Lcom/flyersoft/books/PDFReader;->pdfAnnotEnd()V

    .line 1529
    sput-boolean v17, Lcom/flyersoft/tools/A;->pdfAnnotUpdated:Z

    .line 1530
    invoke-virtual {v1}, Lcom/flyersoft/books/PDFReader;->save()V

    .line 1531
    new-instance v0, Ljava/io/File;

    sget-object v2, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/io/File;->setLastModified(J)Z

    .line 1532
    new-instance v0, Lcom/flyersoft/books/PDFReader$16;

    invoke-direct {v0, v1, v9}, Lcom/flyersoft/books/PDFReader$16;-><init>(Lcom/flyersoft/books/PDFReader;Ljava/util/ArrayList;)V

    const-wide/16 v2, 0x64

    invoke-virtual {v1, v0, v2, v3}, Lcom/flyersoft/books/PDFReader;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 1543
    :cond_b
    sput v16, Lcom/flyersoft/tools/A;->pdf_highlight_color:I

    .line 1544
    sput v19, Lcom/flyersoft/tools/A;->underline_color:I

    .line 1545
    sput v5, Lcom/flyersoft/tools/A;->strikethrough_color:I

    .line 1546
    sput v6, Lcom/flyersoft/tools/A;->squiggly_color:I

    return v11

    :catch_1
    move-exception v0

    goto :goto_9

    :catch_2
    move-exception v0

    move/from16 v16, v3

    :goto_8
    move/from16 v19, v4

    :goto_9
    move v2, v11

    goto :goto_b

    :catchall_1
    move-exception v0

    move/from16 v16, v3

    :goto_a
    move/from16 v19, v4

    goto :goto_c

    :catch_3
    move-exception v0

    move/from16 v16, v3

    move/from16 v19, v4

    const/4 v2, 0x0

    .line 1541
    :goto_b
    :try_start_4
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 1543
    sput v16, Lcom/flyersoft/tools/A;->pdf_highlight_color:I

    .line 1544
    sput v19, Lcom/flyersoft/tools/A;->underline_color:I

    .line 1545
    sput v5, Lcom/flyersoft/tools/A;->strikethrough_color:I

    .line 1546
    sput v6, Lcom/flyersoft/tools/A;->squiggly_color:I

    return v2

    :catchall_2
    move-exception v0

    .line 1543
    :goto_c
    sput v16, Lcom/flyersoft/tools/A;->pdf_highlight_color:I

    .line 1544
    sput v19, Lcom/flyersoft/tools/A;->underline_color:I

    .line 1545
    sput v5, Lcom/flyersoft/tools/A;->strikethrough_color:I

    .line 1546
    sput v6, Lcom/flyersoft/tools/A;->squiggly_color:I

    .line 1547
    throw v0
.end method

.method public pdfUpdatePage(I)V
    .locals 1

    .line 1741
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    if-eqz v0, :cond_0

    .line 1742
    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0, p1}, Lcom/radaee/reader/GLView;->PDFUpdatePage(I)V

    .line 1743
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    if-eqz v0, :cond_1

    .line 1744
    invoke-virtual {v0, p1}, Lcom/radaee/reader/PDFLayoutView;->PDFUpdatePage(I)V

    :cond_1
    return-void
.end method

.method public resetDrawCache()V
    .locals 3

    .line 348
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v0, :cond_0

    .line 349
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->cbzView:Lorg/comic/CLayoutView;

    iget-object v0, v0, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    invoke-virtual {v0}, Lorg/comic/CLayout;->initPaints()V

    return-void

    .line 350
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isDjvu:Z

    if-eqz v0, :cond_2

    const/4 v0, 0x0

    .line 351
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    iget-object v1, v1, Lorg/djvu/DLayoutView;->m_doc:Lorg/djvu/DDocument;

    iget-object v1, v1, Lorg/djvu/DDocument;->pages:[Lorg/djvu/DPage;

    array-length v1, v1

    if-ge v0, v1, :cond_2

    .line 352
    iget-object v1, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    iget-object v1, v1, Lorg/djvu/DLayoutView;->m_doc:Lorg/djvu/DDocument;

    iget-object v1, v1, Lorg/djvu/DDocument;->pages:[Lorg/djvu/DPage;

    aget-object v1, v1, v0

    if-eqz v1, :cond_1

    .line 353
    iget-object v2, v1, Lorg/djvu/DPage;->_page:Lorg/mydroid/droids/djvu/codec/DjvuPage;

    if-eqz v2, :cond_1

    iget-object v2, v1, Lorg/djvu/DPage;->_page:Lorg/mydroid/droids/djvu/codec/DjvuPage;

    iget-object v2, v2, Lorg/mydroid/droids/djvu/codec/DjvuPage;->bitmapRef:Ljava/lang/ref/Reference;

    if-eqz v2, :cond_1

    .line 354
    iget-object v2, v1, Lorg/djvu/DPage;->_page:Lorg/mydroid/droids/djvu/codec/DjvuPage;

    iget-object v2, v2, Lorg/mydroid/droids/djvu/codec/DjvuPage;->bitmapRef:Ljava/lang/ref/Reference;

    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/Bitmap;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 355
    iget-object v2, v1, Lorg/djvu/DPage;->_page:Lorg/mydroid/droids/djvu/codec/DjvuPage;

    iget-object v2, v2, Lorg/mydroid/droids/djvu/codec/DjvuPage;->bitmapRef:Ljava/lang/ref/Reference;

    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/Bitmap;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->recycle(Landroid/graphics/Bitmap;)Z

    .line 356
    iget-object v1, v1, Lorg/djvu/DPage;->_page:Lorg/mydroid/droids/djvu/codec/DjvuPage;

    const/4 v2, 0x0

    iput-object v2, v1, Lorg/mydroid/droids/djvu/codec/DjvuPage;->bitmapRef:Ljava/lang/ref/Reference;

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method public save()V
    .locals 1

    .line 531
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v0, :cond_0

    goto :goto_0

    .line 532
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isDjvu:Z

    if-eqz v0, :cond_1

    :goto_0
    return-void

    .line 534
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->pdfGetDoc()Lcom/radaee/pdf/Document;

    move-result-object v0

    invoke-virtual {v0}, Lcom/radaee/pdf/Document;->Save()Z

    return-void
.end method

.method public setBackgroundColor()V
    .locals 2

    .line 331
    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->get_bg_color()I

    move-result v0

    .line 333
    iget-boolean v1, p0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v1, :cond_0

    .line 334
    iget-object v1, p0, Lcom/flyersoft/books/PDFReader;->cbzView:Lorg/comic/CLayoutView;

    if-eqz v1, :cond_3

    .line 335
    iget-object v1, v1, Lorg/comic/CLayoutView;->m_layout:Lorg/comic/CLayout;

    invoke-virtual {v1, v0}, Lorg/comic/CLayout;->vSetBackColor(I)V

    return-void

    .line 336
    :cond_0
    iget-boolean v1, p0, Lcom/flyersoft/books/PDFReader;->isDjvu:Z

    if-eqz v1, :cond_1

    .line 337
    iget-object v1, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    if-eqz v1, :cond_3

    .line 338
    iget-object v1, v1, Lorg/djvu/DLayoutView;->m_layout:Lorg/djvu/DLayout;

    invoke-virtual {v1, v0}, Lorg/djvu/DLayout;->vSetBackColor(I)V

    return-void

    .line 340
    :cond_1
    iget-object v1, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    if-eqz v1, :cond_2

    .line 341
    iget-object v1, v1, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v1, v0}, Lcom/radaee/reader/GLView;->PDFSetBGColor(I)V

    .line 342
    :cond_2
    iget-object v1, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    if-eqz v1, :cond_3

    .line 343
    iget-object v1, v1, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v1, v0}, Lcom/radaee/view/PDFLayout;->vSetBackColor(I)V

    :cond_3
    return-void
.end method

.method public setDocPos(Lcom/flyersoft/books/PDFReader$XPos;II)V
    .locals 1

    .line 228
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v0, :cond_0

    .line 229
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->cbzView:Lorg/comic/CLayoutView;

    invoke-virtual {p1}, Lcom/flyersoft/books/PDFReader$XPos;->toCbzPos()Lorg/comic/CLayout$Pos;

    move-result-object p1

    invoke-virtual {v0, p1, p2, p3}, Lorg/comic/CLayoutView;->SetPos(Lorg/comic/CLayout$Pos;II)V

    return-void

    .line 230
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isDjvu:Z

    if-eqz v0, :cond_1

    .line 231
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    invoke-virtual {p1}, Lcom/flyersoft/books/PDFReader$XPos;->toDjvuPos()Lorg/djvu/DLayout$DjvuPos;

    move-result-object p1

    invoke-virtual {v0, p1, p2, p3}, Lorg/djvu/DLayoutView;->DjvuSetPos(Lorg/djvu/DLayout$DjvuPos;II)V

    return-void

    .line 233
    :cond_1
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-eqz v0, :cond_2

    .line 234
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {p1}, Lcom/flyersoft/books/PDFReader$XPos;->toPDFGlPos()Lcom/radaee/view/GLLayout$PDFPos;

    move-result-object p1

    invoke-virtual {v0, p1, p2, p3}, Lcom/radaee/reader/GLView;->PDFSetPos(Lcom/radaee/view/GLLayout$PDFPos;II)V

    return-void

    .line 236
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {p1}, Lcom/flyersoft/books/PDFReader$XPos;->toPDFPos()Lcom/radaee/view/PDFLayout$PDFPos;

    move-result-object p1

    invoke-virtual {v0, p1, p2, p3}, Lcom/radaee/reader/PDFLayoutView;->PDFSetPos(Lcom/radaee/view/PDFLayout$PDFPos;II)V

    return-void
.end method

.method public setForceSel(II)V
    .locals 1

    .line 279
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v0, :cond_0

    return-void

    .line 280
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isDjvu:Z

    if-eqz v0, :cond_1

    .line 281
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    invoke-virtual {v0, p1, p2}, Lorg/djvu/DLayoutView;->setForceSel(II)V

    return-void

    .line 283
    :cond_1
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-eqz v0, :cond_2

    .line 284
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0, p1, p2}, Lcom/radaee/reader/GLView;->setForceSel(II)V

    return-void

    .line 286
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {v0, p1, p2}, Lcom/radaee/reader/PDFLayoutView;->setForceSel(II)V

    return-void
.end method

.method public setStatus(I)V
    .locals 1

    .line 612
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v0, :cond_0

    .line 613
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->cbzView:Lorg/comic/CLayoutView;

    iput p1, v0, Lorg/comic/CLayoutView;->m_status:I

    return-void

    .line 614
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isDjvu:Z

    if-eqz v0, :cond_1

    .line 615
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    iput p1, v0, Lorg/djvu/DLayoutView;->m_status:I

    return-void

    .line 617
    :cond_1
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-eqz v0, :cond_2

    .line 618
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iput p1, v0, Lcom/radaee/reader/GLView;->m_status:I

    return-void

    .line 620
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iput p1, v0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    return-void
.end method

.method public setView(I)V
    .locals 1

    .line 316
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v0, :cond_0

    .line 317
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->cbzView:Lorg/comic/CLayoutView;

    if-eqz v0, :cond_3

    .line 318
    invoke-virtual {v0, p1}, Lorg/comic/CLayoutView;->SetView(I)V

    return-void

    .line 319
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isDjvu:Z

    if-eqz v0, :cond_1

    .line 320
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    if-eqz v0, :cond_3

    .line 321
    invoke-virtual {v0, p1}, Lorg/djvu/DLayoutView;->DjvuSetView(I)V

    return-void

    .line 323
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    if-eqz v0, :cond_2

    .line 324
    invoke-virtual {v0, p1}, Lcom/radaee/reader/PDFGLLayoutView;->PDFSetView(I)V

    .line 325
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    if-eqz v0, :cond_3

    .line 326
    invoke-virtual {v0, p1}, Lcom/radaee/reader/PDFLayoutView;->PDFSetView(I)V

    :cond_3
    return-void
.end method

.method public setZoom(IILcom/flyersoft/books/PDFReader$XPos;F)V
    .locals 1

    .line 241
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v0, :cond_0

    .line 242
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->cbzView:Lorg/comic/CLayoutView;

    invoke-virtual {p3}, Lcom/flyersoft/books/PDFReader$XPos;->toCbzPos()Lorg/comic/CLayout$Pos;

    move-result-object p3

    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/comic/CLayoutView;->SetZoom(IILorg/comic/CLayout$Pos;F)V

    return-void

    .line 243
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isDjvu:Z

    if-eqz v0, :cond_1

    .line 244
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    invoke-virtual {p3}, Lcom/flyersoft/books/PDFReader$XPos;->toDjvuPos()Lorg/djvu/DLayout$DjvuPos;

    move-result-object p3

    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/djvu/DLayoutView;->SetZoom(IILorg/djvu/DLayout$DjvuPos;F)V

    return-void

    .line 246
    :cond_1
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-eqz v0, :cond_2

    .line 247
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {p3}, Lcom/flyersoft/books/PDFReader$XPos;->toPDFGlPos()Lcom/radaee/view/GLLayout$PDFPos;

    move-result-object p3

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/radaee/reader/GLView;->PDFSetZoom(IILcom/radaee/view/GLLayout$PDFPos;F)V

    return-void

    .line 249
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {p3}, Lcom/flyersoft/books/PDFReader$XPos;->toPDFPos()Lcom/radaee/view/PDFLayout$PDFPos;

    move-result-object p3

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/radaee/reader/PDFLayoutView;->PDFSetZoom(IILcom/radaee/view/PDFLayout$PDFPos;F)V

    return-void
.end method

.method public showAnnotSelect()V
    .locals 4

    .line 1153
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfSelectText(Z)V

    .line 1154
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->hPen:Landroid/widget/ImageView;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 1155
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->setHPenImage(Z)V

    .line 1156
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->hMore:Landroid/widget/TextView;

    new-instance v1, Lcom/flyersoft/books/PDFReader$15;

    invoke-direct {v1, p0}, Lcom/flyersoft/books/PDFReader$15;-><init>(Lcom/flyersoft/books/PDFReader;)V

    const-wide/16 v2, 0xa

    invoke-virtual {v0, v1, v2, v3}, Landroid/widget/TextView;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public viewLockSide(Z)V
    .locals 3

    .line 1214
    :try_start_0
    sput-boolean p1, Lcom/flyersoft/tools/A;->pdf_scoll_lock:Z

    .line 1215
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v0, :cond_0

    .line 1216
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->cbzView:Lorg/comic/CLayoutView;

    iput-boolean p1, v0, Lorg/comic/CLayoutView;->scoll_lock:Z

    goto :goto_0

    .line 1217
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->isDjvu:Z

    if-eqz v0, :cond_1

    .line 1218
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    iput-boolean p1, v0, Lorg/djvu/DLayoutView;->scoll_lock:Z

    goto :goto_0

    .line 1220
    :cond_1
    iget-boolean v0, p0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-eqz v0, :cond_2

    .line 1221
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iput-boolean p1, v0, Lcom/radaee/reader/GLView;->scoll_lock:Z

    goto :goto_0

    .line 1223
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iput-boolean p1, v0, Lcom/radaee/reader/PDFLayoutView;->scoll_lock:Z

    :goto_0
    const/4 v0, 0x0

    if-eqz p1, :cond_3

    .line 1226
    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->pdf_moving_locked:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    .line 1228
    :cond_3
    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0}, Lcom/flyersoft/books/PDFReader;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->pdf_moving_unlocked:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 1230
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-void
.end method

.method public zSetSelect(IIIIZZ)V
    .locals 19

    move-object/from16 v0, p0

    move/from16 v1, p5

    .line 384
    iget-boolean v2, v0, Lcom/flyersoft/books/PDFReader;->isCbz:Z

    if-eqz v2, :cond_0

    return-void

    .line 386
    :cond_0
    iget-boolean v2, v0, Lcom/flyersoft/books/PDFReader;->isDjvu:Z

    if-eqz v2, :cond_1

    .line 387
    iget-object v3, v0, Lcom/flyersoft/books/PDFReader;->djvuView:Lorg/djvu/DLayoutView;

    new-instance v10, Lcom/flyersoft/books/PDFReader$4;

    invoke-direct {v10, v0, v1}, Lcom/flyersoft/books/PDFReader$4;-><init>(Lcom/flyersoft/books/PDFReader;Z)V

    const/4 v4, 0x1

    move/from16 v6, p1

    move/from16 v7, p2

    move/from16 v8, p3

    move/from16 v9, p4

    move/from16 v5, p6

    invoke-virtual/range {v3 .. v10}, Lorg/djvu/DLayoutView;->zSetSelect(ZZIIIILorg/djvu/DLayoutView$OnAfterSelect;)V

    return-void

    .line 394
    :cond_1
    iget-boolean v2, v0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-eqz v2, :cond_2

    .line 395
    iget-object v2, v0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v11, v2, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    new-instance v2, Lcom/flyersoft/books/PDFReader$5;

    invoke-direct {v2, v0, v1}, Lcom/flyersoft/books/PDFReader$5;-><init>(Lcom/flyersoft/books/PDFReader;Z)V

    const/4 v12, 0x1

    move/from16 v14, p1

    move/from16 v15, p2

    move/from16 v16, p3

    move/from16 v17, p4

    move/from16 v13, p6

    move-object/from16 v18, v2

    invoke-virtual/range {v11 .. v18}, Lcom/radaee/reader/GLView;->zSetSelect(ZZIIIILcom/radaee/reader/GLView$OnAfterSelect;)V

    return-void

    .line 402
    :cond_2
    iget-object v11, v0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    new-instance v2, Lcom/flyersoft/books/PDFReader$6;

    invoke-direct {v2, v0, v1}, Lcom/flyersoft/books/PDFReader$6;-><init>(Lcom/flyersoft/books/PDFReader;Z)V

    const/4 v12, 0x1

    move/from16 v14, p1

    move/from16 v15, p2

    move/from16 v16, p3

    move/from16 v17, p4

    move/from16 v13, p6

    move-object/from16 v18, v2

    invoke-virtual/range {v11 .. v18}, Lcom/radaee/reader/PDFLayoutView;->zSetSelect(ZZIIIILcom/radaee/reader/PDFLayoutView$OnAfterSelect;)V

    return-void
.end method
