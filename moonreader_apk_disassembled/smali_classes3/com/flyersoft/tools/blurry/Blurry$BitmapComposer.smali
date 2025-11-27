.class public Lcom/flyersoft/tools/blurry/Blurry$BitmapComposer;
.super Ljava/lang/Object;
.source "Blurry.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/tools/blurry/Blurry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BitmapComposer"
.end annotation


# instance fields
.field private final async:Z

.field private final bitmap:Landroid/graphics/Bitmap;

.field private final context:Landroid/content/Context;

.field private final factor:Lcom/flyersoft/tools/blurry/BlurFactor;


# direct methods
.method static bridge synthetic -$$Nest$fgetcontext(Lcom/flyersoft/tools/blurry/Blurry$BitmapComposer;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/tools/blurry/Blurry$BitmapComposer;->context:Landroid/content/Context;

    return-object p0
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/graphics/Bitmap;Lcom/flyersoft/tools/blurry/BlurFactor;Z)V
    .locals 0

    .line 134
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 135
    iput-object p1, p0, Lcom/flyersoft/tools/blurry/Blurry$BitmapComposer;->context:Landroid/content/Context;

    .line 136
    iput-object p2, p0, Lcom/flyersoft/tools/blurry/Blurry$BitmapComposer;->bitmap:Landroid/graphics/Bitmap;

    .line 137
    iput-object p3, p0, Lcom/flyersoft/tools/blurry/Blurry$BitmapComposer;->factor:Lcom/flyersoft/tools/blurry/BlurFactor;

    .line 138
    iput-boolean p4, p0, Lcom/flyersoft/tools/blurry/Blurry$BitmapComposer;->async:Z

    return-void
.end method


# virtual methods
.method public into(Landroid/widget/ImageView;)V
    .locals 5

    .line 142
    iget-object v0, p0, Lcom/flyersoft/tools/blurry/Blurry$BitmapComposer;->factor:Lcom/flyersoft/tools/blurry/BlurFactor;

    iget-object v1, p0, Lcom/flyersoft/tools/blurry/Blurry$BitmapComposer;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    iput v1, v0, Lcom/flyersoft/tools/blurry/BlurFactor;->width:I

    .line 143
    iget-object v0, p0, Lcom/flyersoft/tools/blurry/Blurry$BitmapComposer;->factor:Lcom/flyersoft/tools/blurry/BlurFactor;

    iget-object v1, p0, Lcom/flyersoft/tools/blurry/Blurry$BitmapComposer;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    iput v1, v0, Lcom/flyersoft/tools/blurry/BlurFactor;->height:I

    .line 145
    iget-boolean v0, p0, Lcom/flyersoft/tools/blurry/Blurry$BitmapComposer;->async:Z

    if-eqz v0, :cond_0

    .line 146
    new-instance v0, Lcom/flyersoft/tools/blurry/BlurTask;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/flyersoft/tools/blurry/Blurry$BitmapComposer;->bitmap:Landroid/graphics/Bitmap;

    iget-object v3, p0, Lcom/flyersoft/tools/blurry/Blurry$BitmapComposer;->factor:Lcom/flyersoft/tools/blurry/BlurFactor;

    new-instance v4, Lcom/flyersoft/tools/blurry/Blurry$BitmapComposer$1;

    invoke-direct {v4, p0, p1}, Lcom/flyersoft/tools/blurry/Blurry$BitmapComposer$1;-><init>(Lcom/flyersoft/tools/blurry/Blurry$BitmapComposer;Landroid/widget/ImageView;)V

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/flyersoft/tools/blurry/BlurTask;-><init>(Landroid/content/Context;Landroid/graphics/Bitmap;Lcom/flyersoft/tools/blurry/BlurFactor;Lcom/flyersoft/tools/blurry/BlurTask$Callback;)V

    .line 153
    invoke-virtual {v0}, Lcom/flyersoft/tools/blurry/BlurTask;->execute()V

    return-void

    .line 155
    :cond_0
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    iget-object v1, p0, Lcom/flyersoft/tools/blurry/Blurry$BitmapComposer;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 156
    invoke-virtual {p1}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/flyersoft/tools/blurry/Blurry$BitmapComposer;->bitmap:Landroid/graphics/Bitmap;

    iget-object v4, p0, Lcom/flyersoft/tools/blurry/Blurry$BitmapComposer;->factor:Lcom/flyersoft/tools/blurry/BlurFactor;

    invoke-static {v2, v3, v4}, Lcom/flyersoft/tools/blurry/Blur;->of(Landroid/content/Context;Landroid/graphics/Bitmap;Lcom/flyersoft/tools/blurry/BlurFactor;)Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 157
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method
