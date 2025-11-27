.class Lcom/flyersoft/tools/blurry/Blurry$Composer$1;
.super Ljava/lang/Object;
.source "Blurry.java"

# interfaces
.implements Lcom/flyersoft/tools/blurry/BlurTask$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/tools/blurry/Blurry$Composer;->onto(Landroid/view/ViewGroup;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/tools/blurry/Blurry$Composer;

.field final synthetic val$target:Landroid/view/ViewGroup;


# direct methods
.method constructor <init>(Lcom/flyersoft/tools/blurry/Blurry$Composer;Landroid/view/ViewGroup;)V
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

    .line 102
    iput-object p1, p0, Lcom/flyersoft/tools/blurry/Blurry$Composer$1;->this$0:Lcom/flyersoft/tools/blurry/Blurry$Composer;

    iput-object p2, p0, Lcom/flyersoft/tools/blurry/Blurry$Composer$1;->val$target:Landroid/view/ViewGroup;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public done(Landroid/graphics/Bitmap;)V
    .locals 4

    .line 105
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    iget-object v1, p0, Lcom/flyersoft/tools/blurry/Blurry$Composer$1;->val$target:Landroid/view/ViewGroup;

    .line 106
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget-object v2, p0, Lcom/flyersoft/tools/blurry/Blurry$Composer$1;->this$0:Lcom/flyersoft/tools/blurry/Blurry$Composer;

    invoke-static {v2}, Lcom/flyersoft/tools/blurry/Blurry$Composer;->-$$Nest$fgetcontext(Lcom/flyersoft/tools/blurry/Blurry$Composer;)Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/flyersoft/tools/blurry/Blurry$Composer$1;->this$0:Lcom/flyersoft/tools/blurry/Blurry$Composer;

    invoke-static {v3}, Lcom/flyersoft/tools/blurry/Blurry$Composer;->-$$Nest$fgetfactor(Lcom/flyersoft/tools/blurry/Blurry$Composer;)Lcom/flyersoft/tools/blurry/BlurFactor;

    move-result-object v3

    invoke-static {v2, p1, v3}, Lcom/flyersoft/tools/blurry/Blur;->of(Landroid/content/Context;Landroid/graphics/Bitmap;Lcom/flyersoft/tools/blurry/BlurFactor;)Landroid/graphics/Bitmap;

    move-result-object p1

    invoke-direct {v0, v1, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 107
    iget-object p1, p0, Lcom/flyersoft/tools/blurry/Blurry$Composer$1;->this$0:Lcom/flyersoft/tools/blurry/Blurry$Composer;

    iget-object v1, p0, Lcom/flyersoft/tools/blurry/Blurry$Composer$1;->val$target:Landroid/view/ViewGroup;

    invoke-static {p1, v1, v0}, Lcom/flyersoft/tools/blurry/Blurry$Composer;->-$$Nest$maddView(Lcom/flyersoft/tools/blurry/Blurry$Composer;Landroid/view/ViewGroup;Landroid/graphics/drawable/Drawable;)V

    return-void
.end method
