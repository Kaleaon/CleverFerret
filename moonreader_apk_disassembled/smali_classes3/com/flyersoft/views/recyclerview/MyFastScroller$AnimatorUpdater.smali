.class Lcom/flyersoft/views/recyclerview/MyFastScroller$AnimatorUpdater;
.super Ljava/lang/Object;
.source "MyFastScroller.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/views/recyclerview/MyFastScroller;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AnimatorUpdater"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/views/recyclerview/MyFastScroller;


# direct methods
.method constructor <init>(Lcom/flyersoft/views/recyclerview/MyFastScroller;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            null
        }
    .end annotation

    .line 656
    iput-object p1, p0, Lcom/flyersoft/views/recyclerview/MyFastScroller$AnimatorUpdater;->this$0:Lcom/flyersoft/views/recyclerview/MyFastScroller;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 661
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    const/high16 v0, 0x437f0000    # 255.0f

    mul-float p1, p1, v0

    float-to-int p1, p1

    .line 662
    iget-object v0, p0, Lcom/flyersoft/views/recyclerview/MyFastScroller$AnimatorUpdater;->this$0:Lcom/flyersoft/views/recyclerview/MyFastScroller;

    iget-object v0, v0, Lcom/flyersoft/views/recyclerview/MyFastScroller;->mVerticalThumbDrawable:Landroid/graphics/drawable/StateListDrawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/StateListDrawable;->setAlpha(I)V

    .line 663
    iget-object v0, p0, Lcom/flyersoft/views/recyclerview/MyFastScroller$AnimatorUpdater;->this$0:Lcom/flyersoft/views/recyclerview/MyFastScroller;

    iget-object v0, v0, Lcom/flyersoft/views/recyclerview/MyFastScroller;->mVerticalTrackDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 664
    iget-object p1, p0, Lcom/flyersoft/views/recyclerview/MyFastScroller$AnimatorUpdater;->this$0:Lcom/flyersoft/views/recyclerview/MyFastScroller;

    invoke-virtual {p1}, Lcom/flyersoft/views/recyclerview/MyFastScroller;->requestRedraw()V

    return-void
.end method
