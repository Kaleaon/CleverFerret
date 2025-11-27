.class Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "PDFLayoutView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/radaee/reader/PDFLayoutView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PDFGestureListener"
.end annotation


# instance fields
.field mCheckedItems:[Z

.field final synthetic this$0:Lcom/radaee/reader/PDFLayoutView;


# direct methods
.method constructor <init>(Lcom/radaee/reader/PDFLayoutView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 120
    iput-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method

.method static synthetic access$1000(Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;Landroid/graphics/Bitmap;Z)V
    .locals 0

    .line 120
    invoke-direct {p0, p1, p2}, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->updateSignature(Landroid/graphics/Bitmap;Z)V

    return-void
.end method

.method private handleSignatureField()V
    .locals 3

    .line 468
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-static {v0}, Lcom/radaee/util/CommonUtil;->isFieldGraphicallySigned(Lcom/radaee/pdf/Page$Annotation;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 469
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {v1}, Lcom/radaee/reader/PDFLayoutView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget v1, Lcom/radaee/viewlib/R$string;->warning:I

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    sget v1, Lcom/radaee/viewlib/R$string;->delete_signature_message:I

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    sget v1, Lcom/radaee/viewlib/R$string;->yes:I

    new-instance v2, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$8;

    invoke-direct {v2, p0}, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$8;-><init>(Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;)V

    .line 470
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    sget v1, Lcom/radaee/viewlib/R$string;->no:I

    const/4 v2, 0x0

    .line 476
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 477
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void

    .line 479
    :cond_0
    new-instance v0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$9;

    invoke-direct {v0, p0}, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$9;-><init>(Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;)V

    invoke-static {v0}, Lcom/radaee/util/CaptureSignature$CaptureSignatureListener;->setListener(Lcom/radaee/util/CaptureSignature$CaptureSignatureListener$OnSignatureCapturedListener;)V

    .line 485
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {v1}, Lcom/radaee/reader/PDFLayoutView;->getContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/radaee/util/CaptureSignature;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 486
    const-string v1, "SIGNATURE_PAD_DESCR"

    sget-object v2, Lcom/radaee/pdf/Global;->sSignPadDescr:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 487
    const-string v1, "FIT_SIGNATURE_BITMAP"

    sget-boolean v2, Lcom/radaee/pdf/Global;->sFitSignatureToField:Z

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 488
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {v1}, Lcom/radaee/reader/PDFLayoutView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method private hasAnnotTap(Landroid/view/MotionEvent;)Z
    .locals 11

    .line 205
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-boolean v0, v0, Lcom/radaee/reader/PDFLayoutView;->disableAnnotCheck:Z

    const/4 v1, 0x0

    if-nez v0, :cond_14

    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    if-nez v0, :cond_0

    goto/16 :goto_6

    .line 208
    :cond_0
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v2, v0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    float-to-int v3, v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    float-to-int p1, p1

    invoke-virtual {v2, v3, p1}, Lcom/radaee/view/PDFLayout;->vGetPos(II)Lcom/radaee/view/PDFLayout$PDFPos;

    move-result-object p1

    iput-object p1, v0, Lcom/radaee/reader/PDFLayoutView;->m_annot_pos:Lcom/radaee/view/PDFLayout$PDFPos;

    .line 209
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v0, p1, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget-object v2, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v2, v2, Lcom/radaee/reader/PDFLayoutView;->m_annot_pos:Lcom/radaee/view/PDFLayout$PDFPos;

    iget v2, v2, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    invoke-virtual {v0, v2}, Lcom/radaee/view/PDFLayout;->vGetPage(I)Lcom/radaee/view/VPage;

    move-result-object v0

    iput-object v0, p1, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    .line 210
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object p1, p1, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    invoke-virtual {v0}, Lcom/radaee/view/VPage;->GetPageNo()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/radaee/pdf/Document;->GetPage(I)Lcom/radaee/pdf/Page;

    move-result-object p1

    const/4 v0, 0x0

    if-nez p1, :cond_1

    .line 211
    iget-object v2, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iput-object v0, v2, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    goto :goto_0

    .line 212
    :cond_1
    iget-object v2, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v3, v2, Lcom/radaee/reader/PDFLayoutView;->m_annot_pos:Lcom/radaee/view/PDFLayout$PDFPos;

    iget v3, v3, Lcom/radaee/view/PDFLayout$PDFPos;->x:F

    iget-object v4, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v4, v4, Lcom/radaee/reader/PDFLayoutView;->m_annot_pos:Lcom/radaee/view/PDFLayout$PDFPos;

    iget v4, v4, Lcom/radaee/view/PDFLayout$PDFPos;->y:F

    invoke-virtual {p1, v3, v4}, Lcom/radaee/pdf/Page;->GetAnnotFromPoint(FF)Lcom/radaee/pdf/Page$Annotation;

    move-result-object v3

    iput-object v3, v2, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    .line 214
    :goto_0
    iget-object v2, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v2, v2, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    if-eqz v2, :cond_12

    iget-object v2, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v2, v2, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v2}, Lcom/radaee/pdf/Page$Annotation;->IsReadOnly()Z

    move-result v2

    if-eqz v2, :cond_2

    goto/16 :goto_5

    .line 230
    :cond_2
    iget-object v2, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {v2}, Lcom/radaee/reader/PDFLayoutView;->PDFCanSave()Z

    move-result v2

    .line 231
    invoke-virtual {p1}, Lcom/radaee/pdf/Page;->ObjsStart()V

    .line 232
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v3, p1, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v3}, Lcom/radaee/pdf/Page$Annotation;->GetRect()[F

    move-result-object v3

    invoke-static {p1, v3}, Lcom/radaee/reader/PDFLayoutView;->access$302(Lcom/radaee/reader/PDFLayoutView;[F)[F

    .line 233
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {p1}, Lcom/radaee/reader/PDFLayoutView;->access$300(Lcom/radaee/reader/PDFLayoutView;)[F

    move-result-object p1

    const/4 v3, 0x1

    aget p1, p1, v3

    .line 234
    iget-object v4, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {v4}, Lcom/radaee/reader/PDFLayoutView;->access$300(Lcom/radaee/reader/PDFLayoutView;)[F

    move-result-object v4

    iget-object v5, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v5, v5, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    iget-object v6, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {v6}, Lcom/radaee/reader/PDFLayoutView;->access$300(Lcom/radaee/reader/PDFLayoutView;)[F

    move-result-object v6

    aget v6, v6, v1

    invoke-virtual {v5, v6}, Lcom/radaee/view/VPage;->GetVX(F)I

    move-result v5

    iget-object v6, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v6, v6, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v6}, Lcom/radaee/view/PDFLayout;->vGetX()I

    move-result v6

    sub-int/2addr v5, v6

    int-to-float v5, v5

    aput v5, v4, v1

    .line 235
    iget-object v4, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {v4}, Lcom/radaee/reader/PDFLayoutView;->access$300(Lcom/radaee/reader/PDFLayoutView;)[F

    move-result-object v4

    iget-object v5, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v5, v5, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    iget-object v6, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {v6}, Lcom/radaee/reader/PDFLayoutView;->access$300(Lcom/radaee/reader/PDFLayoutView;)[F

    move-result-object v6

    const/4 v7, 0x3

    aget v6, v6, v7

    invoke-virtual {v5, v6}, Lcom/radaee/view/VPage;->GetVY(F)I

    move-result v5

    iget-object v6, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v6, v6, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v6}, Lcom/radaee/view/PDFLayout;->vGetY()I

    move-result v6

    sub-int/2addr v5, v6

    int-to-float v5, v5

    aput v5, v4, v3

    .line 236
    iget-object v4, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {v4}, Lcom/radaee/reader/PDFLayoutView;->access$300(Lcom/radaee/reader/PDFLayoutView;)[F

    move-result-object v4

    iget-object v5, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v5, v5, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    iget-object v6, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {v6}, Lcom/radaee/reader/PDFLayoutView;->access$300(Lcom/radaee/reader/PDFLayoutView;)[F

    move-result-object v6

    const/4 v8, 0x2

    aget v6, v6, v8

    invoke-virtual {v5, v6}, Lcom/radaee/view/VPage;->GetVX(F)I

    move-result v5

    iget-object v6, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v6, v6, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v6}, Lcom/radaee/view/PDFLayout;->vGetX()I

    move-result v6

    sub-int/2addr v5, v6

    int-to-float v5, v5

    aput v5, v4, v8

    .line 237
    iget-object v4, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {v4}, Lcom/radaee/reader/PDFLayoutView;->access$300(Lcom/radaee/reader/PDFLayoutView;)[F

    move-result-object v4

    iget-object v5, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v5, v5, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    invoke-virtual {v5, p1}, Lcom/radaee/view/VPage;->GetVY(F)I

    move-result p1

    iget-object v5, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v5, v5, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    invoke-virtual {v5}, Lcom/radaee/view/PDFLayout;->vGetY()I

    move-result v5

    sub-int/2addr p1, v5

    int-to-float p1, p1

    aput p1, v4, v7

    .line 238
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    const/16 v4, 0x64

    iput v4, p1, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    .line 239
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object p1, p1, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetCheckStatus()I

    move-result p1

    if-eqz v2, :cond_8

    if-ltz p1, :cond_8

    if-eqz p1, :cond_5

    if-eq p1, v3, :cond_4

    if-eq p1, v8, :cond_3

    if-eq p1, v7, :cond_3

    goto :goto_1

    .line 252
    :cond_3
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object p1, p1, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->SetRadio()Z

    .line 253
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object p1, p1, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-static {}, Lcom/radaee/util/CommonUtil;->getCurrentDate()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/radaee/pdf/Page$Annotation;->SetModifyDate(Ljava/lang/String;)Z

    goto :goto_1

    .line 247
    :cond_4
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object p1, p1, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p1, v1}, Lcom/radaee/pdf/Page$Annotation;->SetCheckValue(Z)Z

    .line 248
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object p1, p1, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-static {}, Lcom/radaee/util/CommonUtil;->getCurrentDate()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/radaee/pdf/Page$Annotation;->SetModifyDate(Ljava/lang/String;)Z

    goto :goto_1

    .line 243
    :cond_5
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object p1, p1, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p1, v3}, Lcom/radaee/pdf/Page$Annotation;->SetCheckValue(Z)Z

    .line 244
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object p1, p1, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-static {}, Lcom/radaee/util/CommonUtil;->getCurrentDate()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/radaee/pdf/Page$Annotation;->SetModifyDate(Ljava/lang/String;)Z

    .line 256
    :goto_1
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object p1, p1, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    if-eqz p1, :cond_6

    sget-boolean p1, Lcom/radaee/pdf/Global;->sExecuteAnnotJS:Z

    if-eqz p1, :cond_6

    .line 257
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {p1}, Lcom/radaee/reader/PDFLayoutView;->access$400(Lcom/radaee/reader/PDFLayoutView;)Z

    .line 258
    :cond_6
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object p1, p1, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    invoke-virtual {p1, v0}, Lcom/radaee/view/PDFLayout;->vRenderSync(Lcom/radaee/view/VPage;)V

    .line 259
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {p1}, Lcom/radaee/reader/PDFLayoutView;->access$200(Lcom/radaee/reader/PDFLayoutView;)Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    move-result-object p1

    if-eqz p1, :cond_7

    .line 260
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {p1}, Lcom/radaee/reader/PDFLayoutView;->access$200(Lcom/radaee/reader/PDFLayoutView;)Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    move-result-object p1

    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    invoke-virtual {v0}, Lcom/radaee/view/VPage;->GetPageNo()I

    move-result v0

    invoke-interface {p1, v0}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    .line 261
    :cond_7
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {p1}, Lcom/radaee/reader/PDFLayoutView;->PDFEndAnnot()V

    goto/16 :goto_4

    :cond_8
    if-eqz v2, :cond_9

    .line 262
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object p1, p1, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetEditType()I

    move-result p1

    if-lez p1, :cond_9

    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v4, p1, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p1, v4}, Lcom/radaee/reader/PDFLayoutView;->isAnnotFreeText(Lcom/radaee/pdf/Page$Annotation;)Z

    move-result p1

    if-nez p1, :cond_9

    .line 264
    invoke-direct {p0}, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->onEditAnnot()V

    goto/16 :goto_4

    :cond_9
    if-eqz v2, :cond_c

    .line 265
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object p1, p1, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetComboItemCount()I

    move-result p1

    if-ltz p1, :cond_c

    .line 268
    :try_start_0
    new-array p1, v8, [I

    .line 269
    iget-object v2, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {v2, p1}, Lcom/radaee/reader/PDFLayoutView;->getLocationInWindow([I)V

    .line 270
    iget-object v2, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v2, v2, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v2}, Lcom/radaee/pdf/Page$Annotation;->GetComboItemCount()I

    move-result v2

    new-array v4, v2, [Ljava/lang/String;

    const/4 v5, 0x0

    :goto_2
    if-ge v5, v2, :cond_a

    .line 273
    iget-object v6, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v6, v6, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v6, v5}, Lcom/radaee/pdf/Page$Annotation;->GetComboItem(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 276
    :cond_a
    iget-object v5, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    new-instance v6, Landroid/widget/PopupWindow;

    iget-object v9, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {v9}, Lcom/radaee/reader/PDFLayoutView;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-static {v9}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v9

    sget v10, Lcom/radaee/viewlib/R$layout;->pop_combo:I

    invoke-virtual {v9, v10, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    invoke-direct {v6, v0}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;)V

    invoke-static {v5, v6}, Lcom/radaee/reader/PDFLayoutView;->access$502(Lcom/radaee/reader/PDFLayoutView;Landroid/widget/PopupWindow;)Landroid/widget/PopupWindow;

    .line 277
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 278
    iget-object v5, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {v5}, Lcom/radaee/reader/PDFLayoutView;->access$500(Lcom/radaee/reader/PDFLayoutView;)Landroid/widget/PopupWindow;

    move-result-object v5

    invoke-virtual {v5, v3}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    .line 279
    iget-object v5, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {v5}, Lcom/radaee/reader/PDFLayoutView;->access$500(Lcom/radaee/reader/PDFLayoutView;)Landroid/widget/PopupWindow;

    move-result-object v5

    invoke-virtual {v5, v3}, Landroid/widget/PopupWindow;->setTouchable(Z)V

    .line 280
    iget-object v5, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {v5}, Lcom/radaee/reader/PDFLayoutView;->access$500(Lcom/radaee/reader/PDFLayoutView;)Landroid/widget/PopupWindow;

    move-result-object v5

    invoke-virtual {v5, v0}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 281
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {v0}, Lcom/radaee/reader/PDFLayoutView;->access$500(Lcom/radaee/reader/PDFLayoutView;)Landroid/widget/PopupWindow;

    move-result-object v0

    iget-object v5, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {v5}, Lcom/radaee/reader/PDFLayoutView;->access$300(Lcom/radaee/reader/PDFLayoutView;)[F

    move-result-object v5

    aget v5, v5, v8

    iget-object v6, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {v6}, Lcom/radaee/reader/PDFLayoutView;->access$300(Lcom/radaee/reader/PDFLayoutView;)[F

    move-result-object v6

    aget v6, v6, v1

    sub-float/2addr v5, v6

    float-to-int v5, v5

    invoke-virtual {v0, v5}, Landroid/widget/PopupWindow;->setWidth(I)V

    .line 282
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {v0}, Lcom/radaee/reader/PDFLayoutView;->access$300(Lcom/radaee/reader/PDFLayoutView;)[F

    move-result-object v0

    aget v0, v0, v7

    iget-object v5, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {v5}, Lcom/radaee/reader/PDFLayoutView;->access$300(Lcom/radaee/reader/PDFLayoutView;)[F

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

    .line 283
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {v0}, Lcom/radaee/reader/PDFLayoutView;->access$500(Lcom/radaee/reader/PDFLayoutView;)Landroid/widget/PopupWindow;

    move-result-object v0

    const/16 v2, 0x12c

    invoke-virtual {v0, v2}, Landroid/widget/PopupWindow;->setHeight(I)V

    goto :goto_3

    .line 285
    :cond_b
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {v0}, Lcom/radaee/reader/PDFLayoutView;->access$500(Lcom/radaee/reader/PDFLayoutView;)Landroid/widget/PopupWindow;

    move-result-object v0

    iget-object v6, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {v6}, Lcom/radaee/reader/PDFLayoutView;->access$300(Lcom/radaee/reader/PDFLayoutView;)[F

    move-result-object v9

    aget v9, v9, v7

    iget-object v10, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {v10}, Lcom/radaee/reader/PDFLayoutView;->access$300(Lcom/radaee/reader/PDFLayoutView;)[F

    move-result-object v10

    aget v10, v10, v3

    sub-float/2addr v9, v10

    sub-float/2addr v9, v5

    invoke-static {v6, v9}, Lcom/radaee/reader/PDFLayoutView;->access$600(Lcom/radaee/reader/PDFLayoutView;F)I

    move-result v5

    mul-int v5, v5, v2

    invoke-virtual {v0, v5}, Landroid/widget/PopupWindow;->setHeight(I)V

    .line 286
    :goto_3
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {v0}, Lcom/radaee/reader/PDFLayoutView;->access$500(Lcom/radaee/reader/PDFLayoutView;)Landroid/widget/PopupWindow;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    move-result-object v0

    sget v2, Lcom/radaee/viewlib/R$id;->annot_combo:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/radaee/util/ComboList;

    .line 287
    invoke-virtual {v0, v4}, Lcom/radaee/util/ComboList;->set_opts([Ljava/lang/String;)V

    .line 288
    new-instance v2, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$1;

    invoke-direct {v2, p0}, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$1;-><init>(Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;)V

    invoke-virtual {v0, v2}, Lcom/radaee/util/ComboList;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 295
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {v0, v8}, Lcom/radaee/reader/PDFLayoutView;->access$802(Lcom/radaee/reader/PDFLayoutView;I)I

    .line 296
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    const/4 v2, -0x1

    invoke-static {v0, v2}, Lcom/radaee/reader/PDFLayoutView;->access$702(Lcom/radaee/reader/PDFLayoutView;I)I

    .line 297
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {v0}, Lcom/radaee/reader/PDFLayoutView;->access$500(Lcom/radaee/reader/PDFLayoutView;)Landroid/widget/PopupWindow;

    move-result-object v0

    new-instance v2, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$2;

    invoke-direct {v2, p0}, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$2;-><init>(Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;)V

    invoke-virtual {v0, v2}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 318
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {v0}, Lcom/radaee/reader/PDFLayoutView;->access$500(Lcom/radaee/reader/PDFLayoutView;)Landroid/widget/PopupWindow;

    move-result-object v0

    iget-object v2, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {v2}, Lcom/radaee/reader/PDFLayoutView;->access$300(Lcom/radaee/reader/PDFLayoutView;)[F

    move-result-object v4

    aget v4, v4, v1

    float-to-int v4, v4

    aget v5, p1, v1

    add-int/2addr v4, v5

    iget-object v5, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {v5}, Lcom/radaee/reader/PDFLayoutView;->access$300(Lcom/radaee/reader/PDFLayoutView;)[F

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

    .line 320
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 321
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

    .line 323
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object p1, p1, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetListItemCount()I

    move-result p1

    if-ltz p1, :cond_d

    .line 324
    invoke-direct {p0}, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->onListAnnot()V

    goto :goto_4

    :cond_d
    if-eqz v2, :cond_e

    .line 325
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object p1, p1, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetFieldType()I

    move-result p1

    const/4 v0, 0x4

    if-ne p1, v0, :cond_e

    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object p1, p1, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetSignStatus()I

    move-result p1

    if-nez p1, :cond_e

    sget-boolean p1, Lcom/radaee/pdf/Global;->sEnableGraphicalSignature:Z

    if-eqz p1, :cond_e

    .line 326
    invoke-direct {p0}, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->handleSignatureField()V

    goto :goto_4

    .line 327
    :cond_e
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {p1}, Lcom/radaee/reader/PDFLayoutView;->access$200(Lcom/radaee/reader/PDFLayoutView;)Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    move-result-object p1

    if-eqz p1, :cond_11

    .line 328
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {p1}, Lcom/radaee/reader/PDFLayoutView;->executeAnnotation()Z

    move-result p1

    if-eqz p1, :cond_f

    return v3

    :cond_f
    if-eqz v2, :cond_10

    .line 331
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {p1}, Lcom/radaee/reader/PDFLayoutView;->access$200(Lcom/radaee/reader/PDFLayoutView;)Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    move-result-object p1

    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_annot_pos:Lcom/radaee/view/PDFLayout$PDFPos;

    iget v0, v0, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v1, v1, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-interface {p1, v0, v1}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFAnnotTapped(ILcom/radaee/pdf/Page$Annotation;)V

    goto :goto_4

    .line 333
    :cond_10
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {p1}, Lcom/radaee/reader/PDFLayoutView;->access$900(Lcom/radaee/reader/PDFLayoutView;)V

    return v1

    .line 338
    :cond_11
    :goto_4
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {p1}, Lcom/radaee/reader/PDFLayoutView;->invalidate()V

    return v3

    .line 215
    :cond_12
    :goto_5
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {p1}, Lcom/radaee/reader/PDFLayoutView;->access$200(Lcom/radaee/reader/PDFLayoutView;)Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    move-result-object p1

    if-eqz p1, :cond_13

    .line 216
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {p1}, Lcom/radaee/reader/PDFLayoutView;->access$200(Lcom/radaee/reader/PDFLayoutView;)Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    move-result-object p1

    iget-object v2, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v2, v2, Lcom/radaee/reader/PDFLayoutView;->m_annot_pos:Lcom/radaee/view/PDFLayout$PDFPos;

    iget v2, v2, Lcom/radaee/view/PDFLayout$PDFPos;->pageno:I

    invoke-interface {p1, v2}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFBlankTapped(I)V

    .line 217
    :cond_13
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iput-object v0, p1, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    .line 218
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iput-object v0, p1, Lcom/radaee/reader/PDFLayoutView;->m_annot_pos:Lcom/radaee/view/PDFLayout$PDFPos;

    .line 219
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {p1, v0}, Lcom/radaee/reader/PDFLayoutView;->access$302(Lcom/radaee/reader/PDFLayoutView;[F)[F

    .line 220
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iput v1, p1, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    :cond_14
    :goto_6
    return v1
.end method

.method private onEditAnnot()V
    .locals 7

    .line 343
    :try_start_0
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {v1}, Lcom/radaee/reader/PDFLayoutView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 344
    new-instance v1, Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {v2}, Lcom/radaee/reader/PDFLayoutView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 345
    iget-object v2, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    const/high16 v3, 0x41c00000    # 24.0f

    invoke-static {v2, v3}, Lcom/radaee/reader/PDFLayoutView;->access$600(Lcom/radaee/reader/PDFLayoutView;F)I

    move-result v2

    iget-object v4, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {v4, v3}, Lcom/radaee/reader/PDFLayoutView;->access$600(Lcom/radaee/reader/PDFLayoutView;F)I

    move-result v4

    iget-object v5, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {v5, v3}, Lcom/radaee/reader/PDFLayoutView;->access$600(Lcom/radaee/reader/PDFLayoutView;F)I

    move-result v3

    iget-object v5, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    const/4 v6, 0x0

    invoke-static {v5, v6}, Lcom/radaee/reader/PDFLayoutView;->access$600(Lcom/radaee/reader/PDFLayoutView;F)I

    move-result v5

    invoke-virtual {v1, v2, v4, v3, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 346
    new-instance v2, Landroid/widget/EditText;

    iget-object v3, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {v3}, Lcom/radaee/reader/PDFLayoutView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    const/4 v3, -0x1

    .line 347
    invoke-virtual {v1, v2, v3, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V

    .line 348
    invoke-virtual {v0, v1, v3, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V

    .line 349
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v1, v1, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Annotation;->GetEditText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 350
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v3, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {v3}, Lcom/radaee/reader/PDFLayoutView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v1, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 351
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v3, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$3;

    invoke-direct {v3, p0, v2}, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$3;-><init>(Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;Landroid/widget/EditText;)V

    const v2, 0x104000a

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/high16 v2, 0x1040000

    const/4 v3, 0x0

    .line 362
    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 363
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 364
    new-instance v1, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$4;

    invoke-direct {v1, p0}, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$4;-><init>(Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 370
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 401
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 402
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

    .line 410
    :try_start_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {v1}, Lcom/radaee/reader/PDFLayoutView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 411
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v1, v1, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Annotation;->GetListItemCount()I

    move-result v1

    new-array v2, v1, [Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v1, :cond_0

    .line 414
    iget-object v5, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v5, v5, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v5, v4}, Lcom/radaee/pdf/Page$Annotation;->GetListItem(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 417
    :cond_0
    iget-object v4, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v4, v4, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v4}, Lcom/radaee/pdf/Page$Annotation;->GetListSels()[I

    move-result-object v4

    .line 418
    new-array v1, v1, [Z

    iput-object v1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->mCheckedItems:[Z

    .line 419
    array-length v1, v4

    const/4 v5, 0x0

    :goto_1
    if-ge v5, v1, :cond_1

    aget v6, v4, v5

    .line 420
    iget-object v7, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->mCheckedItems:[Z

    const/4 v8, 0x1

    aput-boolean v8, v7, v6

    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 422
    :cond_1
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v1, v1, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v1}, Lcom/radaee/pdf/Page$Annotation;->IsListMultiSel()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 423
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->mCheckedItems:[Z

    new-instance v3, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$5;

    invoke-direct {v3, p0}, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$5;-><init>(Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;)V

    invoke-virtual {v0, v2, v1, v3}, Landroid/app/AlertDialog$Builder;->setMultiChoiceItems([Ljava/lang/CharSequence;[ZLandroid/content/DialogInterface$OnMultiChoiceClickListener;)Landroid/app/AlertDialog$Builder;

    goto :goto_2

    .line 430
    :cond_2
    aget v1, v4, v3

    new-instance v3, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$6;

    invoke-direct {v3, p0, v4}, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$6;-><init>(Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;[I)V

    invoke-virtual {v0, v2, v1, v3}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 438
    :goto_2
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 439
    new-instance v1, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$7;

    invoke-direct {v1, p0}, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener$7;-><init>(Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 460
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 462
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 463
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

    .line 493
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    if-eqz v0, :cond_3

    .line 494
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v0}, Lcom/radaee/pdf/Page$Annotation;->GetRect()[F

    move-result-object v0

    const/4 v1, 0x2

    .line 495
    aget v1, v0, v1

    const/4 v2, 0x0

    aget v2, v0, v2

    sub-float/2addr v1, v2

    const/4 v2, 0x3

    .line 496
    aget v2, v0, v2

    const/4 v3, 0x1

    aget v0, v0, v3

    sub-float/2addr v2, v0

    if-eqz p2, :cond_0

    float-to-int p1, v1

    float-to-int p2, v2

    .line 499
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, p2, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    :cond_0
    if-eqz p1, :cond_3

    .line 502
    iget-object p2, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object p2, p2, Lcom/radaee/reader/PDFLayoutView;->m_doc:Lcom/radaee/pdf/Document;

    invoke-static {p2, p1, v1, v2}, Lcom/radaee/util/CommonUtil;->createImageForm(Lcom/radaee/pdf/Document;Landroid/graphics/Bitmap;FF)Lcom/radaee/pdf/Document$DocForm;

    move-result-object p2

    if-eqz p2, :cond_2

    .line 503
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    const-string v1, "Signature"

    invoke-virtual {v0, v1, p2}, Lcom/radaee/pdf/Page$Annotation;->SetIcon(Ljava/lang/String;Lcom/radaee/pdf/Document$DocForm;)Z

    move-result p2

    if-eqz p2, :cond_2

    .line 504
    iget-object p2, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object p2, p2, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    invoke-virtual {p2, v0}, Lcom/radaee/view/PDFLayout;->vRenderSync(Lcom/radaee/view/VPage;)V

    .line 505
    iget-object p2, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {p2}, Lcom/radaee/reader/PDFLayoutView;->access$200(Lcom/radaee/reader/PDFLayoutView;)Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    move-result-object p2

    if-eqz p2, :cond_1

    .line 506
    iget-object p2, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {p2}, Lcom/radaee/reader/PDFLayoutView;->access$200(Lcom/radaee/reader/PDFLayoutView;)Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    move-result-object p2

    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_annot_page:Lcom/radaee/view/VPage;

    invoke-virtual {v0}, Lcom/radaee/view/VPage;->GetPageNo()I

    move-result v0

    invoke-interface {p2, v0}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFPageModified(I)V

    .line 507
    :cond_1
    iget-object p2, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-virtual {p2}, Lcom/radaee/reader/PDFLayoutView;->PDFEndAnnot()V

    .line 509
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
    .locals 10

    .line 123
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-boolean v0, v0, Lcom/radaee/reader/PDFLayoutView;->scoll_lock:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    sget v0, Lcom/radaee/pdf/Global;->def_view:I

    if-le v0, v2, :cond_0

    return v1

    .line 125
    :cond_0
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iput-wide v3, v0, Lcom/radaee/reader/PDFLayoutView;->flingStartTime:J

    .line 126
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iput-boolean v2, v0, Lcom/radaee/reader/PDFLayoutView;->disableAnnotCheck:Z

    .line 127
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    if-nez v0, :cond_1

    return v1

    .line 128
    :cond_1
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    if-nez v0, :cond_8

    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-boolean v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_hold:Z

    if-eqz v0, :cond_8

    .line 129
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-boolean v0, v0, Lcom/radaee/reader/PDFLayoutView;->scoll_lock:Z

    if-eqz v0, :cond_2

    sget v0, Lcom/radaee/pdf/Global;->def_view:I

    if-ne v0, v2, :cond_2

    return v1

    .line 131
    :cond_2
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    sub-float v6, v0, v1

    .line 132
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    sub-float v7, p2, p1

    .line 133
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-boolean p1, p1, Lcom/radaee/reader/PDFLayoutView;->scoll_lock:Z

    const/4 p2, 0x0

    if-eqz p1, :cond_3

    sget p1, Lcom/radaee/pdf/Global;->def_view:I

    if-nez p1, :cond_3

    const/4 p3, 0x0

    .line 134
    :cond_3
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-boolean p1, p1, Lcom/radaee/reader/PDFLayoutView;->scoll_lock:Z

    if-eqz p1, :cond_4

    sget p1, Lcom/radaee/pdf/Global;->def_view:I

    if-ne p1, v2, :cond_4

    const/4 v9, 0x0

    goto :goto_0

    :cond_4
    move v9, p4

    .line 135
    :goto_0
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-boolean p1, p1, Lcom/radaee/reader/PDFLayoutView;->scoll_lock:Z

    if-nez p1, :cond_7

    sget p1, Lcom/radaee/pdf/Global;->def_view:I

    if-nez p1, :cond_7

    .line 136
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object p1, p1, Lcom/radaee/reader/PDFLayoutView;->vert_scroll_locked:Ljava/lang/Boolean;

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object p1, p1, Lcom/radaee/reader/PDFLayoutView;->vert_scroll_locked:Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_6

    :cond_5
    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    move-result p1

    float-to-double v0, p1

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result p1

    float-to-double v2, p1

    const-wide v4, 0x3fe6666666666666L    # 0.7

    mul-double v2, v2, v4

    cmpl-double p1, v0, v2

    if-lez p1, :cond_7

    :cond_6
    const/4 v8, 0x0

    goto :goto_1

    :cond_7
    move v8, p3

    .line 139
    :goto_1
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v3, p1, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {p1}, Lcom/radaee/reader/PDFLayoutView;->access$000(Lcom/radaee/reader/PDFLayoutView;)I

    move-result v4

    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {p1}, Lcom/radaee/reader/PDFLayoutView;->access$100(Lcom/radaee/reader/PDFLayoutView;)I

    move-result v5

    invoke-virtual/range {v3 .. v9}, Lcom/radaee/view/PDFLayout;->vFling(IIFFFF)Z

    move-result p1

    return p1

    :cond_8
    return v1
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 4

    .line 162
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/radaee/reader/PDFLayoutView;->disableAnnotCheck:Z

    .line 163
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    if-nez v0, :cond_0

    goto :goto_0

    .line 164
    :cond_0
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget v0, v0, Lcom/radaee/reader/PDFLayoutView;->m_status:I

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {v0}, Lcom/radaee/reader/PDFLayoutView;->access$200(Lcom/radaee/reader/PDFLayoutView;)Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 166
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    .line 167
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    .line 168
    iget-object v1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-object v1, v1, Lcom/radaee/reader/PDFLayoutView;->m_layout:Lcom/radaee/view/PDFLayout;

    float-to-int v2, v0

    float-to-int v3, p1

    invoke-virtual {v1, v2, v3}, Lcom/radaee/view/PDFLayout;->vGetPage(II)I

    move-result v1

    .line 169
    iget-object v2, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {v2}, Lcom/radaee/reader/PDFLayoutView;->access$200(Lcom/radaee/reader/PDFLayoutView;)Lcom/radaee/view/ILayoutView$PDFLayoutListener;

    move-result-object v2

    invoke-interface {v2, v1, v0, p1}, Lcom/radaee/view/ILayoutView$PDFLayoutListener;->OnPDFLongPressed(IFF)V

    :cond_1
    :goto_0
    return-void
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 0

    .line 175
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p2

    iput-wide p2, p1, Lcom/radaee/reader/PDFLayoutView;->scrollStartTime:J

    .line 176
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    const/4 p2, 0x1

    iput-boolean p2, p1, Lcom/radaee/reader/PDFLayoutView;->disableAnnotCheck:Z

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

    .line 192
    iget-object v0, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    invoke-direct {p0, p1}, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->hasAnnotTap(Landroid/view/MotionEvent;)Z

    move-result p1

    iput-boolean p1, v0, Lcom/radaee/reader/PDFLayoutView;->tapDownForAnnot:Z

    .line 193
    iget-object p1, p0, Lcom/radaee/reader/PDFLayoutView$PDFGestureListener;->this$0:Lcom/radaee/reader/PDFLayoutView;

    iget-boolean p1, p1, Lcom/radaee/reader/PDFLayoutView;->tapDownForAnnot:Z

    return p1
.end method
