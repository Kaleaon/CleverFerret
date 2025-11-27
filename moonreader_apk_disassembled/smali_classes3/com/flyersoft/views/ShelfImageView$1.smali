.class Lcom/flyersoft/views/ShelfImageView$1;
.super Landroid/os/Handler;
.source "ShelfImageView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/views/ShelfImageView;->downloadUrlImage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/views/ShelfImageView;

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/views/ShelfImageView;Landroid/os/Looper;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0,
            0x1010
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .line 228
    iput-object p1, p0, Lcom/flyersoft/views/ShelfImageView$1;->this$0:Lcom/flyersoft/views/ShelfImageView;

    iput-object p3, p0, Lcom/flyersoft/views/ShelfImageView$1;->val$url:Ljava/lang/String;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    .line 231
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Landroid/graphics/drawable/Drawable;

    if-eqz p1, :cond_1

    .line 232
    iget-object v0, p0, Lcom/flyersoft/views/ShelfImageView$1;->this$0:Lcom/flyersoft/views/ShelfImageView;

    if-nez v0, :cond_0

    goto :goto_0

    .line 234
    :cond_0
    invoke-virtual {v0, p1}, Lcom/flyersoft/views/ShelfImageView;->fitDrawableSize(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    .line 235
    sget-object v0, Lcom/flyersoft/views/ShelfImageView;->imageCache:Ljava/util/HashMap;

    iget-object v1, p0, Lcom/flyersoft/views/ShelfImageView$1;->val$url:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 236
    iget-object v0, p0, Lcom/flyersoft/views/ShelfImageView$1;->this$0:Lcom/flyersoft/views/ShelfImageView;

    invoke-static {v0, p1}, Lcom/flyersoft/views/ShelfImageView;->-$$Nest$fputurlDrawable(Lcom/flyersoft/views/ShelfImageView;Landroid/graphics/drawable/Drawable;)V

    .line 237
    iget-object p1, p0, Lcom/flyersoft/views/ShelfImageView$1;->this$0:Lcom/flyersoft/views/ShelfImageView;

    invoke-virtual {p1}, Lcom/flyersoft/views/ShelfImageView;->postInvalidate()V

    :cond_1
    :goto_0
    return-void
.end method
