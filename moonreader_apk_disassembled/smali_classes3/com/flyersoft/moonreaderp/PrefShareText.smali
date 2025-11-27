.class public Lcom/flyersoft/moonreaderp/PrefShareText;
.super Landroid/app/Dialog;
.source "PrefShareText.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/moonreaderp/PrefShareText$SliderAdapter;,
        Lcom/flyersoft/moonreaderp/PrefShareText$SliderCard;
    }
.end annotation


# instance fields
.field final COUNT:I

.field author:Ljava/lang/String;

.field bm1:Landroid/graphics/Bitmap;

.field bm2:Landroid/graphics/Bitmap;

.field bm3:Landroid/graphics/Bitmap;

.field bm4:Landroid/graphics/Bitmap;

.field book:Ljava/lang/String;

.field chapter:Ljava/lang/String;

.field content:Ljava/lang/String;

.field layoutManger:Lcom/ramotion/cardslider/CardSliderLayoutManager;

.field root:Landroid/view/View;

.field slideRv:Landroidx/recyclerview/widget/RecyclerView;

.field template1:Landroid/view/View;

.field template2:Landroid/view/View;

.field template3:Landroid/view/View;

.field template4:Landroid/view/View;

.field typeface:Landroid/graphics/Typeface;


# direct methods
.method static bridge synthetic -$$Nest$mcreateBitmaps(Lcom/flyersoft/moonreaderp/PrefShareText;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefShareText;->createBitmaps()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mcreateSlideAdapter(Lcom/flyersoft/moonreaderp/PrefShareText;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefShareText;->createSlideAdapter()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mcreateTemplate1(Lcom/flyersoft/moonreaderp/PrefShareText;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefShareText;->createTemplate1(Z)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mcreateTemplate2(Lcom/flyersoft/moonreaderp/PrefShareText;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefShareText;->createTemplate2(Z)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mcreateTemplate3(Lcom/flyersoft/moonreaderp/PrefShareText;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefShareText;->createTemplate3(Z)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mcreateTemplate4(Lcom/flyersoft/moonreaderp/PrefShareText;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefShareText;->createTemplate4(Z)V

    return-void
.end method

.method static bridge synthetic -$$Nest$monActiveCardChange(Lcom/flyersoft/moonreaderp/PrefShareText;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefShareText;->onActiveCardChange()V

    return-void
.end method

.method static bridge synthetic -$$Nest$monActiveCardChange(Lcom/flyersoft/moonreaderp/PrefShareText;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefShareText;->onActiveCardChange(I)V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetTextSize(Lcom/flyersoft/moonreaderp/PrefShareText;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefShareText;->setTextSize(Z)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    .line 51
    sget-boolean v0, Lcom/flyersoft/tools/A;->eink:Z

    if-eqz v0, :cond_0

    sget v0, Lcom/flyersoft/moonreaderp/R$style;->dialog_fullscreen_ink:I

    goto :goto_0

    :cond_0
    sget v0, Lcom/flyersoft/moonreaderp/R$style;->dialog_fullscreen:I

    :goto_0
    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    const/4 p1, 0x4

    .line 347
    iput p1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->COUNT:I

    .line 52
    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->content:Ljava/lang/String;

    .line 53
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShareText;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    sget p2, Lcom/flyersoft/moonreaderp/R$layout;->text2image:I

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->root:Landroid/view/View;

    .line 54
    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/PrefShareText;->setContentView(Landroid/view/View;)V

    return-void
.end method

.method private createBitmaps()V
    .locals 4

    .line 258
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->root:Landroid/view/View;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefShareText$3;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefShareText$3;-><init>(Lcom/flyersoft/moonreaderp/PrefShareText;)V

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method private createSlideAdapter()V
    .locals 3

    .line 295
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->slideRv:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefShareText$SliderAdapter;

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefShareText$4;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/PrefShareText$4;-><init>(Lcom/flyersoft/moonreaderp/PrefShareText;)V

    invoke-direct {v1, p0, v2}, Lcom/flyersoft/moonreaderp/PrefShareText$SliderAdapter;-><init>(Lcom/flyersoft/moonreaderp/PrefShareText;Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 314
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->slideRv:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 315
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->slideRv:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefShareText$5;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefShareText$5;-><init>(Lcom/flyersoft/moonreaderp/PrefShareText;)V

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;)V

    .line 324
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->slideRv:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v0

    check-cast v0, Lcom/ramotion/cardslider/CardSliderLayoutManager;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->layoutManger:Lcom/ramotion/cardslider/CardSliderLayoutManager;

    .line 325
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->slideRv:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getTag()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    .line 326
    new-instance v0, Lcom/ramotion/cardslider/CardSnapHelper;

    invoke-direct {v0}, Lcom/ramotion/cardslider/CardSnapHelper;-><init>()V

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->slideRv:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, v1}, Lcom/ramotion/cardslider/CardSnapHelper;->attachToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 327
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->slideRv:Landroidx/recyclerview/widget/RecyclerView;

    const-string v1, "1"

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setTag(Ljava/lang/Object;)V

    .line 329
    sget v0, Lcom/flyersoft/tools/A;->shareTextType:I

    const/4 v1, 0x4

    if-lt v0, v1, :cond_1

    const/4 v0, 0x3

    .line 330
    sput v0, Lcom/flyersoft/tools/A;->shareTextType:I

    .line 331
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->slideRv:Landroidx/recyclerview/widget/RecyclerView;

    sget v1, Lcom/flyersoft/tools/A;->shareTextType:I

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    return-void
.end method

.method private createTemplate1(Z)V
    .locals 5

    .line 141
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template1:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->contentMr:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/staticlayout/MRTextView;

    .line 142
    sget v1, Lcom/flyersoft/tools/A;->fontColor:I

    const/16 v2, -0x64

    invoke-static {v1, v2}, Lcom/flyersoft/tools/A;->getAlphaColor(II)I

    move-result v1

    .line 143
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template1:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->book:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 144
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template1:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->author:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 145
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template1:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->chapter:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 146
    sget v1, Lcom/flyersoft/tools/A;->fontColor:I

    invoke-virtual {v0, v1}, Lcom/flyersoft/staticlayout/MRTextView;->setTextColor(I)V

    .line 147
    invoke-static {v0}, Lcom/flyersoft/tools/A;->setTxtViewTypeface(Lcom/flyersoft/staticlayout/MRTextView;)V

    .line 148
    invoke-static {v0}, Lcom/flyersoft/tools/A;->setLineSpace(Lcom/flyersoft/staticlayout/MRTextView;)V

    .line 150
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template1:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->book:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "\u2500\u2500"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->book:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 151
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template1:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->author:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->author:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 152
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template1:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->chapter:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->chapter:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 153
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template1:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->book:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->book:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v2

    const/4 v3, 0x0

    const/16 v4, 0x8

    if-nez v2, :cond_0

    sget-boolean v2, Lcom/flyersoft/tools/A;->shareTextTitle:Z

    if-eqz v2, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    const/16 v2, 0x8

    :goto_0
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 154
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template1:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->author:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->author:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    sget-boolean v2, Lcom/flyersoft/tools/A;->shareTextAuthor:Z

    if-eqz v2, :cond_1

    const/4 v2, 0x0

    goto :goto_1

    :cond_1
    const/16 v2, 0x8

    :goto_1
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 155
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template1:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->chapter:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->chapter:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    sget-boolean v2, Lcom/flyersoft/tools/A;->shareTextChapter:Z

    if-eqz v2, :cond_2

    goto :goto_2

    :cond_2
    const/16 v3, 0x8

    :goto_2
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 157
    invoke-static {}, Lcom/flyersoft/tools/A;->dualPageEnabled()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 158
    invoke-virtual {v0, v4}, Lcom/flyersoft/staticlayout/MRTextView;->setVisibility(I)V

    .line 159
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template1:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->tv:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 160
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->typeface:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 161
    sget v1, Lcom/flyersoft/tools/A;->fontColor:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 162
    sget v1, Lcom/flyersoft/tools/A;->shareTextSize:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    if-eqz p1, :cond_4

    .line 164
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->content:Ljava/lang/String;

    const-string v1, "\ufffc"

    const-string v2, "\u3000"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 165
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefShareText;->createBitmaps()V

    return-void

    .line 169
    :cond_3
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template1:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->tv:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    const/4 v1, 0x1

    .line 171
    iput-boolean v1, v0, Lcom/flyersoft/staticlayout/MRTextView;->alone:Z

    .line 172
    iput-boolean v1, v0, Lcom/flyersoft/staticlayout/MRTextView;->ignoreHighlight:Z

    if-eqz p1, :cond_4

    .line 175
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template1:Landroid/view/View;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefShareText$2;

    invoke-direct {v1, p0, v0}, Lcom/flyersoft/moonreaderp/PrefShareText$2;-><init>(Lcom/flyersoft/moonreaderp/PrefShareText;Lcom/flyersoft/staticlayout/MRTextView;)V

    const-wide/16 v2, 0x0

    invoke-virtual {p1, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_4
    return-void
.end method

.method private createTemplate2(Z)V
    .locals 5

    .line 205
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template2:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->contentMr:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 207
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->typeface:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 208
    sget-boolean v1, Lcom/flyersoft/tools/A;->shareTextTitle:Z

    const/4 v2, 0x0

    if-nez v1, :cond_0

    sget-boolean v1, Lcom/flyersoft/tools/A;->shareTextAuthor:Z

    if-nez v1, :cond_0

    sget-boolean v1, Lcom/flyersoft/tools/A;->shareTextChapter:Z

    if-nez v1, :cond_0

    const/4 v1, 0x0

    .line 209
    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    const/high16 v3, 0x40800000    # 4.0f

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    invoke-virtual {v0, v2, v1, v2, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 211
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template2:Landroid/view/View;

    invoke-static {v1}, Lcom/flyersoft/tools/A;->setBackgroundImage(Landroid/view/View;)V

    .line 212
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template2:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->book:I

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->book:Ljava/lang/String;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 213
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template2:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->author:I

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "\u2500\u2500"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->author:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 214
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template2:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->chapter:I

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->chapter:Ljava/lang/String;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 215
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template2:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->book:I

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->book:Ljava/lang/String;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v3

    const/16 v4, 0x8

    if-nez v3, :cond_1

    sget-boolean v3, Lcom/flyersoft/tools/A;->shareTextTitle:Z

    if-eqz v3, :cond_1

    const/4 v3, 0x0

    goto :goto_0

    :cond_1
    const/16 v3, 0x8

    :goto_0
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 216
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template2:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->author:I

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->author:Ljava/lang/String;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2

    sget-boolean v3, Lcom/flyersoft/tools/A;->shareTextAuthor:Z

    if-eqz v3, :cond_2

    const/4 v3, 0x0

    goto :goto_1

    :cond_2
    const/16 v3, 0x8

    :goto_1
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 217
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template2:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->chapter:I

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->chapter:Ljava/lang/String;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    sget-boolean v3, Lcom/flyersoft/tools/A;->shareTextChapter:Z

    if-eqz v3, :cond_3

    goto :goto_2

    :cond_3
    const/16 v2, 0x8

    :goto_2
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    if-eqz p1, :cond_4

    .line 220
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->content:Ljava/lang/String;

    const-string v1, "\ufffc"

    const-string v2, "\u3000"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_4
    return-void
.end method

.method private createTemplate3(Z)V
    .locals 5

    .line 224
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template3:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->contentMr:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 225
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->typeface:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 227
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template3:Landroid/view/View;

    invoke-static {v1}, Lcom/flyersoft/tools/A;->setBackgroundImage(Landroid/view/View;)V

    .line 228
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template3:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->book:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "\u2500\u2500"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->book:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 229
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template3:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->author:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->author:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 230
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template3:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->chapter:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->chapter:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 231
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template3:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->book:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->book:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v2

    const/4 v3, 0x0

    const/16 v4, 0x8

    if-nez v2, :cond_0

    sget-boolean v2, Lcom/flyersoft/tools/A;->shareTextTitle:Z

    if-eqz v2, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    const/16 v2, 0x8

    :goto_0
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 232
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template3:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->author:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->author:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    sget-boolean v2, Lcom/flyersoft/tools/A;->shareTextAuthor:Z

    if-eqz v2, :cond_1

    const/4 v2, 0x0

    goto :goto_1

    :cond_1
    const/16 v2, 0x8

    :goto_1
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 233
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template3:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->chapter:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->chapter:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    sget-boolean v2, Lcom/flyersoft/tools/A;->shareTextChapter:Z

    if-eqz v2, :cond_2

    goto :goto_2

    :cond_2
    const/16 v3, 0x8

    :goto_2
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    if-eqz p1, :cond_3

    .line 236
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->content:Ljava/lang/String;

    const-string v1, "\ufffc"

    const-string v2, "\u3000"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_3
    return-void
.end method

.method private createTemplate4(Z)V
    .locals 5

    .line 240
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template4:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->contentMr:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 241
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->typeface:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 242
    sget-boolean v1, Lcom/flyersoft/tools/A;->shareTextTitle:Z

    const/4 v2, 0x0

    if-nez v1, :cond_0

    sget-boolean v1, Lcom/flyersoft/tools/A;->shareTextAuthor:Z

    if-nez v1, :cond_0

    sget-boolean v1, Lcom/flyersoft/tools/A;->shareTextChapter:Z

    if-nez v1, :cond_0

    const/4 v1, 0x0

    .line 243
    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    const/high16 v3, 0x40800000    # 4.0f

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    invoke-virtual {v0, v2, v1, v2, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 245
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template4:Landroid/view/View;

    invoke-static {v1}, Lcom/flyersoft/tools/A;->setBackgroundImage(Landroid/view/View;)V

    .line 246
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template4:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->book:I

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "\u2500\u2500"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->book:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 247
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template4:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->author:I

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->author:Ljava/lang/String;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 248
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template4:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->chapter:I

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->chapter:Ljava/lang/String;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 249
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template4:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->book:I

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->book:Ljava/lang/String;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v3

    const/16 v4, 0x8

    if-nez v3, :cond_1

    sget-boolean v3, Lcom/flyersoft/tools/A;->shareTextTitle:Z

    if-eqz v3, :cond_1

    const/4 v3, 0x0

    goto :goto_0

    :cond_1
    const/16 v3, 0x8

    :goto_0
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 250
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template4:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->author:I

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->author:Ljava/lang/String;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2

    sget-boolean v3, Lcom/flyersoft/tools/A;->shareTextAuthor:Z

    if-eqz v3, :cond_2

    const/4 v3, 0x0

    goto :goto_1

    :cond_2
    const/16 v3, 0x8

    :goto_1
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 251
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template4:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->chapter:I

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->chapter:Ljava/lang/String;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    sget-boolean v3, Lcom/flyersoft/tools/A;->shareTextChapter:Z

    if-eqz v3, :cond_3

    goto :goto_2

    :cond_3
    const/16 v2, 0x8

    :goto_2
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    if-eqz p1, :cond_4

    .line 254
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->content:Ljava/lang/String;

    const-string v1, "\ufffc"

    const-string v2, "\u3000"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_4
    return-void
.end method

.method private getTypeface()Landroid/graphics/Typeface;
    .locals 6

    .line 123
    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getSpanned()Landroid/text/Spanned;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 125
    :try_start_0
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getTouchTxtView()Lcom/flyersoft/staticlayout/MRTextView;

    move-result-object v0

    .line 126
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getSpanned()Landroid/text/Spanned;

    move-result-object v2

    iget v3, v0, Lcom/flyersoft/staticlayout/MRTextView;->hStart:I

    iget v4, v0, Lcom/flyersoft/staticlayout/MRTextView;->hEnd:I

    const-class v5, Lcom/flyersoft/staticlayout/MyTypefaceSpan;

    invoke-interface {v2, v3, v4, v5}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lcom/flyersoft/staticlayout/MyTypefaceSpan;

    .line 127
    array-length v3, v2

    if-lez v3, :cond_1

    .line 129
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getSpanned()Landroid/text/Spanned;

    move-result-object v3

    iget v4, v0, Lcom/flyersoft/staticlayout/MRTextView;->hStart:I

    iget v0, v0, Lcom/flyersoft/staticlayout/MRTextView;->hEnd:I

    const-class v5, Lcom/flyersoft/staticlayout/MyStyleSpan;

    invoke-interface {v3, v4, v0, v5}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flyersoft/staticlayout/MyStyleSpan;

    .line 130
    array-length v3, v0

    if-lez v3, :cond_0

    .line 131
    aget-object v0, v0, v1

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MyStyleSpan;->getStyle()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 132
    :goto_0
    aget-object v2, v2, v1

    invoke-virtual {v2}, Lcom/flyersoft/staticlayout/MyTypefaceSpan;->getFamily()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v0, v1, v1}, Lcom/flyersoft/tools/A;->getTypeFace2(Ljava/lang/String;IZZ)Landroid/graphics/Typeface;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 135
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 137
    :cond_1
    sget-object v0, Lcom/flyersoft/tools/A;->fontName:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/flyersoft/tools/A;->getTypeFace(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v0

    return-object v0
.end method

.method private initView()V
    .locals 4

    .line 77
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->fl:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    .line 78
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->slideRv:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->slideRv:Landroidx/recyclerview/widget/RecyclerView;

    .line 79
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShareText;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$layout;->text2imaget1:I

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template1:Landroid/view/View;

    .line 80
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShareText;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$layout;->text2imaget2:I

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template2:Landroid/view/View;

    .line 81
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShareText;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$layout;->text2imaget3:I

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template3:Landroid/view/View;

    .line 82
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShareText;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$layout;->text2imaget4:I

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template4:Landroid/view/View;

    .line 83
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template1:Landroid/view/View;

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-virtual {v0, v1, v2, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;II)V

    .line 84
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template2:Landroid/view/View;

    invoke-virtual {v0, v1, v2, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;II)V

    .line 85
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template3:Landroid/view/View;

    invoke-virtual {v0, v1, v2, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;II)V

    .line 86
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template4:Landroid/view/View;

    invoke-virtual {v0, v1, v2, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;II)V

    .line 87
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template1:Landroid/view/View;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 88
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template2:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 89
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template3:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 90
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template4:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 91
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->options:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 92
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShareText;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/flyersoft/material/components/icons/R$color;->button_dark:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    goto :goto_0

    .line 93
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShareText;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/flyersoft/material/components/icons/R$color;->button_blue:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    :goto_0
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    .line 91
    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 96
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->Positive:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 97
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->Negative:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 98
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->minus:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 99
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->plus:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 100
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->options:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 101
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->astext:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 103
    invoke-static {}, Lcom/flyersoft/tools/A;->getBookName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->book:Ljava/lang/String;

    .line 104
    sget-object v1, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 105
    sget-object v0, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->book:Ljava/lang/String;

    .line 106
    :cond_1
    invoke-static {}, Lcom/flyersoft/tools/A;->getBookAuthor()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->author:Ljava/lang/String;

    .line 107
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getChapterName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->chapter:Ljava/lang/String;

    .line 108
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefShareText;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->typeface:Landroid/graphics/Typeface;

    .line 110
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->root:Landroid/view/View;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefShareText$1;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefShareText$1;-><init>(Lcom/flyersoft/moonreaderp/PrefShareText;)V

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method private onActiveCardChange()V
    .locals 2

    .line 336
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->layoutManger:Lcom/ramotion/cardslider/CardSliderLayoutManager;

    invoke-virtual {v0}, Lcom/ramotion/cardslider/CardSliderLayoutManager;->getActiveCardPosition()I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    .line 337
    sget v1, Lcom/flyersoft/tools/A;->shareTextType:I

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 340
    :cond_0
    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/PrefShareText;->onActiveCardChange(I)V

    :cond_1
    :goto_0
    return-void
.end method

.method private onActiveCardChange(I)V
    .locals 0

    .line 344
    sput p1, Lcom/flyersoft/tools/A;->shareTextType:I

    return-void
.end method

.method private setTextSize(Z)V
    .locals 5

    .line 412
    sget v0, Lcom/flyersoft/tools/A;->shareTextSize:I

    const/16 v1, 0xa

    if-ge v0, v1, :cond_0

    .line 413
    sput v1, Lcom/flyersoft/tools/A;->shareTextSize:I

    .line 414
    :cond_0
    sget v0, Lcom/flyersoft/tools/A;->shareTextSize:I

    const/16 v1, 0x64

    if-le v0, v1, :cond_1

    .line 415
    sput v1, Lcom/flyersoft/tools/A;->shareTextSize:I

    .line 416
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "share text size: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v1, Lcom/flyersoft/tools/A;->shareTextSize:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 418
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template1:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->book:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    sget v1, Lcom/flyersoft/tools/A;->shareTextSize:I

    int-to-float v1, v1

    const/high16 v2, 0x40900000    # 4.5f

    sub-float/2addr v1, v2

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 419
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template1:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->author:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    sget v1, Lcom/flyersoft/tools/A;->shareTextSize:I

    int-to-float v1, v1

    sub-float/2addr v1, v2

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 420
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template1:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->chapter:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    sget v1, Lcom/flyersoft/tools/A;->shareTextSize:I

    int-to-float v1, v1

    const/high16 v3, 0x40b00000    # 5.5f

    sub-float/2addr v1, v3

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 421
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template1:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->contentMr:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/staticlayout/MRTextView;

    sget v1, Lcom/flyersoft/tools/A;->shareTextSize:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/staticlayout/MRTextView;->setTextSize(F)V

    .line 423
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template2:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->book:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    sget v1, Lcom/flyersoft/tools/A;->shareTextSize:I

    int-to-float v1, v1

    sub-float/2addr v1, v3

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 424
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template2:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->author:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    sget v1, Lcom/flyersoft/tools/A;->shareTextSize:I

    int-to-float v1, v1

    const/high16 v4, 0x40d00000    # 6.5f

    sub-float/2addr v1, v4

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 425
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template2:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->chapter:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    sget v1, Lcom/flyersoft/tools/A;->shareTextSize:I

    int-to-float v1, v1

    sub-float/2addr v1, v4

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 426
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template2:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->contentMr:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    sget v1, Lcom/flyersoft/tools/A;->shareTextSize:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 428
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template3:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->book:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    sget v1, Lcom/flyersoft/tools/A;->shareTextSize:I

    int-to-float v1, v1

    const/high16 v4, 0x40a00000    # 5.0f

    sub-float/2addr v1, v4

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 429
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template3:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->author:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    sget v1, Lcom/flyersoft/tools/A;->shareTextSize:I

    int-to-float v1, v1

    sub-float/2addr v1, v4

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 430
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template3:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->chapter:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    sget v1, Lcom/flyersoft/tools/A;->shareTextSize:I

    int-to-float v1, v1

    const/high16 v4, 0x40c00000    # 6.0f

    sub-float/2addr v1, v4

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 431
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template3:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->contentMr:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    sget v1, Lcom/flyersoft/tools/A;->shareTextSize:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 433
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template4:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->book:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    sget v1, Lcom/flyersoft/tools/A;->shareTextSize:I

    int-to-float v1, v1

    sub-float/2addr v1, v2

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 434
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template4:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->author:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    sget v1, Lcom/flyersoft/tools/A;->shareTextSize:I

    int-to-float v1, v1

    sub-float/2addr v1, v2

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 435
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template4:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->chapter:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    sget v1, Lcom/flyersoft/tools/A;->shareTextSize:I

    int-to-float v1, v1

    sub-float/2addr v1, v3

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 436
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template4:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->contentMr:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    sget v1, Lcom/flyersoft/tools/A;->shareTextSize:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    if-eqz p1, :cond_2

    .line 439
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefShareText;->createBitmaps()V

    :cond_2
    return-void
.end method

.method private shareContent()V
    .locals 4

    .line 505
    sget v0, Lcom/flyersoft/tools/A;->shareTextType:I

    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefShareText;->getBitmap(I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 506
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 508
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/flyersoft/tools/A;->book_cache:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/moonreader"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, ".jpg"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 509
    invoke-static {v0, v1}, Lcom/flyersoft/tools/T;->bitmapToFile(Landroid/graphics/Bitmap;Ljava/lang/String;)Z

    .line 510
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShareText;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v2}, Lcom/flyersoft/tools/A;->getUriProvider(Landroid/content/Context;Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    .line 511
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.SEND"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 512
    const-string v2, "image/png"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 513
    const-string v2, "android.intent.extra.SUBJECT"

    invoke-static {}, Lcom/flyersoft/tools/A;->getBookName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 514
    const-string v2, "android.intent.extra.STREAM"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const/4 v0, 0x1

    .line 515
    invoke-virtual {v1, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const/high16 v0, 0x10000000

    .line 516
    invoke-virtual {v1, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 517
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShareText;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShareText;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->share:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    .line 519
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public dismiss()V
    .locals 2

    .line 525
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    .line 526
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 527
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->moveStart2:Z

    sput-boolean v0, Lcom/flyersoft/tools/A;->moveStart:Z

    const/4 v0, 0x1

    .line 528
    invoke-static {v0}, Lcom/flyersoft/tools/A;->setSystemUiVisibility(Z)V

    .line 529
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->eraseGPUShadow(I)V

    :cond_0
    return-void
.end method

.method public eraseGPUShadow(Z)V
    .locals 2

    .line 534
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x1

    :cond_0
    if-nez p1, :cond_1

    .line 537
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->root:Landroid/view/View;

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->fl:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p1

    .line 538
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template1:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->lay:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    if-lt p1, v0, :cond_1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template2:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->lay:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    if-lt p1, v0, :cond_1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template3:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->lay:I

    .line 539
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    if-lt p1, v0, :cond_1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->template4:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->lay:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    if-lt p1, v0, :cond_1

    return-void

    .line 542
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->root:Landroid/view/View;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 543
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->root:Landroid/view/View;

    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-eqz v0, :cond_3

    sget-boolean v0, Lcom/flyersoft/tools/A;->amoled:Z

    if-eqz v0, :cond_2

    sget v0, Lcom/flyersoft/tools/C;->amoledBlack3:I

    goto :goto_0

    :cond_2
    const v0, -0xafafb0

    goto :goto_0

    :cond_3
    const/4 v0, -0x1

    :goto_0
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    return-void
.end method

.method getBitmap(I)Landroid/graphics/Bitmap;
    .locals 1

    if-nez p1, :cond_0

    .line 501
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->bm1:Landroid/graphics/Bitmap;

    return-object p1

    :cond_0
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->bm2:Landroid/graphics/Bitmap;

    return-object p1

    :cond_1
    const/4 v0, 0x2

    if-ne p1, v0, :cond_2

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->bm3:Landroid/graphics/Bitmap;

    return-object p1

    :cond_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->bm4:Landroid/graphics/Bitmap;

    return-object p1
.end method

.method public onClick(Landroid/view/View;)V
    .locals 11

    .line 443
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->Positive:I

    if-ne v0, v1, :cond_0

    .line 444
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefShareText;->shareContent()V

    .line 445
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShareText;->dismiss()V

    .line 447
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->Negative:I

    if-ne v0, v1, :cond_1

    .line 448
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShareText;->dismiss()V

    .line 450
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->minus:I

    const/4 v2, 0x1

    if-ne v0, v1, :cond_2

    .line 451
    sget v0, Lcom/flyersoft/tools/A;->shareTextSize:I

    sub-int/2addr v0, v2

    sput v0, Lcom/flyersoft/tools/A;->shareTextSize:I

    .line 452
    invoke-direct {p0, v2}, Lcom/flyersoft/moonreaderp/PrefShareText;->setTextSize(Z)V

    .line 454
    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->plus:I

    if-ne v0, v1, :cond_3

    .line 455
    sget v0, Lcom/flyersoft/tools/A;->shareTextSize:I

    add-int/2addr v0, v2

    sput v0, Lcom/flyersoft/tools/A;->shareTextSize:I

    .line 456
    invoke-direct {p0, v2}, Lcom/flyersoft/moonreaderp/PrefShareText;->setTextSize(Z)V

    .line 458
    :cond_3
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->astext:I

    if-ne v0, v1, :cond_5

    .line 459
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 460
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->content:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->shareTextIntent(Ljava/lang/String;)V

    .line 461
    :cond_4
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShareText;->dismiss()V

    .line 463
    :cond_5
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->options:I

    if-ne p1, v0, :cond_6

    .line 464
    new-instance p1, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShareText;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/high16 v0, 0x41000000    # 8.0f

    .line 465
    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    const/high16 v1, 0x41800000    # 16.0f

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    invoke-virtual {p1, v0, v3, v4, v1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 466
    invoke-virtual {p1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 467
    new-instance v7, Landroid/widget/CheckBox;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShareText;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {v7, v0}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    .line 468
    new-instance v8, Landroid/widget/CheckBox;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShareText;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {v8, v0}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    .line 469
    new-instance v9, Landroid/widget/CheckBox;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShareText;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {v9, v0}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    .line 470
    sget-boolean v0, Lcom/flyersoft/tools/A;->shareTextTitle:Z

    invoke-virtual {v7, v0}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 471
    sget-boolean v0, Lcom/flyersoft/tools/A;->shareTextAuthor:Z

    invoke-virtual {v8, v0}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 472
    sget-boolean v0, Lcom/flyersoft/tools/A;->shareTextChapter:Z

    invoke-virtual {v9, v0}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 473
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShareText;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->book_title:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 474
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShareText;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->book_author:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v8, v0}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 475
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShareText;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->current_chapter:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->deleteQuotes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 476
    invoke-virtual {p1, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 477
    invoke-virtual {p1, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 478
    invoke-virtual {p1, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 479
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-boolean v1, Lcom/flyersoft/tools/A;->shareTextTitle:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-boolean v2, Lcom/flyersoft/tools/A;->shareTextAuthor:Z

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-boolean v1, Lcom/flyersoft/tools/A;->shareTextChapter:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 480
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShareText;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    new-instance v5, Lcom/flyersoft/moonreaderp/PrefShareText$6;

    move-object v6, p0

    invoke-direct/range {v5 .. v10}, Lcom/flyersoft/moonreaderp/PrefShareText$6;-><init>(Lcom/flyersoft/moonreaderp/PrefShareText;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Ljava/lang/String;)V

    const v0, 0x104000a

    invoke-virtual {p1, v0, v5}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    .line 496
    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    :cond_6
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 60
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 62
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShareText;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object p1

    .line 63
    invoke-static {}, Lcom/flyersoft/tools/A;->myOptionDialogWidth()I

    move-result v0

    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->width:I

    const/4 v0, -0x2

    .line 64
    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->height:I

    const/16 v0, 0x11

    .line 65
    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->gravity:I

    const v0, 0x3f4ccccd    # 0.8f

    .line 66
    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->dimAmount:F

    .line 67
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShareText;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 68
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShareText;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x400

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 69
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShareText;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 71
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShareText;->root:Landroid/view/View;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->checkNightDialogState(Landroid/view/View;)Z

    .line 72
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefShareText;->initView()V

    .line 73
    invoke-static {p0}, Lcom/flyersoft/tools/A;->forceDialogImmersiveMode(Landroid/app/Dialog;)V

    return-void
.end method
