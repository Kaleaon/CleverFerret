.class public Lcom/flyersoft/views/PopupNoteLay;
.super Landroid/widget/FrameLayout;
.source "PopupNoteLay.java"


# instance fields
.field public arrow:Landroid/widget/ImageView;

.field arrow_lp:Landroid/view/ViewGroup$MarginLayoutParams;

.field public base:Landroid/view/View;

.field base_lp:Landroid/widget/FrameLayout$LayoutParams;

.field public button:Landroid/widget/TextView;

.field buttonOnTop:Z

.field public down:Landroid/widget/ImageView;

.field gap:I

.field gravity:I

.field onPreDraw:Landroid/view/ViewTreeObserver$OnPreDrawListener;

.field parent:Landroid/view/ViewGroup;

.field public sv:Landroid/widget/ScrollView;

.field public tv:Landroid/widget/TextView;

.field public up:Landroid/widget/ImageView;

.field x:I

.field y:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 25
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 151
    new-instance p1, Lcom/flyersoft/views/PopupNoteLay$1;

    invoke-direct {p1, p0}, Lcom/flyersoft/views/PopupNoteLay$1;-><init>(Lcom/flyersoft/views/PopupNoteLay;)V

    iput-object p1, p0, Lcom/flyersoft/views/PopupNoteLay;->onPreDraw:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    .line 26
    invoke-direct {p0}, Lcom/flyersoft/views/PopupNoteLay;->initView()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 30
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 151
    new-instance p1, Lcom/flyersoft/views/PopupNoteLay$1;

    invoke-direct {p1, p0}, Lcom/flyersoft/views/PopupNoteLay$1;-><init>(Lcom/flyersoft/views/PopupNoteLay;)V

    iput-object p1, p0, Lcom/flyersoft/views/PopupNoteLay;->onPreDraw:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    .line 31
    invoke-direct {p0}, Lcom/flyersoft/views/PopupNoteLay;->initView()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 35
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 151
    new-instance p1, Lcom/flyersoft/views/PopupNoteLay$1;

    invoke-direct {p1, p0}, Lcom/flyersoft/views/PopupNoteLay$1;-><init>(Lcom/flyersoft/views/PopupNoteLay;)V

    iput-object p1, p0, Lcom/flyersoft/views/PopupNoteLay;->onPreDraw:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    .line 36
    invoke-direct {p0}, Lcom/flyersoft/views/PopupNoteLay;->initView()V

    return-void
.end method

