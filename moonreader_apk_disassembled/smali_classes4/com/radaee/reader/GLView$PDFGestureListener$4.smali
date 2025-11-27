.class Lcom/radaee/reader/GLView$PDFGestureListener$4;
.super Ljava/lang/Object;
.source "GLView.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/reader/GLView$PDFGestureListener;->onEditAnnot()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/radaee/reader/GLView$PDFGestureListener;

.field final synthetic val$et:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/radaee/reader/GLView$PDFGestureListener;Landroid/widget/EditText;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 362
    iput-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener$4;->this$1:Lcom/radaee/reader/GLView$PDFGestureListener;

    iput-object p2, p0, Lcom/radaee/reader/GLView$PDFGestureListener$4;->val$et:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 364
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener$4;->val$et:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    .line 365
    iget-object p2, p0, Lcom/radaee/reader/GLView$PDFGestureListener$4;->this$1:Lcom/radaee/reader/GLView$PDFGestureListener;

    iget-object p2, p2, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object p2, p2, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/radaee/reader/GLView$PDFGestureListener$4;->this$1:Lcom/radaee/reader/GLView$PDFGestureListener;

    iget-object p2, p2, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object p2, p2, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p2}, Lcom/radaee/pdf/Page$Annotation;->GetEditText()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_0

    .line 366
    iget-object p2, p0, Lcom/radaee/reader/GLView$PDFGestureListener$4;->this$1:Lcom/radaee/reader/GLView$PDFGestureListener;

    iget-object p2, p2, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object p2, p2, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p2, p1}, Lcom/radaee/pdf/Page$Annotation;->SetEditText(Ljava/lang/String;)Z

    .line 368
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener$4;->this$1:Lcom/radaee/reader/GLView$PDFGestureListener;

    iget-object p1, p1, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {p1}, Lcom/radaee/reader/GLView;->PDFUpdateCurrPage()V

    .line 369
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener$4;->this$1:Lcom/radaee/reader/GLView$PDFGestureListener;

    iget-object p1, p1, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {p1}, Lcom/radaee/reader/GLView;->access$300(Lcom/radaee/reader/GLView;)Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 370
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener$4;->this$1:Lcom/radaee/reader/GLView$PDFGestureListener;

    iget-object p1, p1, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {p1}, Lcom/radaee/reader/GLView;->access$300(Lcom/radaee/reader/GLView;)Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    move-result-object p1

    iget-object p2, p0, Lcom/radaee/reader/GLView$PDFGestureListener$4;->this$1:Lcom/radaee/reader/GLView$PDFGestureListener;

    iget-object p2, p2, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object p2, p2, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    invoke-virtual {p2}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result p2

    invoke-interface {p1, p2}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    :cond_0
    return-void
.end method
