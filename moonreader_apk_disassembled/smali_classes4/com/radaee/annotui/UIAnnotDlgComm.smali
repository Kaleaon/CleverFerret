.class public Lcom/radaee/annotui/UIAnnotDlgComm;
.super Lcom/radaee/annotui/UIAnnotDlg;
.source "UIAnnotDlgComm.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 20
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    sget v0, Lcom/radaee/viewlib/R$layout;->dlg_annot_prop_comm:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/RelativeLayout;

    invoke-direct {p0, p1}, Lcom/radaee/annotui/UIAnnotDlg;-><init>(Landroid/widget/RelativeLayout;)V

    const/4 p1, 0x0

    .line 21
    invoke-virtual {p0, p1}, Lcom/radaee/annotui/UIAnnotDlgComm;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 22
    sget p1, Lcom/radaee/viewlib/R$string;->ok:I

    new-instance v0, Lcom/radaee/annotui/UIAnnotDlgComm$1;

    invoke-direct {v0, p0}, Lcom/radaee/annotui/UIAnnotDlgComm$1;-><init>(Lcom/radaee/annotui/UIAnnotDlgComm;)V

    invoke-virtual {p0, p1, v0}, Lcom/radaee/annotui/UIAnnotDlgComm;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 66
    sget p1, Lcom/radaee/viewlib/R$string;->cancel:I

    new-instance v0, Lcom/radaee/annotui/UIAnnotDlgComm$2;

    invoke-direct {v0, p0}, Lcom/radaee/annotui/UIAnnotDlgComm$2;-><init>(Lcom/radaee/annotui/UIAnnotDlgComm;)V

    invoke-virtual {p0, p1, v0}, Lcom/radaee/annotui/UIAnnotDlgComm;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    return-void
.end method


