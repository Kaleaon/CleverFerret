.class Lcom/flyersoft/tools/blurry/Blurry$ImageComposer$1;
.super Ljava/lang/Object;
.source "Blurry.java"

# interfaces
.implements Lcom/flyersoft/tools/blurry/BlurTask$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/tools/blurry/Blurry$ImageComposer;->into(Landroid/widget/ImageView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/tools/blurry/Blurry$ImageComposer;

.field final synthetic val$target:Landroid/widget/ImageView;


# direct methods
.method constructor <init>(Lcom/flyersoft/tools/blurry/Blurry$ImageComposer;Landroid/widget/ImageView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 181
    iput-object p1, p0, Lcom/flyersoft/tools/blurry/Blurry$ImageComposer$1;->this$0:Lcom/flyersoft/tools/blurry/Blurry$ImageComposer;

    iput-object p2, p0, Lcom/flyersoft/tools/blurry/Blurry$ImageComposer$1;->val$target:Landroid/widget/ImageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public done(Landroid/graphics/Bitmap;)V
    .locals 2

    .line 184
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    iget-object v1, p0, Lcom/flyersoft/tools/blurry/Blurry$ImageComposer$1;->this$0:Lcom/flyersoft/tools/blurry/Blurry$ImageComposer;

    invoke-static {v1}, Lcom/flyersoft/tools/blurry/Blurry$ImageComposer;->-$$Nest$fgetcontext(Lcom/flyersoft/tools/blurry/Blurry$ImageComposer;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 185
    iget-object p1, p0, Lcom/flyersoft/tools/blurry/Blurry$ImageComposer$1;->val$target:Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method
