.class public Lcom/radaee/annotui/UIAnnotDlgSignProp;
.super Lcom/radaee/annotui/UIAnnotDlg;
.source "UIAnnotDlgSignProp.java"


# instance fields
.field private m_doc:Lcom/radaee/pdf/Document;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 18
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    sget v0, Lcom/radaee/viewlib/R$layout;->dlg_annot_signprop:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/RelativeLayout;

    invoke-direct {p0, p1}, Lcom/radaee/annotui/UIAnnotDlg;-><init>(Landroid/widget/RelativeLayout;)V

    const/4 p1, 0x0

    .line 19
    invoke-virtual {p0, p1}, Lcom/radaee/annotui/UIAnnotDlgSignProp;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 20
    new-instance p1, Lcom/radaee/annotui/UIAnnotDlgSignProp$1;

    invoke-direct {p1, p0}, Lcom/radaee/annotui/UIAnnotDlgSignProp$1;-><init>(Lcom/radaee/annotui/UIAnnotDlgSignProp;)V

    const-string v0, "Close"

    invoke-virtual {p0, v0, p1}, Lcom/radaee/annotui/UIAnnotDlgSignProp;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    return-void
.end method


# virtual methods
.method public show(Lcom/radaee/pdf/Page$Annotation;Lcom/radaee/pdf/Document;Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;)V
    .locals 8

    .line 31
    const-string v0, "Annotation Property"

    invoke-virtual {p0, v0}, Lcom/radaee/annotui/UIAnnotDlgSignProp;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 32
    iput-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgSignProp;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    .line 33
    iput-object p2, p0, Lcom/radaee/annotui/UIAnnotDlgSignProp;->m_doc:Lcom/radaee/pdf/Document;

    .line 34
    iput-object p3, p0, Lcom/radaee/annotui/UIAnnotDlgSignProp;->m_callback:Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;

    .line 36
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgSignProp;->m_layout:Landroid/widget/RelativeLayout;

    sget p2, Lcom/radaee/viewlib/R$id;->txt_issue:I

    invoke-virtual {p1, p2}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    .line 37
    iget-object p2, p0, Lcom/radaee/annotui/UIAnnotDlgSignProp;->m_layout:Landroid/widget/RelativeLayout;

    sget p3, Lcom/radaee/viewlib/R$id;->txt_subject:I

    invoke-virtual {p2, p3}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    .line 38
    iget-object p3, p0, Lcom/radaee/annotui/UIAnnotDlgSignProp;->m_layout:Landroid/widget/RelativeLayout;

    sget v0, Lcom/radaee/viewlib/R$id;->txt_version:I

    invoke-virtual {p3, v0}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/TextView;

    .line 39
    iget-object v0, p0, Lcom/radaee/annotui/UIAnnotDlgSignProp;->m_layout:Landroid/widget/RelativeLayout;

    sget v1, Lcom/radaee/viewlib/R$id;->txt_reason:I

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 40
    iget-object v1, p0, Lcom/radaee/annotui/UIAnnotDlgSignProp;->m_layout:Landroid/widget/RelativeLayout;

    sget v2, Lcom/radaee/viewlib/R$id;->txt_location:I

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 41
    iget-object v2, p0, Lcom/radaee/annotui/UIAnnotDlgSignProp;->m_layout:Landroid/widget/RelativeLayout;

    sget v3, Lcom/radaee/viewlib/R$id;->txt_contact:I

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 42
    iget-object v3, p0, Lcom/radaee/annotui/UIAnnotDlgSignProp;->m_layout:Landroid/widget/RelativeLayout;

    sget v4, Lcom/radaee/viewlib/R$id;->txt_mod:I

    invoke-virtual {v3, v4}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 43
    iget-object v4, p0, Lcom/radaee/annotui/UIAnnotDlgSignProp;->m_layout:Landroid/widget/RelativeLayout;

    sget v5, Lcom/radaee/viewlib/R$id;->txt_verify:I

    invoke-virtual {v4, v5}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 45
    iget-object v5, p0, Lcom/radaee/annotui/UIAnnotDlgSignProp;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v5}, Lcom/radaee/pdf/Page$Annotation;->GetSign()Lcom/radaee/pdf/Sign;

    move-result-object v5

    .line 46
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Issue:"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Lcom/radaee/pdf/Sign;->GetIssue()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 47
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v6, "Subject:"

    invoke-direct {p1, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Lcom/radaee/pdf/Sign;->GetSubject()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "Version:"

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Lcom/radaee/pdf/Sign;->GetVersion()J

    move-result-wide v6

    invoke-virtual {p1, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 49
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "Reason:"

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Lcom/radaee/pdf/Sign;->GetReason()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "Location:"

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Lcom/radaee/pdf/Sign;->GetLocation()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "Contact:"

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Lcom/radaee/pdf/Sign;->GetContact()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 52
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "SignTime:"

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Lcom/radaee/pdf/Sign;->GetModDateTime()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 53
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgSignProp;->m_doc:Lcom/radaee/pdf/Document;

    invoke-virtual {p1, v5}, Lcom/radaee/pdf/Document;->VerifySign(Lcom/radaee/pdf/Sign;)I

    move-result p1

    if-nez p1, :cond_0

    .line 55
    const-string p1, "Verify:OK"

    invoke-virtual {v4, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 57
    :cond_0
    const-string p1, "Verify:Changed"

    invoke-virtual {v4, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 59
    :goto_0
    invoke-virtual {p0}, Lcom/radaee/annotui/UIAnnotDlgSignProp;->create()Landroid/app/AlertDialog;

    move-result-object p1

    .line 60
    invoke-virtual {p1}, Landroid/app/AlertDialog;->show()V

    return-void
.end method
