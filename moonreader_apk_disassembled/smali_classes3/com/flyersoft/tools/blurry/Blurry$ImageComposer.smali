.class public Lcom/flyersoft/tools/blurry/Blurry$ImageComposer;
.super Ljava/lang/Object;
.source "Blurry.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/tools/blurry/Blurry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ImageComposer"
.end annotation


# instance fields
.field private final async:Z

.field private final capture:Landroid/view/View;

.field private final context:Landroid/content/Context;

.field private final factor:Lcom/flyersoft/tools/blurry/BlurFactor;


# direct methods
.method static bridge synthetic -$$Nest$fgetcontext(Lcom/flyersoft/tools/blurry/Blurry$ImageComposer;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/tools/blurry/Blurry$ImageComposer;->context:Landroid/content/Context;

    return-object p0
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/View;Lcom/flyersoft/tools/blurry/BlurFactor;Z)V
    .locals 0

    .line 169
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 170
    iput-object p1, p0, Lcom/flyersoft/tools/blurry/Blurry$ImageComposer;->context:Landroid/content/Context;

    .line 171
    iput-object p2, p0, Lcom/flyersoft/tools/blurry/Blurry$ImageComposer;->capture:Landroid/view/View;

    .line 172
    iput-object p3, p0, Lcom/flyersoft/tools/blurry/Blurry$ImageComposer;->factor:Lcom/flyersoft/tools/blurry/BlurFactor;

    .line 173
    iput-boolean p4, p0, Lcom/flyersoft/tools/blurry/Blurry$ImageComposer;->async:Z

    return-void
.end method


