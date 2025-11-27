.class Lcom/flyersoft/views/NewCurl3D$1;
.super Ljava/lang/Object;
.source "NewCurl3D.java"

# interfaces
.implements Lcom/flyersoft/views/NewCurl3D$Observer3D;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/views/NewCurl3D;->initObserver3D()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/views/NewCurl3D;


# direct methods
.method constructor <init>(Lcom/flyersoft/views/NewCurl3D;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 372
    iput-object p1, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDrawFrame()V
    .locals 10

    .line 374
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget-boolean v0, v0, Lcom/flyersoft/views/NewCurl3D;->mAnimate:Z

    if-nez v0, :cond_0

    goto/16 :goto_2

    .line 377
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 378
    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v2}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmAnimationStartTime(Lcom/flyersoft/views/NewCurl3D;)J

    move-result-wide v2

    const/high16 v4, 0x3f800000    # 1.0f

    const-wide/16 v5, 0x0

    const/4 v7, 0x1

    cmp-long v8, v2, v5

    if-lez v8, :cond_a

    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v2}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmAnimationStartTime(Lcom/flyersoft/views/NewCurl3D;)J

    move-result-wide v2

    iget-object v8, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v8}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmAnimationDurationTime(Lcom/flyersoft/views/NewCurl3D;)J

    move-result-wide v8

    add-long/2addr v2, v8

    cmp-long v8, v0, v2

    if-ltz v8, :cond_a

    .line 379
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget-boolean v0, v0, Lcom/flyersoft/views/NewCurl3D;->turnSuccess:Z

    const/4 v1, 0x0

    if-nez v0, :cond_1

    goto/16 :goto_1

    .line 381
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget-boolean v0, v0, Lcom/flyersoft/views/NewCurl3D;->dualPage:Z

    const/4 v2, 0x2

    if-nez v0, :cond_5

    .line 382
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget v0, v0, Lcom/flyersoft/views/NewCurl3D;->mCurlState:I

    if-ne v0, v2, :cond_3

    .line 383
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v0}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmPageCurl(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    move-result-object v0

    .line 384
    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v2}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmPageLeft(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    move-result-object v2

    .line 385
    iget-object v3, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget-object v3, v3, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    invoke-virtual {v3, v7}, Lcom/flyersoft/views/NewCurl3D$Render3D;->getPageRect(I)Landroid/graphics/RectF;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->setRect(Landroid/graphics/RectF;)V

    .line 386
    iget-object v3, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget v3, v3, Lcom/flyersoft/views/NewCurl3D;->mTurnType:I

    if-nez v3, :cond_2

    .line 387
    invoke-virtual {v0}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->reset()V

    .line 388
    :cond_2
    iget-object v3, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget-object v3, v3, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    invoke-virtual {v3, v2}, Lcom/flyersoft/views/NewCurl3D$Render3D;->removeCurlMesh(Lcom/flyersoft/views/NewCurl3D$Mesh3D;)V

    .line 389
    iget-object v3, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v3, v2}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fputmPageCurl(Lcom/flyersoft/views/NewCurl3D;Lcom/flyersoft/views/NewCurl3D$Mesh3D;)V

    .line 390
    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v2, v0}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fputmPageLeft(Lcom/flyersoft/views/NewCurl3D;Lcom/flyersoft/views/NewCurl3D$Mesh3D;)V

    goto/16 :goto_1

    .line 391
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget v0, v0, Lcom/flyersoft/views/NewCurl3D;->mCurlState:I

    if-ne v0, v7, :cond_9

    .line 392
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v0}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmPageCurl(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    move-result-object v0

    .line 393
    iget-object v3, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v3}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmPageRight(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    move-result-object v3

    .line 394
    iget-object v4, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget-object v4, v4, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    invoke-virtual {v4, v2}, Lcom/flyersoft/views/NewCurl3D$Render3D;->getPageRect(I)Landroid/graphics/RectF;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->setRect(Landroid/graphics/RectF;)V

    .line 395
    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget-boolean v2, v2, Lcom/flyersoft/views/NewCurl3D;->dualPage:Z

    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->setFlipTexture(ZZ)V

    .line 396
    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget v2, v2, Lcom/flyersoft/views/NewCurl3D;->mTurnType:I

    if-nez v2, :cond_4

    .line 397
    invoke-virtual {v0}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->reset()V

    .line 398
    :cond_4
    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget-object v2, v2, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    invoke-virtual {v2, v3}, Lcom/flyersoft/views/NewCurl3D$Render3D;->removeCurlMesh(Lcom/flyersoft/views/NewCurl3D$Mesh3D;)V

    .line 399
    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v2, v3}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fputmPageCurl(Lcom/flyersoft/views/NewCurl3D;Lcom/flyersoft/views/NewCurl3D$Mesh3D;)V

    .line 400
    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v2, v0}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fputmPageRight(Lcom/flyersoft/views/NewCurl3D;Lcom/flyersoft/views/NewCurl3D$Mesh3D;)V

    goto/16 :goto_1

    .line 403
    :cond_5
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v0}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmPointerPos(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/NewCurl3D$PointerPosition;

    move-result-object v0

    iget-object v0, v0, Lcom/flyersoft/views/NewCurl3D$PointerPosition;->mPos:Landroid/graphics/PointF;

    iget-object v3, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v3}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmAnimationSource(Lcom/flyersoft/views/NewCurl3D;)Landroid/graphics/PointF;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 404
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v0}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmPointerPos(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/NewCurl3D$PointerPosition;

    move-result-object v0

    iget-object v0, v0, Lcom/flyersoft/views/NewCurl3D$PointerPosition;->mPos:Landroid/graphics/PointF;

    iget v3, v0, Landroid/graphics/PointF;->x:F

    iget-object v5, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v5}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmAnimationTarget(Lcom/flyersoft/views/NewCurl3D;)Landroid/graphics/PointF;

    move-result-object v5

    iget v5, v5, Landroid/graphics/PointF;->x:F

    iget-object v6, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v6}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmAnimationSource(Lcom/flyersoft/views/NewCurl3D;)Landroid/graphics/PointF;

    move-result-object v6

    iget v6, v6, Landroid/graphics/PointF;->x:F

    sub-float/2addr v5, v6

    add-float/2addr v3, v5

    iput v3, v0, Landroid/graphics/PointF;->x:F

    .line 405
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v0}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmPointerPos(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/NewCurl3D$PointerPosition;

    move-result-object v0

    iget-object v0, v0, Lcom/flyersoft/views/NewCurl3D$PointerPosition;->mPos:Landroid/graphics/PointF;

    iget v3, v0, Landroid/graphics/PointF;->y:F

    iget-object v5, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v5}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmAnimationTarget(Lcom/flyersoft/views/NewCurl3D;)Landroid/graphics/PointF;

    move-result-object v5

    iget v5, v5, Landroid/graphics/PointF;->y:F

    iget-object v6, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v6}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmAnimationSource(Lcom/flyersoft/views/NewCurl3D;)Landroid/graphics/PointF;

    move-result-object v6

    iget v6, v6, Landroid/graphics/PointF;->y:F

    sub-float/2addr v5, v6

    add-float/2addr v3, v5

    iput v3, v0, Landroid/graphics/PointF;->y:F

    .line 406
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    const-wide/16 v5, 0x2

    invoke-static {v0, v5, v6}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fputdualPageAnimateState(Lcom/flyersoft/views/NewCurl3D;J)V

    .line 407
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v0}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetdualCache1(Lcom/flyersoft/views/NewCurl3D;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->recycle(Landroid/graphics/Bitmap;)Z

    .line 408
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v0}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetdualCache2(Lcom/flyersoft/views/NewCurl3D;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->recycle(Landroid/graphics/Bitmap;)Z

    .line 410
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-virtual {v0, v2}, Lcom/flyersoft/views/NewCurl3D;->getShotBitmap(I)Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fputdualCache1(Lcom/flyersoft/views/NewCurl3D;Landroid/graphics/Bitmap;)V

    .line 411
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    const/4 v2, 0x3

    invoke-virtual {v0, v2}, Lcom/flyersoft/views/NewCurl3D;->getShotBitmap(I)Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fputdualCache2(Lcom/flyersoft/views/NewCurl3D;Landroid/graphics/Bitmap;)V

    .line 412
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v0}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetdualCache1(Lcom/flyersoft/views/NewCurl3D;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result v0

    if-nez v0, :cond_6

    .line 413
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v0}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetdualCache1(Lcom/flyersoft/views/NewCurl3D;)Landroid/graphics/Bitmap;

    move-result-object v2

    iget-object v3, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v3}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetdualCache1(Lcom/flyersoft/views/NewCurl3D;)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fputdualCache1(Lcom/flyersoft/views/NewCurl3D;Landroid/graphics/Bitmap;)V

    .line 414
    :cond_6
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v0}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetdualCache2(Lcom/flyersoft/views/NewCurl3D;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result v0

    if-nez v0, :cond_7

    .line 415
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v0}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetdualCache2(Lcom/flyersoft/views/NewCurl3D;)Landroid/graphics/Bitmap;

    move-result-object v2

    iget-object v3, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v3}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetdualCache2(Lcom/flyersoft/views/NewCurl3D;)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fputdualCache2(Lcom/flyersoft/views/NewCurl3D;Landroid/graphics/Bitmap;)V
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 417
    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fputdualCache2(Lcom/flyersoft/views/NewCurl3D;Landroid/graphics/Bitmap;)V

    invoke-static {v2, v3}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fputdualCache1(Lcom/flyersoft/views/NewCurl3D;Landroid/graphics/Bitmap;)V

    .line 418
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 420
    :cond_7
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget v0, v0, Lcom/flyersoft/views/NewCurl3D;->mTurnType:I

    if-nez v0, :cond_8

    .line 421
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v0}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmPointerPos(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/NewCurl3D$PointerPosition;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$mupdateCurlPos(Lcom/flyersoft/views/NewCurl3D;Lcom/flyersoft/views/NewCurl3D$PointerPosition;)V

    goto :goto_1

    .line 423
    :cond_8
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v0}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmGB(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;

    move-result-object v0

    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget-boolean v2, v2, Lcom/flyersoft/views/NewCurl3D;->dualPage:Z

    invoke-virtual {v0, v4, v2}, Lcom/flyersoft/views/GoogleBook3D;->updatePageTurnAnimation(FZ)V

    .line 424
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-virtual {v0}, Lcom/flyersoft/views/NewCurl3D;->requestRender()V

    .line 428
    :cond_9
    :goto_1
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iput-boolean v1, v0, Lcom/flyersoft/views/NewCurl3D;->mAnimate:Z

    .line 429
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    new-instance v2, Lcom/flyersoft/views/NewCurl3D$1$1;

    invoke-direct {v2, p0}, Lcom/flyersoft/views/NewCurl3D$1$1;-><init>(Lcom/flyersoft/views/NewCurl3D$1;)V

    invoke-virtual {v0, v2}, Lcom/flyersoft/views/NewCurl3D;->post(Ljava/lang/Runnable;)Z

    .line 435
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iput v1, v0, Lcom/flyersoft/views/NewCurl3D;->mCurlState:I

    :goto_2
    return-void

    .line 438
    :cond_a
    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v2}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmPointerPos(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/NewCurl3D$PointerPosition;

    move-result-object v2

    iget-object v2, v2, Lcom/flyersoft/views/NewCurl3D$PointerPosition;->mPos:Landroid/graphics/PointF;

    iget-object v3, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v3}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmAnimationSource(Lcom/flyersoft/views/NewCurl3D;)Landroid/graphics/PointF;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 439
    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v2}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmAnimationStartTime(Lcom/flyersoft/views/NewCurl3D;)J

    move-result-wide v2

    cmp-long v8, v2, v5

    if-lez v8, :cond_f

    .line 440
    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v2}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmAnimationStartTime(Lcom/flyersoft/views/NewCurl3D;)J

    move-result-wide v2

    sub-long/2addr v0, v2

    .line 441
    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v2}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmAnimationDurationTime(Lcom/flyersoft/views/NewCurl3D;)J

    move-result-wide v2

    long-to-float v0, v0

    long-to-float v1, v2

    div-float/2addr v0, v1

    .line 443
    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget-boolean v1, v1, Lcom/flyersoft/views/NewCurl3D;->dualPage:Z

    if-nez v1, :cond_e

    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget v1, v1, Lcom/flyersoft/views/NewCurl3D;->mCurlState:I

    if-ne v1, v7, :cond_b

    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget v1, v1, Lcom/flyersoft/views/NewCurl3D;->mTurnType:I

    if-ne v1, v7, :cond_b

    goto :goto_3

    .line 446
    :cond_b
    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v1}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetfromClick(Lcom/flyersoft/views/NewCurl3D;)Z

    move-result v1

    if-nez v1, :cond_c

    float-to-double v0, v0

    goto :goto_4

    .line 447
    :cond_c
    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget v1, v1, Lcom/flyersoft/views/NewCurl3D;->mCurlState:I

    if-ne v1, v7, :cond_d

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    goto :goto_4

    :cond_d
    float-to-double v0, v0

    const-wide v2, 0x3ff3333340000000L    # 1.2000000476837158

    .line 448
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    goto :goto_4

    :cond_e
    :goto_3
    float-to-double v1, v0

    const v3, 0x3f99999a    # 1.2f

    sub-float/2addr v4, v0

    mul-float v4, v4, v3

    const v0, 0x3c23d70a    # 0.01f

    add-float/2addr v4, v0

    float-to-double v3, v4

    .line 444
    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    :goto_4
    double-to-float v0, v0

    .line 450
    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v1}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmPointerPos(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/NewCurl3D$PointerPosition;

    move-result-object v1

    iget-object v1, v1, Lcom/flyersoft/views/NewCurl3D$PointerPosition;->mPos:Landroid/graphics/PointF;

    iget v2, v1, Landroid/graphics/PointF;->x:F

    iget-object v3, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v3}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmAnimationTarget(Lcom/flyersoft/views/NewCurl3D;)Landroid/graphics/PointF;

    move-result-object v3

    iget v3, v3, Landroid/graphics/PointF;->x:F

    iget-object v4, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v4}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmAnimationSource(Lcom/flyersoft/views/NewCurl3D;)Landroid/graphics/PointF;

    move-result-object v4

    iget v4, v4, Landroid/graphics/PointF;->x:F

    sub-float/2addr v3, v4

    mul-float v3, v3, v0

    add-float/2addr v2, v3

    iput v2, v1, Landroid/graphics/PointF;->x:F

    .line 451
    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v1}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmPointerPos(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/NewCurl3D$PointerPosition;

    move-result-object v1

    iget-object v1, v1, Lcom/flyersoft/views/NewCurl3D$PointerPosition;->mPos:Landroid/graphics/PointF;

    iget v2, v1, Landroid/graphics/PointF;->y:F

    iget-object v3, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v3}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmAnimationTarget(Lcom/flyersoft/views/NewCurl3D;)Landroid/graphics/PointF;

    move-result-object v3

    iget v3, v3, Landroid/graphics/PointF;->y:F

    iget-object v4, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v4}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmAnimationSource(Lcom/flyersoft/views/NewCurl3D;)Landroid/graphics/PointF;

    move-result-object v4

    iget v4, v4, Landroid/graphics/PointF;->y:F

    sub-float/2addr v3, v4

    mul-float v3, v3, v0

    add-float/2addr v2, v3

    iput v2, v1, Landroid/graphics/PointF;->y:F

    goto :goto_5

    :cond_f
    const/4 v0, 0x0

    .line 453
    :goto_5
    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget v1, v1, Lcom/flyersoft/views/NewCurl3D;->mTurnType:I

    if-nez v1, :cond_10

    .line 454
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v0}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmPointerPos(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/NewCurl3D$PointerPosition;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$mupdateCurlPos(Lcom/flyersoft/views/NewCurl3D;Lcom/flyersoft/views/NewCurl3D$PointerPosition;)V

    return-void

    .line 456
    :cond_10
    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v1}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmGB(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;

    move-result-object v1

    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget-boolean v2, v2, Lcom/flyersoft/views/NewCurl3D;->dualPage:Z

    invoke-virtual {v1, v0, v2}, Lcom/flyersoft/views/GoogleBook3D;->updatePageTurnAnimation(FZ)V

    .line 457
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-virtual {v0}, Lcom/flyersoft/views/NewCurl3D;->requestRender()V

    return-void
.end method

.method public onSurfaceCreated()V
    .locals 1

    .line 463
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v0}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmPageLeft(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->resetTexture()V

    .line 464
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v0}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmPageRight(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->resetTexture()V

    .line 465
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$1;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v0}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmPageCurl(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->resetTexture()V

    return-void
.end method