# virtual methods
.method show(Lcom/radaee/pdf/Page$Annotation;ZLcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;)V
    .locals 4

    .line 77
    const-string v0, "Annotation Property"

    invoke-virtual {p0, v0}, Lcom/radaee/annotui/UIAnnotDlgComm;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 78
    iput-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgComm;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    .line 79
    iput-object p3, p0, Lcom/radaee/annotui/UIAnnotDlgComm;->m_callback:Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;

    .line 81
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgComm;->m_layout:Landroid/widget/RelativeLayout;

    sget p3, Lcom/radaee/viewlib/R$id;->edit_lwidth:I

    invoke-virtual {p1, p3}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    .line 82
    iget-object p3, p0, Lcom/radaee/annotui/UIAnnotDlgComm;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p3}, Lcom/radaee/pdf/Page$Annotation;->GetStrokeWidth()F

    move-result p3

    invoke-static {p3}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 83
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgComm;->m_layout:Landroid/widget/RelativeLayout;

    sget p3, Lcom/radaee/viewlib/R$id;->btn_lstyle:I

    invoke-virtual {p1, p3}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/radaee/annotui/UILStyleButton;

    const/4 p3, 0x0

    .line 84
    invoke-virtual {p1, p3}, Lcom/radaee/annotui/UILStyleButton;->setDash([F)V

    .line 86
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgComm;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetStrokeColor()I

    move-result p1

    shr-int/lit8 p3, p1, 0x18

    const/16 v0, 0xff

    and-int/2addr p3, v0

    const/high16 v1, -0x1000000

    or-int/2addr p1, v1

    .line 89
    iget-object v2, p0, Lcom/radaee/annotui/UIAnnotDlgComm;->m_layout:Landroid/widget/RelativeLayout;

    sget v3, Lcom/radaee/viewlib/R$id;->btn_lcolor:I

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/radaee/annotui/UIColorButton;

    const/4 v3, 0x1

    .line 90
    invoke-virtual {v2, v3}, Lcom/radaee/annotui/UIColorButton;->setColorEnable(Z)V

    .line 91
    invoke-virtual {v2, p1}, Lcom/radaee/annotui/UIColorButton;->setColor(I)V

    .line 92
    invoke-virtual {v2, v3}, Lcom/radaee/annotui/UIColorButton;->setColorMode(Z)V

    .line 94
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgComm;->m_layout:Landroid/widget/RelativeLayout;

    sget v2, Lcom/radaee/viewlib/R$id;->btn_fcolor:I

    invoke-virtual {p1, v2}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/radaee/annotui/UIColorButton;

    const/4 v2, 0x0

    if-eqz p2, :cond_2

    .line 96
    iget-object p2, p0, Lcom/radaee/annotui/UIAnnotDlgComm;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p2}, Lcom/radaee/pdf/Page$Annotation;->GetFillColor()I

    move-result p2

    if-eqz p2, :cond_0

    or-int/2addr p2, v1

    .line 98
    :cond_0
    invoke-virtual {p1, p2}, Lcom/radaee/annotui/UIColorButton;->setColor(I)V

    if-eqz p2, :cond_1

    const/4 p2, 0x1

    goto :goto_0

    :cond_1
    const/4 p2, 0x0

    .line 99
    :goto_0
    invoke-virtual {p1, p2}, Lcom/radaee/annotui/UIColorButton;->setColorEnable(Z)V

    .line 100
    invoke-virtual {p1, v2}, Lcom/radaee/annotui/UIColorButton;->setColorMode(Z)V

    goto :goto_1

    .line 102
    :cond_2
    iget-object p2, p0, Lcom/radaee/annotui/UIAnnotDlgComm;->m_layout:Landroid/widget/RelativeLayout;

    sget v1, Lcom/radaee/viewlib/R$id;->txt_fcolor:I

    invoke-virtual {p2, v1}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    const/16 v1, 0x8

    .line 103
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 104
    invoke-virtual {p1, v1}, Lcom/radaee/annotui/UIColorButton;->setVisibility(I)V

    .line 107
    :goto_1
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgComm;->m_layout:Landroid/widget/RelativeLayout;

    sget p2, Lcom/radaee/viewlib/R$id;->seek_alpha:I

    invoke-virtual {p1, p2}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/SeekBar;

    .line 108
    iget-object p2, p0, Lcom/radaee/annotui/UIAnnotDlgComm;->m_layout:Landroid/widget/RelativeLayout;

    sget v1, Lcom/radaee/viewlib/R$id;->txt_alpha_val:I

    invoke-virtual {p2, v1}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    .line 109
    invoke-virtual {p1, v0}, Landroid/widget/SeekBar;->setMax(I)V

    .line 110
    invoke-virtual {p1, p3}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 111
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    new-array v0, v3, [Ljava/lang/Object;

    aput-object p3, v0, v2

    const-string p3, "%d"

    invoke-static {p3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 112
    new-instance p3, Lcom/radaee/annotui/UIAnnotDlgComm$3;

    invoke-direct {p3, p0, p2}, Lcom/radaee/annotui/UIAnnotDlgComm$3;-><init>(Lcom/radaee/annotui/UIAnnotDlgComm;Landroid/widget/TextView;)V

    invoke-virtual {p1, p3}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 127
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgComm;->m_layout:Landroid/widget/RelativeLayout;

    sget p2, Lcom/radaee/viewlib/R$id;->chk_lock:I

    invoke-virtual {p1, p2}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/CheckBox;

    .line 128
    iget-object p2, p0, Lcom/radaee/annotui/UIAnnotDlgComm;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p2}, Lcom/radaee/pdf/Page$Annotation;->IsLocked()Z

    move-result p2

    if-eqz p2, :cond_3

    invoke-virtual {p1, v3}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 130
    :cond_3
    invoke-virtual {p0}, Lcom/radaee/annotui/UIAnnotDlgComm;->create()Landroid/app/AlertDialog;

    move-result-object p1

    .line 131
    invoke-virtual {p1}, Landroid/app/AlertDialog;->show()V

    return-void
.end method