# virtual methods
.method public get()Landroid/graphics/Bitmap;
    .locals 2

    .line 196
    iget-boolean v0, p0, Lcom/flyersoft/tools/blurry/Blurry$ImageComposer;->async:Z

    if-nez v0, :cond_0

    .line 197
    iget-object v0, p0, Lcom/flyersoft/tools/blurry/Blurry$ImageComposer;->factor:Lcom/flyersoft/tools/blurry/BlurFactor;

    iget-object v1, p0, Lcom/flyersoft/tools/blurry/Blurry$ImageComposer;->capture:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v1

    iput v1, v0, Lcom/flyersoft/tools/blurry/BlurFactor;->width:I

    .line 198
    iget-object v0, p0, Lcom/flyersoft/tools/blurry/Blurry$ImageComposer;->factor:Lcom/flyersoft/tools/blurry/BlurFactor;

    iget-object v1, p0, Lcom/flyersoft/tools/blurry/Blurry$ImageComposer;->capture:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    iput v1, v0, Lcom/flyersoft/tools/blurry/BlurFactor;->height:I

    .line 199
    iget-object v0, p0, Lcom/flyersoft/tools/blurry/Blurry$ImageComposer;->capture:Landroid/view/View;

    iget-object v1, p0, Lcom/flyersoft/tools/blurry/Blurry$ImageComposer;->factor:Lcom/flyersoft/tools/blurry/BlurFactor;

    invoke-static {v0, v1}, Lcom/flyersoft/tools/blurry/Blur;->of(Landroid/view/View;Lcom/flyersoft/tools/blurry/BlurFactor;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0

    .line 196
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Use getAsync() instead of async()."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getAsync(Lcom/flyersoft/tools/blurry/BlurTask$Callback;)V
    .locals 3

    .line 203
    iget-object v0, p0, Lcom/flyersoft/tools/blurry/Blurry$ImageComposer;->factor:Lcom/flyersoft/tools/blurry/BlurFactor;

    iget-object v1, p0, Lcom/flyersoft/tools/blurry/Blurry$ImageComposer;->capture:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v1

    iput v1, v0, Lcom/flyersoft/tools/blurry/BlurFactor;->width:I

    .line 204
    iget-object v0, p0, Lcom/flyersoft/tools/blurry/Blurry$ImageComposer;->factor:Lcom/flyersoft/tools/blurry/BlurFactor;

    iget-object v1, p0, Lcom/flyersoft/tools/blurry/Blurry$ImageComposer;->capture:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    iput v1, v0, Lcom/flyersoft/tools/blurry/BlurFactor;->height:I

    .line 205
    new-instance v0, Lcom/flyersoft/tools/blurry/BlurTask;

    iget-object v1, p0, Lcom/flyersoft/tools/blurry/Blurry$ImageComposer;->capture:Landroid/view/View;

    iget-object v2, p0, Lcom/flyersoft/tools/blurry/Blurry$ImageComposer;->factor:Lcom/flyersoft/tools/blurry/BlurFactor;

    invoke-direct {v0, v1, v2, p1}, Lcom/flyersoft/tools/blurry/BlurTask;-><init>(Landroid/view/View;Lcom/flyersoft/tools/blurry/BlurFactor;Lcom/flyersoft/tools/blurry/BlurTask$Callback;)V

    invoke-virtual {v0}, Lcom/flyersoft/tools/blurry/BlurTask;->execute()V

    return-void
.end method

.method public into(Landroid/widget/ImageView;)V
    .locals 4

    .line 177
    iget-object v0, p0, Lcom/flyersoft/tools/blurry/Blurry$ImageComposer;->factor:Lcom/flyersoft/tools/blurry/BlurFactor;

    iget-object v1, p0, Lcom/flyersoft/tools/blurry/Blurry$ImageComposer;->capture:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v1

    iput v1, v0, Lcom/flyersoft/tools/blurry/BlurFactor;->width:I

    .line 178
    iget-object v0, p0, Lcom/flyersoft/tools/blurry/Blurry$ImageComposer;->factor:Lcom/flyersoft/tools/blurry/BlurFactor;

    iget-object v1, p0, Lcom/flyersoft/tools/blurry/Blurry$ImageComposer;->capture:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    iput v1, v0, Lcom/flyersoft/tools/blurry/BlurFactor;->height:I

    .line 180
    iget-boolean v0, p0, Lcom/flyersoft/tools/blurry/Blurry$ImageComposer;->async:Z

    if-eqz v0, :cond_0

    .line 181
    new-instance v0, Lcom/flyersoft/tools/blurry/BlurTask;

    iget-object v1, p0, Lcom/flyersoft/tools/blurry/Blurry$ImageComposer;->capture:Landroid/view/View;

    iget-object v2, p0, Lcom/flyersoft/tools/blurry/Blurry$ImageComposer;->factor:Lcom/flyersoft/tools/blurry/BlurFactor;

    new-instance v3, Lcom/flyersoft/tools/blurry/Blurry$ImageComposer$1;

    invoke-direct {v3, p0, p1}, Lcom/flyersoft/tools/blurry/Blurry$ImageComposer$1;-><init>(Lcom/flyersoft/tools/blurry/Blurry$ImageComposer;Landroid/widget/ImageView;)V

    invoke-direct {v0, v1, v2, v3}, Lcom/flyersoft/tools/blurry/BlurTask;-><init>(Landroid/view/View;Lcom/flyersoft/tools/blurry/BlurFactor;Lcom/flyersoft/tools/blurry/BlurTask$Callback;)V

    .line 188
    invoke-virtual {v0}, Lcom/flyersoft/tools/blurry/BlurTask;->execute()V

    return-void

    .line 190
    :cond_0
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    iget-object v1, p0, Lcom/flyersoft/tools/blurry/Blurry$ImageComposer;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget-object v2, p0, Lcom/flyersoft/tools/blurry/Blurry$ImageComposer;->capture:Landroid/view/View;

    iget-object v3, p0, Lcom/flyersoft/tools/blurry/Blurry$ImageComposer;->factor:Lcom/flyersoft/tools/blurry/BlurFactor;

    invoke-static {v2, v3}, Lcom/flyersoft/tools/blurry/Blur;->of(Landroid/view/View;Lcom/flyersoft/tools/blurry/BlurFactor;)Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 191
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method
