.class Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$6;
.super Landroid/os/Handler;
.source "PrefChapters.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;Landroid/os/Looper;)V
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

    .line 2418
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$6;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 7

    .line 2420
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$6;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->dismissed:Z

    if-eqz v0, :cond_0

    goto/16 :goto_1

    .line 2423
    :cond_0
    :try_start_0
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$ImageDrawable;

    .line 2424
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$6;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->imagesLoading:[Z

    iget v1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$ImageDrawable;->position:I

    const/4 v2, 0x0

    aput-boolean v2, v0, v1

    .line 2426
    iget-object v0, p1, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$ImageDrawable;->bm:Landroid/graphics/Bitmap;

    const/4 v1, -0x1

    if-eqz v0, :cond_2

    .line 2427
    iget-object v0, p1, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$ImageDrawable;->bm:Landroid/graphics/Bitmap;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getBitmapAboutColor(Landroid/graphics/Bitmap;)I

    move-result v0

    .line 2428
    new-instance v3, Landroid/graphics/drawable/BitmapDrawable;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$6;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {v4}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    iget-object v5, p1, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$ImageDrawable;->bm:Landroid/graphics/Bitmap;

    invoke-direct {v3, v4, v5}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    if-eq v0, v1, :cond_1

    .line 2430
    new-instance v4, Ljava/lang/ref/SoftReference;

    invoke-direct {v4, v3}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    .line 2431
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$6;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/PrefChapters;->imageList:Ljava/util/ArrayList;

    iget v6, p1, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$ImageDrawable;->position:I

    invoke-virtual {v5, v6, v4}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 2433
    :cond_1
    iget-object v4, p1, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$ImageDrawable;->iv:Landroid/widget/ImageView;

    invoke-virtual {v4}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iget v5, p1, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$ImageDrawable;->position:I

    if-ne v4, v5, :cond_3

    .line 2434
    iget-object v4, p1, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$ImageDrawable;->iv:Landroid/widget/ImageView;

    invoke-virtual {v4, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    :cond_2
    const/4 v0, -0x1

    :cond_3
    :goto_0
    if-ne v0, v1, :cond_4

    .line 2437
    iget v0, p1, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$ImageDrawable;->position:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v1, 0x2

    new-array v3, v1, [Ljava/lang/Object;

    const-string v4, "white image"

    aput-object v4, v3, v2

    const/4 v2, 0x1

    aput-object v0, v3, v2

    invoke-static {v3}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 2439
    iget v0, p1, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$ImageDrawable;->verified:I

    if-ge v0, v1, :cond_4

    .line 2440
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$6;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    iget-object v1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$ImageDrawable;->iv:Landroid/widget/ImageView;

    iget v3, p1, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$ImageDrawable;->position:I

    iget p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$ImageDrawable;->verified:I

    add-int/2addr p1, v2

    invoke-static {v0, v1, v3, p1}, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->-$$Nest$mloadPdfAnnotShot(Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;Landroid/widget/ImageView;II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    .line 2443
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_4
    :goto_1
    return-void
.end method
