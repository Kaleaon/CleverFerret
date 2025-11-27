.class public Lcom/radaee/annotui/UIAnnotDlgSign;
.super Lcom/radaee/annotui/UIAnnotDlg;
.source "UIAnnotDlgSign.java"


# instance fields
.field private m_doc:Lcom/radaee/pdf/Document;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 7

    .line 32
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/radaee/viewlib/R$layout;->dlg_annot_signature:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    invoke-direct {p0, v0}, Lcom/radaee/annotui/UIAnnotDlg;-><init>(Landroid/widget/RelativeLayout;)V

    const/4 v0, 0x0

    .line 33
    invoke-virtual {p0, v0}, Lcom/radaee/annotui/UIAnnotDlgSign;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 34
    iget-object v1, p0, Lcom/radaee/annotui/UIAnnotDlgSign;->m_layout:Landroid/widget/RelativeLayout;

    sget v2, Lcom/radaee/viewlib/R$id;->btn_browser:I

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 35
    iget-object v2, p0, Lcom/radaee/annotui/UIAnnotDlgSign;->m_layout:Landroid/widget/RelativeLayout;

    sget v3, Lcom/radaee/viewlib/R$id;->edit_path:I

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    .line 36
    iget-object v3, p0, Lcom/radaee/annotui/UIAnnotDlgSign;->m_layout:Landroid/widget/RelativeLayout;

    sget v4, Lcom/radaee/viewlib/R$id;->edit_pswd:I

    invoke-virtual {v3, v4}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    .line 37
    iget-object v4, p0, Lcom/radaee/annotui/UIAnnotDlgSign;->m_layout:Landroid/widget/RelativeLayout;

    sget v5, Lcom/radaee/viewlib/R$id;->txt_cert:I

    invoke-virtual {v4, v5}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 38
    iget-object v5, p0, Lcom/radaee/annotui/UIAnnotDlgSign;->m_layout:Landroid/widget/RelativeLayout;

    sget v6, Lcom/radaee/viewlib/R$id;->txt_pswd:I

    invoke-virtual {v5, v6}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 40
    sget-boolean v6, Lcom/radaee/pdf/Global;->g_fake_sign:Z

    if-nez v6, :cond_0

    .line 41
    invoke-virtual {v1, v0}, Landroid/widget/Button;->setVisibility(I)V

    .line 42
    invoke-virtual {v2, v0}, Landroid/widget/EditText;->setVisibility(I)V

    .line 43
    invoke-virtual {v3, v0}, Landroid/widget/EditText;->setVisibility(I)V

    .line 44
    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 45
    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 46
    new-instance v0, Lcom/radaee/annotui/UIAnnotDlgSign$1;

    invoke-direct {v0, p0, p1}, Lcom/radaee/annotui/UIAnnotDlgSign$1;-><init>(Lcom/radaee/annotui/UIAnnotDlgSign;Landroid/content/Context;)V

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0

    :cond_0
    const/16 p1, 0x8

    .line 87
    invoke-virtual {v1, p1}, Landroid/widget/Button;->setVisibility(I)V

    .line 88
    invoke-virtual {v2, p1}, Landroid/widget/EditText;->setVisibility(I)V

    .line 89
    invoke-virtual {v3, p1}, Landroid/widget/EditText;->setVisibility(I)V

    .line 90
    invoke-virtual {v4, p1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 91
    invoke-virtual {v5, p1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 93
    :goto_0
    invoke-virtual {p0}, Lcom/radaee/annotui/UIAnnotDlgSign;->getContext()Landroid/content/Context;

    move-result-object p1

    sget v0, Lcom/radaee/viewlib/R$string;->ok:I

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    new-instance v0, Lcom/radaee/annotui/UIAnnotDlgSign$2;

    invoke-direct {v0, p0, v2, v3}, Lcom/radaee/annotui/UIAnnotDlgSign$2;-><init>(Lcom/radaee/annotui/UIAnnotDlgSign;Landroid/widget/EditText;Landroid/widget/EditText;)V

    invoke-virtual {p0, p1, v0}, Lcom/radaee/annotui/UIAnnotDlgSign;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 126
    invoke-virtual {p0}, Lcom/radaee/annotui/UIAnnotDlgSign;->getContext()Landroid/content/Context;

    move-result-object p1

    sget v0, Lcom/radaee/viewlib/R$string;->cancel:I

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    new-instance v0, Lcom/radaee/annotui/UIAnnotDlgSign$3;

    invoke-direct {v0, p0}, Lcom/radaee/annotui/UIAnnotDlgSign$3;-><init>(Lcom/radaee/annotui/UIAnnotDlgSign;)V

    invoke-virtual {p0, p1, v0}, Lcom/radaee/annotui/UIAnnotDlgSign;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 134
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgSign;->m_layout:Landroid/widget/RelativeLayout;

    new-instance v0, Lcom/radaee/annotui/UIAnnotDlgSign$4;

    invoke-direct {v0, p0}, Lcom/radaee/annotui/UIAnnotDlgSign$4;-><init>(Lcom/radaee/annotui/UIAnnotDlgSign;)V

    invoke-virtual {p1, v0}, Landroid/widget/RelativeLayout;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    return-void
.end method

.method static synthetic access$000(Lcom/radaee/annotui/UIAnnotDlgSign;)Lcom/radaee/pdf/Document;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/radaee/annotui/UIAnnotDlgSign;->m_doc:Lcom/radaee/pdf/Document;

    return-object p0
.end method

.method public static dp2px(Landroid/content/Context;F)F
    .locals 0

    .line 28
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    mul-float p1, p1, p0

    return p1
.end method


# virtual methods
.method protected forceWrapContent(Landroid/view/View;)V
    .locals 2

    .line 179
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 182
    :try_start_0
    check-cast v0, Landroid/view/View;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 186
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    const/4 v1, -0x2

    iput v1, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 187
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iput v1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    move-object p1, v0

    .line 189
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_0

    .line 190
    :catch_0
    invoke-virtual {p1}, Landroid/view/View;->requestLayout()V

    return-void
.end method

.method public show(Lcom/radaee/pdf/Page$Annotation;Lcom/radaee/pdf/Document;Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;)V
    .locals 0

    .line 169
    iput-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgSign;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    .line 170
    iput-object p2, p0, Lcom/radaee/annotui/UIAnnotDlgSign;->m_doc:Lcom/radaee/pdf/Document;

    .line 171
    iput-object p3, p0, Lcom/radaee/annotui/UIAnnotDlgSign;->m_callback:Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;

    .line 172
    invoke-virtual {p0}, Lcom/radaee/annotui/UIAnnotDlgSign;->create()Landroid/app/AlertDialog;

    move-result-object p1

    .line 173
    invoke-virtual {p1}, Landroid/app/AlertDialog;->show()V

    return-void
.end method
