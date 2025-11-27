.class Lcom/radaee/reader/GLView$9;
.super Ljava/lang/Object;
.source "GLView.java"

# interfaces
.implements Landroid/widget/PopupWindow$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/reader/GLView;->onTouchEditbox(Landroid/view/MotionEvent;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/reader/GLView;


# direct methods
.method constructor <init>(Lcom/radaee/reader/GLView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1022
    iput-object p1, p0, Lcom/radaee/reader/GLView$9;->this$0:Lcom/radaee/reader/GLView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss()V
    .locals 3

    .line 1025
    iget-object v0, p0, Lcom/radaee/reader/GLView$9;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    if-eqz v0, :cond_2

    .line 1026
    iget-object v0, p0, Lcom/radaee/reader/GLView$9;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    iget-object v1, p0, Lcom/radaee/reader/GLView$9;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v1}, Lcom/radaee/reader/GLView;->access$2300(Lcom/radaee/reader/GLView;)Lcom/radaee/annotui/UIAnnotPopEdit;

    move-result-object v1

    invoke-virtual {v1}, Lcom/radaee/annotui/UIAnnotPopEdit;->getEditText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/radaee/pdf/Page$Annotation;->SetEditText(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1027
    const-string v0, "RDERR"

    const-string v1, "set EditText failed."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1029
    :cond_0
    iget-object v0, p0, Lcom/radaee/reader/GLView$9;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-static {}, Lcom/radaee/util/CommonUtil;->getCurrentDate()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/radaee/pdf/Page$Annotation;->SetModifyDate(Ljava/lang/String;)Z

    .line 1032
    iget-object v0, p0, Lcom/radaee/reader/GLView$9;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v1, p0, Lcom/radaee/reader/GLView$9;->this$0:Lcom/radaee/reader/GLView;

    iget-object v1, v1, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    iget-object v2, p0, Lcom/radaee/reader/GLView$9;->this$0:Lcom/radaee/reader/GLView;

    iget-object v2, v2, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v2}, Lcom/radaee/pdf/Page$Annotation;->GetRect()[F

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/radaee/view/GLLayout;->gl_render(Lcom/radaee/view/GLPage;[F)V

    .line 1033
    iget-object v0, p0, Lcom/radaee/reader/GLView$9;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->requestRender()V

    .line 1034
    iget-object v0, p0, Lcom/radaee/reader/GLView$9;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v0}, Lcom/radaee/reader/GLView;->access$300(Lcom/radaee/reader/GLView;)Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 1035
    iget-object v0, p0, Lcom/radaee/reader/GLView$9;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v0}, Lcom/radaee/reader/GLView;->access$300(Lcom/radaee/reader/GLView;)Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    move-result-object v0

    iget-object v1, p0, Lcom/radaee/reader/GLView$9;->this$0:Lcom/radaee/reader/GLView;

    iget-object v1, v1, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    invoke-virtual {v1}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result v1

    invoke-interface {v0, v1}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    .line 1036
    :cond_1
    iget-object v0, p0, Lcom/radaee/reader/GLView$9;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->PDFEndAnnot()V

    .line 1037
    iget-object v0, p0, Lcom/radaee/reader/GLView$9;->this$0:Lcom/radaee/reader/GLView;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/radaee/reader/GLView;->access$902(Lcom/radaee/reader/GLView;I)I

    :cond_2
    return-void
.end method
