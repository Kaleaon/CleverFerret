.class Lcom/flyersoft/tools/blurry/BlurTask$1$1;
.super Ljava/lang/Object;
.source "BlurTask.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/tools/blurry/BlurTask$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/tools/blurry/BlurTask$1;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/flyersoft/tools/blurry/BlurTask$1;Landroid/content/Context;)V
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

    .line 66
    iput-object p1, p0, Lcom/flyersoft/tools/blurry/BlurTask$1$1;->this$1:Lcom/flyersoft/tools/blurry/BlurTask$1;

    iput-object p2, p0, Lcom/flyersoft/tools/blurry/BlurTask$1$1;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 69
    iget-object v0, p0, Lcom/flyersoft/tools/blurry/BlurTask$1$1;->this$1:Lcom/flyersoft/tools/blurry/BlurTask$1;

    iget-object v0, v0, Lcom/flyersoft/tools/blurry/BlurTask$1;->this$0:Lcom/flyersoft/tools/blurry/BlurTask;

    invoke-static {v0}, Lcom/flyersoft/tools/blurry/BlurTask;->-$$Nest$fgetcallback(Lcom/flyersoft/tools/blurry/BlurTask;)Lcom/flyersoft/tools/blurry/BlurTask$Callback;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/tools/blurry/BlurTask$1$1;->val$context:Landroid/content/Context;

    iget-object v2, p0, Lcom/flyersoft/tools/blurry/BlurTask$1$1;->this$1:Lcom/flyersoft/tools/blurry/BlurTask$1;

    iget-object v2, v2, Lcom/flyersoft/tools/blurry/BlurTask$1;->this$0:Lcom/flyersoft/tools/blurry/BlurTask;

    invoke-static {v2}, Lcom/flyersoft/tools/blurry/BlurTask;->-$$Nest$fgetbitmap(Lcom/flyersoft/tools/blurry/BlurTask;)Landroid/graphics/Bitmap;

    move-result-object v2

    iget-object v3, p0, Lcom/flyersoft/tools/blurry/BlurTask$1$1;->this$1:Lcom/flyersoft/tools/blurry/BlurTask$1;

    iget-object v3, v3, Lcom/flyersoft/tools/blurry/BlurTask$1;->this$0:Lcom/flyersoft/tools/blurry/BlurTask;

    invoke-static {v3}, Lcom/flyersoft/tools/blurry/BlurTask;->-$$Nest$fgetfactor(Lcom/flyersoft/tools/blurry/BlurTask;)Lcom/flyersoft/tools/blurry/BlurFactor;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/flyersoft/tools/blurry/Blur;->of(Landroid/content/Context;Landroid/graphics/Bitmap;Lcom/flyersoft/tools/blurry/BlurFactor;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/flyersoft/tools/blurry/BlurTask$Callback;->done(Landroid/graphics/Bitmap;)V

    return-void
.end method
