.class public Lcom/flyersoft/views/recyclerview/MergedLinearLayout;
.super Landroid/widget/LinearLayout;
.source "MergedLinearLayout.java"


# static fields
.field static TRIGGER_TIME:I = 0x190


# instance fields
.field coverView:Landroid/view/View;

.field drawX:I

.field drawY:I

.field handler:Landroid/os/Handler;

.field onCoverHoldOutsite:Lcom/flyersoft/tools/T$OnResult;

.field outside:Z

.field public outsideCheckFinished:Z

.field outsideTime:J

.field outsideX:J

.field outsideY:J


# direct methods
.method static bridge synthetic -$$Nest$mdoOutsideAccept(Lcom/flyersoft/views/recyclerview/MergedLinearLayout;Lcom/flyersoft/tools/BookDb$BookInfo;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->doOutsideAccept(Lcom/flyersoft/tools/BookDb$BookInfo;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 20
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const-wide/16 v0, -0x1

    .line 95
    iput-wide v0, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->outsideTime:J

    iput-wide v0, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->outsideX:J

    iput-wide v0, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->outsideY:J

    .line 98
    new-instance p1, Lcom/flyersoft/views/recyclerview/MergedLinearLayout$1;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, p0, v0}, Lcom/flyersoft/views/recyclerview/MergedLinearLayout$1;-><init>(Lcom/flyersoft/views/recyclerview/MergedLinearLayout;Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->handler:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 24
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const-wide/16 p1, -0x1

    .line 95
    iput-wide p1, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->outsideTime:J

    iput-wide p1, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->outsideX:J

    iput-wide p1, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->outsideY:J

    .line 98
    new-instance p1, Lcom/flyersoft/views/recyclerview/MergedLinearLayout$1;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p2

    invoke-direct {p1, p0, p2}, Lcom/flyersoft/views/recyclerview/MergedLinearLayout$1;-><init>(Lcom/flyersoft/views/recyclerview/MergedLinearLayout;Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->handler:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 28
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const-wide/16 p1, -0x1

    .line 95
    iput-wide p1, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->outsideTime:J

    iput-wide p1, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->outsideX:J

    iput-wide p1, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->outsideY:J

    .line 98
    new-instance p1, Lcom/flyersoft/views/recyclerview/MergedLinearLayout$1;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p2

    invoke-direct {p1, p0, p2}, Lcom/flyersoft/views/recyclerview/MergedLinearLayout$1;-><init>(Lcom/flyersoft/views/recyclerview/MergedLinearLayout;Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->handler:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 32
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const-wide/16 p1, -0x1

    .line 95
    iput-wide p1, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->outsideTime:J

    iput-wide p1, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->outsideX:J

    iput-wide p1, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->outsideY:J

    .line 98
    new-instance p1, Lcom/flyersoft/views/recyclerview/MergedLinearLayout$1;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p2

    invoke-direct {p1, p0, p2}, Lcom/flyersoft/views/recyclerview/MergedLinearLayout$1;-><init>(Lcom/flyersoft/views/recyclerview/MergedLinearLayout;Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->handler:Landroid/os/Handler;

    return-void
.end method

.method private clearOutsideState()V
    .locals 2

    .line 90
    iget-object v0, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->handler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    const-wide/16 v0, -0x1

    .line 91
    iput-wide v0, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->outsideY:J

    iput-wide v0, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->outsideX:J

    iput-wide v0, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->outsideTime:J

    return-void
.end method

.method private doOutsideAccept(Lcom/flyersoft/tools/BookDb$BookInfo;)V
    .locals 1

    .line 83
    invoke-direct {p0}, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->clearOutsideState()V

    const/4 v0, 0x1

    .line 84
    iput-boolean v0, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->outsideCheckFinished:Z

    .line 85
    iget-object v0, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->onCoverHoldOutsite:Lcom/flyersoft/tools/T$OnResult;

    if-eqz v0, :cond_0

    .line 86
    invoke-interface {v0, p1}, Lcom/flyersoft/tools/T$OnResult;->done(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method


# virtual methods
.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 2

    .line 37
    iget-object v0, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->coverView:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 39
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 40
    iget v0, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->drawX:I

    int-to-float v0, v0

    iget v1, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->drawY:I

    int-to-float v1, v1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 41
    iget-object v0, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->coverView:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 42
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 44
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->dispatchDraw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public drawView(Landroid/view/View;FFZ)V
    .locals 2

    .line 52
    iput-object p1, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->coverView:Landroid/view/View;

    float-to-int p1, p2

    .line 53
    iput p1, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->drawX:I

    float-to-int p1, p3

    .line 54
    iput p1, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->drawY:I

    .line 55
    iput-boolean p4, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->outside:Z

    .line 56
    invoke-virtual {p0}, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->invalidate()V

    .line 58
    iget-boolean p1, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->outsideCheckFinished:Z

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    if-eqz p4, :cond_4

    .line 62
    iget-wide p1, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->outsideTime:J

    const-wide/16 p3, -0x1

    cmp-long v0, p1, p3

    if-nez v0, :cond_1

    .line 63
    iget p1, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->drawX:I

    int-to-long p1, p1

    iput-wide p1, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->outsideX:J

    .line 64
    iget p1, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->drawY:I

    int-to-long p1, p1

    iput-wide p1, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->outsideY:J

    .line 65
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->outsideTime:J

    .line 66
    iget-object p1, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->handler:Landroid/os/Handler;

    iget-object p2, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->coverView:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p2

    const/4 p3, 0x0

    invoke-virtual {p1, p3, p2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p2

    sget p3, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->TRIGGER_TIME:I

    int-to-long p3, p3

    invoke-virtual {p1, p2, p3, p4}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    return-void

    :cond_1
    const/high16 p1, 0x41200000    # 10.0f

    .line 68
    invoke-static {p1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result p1

    .line 69
    iget-wide p2, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->outsideX:J

    iget p4, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->drawX:I

    int-to-long v0, p4

    sub-long/2addr p2, v0

    invoke-static {p2, p3}, Ljava/lang/Math;->abs(J)J

    move-result-wide p2

    int-to-long v0, p1

    cmp-long p1, p2, v0

    if-gez p1, :cond_3

    iget-wide p1, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->outsideY:J

    iget p3, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->drawY:I

    int-to-long p3, p3

    sub-long/2addr p1, p3

    invoke-static {p1, p2}, Ljava/lang/Math;->abs(J)J

    move-result-wide p1

    cmp-long p3, p1, v0

    if-gez p3, :cond_3

    .line 70
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    iget-wide p3, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->outsideTime:J

    sub-long/2addr p1, p3

    sget p3, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->TRIGGER_TIME:I

    int-to-long p3, p3

    cmp-long v0, p1, p3

    if-lez v0, :cond_2

    .line 71
    iget-object p1, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->coverView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-direct {p0, p1}, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->doOutsideAccept(Lcom/flyersoft/tools/BookDb$BookInfo;)V

    :cond_2
    :goto_0
    return-void

    .line 74
    :cond_3
    invoke-direct {p0}, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->clearOutsideState()V

    return-void

    .line 78
    :cond_4
    invoke-direct {p0}, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->clearOutsideState()V

    return-void
.end method

.method public setOnCoverHoldOutsite(Lcom/flyersoft/tools/T$OnResult;)V
    .locals 0

    .line 107
    iput-object p1, p0, Lcom/flyersoft/views/recyclerview/MergedLinearLayout;->onCoverHoldOutsite:Lcom/flyersoft/tools/T$OnResult;

    return-void
.end method
