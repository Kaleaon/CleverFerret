.class public Lcom/radaee/annotui/UIAnnotDlgIcon;
.super Lcom/radaee/annotui/UIAnnotDlg;
.source "UIAnnotDlgIcon.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 19
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    sget v0, Lcom/radaee/viewlib/R$layout;->dlg_annot_prop_icon:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/RelativeLayout;

    invoke-direct {p0, p1}, Lcom/radaee/annotui/UIAnnotDlg;-><init>(Landroid/widget/RelativeLayout;)V

    const/4 p1, 0x0

    .line 20
    invoke-virtual {p0, p1}, Lcom/radaee/annotui/UIAnnotDlgIcon;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 21
    sget p1, Lcom/radaee/viewlib/R$string;->ok:I

    new-instance v0, Lcom/radaee/annotui/UIAnnotDlgIcon$1;

    invoke-direct {v0, p0}, Lcom/radaee/annotui/UIAnnotDlgIcon$1;-><init>(Lcom/radaee/annotui/UIAnnotDlgIcon;)V

    invoke-virtual {p0, p1, v0}, Lcom/radaee/annotui/UIAnnotDlgIcon;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 50
    sget p1, Lcom/radaee/viewlib/R$string;->cancel:I

    new-instance v0, Lcom/radaee/annotui/UIAnnotDlgIcon$2;

    invoke-direct {v0, p0}, Lcom/radaee/annotui/UIAnnotDlgIcon$2;-><init>(Lcom/radaee/annotui/UIAnnotDlgIcon;)V

    invoke-virtual {p0, p1, v0}, Lcom/radaee/annotui/UIAnnotDlgIcon;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    return-void
.end method


# virtual methods
.method show(Lcom/radaee/pdf/Page$Annotation;Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;)V
    .locals 5

    .line 61
    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetType()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 62
    const-string v0, "Sticky Note Annotation Property"

    invoke-virtual {p0, v0}, Lcom/radaee/annotui/UIAnnotDlgIcon;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    goto :goto_0

    .line 63
    :cond_0
    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetType()I

    move-result v0

    const/16 v2, 0x11

    if-ne v0, v2, :cond_1

    .line 64
    const-string v0, "File Attachment Annotation Property"

    invoke-virtual {p0, v0}, Lcom/radaee/annotui/UIAnnotDlgIcon;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 65
    :cond_1
    :goto_0
    iput-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgIcon;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    .line 66
    iput-object p2, p0, Lcom/radaee/annotui/UIAnnotDlgIcon;->m_callback:Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;

    .line 68
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgIcon;->m_layout:Landroid/widget/RelativeLayout;

    sget p2, Lcom/radaee/viewlib/R$id;->btn_icon:I

    invoke-virtual {p1, p2}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/radaee/annotui/UIIconButton;

    .line 69
    iget-object p2, p0, Lcom/radaee/annotui/UIAnnotDlgIcon;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p1, p2}, Lcom/radaee/annotui/UIIconButton;->load(Lcom/radaee/pdf/Page$Annotation;)V

    .line 70
    iget-object p2, p0, Lcom/radaee/annotui/UIAnnotDlgIcon;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p2}, Lcom/radaee/pdf/Page$Annotation;->GetIcon()I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/radaee/annotui/UIIconButton;->setIcon(I)V

    .line 72
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgIcon;->m_layout:Landroid/widget/RelativeLayout;

    sget p2, Lcom/radaee/viewlib/R$id;->btn_fcolor:I

    invoke-virtual {p1, p2}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/radaee/annotui/UIColorButton;

    .line 73
    iget-object p2, p0, Lcom/radaee/annotui/UIAnnotDlgIcon;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p2}, Lcom/radaee/pdf/Page$Annotation;->GetFillColor()I

    move-result p2

    shr-int/lit8 v0, p2, 0x18

    const/16 v2, 0xff

    and-int/2addr v0, v2

    const/high16 v3, -0x1000000

    or-int/2addr p2, v3

    .line 77
    invoke-virtual {p1, p2}, Lcom/radaee/annotui/UIColorButton;->setColor(I)V

    .line 78
    invoke-virtual {p1, v1}, Lcom/radaee/annotui/UIColorButton;->setColorEnable(Z)V

    const/4 p2, 0x0

    .line 79
    invoke-virtual {p1, p2}, Lcom/radaee/annotui/UIColorButton;->setColorMode(Z)V

    .line 81
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgIcon;->m_layout:Landroid/widget/RelativeLayout;

    sget v3, Lcom/radaee/viewlib/R$id;->seek_alpha:I

    invoke-virtual {p1, v3}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/SeekBar;

    .line 82
    iget-object v3, p0, Lcom/radaee/annotui/UIAnnotDlgIcon;->m_layout:Landroid/widget/RelativeLayout;

    sget v4, Lcom/radaee/viewlib/R$id;->txt_alpha_val:I

    invoke-virtual {v3, v4}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 83
    invoke-virtual {p1, v2}, Landroid/widget/SeekBar;->setMax(I)V

    .line 84
    invoke-virtual {p1, v0}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 85
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    new-array v2, v1, [Ljava/lang/Object;

    aput-object v0, v2, p2

    const-string p2, "%d"

    invoke-static {p2, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 86
    new-instance p2, Lcom/radaee/annotui/UIAnnotDlgIcon$3;

    invoke-direct {p2, p0, v3}, Lcom/radaee/annotui/UIAnnotDlgIcon$3;-><init>(Lcom/radaee/annotui/UIAnnotDlgIcon;Landroid/widget/TextView;)V

    invoke-virtual {p1, p2}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 101
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgIcon;->m_layout:Landroid/widget/RelativeLayout;

    sget p2, Lcom/radaee/viewlib/R$id;->chk_lock:I

    invoke-virtual {p1, p2}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/CheckBox;

    .line 102
    iget-object p2, p0, Lcom/radaee/annotui/UIAnnotDlgIcon;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p2}, Lcom/radaee/pdf/Page$Annotation;->IsLocked()Z

    move-result p2

    if-eqz p2, :cond_2

    invoke-virtual {p1, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 104
    :cond_2
    invoke-virtual {p0}, Lcom/radaee/annotui/UIAnnotDlgIcon;->create()Landroid/app/AlertDialog;

    move-result-object p1

    .line 105
    invoke-virtual {p1}, Landroid/app/AlertDialog;->show()V

    return-void
.end method
