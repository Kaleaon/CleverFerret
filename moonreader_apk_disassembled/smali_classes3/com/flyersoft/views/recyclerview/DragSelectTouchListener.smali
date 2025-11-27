.class public Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;
.super Ljava/lang/Object;
.source "DragSelectTouchListener.java"

# interfaces
.implements Landroidx/recyclerview/widget/RecyclerView$OnItemTouchListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$onSelectListener;
    }
.end annotation


# static fields
.field private static final DELAY:I = 0x19

.field private static final MAX_SCROLL_DISTANCE:I = 0xc8

.field private static final SCROLL_FECTOR:I = 0x6


# instance fields
.field private final autoScrollHandler:Landroid/os/Handler;

.field private end:I

.field public horizontal:Z

.field private inBottomSpot:Z

.field private inLeftSpot:Z

.field private inRightSpot:Z

.field private inTopSpot:Z

.field private isActive:Z

.field private lastEnd:I

.field private lastStart:I

.field private lastX:F

.field private lastY:F

.field private mBottomBound:I

.field private mLeftBound:I

.field private mRightBound:I

.field private mTopBound:I

.field private recyclerView:Landroidx/recyclerview/widget/RecyclerView;

.field private scrollDistance:I

.field private final scrollRun:Ljava/lang/Runnable;

.field private final scrollRunnable:Ljava/lang/Runnable;

.field private scroller:Landroid/widget/OverScroller;

.field private selectListener:Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$onSelectListener;

.field private start:I

.field startScrollTime:J


