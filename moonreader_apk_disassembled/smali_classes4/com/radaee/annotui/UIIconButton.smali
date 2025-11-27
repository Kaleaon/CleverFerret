.class public Lcom/radaee/annotui/UIIconButton;
.super Landroid/widget/Button;
.source "UIIconButton.java"


# static fields
.field private static ms_density:F = -1.0f


# instance fields
.field private m_atype:I

.field private m_bmp:Landroid/graphics/Bitmap;

.field private m_icon:I

.field private m_layout:Landroid/widget/LinearLayout;

.field private m_popup:Lcom/radaee/annotui/UIAnnotPop;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 21
    invoke-direct {p0, p1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 24
    invoke-direct {p0, p1, p2}, Landroid/widget/Button;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method private Dp2Px(F)I
    .locals 2

    .line 28
    sget v0, Lcom/radaee/annotui/UIIconButton;->ms_density:F

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    invoke-virtual {p0}, Lcom/radaee/annotui/UIIconButton;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    sput v0, Lcom/radaee/annotui/UIIconButton;->ms_density:F

    .line 29
    :cond_0
    sget v0, Lcom/radaee/annotui/UIIconButton;->ms_density:F

    mul-float p1, p1, v0

    const/high16 v0, 0x3f000000    # 0.5f

    add-float/2addr p1, v0

    float-to-int p1, p1

    return p1
.end method

.method private Px2Dp(F)I
    .locals 2

    .line 33
    sget v0, Lcom/radaee/annotui/UIIconButton;->ms_density:F

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    invoke-virtual {p0}, Lcom/radaee/annotui/UIIconButton;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    sput v0, Lcom/radaee/annotui/UIIconButton;->ms_density:F

    .line 34
    :cond_0
    sget v0, Lcom/radaee/annotui/UIIconButton;->ms_density:F

    div-float/2addr p1, v0

    const/high16 v0, 0x3f000000    # 0.5f

    add-float/2addr p1, v0

    float-to-int p1, p1

    return p1
.end method

.method static synthetic access$000(Lcom/radaee/annotui/UIIconButton;)Lcom/radaee/annotui/UIAnnotPop;
    .locals 0

    .line 19
    iget-object p0, p0, Lcom/radaee/annotui/UIIconButton;->m_popup:Lcom/radaee/annotui/UIAnnotPop;

    return-object p0
.end method

.method static synthetic access$100(Lcom/radaee/annotui/UIIconButton;F)I
    .locals 0

    .line 19
    invoke-direct {p0, p1}, Lcom/radaee/annotui/UIIconButton;->Dp2Px(F)I

    move-result p0

    return p0
.end method

.method private init_attach()V
    .locals 6

    const/4 v0, 0x0

    .line 169
    invoke-virtual {p0, v0}, Lcom/radaee/annotui/UIIconButton;->setIcon(I)V

    const/4 v1, -0x1

    .line 170
    invoke-virtual {p0, v1}, Lcom/radaee/annotui/UIIconButton;->setBackgroundColor(I)V

    .line 172
    invoke-virtual {p0}, Lcom/radaee/annotui/UIIconButton;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/radaee/viewlib/R$layout;->pop_icon_attach:I

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    iput-object v1, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    .line 173
    new-instance v1, Lcom/radaee/annotui/UIIconButton$3;

    invoke-direct {v1, p0}, Lcom/radaee/annotui/UIIconButton$3;-><init>(Lcom/radaee/annotui/UIIconButton;)V

    .line 183
    iget-object v2, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    sget v3, Lcom/radaee/viewlib/R$id;->img_00:I

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 184
    invoke-direct {p0, v2, v0}, Lcom/radaee/annotui/UIIconButton;->setIcon(Landroid/widget/ImageView;I)V

    .line 185
    iget-object v2, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    sget v3, Lcom/radaee/viewlib/R$id;->view_00:I

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    .line 186
    new-instance v3, Ljava/lang/Integer;

    invoke-direct {v3, v0}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 187
    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 189
    iget-object v2, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    sget v3, Lcom/radaee/viewlib/R$id;->img_01:I

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    const/4 v3, 0x1

    .line 190
    invoke-direct {p0, v2, v3}, Lcom/radaee/annotui/UIIconButton;->setIcon(Landroid/widget/ImageView;I)V

    .line 191
    iget-object v2, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    sget v4, Lcom/radaee/viewlib/R$id;->view_01:I

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    .line 192
    new-instance v4, Ljava/lang/Integer;

    invoke-direct {v4, v3}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 193
    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 195
    iget-object v2, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    sget v4, Lcom/radaee/viewlib/R$id;->img_02:I

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    const/4 v4, 0x2

    .line 196
    invoke-direct {p0, v2, v4}, Lcom/radaee/annotui/UIIconButton;->setIcon(Landroid/widget/ImageView;I)V

    .line 197
    iget-object v2, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    sget v5, Lcom/radaee/viewlib/R$id;->view_02:I

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    .line 198
    new-instance v5, Ljava/lang/Integer;

    invoke-direct {v5, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 199
    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 201
    iget-object v2, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    sget v4, Lcom/radaee/viewlib/R$id;->img_03:I

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    const/4 v4, 0x3

    .line 202
    invoke-direct {p0, v2, v4}, Lcom/radaee/annotui/UIIconButton;->setIcon(Landroid/widget/ImageView;I)V

    .line 203
    iget-object v2, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    sget v5, Lcom/radaee/viewlib/R$id;->view_03:I

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    .line 204
    new-instance v5, Ljava/lang/Integer;

    invoke-direct {v5, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 205
    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 207
    new-instance v1, Lcom/radaee/annotui/UIAnnotPop;

    iget-object v2, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    const/high16 v4, 0x43200000    # 160.0f

    invoke-direct {p0, v4}, Lcom/radaee/annotui/UIIconButton;->Dp2Px(F)I

    move-result v4

    iget-object v5, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v5

    mul-int/lit8 v5, v5, 0x18

    int-to-float v5, v5

    invoke-direct {p0, v5}, Lcom/radaee/annotui/UIIconButton;->Dp2Px(F)I

    move-result v5

    invoke-direct {v1, v2, v4, v5}, Lcom/radaee/annotui/UIAnnotPop;-><init>(Landroid/view/View;II)V

    iput-object v1, p0, Lcom/radaee/annotui/UIIconButton;->m_popup:Lcom/radaee/annotui/UIAnnotPop;

    .line 208
    invoke-virtual {v1, v3}, Lcom/radaee/annotui/UIAnnotPop;->setFocusable(Z)V

    .line 209
    iget-object v1, p0, Lcom/radaee/annotui/UIIconButton;->m_popup:Lcom/radaee/annotui/UIAnnotPop;

    invoke-virtual {v1, v3}, Lcom/radaee/annotui/UIAnnotPop;->setTouchable(Z)V

    .line 210
    iget-object v1, p0, Lcom/radaee/annotui/UIIconButton;->m_popup:Lcom/radaee/annotui/UIAnnotPop;

    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v2, v0}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v1, v2}, Lcom/radaee/annotui/UIAnnotPop;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 211
    new-instance v0, Lcom/radaee/annotui/UIIconButton$4;

    invoke-direct {v0, p0}, Lcom/radaee/annotui/UIIconButton$4;-><init>(Lcom/radaee/annotui/UIIconButton;)V

    invoke-virtual {p0, v0}, Lcom/radaee/annotui/UIIconButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private init_text()V
    .locals 7

    const/4 v0, 0x0

    .line 40
    invoke-virtual {p0, v0}, Lcom/radaee/annotui/UIIconButton;->setIcon(I)V

    const/4 v1, -0x1

    .line 41
    invoke-virtual {p0, v1}, Lcom/radaee/annotui/UIIconButton;->setBackgroundColor(I)V

    .line 43
    invoke-virtual {p0}, Lcom/radaee/annotui/UIIconButton;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/radaee/viewlib/R$layout;->pop_icon_text:I

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    iput-object v1, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    .line 44
    new-instance v1, Lcom/radaee/annotui/UIIconButton$1;

    invoke-direct {v1, p0}, Lcom/radaee/annotui/UIIconButton$1;-><init>(Lcom/radaee/annotui/UIIconButton;)V

    .line 54
    iget-object v2, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    sget v3, Lcom/radaee/viewlib/R$id;->img_00:I

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 55
    invoke-direct {p0, v2, v0}, Lcom/radaee/annotui/UIIconButton;->setIcon(Landroid/widget/ImageView;I)V

    .line 56
    iget-object v2, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    sget v3, Lcom/radaee/viewlib/R$id;->view_00:I

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    .line 57
    new-instance v3, Ljava/lang/Integer;

    invoke-direct {v3, v0}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 58
    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 60
    iget-object v2, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    sget v3, Lcom/radaee/viewlib/R$id;->img_01:I

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    const/4 v3, 0x1

    .line 61
    invoke-direct {p0, v2, v3}, Lcom/radaee/annotui/UIIconButton;->setIcon(Landroid/widget/ImageView;I)V

    .line 62
    iget-object v2, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    sget v4, Lcom/radaee/viewlib/R$id;->view_01:I

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    .line 63
    new-instance v4, Ljava/lang/Integer;

    invoke-direct {v4, v3}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 64
    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 66
    iget-object v2, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    sget v4, Lcom/radaee/viewlib/R$id;->img_02:I

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    const/4 v4, 0x2

    .line 67
    invoke-direct {p0, v2, v4}, Lcom/radaee/annotui/UIIconButton;->setIcon(Landroid/widget/ImageView;I)V

    .line 68
    iget-object v2, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    sget v5, Lcom/radaee/viewlib/R$id;->view_02:I

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    .line 69
    new-instance v5, Ljava/lang/Integer;

    invoke-direct {v5, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 70
    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 72
    iget-object v2, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    sget v4, Lcom/radaee/viewlib/R$id;->img_03:I

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    const/4 v4, 0x3

    .line 73
    invoke-direct {p0, v2, v4}, Lcom/radaee/annotui/UIIconButton;->setIcon(Landroid/widget/ImageView;I)V

    .line 74
    iget-object v2, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    sget v5, Lcom/radaee/viewlib/R$id;->view_03:I

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    .line 75
    new-instance v5, Ljava/lang/Integer;

    invoke-direct {v5, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 76
    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 78
    iget-object v2, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    sget v4, Lcom/radaee/viewlib/R$id;->img_04:I

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    const/4 v4, 0x4

    .line 79
    invoke-direct {p0, v2, v4}, Lcom/radaee/annotui/UIIconButton;->setIcon(Landroid/widget/ImageView;I)V

    .line 80
    iget-object v2, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    sget v5, Lcom/radaee/viewlib/R$id;->view_04:I

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    .line 81
    new-instance v5, Ljava/lang/Integer;

    invoke-direct {v5, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 82
    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 84
    iget-object v2, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    sget v4, Lcom/radaee/viewlib/R$id;->img_05:I

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    const/4 v4, 0x5

    .line 85
    invoke-direct {p0, v2, v4}, Lcom/radaee/annotui/UIIconButton;->setIcon(Landroid/widget/ImageView;I)V

    .line 86
    iget-object v2, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    sget v5, Lcom/radaee/viewlib/R$id;->view_05:I

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    .line 87
    new-instance v5, Ljava/lang/Integer;

    invoke-direct {v5, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 88
    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 90
    iget-object v2, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    sget v4, Lcom/radaee/viewlib/R$id;->img_06:I

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    const/4 v4, 0x6

    .line 91
    invoke-direct {p0, v2, v4}, Lcom/radaee/annotui/UIIconButton;->setIcon(Landroid/widget/ImageView;I)V

    .line 92
    iget-object v2, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    sget v5, Lcom/radaee/viewlib/R$id;->view_06:I

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    .line 93
    new-instance v5, Ljava/lang/Integer;

    invoke-direct {v5, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 94
    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 96
    iget-object v2, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    sget v4, Lcom/radaee/viewlib/R$id;->img_07:I

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    const/4 v4, 0x7

    .line 97
    invoke-direct {p0, v2, v4}, Lcom/radaee/annotui/UIIconButton;->setIcon(Landroid/widget/ImageView;I)V

    .line 98
    iget-object v2, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    sget v5, Lcom/radaee/viewlib/R$id;->view_07:I

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    .line 99
    new-instance v5, Ljava/lang/Integer;

    invoke-direct {v5, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 100
    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 102
    iget-object v2, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    sget v4, Lcom/radaee/viewlib/R$id;->img_08:I

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    const/16 v4, 0x8

    .line 103
    invoke-direct {p0, v2, v4}, Lcom/radaee/annotui/UIIconButton;->setIcon(Landroid/widget/ImageView;I)V

    .line 104
    iget-object v2, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    sget v5, Lcom/radaee/viewlib/R$id;->view_08:I

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    .line 105
    new-instance v5, Ljava/lang/Integer;

    invoke-direct {v5, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 106
    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 108
    iget-object v2, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    sget v4, Lcom/radaee/viewlib/R$id;->img_09:I

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    const/16 v4, 0x9

    .line 109
    invoke-direct {p0, v2, v4}, Lcom/radaee/annotui/UIIconButton;->setIcon(Landroid/widget/ImageView;I)V

    .line 110
    iget-object v2, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    sget v5, Lcom/radaee/viewlib/R$id;->view_09:I

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    .line 111
    new-instance v5, Ljava/lang/Integer;

    invoke-direct {v5, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 112
    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 114
    iget-object v2, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    sget v4, Lcom/radaee/viewlib/R$id;->img_10:I

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    const/16 v4, 0xa

    .line 115
    invoke-direct {p0, v2, v4}, Lcom/radaee/annotui/UIIconButton;->setIcon(Landroid/widget/ImageView;I)V

    .line 116
    iget-object v2, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    sget v5, Lcom/radaee/viewlib/R$id;->view_10:I

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    .line 117
    new-instance v5, Ljava/lang/Integer;

    invoke-direct {v5, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 118
    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 120
    iget-object v2, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    sget v4, Lcom/radaee/viewlib/R$id;->img_11:I

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    const/16 v4, 0xb

    .line 121
    invoke-direct {p0, v2, v4}, Lcom/radaee/annotui/UIIconButton;->setIcon(Landroid/widget/ImageView;I)V

    .line 122
    iget-object v2, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    sget v5, Lcom/radaee/viewlib/R$id;->view_11:I

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    .line 123
    new-instance v5, Ljava/lang/Integer;

    invoke-direct {v5, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 124
    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 126
    iget-object v2, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    sget v4, Lcom/radaee/viewlib/R$id;->img_12:I

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    const/16 v4, 0xc

    .line 127
    invoke-direct {p0, v2, v4}, Lcom/radaee/annotui/UIIconButton;->setIcon(Landroid/widget/ImageView;I)V

    .line 128
    iget-object v2, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    sget v5, Lcom/radaee/viewlib/R$id;->view_12:I

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    .line 129
    new-instance v5, Ljava/lang/Integer;

    invoke-direct {v5, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 130
    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 132
    iget-object v2, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    sget v4, Lcom/radaee/viewlib/R$id;->img_13:I

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    const/16 v4, 0xd

    .line 133
    invoke-direct {p0, v2, v4}, Lcom/radaee/annotui/UIIconButton;->setIcon(Landroid/widget/ImageView;I)V

    .line 134
    iget-object v2, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    sget v5, Lcom/radaee/viewlib/R$id;->view_13:I

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    .line 135
    new-instance v5, Ljava/lang/Integer;

    invoke-direct {v5, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 136
    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 138
    iget-object v2, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    sget v4, Lcom/radaee/viewlib/R$id;->img_14:I

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    const/16 v4, 0xe

    .line 139
    invoke-direct {p0, v2, v4}, Lcom/radaee/annotui/UIIconButton;->setIcon(Landroid/widget/ImageView;I)V

    .line 140
    iget-object v2, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    sget v5, Lcom/radaee/viewlib/R$id;->view_14:I

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    .line 141
    new-instance v5, Ljava/lang/Integer;

    invoke-direct {v5, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 142
    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 144
    iget-object v2, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    sget v4, Lcom/radaee/viewlib/R$id;->img_15:I

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    const/16 v4, 0xf

    .line 145
    invoke-direct {p0, v2, v4}, Lcom/radaee/annotui/UIIconButton;->setIcon(Landroid/widget/ImageView;I)V

    .line 146
    iget-object v2, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    sget v5, Lcom/radaee/viewlib/R$id;->view_15:I

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    .line 147
    new-instance v5, Ljava/lang/Integer;

    invoke-direct {v5, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 148
    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 150
    new-instance v1, Lcom/radaee/annotui/UIAnnotPop;

    iget-object v2, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    const/high16 v4, 0x430c0000    # 140.0f

    invoke-direct {p0, v4}, Lcom/radaee/annotui/UIIconButton;->Dp2Px(F)I

    move-result v4

    iget-object v5, p0, Lcom/radaee/annotui/UIIconButton;->m_layout:Landroid/widget/LinearLayout;

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v5

    mul-int/lit8 v5, v5, 0x14

    int-to-float v5, v5

    invoke-direct {p0, v5}, Lcom/radaee/annotui/UIIconButton;->Dp2Px(F)I

    move-result v5

    const/high16 v6, 0x41a00000    # 20.0f

    invoke-direct {p0, v6}, Lcom/radaee/annotui/UIIconButton;->Dp2Px(F)I

    move-result v6

    add-int/2addr v5, v6

    invoke-direct {v1, v2, v4, v5}, Lcom/radaee/annotui/UIAnnotPop;-><init>(Landroid/view/View;II)V

    iput-object v1, p0, Lcom/radaee/annotui/UIIconButton;->m_popup:Lcom/radaee/annotui/UIAnnotPop;

    .line 151
    invoke-virtual {v1, v3}, Lcom/radaee/annotui/UIAnnotPop;->setFocusable(Z)V

    .line 152
    iget-object v1, p0, Lcom/radaee/annotui/UIIconButton;->m_popup:Lcom/radaee/annotui/UIAnnotPop;

    invoke-virtual {v1, v3}, Lcom/radaee/annotui/UIAnnotPop;->setTouchable(Z)V

    .line 153
    iget-object v1, p0, Lcom/radaee/annotui/UIIconButton;->m_popup:Lcom/radaee/annotui/UIAnnotPop;

    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v2, v0}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v1, v2}, Lcom/radaee/annotui/UIAnnotPop;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 154
    new-instance v0, Lcom/radaee/annotui/UIIconButton$2;

    invoke-direct {v0, p0}, Lcom/radaee/annotui/UIIconButton$2;-><init>(Lcom/radaee/annotui/UIIconButton;)V

    invoke-virtual {p0, v0}, Lcom/radaee/annotui/UIIconButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private setIcon(Landroid/widget/ImageView;I)V
    .locals 2

    const/16 v0, 0x30

    .line 226
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v0, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    const/4 v1, -0x1

    .line 227
    invoke-virtual {v0, v1}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 228
    iget v1, p0, Lcom/radaee/annotui/UIIconButton;->m_atype:I

    invoke-static {v1, p2, v0}, Lcom/radaee/pdf/Global;->drawAnnotIcon(IILandroid/graphics/Bitmap;)Z

    .line 229
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    return-void
.end method


# virtual methods
.method public getIcon()I
    .locals 1

    .line 242
    iget v0, p0, Lcom/radaee/annotui/UIIconButton;->m_icon:I

    return v0
.end method

.method public load(Lcom/radaee/pdf/Page$Annotation;)V
    .locals 1

    .line 236
    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetType()I

    move-result p1

    iput p1, p0, Lcom/radaee/annotui/UIIconButton;->m_atype:I

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 237
    invoke-direct {p0}, Lcom/radaee/annotui/UIIconButton;->init_text()V

    return-void

    :cond_0
    const/16 v0, 0x11

    if-ne p1, v0, :cond_1

    .line 238
    invoke-direct {p0}, Lcom/radaee/annotui/UIIconButton;->init_attach()V

    :cond_1
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 5

    .line 255
    iget-object v0, p0, Lcom/radaee/annotui/UIIconButton;->m_bmp:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    .line 256
    new-instance v1, Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/radaee/annotui/UIIconButton;->getWidth()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {p0}, Lcom/radaee/annotui/UIIconButton;->getHeight()I

    move-result v3

    int-to-float v3, v3

    const/4 v4, 0x0

    invoke-direct {v1, v4, v4, v2, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    :cond_0
    return-void
.end method

.method public setIcon(I)V
    .locals 2

    .line 246
    iput p1, p0, Lcom/radaee/annotui/UIIconButton;->m_icon:I

    const/16 p1, 0x30

    .line 247
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, p1, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/radaee/annotui/UIIconButton;->m_bmp:Landroid/graphics/Bitmap;

    const/4 v0, -0x1

    .line 248
    invoke-virtual {p1, v0}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 249
    iget p1, p0, Lcom/radaee/annotui/UIIconButton;->m_atype:I

    iget v0, p0, Lcom/radaee/annotui/UIIconButton;->m_icon:I

    iget-object v1, p0, Lcom/radaee/annotui/UIIconButton;->m_bmp:Landroid/graphics/Bitmap;

    invoke-static {p1, v0, v1}, Lcom/radaee/pdf/Global;->drawAnnotIcon(IILandroid/graphics/Bitmap;)Z

    .line 251
    invoke-virtual {p0}, Lcom/radaee/annotui/UIIconButton;->invalidate()V

    return-void
.end method
