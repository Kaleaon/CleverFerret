.class public Lcom/radaee/annotui/UIAnnotDlgPopup;
.super Lcom/radaee/annotui/UIAnnotDlg;
.source "UIAnnotDlgPopup.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 16
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    sget v0, Lcom/radaee/viewlib/R$layout;->dlg_annot_popup:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/RelativeLayout;

    invoke-direct {p0, p1}, Lcom/radaee/annotui/UIAnnotDlg;-><init>(Landroid/widget/RelativeLayout;)V

    const/4 p1, 0x0

    .line 17
    invoke-virtual {p0, p1}, Lcom/radaee/annotui/UIAnnotDlgPopup;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 18
    sget p1, Lcom/radaee/viewlib/R$string;->ok:I

    new-instance v0, Lcom/radaee/annotui/UIAnnotDlgPopup$1;

    invoke-direct {v0, p0}, Lcom/radaee/annotui/UIAnnotDlgPopup$1;-><init>(Lcom/radaee/annotui/UIAnnotDlgPopup;)V

    invoke-virtual {p0, p1, v0}, Lcom/radaee/annotui/UIAnnotDlgPopup;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 30
    sget p1, Lcom/radaee/viewlib/R$string;->cancel:I

    new-instance v0, Lcom/radaee/annotui/UIAnnotDlgPopup$2;

    invoke-direct {v0, p0}, Lcom/radaee/annotui/UIAnnotDlgPopup$2;-><init>(Lcom/radaee/annotui/UIAnnotDlgPopup;)V

    invoke-virtual {p0, p1, v0}, Lcom/radaee/annotui/UIAnnotDlgPopup;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    return-void
.end method


# virtual methods
.method public show(Lcom/radaee/pdf/Page$Annotation;Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;)V
    .locals 0

    .line 41
    iput-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgPopup;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    .line 42
    iput-object p2, p0, Lcom/radaee/annotui/UIAnnotDlgPopup;->m_callback:Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;

    .line 43
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgPopup;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetPopupLabel()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 44
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_0

    goto :goto_0

    .line 47
    :cond_0
    invoke-virtual {p0, p1}, Lcom/radaee/annotui/UIAnnotDlgPopup;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    goto :goto_1

    .line 45
    :cond_1
    :goto_0
    const-string p1, "Popup Text"

    invoke-virtual {p0, p1}, Lcom/radaee/annotui/UIAnnotDlgPopup;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 48
    :goto_1
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgPopup;->m_layout:Landroid/widget/RelativeLayout;

    sget p2, Lcom/radaee/viewlib/R$id;->txt_subj:I

    invoke-virtual {p1, p2}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    .line 49
    iget-object p2, p0, Lcom/radaee/annotui/UIAnnotDlgPopup;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p2}, Lcom/radaee/pdf/Page$Annotation;->GetPopupSubject()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 50
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgPopup;->m_layout:Landroid/widget/RelativeLayout;

    sget p2, Lcom/radaee/viewlib/R$id;->txt_content:I

    invoke-virtual {p1, p2}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    .line 51
    iget-object p2, p0, Lcom/radaee/annotui/UIAnnotDlgPopup;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p2}, Lcom/radaee/pdf/Page$Annotation;->GetPopupText()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 52
    invoke-virtual {p0}, Lcom/radaee/annotui/UIAnnotDlgPopup;->create()Landroid/app/AlertDialog;

    move-result-object p1

    .line 53
    invoke-virtual {p1}, Landroid/app/AlertDialog;->show()V

    return-void
.end method
