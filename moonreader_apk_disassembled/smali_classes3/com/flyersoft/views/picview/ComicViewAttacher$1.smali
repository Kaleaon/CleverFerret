.class Lcom/flyersoft/views/picview/ComicViewAttacher$1;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "ComicViewAttacher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/views/picview/ComicViewAttacher;-><init>(Landroid/widget/ImageView;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/views/picview/ComicViewAttacher;


# direct methods
.method constructor <init>(Lcom/flyersoft/views/picview/ComicViewAttacher;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 179
    iput-object p1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$1;->this$0:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 3

    .line 192
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$1;->this$0:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-static {v0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->-$$Nest$fgetmSingleFlingListener(Lcom/flyersoft/views/picview/ComicViewAttacher;)Lcom/flyersoft/views/picview/ComicViewAttacher$OnSingleFlingListener;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 193
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$1;->this$0:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getScale()F

    move-result v0

    const/high16 v2, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v2

    if-lez v0, :cond_0

    return v1

    .line 197
    :cond_0
    invoke-static {p1}, Landroidx/core/view/MotionEventCompat;->getPointerCount(Landroid/view/MotionEvent;)I

    move-result v0

    sget v2, Lcom/flyersoft/views/picview/ComicViewAttacher;->SINGLE_TOUCH:I

    if-gt v0, v2, :cond_2

    .line 198
    invoke-static {p2}, Landroidx/core/view/MotionEventCompat;->getPointerCount(Landroid/view/MotionEvent;)I

    move-result v0

    sget v2, Lcom/flyersoft/views/picview/ComicViewAttacher;->SINGLE_TOUCH:I

    if-le v0, v2, :cond_1

    goto :goto_0

    .line 202
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$1;->this$0:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-static {v0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->-$$Nest$fgetmSingleFlingListener(Lcom/flyersoft/views/picview/ComicViewAttacher;)Lcom/flyersoft/views/picview/ComicViewAttacher$OnSingleFlingListener;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/flyersoft/views/picview/ComicViewAttacher$OnSingleFlingListener;->onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    move-result p1

    return p1

    :cond_2
    :goto_0
    return v1
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 1

    .line 184
    iget-object p1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$1;->this$0:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-static {p1}, Lcom/flyersoft/views/picview/ComicViewAttacher;->-$$Nest$fgetmLongClickListener(Lcom/flyersoft/views/picview/ComicViewAttacher;)Landroid/view/View$OnLongClickListener;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 185
    iget-object p1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$1;->this$0:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-static {p1}, Lcom/flyersoft/views/picview/ComicViewAttacher;->-$$Nest$fgetmLongClickListener(Lcom/flyersoft/views/picview/ComicViewAttacher;)Landroid/view/View$OnLongClickListener;

    move-result-object p1

    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$1;->this$0:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    invoke-interface {p1, v0}, Landroid/view/View$OnLongClickListener;->onLongClick(Landroid/view/View;)Z

    :cond_0
    return-void
.end method
