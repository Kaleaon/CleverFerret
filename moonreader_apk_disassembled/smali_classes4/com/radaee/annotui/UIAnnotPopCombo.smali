.class public Lcom/radaee/annotui/UIAnnotPopCombo;
.super Lcom/radaee/annotui/UIAnnotPop;
.source "UIAnnotPopCombo.java"


# instance fields
.field private final m_combo:Lcom/radaee/util/ComboList;

.field private m_combo_item:I


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 2

    .line 16
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    sget v0, Lcom/radaee/viewlib/R$layout;->pop_combo:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/radaee/annotui/UIAnnotPop;-><init>(Landroid/view/View;)V

    .line 17
    sget p1, Lcom/radaee/viewlib/R$id;->annot_combo:I

    invoke-virtual {p0, p1}, Lcom/radaee/annotui/UIAnnotPopCombo;->findView(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/radaee/util/ComboList;

    iput-object p1, p0, Lcom/radaee/annotui/UIAnnotPopCombo;->m_combo:Lcom/radaee/util/ComboList;

    return-void
.end method

.method static synthetic access$002(Lcom/radaee/annotui/UIAnnotPopCombo;I)I
    .locals 0

    .line 12
    iput p1, p0, Lcom/radaee/annotui/UIAnnotPopCombo;->m_combo_item:I

    return p1
.end method


# virtual methods
.method public getSelItem()I
    .locals 1

    .line 47
    iget v0, p0, Lcom/radaee/annotui/UIAnnotPopCombo;->m_combo_item:I

    return v0
.end method

.method public update(Lcom/radaee/pdf/Page$Annotation;[F)V
    .locals 5

    .line 21
    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetComboItemCount()I

    move-result v0

    new-array v1, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v0, :cond_0

    .line 24
    invoke-virtual {p1, v3}, Lcom/radaee/pdf/Page$Annotation;->GetComboItem(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v1, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    .line 27
    invoke-virtual {p0, p1}, Lcom/radaee/annotui/UIAnnotPopCombo;->setFocusable(Z)V

    .line 28
    invoke-virtual {p0, p1}, Lcom/radaee/annotui/UIAnnotPopCombo;->setTouchable(Z)V

    .line 29
    new-instance v3, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v3, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {p0, v3}, Lcom/radaee/annotui/UIAnnotPopCombo;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    const/4 v3, 0x2

    .line 30
    aget v3, p2, v3

    aget v2, p2, v2

    sub-float/2addr v3, v2

    float-to-int v2, v3

    invoke-virtual {p0, v2}, Lcom/radaee/annotui/UIAnnotPopCombo;->setWidth(I)V

    const/4 v2, 0x3

    .line 31
    aget v2, p2, v2

    aget p1, p2, p1

    sub-float p2, v2, p1

    const/high16 v3, 0x40800000    # 4.0f

    sub-float/2addr p2, v3

    int-to-float v4, v0

    mul-float p2, p2, v4

    const/high16 v4, 0x437a0000    # 250.0f

    cmpl-float p2, p2, v4

    if-lez p2, :cond_1

    const/16 p1, 0xfa

    .line 32
    invoke-virtual {p0, p1}, Lcom/radaee/annotui/UIAnnotPopCombo;->setHeight(I)V

    goto :goto_1

    :cond_1
    sub-float/2addr v2, p1

    sub-float/2addr v2, v3

    float-to-int p1, v2

    mul-int p1, p1, v0

    .line 34
    invoke-virtual {p0, p1}, Lcom/radaee/annotui/UIAnnotPopCombo;->setHeight(I)V

    .line 35
    :goto_1
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotPopCombo;->m_combo:Lcom/radaee/util/ComboList;

    invoke-virtual {p1, v1}, Lcom/radaee/util/ComboList;->set_opts([Ljava/lang/String;)V

    const/4 p1, -0x1

    .line 36
    iput p1, p0, Lcom/radaee/annotui/UIAnnotPopCombo;->m_combo_item:I

    .line 37
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotPopCombo;->m_combo:Lcom/radaee/util/ComboList;

    new-instance p2, Lcom/radaee/annotui/UIAnnotPopCombo$1;

    invoke-direct {p2, p0}, Lcom/radaee/annotui/UIAnnotPopCombo$1;-><init>(Lcom/radaee/annotui/UIAnnotPopCombo;)V

    invoke-virtual {p1, p2}, Lcom/radaee/util/ComboList;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    return-void
.end method
