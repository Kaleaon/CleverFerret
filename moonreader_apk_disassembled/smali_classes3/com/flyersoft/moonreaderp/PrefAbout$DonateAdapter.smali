.class public Lcom/flyersoft/moonreaderp/PrefAbout$DonateAdapter;
.super Landroid/widget/BaseAdapter;
.source "PrefAbout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefAbout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "DonateAdapter"
.end annotation


# instance fields
.field mContext:Landroid/content/Context;

.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefAbout;


# direct methods
.method public constructor <init>(Lcom/flyersoft/moonreaderp/PrefAbout;Landroid/content/Context;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 286
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefAbout$DonateAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefAbout;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 287
    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefAbout$DonateAdapter;->mContext:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    const/4 v0, 0x6

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 0

    .line 295
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method public getItemId(I)J
    .locals 2

    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 5

    const/4 p3, 0x0

    if-eqz p2, :cond_0

    goto :goto_0

    .line 304
    :cond_0
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefAbout$DonateAdapter;->mContext:Landroid/content/Context;

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->select_app_item:I

    invoke-virtual {p2, v0, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 305
    :goto_0
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->iv:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    const v1, 0x1020014

    .line 306
    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    const/high16 v2, 0x41800000    # 16.0f

    .line 311
    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    const/4 v3, 0x0

    .line 312
    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    const/4 v3, 0x1

    const/16 v4, 0x10

    if-eq p1, v3, :cond_5

    const/4 v3, 0x2

    if-eq p1, v3, :cond_4

    const/4 v3, 0x3

    if-eq p1, v3, :cond_3

    const/4 v2, 0x4

    if-eq p1, v2, :cond_2

    const/4 v2, 0x5

    if-eq p1, v2, :cond_1

    const/16 p1, 0x8

    .line 338
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setVisibility(I)V

    const/high16 p1, 0x41a00000    # 20.0f

    .line 339
    invoke-static {p1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    const/high16 v3, 0x41900000    # 18.0f

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    invoke-static {p1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result p1

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    invoke-virtual {v1, v2, v4, p1, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 342
    const-string p1, "If you\'ve used Moon+ Reader Pro for <b>3+ years</b>, and want to encourage us, it\'s appreciated!"

    const/16 v4, 0xd

    goto :goto_1

    .line 334
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefAbout$DonateAdapter;->mContext:Landroid/content/Context;

    sget p3, Lcom/flyersoft/moonreaderp/R$string;->donate_100:I

    invoke-virtual {p1, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    .line 335
    iget-object p3, p0, Lcom/flyersoft/moonreaderp/PrefAbout$DonateAdapter;->mContext:Landroid/content/Context;

    sget v2, Lcom/flyersoft/moonreaderp/R$drawable;->donate100:I

    invoke-virtual {p3, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p3

    goto :goto_1

    .line 330
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefAbout$DonateAdapter;->mContext:Landroid/content/Context;

    sget p3, Lcom/flyersoft/moonreaderp/R$string;->donate_50:I

    invoke-virtual {p1, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    .line 331
    iget-object p3, p0, Lcom/flyersoft/moonreaderp/PrefAbout$DonateAdapter;->mContext:Landroid/content/Context;

    sget v2, Lcom/flyersoft/moonreaderp/R$drawable;->donate50:I

    invoke-virtual {p3, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p3

    goto :goto_1

    .line 325
    :cond_3
    invoke-virtual {v0, v2, v2, v2, v2}, Landroid/widget/ImageView;->setPadding(IIII)V

    .line 326
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefAbout$DonateAdapter;->mContext:Landroid/content/Context;

    sget p3, Lcom/flyersoft/moonreaderp/R$string;->donate_10:I

    invoke-virtual {p1, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    .line 327
    iget-object p3, p0, Lcom/flyersoft/moonreaderp/PrefAbout$DonateAdapter;->mContext:Landroid/content/Context;

    sget v2, Lcom/flyersoft/moonreaderp/R$drawable;->donate10:I

    invoke-virtual {p3, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p3

    goto :goto_1

    .line 320
    :cond_4
    invoke-virtual {v0, v2, v2, v2, v2}, Landroid/widget/ImageView;->setPadding(IIII)V

    .line 321
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefAbout$DonateAdapter;->mContext:Landroid/content/Context;

    sget p3, Lcom/flyersoft/moonreaderp/R$string;->donate_5:I

    invoke-virtual {p1, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    .line 322
    iget-object p3, p0, Lcom/flyersoft/moonreaderp/PrefAbout$DonateAdapter;->mContext:Landroid/content/Context;

    sget v2, Lcom/flyersoft/moonreaderp/R$drawable;->donate5:I

    invoke-virtual {p3, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p3

    goto :goto_1

    .line 315
    :cond_5
    invoke-virtual {v0, v2, v2, v2, v2}, Landroid/widget/ImageView;->setPadding(IIII)V

    .line 316
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefAbout$DonateAdapter;->mContext:Landroid/content/Context;

    sget p3, Lcom/flyersoft/moonreaderp/R$string;->donate_1:I

    invoke-virtual {p1, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    .line 317
    iget-object p3, p0, Lcom/flyersoft/moonreaderp/PrefAbout$DonateAdapter;->mContext:Landroid/content/Context;

    sget v2, Lcom/flyersoft/moonreaderp/R$drawable;->donate1:I

    invoke-virtual {p3, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p3

    .line 344
    :goto_1
    invoke-virtual {v0, p3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 345
    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    int-to-float p1, v4

    .line 346
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 347
    invoke-static {p2}, Lcom/flyersoft/tools/A;->checkNightDialogState(Landroid/view/View;)Z

    return-object p2
.end method
