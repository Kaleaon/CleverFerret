.class Lcom/flyersoft/moonreaderp/ActivityTxt$201$9;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt$201;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$201;

.field final synthetic val$et:Landroid/widget/EditText;

.field final synthetic val$original:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt$201;Landroid/widget/EditText;Ljava/lang/String;)V
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

    .line 18976
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201$9;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$201;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201$9;->val$et:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201$9;->val$original:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 18978
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201$9;->val$et:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    .line 18979
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201$9;->val$original:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    return-void

    .line 18981
    :cond_0
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201$9;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$201;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {p2}, Lcom/flyersoft/books/PDFReader;->pdfSelectedAnnot()Lcom/radaee/pdf/Page$Annotation;

    move-result-object p2

    if-eqz p2, :cond_4

    .line 18983
    sget-boolean v0, Lcom/flyersoft/tools/A;->gl:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201$9;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$201;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-object v0, v0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0, p2}, Lcom/radaee/reader/GLView;->isAnnotFreeText(Lcom/radaee/pdf/Page$Annotation;)Z

    move-result v0

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201$9;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$201;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-object v0, v0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {v0, p2}, Lcom/radaee/reader/PDFLayoutView;->isAnnotFreeText(Lcom/radaee/pdf/Page$Annotation;)Z

    move-result v0

    :goto_0
    if-eqz v0, :cond_3

    .line 18985
    sget-boolean v0, Lcom/flyersoft/tools/A;->gl:Z

    if-eqz v0, :cond_2

    .line 18986
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201$9;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$201;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-object v0, v0, Lcom/flyersoft/books/PDFReader;->glView:Lcom/radaee/reader/PDFGLLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFGLLayoutView;->m_view:Lcom/radaee/reader/GLView;

    invoke-virtual {v0, p2, p1}, Lcom/radaee/reader/GLView;->updateFreeText(Lcom/radaee/pdf/Page$Annotation;Ljava/lang/String;)V

    goto :goto_1

    .line 18988
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201$9;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$201;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-object v0, v0, Lcom/flyersoft/books/PDFReader;->pdfView:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {v0, p2, p1}, Lcom/radaee/reader/PDFLayoutView;->updateFreeText(Lcom/radaee/pdf/Page$Annotation;Ljava/lang/String;)V

    .line 18989
    :goto_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$201$9;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$201;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt$201;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {p1}, Lcom/flyersoft/books/PDFReader;->pdfUpdateCurPage()V

    goto :goto_2

    .line 18991
    :cond_3
    invoke-virtual {p2, p1}, Lcom/radaee/pdf/Page$Annotation;->SetPopupText(Ljava/lang/String;)Z

    :goto_2
    const/4 p1, 0x1

    .line 18992
    sput-boolean p1, Lcom/flyersoft/tools/A;->pdfAnnotUpdated:Z

    return-void

    .line 18993
    :cond_4
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    if-lez p2, :cond_5

    .line 18994
    sput-object p1, Lcom/radaee/pdf/Global;->tmpNoteText:Ljava/lang/String;

    return-void

    :cond_5
    const/4 p1, 0x0

    .line 18996
    sput-object p1, Lcom/radaee/pdf/Global;->tmpNoteText:Ljava/lang/String;

    return-void
.end method
