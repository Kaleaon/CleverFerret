.class Lcom/flyersoft/views/HighlightLay$1;
.super Ljava/lang/Object;
.source "HighlightLay.java"

# interfaces
.implements Lcom/radaee/reader/GLView$OnPixelCopy;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/views/HighlightLay;->drawMagnifier(Landroid/view/MotionEvent;Landroid/graphics/Bitmap;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/views/HighlightLay;

.field final synthetic val$event:Landroid/view/MotionEvent;


# direct methods
.method constructor <init>(Lcom/flyersoft/views/HighlightLay;Landroid/view/MotionEvent;)V
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

    .line 45
    iput-object p1, p0, Lcom/flyersoft/views/HighlightLay$1;->this$0:Lcom/flyersoft/views/HighlightLay;

    iput-object p2, p0, Lcom/flyersoft/views/HighlightLay$1;->val$event:Landroid/view/MotionEvent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSuccessCallback(Landroid/graphics/Bitmap;)V
    .locals 2

    .line 48
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 49
    iget-object v0, p0, Lcom/flyersoft/views/HighlightLay$1;->this$0:Lcom/flyersoft/views/HighlightLay;

    iget-boolean v0, v0, Lcom/flyersoft/views/HighlightLay;->magnifierShowing:Z

    if-eqz v0, :cond_0

    .line 50
    iget-object v0, p0, Lcom/flyersoft/views/HighlightLay$1;->this$0:Lcom/flyersoft/views/HighlightLay;

    iget-object v1, p0, Lcom/flyersoft/views/HighlightLay$1;->val$event:Landroid/view/MotionEvent;

    invoke-virtual {v0, v1, p1}, Lcom/flyersoft/views/HighlightLay;->drawMagnifier(Landroid/view/MotionEvent;Landroid/graphics/Bitmap;)V

    return-void

    .line 52
    :cond_0
    invoke-static {p1}, Lcom/flyersoft/tools/T;->recycle(Landroid/graphics/Bitmap;)Z

    :cond_1
    return-void
.end method
