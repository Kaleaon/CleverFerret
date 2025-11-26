.class public Lcom/radaee/annotui/UIAnnotDlgLine;
.super Lcom/radaee/annotui/UIAnnotDlg;
.source "UIAnnotDlgLine.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 20
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    sget v0, Lcom/radaee/viewlib/R$layout;->dlg_annot_prop_line:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/RelativeLayout;

    invoke-direct {p0, p1}, Lcom/radaee/annotui/UIAnnotDlg;-><init>(Landroid/widget/RelativeLayout;)V

    const/4 p1, 0x0

    .line 21
    invoke-virtual {p0, p1}, Lcom/radaee/annotui/UIAnnotDlgLine;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 22
    sget p1, Lcom/radaee/viewlib/R$string;->ok:I

    new-instance v0, Lcom/radaee/annotui/UIAnnotDlgLine$1;

    invoke-direct {v0, p0}, Lcom/radaee/annotui/UIAnnotDlgLine$1;-><init>(Lcom/radaee/annotui/UIAnnotDlgLine;)V

    invoke-virtual {p0, p1, v0}, Lcom/radaee/annotui/UIAnnotDlgLine;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 65
    sget p1, Lcom/radaee/viewlib/R$string;->cancel:I

    new-instance v0, Lcom/radaee/annotui/UIAnnotDlgLine$2;

    invoke-direct {v0, p0}, Lcom/radaee/annotui/UIAnnotDlgLine$2;-><init>(Lcom/radaee/annotui/UIAnnotDlgLine;)V

    invoke-virtual {p0, p1, v0}, Lcom/radaee/annotui/UIAnnotDlgLine;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    return-void
.end method


# virtual methods
.method show(Lcom/radaee/pdf/Page$Annotation;Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;)V
    .locals 5

    .line 76
    const-string v0, "Line Property"

    invoke-virtual {p0, v0}, Lcom/radaee/annotui/UIAnnotDlgLine;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 77
    iput-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgLine;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    .line 78
    iput-object p2, p0, Lcom/radaee/annotui/UIAnnotDlgLine;->m_callback:Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;

    .line 80
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgLine;->m_layout:Landroid/widget/RelativeLayout;

    sget p2, Lcom/radaee/viewlib/R$id;->edit_lwidth:I

    invoke-virtual {p1, p2}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    .line 81
    iget-object p2, p0, Lcom/radaee/annotui/UIAnnotDlgLine;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p2}, Lcom/radaee/pdf/Page$Annotation;->GetStrokeWidth()F

    move-result p2

    invoke-static {p2}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 83
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgLine;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetStrokeColor()I

    move-result p1

    shr-int/lit8 p2, p1, 0x18

    const/16 v0, 0xff

    and-int/2addr p2, v0

    const/high16 v1, -0x1000000

    or-int/2addr p1, v1

    .line 86
    iget-object v2, p0, Lcom/radaee/annotui/UIAnnotDlgLine;->m_layout:Landroid/widget/RelativeLayout;

    sget v3, Lcom/radaee/viewlib/R$id;->btn_lcolor:I

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/radaee/annotui/UIColorButton;

    const/4 v3, 0x1

    .line 87
    invoke-virtual {v2, v3}, Lcom/radaee/annotui/UIColorButton;->setColorEnable(Z)V

    .line 88
    invoke-virtual {v2, p1}, Lcom/radaee/annotui/UIColorButton;->setColor(I)V

    .line 89
    invoke-virtual {v2, v3}, Lcom/radaee/annotui/UIColorButton;->setColorMode(Z)V

    .line 90
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgLine;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetFillColor()I

    move-result p1

    if-eqz p1, :cond_0

    or-int/2addr p1, v1

    .line 92
    :cond_0
    iget-object v1, p0, Lcom/radaee/annotui/UIAnnotDlgLine;->m_layout:Landroid/widget/RelativeLayout;

    sget v2, Lcom/radaee/viewlib/R$id;->btn_fcolor:I

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/radaee/annotui/UIColorButton;

    .line 93
    invoke-virtual {v1, p1}, Lcom/radaee/annotui/UIColorButton;->setColor(I)V

    const/4 v2, 0x0

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    .line 94
    :goto_0
    invoke-virtual {v1, p1}, Lcom/radaee/annotui/UIColorButton;->setColorEnable(Z)V

    .line 95
    invoke-virtual {v1, v2}, Lcom/radaee/annotui/UIColorButton;->setColorMode(Z)V

    .line 97
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgLine;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetLineStyle()I

    move-result p1

    .line 98
    iget-object v1, p0, Lcom/radaee/annotui/UIAnnotDlgLine;->m_layout:Landroid/widget/RelativeLayout;

    sget v4, Lcom/radaee/viewlib/R$id;->btn_lhead1:I

    invoke-virtual {v1, v4}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/radaee/annotui/UILHeadButton;

    const v4, 0xffff

    and-int/2addr v4, p1

    .line 99
    invoke-virtual {v1, v4}, Lcom/radaee/annotui/UILHeadButton;->setStyle(I)V

    .line 100
    iget-object v1, p0, Lcom/radaee/annotui/UIAnnotDlgLine;->m_layout:Landroid/widget/RelativeLayout;

    sget v4, Lcom/radaee/viewlib/R$id;->btn_lhead2:I

    invoke-virtual {v1, v4}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/radaee/annotui/UILHeadButton;

    shr-int/lit8 p1, p1, 0x10

    .line 101
    invoke-virtual {v1, p1}, Lcom/radaee/annotui/UILHeadButton;->setStyle(I)V

    .line 103
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgLine;->m_layout:Landroid/widget/RelativeLayout;

    sget v1, Lcom/radaee/viewlib/R$id;->seek_alpha:I

    invoke-virtual {p1, v1}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/SeekBar;

    .line 104
    iget-object v1, p0, Lcom/radaee/annotui/UIAnnotDlgLine;->m_layout:Landroid/widget/RelativeLayout;

    sget v4, Lcom/radaee/viewlib/R$id;->txt_alpha_val:I

    invoke-virtual {v1, v4}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 105
    invoke-virtual {p1, v0}, Landroid/widget/SeekBar;->setMax(I)V

    .line 106
    invoke-virtual {p1, p2}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 107
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    new-array v0, v3, [Ljava/lang/Object;

    aput-object p2, v0, v2

    const-string p2, "%d"

    invoke-static {p2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 108
    new-instance p2, Lcom/radaee/annotui/UIAnnotDlgLine$3;

    invoke-direct {p2, p0, v1}, Lcom/radaee/annotui/UIAnnotDlgLine$3;-><init>(Lcom/radaee/annotui/UIAnnotDlgLine;Landroid/widget/TextView;)V

    invoke-virtual {p1, p2}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 121
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgLine;->m_layout:Landroid/widget/RelativeLayout;

    sget p2, Lcom/radaee/viewlib/R$id;->chk_lock:I

    invoke-virtual {p1, p2}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/CheckBox;

    .line 122
    iget-object p2, p0, Lcom/radaee/annotui/UIAnnotDlgLine;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p2}, Lcom/radaee/pdf/Page$Annotation;->IsLocked()Z

    move-result p2

    if-eqz p2, :cond_2

    invoke-virtual {p1, v3}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 124
    :cond_2
    invoke-virtual {p0}, Lcom/radaee/annotui/UIAnnotDlgLine;->create()Landroid/app/AlertDialog;

    move-result-object p1

    .line 125
    invoke-virtual {p1}, Landroid/app/AlertDialog;->show()V

    return-void
.end method
