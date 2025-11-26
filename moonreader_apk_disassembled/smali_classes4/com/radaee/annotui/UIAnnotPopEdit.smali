.class public Lcom/radaee/annotui/UIAnnotPopEdit;
.super Lcom/radaee/annotui/UIAnnotPop;
.source "UIAnnotPopEdit.java"


# instance fields
.field private final m_edit:Landroid/widget/EditText;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 2

    .line 25
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    sget v0, Lcom/radaee/viewlib/R$layout;->pop_edit:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/radaee/annotui/UIAnnotPop;-><init>(Landroid/view/View;)V

    .line 26
    sget p1, Lcom/radaee/viewlib/R$id;->annot_text:I

    invoke-virtual {p0, p1}, Lcom/radaee/annotui/UIAnnotPopEdit;->findView(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    iput-object p1, p0, Lcom/radaee/annotui/UIAnnotPopEdit;->m_edit:Landroid/widget/EditText;

    return-void
.end method

.method static synthetic access$000(Lcom/radaee/annotui/UIAnnotPopEdit;)Landroid/widget/EditText;
    .locals 0

    .line 20
    iget-object p0, p0, Lcom/radaee/annotui/UIAnnotPopEdit;->m_edit:Landroid/widget/EditText;

    return-object p0
.end method


# virtual methods
.method public getContentHeight()I
    .locals 2

    .line 98
    iget-object v0, p0, Lcom/radaee/annotui/UIAnnotPopEdit;->m_edit:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getLineHeight()I

    move-result v0

    iget-object v1, p0, Lcom/radaee/annotui/UIAnnotPopEdit;->m_edit:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getLineCount()I

    move-result v1

    mul-int v0, v0, v1

    return v0
.end method

.method public getEditText()Ljava/lang/String;
    .locals 1

    .line 94
    iget-object v0, p0, Lcom/radaee/annotui/UIAnnotPopEdit;->m_edit:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public update(Lcom/radaee/pdf/Page$Annotation;[FF)V
    .locals 7

    const/4 v0, 0x1

    .line 30
    invoke-virtual {p0, v0}, Lcom/radaee/annotui/UIAnnotPopEdit;->setFocusable(Z)V

    .line 31
    invoke-virtual {p0, v0}, Lcom/radaee/annotui/UIAnnotPopEdit;->setTouchable(Z)V

    .line 32
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {p0, v1}, Lcom/radaee/annotui/UIAnnotPopEdit;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    const/4 v1, 0x2

    .line 33
    aget v3, p2, v1

    aget v4, p2, v2

    sub-float/2addr v3, v4

    float-to-int v3, v3

    invoke-virtual {p0, v3}, Lcom/radaee/annotui/UIAnnotPopEdit;->setWidth(I)V

    const/4 v3, 0x3

    .line 34
    aget v4, p2, v3

    aget v5, p2, v0

    sub-float/2addr v4, v5

    float-to-int v4, v4

    invoke-virtual {p0, v4}, Lcom/radaee/annotui/UIAnnotPopEdit;->setHeight(I)V

    .line 36
    new-instance v4, Landroid/widget/RelativeLayout$LayoutParams;

    aget v5, p2, v1

    aget v6, p2, v2

    sub-float/2addr v5, v6

    float-to-int v5, v5

    aget v6, p2, v3

    aget p2, p2, v0

    sub-float/2addr v6, p2

    float-to-int p2, v6

    invoke-direct {v4, v5, p2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 37
    iget-object p2, p0, Lcom/radaee/annotui/UIAnnotPopEdit;->m_edit:Landroid/widget/EditText;

    invoke-virtual {p2, v4}, Landroid/widget/EditText;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 38
    iget-object p2, p0, Lcom/radaee/annotui/UIAnnotPopEdit;->m_edit:Landroid/widget/EditText;

    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetEditText()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2, v4}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 39
    iget-object p2, p0, Lcom/radaee/annotui/UIAnnotPopEdit;->m_edit:Landroid/widget/EditText;

    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetEditTextSize()F

    move-result v4

    mul-float v4, v4, p3

    invoke-virtual {p2, v2, v4}, Landroid/widget/EditText;->setTextSize(IF)V

    .line 40
    iget-object p2, p0, Lcom/radaee/annotui/UIAnnotPopEdit;->m_edit:Landroid/widget/EditText;

    const/16 p3, -0x40

    invoke-virtual {p2, p3}, Landroid/widget/EditText;->setBackgroundColor(I)V

    .line 41
    iget-object p2, p0, Lcom/radaee/annotui/UIAnnotPopEdit;->m_edit:Landroid/widget/EditText;

    invoke-virtual {p2, v1, v1, v1, v1}, Landroid/widget/EditText;->setPadding(IIII)V

    .line 42
    iget-object p2, p0, Lcom/radaee/annotui/UIAnnotPopEdit;->m_edit:Landroid/widget/EditText;

    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetEditTextColor()I

    move-result p3

    const/high16 v4, -0x1000000

    or-int/2addr p3, v4

    invoke-virtual {p2, p3}, Landroid/widget/EditText;->setTextColor(I)V

    .line 43
    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetEditType()I

    move-result p2

    if-eq p2, v0, :cond_2

    if-eq p2, v1, :cond_1

    if-eq p2, v3, :cond_0

    goto :goto_0

    .line 53
    :cond_0
    iget-object p2, p0, Lcom/radaee/annotui/UIAnnotPopEdit;->m_edit:Landroid/widget/EditText;

    invoke-virtual {p2, v2}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 54
    iget-object p2, p0, Lcom/radaee/annotui/UIAnnotPopEdit;->m_edit:Landroid/widget/EditText;

    const p3, 0x20001

    invoke-virtual {p2, p3}, Landroid/widget/EditText;->setInputType(I)V

    goto :goto_0

    .line 49
    :cond_1
    iget-object p2, p0, Lcom/radaee/annotui/UIAnnotPopEdit;->m_edit:Landroid/widget/EditText;

    invoke-virtual {p2}, Landroid/widget/EditText;->setSingleLine()V

    .line 50
    iget-object p2, p0, Lcom/radaee/annotui/UIAnnotPopEdit;->m_edit:Landroid/widget/EditText;

    const/16 p3, 0x81

    invoke-virtual {p2, p3}, Landroid/widget/EditText;->setInputType(I)V

    goto :goto_0

    .line 45
    :cond_2
    iget-object p2, p0, Lcom/radaee/annotui/UIAnnotPopEdit;->m_edit:Landroid/widget/EditText;

    invoke-virtual {p2}, Landroid/widget/EditText;->setSingleLine()V

    .line 46
    iget-object p2, p0, Lcom/radaee/annotui/UIAnnotPopEdit;->m_edit:Landroid/widget/EditText;

    invoke-virtual {p2, v0}, Landroid/widget/EditText;->setInputType(I)V

    .line 57
    :goto_0
    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetEditMaxlen()I

    move-result p1

    const p2, 0x100008

    const/high16 p3, 0x100000

    if-le p1, p2, :cond_3

    .line 59
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotPopEdit;->m_edit:Landroid/widget/EditText;

    new-array p2, v0, [Landroid/text/InputFilter;

    new-instance v0, Landroid/text/InputFilter$LengthFilter;

    invoke-direct {v0, p3}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    aput-object v0, p2, v2

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    goto :goto_1

    :cond_3
    if-lez p1, :cond_4

    .line 61
    iget-object p2, p0, Lcom/radaee/annotui/UIAnnotPopEdit;->m_edit:Landroid/widget/EditText;

    new-array p3, v0, [Landroid/text/InputFilter;

    new-instance v0, Landroid/text/InputFilter$LengthFilter;

    invoke-direct {v0, p1}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    aput-object v0, p3, v2

    invoke-virtual {p2, p3}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    goto :goto_1

    .line 63
    :cond_4
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotPopEdit;->m_edit:Landroid/widget/EditText;

    new-array p2, v0, [Landroid/text/InputFilter;

    new-instance v0, Landroid/text/InputFilter$LengthFilter;

    invoke-direct {v0, p3}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    aput-object v0, p2, v2

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    .line 65
    :goto_1
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotPopEdit;->m_edit:Landroid/widget/EditText;

    new-instance p2, Lcom/radaee/annotui/UIAnnotPopEdit$1;

    invoke-direct {p2, p0}, Lcom/radaee/annotui/UIAnnotPopEdit$1;-><init>(Lcom/radaee/annotui/UIAnnotPopEdit;)V

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 79
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotPopEdit;->m_edit:Landroid/widget/EditText;

    new-instance p2, Lcom/radaee/annotui/UIAnnotPopEdit$2;

    invoke-direct {p2, p0}, Lcom/radaee/annotui/UIAnnotPopEdit$2;-><init>(Lcom/radaee/annotui/UIAnnotPopEdit;)V

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 90
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotPopEdit;->m_edit:Landroid/widget/EditText;

    invoke-virtual {p1, v2}, Landroid/widget/EditText;->setVisibility(I)V

    return-void
.end method
