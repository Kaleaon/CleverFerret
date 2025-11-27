.class Lcom/flyersoft/views/picview/ComicViewAttacher$AnimatedZoomRunnable;
.super Ljava/lang/Object;
.source "ComicViewAttacher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/views/picview/ComicViewAttacher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AnimatedZoomRunnable"
.end annotation


# instance fields
.field private final mFocalX:F

.field private final mFocalY:F

.field private final mStartTime:J

.field private final mZoomEnd:F

.field private final mZoomStart:F

.field final synthetic this$0:Lcom/flyersoft/views/picview/ComicViewAttacher;


# direct methods
.method public constructor <init>(Lcom/flyersoft/views/picview/ComicViewAttacher;FFFF)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x10,
            0x10,
            0x10,
            0x10
        }
        names = {
            null,
            null,
            null,
            null,
            null
        }
    .end annotation

    .line 1065
    iput-object p1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$AnimatedZoomRunnable;->this$0:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1066
    iput p4, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$AnimatedZoomRunnable;->mFocalX:F

    .line 1067
    iput p5, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$AnimatedZoomRunnable;->mFocalY:F

    .line 1068
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p4

    iput-wide p4, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$AnimatedZoomRunnable;->mStartTime:J

    .line 1069
    iput p2, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$AnimatedZoomRunnable;->mZoomStart:F

    .line 1070
    iput p3, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$AnimatedZoomRunnable;->mZoomEnd:F

    return-void
.end method

.method private interpolate()F
    .locals 4

    .line 1093
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$AnimatedZoomRunnable;->mStartTime:J

    sub-long/2addr v0, v2

    long-to-float v0, v0

    const/high16 v1, 0x3f800000    # 1.0f

    mul-float v0, v0, v1

    iget-object v2, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$AnimatedZoomRunnable;->this$0:Lcom/flyersoft/views/picview/ComicViewAttacher;

    iget v2, v2, Lcom/flyersoft/views/picview/ComicViewAttacher;->ZOOM_DURATION:I

    int-to-float v2, v2

    div-float/2addr v0, v2

    .line 1094
    invoke-static {v1, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    .line 1095
    iget-object v1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$AnimatedZoomRunnable;->this$0:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-static {v1}, Lcom/flyersoft/views/picview/ComicViewAttacher;->-$$Nest$fgetmInterpolator(Lcom/flyersoft/views/picview/ComicViewAttacher;)Landroid/view/animation/Interpolator;

    move-result-object v1

    invoke-interface {v1, v0}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v0

    return v0
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 1075
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$AnimatedZoomRunnable;->this$0:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 1080
    :cond_0
    invoke-direct {p0}, Lcom/flyersoft/views/picview/ComicViewAttacher$AnimatedZoomRunnable;->interpolate()F

    move-result v1

    .line 1081
    iget v2, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$AnimatedZoomRunnable;->mZoomStart:F

    iget v3, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$AnimatedZoomRunnable;->mZoomEnd:F

    sub-float/2addr v3, v2

    mul-float v3, v3, v1

    add-float/2addr v2, v3

    .line 1082
    iget-object v3, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$AnimatedZoomRunnable;->this$0:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v3}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getScale()F

    move-result v3

    div-float/2addr v2, v3

    .line 1084
    iget-object v3, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$AnimatedZoomRunnable;->this$0:Lcom/flyersoft/views/picview/ComicViewAttacher;

    iget v4, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$AnimatedZoomRunnable;->mFocalX:F

    iget v5, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$AnimatedZoomRunnable;->mFocalY:F

    invoke-virtual {v3, v2, v4, v5}, Lcom/flyersoft/views/picview/ComicViewAttacher;->onScale(FFF)V

    const/high16 v2, 0x3f800000    # 1.0f

    cmpg-float v1, v1, v2

    if-gez v1, :cond_1

    .line 1088
    invoke-static {v0, p0}, Lcom/flyersoft/views/picview/Compat;->postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V

    :cond_1
    :goto_0
    return-void
.end method
