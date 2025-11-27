.class public Lcom/radaee/annotui/UIAnnotMenu;
.super Ljava/lang/Object;
.source "UIAnnotMenu.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;
    }
.end annotation


# static fields
.field private static ms_density:F = -1.0f


# instance fields
.field private m_annot:Lcom/radaee/pdf/Page$Annotation;

.field private m_callback:Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;

.field private m_has_edit:Ljava/lang/Boolean;

.field private m_has_perform:Ljava/lang/Boolean;

.field private m_has_property:Ljava/lang/Boolean;

.field private m_has_remove:Ljava/lang/Boolean;

.field private final m_view:Landroid/widget/LinearLayout;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/widget/RelativeLayout;)V
    .locals 3

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    invoke-virtual {p1}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/radaee/viewlib/R$layout;->pop_annot:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/radaee/annotui/UIAnnotMenu;->m_view:Landroid/widget/LinearLayout;

    .line 48
    invoke-virtual {p1, v0}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    const/16 p1, 0x8

    .line 49
    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 50
    new-instance p1, Landroid/widget/RelativeLayout$LayoutParams;

    .line 51
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/radaee/viewlib/R$dimen;->annot_menu_btn_size:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v1

    const/4 v2, -0x2

    invoke-direct {p1, v2, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 52
    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 54
    sget p1, Lcom/radaee/viewlib/R$id;->btn_annot_edit:I

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageButton;

    .line 55
    new-instance v1, Lcom/radaee/annotui/UIAnnotMenu$1;

    invoke-direct {v1, p0}, Lcom/radaee/annotui/UIAnnotMenu$1;-><init>(Lcom/radaee/annotui/UIAnnotMenu;)V

    invoke-virtual {p1, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 62
    sget p1, Lcom/radaee/viewlib/R$id;->btn_annot_property:I

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageButton;

    .line 63
    new-instance v1, Lcom/radaee/annotui/UIAnnotMenu$2;

    invoke-direct {v1, p0}, Lcom/radaee/annotui/UIAnnotMenu$2;-><init>(Lcom/radaee/annotui/UIAnnotMenu;)V

    invoke-virtual {p1, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 98
    sget p1, Lcom/radaee/viewlib/R$id;->btn_annot_remove:I

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageButton;

    .line 99
    new-instance v1, Lcom/radaee/annotui/UIAnnotMenu$3;

    invoke-direct {v1, p0}, Lcom/radaee/annotui/UIAnnotMenu$3;-><init>(Lcom/radaee/annotui/UIAnnotMenu;)V

    invoke-virtual {p1, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 107
    sget p1, Lcom/radaee/viewlib/R$id;->btn_annot_perform:I

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageButton;

    .line 108
    new-instance v0, Lcom/radaee/annotui/UIAnnotMenu$4;

    invoke-direct {v0, p0}, Lcom/radaee/annotui/UIAnnotMenu$4;-><init>(Lcom/radaee/annotui/UIAnnotMenu;)V

    invoke-virtual {p1, v0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private Dp2Px(F)I
    .locals 2

    .line 35
    sget v0, Lcom/radaee/annotui/UIAnnotMenu;->ms_density:F

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    .line 36
    iget-object v0, p0, Lcom/radaee/annotui/UIAnnotMenu;->m_view:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    sput v0, Lcom/radaee/annotui/UIAnnotMenu;->ms_density:F

    .line 37
    :cond_0
    sget v0, Lcom/radaee/annotui/UIAnnotMenu;->ms_density:F

    mul-float p1, p1, v0

    const/high16 v0, 0x3f000000    # 0.5f

    add-float/2addr p1, v0

    float-to-int p1, p1

    return p1
.end method

.method private Px2Dp(F)I
    .locals 2

    .line 41
    sget v0, Lcom/radaee/annotui/UIAnnotMenu;->ms_density:F

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    .line 42
    iget-object v0, p0, Lcom/radaee/annotui/UIAnnotMenu;->m_view:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    sput v0, Lcom/radaee/annotui/UIAnnotMenu;->ms_density:F

    .line 43
    :cond_0
    sget v0, Lcom/radaee/annotui/UIAnnotMenu;->ms_density:F

    div-float/2addr p1, v0

    const/high16 v0, 0x3f000000    # 0.5f

    add-float/2addr p1, v0

    float-to-int p1, p1

    return p1
.end method

.method static synthetic access$000(Lcom/radaee/annotui/UIAnnotMenu;)Lcom/radaee/pdf/Page$Annotation;
    .locals 0

    .line 12
    iget-object p0, p0, Lcom/radaee/annotui/UIAnnotMenu;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    return-object p0
.end method

.method static synthetic access$100(Lcom/radaee/annotui/UIAnnotMenu;)Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;
    .locals 0

    .line 12
    iget-object p0, p0, Lcom/radaee/annotui/UIAnnotMenu;->m_callback:Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;

    return-object p0
.end method

.method static synthetic access$200(Lcom/radaee/annotui/UIAnnotMenu;)Landroid/widget/LinearLayout;
    .locals 0

    .line 12
    iget-object p0, p0, Lcom/radaee/annotui/UIAnnotMenu;->m_view:Landroid/widget/LinearLayout;

    return-object p0
.end method

.method private calculateX([FI)F
    .locals 5

    .line 167
    iget-object v0, p0, Lcom/radaee/annotui/UIAnnotMenu;->m_view:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v0, v0

    const/4 v1, 0x2

    .line 168
    aget v1, p1, v1

    const/4 v2, 0x0

    aget v3, p1, v2

    sub-float/2addr v1, v3

    .line 169
    iget-object v3, p0, Lcom/radaee/annotui/UIAnnotMenu;->m_view:Landroid/widget/LinearLayout;

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v4, Lcom/radaee/viewlib/R$dimen;->annot_menu_btn_size:I

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v3

    mul-int p2, p2, v3

    int-to-float p2, p2

    .line 170
    aget p1, p1, v2

    sub-float/2addr v1, p2

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    add-float/2addr p1, v1

    add-float/2addr p2, p1

    cmpl-float v1, p2, v0

    if-ltz v1, :cond_0

    sub-float/2addr p2, v0

    .line 172
    iget-object v0, p0, Lcom/radaee/annotui/UIAnnotMenu;->m_view:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/radaee/viewlib/R$dimen;->annot_menu_bar_margin:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v0

    int-to-float v0, v0

    add-float/2addr p2, v0

    sub-float/2addr p1, p2

    return p1

    :cond_0
    const/4 p2, 0x0

    cmpg-float p2, p1, p2

    if-gtz p2, :cond_1

    .line 174
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotMenu;->m_view:Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget p2, Lcom/radaee/viewlib/R$dimen;->annot_menu_bar_margin:I

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result p1

    int-to-float p1, p1

    :cond_1
    return p1
.end method

.method private calculateY([F)F
    .locals 4

    const/4 v0, 0x1

    .line 180
    aget v0, p1, v0

    iget-object v1, p0, Lcom/radaee/annotui/UIAnnotMenu;->m_view:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/radaee/viewlib/R$dimen;->annot_menu_btn_size:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v1

    iget-object v2, p0, Lcom/radaee/annotui/UIAnnotMenu;->m_view:Landroid/widget/LinearLayout;

    .line 181
    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/radaee/viewlib/R$dimen;->annot_menu_bar_margin:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v2

    add-int/2addr v1, v2

    int-to-float v1, v1

    sub-float/2addr v0, v1

    const/4 v1, 0x0

    cmpg-float v1, v0, v1

    if-gez v1, :cond_0

    const/4 v0, 0x3

    .line 182
    aget p1, p1, v0

    iget-object v0, p0, Lcom/radaee/annotui/UIAnnotMenu;->m_view:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/radaee/viewlib/R$dimen;->annot_menu_bar_margin:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v0

    int-to-float v0, v0

    add-float/2addr p1, v0

    return p1

    :cond_0
    return v0
.end method


# virtual methods
.method public hide()V
    .locals 2

    .line 163
    iget-object v0, p0, Lcom/radaee/annotui/UIAnnotMenu;->m_view:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    return-void
.end method

.method public show(Lcom/radaee/pdf/Page$Annotation;[FLcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;)Z
    .locals 6

    .line 119
    iput-object p1, p0, Lcom/radaee/annotui/UIAnnotMenu;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    .line 120
    iput-object p3, p0, Lcom/radaee/annotui/UIAnnotMenu;->m_callback:Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;

    .line 121
    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->GetType()I

    move-result p1

    const/16 p3, 0x14

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eq p1, p3, :cond_0

    const/4 p3, 0x3

    if-eq p1, p3, :cond_0

    const/4 p3, 0x1

    goto :goto_0

    :cond_0
    const/4 p3, 0x0

    :goto_0
    const/4 v2, 0x2

    if-eq p1, v2, :cond_2

    const/16 v3, 0x11

    if-eq p1, v3, :cond_2

    const/16 v3, 0x12

    if-eq p1, v3, :cond_2

    const/16 v3, 0x13

    if-eq p1, v3, :cond_2

    const/16 v3, 0x15

    if-eq p1, v3, :cond_2

    const/16 v3, 0x19

    if-eq p1, v3, :cond_2

    const/16 v3, 0x1a

    if-ne p1, v3, :cond_1

    goto :goto_1

    :cond_1
    const/4 v3, 0x0

    goto :goto_2

    :cond_2
    :goto_1
    const/4 v3, 0x1

    .line 123
    :goto_2
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    iput-object v3, p0, Lcom/radaee/annotui/UIAnnotMenu;->m_has_perform:Ljava/lang/Boolean;

    const/16 v3, 0xd

    const/16 v4, 0x8

    if-eq p1, v0, :cond_4

    const/4 v5, 0x4

    if-eq p1, v5, :cond_4

    const/4 v5, 0x5

    if-eq p1, v5, :cond_4

    const/4 v5, 0x6

    if-eq p1, v5, :cond_4

    const/4 v5, 0x7

    if-eq p1, v5, :cond_4

    if-eq p1, v4, :cond_4

    const/16 v5, 0x9

    if-eq p1, v5, :cond_4

    const/16 v5, 0xa

    if-eq p1, v5, :cond_4

    const/16 v5, 0xb

    if-eq p1, v5, :cond_4

    const/16 v5, 0xc

    if-eq p1, v5, :cond_4

    if-eq p1, v3, :cond_4

    const/16 v5, 0xf

    if-ne p1, v5, :cond_3

    goto :goto_3

    :cond_3
    const/4 v5, 0x0

    goto :goto_4

    :cond_4
    :goto_3
    const/4 v5, 0x1

    .line 124
    :goto_4
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    iput-object v5, p0, Lcom/radaee/annotui/UIAnnotMenu;->m_has_edit:Ljava/lang/Boolean;

    if-eqz p1, :cond_5

    const/4 v5, 0x1

    goto :goto_5

    :cond_5
    const/4 v5, 0x0

    .line 127
    :goto_5
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    iput-object v5, p0, Lcom/radaee/annotui/UIAnnotMenu;->m_has_remove:Ljava/lang/Boolean;

    if-eqz p1, :cond_6

    if-eq p1, v2, :cond_6

    if-eq p1, v3, :cond_6

    const/4 p1, 0x1

    goto :goto_6

    :cond_6
    const/4 p1, 0x0

    .line 128
    :goto_6
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, p0, Lcom/radaee/annotui/UIAnnotMenu;->m_has_property:Ljava/lang/Boolean;

    .line 131
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotMenu;->m_has_perform:Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_7

    .line 133
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotMenu;->m_view:Landroid/widget/LinearLayout;

    sget v2, Lcom/radaee/viewlib/R$id;->btn_annot_perform:I

    invoke-virtual {p1, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    const/4 p1, 0x1

    goto :goto_7

    .line 134
    :cond_7
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotMenu;->m_view:Landroid/widget/LinearLayout;

    sget v2, Lcom/radaee/viewlib/R$id;->btn_annot_perform:I

    invoke-virtual {p1, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, v4}, Landroid/view/View;->setVisibility(I)V

    const/4 p1, 0x0

    .line 136
    :goto_7
    iget-object v2, p0, Lcom/radaee/annotui/UIAnnotMenu;->m_has_edit:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_8

    add-int/lit8 p1, p1, 0x1

    .line 138
    iget-object v2, p0, Lcom/radaee/annotui/UIAnnotMenu;->m_view:Landroid/widget/LinearLayout;

    sget v3, Lcom/radaee/viewlib/R$id;->btn_annot_edit:I

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_8

    .line 139
    :cond_8
    iget-object v2, p0, Lcom/radaee/annotui/UIAnnotMenu;->m_view:Landroid/widget/LinearLayout;

    sget v3, Lcom/radaee/viewlib/R$id;->btn_annot_edit:I

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 141
    :goto_8
    iget-object v2, p0, Lcom/radaee/annotui/UIAnnotMenu;->m_has_remove:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_9

    add-int/lit8 p1, p1, 0x1

    .line 143
    iget-object v2, p0, Lcom/radaee/annotui/UIAnnotMenu;->m_view:Landroid/widget/LinearLayout;

    sget v3, Lcom/radaee/viewlib/R$id;->btn_annot_remove:I

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_9

    .line 144
    :cond_9
    iget-object v2, p0, Lcom/radaee/annotui/UIAnnotMenu;->m_view:Landroid/widget/LinearLayout;

    sget v3, Lcom/radaee/viewlib/R$id;->btn_annot_remove:I

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 146
    :goto_9
    iget-object v2, p0, Lcom/radaee/annotui/UIAnnotMenu;->m_has_property:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_a

    add-int/lit8 p1, p1, 0x1

    .line 148
    iget-object v2, p0, Lcom/radaee/annotui/UIAnnotMenu;->m_view:Landroid/widget/LinearLayout;

    sget v3, Lcom/radaee/viewlib/R$id;->btn_annot_property:I

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_a

    .line 149
    :cond_a
    iget-object v2, p0, Lcom/radaee/annotui/UIAnnotMenu;->m_view:Landroid/widget/LinearLayout;

    sget v3, Lcom/radaee/viewlib/R$id;->btn_annot_property:I

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    :goto_a
    if-eqz p3, :cond_b

    .line 152
    iget-object p3, p0, Lcom/radaee/annotui/UIAnnotMenu;->m_view:Landroid/widget/LinearLayout;

    invoke-direct {p0, p2, p1}, Lcom/radaee/annotui/UIAnnotMenu;->calculateX([FI)F

    move-result p1

    invoke-virtual {p3, p1}, Landroid/widget/LinearLayout;->setX(F)V

    .line 153
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotMenu;->m_view:Landroid/widget/LinearLayout;

    invoke-direct {p0, p2}, Lcom/radaee/annotui/UIAnnotMenu;->calculateY([F)F

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->setY(F)V

    .line 154
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotMenu;->m_view:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    return v0

    .line 157
    :cond_b
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotMenu;->m_view:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v4}, Landroid/widget/LinearLayout;->setVisibility(I)V

    return v1
.end method
