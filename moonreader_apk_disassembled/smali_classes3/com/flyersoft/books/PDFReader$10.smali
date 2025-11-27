.class Lcom/flyersoft/books/PDFReader$10;
.super Ljava/lang/Object;
.source "PDFReader.java"

# interfaces
.implements Lcom/flyersoft/tools/T$FileResultOK;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/books/PDFReader;->pdfAddNoteOrImageOrFreeText(Landroid/view/MotionEvent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/books/PDFReader;

.field final synthetic val$event2:Landroid/view/MotionEvent;

.field final synthetic val$saveTo:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/books/PDFReader;Landroid/view/MotionEvent;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 817
    iput-object p1, p0, Lcom/flyersoft/books/PDFReader$10;->this$0:Lcom/flyersoft/books/PDFReader;

    iput-object p2, p0, Lcom/flyersoft/books/PDFReader$10;->val$event2:Landroid/view/MotionEvent;

    iput-object p3, p0, Lcom/flyersoft/books/PDFReader$10;->val$saveTo:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isResultOk(Ljava/lang/String;)Z
    .locals 4

    .line 820
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_2

    .line 821
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader$10;->this$0:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v0}, Lcom/flyersoft/books/PDFReader;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v2, v1, v1}, Lcom/flyersoft/tools/A;->getFileBitmap(Landroid/content/Context;Ljava/io/File;II)Landroid/graphics/Bitmap;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 822
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    if-lez v0, :cond_1

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    if-lez v0, :cond_1

    .line 823
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader$10;->this$0:Lcom/flyersoft/books/PDFReader;

    iget-boolean v0, v0, Lcom/flyersoft/books/PDFReader;->gl:Z

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/books/PDFReader$10;->this$0:Lcom/flyersoft/books/PDFReader;

    iget-object v0, v0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iget-object v3, p0, Lcom/flyersoft/books/PDFReader$10;->val$event2:Landroid/view/MotionEvent;

    invoke-virtual {v0, v2, v3, p1}, Lcom/radaee/reader/GLView;->PDFSetStamp(ILandroid/view/MotionEvent;Landroid/graphics/Bitmap;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 824
    sput-boolean v2, Lcom/flyersoft/tools/A;->pdfAnnotUpdated:Z

    .line 825
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/PDFReader$10;->this$0:Lcom/flyersoft/books/PDFReader;

    iget-boolean v0, v0, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/flyersoft/books/PDFReader$10;->this$0:Lcom/flyersoft/books/PDFReader;

    iget-object v0, v0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iget-object v3, p0, Lcom/flyersoft/books/PDFReader$10;->val$event2:Landroid/view/MotionEvent;

    invoke-virtual {v0, v2, v3, p1}, Lcom/radaee/reader/PDFLayoutView;->PDFSetStamp(ILandroid/view/MotionEvent;Landroid/graphics/Bitmap;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 826
    sput-boolean v2, Lcom/flyersoft/tools/A;->pdfAnnotUpdated:Z

    .line 828
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader$10;->val$saveTo:Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->deleteFile(Ljava/lang/String;)Z

    :cond_2
    return v1
.end method
