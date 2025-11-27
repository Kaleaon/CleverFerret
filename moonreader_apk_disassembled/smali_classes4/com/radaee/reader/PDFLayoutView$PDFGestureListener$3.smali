.class Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$3;
.super Ljava/lang/Object;
.source "PDFLayoutView.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->onEditAnnot()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;

.field final synthetic val$et:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;Landroid/widget/EditText;)V
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

    .line 351
    iput-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$3;->this$1:Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;

    iput-object p2, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$3;->val$et:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 353
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$3;->val$et:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    .line 354
    iget-object p2, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$3;->this$1:Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;

    iget-object p2, p2, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object p2, p2, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$3;->this$1:Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;

    iget-object p2, p2, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object p2, p2, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p2}, Lcom/radaee/pdf/Page$Annotation;->GetEditText()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_0

    .line 355
    iget-object p2, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$3;->this$1:Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;

    iget-object p2, p2, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object p2, p2, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p2, p1}, Lcom/radaee/pdf/Page$Annotation;->SetEditText(Ljava/lang/String;)Z

    .line 357
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$3;->this$1:Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;

    iget-object p1, p1, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {p1}, Lcom/radaee/reader/PDFLayoutView;->PDFUpdateCurrPage()V

    .line 358
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$3;->this$1:Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;

    iget-object p1, p1, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {p1}, Lcom/radaee/reader/PDFLayoutView;->access$200(Lcom/radaee/reader/PDFLayoutView;)Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 359
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$3;->this$1:Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;

    iget-object p1, p1, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {p1}, Lcom/radaee/reader/PDFLayoutView;->access$200(Lcom/radaee/reader/PDFLayoutView;)Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    move-result-object p1

    iget-object p2, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$3;->this$1:Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;

    iget-object p2, p2, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object p2, p2, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    invoke-virtual {p2}, Lcom/radaee/view/VPage;->GetPageNo()I

    move-result p2

    invoke-interface {p1, p2}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    :cond_0
    return-void
.end method
