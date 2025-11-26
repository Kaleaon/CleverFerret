.class Lcom/radaee/reader/GLView$8;
.super Ljava/lang/Object;
.source "GLView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/reader/GLView;->PDFSetView(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/reader/GLView;

.field final synthetic val$style:I


# direct methods
.method constructor <init>(Lcom/radaee/reader/GLView;I)V
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

    .line 865
    iput-object p1, p0, Lcom/radaee/reader/GLView$8;->this$0:Lcom/radaee/reader/GLView;

    iput p2, p0, Lcom/radaee/reader/GLView$8;->val$style:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 14

    .line 870
    iget-object v0, p0, Lcom/radaee/reader/GLView$8;->this$0:Lcom/radaee/reader/GLView;

    iget v1, p0, Lcom/radaee/reader/GLView$8;->val$style:I

    invoke-static {v0, v1}, Lcom/radaee/reader/GLView;->access$1902(Lcom/radaee/reader/GLView;I)I

    .line 871
    iget-object v0, p0, Lcom/radaee/reader/GLView$8;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/radaee/reader/GLView$8;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v2, p0, Lcom/radaee/reader/GLView$8;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v2}, Lcom/radaee/reader/GLView;->access$1400(Lcom/radaee/reader/GLView;)I

    move-result v2

    shr-int/2addr v2, v1

    iget-object v3, p0, Lcom/radaee/reader/GLView$8;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v3}, Lcom/radaee/reader/GLView;->access$1500(Lcom/radaee/reader/GLView;)I

    move-result v3

    shr-int/2addr v3, v1

    invoke-virtual {v0, v2, v3}, Lcom/radaee/view/GLLayout;->vGetPos(II)Lcom/radaee/view/GLLayout$PDFPos;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 872
    :goto_0
    iget-object v2, p0, Lcom/radaee/reader/GLView$8;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v2}, Lcom/radaee/reader/GLView;->access$1900(Lcom/radaee/reader/GLView;)I

    move-result v2

    const/4 v3, 0x2

    const/4 v4, 0x3

    const/4 v5, 0x0

    packed-switch v2, :pswitch_data_0

    .line 921
    new-instance v6, Lcom/radaee/view/GLLayoutVert;

    iget-object v2, p0, Lcom/radaee/reader/GLView$8;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v2}, Lcom/radaee/reader/GLView;->getContext()Landroid/content/Context;

    move-result-object v2

    sget-boolean v3, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    invoke-direct {v6, v2, v5, v3}, Lcom/radaee/view/GLLayoutVert;-><init>(Landroid/content/Context;IZ)V

    goto/16 :goto_6

    .line 918
    :pswitch_0
    new-instance v6, Lcom/radaee/view/GLLayoutDualV;

    iget-object v2, p0, Lcom/radaee/reader/GLView$8;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v2}, Lcom/radaee/reader/GLView;->getContext()Landroid/content/Context;

    move-result-object v7

    sget-boolean v9, Lcom/radaee/pdf/Global;->rtol:Z

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v8, 0x0

    invoke-direct/range {v6 .. v11}, Lcom/radaee/view/GLLayoutDualV;-><init>(Landroid/content/Context;IZZZ)V

    goto/16 :goto_6

    .line 915
    :pswitch_1
    new-instance v7, Lcom/radaee/view/GLLayoutDualV;

    iget-object v2, p0, Lcom/radaee/reader/GLView$8;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v2}, Lcom/radaee/reader/GLView;->getContext()Landroid/content/Context;

    move-result-object v8

    sget-boolean v10, Lcom/radaee/pdf/Global;->rtol:Z

    const/4 v11, 0x1

    const/4 v12, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v7 .. v12}, Lcom/radaee/view/GLLayoutDualV;-><init>(Landroid/content/Context;IZZZ)V

    :goto_1
    move-object v6, v7

    goto/16 :goto_6

    .line 884
    :pswitch_2
    new-instance v6, Lcom/radaee/view/GLLayoutReflow;

    iget-object v2, p0, Lcom/radaee/reader/GLView$8;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v2}, Lcom/radaee/reader/GLView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v6, v2}, Lcom/radaee/view/GLLayoutReflow;-><init>(Landroid/content/Context;)V

    goto/16 :goto_6

    .line 889
    :pswitch_3
    iget-object v2, p0, Lcom/radaee/reader/GLView$8;->this$0:Lcom/radaee/reader/GLView;

    iget-object v2, v2, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v2}, Lcom/radaee/pdf/Document;->GetPageCount()I

    move-result v2

    .line 890
    new-array v11, v2, [Z

    .line 891
    aput-boolean v5, v11, v5

    const/4 v6, 0x1

    const/4 v7, 0x1

    :goto_2
    if-ge v6, v2, :cond_3

    .line 894
    iget-object v8, p0, Lcom/radaee/reader/GLView$8;->this$0:Lcom/radaee/reader/GLView;

    iget-object v8, v8, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v8, v6}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v8

    .line 895
    iget-object v9, p0, Lcom/radaee/reader/GLView$8;->this$0:Lcom/radaee/reader/GLView;

    iget-object v9, v9, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v9, v6}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v9

    div-float/2addr v8, v9

    const/high16 v9, 0x3f800000    # 1.0f

    cmpl-float v8, v8, v9

    if-lez v8, :cond_1

    .line 897
    aput-boolean v5, v11, v7

    goto :goto_3

    .line 899
    :cond_1
    iget-object v8, p0, Lcom/radaee/reader/GLView$8;->this$0:Lcom/radaee/reader/GLView;

    iget-object v8, v8, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    add-int/lit8 v10, v6, 0x1

    invoke-virtual {v8, v10}, Lcom/radaee/pdf/Document;->GetPageWidth(I)F

    move-result v8

    .line 900
    iget-object v12, p0, Lcom/radaee/reader/GLView$8;->this$0:Lcom/radaee/reader/GLView;

    iget-object v12, v12, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {v12, v10}, Lcom/radaee/pdf/Document;->GetPageHeight(I)F

    move-result v12

    div-float/2addr v8, v12

    cmpl-float v8, v8, v9

    if-lez v8, :cond_2

    .line 902
    aput-boolean v5, v11, v7

    goto :goto_3

    .line 904
    :cond_2
    aput-boolean v1, v11, v7

    move v6, v10

    :goto_3
    add-int/lit8 v7, v7, 0x1

    add-int/2addr v6, v1

    goto :goto_2

    .line 910
    :cond_3
    new-instance v6, Lcom/radaee/view/GLLayoutDual;

    iget-object v2, p0, Lcom/radaee/reader/GLView$8;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v2}, Lcom/radaee/reader/GLView;->getContext()Landroid/content/Context;

    move-result-object v7

    sget-boolean v2, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    if-eqz v2, :cond_4

    const/4 v9, 0x3

    goto :goto_4

    :cond_4
    const/4 v9, 0x2

    :goto_4
    const/4 v10, 0x0

    const/4 v12, 0x0

    const/4 v8, 0x0

    .line 911
    invoke-direct/range {v6 .. v12}, Lcom/radaee/view/GLLayoutDual;-><init>(Landroid/content/Context;IIZ[Z[Z)V

    goto :goto_6

    .line 880
    :pswitch_4
    new-instance v7, Lcom/radaee/view/GLLayoutDual;

    iget-object v2, p0, Lcom/radaee/reader/GLView$8;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v2}, Lcom/radaee/reader/GLView;->getContext()Landroid/content/Context;

    move-result-object v8

    sget-boolean v2, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    if-eqz v2, :cond_5

    const/4 v10, 0x2

    goto :goto_5

    :cond_5
    const/4 v10, 0x3

    .line 881
    :goto_5
    sget-boolean v11, Lcom/radaee/pdf/Global;->rtol:Z

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v7 .. v13}, Lcom/radaee/view/GLLayoutDual;-><init>(Landroid/content/Context;IIZ[Z[Z)V

    goto/16 :goto_1

    .line 877
    :pswitch_5
    new-instance v6, Lcom/radaee/view/GLLayoutCurl;

    iget-object v2, p0, Lcom/radaee/reader/GLView$8;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v2}, Lcom/radaee/reader/GLView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v6, v2}, Lcom/radaee/view/GLLayoutCurl;-><init>(Landroid/content/Context;)V

    goto :goto_6

    .line 874
    :pswitch_6
    new-instance v6, Lcom/radaee/view/GLLayoutHorz;

    iget-object v2, p0, Lcom/radaee/reader/GLView$8;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v2}, Lcom/radaee/reader/GLView;->getContext()Landroid/content/Context;

    move-result-object v2

    sget-boolean v3, Lcom/radaee/pdf/Global;->rtol:Z

    sget-boolean v5, Lcom/radaee/pdf/Global;->fit_different_page_size:Z

    invoke-direct {v6, v2, v3, v5}, Lcom/radaee/view/GLLayoutHorz;-><init>(Landroid/content/Context;ZZ)V

    .line 924
    :goto_6
    iget v2, p0, Lcom/radaee/reader/GLView$8;->val$style:I

    sput v2, Lcom/radaee/pdf/Global;->def_view:I

    .line 925
    iget-object v2, p0, Lcom/radaee/reader/GLView$8;->this$0:Lcom/radaee/reader/GLView;

    iget-object v2, v2, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    new-instance v3, Lcom/radaee/reader/GLView$8$1;

    invoke-direct {v3, p0}, Lcom/radaee/reader/GLView$8$1;-><init>(Lcom/radaee/reader/GLView$8;)V

    iget-object v5, p0, Lcom/radaee/reader/GLView$8;->this$0:Lcom/radaee/reader/GLView;

    .line 944
    invoke-static {v5}, Lcom/radaee/reader/GLView;->access$2000(Lcom/radaee/reader/GLView;)I

    move-result v5

    .line 925
    invoke-virtual {v6, v2, v3, v5}, Lcom/radaee/view/GLLayout;->vOpen(Lcom/radaee/pdf/Document;Lcom/radaee/view/GLLayout$GLListener;I)V

    .line 945
    iget-object v2, p0, Lcom/radaee/reader/GLView$8;->this$0:Lcom/radaee/reader/GLView;

    iget-object v2, v2, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    if-eqz v2, :cond_6

    iget-object v2, p0, Lcom/radaee/reader/GLView$8;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v2}, Lcom/radaee/reader/GLView;->access$1700(Lcom/radaee/reader/GLView;)Ljavax/microedition/khronos/opengles/GL10;

    move-result-object v2

    if-eqz v2, :cond_6

    .line 946
    iget-object v2, p0, Lcom/radaee/reader/GLView$8;->this$0:Lcom/radaee/reader/GLView;

    iget-object v2, v2, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v3, p0, Lcom/radaee/reader/GLView$8;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v3}, Lcom/radaee/reader/GLView;->access$1700(Lcom/radaee/reader/GLView;)Ljavax/microedition/khronos/opengles/GL10;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/radaee/view/GLLayout;->gl_close(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 947
    :cond_6
    iget-object v2, p0, Lcom/radaee/reader/GLView$8;->this$0:Lcom/radaee/reader/GLView;

    iput-object v6, v2, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    .line 948
    iget-object v2, p0, Lcom/radaee/reader/GLView$8;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v2}, Lcom/radaee/reader/GLView;->access$1700(Lcom/radaee/reader/GLView;)Ljavax/microedition/khronos/opengles/GL10;

    move-result-object v2

    if-eqz v2, :cond_a

    .line 949
    iget-object v2, p0, Lcom/radaee/reader/GLView$8;->this$0:Lcom/radaee/reader/GLView;

    iget-object v2, v2, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v3, p0, Lcom/radaee/reader/GLView$8;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v3}, Lcom/radaee/reader/GLView;->access$1700(Lcom/radaee/reader/GLView;)Ljavax/microedition/khronos/opengles/GL10;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/radaee/view/GLLayout;->gl_surface_create(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 950
    iget-object v2, p0, Lcom/radaee/reader/GLView$8;->this$0:Lcom/radaee/reader/GLView;

    iget-object v2, v2, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v3, p0, Lcom/radaee/reader/GLView$8;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v3}, Lcom/radaee/reader/GLView;->access$1400(Lcom/radaee/reader/GLView;)I

    move-result v3

    iget-object v5, p0, Lcom/radaee/reader/GLView$8;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v5}, Lcom/radaee/reader/GLView;->access$1500(Lcom/radaee/reader/GLView;)I

    move-result v5

    invoke-virtual {v2, v3, v5}, Lcom/radaee/view/GLLayout;->gl_resize(II)V

    if-eqz v0, :cond_9

    .line 952
    iget v2, p0, Lcom/radaee/reader/GLView$8;->val$style:I

    if-eq v2, v4, :cond_8

    const/4 v3, 0x4

    if-eq v2, v3, :cond_8

    const/4 v3, 0x6

    if-ne v2, v3, :cond_7

    goto :goto_7

    .line 955
    :cond_7
    iget-object v2, p0, Lcom/radaee/reader/GLView$8;->this$0:Lcom/radaee/reader/GLView;

    iget-object v2, v2, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v3, p0, Lcom/radaee/reader/GLView$8;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v3}, Lcom/radaee/reader/GLView;->access$1400(Lcom/radaee/reader/GLView;)I

    move-result v3

    shr-int/2addr v3, v1

    iget-object v4, p0, Lcom/radaee/reader/GLView$8;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v4}, Lcom/radaee/reader/GLView;->access$1500(Lcom/radaee/reader/GLView;)I

    move-result v4

    shr-int/lit8 v1, v4, 0x1

    invoke-virtual {v2, v3, v1, v0}, Lcom/radaee/view/GLLayout;->vSetPos(IILcom/radaee/view/GLLayout$PDFPos;)V

    .line 956
    iget-object v0, p0, Lcom/radaee/reader/GLView$8;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v0}, Lcom/radaee/view/GLLayout;->gl_move_end()V

    goto :goto_8

    .line 953
    :cond_8
    :goto_7
    iget-object v1, p0, Lcom/radaee/reader/GLView$8;->this$0:Lcom/radaee/reader/GLView;

    iget-object v1, v1, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget v0, v0, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    invoke-virtual {v1, v0}, Lcom/radaee/view/GLLayout;->vGotoPage(I)V

    .line 959
    :cond_9
    :goto_8
    iget-object v0, p0, Lcom/radaee/reader/GLView$8;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v0}, Lcom/radaee/reader/GLView;->requestRender()V

    .line 961
    :cond_a
    iget-object v0, p0, Lcom/radaee/reader/GLView$8;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v0}, Lcom/radaee/reader/GLView;->access$2200(Lcom/radaee/reader/GLView;)V

    return-void

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
