.class public Lcom/flyersoft/moonreaderp/PrefAbout;
.super Lcom/flyersoft/moonreaderp/PrefOptions;
.source "PrefAbout.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/moonreaderp/PrefAbout$MyURLSpan;,
        Lcom/flyersoft/moonreaderp/PrefAbout$DonateAdapter;
    }
.end annotation


# instance fields
.field aboutTv:Landroid/widget/TextView;

.field buyB:Landroid/widget/TextView;

.field buyLay:Landroid/view/View;

.field cancelB:Landroid/widget/TextView;

.field fromStart:Z

.field promotion:Landroid/widget/ImageView;

.field promotion2:Landroid/widget/ImageView;

.field promotionTv:Landroid/widget/TextView;

.field promotionTv2:Landroid/widget/TextView;

.field showPromotion:Z

.field superActivity:Landroid/app/Activity;

.field text:Ljava/lang/String;


# direct methods
.method static bridge synthetic -$$Nest$mdisplayPromotion(Lcom/flyersoft/moonreaderp/PrefAbout;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefAbout;->displayPromotion()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mshowDonation(Lcom/flyersoft/moonreaderp/PrefAbout;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefAbout;->showDonation()V

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Ljava/lang/String;Z)V
    .locals 1

    .line 49
    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->about:I

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;-><init>(Landroid/content/Context;I)V

    const/4 v0, 0x0

    .line 145
    iput-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->showPromotion:Z

    .line 50
    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->text:Ljava/lang/String;

    .line 51
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->superActivity:Landroid/app/Activity;

    .line 52
    iput-boolean p3, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->fromStart:Z

    return-void
.end method

.method private addTapForAboutText()V
    .locals 5

    .line 195
    const-string v0, "<br>"

    :try_start_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->text:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 196
    const-string v2, "<a href=\"https://www.moondownload.com/faq.html\">https://www.moondownload.com/faq.html</a>"

    .line 197
    const-string v3, "##TAG##"

    .line 198
    const-string v4, "https://www.moondownload.com/faq.html"

    invoke-virtual {v1, v4, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    const-string v4, "http://www.moondownload.com/faq.html"

    .line 199
    invoke-virtual {v1, v4, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    const-string v4, "www.moondownload.com/faq.html"

    .line 200
    invoke-virtual {v1, v4, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    .line 201
    invoke-virtual {v1, v3, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    .line 203
    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 204
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x4

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 205
    :cond_0
    sget-boolean v2, Lcom/flyersoft/tools/A;->isProVersion:Z

    if-eqz v2, :cond_1

    .line 206
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 215
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "<br><br><center><a href=\"http://subscription\"><b>About Ad-free subscription in the app</b></a></center><br><br>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 219
    :goto_1
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->aboutTv:Landroid/widget/TextView;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setLinksClickable(Z)V

    .line 220
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->aboutTv:Landroid/widget/TextView;

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 221
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->aboutTv:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefAbout;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {p0, v2, v0}, Lcom/flyersoft/moonreaderp/PrefAbout;->getClickableHtml(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    .line 223
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 224
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->aboutTv:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->text:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/A;->myFromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private displayPromotion()V
    .locals 13

    .line 148
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->aboutTv:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 150
    :try_start_0
    invoke-static {}, Lcom/flyersoft/tools/A;->myOptionDialogWidth()I

    move-result v0

    const/high16 v2, 0x41f00000    # 30.0f

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    sub-int/2addr v0, v2

    .line 151
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->promotion2:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout$LayoutParams;

    .line 152
    sget-boolean v3, Lcom/flyersoft/tools/A;->isTablet:Z

    if-eqz v3, :cond_0

    const/high16 v3, 0x41a00000    # 20.0f

    goto :goto_0

    :cond_0
    const/high16 v3, 0x41400000    # 12.0f

    :goto_0
    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 153
    sget-boolean v3, Lcom/flyersoft/tools/A;->isTablet:Z

    if-eqz v3, :cond_1

    const/high16 v3, 0x41800000    # 16.0f

    goto :goto_1

    :cond_1
    const/high16 v3, 0x41000000    # 8.0f

    :goto_1
    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    mul-int/lit16 v0, v0, 0x320

    .line 154
    div-int/lit16 v0, v0, 0x1e0

    iput v0, v2, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 156
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->promotion2:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 157
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefAbout$2;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefAbout$2;-><init>(Lcom/flyersoft/moonreaderp/PrefAbout;)V

    .line 162
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->promotion2:Landroid/widget/ImageView;

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 164
    new-instance v0, Landroid/view/animation/AlphaAnimation;

    const v2, 0x3dcccccd    # 0.1f

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v0, v2, v3}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    const-wide/16 v2, 0x7d0

    .line 165
    invoke-virtual {v0, v2, v3}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 166
    new-instance v4, Landroid/view/animation/ScaleAnimation;

    const/4 v11, 0x1

    const/high16 v12, 0x3f000000    # 0.5f

    const/4 v5, 0x0

    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v7, 0x0

    const/high16 v8, 0x3f800000    # 1.0f

    const/4 v9, 0x1

    const/high16 v10, 0x3f000000    # 0.5f

    invoke-direct/range {v4 .. v12}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFIFIF)V

    const-wide/16 v2, 0x3e8

    .line 168
    invoke-virtual {v4, v2, v3}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 169
    new-instance v2, Landroid/view/animation/AnimationSet;

    invoke-direct {v2, v1}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    .line 170
    invoke-virtual {v2, v0}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 171
    invoke-virtual {v2, v4}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 172
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->promotion2:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->startAnimation(Landroid/view/animation/Animation;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 174
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-void
.end method

.method private initView()V
    .locals 6

    .line 81
    const-string v0, "yyyy-MM-dd"

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->buyLay:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->buyLay:Landroid/view/View;

    .line 82
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->buyPro:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->buyB:Landroid/widget/TextView;

    .line 83
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->cancel:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->cancelB:Landroid/widget/TextView;

    .line 84
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->aboutText:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->aboutTv:Landroid/widget/TextView;

    .line 85
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->promotion:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->promotion:Landroid/widget/ImageView;

    .line 86
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->promotion2:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->promotion2:Landroid/widget/ImageView;

    .line 87
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->promotionTv:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->promotionTv:Landroid/widget/TextView;

    .line 88
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->promotionTv2:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->promotionTv2:Landroid/widget/TextView;

    .line 89
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->promotion:Landroid/widget/ImageView;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 90
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->promotion2:Landroid/widget/ImageView;

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 91
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->promotionTv:Landroid/widget/TextView;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 92
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->promotionTv2:Landroid/widget/TextView;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 104
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->buyLay:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 107
    invoke-static {}, Lcom/flyersoft/tools/A;->isPro()Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_1

    sget-boolean v1, Lcom/flyersoft/tools/A;->isHuaWeiVersion:Z

    if-nez v1, :cond_1

    sget-boolean v1, Lcom/flyersoft/tools/A;->isAmazonVersion:Z

    if-nez v1, :cond_1

    .line 109
    :try_start_0
    new-instance v1, Ljava/text/SimpleDateFormat;

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v1, v0, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    const-string v3, "2025-08-01"

    invoke-virtual {v1, v3}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    .line 110
    new-instance v3, Ljava/text/SimpleDateFormat;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v3, v0, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    const-string v0, "2025-08-09"

    invoke-virtual {v3, v0}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    .line 111
    new-instance v3, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-direct {v3, v4, v5}, Ljava/util/Date;-><init>(J)V

    .line 112
    invoke-virtual {v3, v1}, Ljava/util/Date;->after(Ljava/util/Date;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v3, v0}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->showPromotion:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 114
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 116
    :cond_1
    :goto_1
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->showPromotion:Z

    if-eqz v0, :cond_2

    .line 117
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->headerMain:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->buyLay:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 118
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->promotion2:Landroid/widget/ImageView;

    sget v1, Lcom/flyersoft/moonreaderp/R$drawable;->promotion:I

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 119
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->aboutTv:Landroid/widget/TextView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 120
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefAbout$1;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/flyersoft/moonreaderp/PrefAbout$1;-><init>(Lcom/flyersoft/moonreaderp/PrefAbout;Landroid/os/Looper;)V

    const-wide/16 v3, 0x64

    .line 124
    invoke-virtual {v0, v2, v3, v4}, Lcom/flyersoft/moonreaderp/PrefAbout$1;->sendEmptyMessageDelayed(IJ)Z

    .line 128
    :cond_2
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefAbout;->showNewFeatureWithImage()V

    .line 129
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefAbout;->addTapForAboutText()V

    return-void
.end method

.method private showDonation()V
    .locals 4

    .line 264
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefAbout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->alertDialog(Landroid/content/Context;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object v0

    .line 265
    sget v1, Lcom/flyersoft/moonreaderp/R$string;->donations:I

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setTitle(I)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefAbout$DonateAdapter;

    .line 266
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefAbout;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Lcom/flyersoft/moonreaderp/PrefAbout$DonateAdapter;-><init>(Lcom/flyersoft/moonreaderp/PrefAbout;Landroid/content/Context;)V

    new-instance v3, Lcom/flyersoft/moonreaderp/PrefAbout$3;

    invoke-direct {v3, p0}, Lcom/flyersoft/moonreaderp/PrefAbout$3;-><init>(Lcom/flyersoft/moonreaderp/PrefAbout;)V

    invoke-virtual {v1, v2, v3}, Landroidx/appcompat/app/AlertDialog$Builder;->setAdapter(Landroid/widget/ListAdapter;Landroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object v1

    const/4 v2, 0x1

    .line 279
    invoke-virtual {v1, v2}, Landroidx/appcompat/app/AlertDialog$Builder;->setCancelable(Z)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 280
    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog$Builder;->show()Landroidx/appcompat/app/AlertDialog;

    move-result-object v0

    .line 281
    invoke-static {v0}, Lcom/flyersoft/components/MyDialog;->setDialogDynamicBackground(Landroid/app/Dialog;)V

    return-void
.end method

.method private showNewFeatureWithImage()V
    .locals 0

    return-void
.end method


# virtual methods
.method public dismiss()V
    .locals 1

    .line 359
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->SaveOptions(Landroid/content/Context;)V

    .line 360
    invoke-super {p0}, Lcom/flyersoft/moonreaderp/PrefOptions;->dismiss()V

    return-void
.end method

.method getClickableHtml(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 8

    .line 229
    invoke-static {p2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p2

    .line 230
    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0, p2}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 231
    invoke-interface {p2}, Landroid/text/Spanned;->length()I

    move-result p2

    const-class v1, Landroid/text/style/URLSpan;

    const/4 v2, 0x0

    invoke-virtual {v0, v2, p2, v1}, Landroid/text/SpannableStringBuilder;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [Landroid/text/style/URLSpan;

    .line 232
    array-length v1, p2

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, p2, v2

    .line 233
    invoke-virtual {v0, v3}, Landroid/text/SpannableStringBuilder;->getSpanStart(Ljava/lang/Object;)I

    move-result v4

    .line 234
    invoke-virtual {v0, v3}, Landroid/text/SpannableStringBuilder;->getSpanEnd(Ljava/lang/Object;)I

    move-result v5

    .line 235
    new-instance v6, Lcom/flyersoft/moonreaderp/PrefAbout$MyURLSpan;

    invoke-virtual {v3}, Landroid/text/style/URLSpan;->getURL()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, p0, p1, v7}, Lcom/flyersoft/moonreaderp/PrefAbout$MyURLSpan;-><init>(Lcom/flyersoft/moonreaderp/PrefAbout;Landroid/content/Context;Ljava/lang/String;)V

    const/16 v7, 0x11

    invoke-virtual {v0, v6, v4, v5, v7}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 236
    invoke-virtual {v0, v3}, Landroid/text/SpannableStringBuilder;->removeSpan(Ljava/lang/Object;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 180
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->buyB:Landroid/widget/TextView;

    if-ne p1, v0, :cond_0

    .line 183
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefAbout;->dismiss()V

    .line 184
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 185
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->showSubscriptionDlg()V

    .line 187
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefAbout;->cancelB:Landroid/widget/TextView;

    if-ne p1, v0, :cond_1

    .line 188
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefAbout;->dismiss()V

    :cond_1
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 7

    const-string v0, "  ("

    .line 57
    invoke-super {p0, p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->onCreate(Landroid/os/Bundle;)V

    .line 58
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefAbout;->getContext()Landroid/content/Context;

    move-result-object p1

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->app_name:I

    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x0

    .line 60
    :try_start_0
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefAbout;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefAbout;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    iget v2, v2, Landroid/content/pm/PackageInfo;->versionCode:I

    .line 61
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefAbout;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefAbout;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v3

    iget-object v3, v3, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    .line 62
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefAbout;->getContext()Landroid/content/Context;

    move-result-object v5

    sget v6, Lcom/flyersoft/moonreaderp/R$string;->app_name:I

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x1

    .line 63
    invoke-static {v0, v2}, Lcom/flyersoft/tools/T;->greyColorHtml(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 62
    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 65
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 67
    :goto_0
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefAbout;->initParams()Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object v0

    const v2, 0x3f4ccccd    # 0.8f

    .line 68
    invoke-virtual {v0, v2}, Lcom/flyersoft/moonreaderp/PrefOptions;->setDim(F)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object v0

    const/4 v2, -0x1

    .line 69
    invoke-virtual {v0, v2}, Lcom/flyersoft/moonreaderp/PrefOptions;->setHeight(I)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object v0

    .line 70
    invoke-virtual {v0, p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->setDialogTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    .line 71
    invoke-virtual {p1, v1}, Lcom/flyersoft/moonreaderp/PrefOptions;->setFullscreen(Z)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    .line 72
    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->done()V

    .line 73
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefAbout;->initView()V

    return-void
.end method
