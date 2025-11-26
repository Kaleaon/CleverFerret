.class public Lcom/radaee/annotui/UIColorButton;
.super Landroid/widget/Button;
.source "UIColorButton.java"


# static fields
.field private static POPUP_HEIGHT:F = 200.0f

.field private static POPUP_WIDTH:F = 160.0f

.field private static ms_density:F = -1.0f


# instance fields
.field private m_color:I

.field private m_color_pop:I

.field private m_enable:Z

.field private m_enable_mode:Z

.field private m_layout:Landroid/widget/RelativeLayout;

.field private m_popup:Lcom/radaee/annotui/UIAnnotPop;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 154
    invoke-direct {p0, p1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const/high16 p1, -0x1000000

    .line 24
    iput p1, p0, Lcom/radaee/annotui/UIColorButton;->m_color:I

    .line 25
    iput p1, p0, Lcom/radaee/annotui/UIColorButton;->m_color_pop:I

    .line 155
    invoke-direct {p0}, Lcom/radaee/annotui/UIColorButton;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 159
    invoke-direct {p0, p1, p2}, Landroid/widget/Button;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/high16 p1, -0x1000000

    .line 24
    iput p1, p0, Lcom/radaee/annotui/UIColorButton;->m_color:I

    .line 25
    iput p1, p0, Lcom/radaee/annotui/UIColorButton;->m_color_pop:I

    .line 160
    invoke-direct {p0}, Lcom/radaee/annotui/UIColorButton;->init()V

    return-void
.end method

.method private Dp2Px(F)I
    .locals 2

    .line 31
    sget v0, Lcom/radaee/annotui/UIColorButton;->ms_density:F

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    invoke-virtual {p0}, Lcom/radaee/annotui/UIColorButton;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    sput v0, Lcom/radaee/annotui/UIColorButton;->ms_density:F

    .line 32
    :cond_0
    sget v0, Lcom/radaee/annotui/UIColorButton;->ms_density:F

    mul-float p1, p1, v0

    const/high16 v0, 0x3f000000    # 0.5f

    add-float/2addr p1, v0

    float-to-int p1, p1

    return p1
.end method

.method private Px2Dp(F)I
    .locals 2

    .line 36
    sget v0, Lcom/radaee/annotui/UIColorButton;->ms_density:F

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    invoke-virtual {p0}, Lcom/radaee/annotui/UIColorButton;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    sput v0, Lcom/radaee/annotui/UIColorButton;->ms_density:F

    .line 37
    :cond_0
    sget v0, Lcom/radaee/annotui/UIColorButton;->ms_density:F

    div-float/2addr p1, v0

    const/high16 v0, 0x3f000000    # 0.5f

    add-float/2addr p1, v0

    float-to-int p1, p1

    return p1
.end method

.method static synthetic access$000(Lcom/radaee/annotui/UIColorButton;)Landroid/widget/RelativeLayout;
    .locals 0

    .line 18
    iget-object p0, p0, Lcom/radaee/annotui/UIColorButton;->m_layout:Landroid/widget/RelativeLayout;

    return-object p0
.end method

.method static synthetic access$100(Lcom/radaee/annotui/UIColorButton;)Z
    .locals 0

    .line 18
    iget-boolean p0, p0, Lcom/radaee/annotui/UIColorButton;->m_enable:Z

    return p0
.end method

.method static synthetic access$102(Lcom/radaee/annotui/UIColorButton;Z)Z
    .locals 0

    .line 18
    iput-boolean p1, p0, Lcom/radaee/annotui/UIColorButton;->m_enable:Z

    return p1
.end method

.method static synthetic access$200(Lcom/radaee/annotui/UIColorButton;)I
    .locals 0

    .line 18
    iget p0, p0, Lcom/radaee/annotui/UIColorButton;->m_color:I

    return p0
.end method

.method static synthetic access$202(Lcom/radaee/annotui/UIColorButton;I)I
    .locals 0

    .line 18
    iput p1, p0, Lcom/radaee/annotui/UIColorButton;->m_color:I

    return p1
.end method

.method static synthetic access$300(Lcom/radaee/annotui/UIColorButton;)I
    .locals 0

    .line 18
    iget p0, p0, Lcom/radaee/annotui/UIColorButton;->m_color_pop:I

    return p0
.end method

.method static synthetic access$302(Lcom/radaee/annotui/UIColorButton;I)I
    .locals 0

    .line 18
    iput p1, p0, Lcom/radaee/annotui/UIColorButton;->m_color_pop:I

    return p1
.end method

.method static synthetic access$400(Lcom/radaee/annotui/UIColorButton;)Lcom/radaee/annotui/UIAnnotPop;
    .locals 0

    .line 18
    iget-object p0, p0, Lcom/radaee/annotui/UIColorButton;->m_popup:Lcom/radaee/annotui/UIAnnotPop;

    return-object p0
.end method

.method static synthetic access$500(Lcom/radaee/annotui/UIColorButton;)Z
    .locals 0

    .line 18
    iget-boolean p0, p0, Lcom/radaee/annotui/UIColorButton;->m_enable_mode:Z

    return p0
.end method

.method static synthetic access$600()F
    .locals 1

    .line 18
    sget v0, Lcom/radaee/annotui/UIColorButton;->POPUP_HEIGHT:F

    return v0
.end method

.method static synthetic access$700(Lcom/radaee/annotui/UIColorButton;F)I
    .locals 0

    .line 18
    invoke-direct {p0, p1}, Lcom/radaee/annotui/UIColorButton;->Dp2Px(F)I

    move-result p0

    return p0
.end method

.method private init()V
    .locals 5

    .line 41
    invoke-virtual {p0}, Lcom/radaee/annotui/UIColorButton;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/radaee/viewlib/R$layout;->pop_color:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lcom/radaee/annotui/UIColorButton;->m_layout:Landroid/widget/RelativeLayout;

    .line 42
    sget v1, Lcom/radaee/viewlib/R$id;->btn_ok:I

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/radaee/annotui/UIColorButton$1;

    invoke-direct {v1, p0}, Lcom/radaee/annotui/UIColorButton$1;-><init>(Lcom/radaee/annotui/UIColorButton;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 60
    iget-object v0, p0, Lcom/radaee/annotui/UIColorButton;->m_layout:Landroid/widget/RelativeLayout;

    sget v1, Lcom/radaee/viewlib/R$id;->btn_cancel:I

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/radaee/annotui/UIColorButton$2;

    invoke-direct {v1, p0}, Lcom/radaee/annotui/UIColorButton$2;-><init>(Lcom/radaee/annotui/UIColorButton;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 67
    iget-object v0, p0, Lcom/radaee/annotui/UIColorButton;->m_layout:Landroid/widget/RelativeLayout;

    sget v1, Lcom/radaee/viewlib/R$id;->seek_clr_r:I

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/SeekBar;

    .line 68
    iget-object v1, p0, Lcom/radaee/annotui/UIColorButton;->m_layout:Landroid/widget/RelativeLayout;

    sget v2, Lcom/radaee/viewlib/R$id;->seek_clr_g:I

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/SeekBar;

    .line 69
    iget-object v2, p0, Lcom/radaee/annotui/UIColorButton;->m_layout:Landroid/widget/RelativeLayout;

    sget v3, Lcom/radaee/viewlib/R$id;->seek_clr_b:I

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/SeekBar;

    const/16 v3, 0xff

    .line 71
    invoke-virtual {v0, v3}, Landroid/widget/SeekBar;->setMax(I)V

    .line 72
    new-instance v4, Lcom/radaee/annotui/UIColorButton$3;

    invoke-direct {v4, p0}, Lcom/radaee/annotui/UIColorButton$3;-><init>(Lcom/radaee/annotui/UIColorButton;)V

    invoke-virtual {v0, v4}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 87
    invoke-virtual {v1, v3}, Landroid/widget/SeekBar;->setMax(I)V

    .line 88
    new-instance v0, Lcom/radaee/annotui/UIColorButton$4;

    invoke-direct {v0, p0}, Lcom/radaee/annotui/UIColorButton$4;-><init>(Lcom/radaee/annotui/UIColorButton;)V

    invoke-virtual {v1, v0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 103
    invoke-virtual {v2, v3}, Landroid/widget/SeekBar;->setMax(I)V

    .line 104
    new-instance v0, Lcom/radaee/annotui/UIColorButton$5;

    invoke-direct {v0, p0}, Lcom/radaee/annotui/UIColorButton$5;-><init>(Lcom/radaee/annotui/UIColorButton;)V

    invoke-virtual {v2, v0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 120
    new-instance v0, Lcom/radaee/annotui/UIAnnotPop;

    iget-object v1, p0, Lcom/radaee/annotui/UIColorButton;->m_layout:Landroid/widget/RelativeLayout;

    sget v2, Lcom/radaee/annotui/UIColorButton;->POPUP_WIDTH:F

    invoke-direct {p0, v2}, Lcom/radaee/annotui/UIColorButton;->Dp2Px(F)I

    move-result v2

    sget v3, Lcom/radaee/annotui/UIColorButton;->POPUP_HEIGHT:F

    invoke-direct {p0, v3}, Lcom/radaee/annotui/UIColorButton;->Dp2Px(F)I

    move-result v3

    invoke-direct {v0, v1, v2, v3}, Lcom/radaee/annotui/UIAnnotPop;-><init>(Landroid/view/View;II)V

    iput-object v0, p0, Lcom/radaee/annotui/UIColorButton;->m_popup:Lcom/radaee/annotui/UIAnnotPop;

    const/4 v1, 0x1

    .line 121
    invoke-virtual {v0, v1}, Lcom/radaee/annotui/UIAnnotPop;->setFocusable(Z)V

    .line 122
    iget-object v0, p0, Lcom/radaee/annotui/UIColorButton;->m_popup:Lcom/radaee/annotui/UIAnnotPop;

    invoke-virtual {v0, v1}, Lcom/radaee/annotui/UIAnnotPop;->setTouchable(Z)V

    .line 123
    iget-object v0, p0, Lcom/radaee/annotui/UIColorButton;->m_popup:Lcom/radaee/annotui/UIAnnotPop;

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Lcom/radaee/annotui/UIAnnotPop;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 124
    new-instance v0, Lcom/radaee/annotui/UIColorButton$6;

    invoke-direct {v0, p0}, Lcom/radaee/annotui/UIColorButton$6;-><init>(Lcom/radaee/annotui/UIColorButton;)V

    invoke-virtual {p0, v0}, Lcom/radaee/annotui/UIColorButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public getColor()I
    .locals 1

    .line 170
    iget v0, p0, Lcom/radaee/annotui/UIColorButton;->m_color:I

    return v0
.end method

.method public getColorEnable()Z
    .locals 1

    .line 178
    iget-boolean v0, p0, Lcom/radaee/annotui/UIColorButton;->m_enable:Z

    return v0
.end method

.method public setColor(I)V
    .locals 0

    .line 164
    iput p1, p0, Lcom/radaee/annotui/UIColorButton;->m_color:I

    .line 165
    iput p1, p0, Lcom/radaee/annotui/UIColorButton;->m_color_pop:I

    .line 166
    invoke-virtual {p0, p1}, Lcom/radaee/annotui/UIColorButton;->setBackgroundColor(I)V

    return-void
.end method

.method public setColorEnable(Z)V
    .locals 0

    .line 174
    iput-boolean p1, p0, Lcom/radaee/annotui/UIColorButton;->m_enable:Z

    return-void
.end method

.method public setColorMode(Z)V
    .locals 0

    .line 182
    iput-boolean p1, p0, Lcom/radaee/annotui/UIColorButton;->m_enable_mode:Z

    return-void
.end method