# direct methods
.method static bridge synthetic -$$Nest$fgetautoScrollHandler(Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->autoScrollHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetinBottomSpot(Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->inBottomSpot:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetinLeftSpot(Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->inLeftSpot:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetinRightSpot(Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->inRightSpot:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetinTopSpot(Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->inTopSpot:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetrecyclerView(Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;)Landroidx/recyclerview/widget/RecyclerView;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetscrollDistance(Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;)I
    .locals 0

    iget p0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->scrollDistance:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetscrollRun(Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;)Ljava/lang/Runnable;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->scrollRun:Ljava/lang/Runnable;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetscroller(Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;)Landroid/widget/OverScroller;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->scroller:Landroid/widget/OverScroller;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mscrollBy(Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->scrollBy(I)V

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->autoScrollHandler:Landroid/os/Handler;

    .line 55
    new-instance v0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$1;-><init>(Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;)V

    iput-object v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->scrollRunnable:Ljava/lang/Runnable;

    .line 144
    new-instance v0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$2;

    invoke-direct {v0, p0}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$2;-><init>(Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;)V

    iput-object v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->scrollRun:Ljava/lang/Runnable;

    .line 82
    invoke-direct {p0}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->reset()V

    return-void
.end method

.method private initScroller(Landroid/content/Context;)V
    .locals 2

    .line 132
    iget-object v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->scroller:Landroid/widget/OverScroller;

    if-nez v0, :cond_0

    .line 133
    new-instance v0, Landroid/widget/OverScroller;

    new-instance v1, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    invoke-direct {v0, p1, v1}, Landroid/widget/OverScroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    iput-object v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->scroller:Landroid/widget/OverScroller;

    :cond_0
    return-void
.end method

.method private notifySelectRangeChange()V
    .locals 7

    .line 253
    iget-object v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->selectListener:Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$onSelectListener;

    if-nez v0, :cond_0

    goto :goto_3

    .line 256
    :cond_0
    iget v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->start:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_9

    iget v2, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->end:I

    if-ne v2, v1, :cond_1

    goto :goto_3

    .line 261
    :cond_1
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 262
    iget v2, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->start:I

    iget v3, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->end:I

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 263
    iget v3, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->lastStart:I

    const/4 v4, 0x1

    if-eq v3, v1, :cond_6

    iget v5, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->lastEnd:I

    if-ne v5, v1, :cond_2

    goto :goto_1

    :cond_2
    const/4 v1, 0x0

    if-le v0, v3, :cond_3

    .line 271
    iget-object v5, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->selectListener:Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$onSelectListener;

    add-int/lit8 v6, v0, -0x1

    invoke-interface {v5, v3, v6, v1}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$onSelectListener;->onSelectChange(IIZ)V

    goto :goto_0

    :cond_3
    if-ge v0, v3, :cond_4

    .line 273
    iget-object v5, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->selectListener:Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$onSelectListener;

    sub-int/2addr v3, v4

    invoke-interface {v5, v0, v3, v4}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$onSelectListener;->onSelectChange(IIZ)V

    .line 276
    :cond_4
    :goto_0
    iget v3, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->lastEnd:I

    if-le v2, v3, :cond_5

    .line 277
    iget-object v1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->selectListener:Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$onSelectListener;

    add-int/2addr v3, v4

    invoke-interface {v1, v3, v2, v4}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$onSelectListener;->onSelectChange(IIZ)V

    goto :goto_2

    :cond_5
    if-ge v2, v3, :cond_8

    .line 279
    iget-object v4, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->selectListener:Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$onSelectListener;

    add-int/lit8 v5, v2, 0x1

    invoke-interface {v4, v5, v3, v1}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$onSelectListener;->onSelectChange(IIZ)V

    goto :goto_2

    :cond_6
    :goto_1
    sub-int v1, v2, v0

    if-ne v1, v4, :cond_7

    .line 265
    iget-object v1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->selectListener:Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$onSelectListener;

    invoke-interface {v1, v0, v0, v4}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$onSelectListener;->onSelectChange(IIZ)V

    goto :goto_2

    .line 267
    :cond_7
    iget-object v1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->selectListener:Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$onSelectListener;

    invoke-interface {v1, v0, v2, v4}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$onSelectListener;->onSelectChange(IIZ)V

    .line 283
    :cond_8
    :goto_2
    iput v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->lastStart:I

    .line 284
    iput v2, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->lastEnd:I

    :cond_9
    :goto_3
    return-void
.end method

.method private processAutoScroll(Landroid/view/MotionEvent;)V
    .locals 5

    .line 201
    iget-boolean v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->horizontal:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x1

    if-eqz v0, :cond_2

    .line 202
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    float-to-int v0, v0

    .line 203
    iget v4, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->mLeftBound:I

    if-ge v0, v4, :cond_0

    .line 204
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    iput v1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->lastX:F

    .line 205
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->lastY:F

    .line 206
    iget p1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->mLeftBound:I

    sub-int/2addr p1, v0

    neg-int p1, p1

    div-int/lit8 p1, p1, 0x6

    iput p1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->scrollDistance:I

    .line 207
    iget-boolean p1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->inLeftSpot:Z

    if-nez p1, :cond_4

    .line 208
    iput-boolean v2, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->inLeftSpot:Z

    .line 209
    invoke-virtual {p0}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->startAutoScroll()V

    return-void

    .line 211
    :cond_0
    iget v4, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->mRightBound:I

    if-le v0, v4, :cond_1

    .line 212
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    iput v1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->lastX:F

    .line 213
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->lastY:F

    .line 214
    iget p1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->mRightBound:I

    sub-int/2addr v0, p1

    div-int/lit8 v0, v0, 0x6

    iput v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->scrollDistance:I

    .line 215
    iget-boolean p1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->inRightSpot:Z

    if-nez p1, :cond_4

    .line 216
    iput-boolean v2, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->inRightSpot:Z

    .line 217
    invoke-virtual {p0}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->startAutoScroll()V

    return-void

    .line 220
    :cond_1
    iput-boolean v1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->inRightSpot:Z

    iput-boolean v1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->inLeftSpot:Z

    .line 221
    iput v3, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->lastX:F

    .line 222
    iput v3, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->lastY:F

    .line 223
    invoke-virtual {p0}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->stopAutoScroll()V

    return-void

    .line 226
    :cond_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    float-to-int v0, v0

    .line 227
    iget v4, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->mTopBound:I

    if-ge v0, v4, :cond_3

    .line 228
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    iput v1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->lastX:F

    .line 229
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->lastY:F

    .line 230
    iget p1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->mTopBound:I

    sub-int/2addr p1, v0

    neg-int p1, p1

    div-int/lit8 p1, p1, 0x6

    iput p1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->scrollDistance:I

    .line 231
    iget-boolean p1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->inTopSpot:Z

    if-nez p1, :cond_4

    .line 232
    iput-boolean v2, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->inTopSpot:Z

    .line 233
    invoke-virtual {p0}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->startAutoScroll()V

    return-void

    .line 235
    :cond_3
    iget v4, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->mBottomBound:I

    if-le v0, v4, :cond_5

    .line 236
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    iput v1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->lastX:F

    .line 237
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->lastY:F

    .line 238
    iget p1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->mBottomBound:I

    sub-int/2addr v0, p1

    div-int/lit8 v0, v0, 0x6

    iput v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->scrollDistance:I

    .line 239
    iget-boolean p1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->inBottomSpot:Z

    if-nez p1, :cond_4

    .line 240
    iput-boolean v2, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->inBottomSpot:Z

    .line 241
    invoke-virtual {p0}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->startAutoScroll()V

    :cond_4
    return-void

    .line 244
    :cond_5
    iput-boolean v1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->inBottomSpot:Z

    iput-boolean v1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->inTopSpot:Z

    .line 245
    iput v3, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->lastX:F

    .line 246
    iput v3, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->lastY:F

    .line 247
    invoke-virtual {p0}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->stopAutoScroll()V

    return-void
.end method

.method private reset()V
    .locals 3

    const/4 v0, 0x0

    .line 288
    invoke-virtual {p0, v0}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->setIsActive(Z)V

    const/4 v1, -0x1

    .line 289
    iput v1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->start:I

    .line 290
    iput v1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->end:I

    .line 291
    iput v1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->lastStart:I

    .line 292
    iput v1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->lastEnd:I

    .line 293
    iget-object v1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->autoScrollHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->scrollRunnable:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 294
    iput-boolean v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->inTopSpot:Z

    .line 295
    iput-boolean v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->inBottomSpot:Z

    const/4 v0, 0x1

    .line 296
    iput v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->lastX:F

    .line 297
    iput v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->lastY:F

    .line 298
    invoke-virtual {p0}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->stopAutoScroll()V

    return-void
.end method

.method private scrollBy(I)V
    .locals 2

    if-lez p1, :cond_0

    const/16 v0, 0xc8

    .line 309
    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result p1

    goto :goto_0

    :cond_0
    const/16 v0, -0xc8

    .line 311
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 314
    :goto_0
    iget-boolean v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->horizontal:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 315
    iget-object v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, p1, v1}, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V

    goto :goto_1

    .line 317
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, v1, p1}, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V

    .line 319
    :goto_1
    iget p1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->lastX:F

    const/4 v0, 0x1

    cmpl-float v1, p1, v0

    if-eqz v1, :cond_2

    iget v1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->lastY:F

    cmpl-float v0, v1, v0

    if-eqz v0, :cond_2

    .line 320
    iget-object v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-direct {p0, v0, p1, v1}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->updateSelectedRange(Landroidx/recyclerview/widget/RecyclerView;FF)V

    :cond_2
    return-void
.end method

.method private updateSelectedRange(Landroidx/recyclerview/widget/RecyclerView;FF)V
    .locals 0

    .line 190
    invoke-virtual {p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView;->findChildViewUnder(FF)Landroid/view/View;

    move-result-object p2

    if-eqz p2, :cond_0

    .line 192
    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result p1

    const/4 p2, -0x1

    if-eq p1, p2, :cond_0

    .line 193
    iget p2, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->end:I

    if-eq p2, p1, :cond_0

    .line 194
    iput p1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->end:I

    .line 195
    invoke-direct {p0}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->notifySelectRangeChange()V

    :cond_0
    return-void
.end method

.method private updateSelectedRange(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/MotionEvent;)V
    .locals 2

    .line 186
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iget-boolean v1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->horizontal:Z

    if-eqz v1, :cond_0

    const/high16 p2, 0x41200000    # 10.0f

    invoke-static {p2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result p2

    int-to-float p2, p2

    goto :goto_0

    :cond_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p2

    :goto_0
    invoke-direct {p0, p1, v0, p2}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->updateSelectedRange(Landroidx/recyclerview/widget/RecyclerView;FF)V

    return-void
.end method


# virtual methods
.method public onInterceptTouchEvent(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/MotionEvent;)Z
    .locals 3

    .line 87
    iget-boolean v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->isActive:Z

    if-eqz v0, :cond_3

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    .line 90
    :cond_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p2

    const/4 v0, 0x1

    if-eqz p2, :cond_2

    if-eq p2, v0, :cond_1

    const/4 v1, 0x5

    if-eq p2, v1, :cond_2

    goto :goto_0

    .line 100
    :cond_1
    invoke-direct {p0}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->reset()V

    goto :goto_0

    .line 97
    :cond_2
    invoke-direct {p0}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->reset()V

    .line 103
    :goto_0
    iput-object p1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    const/high16 p2, 0x41c00000    # 24.0f

    .line 104
    invoke-static {p2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result p2

    iput p2, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->mTopBound:I

    .line 105
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getHeight()I

    move-result p2

    const/high16 v1, 0x42400000    # 48.0f

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    sub-int/2addr p2, v2

    iput p2, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->mBottomBound:I

    .line 106
    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result p2

    iput p2, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->mLeftBound:I

    .line 107
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getWidth()I

    move-result p1

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result p2

    sub-int/2addr p1, p2

    iput p1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->mRightBound:I

    return v0

    :cond_3
    :goto_1
    const/4 p1, 0x0

    return p1
.end method

.method public onRequestDisallowInterceptTouchEvent(Z)V
    .locals 0

    return-void
.end method

.method public onTouchEvent(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/MotionEvent;)V
    .locals 2

    .line 162
    iget-boolean v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->isActive:Z

    if-nez v0, :cond_0

    goto :goto_0

    .line 165
    :cond_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_3

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    const/4 p1, 0x3

    if-eq v0, p1, :cond_3

    const/4 p1, 0x6

    if-eq v0, p1, :cond_3

    :goto_0
    return-void

    .line 169
    :cond_1
    iget-boolean v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->inTopSpot:Z

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->inBottomSpot:Z

    if-nez v0, :cond_2

    .line 171
    invoke-direct {p0, p1, p2}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->updateSelectedRange(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/MotionEvent;)V

    .line 174
    :cond_2
    invoke-direct {p0, p2}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->processAutoScroll(Landroid/view/MotionEvent;)V

    return-void

    .line 180
    :cond_3
    invoke-direct {p0}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->reset()V

    return-void
.end method

.method public setIsActive(Z)V
    .locals 0

    .line 325
    iput-boolean p1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->isActive:Z

    return-void
.end method

.method public setSelectListener(Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$onSelectListener;)V
    .locals 0

    .line 68
    iput-object p1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->selectListener:Lcom/flyersoft/views/recyclerview/DragSelectTouchListener$onSelectListener;

    return-void
.end method

.method public setStartSelectPosition(I)V
    .locals 1

    const/4 v0, 0x1

    .line 329
    invoke-virtual {p0, v0}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->setIsActive(Z)V

    .line 330
    iput p1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->start:I

    .line 331
    iput p1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->end:I

    .line 332
    iput p1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->lastStart:I

    .line 333
    iput p1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->lastEnd:I

    return-void
.end method

.method public startAutoScroll()V
    .locals 13

    .line 114
    iget-object v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    if-nez v0, :cond_0

    goto :goto_1

    .line 117
    :cond_0
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->initScroller(Landroid/content/Context;)V

    .line 118
    iget-object v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->scroller:Landroid/widget/OverScroller;

    invoke-virtual {v0}, Landroid/widget/OverScroller;->isFinished()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 119
    iget-object v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->scrollRun:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 121
    iget-boolean v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->horizontal:Z

    if-eqz v0, :cond_1

    .line 122
    iget-object v1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->scroller:Landroid/widget/OverScroller;

    invoke-virtual {v1}, Landroid/widget/OverScroller;->getCurrX()I

    move-result v2

    const/4 v5, 0x0

    const v6, 0x186a0

    const/4 v3, 0x0

    const/16 v4, 0x1388

    invoke-virtual/range {v1 .. v6}, Landroid/widget/OverScroller;->startScroll(IIIII)V

    goto :goto_0

    .line 124
    :cond_1
    iget-object v7, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->scroller:Landroid/widget/OverScroller;

    invoke-virtual {v7}, Landroid/widget/OverScroller;->getCurrY()I

    move-result v9

    const/16 v11, 0x1388

    const v12, 0x186a0

    const/4 v8, 0x0

    const/4 v10, 0x0

    invoke-virtual/range {v7 .. v12}, Landroid/widget/OverScroller;->startScroll(IIIII)V

    .line 126
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->startScrollTime:J

    .line 127
    iget-object v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->scrollRun:Ljava/lang/Runnable;

    invoke-static {v0, v1}, Landroidx/core/view/ViewCompat;->postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V

    :cond_2
    :goto_1
    return-void
.end method

.method public stopAutoScroll()V
    .locals 2

    .line 138
    iget-object v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->scroller:Landroid/widget/OverScroller;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/widget/OverScroller;->isFinished()Z

    move-result v0

    if-nez v0, :cond_0

    .line 139
    iget-object v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->scrollRun:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 140
    iget-object v0, p0, Lcom/flyersoft/views/recyclerview/DragSelectTouchListener;->scroller:Landroid/widget/OverScroller;

    invoke-virtual {v0}, Landroid/widget/OverScroller;->abortAnimation()V

    :cond_0
    return-void
.end method