.method private initView()V
    .locals 3

    .line 45
    invoke-virtual {p0}, Lcom/flyersoft/views/PopupNoteLay;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$layout;->pop_note:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/views/PopupNoteLay;->base:Landroid/view/View;

    .line 46
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->up:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/flyersoft/views/PopupNoteLay;->up:Landroid/widget/ImageView;

    .line 47
    iget-object v0, p0, Lcom/flyersoft/views/PopupNoteLay;->base:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->down:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/flyersoft/views/PopupNoteLay;->down:Landroid/widget/ImageView;

    .line 48
    iget-object v0, p0, Lcom/flyersoft/views/PopupNoteLay;->base:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->sv:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ScrollView;

    iput-object v0, p0, Lcom/flyersoft/views/PopupNoteLay;->sv:Landroid/widget/ScrollView;

    .line 49
    iget-object v0, p0, Lcom/flyersoft/views/PopupNoteLay;->base:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->tv:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/views/PopupNoteLay;->tv:Landroid/widget/TextView;

    .line 50
    iget-object v0, p0, Lcom/flyersoft/views/PopupNoteLay;->base:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->button:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/views/PopupNoteLay;->button:Landroid/widget/TextView;

    const v0, -0x77779a

    .line 51
    invoke-virtual {p0, v0}, Lcom/flyersoft/views/PopupNoteLay;->setTint(I)Lcom/flyersoft/views/PopupNoteLay;

    .line 52
    iget-object v0, p0, Lcom/flyersoft/views/PopupNoteLay;->base:Landroid/view/View;

    invoke-virtual {p0, v0}, Lcom/flyersoft/views/PopupNoteLay;->addView(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public hide(Z)V
    .locals 1

    if-eqz p1, :cond_0

    .line 137
    sget-boolean p1, Lcom/flyersoft/tools/A;->eink:Z

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    const/4 v0, 0x0

    .line 138
    invoke-virtual {p0, v0}, Lcom/flyersoft/views/PopupNoteLay;->setTag(Ljava/lang/Object;)V

    if-eqz p1, :cond_1

    const/4 p1, 0x0

    .line 140
    invoke-static {p0, p1}, Lcom/flyersoft/tools/miscellaneous/AnimalTools;->startJdllyAnimal2(Landroid/view/View;F)V

    return-void

    :cond_1
    const/16 p1, 0x8

    .line 142
    invoke-virtual {p0, p1}, Lcom/flyersoft/views/PopupNoteLay;->setVisibility(I)V

    return-void
.end method

.method public setButton(Ljava/lang/CharSequence;ZLandroid/view/View$OnClickListener;)Lcom/flyersoft/views/PopupNoteLay;
    .locals 2

    .line 88
    iput-boolean p2, p0, Lcom/flyersoft/views/PopupNoteLay;->buttonOnTop:Z

    .line 89
    iget-object v0, p0, Lcom/flyersoft/views/PopupNoteLay;->button:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 90
    iget-object v0, p0, Lcom/flyersoft/views/PopupNoteLay;->button:Landroid/widget/TextView;

    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v1

    if-eqz v1, :cond_0

    sget v1, Lcom/flyersoft/tools/A;->linkColorNight:I

    goto :goto_0

    :cond_0
    sget v1, Lcom/flyersoft/tools/A;->linkColor:I

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 91
    iget-object v0, p0, Lcom/flyersoft/views/PopupNoteLay;->button:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 92
    iget-object p1, p0, Lcom/flyersoft/views/PopupNoteLay;->button:Landroid/widget/TextView;

    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 93
    iget-object p1, p0, Lcom/flyersoft/views/PopupNoteLay;->button:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/flyersoft/views/PopupNoteLay;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-static {p3}, Lcom/flyersoft/tools/A;->getSelectedRes(Landroid/content/Context;)I

    move-result p3

    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 94
    iget-object p1, p0, Lcom/flyersoft/views/PopupNoteLay;->button:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    const/high16 p3, 0x41c00000    # 24.0f

    if-eqz p2, :cond_1

    const/16 p2, 0x35

    .line 96
    iput p2, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 97
    iget-object p1, p0, Lcom/flyersoft/views/PopupNoteLay;->tv:Landroid/widget/TextView;

    invoke-static {p3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result p2

    invoke-static {p3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    invoke-static {p3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    invoke-static {p3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result p3

    invoke-virtual {p1, p2, v0, v1, p3}, Landroid/widget/TextView;->setPadding(IIII)V

    return-object p0

    :cond_1
    const/16 p2, 0x55

    .line 99
    iput p2, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 100
    iget-object p1, p0, Lcom/flyersoft/views/PopupNoteLay;->tv:Landroid/widget/TextView;

    invoke-static {p3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result p2

    invoke-static {p3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    invoke-static {p3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result p3

    const/high16 v1, 0x42700000    # 60.0f

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    invoke-virtual {p1, p2, v0, p3, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    return-object p0
.end method

.method public setGap(I)Lcom/flyersoft/views/PopupNoteLay;
    .locals 0

    .line 64
    iput p1, p0, Lcom/flyersoft/views/PopupNoteLay;->gap:I

    return-object p0
.end method

.method public setText(Ljava/lang/CharSequence;)Lcom/flyersoft/views/PopupNoteLay;
    .locals 4

    .line 79
    invoke-static {p1}, Lcom/flyersoft/tools/A;->deleteLineEndBreaks(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    .line 80
    iget-object v0, p0, Lcom/flyersoft/views/PopupNoteLay;->tv:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 81
    iget-object p1, p0, Lcom/flyersoft/views/PopupNoteLay;->button:Landroid/widget/TextView;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 82
    iget-object p1, p0, Lcom/flyersoft/views/PopupNoteLay;->tv:Landroid/widget/TextView;

    const/high16 v0, 0x41c00000    # 24.0f

    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    invoke-virtual {p1, v1, v2, v3, v0}, Landroid/widget/TextView;->setPadding(IIII)V

    return-object p0
.end method

.method public setTextColor(I)Lcom/flyersoft/views/PopupNoteLay;
    .locals 1

    .line 74
    iget-object v0, p0, Lcom/flyersoft/views/PopupNoteLay;->tv:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    return-object p0
.end method

.method public setTextSize(F)Lcom/flyersoft/views/PopupNoteLay;
    .locals 1

    .line 69
    iget-object v0, p0, Lcom/flyersoft/views/PopupNoteLay;->tv:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    return-object p0
.end method

.method public setTint(I)Lcom/flyersoft/views/PopupNoteLay;
    .locals 2

    .line 56
    iget-object v0, p0, Lcom/flyersoft/views/PopupNoteLay;->sv:Landroid/widget/ScrollView;

    invoke-virtual {v0}, Landroid/widget/ScrollView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, p1, v1}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 57
    iget-object v0, p0, Lcom/flyersoft/views/PopupNoteLay;->up:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, p1, v1}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 58
    iget-object v0, p0, Lcom/flyersoft/views/PopupNoteLay;->down:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, p1, v1}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    return-object p0
.end method

.method public show(IIZ)V
    .locals 6

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p3, :cond_0

    .line 106
    sget-boolean p3, Lcom/flyersoft/tools/A;->eink:Z

    if-nez p3, :cond_0

    const/4 p3, 0x1

    goto :goto_0

    :cond_0
    const/4 p3, 0x0

    .line 107
    :goto_0
    iput p1, p0, Lcom/flyersoft/views/PopupNoteLay;->x:I

    .line 108
    iput p2, p0, Lcom/flyersoft/views/PopupNoteLay;->y:I

    .line 109
    invoke-virtual {p0}, Lcom/flyersoft/views/PopupNoteLay;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    iput-object p1, p0, Lcom/flyersoft/views/PopupNoteLay;->parent:Landroid/view/ViewGroup;

    .line 110
    iget-object p1, p0, Lcom/flyersoft/views/PopupNoteLay;->sv:Landroid/widget/ScrollView;

    invoke-virtual {p1, v1, v1}, Landroid/widget/ScrollView;->scrollTo(II)V

    .line 112
    iget-object p1, p0, Lcom/flyersoft/views/PopupNoteLay;->parent:Landroid/view/ViewGroup;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getHeight()I

    move-result p1

    invoke-static {}, Lcom/flyersoft/tools/A;->isLandscape()Z

    move-result v2

    if-eqz v2, :cond_1

    const/16 v2, 0x32

    goto :goto_1

    :cond_1
    const/16 v2, 0x26

    :goto_1
    mul-int p1, p1, v2

    div-int/lit8 p1, p1, 0x64

    const/16 v2, 0x50

    const/16 v3, 0x30

    if-ge p2, p1, :cond_2

    const/16 p1, 0x50

    goto :goto_2

    :cond_2
    const/16 p1, 0x30

    .line 113
    :goto_2
    iput p1, p0, Lcom/flyersoft/views/PopupNoteLay;->gravity:I

    .line 114
    iget-object v4, p0, Lcom/flyersoft/views/PopupNoteLay;->up:Landroid/widget/ImageView;

    const/16 v5, 0x8

    if-ne p1, v2, :cond_3

    const/4 p1, 0x0

    goto :goto_3

    :cond_3
    const/16 p1, 0x8

    :goto_3
    invoke-virtual {v4, p1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 115
    iget-object p1, p0, Lcom/flyersoft/views/PopupNoteLay;->down:Landroid/widget/ImageView;

    iget v4, p0, Lcom/flyersoft/views/PopupNoteLay;->gravity:I

    if-ne v4, v3, :cond_4

    const/4 v5, 0x0

    :cond_4
    invoke-virtual {p1, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 116
    iget p1, p0, Lcom/flyersoft/views/PopupNoteLay;->gravity:I

    if-ne p1, v3, :cond_5

    iget-object p1, p0, Lcom/flyersoft/views/PopupNoteLay;->down:Landroid/widget/ImageView;

    goto :goto_4

    :cond_5
    iget-object p1, p0, Lcom/flyersoft/views/PopupNoteLay;->up:Landroid/widget/ImageView;

    :goto_4
    iput-object p1, p0, Lcom/flyersoft/views/PopupNoteLay;->arrow:Landroid/widget/ImageView;

    .line 118
    invoke-virtual {p0}, Lcom/flyersoft/views/PopupNoteLay;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    iput-object p1, p0, Lcom/flyersoft/views/PopupNoteLay;->base_lp:Landroid/widget/FrameLayout$LayoutParams;

    .line 119
    iget-object p1, p0, Lcom/flyersoft/views/PopupNoteLay;->arrow:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    iput-object p1, p0, Lcom/flyersoft/views/PopupNoteLay;->arrow_lp:Landroid/view/ViewGroup$MarginLayoutParams;

    .line 120
    iget-object p1, p0, Lcom/flyersoft/views/PopupNoteLay;->base_lp:Landroid/widget/FrameLayout$LayoutParams;

    iput v1, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    iput v1, p1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    iput v1, p1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    iput v1, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 121
    iget-object p1, p0, Lcom/flyersoft/views/PopupNoteLay;->arrow_lp:Landroid/view/ViewGroup$MarginLayoutParams;

    iput v1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iput v1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    iput v1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    iput v1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 123
    iget-object p1, p0, Lcom/flyersoft/views/PopupNoteLay;->base_lp:Landroid/widget/FrameLayout$LayoutParams;

    iget v4, p0, Lcom/flyersoft/views/PopupNoteLay;->gravity:I

    if-ne v4, v3, :cond_6

    goto :goto_5

    :cond_6
    const/16 v2, 0x30

    :goto_5
    iput v2, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 124
    iget p1, p0, Lcom/flyersoft/views/PopupNoteLay;->gravity:I

    if-ne p1, v3, :cond_7

    .line 125
    iget-object p1, p0, Lcom/flyersoft/views/PopupNoteLay;->base_lp:Landroid/widget/FrameLayout$LayoutParams;

    iget-object v2, p0, Lcom/flyersoft/views/PopupNoteLay;->parent:Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getHeight()I

    move-result v2

    sub-int/2addr v2, p2

    iget p2, p0, Lcom/flyersoft/views/PopupNoteLay;->gap:I

    add-int/2addr v2, p2

    iput v2, p1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    goto :goto_6

    .line 127
    :cond_7
    iget-object p1, p0, Lcom/flyersoft/views/PopupNoteLay;->base_lp:Landroid/widget/FrameLayout$LayoutParams;

    iget v2, p0, Lcom/flyersoft/views/PopupNoteLay;->gap:I

    add-int/2addr p2, v2

    iput p2, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 129
    :goto_6
    invoke-virtual {p0}, Lcom/flyersoft/views/PopupNoteLay;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    iget-object p2, p0, Lcom/flyersoft/views/PopupNoteLay;->onPreDraw:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    invoke-virtual {p1, p2}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 130
    invoke-virtual {p0, v1}, Lcom/flyersoft/views/PopupNoteLay;->setVisibility(I)V

    .line 131
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/flyersoft/views/PopupNoteLay;->setTag(Ljava/lang/Object;)V

    if-eqz p3, :cond_8

    const/high16 p1, 0x3f800000    # 1.0f

    .line 133
    invoke-static {p0, p1}, Lcom/flyersoft/tools/miscellaneous/AnimalTools;->startJdllyAnimal(Landroid/view/View;F)V

    :cond_8
    return-void
.end method
