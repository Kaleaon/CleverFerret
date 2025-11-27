.class public Lcom/flyersoft/moonreaderp/PicGalleryShow$GalleryAdapter;
.super Landroid/widget/BaseAdapter;
.source "PicGalleryShow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PicGalleryShow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "GalleryAdapter"
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field mGalleryItemBackground:I

.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;


# direct methods
.method public constructor <init>(Lcom/flyersoft/moonreaderp/PicGalleryShow;Landroid/content/Context;)V
    .locals 1
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

    .line 880
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$GalleryAdapter;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 881
    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$GalleryAdapter;->mContext:Landroid/content/Context;

    .line 882
    sget-object p2, Lcom/flyersoft/moonreaderp/R$styleable;->Gallery:[I

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 883
    sget p2, Lcom/flyersoft/moonreaderp/R$styleable;->Gallery_android_galleryItemBackground:I

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    iput p2, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$GalleryAdapter;->mGalleryItemBackground:I

    .line 885
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .line 889
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$GalleryAdapter;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->-$$Nest$fgetgalleryClearTag(Lcom/flyersoft/moonreaderp/PicGalleryShow;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$GalleryAdapter;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageFiles:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 0

    .line 893
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
    .locals 4

    .line 901
    const-string p3, "s"

    const/4 v0, 0x0

    if-nez p2, :cond_0

    .line 904
    :try_start_0
    new-instance p2, Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$GalleryAdapter;->mContext:Landroid/content/Context;

    invoke-direct {p2, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    goto :goto_0

    .line 906
    :cond_0
    check-cast p2, Landroid/widget/ImageView;
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 909
    :goto_0
    :try_start_1
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$GalleryAdapter;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-static {v1}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->-$$Nest$misCbz(Lcom/flyersoft/moonreaderp/PicGalleryShow;)Z

    move-result v1

    if-eqz v1, :cond_1

    sget-object v1, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    goto :goto_1

    :cond_1
    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    :goto_1
    invoke-virtual {p2, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 910
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$GalleryAdapter;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-static {v1}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->-$$Nest$misCbz(Lcom/flyersoft/moonreaderp/PicGalleryShow;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$GalleryAdapter;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget v1, v1, Lcom/flyersoft/moonreaderp/PicGalleryShow;->cbzThumbSize:I

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$GalleryAdapter;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->CbzWidthRatio()I

    move-result v2

    mul-int v1, v1, v2

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$GalleryAdapter;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->CbzHeightRatio()I

    move-result v2

    div-int/2addr v1, v2

    add-int/lit8 v1, v1, 0x10

    int-to-float v1, v1

    goto :goto_2

    :cond_2
    const/high16 v1, 0x42a00000    # 80.0f

    :goto_2
    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    .line 911
    new-instance v2, Landroid/widget/Gallery$LayoutParams;

    const/4 v3, -0x1

    invoke-direct {v2, v1, v3}, Landroid/widget/Gallery$LayoutParams;-><init>(II)V

    invoke-virtual {p2, v2}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 912
    iget v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$GalleryAdapter;->mGalleryItemBackground:I

    invoke-virtual {p2, v1}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 915
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$GalleryAdapter;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageFiles:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 916
    invoke-virtual {p2, v1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 917
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$GalleryAdapter;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageCache:Ljava/util/HashMap;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 918
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$GalleryAdapter;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageCache:Ljava/util/HashMap;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v0, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    move-object v0, p3

    check-cast v0, Landroid/graphics/drawable/Drawable;

    goto :goto_3

    .line 919
    :cond_3
    iget-object p3, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$GalleryAdapter;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget-object p3, p3, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageCache:Ljava/util/HashMap;

    invoke-virtual {p3, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_4

    .line 920
    iget-object p3, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$GalleryAdapter;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget-object p3, p3, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageCache:Ljava/util/HashMap;

    invoke-virtual {p3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    move-object v0, p3

    check-cast v0, Landroid/graphics/drawable/Drawable;

    :cond_4
    :goto_3
    if-eqz v0, :cond_5

    .line 921
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p3

    if-lez p3, :cond_5

    .line 922
    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_7

    .line 924
    :cond_5
    iget-object p3, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$GalleryAdapter;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-virtual {p3, p2, p1}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->setImageDrawable(Landroid/widget/ImageView;I)V
    :try_end_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_7

    :catch_0
    move-exception p1

    move-object v0, p2

    goto :goto_4

    :catch_1
    move-exception p1

    move-object v0, p2

    goto :goto_5

    :catch_2
    move-exception p1

    .line 929
    :goto_4
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    goto :goto_6

    :catch_3
    move-exception p1

    .line 926
    :goto_5
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$GalleryAdapter;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-static {p2}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->-$$Nest$mclearImageCache(Lcom/flyersoft/moonreaderp/PicGalleryShow;)V

    .line 927
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :goto_6
    move-object p2, v0

    :goto_7
    if-nez p2, :cond_6

    .line 932
    new-instance p2, Landroid/widget/ImageView;

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$GalleryAdapter;->mContext:Landroid/content/Context;

    invoke-direct {p2, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    :cond_6
    return-object p2
.end method
