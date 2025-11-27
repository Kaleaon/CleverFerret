.class public Lcom/flyersoft/views/CustomSeek;
.super Landroid/widget/FrameLayout;
.source "CustomSeek.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/views/CustomSeek$OnProgressChanged;
    }
.end annotation


# instance fields
.field current:I

.field distance:I

.field max:I

.field min:I

.field public minus:Landroid/view/View;

.field public plus:Landroid/view/View;

.field progressChanged:Lcom/flyersoft/views/CustomSeek$OnProgressChanged;

.field public seek:Landroid/widget/SeekBar;

.field private step:I

.field private sufix:Ljava/lang/String;

.field public titleTv:Landroid/widget/TextView;

.field public valueTv:Landroid/widget/TextView;


# direct methods
.method static bridge synthetic -$$Nest$fgetstep(Lcom/flyersoft/views/CustomSeek;)I
    .locals 0

    iget p0, p0, Lcom/flyersoft/views/CustomSeek;->step:I

    return p0
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 27
    invoke-direct {p0, p1, v0}, Lcom/flyersoft/views/CustomSeek;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 31
    invoke-direct {p0, p1, p2, v0}, Lcom/flyersoft/views/CustomSeek;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 35
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p3, 0x1

    .line 24
    iput p3, p0, Lcom/flyersoft/views/CustomSeek;->step:I

    const/4 p3, 0x0

    .line 120
    iput p3, p0, Lcom/flyersoft/views/CustomSeek;->distance:I

    .line 121
    iput p3, p0, Lcom/flyersoft/views/CustomSeek;->min:I

    .line 122
    iput p3, p0, Lcom/flyersoft/views/CustomSeek;->max:I

    .line 123
    iput p3, p0, Lcom/flyersoft/views/CustomSeek;->current:I

    .line 36
    invoke-direct {p0, p1, p2}, Lcom/flyersoft/views/CustomSeek;->initView(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method private initView(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 6

    .line 40
    invoke-virtual {p0}, Lcom/flyersoft/views/CustomSeek;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$layout;->custom_seek:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 41
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->name:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/flyersoft/views/CustomSeek;->titleTv:Landroid/widget/TextView;

    .line 42
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->value:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/flyersoft/views/CustomSeek;->valueTv:Landroid/widget/TextView;

    .line 43
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->seek:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/SeekBar;

    iput-object v1, p0, Lcom/flyersoft/views/CustomSeek;->seek:Landroid/widget/SeekBar;

    .line 44
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->plus:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/flyersoft/views/CustomSeek;->plus:Landroid/view/View;

    .line 45
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->minus:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/flyersoft/views/CustomSeek;->minus:Landroid/view/View;

    .line 47
    iget-object v1, p0, Lcom/flyersoft/views/CustomSeek;->plus:Landroid/view/View;

    new-instance v3, Lcom/flyersoft/views/CustomSeek$1;

    invoke-direct {v3, p0}, Lcom/flyersoft/views/CustomSeek$1;-><init>(Lcom/flyersoft/views/CustomSeek;)V

    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 56
    iget-object v1, p0, Lcom/flyersoft/views/CustomSeek;->minus:Landroid/view/View;

    new-instance v3, Lcom/flyersoft/views/CustomSeek$2;

    invoke-direct {v3, p0}, Lcom/flyersoft/views/CustomSeek$2;-><init>(Lcom/flyersoft/views/CustomSeek;)V

    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 65
    invoke-virtual {p0, v0}, Lcom/flyersoft/views/CustomSeek;->addView(Landroid/view/View;)V

    if-eqz p2, :cond_5

    .line 68
    sget-object v0, Lcom/flyersoft/moonreaderp/R$styleable;->CustomSeek:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 69
    sget p2, Lcom/flyersoft/moonreaderp/R$styleable;->CustomSeek_text:I

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object p2

    .line 70
    sget v0, Lcom/flyersoft/moonreaderp/R$styleable;->CustomSeek_textColor:I

    invoke-virtual {p1, v0, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v0

    .line 71
    sget v1, Lcom/flyersoft/moonreaderp/R$styleable;->CustomSeek_textWidth:I

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    .line 72
    sget v3, Lcom/flyersoft/moonreaderp/R$styleable;->CustomSeek_textSize:I

    invoke-virtual {p1, v3, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v3

    .line 73
    sget v4, Lcom/flyersoft/moonreaderp/R$styleable;->CustomSeek_textGravity:I

    invoke-virtual {p1, v4, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    .line 74
    sget v5, Lcom/flyersoft/moonreaderp/R$styleable;->CustomSeek_buttonOnly:I

    invoke-virtual {p1, v5, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    .line 75
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 77
    invoke-static {p2}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 78
    iget-object p1, p0, Lcom/flyersoft/views/CustomSeek;->titleTv:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    if-eqz v0, :cond_1

    .line 80
    iget-object p1, p0, Lcom/flyersoft/views/CustomSeek;->titleTv:Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    :cond_1
    if-eqz v3, :cond_2

    .line 82
    iget-object p1, p0, Lcom/flyersoft/views/CustomSeek;->titleTv:Landroid/widget/TextView;

    int-to-float p2, v3

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextSize(F)V

    :cond_2
    if-eqz v1, :cond_3

    .line 84
    invoke-virtual {p0, v1}, Lcom/flyersoft/views/CustomSeek;->setTextWidth(I)V

    :cond_3
    if-eqz v4, :cond_4

    .line 86
    iget-object p1, p0, Lcom/flyersoft/views/CustomSeek;->titleTv:Landroid/widget/TextView;

    invoke-virtual {p1, v4}, Landroid/widget/TextView;->setGravity(I)V

    :cond_4
    if-eqz v2, :cond_5

    .line 88
    iget-object p1, p0, Lcom/flyersoft/views/CustomSeek;->titleTv:Landroid/widget/TextView;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 89
    iget-object p1, p0, Lcom/flyersoft/views/CustomSeek;->valueTv:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 90
    iget-object p1, p0, Lcom/flyersoft/views/CustomSeek;->seek:Landroid/widget/SeekBar;

    invoke-virtual {p1, p2}, Landroid/widget/SeekBar;->setVisibility(I)V

    .line 93
    :cond_5
    invoke-virtual {p0}, Lcom/flyersoft/views/CustomSeek;->isInEditMode()Z

    move-result p1

    if-nez p1, :cond_6

    .line 94
    iget-object p1, p0, Lcom/flyersoft/views/CustomSeek;->valueTv:Landroid/widget/TextView;

    iget-object p2, p0, Lcom/flyersoft/views/CustomSeek;->titleTv:Landroid/widget/TextView;

    invoke-virtual {p2}, Landroid/widget/TextView;->getCurrentTextColor()I

    move-result p2

    const/16 v0, -0x5a

    invoke-static {p2, v0}, Lcom/flyersoft/tools/A;->getAlphaColor(II)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    :cond_6
    return-void
.end method


# virtual methods
.method public getCurrent()I
    .locals 1

    .line 117
    iget v0, p0, Lcom/flyersoft/views/CustomSeek;->current:I

    return v0
.end method

.method public init(III)V
    .locals 1

    .line 142
    const-string v0, ""

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/flyersoft/views/CustomSeek;->init(IIILjava/lang/String;)V

    return-void
.end method

.method public init(IIILjava/lang/String;)V
    .locals 2

    .line 146
    iput-object p4, p0, Lcom/flyersoft/views/CustomSeek;->sufix:Ljava/lang/String;

    .line 147
    iget-object v0, p0, Lcom/flyersoft/views/CustomSeek;->seek:Landroid/widget/SeekBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 148
    iput p1, p0, Lcom/flyersoft/views/CustomSeek;->min:I

    .line 149
    iput p2, p0, Lcom/flyersoft/views/CustomSeek;->max:I

    .line 150
    iput p3, p0, Lcom/flyersoft/views/CustomSeek;->current:I

    sub-int/2addr p2, p1

    .line 151
    iput p2, p0, Lcom/flyersoft/views/CustomSeek;->distance:I

    .line 152
    iget-object p2, p0, Lcom/flyersoft/views/CustomSeek;->valueTv:Landroid/widget/TextView;

    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, ""

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v0, p0, Lcom/flyersoft/views/CustomSeek;->current:I

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 153
    iget-object p2, p0, Lcom/flyersoft/views/CustomSeek;->seek:Landroid/widget/SeekBar;

    iget p3, p0, Lcom/flyersoft/views/CustomSeek;->distance:I

    invoke-virtual {p2, p3}, Landroid/widget/SeekBar;->setMax(I)V

    .line 154
    iget-object p2, p0, Lcom/flyersoft/views/CustomSeek;->seek:Landroid/widget/SeekBar;

    iget p3, p0, Lcom/flyersoft/views/CustomSeek;->current:I

    sub-int/2addr p3, p1

    invoke-virtual {p2, p3}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 156
    iget-object p2, p0, Lcom/flyersoft/views/CustomSeek;->seek:Landroid/widget/SeekBar;

    new-instance p3, Lcom/flyersoft/views/CustomSeek$3;

    invoke-direct {p3, p0, p1, p4}, Lcom/flyersoft/views/CustomSeek$3;-><init>(Lcom/flyersoft/views/CustomSeek;ILjava/lang/String;)V

    invoke-virtual {p2, p3}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    return-void
.end method

.method public isChanged()Z
    .locals 3

    .line 113
    iget v0, p0, Lcom/flyersoft/views/CustomSeek;->current:I

    iget v1, p0, Lcom/flyersoft/views/CustomSeek;->min:I

    iget-object v2, p0, Lcom/flyersoft/views/CustomSeek;->seek:Landroid/widget/SeekBar;

    invoke-virtual {v2}, Landroid/widget/SeekBar;->getProgress()I

    move-result v2

    add-int/2addr v1, v2

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public reset(I)V
    .locals 3

    .line 127
    iget v0, p0, Lcom/flyersoft/views/CustomSeek;->min:I

    iget v1, p0, Lcom/flyersoft/views/CustomSeek;->max:I

    iget-object v2, p0, Lcom/flyersoft/views/CustomSeek;->sufix:Ljava/lang/String;

    invoke-virtual {p0, v0, v1, p1, v2}, Lcom/flyersoft/views/CustomSeek;->init(IIILjava/lang/String;)V

    return-void
.end method

.method public sendProgressChanged()V
    .locals 2

    .line 131
    iget-object v0, p0, Lcom/flyersoft/views/CustomSeek;->progressChanged:Lcom/flyersoft/views/CustomSeek$OnProgressChanged;

    if-eqz v0, :cond_0

    .line 132
    iget v1, p0, Lcom/flyersoft/views/CustomSeek;->current:I

    invoke-interface {v0, v1}, Lcom/flyersoft/views/CustomSeek$OnProgressChanged;->onValueRecive(I)V

    :cond_0
    return-void
.end method

.method public setEnabled(Z)V
    .locals 1

    .line 107
    iget-object v0, p0, Lcom/flyersoft/views/CustomSeek;->seek:Landroid/widget/SeekBar;

    invoke-virtual {v0, p1}, Landroid/widget/SeekBar;->setEnabled(Z)V

    .line 108
    iget-object v0, p0, Lcom/flyersoft/views/CustomSeek;->plus:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 109
    iget-object v0, p0, Lcom/flyersoft/views/CustomSeek;->minus:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setEnabled(Z)V

    return-void
.end method

.method public setMax(I)V
    .locals 1

    .line 136
    iput p1, p0, Lcom/flyersoft/views/CustomSeek;->max:I

    .line 137
    iget v0, p0, Lcom/flyersoft/views/CustomSeek;->min:I

    sub-int/2addr p1, v0

    iput p1, p0, Lcom/flyersoft/views/CustomSeek;->distance:I

    .line 138
    iget-object v0, p0, Lcom/flyersoft/views/CustomSeek;->seek:Landroid/widget/SeekBar;

    invoke-virtual {v0, p1}, Landroid/widget/SeekBar;->setMax(I)V

    return-void
.end method

.method public setOnCustomProgressChanged(Lcom/flyersoft/views/CustomSeek$OnProgressChanged;)V
    .locals 0

    .line 188
    iput-object p1, p0, Lcom/flyersoft/views/CustomSeek;->progressChanged:Lcom/flyersoft/views/CustomSeek$OnProgressChanged;

    return-void
.end method

.method public setStep(I)V
    .locals 0

    .line 98
    iput p1, p0, Lcom/flyersoft/views/CustomSeek;->step:I

    return-void
.end method

.method public setTextWidth(I)V
    .locals 1

    .line 102
    iget-object v0, p0, Lcom/flyersoft/views/CustomSeek;->titleTv:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    return-void
.end method

.method public setValueText(Ljava/lang/String;)V
    .locals 2

    .line 184
    iget-object v0, p0, Lcom/flyersoft/views/CustomSeek;->valueTv:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lcom/flyersoft/views/CustomSeek;->sufix:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
