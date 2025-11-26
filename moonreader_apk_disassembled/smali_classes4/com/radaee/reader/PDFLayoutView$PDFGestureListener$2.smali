.class Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$2;
.super Ljava/lang/Object;
.source "PDFLayoutView.java"

# interfaces
.implements Landroid/widget/PopupWindow$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->hasAnnotTap(Landroid/view/MotionEvent;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;


# direct methods
.method constructor <init>(Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 297
    iput-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$2;->this$1:Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss()V
    .locals 2

    .line 300
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$2;->this$1:Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {v0}, Lcom/radaee/reader/PDFLayoutView;->access$800(Lcom/radaee/reader/PDFLayoutView;)I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_2

    .line 302
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$2;->this$1:Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {v0}, Lcom/radaee/reader/PDFLayoutView;->access$700(Lcom/radaee/reader/PDFLayoutView;)I

    move-result v0

    if-ltz v0, :cond_1

    .line 303
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$2;->this$1:Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$2;->this$1:Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;

    iget-object v1, v1, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {v1}, Lcom/radaee/reader/PDFLayoutView;->access$700(Lcom/radaee/reader/PDFLayoutView;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/radaee/pdf/Page$Annotation;->SetComboItem(I)Z

    .line 304
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$2;->this$1:Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-static {}, Lcom/radaee/util/CommonUtil;->getCurrentDate()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/radaee/pdf/Page$Annotation;->SetModifyDate(Ljava/lang/String;)Z

    .line 305
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$2;->this$1:Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    if-eqz v0, :cond_0

    sget-boolean v0, Lcom/radaee/pdf/Global;->sExecuteAnnotJS:Z

    if-eqz v0, :cond_0

    .line 306
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$2;->this$1:Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {v0}, Lcom/radaee/reader/PDFLayoutView;->access$400(Lcom/radaee/reader/PDFLayoutView;)Z

    .line 307
    :cond_0
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$2;->this$1:Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$2;->this$1:Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;

    iget-object v1, v1, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v1, v1, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    invoke-virtual {v0, v1}, Lcom/radaee/view/PDFLayout;->vRenderSync(Lcom/radaee/view/VPage;)V

    .line 308
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$2;->this$1:Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {v0}, Lcom/radaee/reader/PDFLayoutView;->access$200(Lcom/radaee/reader/PDFLayoutView;)Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 309
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$2;->this$1:Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {v0}, Lcom/radaee/reader/PDFLayoutView;->access$200(Lcom/radaee/reader/PDFLayoutView;)Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    move-result-object v0

    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$2;->this$1:Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;

    iget-object v1, v1, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v1, v1, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    invoke-virtual {v1}, Lcom/radaee/view/VPage;->GetPageNo()I

    move-result v1

    invoke-interface {v0, v1}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    .line 311
    :cond_1
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$2;->this$1:Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    const/4 v1, -0x1

    invoke-static {v0, v1}, Lcom/radaee/reader/PDFLayoutView;->access$702(Lcom/radaee/reader/PDFLayoutView;I)I

    .line 312
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$2;->this$1:Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {v0}, Lcom/radaee/reader/PDFLayoutView;->PDFEndAnnot()V

    .line 314
    :cond_2
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$2;->this$1:Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/radaee/reader/PDFLayoutView;->access$802(Lcom/radaee/reader/PDFLayoutView;I)I

    return-void
.end method
