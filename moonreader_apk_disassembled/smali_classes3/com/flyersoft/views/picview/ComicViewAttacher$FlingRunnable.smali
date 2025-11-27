.class Lcom/flyersoft/views/picview/ComicViewAttacher$FlingRunnable;
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
    name = "FlingRunnable"
.end annotation


# instance fields
.field private mCurrentX:I

.field private mCurrentY:I

.field private final mScroller:Lcom/flyersoft/views/picview/ScrollerProxy;

.field final synthetic this$0:Lcom/flyersoft/views/picview/ComicViewAttacher;


# direct methods
.method public constructor <init>(Lcom/flyersoft/views/picview/ComicViewAttacher;Landroid/content/Context;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x0
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 1105
    iput-object p1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$FlingRunnable;->this$0:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1106
    invoke-static {p2}, Lcom/flyersoft/views/picview/ScrollerProxy;->getScroller(Landroid/content/Context;)Lcom/flyersoft/views/picview/ScrollerProxy;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$FlingRunnable;->mScroller:Lcom/flyersoft/views/picview/ScrollerProxy;

    return-void
.end method


# virtual methods
.method public cancelFling()V
    .locals 4

    .line 1110
    invoke-static {}, Lcom/flyersoft/views/picview/ComicViewAttacher;->-$$Nest$sfgetDEBUG()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 1111
    new-array v0, v1, [Ljava/lang/Object;

    const-string v2, "Cancel Fling"

    const/4 v3, 0x0

    aput-object v2, v0, v3

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 1113
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$FlingRunnable;->mScroller:Lcom/flyersoft/views/picview/ScrollerProxy;

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/picview/ScrollerProxy;->forceFinished(Z)V

    return-void
.end method

.method public fling(IIII)V
    .locals 13

    .line 1118
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$FlingRunnable;->this$0:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getDisplayRect()Landroid/graphics/RectF;

    move-result-object v0

    if-nez v0, :cond_0

    goto/16 :goto_2

    .line 1123
    :cond_0
    iget v1, v0, Landroid/graphics/RectF;->left:F

    neg-float v1, v1

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v3

    int-to-float p1, p1

    .line 1126
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v1

    const/4 v2, 0x0

    cmpg-float v1, p1, v1

    if-gez v1, :cond_1

    .line 1128
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v1

    sub-float/2addr v1, p1

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result p1

    move v8, p1

    const/4 v7, 0x0

    goto :goto_0

    :cond_1
    move v7, v3

    move v8, v7

    .line 1133
    :goto_0
    iget p1, v0, Landroid/graphics/RectF;->top:F

    neg-float p1, p1

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result v4

    int-to-float p1, p2

    .line 1134
    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result p2

    cmpg-float p2, p1, p2

    if-gez p2, :cond_2

    .line 1136
    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result p2

    sub-float/2addr p2, p1

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p1

    move v10, p1

    const/4 v9, 0x0

    goto :goto_1

    :cond_2
    move v9, v4

    move v10, v9

    .line 1141
    :goto_1
    iput v3, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$FlingRunnable;->mCurrentX:I

    .line 1142
    iput v4, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$FlingRunnable;->mCurrentY:I

    .line 1144
    invoke-static {}, Lcom/flyersoft/views/picview/ComicViewAttacher;->-$$Nest$sfgetDEBUG()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 1145
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "fling. StartX:"

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, " StartY:"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, " MaxX:"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, " MaxY:"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x1

    new-array p2, p2, [Ljava/lang/Object;

    aput-object p1, p2, v2

    invoke-static {p2}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    :cond_3
    if-ne v3, v8, :cond_5

    if-eq v4, v10, :cond_4

    goto :goto_3

    :cond_4
    :goto_2
    return-void

    .line 1152
    :cond_5
    :goto_3
    iget-object v2, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$FlingRunnable;->mScroller:Lcom/flyersoft/views/picview/ScrollerProxy;

    const/4 v11, 0x0

    const/4 v12, 0x0

    move/from16 v5, p3

    move/from16 v6, p4

    invoke-virtual/range {v2 .. v12}, Lcom/flyersoft/views/picview/ScrollerProxy;->fling(IIIIIIIIII)V

    return-void
.end method

.method public run()V
    .locals 6

    .line 1159
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$FlingRunnable;->mScroller:Lcom/flyersoft/views/picview/ScrollerProxy;

    invoke-virtual {v0}, Lcom/flyersoft/views/picview/ScrollerProxy;->isFinished()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 1163
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$FlingRunnable;->this$0:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-virtual {v0}, Lcom/flyersoft/views/picview/ComicViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 1164
    iget-object v1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$FlingRunnable;->mScroller:Lcom/flyersoft/views/picview/ScrollerProxy;

    invoke-virtual {v1}, Lcom/flyersoft/views/picview/ScrollerProxy;->computeScrollOffset()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1166
    iget-object v1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$FlingRunnable;->mScroller:Lcom/flyersoft/views/picview/ScrollerProxy;

    invoke-virtual {v1}, Lcom/flyersoft/views/picview/ScrollerProxy;->getCurrX()I

    move-result v1

    .line 1167
    iget-object v2, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$FlingRunnable;->mScroller:Lcom/flyersoft/views/picview/ScrollerProxy;

    invoke-virtual {v2}, Lcom/flyersoft/views/picview/ScrollerProxy;->getCurrY()I

    move-result v2

    .line 1169
    invoke-static {}, Lcom/flyersoft/views/picview/ComicViewAttacher;->-$$Nest$sfgetDEBUG()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1170
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "fling run(). CurrentX:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v4, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$FlingRunnable;->mCurrentX:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " CurrentY:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$FlingRunnable;->mCurrentY:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " NewX:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " NewY:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v3, v4, v5

    invoke-static {v4}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 1176
    :cond_1
    iget-object v3, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$FlingRunnable;->this$0:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-static {v3}, Lcom/flyersoft/views/picview/ComicViewAttacher;->-$$Nest$fgetmSuppMatrix(Lcom/flyersoft/views/picview/ComicViewAttacher;)Landroid/graphics/Matrix;

    move-result-object v3

    iget v4, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$FlingRunnable;->mCurrentX:I

    sub-int/2addr v4, v1

    int-to-float v4, v4

    iget v5, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$FlingRunnable;->mCurrentY:I

    sub-int/2addr v5, v2

    int-to-float v5, v5

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 1177
    iget-object v3, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$FlingRunnable;->this$0:Lcom/flyersoft/views/picview/ComicViewAttacher;

    invoke-static {v3}, Lcom/flyersoft/views/picview/ComicViewAttacher;->-$$Nest$mgetDrawMatrix(Lcom/flyersoft/views/picview/ComicViewAttacher;)Landroid/graphics/Matrix;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/flyersoft/views/picview/ComicViewAttacher;->-$$Nest$msetImageViewMatrix(Lcom/flyersoft/views/picview/ComicViewAttacher;Landroid/graphics/Matrix;)V

    .line 1179
    iput v1, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$FlingRunnable;->mCurrentX:I

    .line 1180
    iput v2, p0, Lcom/flyersoft/views/picview/ComicViewAttacher$FlingRunnable;->mCurrentY:I

    .line 1183
    invoke-static {v0, p0}, Lcom/flyersoft/views/picview/Compat;->postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V

    :cond_2
    :goto_0
    return-void
.end method
