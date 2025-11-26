.class Lcom/flyersoft/moonreaderp/ActivityTxt$16;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->initCurl3dRender()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 2215
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$16;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 2218
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$16;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v0}, Lcom/flyersoft/books/PDFReader;->requestLayout()V

    .line 2219
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$16;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-object v0, v0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$16;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-object v0, v0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    if-eqz v0, :cond_0

    .line 2220
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$16;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-object v0, v0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->requestRender()V

    :cond_0
    return-void
.end method
