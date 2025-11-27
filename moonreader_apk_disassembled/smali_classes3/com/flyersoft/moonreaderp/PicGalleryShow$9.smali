.class Lcom/flyersoft/moonreaderp/PicGalleryShow$9;
.super Ljava/lang/Thread;
.source "PicGalleryShow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PicGalleryShow;->setImageDrawable(Landroid/widget/ImageView;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

.field final synthetic val$iv:Landroid/widget/ImageView;

.field final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PicGalleryShow;ILandroid/widget/ImageView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .line 948
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$9;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iput p2, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$9;->val$position:I

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$9;->val$iv:Landroid/widget/ImageView;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .line 952
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$9;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageFiles:Ljava/util/ArrayList;

    iget v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$9;->val$position:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Ljava/lang/String;

    .line 954
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$9;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->ebook:Lcom/flyersoft/books/BaseEBook;

    const/4 v7, 0x1

    if-eqz v0, :cond_0

    .line 955
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$9;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v0, v6, v7}, Lcom/flyersoft/books/BaseEBook;->getDrawableFromSource(Ljava/lang/String;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    :goto_0
    move-object v5, v0

    goto :goto_2

    .line 956
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$9;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->-$$Nest$fgetzipper(Lcom/flyersoft/moonreaderp/PicGalleryShow;)Lcom/flyersoft/tools/compress/BaseCompressor;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 957
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v7, v1}, Lcom/flyersoft/tools/A;->getFileDrawable(Ljava/io/File;II)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_0

    .line 959
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$9;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->-$$Nest$fgetzipper(Lcom/flyersoft/moonreaderp/PicGalleryShow;)Lcom/flyersoft/tools/compress/BaseCompressor;

    move-result-object v0

    invoke-virtual {v0, v6, v7, v1}, Lcom/flyersoft/tools/compress/BaseCompressor;->getCacheFile(Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v0

    .line 960
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$9;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-static {v1}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->-$$Nest$fgetunzippingFile(Lcom/flyersoft/moonreaderp/PicGalleryShow;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 961
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v1, v7, v7}, Lcom/flyersoft/tools/A;->getFileDrawable(Ljava/io/File;II)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    goto :goto_1

    :cond_2
    move-object v1, v2

    .line 962
    :goto_1
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$9;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-static {v3}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->-$$Nest$fgetunzippingFile(Lcom/flyersoft/moonreaderp/PicGalleryShow;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$9;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-static {v3, v1, v0, v6}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->-$$Nest$mcacheFileOk(Lcom/flyersoft/moonreaderp/PicGalleryShow;Landroid/graphics/drawable/Drawable;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 963
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$9;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$9;->val$iv:Landroid/widget/ImageView;

    iget v4, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$9;->val$position:I

    invoke-static {v0, v3, v2, v4}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->-$$Nest$mdoUnzipToCache(Lcom/flyersoft/moonreaderp/PicGalleryShow;Landroid/widget/ImageView;Lcom/flyersoft/views/picview/ComicView;I)V

    :cond_3
    move-object v5, v1

    :goto_2
    if-eqz v5, :cond_4

    .line 965
    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    if-lez v0, :cond_4

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$9;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->-$$Nest$misGalleryEmpty(Lcom/flyersoft/moonreaderp/PicGalleryShow;)Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$9;->val$iv:Landroid/widget/ImageView;

    if-eqz v0, :cond_4

    .line 966
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$9;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageCache:Ljava/util/HashMap;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "s"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 967
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$9;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$9;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget-object v8, v1, Lcom/flyersoft/moonreaderp/PicGalleryShow;->imageHandler:Landroid/os/Handler;

    new-instance v1, Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$9;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$9;->val$iv:Landroid/widget/ImageView;

    const/4 v4, 0x0

    invoke-direct/range {v1 .. v6}, Lcom/flyersoft/moonreaderp/PicGalleryShow$ImageViewCombine;-><init>(Lcom/flyersoft/moonreaderp/PicGalleryShow;Landroid/widget/ImageView;Lcom/flyersoft/views/picview/ComicView;Landroid/graphics/drawable/Drawable;Ljava/lang/String;)V

    invoke-virtual {v8, v7, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :catch_0
    move-exception v0

    .line 973
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    goto :goto_3

    :catch_1
    move-exception v0

    .line 970
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$9;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-static {v1}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->-$$Nest$mclearImageCache(Lcom/flyersoft/moonreaderp/PicGalleryShow;)V

    .line 971
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_4
    :goto_3
    const/16 v0, 0x14

    .line 975
    invoke-static {v0}, Lcom/flyersoft/tools/A;->isLowMemory(I)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 976
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$9;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->-$$Nest$mclearImageCache(Lcom/flyersoft/moonreaderp/PicGalleryShow;)V

    :cond_5
    return-void
.end method
