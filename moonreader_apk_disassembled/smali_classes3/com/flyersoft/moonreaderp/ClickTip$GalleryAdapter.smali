.class public Lcom/flyersoft/moonreaderp/ClickTip$GalleryAdapter;
.super Landroid/widget/BaseAdapter;
.source "ClickTip.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ClickTip;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "GalleryAdapter"
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field mGalleryItemBackground:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 221
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 222
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ClickTip$GalleryAdapter;->mContext:Landroid/content/Context;

    .line 224
    :try_start_0
    sget-object v0, Lcom/flyersoft/moonreaderp/R$styleable;->Gallery:[I

    invoke-virtual {p1, v0}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 225
    sget v0, Lcom/flyersoft/moonreaderp/R$styleable;->Gallery_android_galleryItemBackground:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    iput v0, p0, Lcom/flyersoft/moonreaderp/ClickTip$GalleryAdapter;->mGalleryItemBackground:I

    .line 227
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    .line 229
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    const/16 v0, 0xb

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 0

    .line 238
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
    .locals 2

    if-nez p2, :cond_0

    .line 248
    new-instance p2, Landroid/widget/ImageView;

    iget-object p3, p0, Lcom/flyersoft/moonreaderp/ClickTip$GalleryAdapter;->mContext:Landroid/content/Context;

    invoke-direct {p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    goto :goto_0

    .line 250
    :cond_0
    check-cast p2, Landroid/widget/ImageView;

    .line 252
    :goto_0
    sget-object p3, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 253
    new-instance p3, Landroid/widget/Gallery$LayoutParams;

    const/high16 v0, 0x42c80000    # 100.0f

    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    const/4 v1, -0x1

    invoke-direct {p3, v0, v1}, Landroid/widget/Gallery$LayoutParams;-><init>(II)V

    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 254
    iget p3, p0, Lcom/flyersoft/moonreaderp/ClickTip$GalleryAdapter;->mGalleryItemBackground:I

    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 255
    sget-object p3, Lcom/flyersoft/moonreaderp/ClickTip;->tips:[I

    aget p1, p3, p1

    invoke-virtual {p2, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    return-object p2
.end method
