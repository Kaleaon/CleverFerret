.class Lcom/flyersoft/moonreaderp/PrefShareText$3;
.super Ljava/lang/Object;
.source "PrefShareText.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefShareText;->createBitmaps()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefShareText;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefShareText;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 258
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShareText$3;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 261
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText$3;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefShareText;->template1:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->lay:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 262
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText$3;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v2

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v3

    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v3, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    iput-object v2, v1, Lcom/flyersoft/moonreaderp/PrefShareText;->bm1:Landroid/graphics/Bitmap;

    .line 263
    new-instance v1, Landroid/graphics/Canvas;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefShareText$3;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefShareText;->bm1:Landroid/graphics/Bitmap;

    invoke-direct {v1, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 264
    invoke-static {v1}, Lcom/flyersoft/tools/A;->setBackgroundImage(Landroid/graphics/Canvas;)V

    .line 265
    invoke-virtual {v0, v1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 267
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText$3;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefShareText;->template2:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->lay:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 268
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText$3;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v2

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v3

    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v3, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    iput-object v2, v1, Lcom/flyersoft/moonreaderp/PrefShareText;->bm2:Landroid/graphics/Bitmap;

    .line 269
    new-instance v1, Landroid/graphics/Canvas;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefShareText$3;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefShareText;->bm2:Landroid/graphics/Bitmap;

    invoke-direct {v1, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 270
    invoke-static {v1}, Lcom/flyersoft/tools/A;->setBackgroundImage(Landroid/graphics/Canvas;)V

    .line 271
    invoke-virtual {v0, v1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 273
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText$3;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefShareText;->template3:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->lay:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 274
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText$3;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v2

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v3

    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v3, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    iput-object v2, v1, Lcom/flyersoft/moonreaderp/PrefShareText;->bm3:Landroid/graphics/Bitmap;

    .line 275
    new-instance v1, Landroid/graphics/Canvas;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefShareText$3;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefShareText;->bm3:Landroid/graphics/Bitmap;

    invoke-direct {v1, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 276
    invoke-static {v1}, Lcom/flyersoft/tools/A;->setBackgroundImage(Landroid/graphics/Canvas;)V

    .line 277
    invoke-virtual {v0, v1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 279
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText$3;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefShareText;->template4:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->lay:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 280
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShareText$3;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v2

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v3

    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v3, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    iput-object v2, v1, Lcom/flyersoft/moonreaderp/PrefShareText;->bm4:Landroid/graphics/Bitmap;

    .line 281
    new-instance v1, Landroid/graphics/Canvas;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefShareText$3;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefShareText;->bm4:Landroid/graphics/Bitmap;

    invoke-direct {v1, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 282
    invoke-static {v1}, Lcom/flyersoft/tools/A;->setBackgroundImage(Landroid/graphics/Canvas;)V

    .line 283
    invoke-virtual {v0, v1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 285
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText$3;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefShareText;->slideRv:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object v0

    if-nez v0, :cond_0

    .line 286
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText$3;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PrefShareText;->-$$Nest$mcreateSlideAdapter(Lcom/flyersoft/moonreaderp/PrefShareText;)V

    goto :goto_0

    .line 288
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText$3;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefShareText;->slideRv:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 289
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShareText$3;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/PrefShareText;->eraseGPUShadow(Z)V

    return-void
.end method
