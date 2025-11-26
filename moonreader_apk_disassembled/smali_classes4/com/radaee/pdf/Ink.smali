.class public Lcom/radaee/pdf/Ink;
.super Ljava/lang/Object;
.source "Ink.java"


# instance fields
.field protected color:I

.field protected hand:J

.field private m_method:I

.field private m_paint:Landroid/graphics/Paint;

.field private m_path:Landroid/graphics/Path;

.field private m_path_append:Landroid/graphics/Path;

.field private m_path_cur:Landroid/graphics/Path;

.field private path_idx:I

.field private pt1:[F

.field private pt2:[F

.field protected width:F


# direct methods
.method public constructor <init>(FI)V
    .locals 2

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    .line 17
    iput-wide v0, p0, Lcom/radaee/pdf/Ink;->hand:J

    const/4 v0, 0x0

    .line 18
    iput v0, p0, Lcom/radaee/pdf/Ink;->color:I

    const/4 v1, 0x0

    .line 19
    iput v1, p0, Lcom/radaee/pdf/Ink;->width:F

    .line 84
    iput v0, p0, Lcom/radaee/pdf/Ink;->m_method:I

    .line 85
    iput v0, p0, Lcom/radaee/pdf/Ink;->path_idx:I

    .line 86
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/radaee/pdf/Ink;->m_path:Landroid/graphics/Path;

    .line 87
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/radaee/pdf/Ink;->m_path_cur:Landroid/graphics/Path;

    .line 88
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/radaee/pdf/Ink;->m_path_append:Landroid/graphics/Path;

    const/4 v0, 0x2

    .line 89
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/radaee/pdf/Ink;->pt1:[F

    .line 90
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/radaee/pdf/Ink;->pt2:[F

    .line 91
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/radaee/pdf/Ink;->m_paint:Landroid/graphics/Paint;

    .line 33
    iput p1, p0, Lcom/radaee/pdf/Ink;->width:F

    .line 34
    iput p2, p0, Lcom/radaee/pdf/Ink;->color:I

    const/4 v0, 0x1

    .line 35
    invoke-static {p1, p2, v0}, Lcom/radaee/pdf/Ink;->create(FII)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/radaee/pdf/Ink;->hand:J

    .line 36
    iget-object p1, p0, Lcom/radaee/pdf/Ink;->m_paint:Landroid/graphics/Paint;

    sget-object p2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 37
    iget-object p1, p0, Lcom/radaee/pdf/Ink;->m_paint:Landroid/graphics/Paint;

    sget-object p2, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 38
    iget-object p1, p0, Lcom/radaee/pdf/Ink;->m_paint:Landroid/graphics/Paint;

    iget p2, p0, Lcom/radaee/pdf/Ink;->width:F

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 39
    iget-object p1, p0, Lcom/radaee/pdf/Ink;->m_paint:Landroid/graphics/Paint;

    iget p2, p0, Lcom/radaee/pdf/Ink;->color:I

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 40
    iget-object p1, p0, Lcom/radaee/pdf/Ink;->m_paint:Landroid/graphics/Paint;

    sget-object p2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 41
    iget-object p1, p0, Lcom/radaee/pdf/Ink;->m_paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    return-void
.end method

.method private static native create(FII)J
.end method

.method private static native destroy(J)V
.end method

.method private static native getNode(JI[F)I
.end method

.method private static native getNodeCount(J)I
.end method

.method private static native onDown(JFF)V
.end method

.method private static native onMove(JFF)V
.end method

.method private static native onUp(JFF)V
.end method


# virtual methods
.method public final Destroy()V
    .locals 5

    .line 48
    iget-wide v0, p0, Lcom/radaee/pdf/Ink;->hand:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    .line 50
    invoke-static {v0, v1}, Lcom/radaee/pdf/Ink;->destroy(J)V

    .line 51
    iput-wide v2, p0, Lcom/radaee/pdf/Ink;->hand:J

    .line 52
    iget-object v0, p0, Lcom/radaee/pdf/Ink;->m_path:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 53
    iget-object v0, p0, Lcom/radaee/pdf/Ink;->m_path_append:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    const/4 v0, 0x0

    .line 54
    iput v0, p0, Lcom/radaee/pdf/Ink;->path_idx:I

    :cond_0
    return-void
.end method

.method public final OnDown(FF)V
    .locals 2

    .line 64
    iget-wide v0, p0, Lcom/radaee/pdf/Ink;->hand:J

    invoke-static {v0, v1, p1, p2}, Lcom/radaee/pdf/Ink;->onDown(JFF)V

    return-void
.end method

.method public OnDraw(Landroid/graphics/Canvas;)V
    .locals 11

    if-nez p1, :cond_0

    return-void

    .line 99
    :cond_0
    iget v0, p0, Lcom/radaee/pdf/Ink;->m_method:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq v0, v2, :cond_1

    .line 101
    iget-object v0, p0, Lcom/radaee/pdf/Ink;->m_path:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 102
    iget-object v0, p0, Lcom/radaee/pdf/Ink;->m_path_append:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 103
    iput v1, p0, Lcom/radaee/pdf/Ink;->path_idx:I

    .line 104
    iput v2, p0, Lcom/radaee/pdf/Ink;->m_method:I

    .line 106
    :cond_1
    iget v0, p0, Lcom/radaee/pdf/Ink;->path_idx:I

    .line 107
    iget-wide v3, p0, Lcom/radaee/pdf/Ink;->hand:J

    invoke-static {v3, v4}, Lcom/radaee/pdf/Ink;->getNodeCount(J)I

    move-result v3

    const/4 v4, 0x0

    :goto_0
    if-ge v0, v3, :cond_4

    .line 111
    iget-wide v5, p0, Lcom/radaee/pdf/Ink;->hand:J

    iget-object v7, p0, Lcom/radaee/pdf/Ink;->pt1:[F

    invoke-static {v5, v6, v0, v7}, Lcom/radaee/pdf/Ink;->getNode(JI[F)I

    move-result v5

    if-eq v5, v2, :cond_3

    const/4 v6, 0x2

    if-eq v5, v6, :cond_2

    .line 124
    iget-object v4, p0, Lcom/radaee/pdf/Ink;->m_path_append:Landroid/graphics/Path;

    invoke-virtual {v4}, Landroid/graphics/Path;->reset()V

    .line 125
    iget-object v4, p0, Lcom/radaee/pdf/Ink;->m_path_append:Landroid/graphics/Path;

    iget-object v5, p0, Lcom/radaee/pdf/Ink;->m_path_cur:Landroid/graphics/Path;

    invoke-virtual {v4, v5}, Landroid/graphics/Path;->addPath(Landroid/graphics/Path;)V

    .line 127
    iget-object v4, p0, Lcom/radaee/pdf/Ink;->m_path_cur:Landroid/graphics/Path;

    iget-object v5, p0, Lcom/radaee/pdf/Ink;->pt1:[F

    aget v6, v5, v1

    aget v5, v5, v2

    invoke-virtual {v4, v6, v5}, Landroid/graphics/Path;->moveTo(FF)V

    add-int/lit8 v4, v0, 0x1

    move v10, v4

    move v4, v0

    move v0, v10

    goto :goto_0

    .line 119
    :cond_2
    iget-wide v5, p0, Lcom/radaee/pdf/Ink;->hand:J

    add-int/lit8 v7, v0, 0x1

    iget-object v8, p0, Lcom/radaee/pdf/Ink;->pt2:[F

    invoke-static {v5, v6, v7, v8}, Lcom/radaee/pdf/Ink;->getNode(JI[F)I

    .line 120
    iget-object v5, p0, Lcom/radaee/pdf/Ink;->m_path_cur:Landroid/graphics/Path;

    iget-object v6, p0, Lcom/radaee/pdf/Ink;->pt1:[F

    aget v7, v6, v1

    aget v6, v6, v2

    iget-object v8, p0, Lcom/radaee/pdf/Ink;->pt2:[F

    aget v9, v8, v1

    aget v8, v8, v2

    invoke-virtual {v5, v7, v6, v9, v8}, Landroid/graphics/Path;->quadTo(FFFF)V

    add-int/lit8 v0, v0, 0x2

    goto :goto_0

    .line 115
    :cond_3
    iget-object v5, p0, Lcom/radaee/pdf/Ink;->m_path_cur:Landroid/graphics/Path;

    iget-object v6, p0, Lcom/radaee/pdf/Ink;->pt1:[F

    aget v7, v6, v1

    aget v6, v6, v2

    invoke-virtual {v5, v7, v6}, Landroid/graphics/Path;->lineTo(FF)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 132
    :cond_4
    iget-object v0, p0, Lcom/radaee/pdf/Ink;->m_path:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/radaee/pdf/Ink;->m_paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 133
    iget-object v0, p0, Lcom/radaee/pdf/Ink;->m_path_cur:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/radaee/pdf/Ink;->m_paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 134
    iget p1, p0, Lcom/radaee/pdf/Ink;->path_idx:I

    if-le v4, p1, :cond_5

    .line 136
    iput v4, p0, Lcom/radaee/pdf/Ink;->path_idx:I

    .line 137
    iget-object p1, p0, Lcom/radaee/pdf/Ink;->m_path:Landroid/graphics/Path;

    iget-object v0, p0, Lcom/radaee/pdf/Ink;->m_path_append:Landroid/graphics/Path;

    invoke-virtual {p1, v0}, Landroid/graphics/Path;->addPath(Landroid/graphics/Path;)V

    .line 139
    :cond_5
    iget-object p1, p0, Lcom/radaee/pdf/Ink;->m_path_cur:Landroid/graphics/Path;

    invoke-virtual {p1}, Landroid/graphics/Path;->reset()V

    return-void
.end method

.method public OnDraw(Landroid/graphics/Canvas;FF)V
    .locals 12

    if-nez p1, :cond_0

    return-void

    .line 144
    :cond_0
    iget v0, p0, Lcom/radaee/pdf/Ink;->m_method:I

    const/4 v1, 0x2

    const/4 v2, 0x0

    if-eq v0, v1, :cond_1

    .line 146
    iget-object v0, p0, Lcom/radaee/pdf/Ink;->m_path:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 147
    iget-object v0, p0, Lcom/radaee/pdf/Ink;->m_path_append:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 148
    iput v2, p0, Lcom/radaee/pdf/Ink;->path_idx:I

    .line 149
    iput v1, p0, Lcom/radaee/pdf/Ink;->m_method:I

    .line 151
    :cond_1
    iget v0, p0, Lcom/radaee/pdf/Ink;->path_idx:I

    .line 152
    iget-wide v3, p0, Lcom/radaee/pdf/Ink;->hand:J

    invoke-static {v3, v4}, Lcom/radaee/pdf/Ink;->getNodeCount(J)I

    move-result v3

    const/4 v4, 0x0

    :goto_0
    if-ge v0, v3, :cond_4

    .line 156
    iget-wide v5, p0, Lcom/radaee/pdf/Ink;->hand:J

    iget-object v7, p0, Lcom/radaee/pdf/Ink;->pt1:[F

    invoke-static {v5, v6, v0, v7}, Lcom/radaee/pdf/Ink;->getNode(JI[F)I

    move-result v5

    const/4 v6, 0x1

    if-eq v5, v6, :cond_3

    if-eq v5, v1, :cond_2

    .line 169
    iget-object v4, p0, Lcom/radaee/pdf/Ink;->m_path_append:Landroid/graphics/Path;

    invoke-virtual {v4}, Landroid/graphics/Path;->reset()V

    .line 170
    iget-object v4, p0, Lcom/radaee/pdf/Ink;->m_path_append:Landroid/graphics/Path;

    iget-object v5, p0, Lcom/radaee/pdf/Ink;->m_path_cur:Landroid/graphics/Path;

    invoke-virtual {v4, v5}, Landroid/graphics/Path;->addPath(Landroid/graphics/Path;)V

    .line 172
    iget-object v4, p0, Lcom/radaee/pdf/Ink;->m_path_cur:Landroid/graphics/Path;

    iget-object v5, p0, Lcom/radaee/pdf/Ink;->pt1:[F

    aget v7, v5, v2

    add-float/2addr v7, p2

    aget v5, v5, v6

    add-float/2addr v5, p3

    invoke-virtual {v4, v7, v5}, Landroid/graphics/Path;->moveTo(FF)V

    add-int/lit8 v4, v0, 0x1

    move v11, v4

    move v4, v0

    move v0, v11

    goto :goto_0

    .line 164
    :cond_2
    iget-wide v7, p0, Lcom/radaee/pdf/Ink;->hand:J

    add-int/lit8 v5, v0, 0x1

    iget-object v9, p0, Lcom/radaee/pdf/Ink;->pt2:[F

    invoke-static {v7, v8, v5, v9}, Lcom/radaee/pdf/Ink;->getNode(JI[F)I

    .line 165
    iget-object v5, p0, Lcom/radaee/pdf/Ink;->m_path_cur:Landroid/graphics/Path;

    iget-object v7, p0, Lcom/radaee/pdf/Ink;->pt1:[F

    aget v8, v7, v2

    add-float/2addr v8, p2

    aget v7, v7, v6

    add-float/2addr v7, p3

    iget-object v9, p0, Lcom/radaee/pdf/Ink;->pt2:[F

    aget v10, v9, v2

    add-float/2addr v10, p2

    aget v6, v9, v6

    add-float/2addr v6, p3

    invoke-virtual {v5, v8, v7, v10, v6}, Landroid/graphics/Path;->quadTo(FFFF)V

    add-int/lit8 v0, v0, 0x2

    goto :goto_0

    .line 160
    :cond_3
    iget-object v5, p0, Lcom/radaee/pdf/Ink;->m_path_cur:Landroid/graphics/Path;

    iget-object v7, p0, Lcom/radaee/pdf/Ink;->pt1:[F

    aget v8, v7, v2

    add-float/2addr v8, p2

    aget v6, v7, v6

    add-float/2addr v6, p3

    invoke-virtual {v5, v8, v6}, Landroid/graphics/Path;->lineTo(FF)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 177
    :cond_4
    iget-object p2, p0, Lcom/radaee/pdf/Ink;->m_path:Landroid/graphics/Path;

    iget-object p3, p0, Lcom/radaee/pdf/Ink;->m_paint:Landroid/graphics/Paint;

    invoke-virtual {p1, p2, p3}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 178
    iget-object p2, p0, Lcom/radaee/pdf/Ink;->m_path_cur:Landroid/graphics/Path;

    iget-object p3, p0, Lcom/radaee/pdf/Ink;->m_paint:Landroid/graphics/Paint;

    invoke-virtual {p1, p2, p3}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 179
    iget p1, p0, Lcom/radaee/pdf/Ink;->path_idx:I

    if-le v4, p1, :cond_5

    .line 181
    iput v4, p0, Lcom/radaee/pdf/Ink;->path_idx:I

    .line 182
    iget-object p1, p0, Lcom/radaee/pdf/Ink;->m_path:Landroid/graphics/Path;

    iget-object p2, p0, Lcom/radaee/pdf/Ink;->m_path_append:Landroid/graphics/Path;

    invoke-virtual {p1, p2}, Landroid/graphics/Path;->addPath(Landroid/graphics/Path;)V

    .line 184
    :cond_5
    iget-object p1, p0, Lcom/radaee/pdf/Ink;->m_path_cur:Landroid/graphics/Path;

    invoke-virtual {p1}, Landroid/graphics/Path;->reset()V

    return-void
.end method

.method public final OnMove(FF)V
    .locals 2

    .line 73
    iget-wide v0, p0, Lcom/radaee/pdf/Ink;->hand:J

    invoke-static {v0, v1, p1, p2}, Lcom/radaee/pdf/Ink;->onMove(JFF)V

    return-void
.end method

.method public final OnUp(FF)V
    .locals 2

    .line 82
    iget-wide v0, p0, Lcom/radaee/pdf/Ink;->hand:J

    invoke-static {v0, v1, p1, p2}, Lcom/radaee/pdf/Ink;->onUp(JFF)V

    return-void
.end method

.method protected finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 189
    invoke-virtual {p0}, Lcom/radaee/pdf/Ink;->Destroy()V

    .line 190
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method
