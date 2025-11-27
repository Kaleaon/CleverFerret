.class Lcom/radaee/reader/GLView$PDFGestureListener;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "GLView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/radaee/reader/GLView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PDFGestureListener"
.end annotation


# instance fields
.field mCheckedItems:[Z

.field final synthetic this$0:Lcom/radaee/reader/GLView;


# direct methods
.method private constructor <init>(Lcom/radaee/reader/GLView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            null
        }
    .end annotation

    .line 134
    iput-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/radaee/reader/GLView;Lcom/radaee/reader/GLView$1;)V
    .locals 0

    .line 134
    invoke-direct {p0, p1}, Lcom/radaee/reader/GLView$PDFGestureListener;-><init>(Lcom/radaee/reader/GLView;)V

    return-void
.end method

.method static synthetic access$1200(Lcom/radaee/reader/GLView$PDFGestureListener;Landroid/graphics/Bitmap;Z)V
    .locals 0

    .line 134
    invoke-direct {p0, p1, p2}, Lcom/radaee/reader/GLView$PDFGestureListener;->updateSignature(Landroid/graphics/Bitmap;Z)V

    return-void
.end method

.method private handleSignatureField()V
    .locals 3

    .line 450
    iget-object v0, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-static {v0}, Lcom/radaee/util/CommonUtil;->isFieldGraphicallySigned(Lcom/radaee/pdf/Page$Annotation;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 451
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v1}, Lcom/radaee/reader/GLView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget v1, Lcom/radaee/viewlib/R$string;->warning:I

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    sget v1, Lcom/radaee/viewlib/R$string;->delete_signature_message:I

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    sget v1, Lcom/radaee/viewlib/R$string;->yes:I

    new-instance v2, Lcom/radaee/reader/GLView$PDFGestureListener$9;

    invoke-direct {v2, p0}, Lcom/radaee/reader/GLView$PDFGestureListener$9;-><init>(Lcom/radaee/reader/GLView$PDFGestureListener;)V

    .line 452
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    sget v1, Lcom/radaee/viewlib/R$string;->no:I

    const/4 v2, 0x0

    .line 458
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 459
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void

    .line 461
    :cond_0
    new-instance v0, Lcom/radaee/reader/GLView$PDFGestureListener$10;

    invoke-direct {v0, p0}, Lcom/radaee/reader/GLView$PDFGestureListener$10;-><init>(Lcom/radaee/reader/GLView$PDFGestureListener;)V

    invoke-static {v0}, Lcom/radaee/util/CaptureSignature$CaptureSignatureListener;->setListener(Lcom/radaee/util/CaptureSignature$CaptureSignatureListener$OnSignatureCapturedListener;)V

    .line 467
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v1}, Lcom/radaee/reader/GLView;->getContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/radaee/util/CaptureSignature;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 468
    const-string v1, "SIGNATURE_PAD_DESCR"

    sget-object v2, Lcom/radaee/pdf/Global;->sSignPadDescr:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 469
    const-string v1, "FIT_SIGNATURE_BITMAP"

    sget-boolean v2, Lcom/radaee/pdf/Global;->sFitSignatureToField:Z

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 470
    iget-object v1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v1}, Lcom/radaee/reader/GLView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method private hasAnnotTap(Landroid/view/MotionEvent;)Z
    .locals 11

    .line 215
    iget-object v0, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-boolean v0, v0, Lcom/radaee/reader/GLView;->disableAnnotCheck:Z

    const/4 v1, 0x0

    if-nez v0, :cond_15

    iget-object v0, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    if-nez v0, :cond_0

    goto/16 :goto_6

    .line 218
    :cond_0
    iget-object v0, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object v2, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    float-to-int v3, v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    float-to-int p1, p1

    invoke-virtual {v2, v3, p1}, Lcom/radaee/view/GLLayout;->vGetPos(II)Lcom/radaee/view/GLLayout$PDFPos;

    move-result-object p1

    iput-object p1, v0, Lcom/radaee/reader/GLView;->m_annot_pos:Lcom/radaee/view/GLLayout$PDFPos;

    .line 219
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, p1, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    iget-object v2, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object v2, v2, Lcom/radaee/reader/GLView;->m_annot_pos:Lcom/radaee/view/GLLayout$PDFPos;

    iget v2, v2, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    invoke-virtual {v0, v2}, Lcom/radaee/view/GLLayout;->vGetPage(I)Lcom/radaee/view/GLPage;

    move-result-object v0

    iput-object v0, p1, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    .line 220
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object p1, p1, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    iget-object v0, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    invoke-virtual {v0}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object p1

    const/4 v0, 0x0

    if-nez p1, :cond_1

    .line 221
    iget-object v2, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iput-object v0, v2, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    goto :goto_0

    .line 222
    :cond_1
    iget-object v2, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object v3, v2, Lcom/radaee/reader/GLView;->m_annot_pos:Lcom/radaee/view/GLLayout$PDFPos;

    iget v3, v3, Lcom/radaee/view/GLLayout$PDFPos;->x:F

    iget-object v4, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object v4, v4, Lcom/radaee/reader/GLView;->m_annot_pos:Lcom/radaee/view/GLLayout$PDFPos;

    iget v4, v4, Lcom/radaee/view/GLLayout$PDFPos;->y:F

    invoke-virtual {p1, v3, v4}, Lcom/radaee/pdf/Page;->GetAnnotFromPoint(FF)Lcom/radaee/pdf/Page$Annotation;

    move-result-object v3

    iput-object v3, v2, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    .line 224
    :goto_0
    iget-object v2, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object v2, v2, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    if-eqz v2, :cond_13

    iget-object v2, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object v2, v2, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v2}, Lcom/radaee/pdf/Page$Annotation;->IsReadOnly()Z

    move-result v2

    if-eqz v2, :cond_2

    goto/16 :goto_5

    .line 240
    :cond_2
    iget-object v2, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v2}, Lcom/radaee/reader/GLView;->PDFCanSave()Z

    move-result v2

    .line 241
    invoke-virtual {p1}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 242
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object v3, p1, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v3}, Lcom/radaee/pdf/Page$Annotation;->GetRect()[F

    move-result-object v3

    invoke-static {p1, v3}, Lcom/radaee/reader/GLView;->access$402(Lcom/radaee/reader/GLView;[F)[F

    .line 243
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {p1}, Lcom/radaee/reader/GLView;->access$400(Lcom/radaee/reader/GLView;)[F

    move-result-object p1

    const/4 v3, 0x1

    aget p1, p1, v3

    .line 244
    iget-object v4, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v4}, Lcom/radaee/reader/GLView;->access$400(Lcom/radaee/reader/GLView;)[F

    move-result-object v4

    iget-object v5, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object v5, v5, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    iget-object v6, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v6}, Lcom/radaee/reader/GLView;->access$400(Lcom/radaee/reader/GLView;)[F

    move-result-object v6

    aget v6, v6, v1

    invoke-virtual {v5, v6}, Lcom/radaee/view/GLPage;->GetVX(F)I

    move-result v5

    iget-object v6, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object v6, v6, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v6}, Lcom/radaee/view/GLLayout;->vGetX()I

    move-result v6

    sub-int/2addr v5, v6

    int-to-float v5, v5

    aput v5, v4, v1

    .line 245
    iget-object v4, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v4}, Lcom/radaee/reader/GLView;->access$400(Lcom/radaee/reader/GLView;)[F

    move-result-object v4

    iget-object v5, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object v5, v5, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    iget-object v6, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v6}, Lcom/radaee/reader/GLView;->access$400(Lcom/radaee/reader/GLView;)[F

    move-result-object v6

    const/4 v7, 0x3

    aget v6, v6, v7

    invoke-virtual {v5, v6}, Lcom/radaee/view/GLPage;->GetVY(F)I

    move-result v5

    iget-object v6, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object v6, v6, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v6}, Lcom/radaee/view/GLLayout;->vGetY()I

    move-result v6

    sub-int/2addr v5, v6

    int-to-float v5, v5

    aput v5, v4, v3

    .line 246
    iget-object v4, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v4}, Lcom/radaee/reader/GLView;->access$400(Lcom/radaee/reader/GLView;)[F

    move-result-object v4

    iget-object v5, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object v5, v5, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    iget-object v6, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v6}, Lcom/radaee/reader/GLView;->access$400(Lcom/radaee/reader/GLView;)[F

    move-result-object v6

    const/4 v8, 0x2

    aget v6, v6, v8

    invoke-virtual {v5, v6}, Lcom/radaee/view/GLPage;->GetVX(F)I

    move-result v5

    iget-object v6, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object v6, v6, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v6}, Lcom/radaee/view/GLLayout;->vGetX()I

    move-result v6

    sub-int/2addr v5, v6

    int-to-float v5, v5

    aput v5, v4, v8

    .line 247
    iget-object v4, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v4}, Lcom/radaee/reader/GLView;->access$400(Lcom/radaee/reader/GLView;)[F

    move-result-object v4

    iget-object v5, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object v5, v5, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    invoke-virtual {v5, p1}, Lcom/radaee/view/GLPage;->GetVY(F)I

    move-result p1

    iget-object v5, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object v5, v5, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    invoke-virtual {v5}, Lcom/radaee/view/GLLayout;->vGetY()I

    move-result v5

    sub-int/2addr p1, v5

    int-to-float p1, p1

    aput p1, v4, v7

    .line 248
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    const/16 v4, 0x64

    iput v4, p1, Lcom/radaee/reader/GLView;->m_status:I

    .line 249
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object p1, p1, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetCheckStatus()I

    move-result p1

    if-eqz v2, :cond_8

    if-ltz p1, :cond_8

    if-eqz p1, :cond_5

    if-eq p1, v3, :cond_4

    if-eq p1, v8, :cond_3

    if-eq p1, v7, :cond_3

    goto :goto_1

    .line 262
    :cond_3
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object p1, p1, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->SetRadio()Z

    .line 263
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object p1, p1, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-static {}, Lcom/radaee/util/CommonUtil;->getCurrentDate()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/radaee/pdf/Page$Annotation;->SetModifyDate(Ljava/lang/String;)Z

    goto :goto_1

    .line 257
    :cond_4
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object p1, p1, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p1, v1}, Lcom/radaee/pdf/Page$Annotation;->SetCheckValue(Z)Z

    .line 258
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object p1, p1, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-static {}, Lcom/radaee/util/CommonUtil;->getCurrentDate()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/radaee/pdf/Page$Annotation;->SetModifyDate(Ljava/lang/String;)Z

    goto :goto_1

    .line 253
    :cond_5
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object p1, p1, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p1, v3}, Lcom/radaee/pdf/Page$Annotation;->SetCheckValue(Z)Z

    .line 254
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object p1, p1, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-static {}, Lcom/radaee/util/CommonUtil;->getCurrentDate()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/radaee/pdf/Page$Annotation;->SetModifyDate(Ljava/lang/String;)Z

    .line 266
    :goto_1
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object p1, p1, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    if-eqz p1, :cond_6

    sget-boolean p1, Lcom/radaee/pdf/Global;->sExecuteAnnotJS:Z

    if-eqz p1, :cond_6

    .line 267
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {p1}, Lcom/radaee/reader/GLView;->access$500(Lcom/radaee/reader/GLView;)Z

    .line 268
    :cond_6
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, p1, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    invoke-virtual {v0}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/radaee/reader/GLView;->PDFUpdatePage(I)V

    .line 269
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {p1}, Lcom/radaee/reader/GLView;->access$300(Lcom/radaee/reader/GLView;)Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    move-result-object p1

    if-eqz p1, :cond_7

    .line 270
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {p1}, Lcom/radaee/reader/GLView;->access$300(Lcom/radaee/reader/GLView;)Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    move-result-object p1

    iget-object v0, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    invoke-virtual {v0}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result v0

    invoke-interface {p1, v0}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    .line 271
    :cond_7
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {p1}, Lcom/radaee/reader/GLView;->PDFEndAnnot()V

    goto/16 :goto_4

    :cond_8
    if-eqz v2, :cond_9

    .line 272
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object p1, p1, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetEditType()I

    move-result p1

    if-lez p1, :cond_9

    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object v4, p1, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p1, v4}, Lcom/radaee/reader/GLView;->isAnnotFreeText(Lcom/radaee/pdf/Page$Annotation;)Z

    move-result p1

    if-nez p1, :cond_9

    .line 274
    invoke-direct {p0}, Lcom/radaee/reader/GLView$PDFGestureListener;->onEditAnnot()V

    goto/16 :goto_4

    :cond_9
    if-eqz v2, :cond_c

    .line 275
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object p1, p1, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetComboItemCount()I

    move-result p1

    if-ltz p1, :cond_c

    .line 278
    :try_start_0
    new-array p1, v8, [I

    .line 279
    iget-object v2, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v2, p1}, Lcom/radaee/reader/GLView;->getLocationInWindow([I)V

    .line 280
    iget-object v2, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object v2, v2, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v2}, Lcom/radaee/pdf/Page$Annotation;->GetComboItemCount()I

    move-result v2

    new-array v4, v2, [Ljava/lang/String;

    const/4 v5, 0x0

    :goto_2
    if-ge v5, v2, :cond_a

    .line 283
    iget-object v6, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object v6, v6, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v6, v5}, Lcom/radaee/pdf/Page$Annotation;->GetComboItem(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 286
    :cond_a
    iget-object v5, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    new-instance v6, Landroid/widget/PopupWindow;

    iget-object v9, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v9}, Lcom/radaee/reader/GLView;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-static {v9}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v9

    sget v10, Lcom/radaee/viewlib/R$layout;->pop_combo:I

    invoke-virtual {v9, v10, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    invoke-direct {v6, v0}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;)V

    invoke-static {v5, v6}, Lcom/radaee/reader/GLView;->access$602(Lcom/radaee/reader/GLView;Landroid/widget/PopupWindow;)Landroid/widget/PopupWindow;

    .line 287
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 288
    iget-object v5, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v5}, Lcom/radaee/reader/GLView;->access$600(Lcom/radaee/reader/GLView;)Landroid/widget/PopupWindow;

    move-result-object v5

    invoke-virtual {v5, v3}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    .line 289
    iget-object v5, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v5}, Lcom/radaee/reader/GLView;->access$600(Lcom/radaee/reader/GLView;)Landroid/widget/PopupWindow;

    move-result-object v5

    invoke-virtual {v5, v3}, Landroid/widget/PopupWindow;->setTouchable(Z)V

    .line 290
    iget-object v5, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v5}, Lcom/radaee/reader/GLView;->access$600(Lcom/radaee/reader/GLView;)Landroid/widget/PopupWindow;

    move-result-object v5

    invoke-virtual {v5, v0}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 291
    iget-object v0, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v0}, Lcom/radaee/reader/GLView;->access$600(Lcom/radaee/reader/GLView;)Landroid/widget/PopupWindow;

    move-result-object v0

    iget-object v5, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v5}, Lcom/radaee/reader/GLView;->access$400(Lcom/radaee/reader/GLView;)[F

    move-result-object v5

    aget v5, v5, v8

    iget-object v6, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v6}, Lcom/radaee/reader/GLView;->access$400(Lcom/radaee/reader/GLView;)[F

    move-result-object v6

    aget v6, v6, v1

    sub-float/2addr v5, v6

    float-to-int v5, v5

    invoke-virtual {v0, v5}, Landroid/widget/PopupWindow;->setWidth(I)V

    .line 292
    iget-object v0, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v0}, Lcom/radaee/reader/GLView;->access$400(Lcom/radaee/reader/GLView;)[F

    move-result-object v0

    aget v0, v0, v7

    iget-object v5, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v5}, Lcom/radaee/reader/GLView;->access$400(Lcom/radaee/reader/GLView;)[F

    move-result-object v5

    aget v5, v5, v3

    sub-float/2addr v0, v5

    const/high16 v5, 0x40800000    # 4.0f

    sub-float/2addr v0, v5

    int-to-float v6, v2

    mul-float v0, v0, v6

    const/high16 v6, 0x437a0000    # 250.0f

    cmpl-float v0, v0, v6

    if-lez v0, :cond_b

    .line 293
    iget-object v0, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v0}, Lcom/radaee/reader/GLView;->access$600(Lcom/radaee/reader/GLView;)Landroid/widget/PopupWindow;

    move-result-object v0

    const/16 v2, 0x12c

    invoke-virtual {v0, v2}, Landroid/widget/PopupWindow;->setHeight(I)V

    goto :goto_3

    .line 295
    :cond_b
    iget-object v0, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v0}, Lcom/radaee/reader/GLView;->access$600(Lcom/radaee/reader/GLView;)Landroid/widget/PopupWindow;

    move-result-object v0

    iget-object v6, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v6}, Lcom/radaee/reader/GLView;->access$400(Lcom/radaee/reader/GLView;)[F

    move-result-object v9

    aget v9, v9, v7

    iget-object v10, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v10}, Lcom/radaee/reader/GLView;->access$400(Lcom/radaee/reader/GLView;)[F

    move-result-object v10

    aget v10, v10, v3

    sub-float/2addr v9, v10

    sub-float/2addr v9, v5

    invoke-static {v6, v9}, Lcom/radaee/reader/GLView;->access$700(Lcom/radaee/reader/GLView;F)I

    move-result v5

    mul-int v5, v5, v2

    invoke-virtual {v0, v5}, Landroid/widget/PopupWindow;->setHeight(I)V

    .line 296
    :goto_3
    iget-object v0, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v0}, Lcom/radaee/reader/GLView;->access$600(Lcom/radaee/reader/GLView;)Landroid/widget/PopupWindow;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    move-result-object v0

    sget v2, Lcom/radaee/viewlib/R$id;->annot_combo:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/radaee/util/ComboList;

    .line 297
    invoke-virtual {v0, v4}, Lcom/radaee/util/ComboList;->set_opts([Ljava/lang/String;)V

    .line 298
    new-instance v2, Lcom/radaee/reader/GLView$PDFGestureListener$2;

    invoke-direct {v2, p0}, Lcom/radaee/reader/GLView$PDFGestureListener$2;-><init>(Lcom/radaee/reader/GLView$PDFGestureListener;)V

    invoke-virtual {v0, v2}, Lcom/radaee/util/ComboList;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 305
    iget-object v0, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v0, v8}, Lcom/radaee/reader/GLView;->access$902(Lcom/radaee/reader/GLView;I)I

    .line 306
    iget-object v0, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    const/4 v2, -0x1

    invoke-static {v0, v2}, Lcom/radaee/reader/GLView;->access$802(Lcom/radaee/reader/GLView;I)I

    .line 307
    iget-object v0, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v0}, Lcom/radaee/reader/GLView;->access$600(Lcom/radaee/reader/GLView;)Landroid/widget/PopupWindow;

    move-result-object v0

    new-instance v2, Lcom/radaee/reader/GLView$PDFGestureListener$3;

    invoke-direct {v2, p0}, Lcom/radaee/reader/GLView$PDFGestureListener$3;-><init>(Lcom/radaee/reader/GLView$PDFGestureListener;)V

    invoke-virtual {v0, v2}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 328
    iget-object v0, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v0}, Lcom/radaee/reader/GLView;->access$600(Lcom/radaee/reader/GLView;)Landroid/widget/PopupWindow;

    move-result-object v0

    iget-object v2, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v2}, Lcom/radaee/reader/GLView;->access$400(Lcom/radaee/reader/GLView;)[F

    move-result-object v4

    aget v4, v4, v1

    float-to-int v4, v4

    aget v5, p1, v1

    add-int/2addr v4, v5

    iget-object v5, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v5}, Lcom/radaee/reader/GLView;->access$400(Lcom/radaee/reader/GLView;)[F

    move-result-object v5

    aget v5, v5, v7

    aget p1, p1, v3

    int-to-float p1, p1

    add-float/2addr v5, p1

    float-to-int p1, v5

    invoke-virtual {v0, v2, v1, v4, p1}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_4

    :catch_0
    move-exception p1

    .line 330
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 331
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "####ERROR#######"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "MR2"

    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4

    :cond_c
    if-eqz v2, :cond_d

    .line 333
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object p1, p1, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetListItemCount()I

    move-result p1

    if-ltz p1, :cond_d

    .line 334
    invoke-direct {p0}, Lcom/radaee/reader/GLView$PDFGestureListener;->onListAnnot()V

    goto :goto_4

    :cond_d
    if-eqz v2, :cond_e

    .line 335
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object p1, p1, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetFieldType()I

    move-result p1

    const/4 v0, 0x4

    if-ne p1, v0, :cond_e

    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object p1, p1, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetSignStatus()I

    move-result p1

    if-nez p1, :cond_e

    sget-boolean p1, Lcom/radaee/pdf/Global;->sEnableGraphicalSignature:Z

    if-eqz p1, :cond_e

    .line 336
    invoke-direct {p0}, Lcom/radaee/reader/GLView$PDFGestureListener;->handleSignatureField()V

    goto :goto_4

    .line 337
    :cond_e
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {p1}, Lcom/radaee/reader/GLView;->access$300(Lcom/radaee/reader/GLView;)Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    move-result-object p1

    if-eqz p1, :cond_11

    .line 338
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {p1}, Lcom/radaee/reader/GLView;->executeAnnotation()Z

    move-result p1

    if-eqz p1, :cond_f

    return v3

    :cond_f
    if-eqz v2, :cond_10

    .line 341
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {p1}, Lcom/radaee/reader/GLView;->access$300(Lcom/radaee/reader/GLView;)Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    move-result-object p1

    iget-object v0, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_annot_pos:Lcom/radaee/view/GLLayout$PDFPos;

    iget v0, v0, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    iget-object v1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object v1, v1, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-interface {p1, v0, v1}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFAnnotTapped(ILcom/radaee/pdf/Page$Annotation;)V

    goto :goto_4

    .line 343
    :cond_10
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {p1}, Lcom/radaee/reader/GLView;->access$1000(Lcom/radaee/reader/GLView;)V

    return v1

    .line 348
    :cond_11
    :goto_4
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {p1}, Lcom/radaee/reader/GLView;->access$1100(Lcom/radaee/reader/GLView;)Lcom/radaee/reader/GLCanvas;

    move-result-object p1

    if-eqz p1, :cond_12

    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {p1}, Lcom/radaee/reader/GLView;->access$1100(Lcom/radaee/reader/GLView;)Lcom/radaee/reader/GLCanvas;

    move-result-object p1

    invoke-virtual {p1}, Lcom/radaee/reader/GLCanvas;->invalidate()V

    :cond_12
    return v3

    .line 225
    :cond_13
    :goto_5
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {p1}, Lcom/radaee/reader/GLView;->access$300(Lcom/radaee/reader/GLView;)Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    move-result-object p1

    if-eqz p1, :cond_14

    .line 226
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {p1}, Lcom/radaee/reader/GLView;->access$300(Lcom/radaee/reader/GLView;)Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    move-result-object p1

    iget-object v2, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object v2, v2, Lcom/radaee/reader/GLView;->m_annot_pos:Lcom/radaee/view/GLLayout$PDFPos;

    iget v2, v2, Lcom/radaee/view/GLLayout$PDFPos;->pageno:I

    invoke-interface {p1, v2}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFBlankTapped(I)V

    .line 227
    :cond_14
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iput-object v0, p1, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    .line 228
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iput-object v0, p1, Lcom/radaee/reader/GLView;->m_annot_pos:Lcom/radaee/view/GLLayout$PDFPos;

    .line 229
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {p1, v0}, Lcom/radaee/reader/GLView;->access$402(Lcom/radaee/reader/GLView;[F)[F

    .line 230
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iput v1, p1, Lcom/radaee/reader/GLView;->m_status:I

    :cond_15
    :goto_6
    return v1
.end method

.method private onEditAnnot()V
    .locals 7

    .line 354
    :try_start_0
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v1}, Lcom/radaee/reader/GLView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 355
    new-instance v1, Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v2}, Lcom/radaee/reader/GLView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 356
    iget-object v2, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    const/high16 v3, 0x41c00000    # 24.0f

    invoke-static {v2, v3}, Lcom/radaee/reader/GLView;->access$700(Lcom/radaee/reader/GLView;F)I

    move-result v2

    iget-object v4, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v4, v3}, Lcom/radaee/reader/GLView;->access$700(Lcom/radaee/reader/GLView;F)I

    move-result v4

    iget-object v5, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v5, v3}, Lcom/radaee/reader/GLView;->access$700(Lcom/radaee/reader/GLView;F)I

    move-result v3

    iget-object v5, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    const/4 v6, 0x0

    invoke-static {v5, v6}, Lcom/radaee/reader/GLView;->access$700(Lcom/radaee/reader/GLView;F)I

    move-result v5

    invoke-virtual {v1, v2, v4, v3, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 357
    new-instance v2, Landroid/widget/EditText;

    iget-object v3, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v3}, Lcom/radaee/reader/GLView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    const/4 v3, -0x1

    .line 358
    invoke-virtual {v1, v2, v3, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V

    .line 359
    invoke-virtual {v0, v1, v3, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V

    .line 360
    iget-object v1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object v1, v1, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Annotation;->GetEditText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 361
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v3, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v3}, Lcom/radaee/reader/GLView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v1, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 362
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v3, Lcom/radaee/reader/GLView$PDFGestureListener$4;

    invoke-direct {v3, p0, v2}, Lcom/radaee/reader/GLView$PDFGestureListener$4;-><init>(Lcom/radaee/reader/GLView$PDFGestureListener;Landroid/widget/EditText;)V

    const v2, 0x104000a

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/high16 v2, 0x1040000

    const/4 v3, 0x0

    .line 373
    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 374
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 375
    new-instance v1, Lcom/radaee/reader/GLView$PDFGestureListener$5;

    invoke-direct {v1, p0}, Lcom/radaee/reader/GLView$PDFGestureListener$5;-><init>(Lcom/radaee/reader/GLView$PDFGestureListener;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 381
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 383
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 384
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "####ERROR#######"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "MR2"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private onListAnnot()V
    .locals 9

    .line 392
    :try_start_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {v1}, Lcom/radaee/reader/GLView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 393
    iget-object v1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object v1, v1, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Annotation;->GetListItemCount()I

    move-result v1

    new-array v2, v1, [Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v1, :cond_0

    .line 396
    iget-object v5, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object v5, v5, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v5, v4}, Lcom/radaee/pdf/Page$Annotation;->GetListItem(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 399
    :cond_0
    iget-object v4, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object v4, v4, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v4}, Lcom/radaee/pdf/Page$Annotation;->GetListSels()[I

    move-result-object v4

    .line 400
    new-array v1, v1, [Z

    iput-object v1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->mCheckedItems:[Z

    .line 401
    array-length v1, v4

    const/4 v5, 0x0

    :goto_1
    if-ge v5, v1, :cond_1

    aget v6, v4, v5

    .line 402
    iget-object v7, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->mCheckedItems:[Z

    const/4 v8, 0x1

    aput-boolean v8, v7, v6

    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 404
    :cond_1
    iget-object v1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object v1, v1, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Annotation;->IsListMultiSel()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 405
    iget-object v1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->mCheckedItems:[Z

    new-instance v3, Lcom/radaee/reader/GLView$PDFGestureListener$6;

    invoke-direct {v3, p0}, Lcom/radaee/reader/GLView$PDFGestureListener$6;-><init>(Lcom/radaee/reader/GLView$PDFGestureListener;)V

    invoke-virtual {v0, v2, v1, v3}, Landroid/app/AlertDialog$Builder;->setMultiChoiceItems([Ljava/lang/CharSequence;[ZLandroid/content/DialogInterface$OnMultiChoiceClickListener;)Landroid/app/AlertDialog$Builder;

    goto :goto_2

    .line 412
    :cond_2
    aget v1, v4, v3

    new-instance v3, Lcom/radaee/reader/GLView$PDFGestureListener$7;

    invoke-direct {v3, p0, v4}, Lcom/radaee/reader/GLView$PDFGestureListener$7;-><init>(Lcom/radaee/reader/GLView$PDFGestureListener;[I)V

    invoke-virtual {v0, v2, v1, v3}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 420
    :goto_2
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 421
    new-instance v1, Lcom/radaee/reader/GLView$PDFGestureListener$8;

    invoke-direct {v1, p0}, Lcom/radaee/reader/GLView$PDFGestureListener$8;-><init>(Lcom/radaee/reader/GLView$PDFGestureListener;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 442
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 444
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 445
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "####ERROR#######"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "MR2"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private updateSignature(Landroid/graphics/Bitmap;Z)V
    .locals 4

    .line 475
    iget-object v0, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    if-eqz v0, :cond_3

    .line 476
    iget-object v0, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v0}, Lcom/radaee/pdf/Page$Annotation;->GetRect()[F

    move-result-object v0

    const/4 v1, 0x2

    .line 477
    aget v1, v0, v1

    const/4 v2, 0x0

    aget v2, v0, v2

    sub-float/2addr v1, v2

    const/4 v2, 0x3

    .line 478
    aget v2, v0, v2

    const/4 v3, 0x1

    aget v0, v0, v3

    sub-float/2addr v2, v0

    if-eqz p2, :cond_0

    float-to-int p1, v1

    float-to-int p2, v2

    .line 481
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, p2, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    :cond_0
    if-eqz p1, :cond_3

    .line 484
    iget-object p2, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object p2, p2, Lcom/radaee/reader/GLView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-static {p2, p1, v1, v2}, Lcom/radaee/util/CommonUtil;->createImageForm(Lcom/radaee/pdf/Document;Landroid/graphics/Bitmap;FF)Lcom/radaee/pdf/Document$DocForm;

    move-result-object p2

    if-eqz p2, :cond_2

    .line 485
    iget-object v0, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    const-string v1, "Signature"

    invoke-virtual {v0, v1, p2}, Lcom/radaee/pdf/Page$Annotation;->SetIcon(Ljava/lang/String;Lcom/radaee/pdf/Document$DocForm;)Z

    move-result p2

    if-eqz p2, :cond_2

    .line 486
    iget-object p2, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, p2, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    invoke-virtual {v0}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result v0

    invoke-virtual {p2, v0}, Lcom/radaee/reader/GLView;->PDFUpdatePage(I)V

    .line 487
    iget-object p2, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {p2}, Lcom/radaee/reader/GLView;->access$300(Lcom/radaee/reader/GLView;)Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    move-result-object p2

    if-eqz p2, :cond_1

    .line 488
    iget-object p2, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {p2}, Lcom/radaee/reader/GLView;->access$300(Lcom/radaee/reader/GLView;)Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    move-result-object p2

    iget-object v0, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_annot_page:Lcom/radaee/view/GLPage;

    invoke-virtual {v0}, Lcom/radaee/view/GLPage;->GetPageNo()I

    move-result v0

    invoke-interface {p2, v0}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    .line 489
    :cond_1
    iget-object p2, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-virtual {p2}, Lcom/radaee/reader/GLView;->PDFEndAnnot()V

    .line 491
    :cond_2
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    :cond_3
    return-void
.end method


# virtual methods
.method public onDoubleTap(Landroid/view/MotionEvent;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public onDoubleTapEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public onDown(Landroid/view/MotionEvent;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 11

    .line 137
    iget-object v0, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-boolean v0, v0, Lcom/radaee/reader/GLView;->scoll_lock:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    sget v0, Lcom/radaee/pdf/Global;->def_view:I

    if-le v0, v2, :cond_0

    return v1

    .line 139
    :cond_0
    iget-object v0, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iput-boolean v2, v0, Lcom/radaee/reader/GLView;->disableAnnotCheck:Z

    .line 140
    iget-object v0, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    if-nez v0, :cond_1

    return v1

    .line 141
    :cond_1
    iget-object v0, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget v0, v0, Lcom/radaee/reader/GLView;->m_status:I

    if-nez v0, :cond_7

    iget-object v0, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v0}, Lcom/radaee/reader/GLView;->access$000(Lcom/radaee/reader/GLView;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 144
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    sub-float v5, v0, v1

    .line 145
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    sub-float v6, p2, p1

    .line 146
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-boolean p1, p1, Lcom/radaee/reader/GLView;->scoll_lock:Z

    const/4 p2, 0x0

    if-eqz p1, :cond_2

    sget p1, Lcom/radaee/pdf/Global;->def_view:I

    if-nez p1, :cond_2

    const/4 p3, 0x0

    .line 147
    :cond_2
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-boolean p1, p1, Lcom/radaee/reader/GLView;->scoll_lock:Z

    if-eqz p1, :cond_3

    sget p1, Lcom/radaee/pdf/Global;->def_view:I

    if-ne p1, v2, :cond_3

    const/4 v8, 0x0

    goto :goto_0

    :cond_3
    move v8, p4

    .line 148
    :goto_0
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-boolean p1, p1, Lcom/radaee/reader/GLView;->scoll_lock:Z

    if-nez p1, :cond_6

    sget p1, Lcom/radaee/pdf/Global;->def_view:I

    if-nez p1, :cond_6

    .line 149
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object p1, p1, Lcom/radaee/reader/GLView;->vert_scroll_locked:Ljava/lang/Boolean;

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object p1, p1, Lcom/radaee/reader/GLView;->vert_scroll_locked:Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_5

    :cond_4
    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result p1

    float-to-double v0, p1

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result p1

    float-to-double v3, p1

    const-wide v9, 0x3fe6666666666666L    # 0.7

    mul-double v3, v3, v9

    cmpl-double p1, v0, v3

    if-lez p1, :cond_6

    :cond_5
    const/4 v7, 0x0

    goto :goto_1

    :cond_6
    move v7, p3

    .line 153
    :goto_1
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    new-instance v3, Lcom/radaee/reader/GLView$PDFGestureListener$1;

    move-object v4, p0

    invoke-direct/range {v3 .. v8}, Lcom/radaee/reader/GLView$PDFGestureListener$1;-><init>(Lcom/radaee/reader/GLView$PDFGestureListener;FFFF)V

    invoke-virtual {p1, v3}, Lcom/radaee/reader/GLView;->queueEvent(Ljava/lang/Runnable;)V

    return v2

    :cond_7
    return v1
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 4

    .line 181
    iget-object v0, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/radaee/reader/GLView;->disableAnnotCheck:Z

    .line 182
    iget-object v0, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object v0, v0, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    if-nez v0, :cond_0

    goto :goto_0

    .line 183
    :cond_0
    iget-object v0, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget v0, v0, Lcom/radaee/reader/GLView;->m_status:I

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v0}, Lcom/radaee/reader/GLView;->access$300(Lcom/radaee/reader/GLView;)Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 185
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    .line 186
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    .line 187
    iget-object v1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-object v1, v1, Lcom/radaee/reader/GLView;->m_layout:Lcom/radaee/view/GLLayout;

    float-to-int v2, v0

    float-to-int v3, p1

    invoke-virtual {v1, v2, v3}, Lcom/radaee/view/GLLayout;->vGetPage(II)I

    move-result v1

    .line 188
    iget-object v2, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-static {v2}, Lcom/radaee/reader/GLView;->access$300(Lcom/radaee/reader/GLView;)Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    move-result-object v2

    invoke-interface {v2, v1, v0, p1}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFLongPressed(IFF)V

    :cond_1
    :goto_0
    return-void
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 0

    .line 194
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    const/4 p2, 0x1

    iput-boolean p2, p1, Lcom/radaee/reader/GLView;->disableAnnotCheck:Z

    const/4 p1, 0x0

    return p1
.end method

.method public onShowPress(Landroid/view/MotionEvent;)V
    .locals 0

    return-void
.end method

.method public onSingleTapConfirmed(Landroid/view/MotionEvent;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 209
    iget-object v0, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    invoke-direct {p0, p1}, Lcom/radaee/reader/GLView$PDFGestureListener;->hasAnnotTap(Landroid/view/MotionEvent;)Z

    move-result p1

    iput-boolean p1, v0, Lcom/radaee/reader/GLView;->tapDownForAnnot:Z

    .line 210
    iget-object p1, p0, Lcom/radaee/reader/GLView$PDFGestureListener;->this$0:Lcom/radaee/reader/GLView;

    iget-boolean p1, p1, Lcom/radaee/reader/GLView;->tapDownForAnnot:Z

    return p1
.end method
