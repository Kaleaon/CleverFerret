.class Lcom/radaee/reader/GLView$7;
.super Ljava/lang/Object;
.source "GLView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/reader/GLView;->PDFRestoreView()V
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

    .line 760
    iput-object p1, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 13

    .line 764
    iget-object v0, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v0}, Lcom/radaee/reader/GLView;->access$1900(Lcom/radaee/reader/GLView;)I

    move-result v0

    const/4 v1, 0x2

    const/4 v2, 0x3

    const/4 v3, 0x0

    const/4 v4, 0x1

    packed-switch v0, :pswitch_data_0

    .line 813
    new-instance v5, Lcom/radaee/view/GLLayoutVert;

    iget-object v0, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-boolean v1, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    invoke-direct {v5, v0, v3, v1}, Lcom/radaee/view/GLLayoutVert;-><init>(Landroid/content/Context;IZ)V

    goto/16 :goto_5

    .line 810
    :pswitch_0
    new-instance v5, Lcom/radaee/view/GLLayoutDualV;

    iget-object v0, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->getContext()Landroid/content/Context;

    move-result-object v6

    sget-boolean v8, Lcom/radaee/pdf/Global;->rtol:Z

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v7, 0x0

    invoke-direct/range {v5 .. v10}, Lcom/radaee/view/GLLayoutDualV;-><init>(Landroid/content/Context;IZZZ)V

    goto/16 :goto_5

    .line 807
    :pswitch_1
    new-instance v6, Lcom/radaee/view/GLLayoutDualV;

    iget-object v0, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->getContext()Landroid/content/Context;

    move-result-object v7

    sget-boolean v9, Lcom/radaee/pdf/Global;->rtol:Z

    const/4 v10, 0x1

    const/4 v11, 0x0

    const/4 v8, 0x0

    invoke-direct/range {v6 .. v11}, Lcom/radaee/view/GLLayoutDualV;-><init>(Landroid/content/Context;IZZZ)V

    :goto_0
    move-object v5, v6

    goto/16 :goto_5

    .line 776
    :pswitch_2
    new-instance v5, Lcom/radaee/view/GLLayoutReflow;

    iget-object v0, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {v5, v0}, Lcom/radaee/view/GLLayoutReflow;-><init>(Landroid/content/Context;)V

    goto/16 :goto_5

    .line 781
    :pswitch_3
    iget-object v0, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v0}, Lcom/radaee/pdf/Document;->GetPageCount()I

    move-result v0

    .line 782
    new-array v10, v0, [Z

    .line 783
    aput-boolean v3, v10, v3

    const/4 v5, 0x1

    const/4 v6, 0x1

    :goto_1
    if-ge v5, v0, :cond_2

    .line 786
    iget-object v7, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    iget-object v7, v7, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v7, v5}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v7

    .line 787
    iget-object v8, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    iget-object v8, v8, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v8, v5}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v8

    div-float/2addr v7, v8

    const/high16 v8, 0x3f800000    # 1.0f

    cmpl-float v7, v7, v8

    if-lez v7, :cond_0

    .line 789
    aput-boolean v3, v10, v6

    goto :goto_2

    .line 791
    :cond_0
    iget-object v7, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    iget-object v7, v7, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    add-int/lit8 v9, v5, 0x1

    invoke-virtual {v7, v9}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v7

    .line 792
    iget-object v11, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    iget-object v11, v11, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v11, v9}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v11

    div-float/2addr v7, v11

    cmpl-float v7, v7, v8

    if-lez v7, :cond_1

    .line 794
    aput-boolean v3, v10, v6

    goto :goto_2

    .line 796
    :cond_1
    aput-boolean v4, v10, v6

    move v5, v9

    :goto_2
    add-int/lit8 v6, v6, 0x1

    add-int/2addr v5, v4

    goto :goto_1

    .line 802
    :cond_2
    new-instance v5, Lcom/radaee/view/GLLayoutDual;

    iget-object v0, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->getContext()Landroid/content/Context;

    move-result-object v6

    sget-boolean v0, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    if-eqz v0, :cond_3

    const/4 v8, 0x3

    goto :goto_3

    :cond_3
    const/4 v8, 0x2

    :goto_3
    const/4 v9, 0x0

    const/4 v11, 0x0

    const/4 v7, 0x0

    .line 803
    invoke-direct/range {v5 .. v11}, Lcom/radaee/view/GLLayoutDual;-><init>(Landroid/content/Context;IIZ[Z[Z)V

    goto :goto_5

    .line 772
    :pswitch_4
    new-instance v6, Lcom/radaee/view/GLLayoutDual;

    iget-object v0, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->getContext()Landroid/content/Context;

    move-result-object v7

    sget-boolean v0, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    if-eqz v0, :cond_4

    const/4 v9, 0x2

    goto :goto_4

    :cond_4
    const/4 v9, 0x3

    :goto_4
    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v8, 0x0

    const/4 v10, 0x0

    .line 773
    invoke-direct/range {v6 .. v12}, Lcom/radaee/view/GLLayoutDual;-><init>(Landroid/content/Context;IIZ[Z[Z)V

    goto/16 :goto_0

    .line 769
    :pswitch_5
    new-instance v5, Lcom/radaee/view/GLLayoutCurl;

    iget-object v0, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {v5, v0}, Lcom/radaee/view/GLLayoutCurl;-><init>(Landroid/content/Context;)V

    goto :goto_5

    .line 766
    :pswitch_6
    new-instance v5, Lcom/radaee/view/GLLayoutHorz;

    iget-object v0, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-boolean v1, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    invoke-direct {v5, v0, v3, v1}, Lcom/radaee/view/GLLayoutHorz;-><init>(Landroid/content/Context;ZZ)V

    .line 816
    :goto_5
    iget-object v0, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    new-instance v1, Lcom/radaee/reader/GLView$7$1;

    invoke-direct {v1, p0}, Lcom/radaee/reader/GLView$7$1;-><init>(Lcom/radaee/reader/GLView$7;)V

    iget-object v3, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    .line 835
    invoke-static {v3}, Lcom/radaee/reader/GLView;->access$2000(Lcom/radaee/reader/GLView;)I

    move-result v3

    .line 816
    invoke-virtual {v5, v0, v1, v3}, Lcom/radaee/view/GLLayout;->vOpen(Lcom/radaee/pdf/Document;Lcom/radaee/view/GLLayout$GLListener;I)V

    .line 836
    iget-object v0, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v0}, Lcom/radaee/reader/GLView;->access$1700(Lcom/radaee/reader/GLView;)Ljavax/microedition/khronos/opengles/GL10;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 837
    iget-object v0, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v1, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v1}, Lcom/radaee/reader/GLView;->access$1700(Lcom/radaee/reader/GLView;)Ljavax/microedition/khronos/opengles/GL10;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/radaee/view/GLLayout;->gl_close(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 838
    :cond_5
    iget-object v0, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    iput-object v5, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    .line 839
    iget-object v0, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v0}, Lcom/radaee/reader/GLView;->access$1700(Lcom/radaee/reader/GLView;)Ljavax/microedition/khronos/opengles/GL10;

    move-result-object v0

    if-eqz v0, :cond_a

    .line 840
    iget-object v0, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v1, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v1}, Lcom/radaee/reader/GLView;->access$1700(Lcom/radaee/reader/GLView;)Ljavax/microedition/khronos/opengles/GL10;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/radaee/view/GLLayout;->gl_surface_create(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 841
    iget-object v0, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v1, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v1}, Lcom/radaee/reader/GLView;->access$1400(Lcom/radaee/reader/GLView;)I

    move-result v1

    iget-object v3, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v3}, Lcom/radaee/reader/GLView;->access$1500(Lcom/radaee/reader/GLView;)I

    move-result v3

    invoke-virtual {v0, v1, v3}, Lcom/radaee/view/GLLayout;->gl_resize(II)V

    .line 842
    iget-object v0, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v0}, Lcom/radaee/reader/GLView;->access$2100(Lcom/radaee/reader/GLView;)Lcom/radaee/view/GLLayout$PDFPos;

    move-result-object v0

    if-eqz v0, :cond_9

    .line 843
    iget-object v0, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v0}, Lcom/radaee/reader/GLView;->access$2100(Lcom/radaee/reader/GLView;)Lcom/radaee/view/GLLayout$PDFPos;

    move-result-object v0

    iget v0, v0, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    iget-object v1, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    iget-object v1, v1, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v1}, Lcom/radaee/pdf/Document;->GetPageCount()I

    move-result v1

    if-lt v0, v1, :cond_6

    .line 844
    iget-object v0, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v0}, Lcom/radaee/reader/GLView;->access$2100(Lcom/radaee/reader/GLView;)Lcom/radaee/view/GLLayout$PDFPos;

    move-result-object v0

    iget-object v1, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    iget-object v1, v1, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v1}, Lcom/radaee/pdf/Document;->GetPageCount()I

    move-result v1

    sub-int/2addr v1, v4

    iput v1, v0, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    .line 845
    :cond_6
    iget-object v0, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v0}, Lcom/radaee/reader/GLView;->access$1900(Lcom/radaee/reader/GLView;)I

    move-result v0

    if-eq v0, v2, :cond_8

    iget-object v0, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v0}, Lcom/radaee/reader/GLView;->access$1900(Lcom/radaee/reader/GLView;)I

    move-result v0

    const/4 v1, 0x4

    if-eq v0, v1, :cond_8

    iget-object v0, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v0}, Lcom/radaee/reader/GLView;->access$1900(Lcom/radaee/reader/GLView;)I

    move-result v0

    const/4 v1, 0x6

    if-ne v0, v1, :cond_7

    goto :goto_6

    .line 848
    :cond_7
    iget-object v0, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v1, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v1}, Lcom/radaee/reader/GLView;->access$1400(Lcom/radaee/reader/GLView;)I

    move-result v1

    shr-int/2addr v1, v4

    iget-object v2, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v2}, Lcom/radaee/reader/GLView;->access$1500(Lcom/radaee/reader/GLView;)I

    move-result v2

    shr-int/2addr v2, v4

    iget-object v3, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v3}, Lcom/radaee/reader/GLView;->access$2100(Lcom/radaee/reader/GLView;)Lcom/radaee/view/GLLayout$PDFPos;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/radaee/view/GLLayout;->vSetPos(IILcom/radaee/view/GLLayout$PDFPos;)V

    .line 849
    iget-object v0, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v0}, Lcom/radaee/view/GLLayout;->gl_move_end()V

    goto :goto_7

    .line 846
    :cond_8
    :goto_6
    iget-object v0, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v1, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v1}, Lcom/radaee/reader/GLView;->access$2100(Lcom/radaee/reader/GLView;)Lcom/radaee/view/GLLayout$PDFPos;

    move-result-object v1

    iget v1, v1, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    invoke-virtual {v0, v1}, Lcom/radaee/view/GLLayout;->vGotoPage(I)V

    .line 852
    :cond_9
    :goto_7
    iget-object v0, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->requestRender()V

    .line 854
    :cond_a
    iget-object v0, p0, Lcom/radaee/reader/GLView$7;->this$0:Lcom/radaee/reader/GLView;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/radaee/reader/GLView;->access$2102(Lcom/radaee/reader/GLView;Lcom/radaee/view/GLLayout$PDFPos;)Lcom/radaee/view/GLLayout$PDFPos;

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_3
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
