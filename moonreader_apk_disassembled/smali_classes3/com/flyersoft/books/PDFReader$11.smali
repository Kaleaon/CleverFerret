.class Lcom/flyersoft/books/PDFReader$11;
.super Ljava/lang/Object;
.source "PDFReader.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


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

.field final synthetic val$et:Landroid/widget/EditText;

.field final synthetic val$event2:Landroid/view/MotionEvent;

.field final synthetic val$status:I


# direct methods
.method constructor <init>(Lcom/flyersoft/books/PDFReader;Landroid/widget/EditText;ILandroid/view/MotionEvent;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
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

    .line 838
    iput-object p1, p0, Lcom/flyersoft/books/PDFReader$11;->this$0:Lcom/flyersoft/books/PDFReader;

    iput-object p2, p0, Lcom/flyersoft/books/PDFReader$11;->val$et:Landroid/widget/EditText;

    iput p3, p0, Lcom/flyersoft/books/PDFReader$11;->val$status:I

    iput-object p4, p0, Lcom/flyersoft/books/PDFReader$11;->val$event2:Landroid/view/MotionEvent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 840
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader$11;->val$et:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    if-lez p1, :cond_3

    .line 841
    iget p1, p0, Lcom/flyersoft/books/PDFReader$11;->val$status:I

    const/4 p2, 0x6

    const/4 v0, 0x1

    if-ne p1, p2, :cond_1

    .line 842
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader$11;->this$0:Lcom/flyersoft/books/PDFReader;

    iget-boolean p1, p1, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/flyersoft/books/PDFReader$11;->this$0:Lcom/flyersoft/books/PDFReader;

    iget-object p1, p1, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object p1, p1, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iget-object p2, p0, Lcom/flyersoft/books/PDFReader$11;->val$event2:Landroid/view/MotionEvent;

    iget-object v1, p0, Lcom/flyersoft/books/PDFReader$11;->val$et:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, p2, v1}, Lcom/radaee/reader/GLView;->addNoteAtPoint(Landroid/view/MotionEvent;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 843
    sput-boolean v0, Lcom/flyersoft/tools/A;->pdfAnnotUpdated:Z

    .line 844
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader$11;->this$0:Lcom/flyersoft/books/PDFReader;

    iget-boolean p1, p1, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/flyersoft/books/PDFReader$11;->this$0:Lcom/flyersoft/books/PDFReader;

    iget-object p1, p1, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iget-object p2, p0, Lcom/flyersoft/books/PDFReader$11;->val$event2:Landroid/view/MotionEvent;

    iget-object v1, p0, Lcom/flyersoft/books/PDFReader$11;->val$et:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, p2, v1}, Lcom/radaee/reader/PDFLayoutView;->addNoteAtPoint(Landroid/view/MotionEvent;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 845
    sput-boolean v0, Lcom/flyersoft/tools/A;->pdfAnnotUpdated:Z

    .line 847
    :cond_1
    iget p1, p0, Lcom/flyersoft/books/PDFReader$11;->val$status:I

    const/16 p2, 0xc8

    if-ne p1, p2, :cond_3

    .line 848
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader$11;->this$0:Lcom/flyersoft/books/PDFReader;

    iget-boolean p1, p1, Lcom/flyersoft/books/PDFReader;->gl:Z

    if-eqz p1, :cond_2

    .line 849
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader$11;->this$0:Lcom/flyersoft/books/PDFReader;

    iget-object p1, p1, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object p1, p1, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    iget-object p2, p0, Lcom/flyersoft/books/PDFReader$11;->val$event2:Landroid/view/MotionEvent;

    iget-object v1, p0, Lcom/flyersoft/books/PDFReader$11;->val$et:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, p2, v1}, Lcom/radaee/reader/GLView;->addFreeText(Landroid/view/MotionEvent;Ljava/lang/String;)V

    goto :goto_0

    .line 851
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/books/PDFReader$11;->this$0:Lcom/flyersoft/books/PDFReader;

    iget-object p1, p1, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    iget-object p2, p0, Lcom/flyersoft/books/PDFReader$11;->val$event2:Landroid/view/MotionEvent;

    iget-object v1, p0, Lcom/flyersoft/books/PDFReader$11;->val$et:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, p2, v1}, Lcom/radaee/reader/PDFLayoutView;->addFreeText(Landroid/view/MotionEvent;Ljava/lang/String;)V

    .line 852
    :goto_0
    sput-boolean v0, Lcom/flyersoft/tools/A;->pdfAnnotUpdated:Z

    :cond_3
    return-void
.end method
