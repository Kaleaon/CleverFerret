.class Lcom/flyersoft/views/recyclerview/MyFastScroller$AnimatorListener;
.super Landroid/animation/AnimatorListenerAdapter;
.source "MyFastScroller.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/views/recyclerview/MyFastScroller;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AnimatorListener"
.end annotation


# instance fields
.field private mCanceled:Z

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

    .line 630
    iput-object p1, p0, Lcom/flyersoft/views/recyclerview/MyFastScroller$AnimatorListener;->this$0:Lcom/flyersoft/views/recyclerview/MyFastScroller;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    const/4 p1, 0x0

    .line 628
    iput-boolean p1, p0, Lcom/flyersoft/views/recyclerview/MyFastScroller$AnimatorListener;->mCanceled:Z

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    const/4 p1, 0x1

    .line 651
    iput-boolean p1, p0, Lcom/flyersoft/views/recyclerview/MyFastScroller$AnimatorListener;->mCanceled:Z

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 636
    iget-boolean p1, p0, Lcom/flyersoft/views/recyclerview/MyFastScroller$AnimatorListener;->mCanceled:Z

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 637
    iput-boolean v0, p0, Lcom/flyersoft/views/recyclerview/MyFastScroller$AnimatorListener;->mCanceled:Z

    return-void

    .line 640
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/views/recyclerview/MyFastScroller$AnimatorListener;->this$0:Lcom/flyersoft/views/recyclerview/MyFastScroller;

    iget-object p1, p1, Lcom/flyersoft/views/recyclerview/MyFastScroller;->mShowHideAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    const/4 v1, 0x0

    cmpl-float p1, p1, v1

    if-nez p1, :cond_1

    .line 641
    iget-object p1, p0, Lcom/flyersoft/views/recyclerview/MyFastScroller$AnimatorListener;->this$0:Lcom/flyersoft/views/recyclerview/MyFastScroller;

    iput v0, p1, Lcom/flyersoft/views/recyclerview/MyFastScroller;->mAnimationState:I

    .line 642
    iget-object p1, p0, Lcom/flyersoft/views/recyclerview/MyFastScroller$AnimatorListener;->this$0:Lcom/flyersoft/views/recyclerview/MyFastScroller;

    invoke-virtual {p1, v0}, Lcom/flyersoft/views/recyclerview/MyFastScroller;->setState(I)V

    return-void

    .line 644
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/views/recyclerview/MyFastScroller$AnimatorListener;->this$0:Lcom/flyersoft/views/recyclerview/MyFastScroller;

    const/4 v0, 0x2

    iput v0, p1, Lcom/flyersoft/views/recyclerview/MyFastScroller;->mAnimationState:I

    .line 645
    iget-object p1, p0, Lcom/flyersoft/views/recyclerview/MyFastScroller$AnimatorListener;->this$0:Lcom/flyersoft/views/recyclerview/MyFastScroller;

    invoke-virtual {p1}, Lcom/flyersoft/views/recyclerview/MyFastScroller;->requestRedraw()V

    return-void
.end method
