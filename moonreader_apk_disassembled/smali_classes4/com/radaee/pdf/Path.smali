.class public Lcom/radaee/pdf/Path;
.super Ljava/lang/Object;
.source "Path.java"


# instance fields
.field protected m_hand:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    invoke-static {}, Lcom/radaee/pdf/Path;->create()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/radaee/pdf/Path;->m_hand:J

    return-void
.end method

.method protected constructor <init>(J)V
    .locals 0

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput-wide p1, p0, Lcom/radaee/pdf/Path;->m_hand:J

    return-void
.end method

.method private static native closePath(J)V
.end method

.method private static native create()J
.end method

.method private static native curveTo(JFFFFFF)V
.end method

.method private static native destroy(J)V
.end method

.method private static native getNode(JI[F)I
.end method

.method private static native getNodeCount(J)I
.end method

.method private static native lineTo(JFF)V
.end method

.method private static native moveTo(JFF)V
.end method

.method private toSysPath(IFF)Landroid/graphics/Path;
    .locals 6

    const/4 v0, 0x2

    .line 107
    new-array v0, v0, [F

    .line 108
    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, p1, :cond_1

    .line 111
    iget-wide v4, p0, Lcom/radaee/pdf/Path;->m_hand:J

    invoke-static {v4, v5, v3, v0}, Lcom/radaee/pdf/Path;->getNode(JI[F)I

    move-result v4

    const/4 v5, 0x1

    if-eq v4, v5, :cond_0

    .line 118
    aget v4, v0, v2

    add-float/2addr v4, p2

    aget v5, v0, v5

    add-float/2addr v5, p3

    invoke-virtual {v1, v4, v5}, Landroid/graphics/Path;->moveTo(FF)V

    goto :goto_1

    .line 115
    :cond_0
    aget v4, v0, v2

    add-float/2addr v4, p2

    aget v5, v0, v5

    add-float/2addr v5, p3

    invoke-virtual {v1, v4, v5}, Landroid/graphics/Path;->lineTo(FF)V

    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return-object v1
.end method


# virtual methods
.method public final ClosePath()V
    .locals 2

    .line 76
    iget-wide v0, p0, Lcom/radaee/pdf/Path;->m_hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/Path;->closePath(J)V

    return-void
.end method

.method public final CurveTo(FFFFFF)V
    .locals 8

    .line 69
    iget-wide v0, p0, Lcom/radaee/pdf/Path;->m_hand:J

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move v7, p6

    invoke-static/range {v0 .. v7}, Lcom/radaee/pdf/Path;->curveTo(JFFFFFF)V

    return-void
.end method

.method public final Destroy()V
    .locals 2

    .line 83
    iget-wide v0, p0, Lcom/radaee/pdf/Path;->m_hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/Path;->destroy(J)V

    const-wide/16 v0, 0x0

    .line 84
    iput-wide v0, p0, Lcom/radaee/pdf/Path;->m_hand:J

    return-void
.end method

.method public final GetNode(I[F)I
    .locals 2

    .line 102
    iget-wide v0, p0, Lcom/radaee/pdf/Path;->m_hand:J

    invoke-static {v0, v1, p1, p2}, Lcom/radaee/pdf/Path;->getNode(JI[F)I

    move-result p1

    return p1
.end method

.method public final GetNodeCount()I
    .locals 2

    .line 88
    iget-wide v0, p0, Lcom/radaee/pdf/Path;->m_hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/Path;->getNodeCount(J)I

    move-result v0

    return v0
.end method

.method public final LineTo(FF)V
    .locals 2

    .line 65
    iget-wide v0, p0, Lcom/radaee/pdf/Path;->m_hand:J

    invoke-static {v0, v1, p1, p2}, Lcom/radaee/pdf/Path;->lineTo(JFF)V

    return-void
.end method

.method public final MoveTo(FF)V
    .locals 2

    .line 56
    iget-wide v0, p0, Lcom/radaee/pdf/Path;->m_hand:J

    invoke-static {v0, v1, p1, p2}, Lcom/radaee/pdf/Path;->moveTo(JFF)V

    return-void
.end method

.method public OnDraw(Landroid/graphics/Canvas;FFLandroid/graphics/Paint;)V
    .locals 3

    if-nez p1, :cond_0

    goto :goto_2

    .line 128
    :cond_0
    iget-wide v0, p0, Lcom/radaee/pdf/Path;->m_hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/Path;->getNodeCount(J)I

    move-result v0

    .line 129
    invoke-virtual {p4}, Landroid/graphics/Paint;->getStyle()Landroid/graphics/Paint$Style;

    move-result-object v1

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    if-eq v1, v2, :cond_2

    invoke-virtual {p4}, Landroid/graphics/Paint;->getStyle()Landroid/graphics/Paint$Style;

    move-result-object v1

    sget-object v2, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    if-ne v1, v2, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    const/4 v1, 0x1

    :goto_1
    if-eqz v1, :cond_3

    const/4 v2, 0x3

    if-ge v0, v2, :cond_3

    goto :goto_2

    :cond_3
    const/4 v2, 0x2

    if-ge v0, v2, :cond_4

    :goto_2
    return-void

    .line 132
    :cond_4
    invoke-direct {p0, v0, p2, p3}, Lcom/radaee/pdf/Path;->toSysPath(IFF)Landroid/graphics/Path;

    move-result-object p2

    if-eqz v1, :cond_5

    .line 133
    invoke-virtual {p2}, Landroid/graphics/Path;->close()V

    .line 134
    :cond_5
    invoke-virtual {p1, p2, p4}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    return-void
.end method

.method protected finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 154
    invoke-virtual {p0}, Lcom/radaee/pdf/Path;->Destroy()V

    .line 155
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method

.method public onDrawPoint(Landroid/graphics/Canvas;FFILandroid/graphics/Paint;)V
    .locals 9

    if-nez p1, :cond_0

    return-void

    .line 139
    :cond_0
    iget-wide v0, p0, Lcom/radaee/pdf/Path;->m_hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/Path;->getNodeCount(J)I

    move-result v0

    const/4 v1, 0x2

    .line 141
    new-array v1, v1, [F

    .line 142
    new-instance v2, Landroid/graphics/Path;

    invoke-direct {v2}, Landroid/graphics/Path;-><init>()V

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v0, :cond_1

    .line 145
    iget-wide v5, p0, Lcom/radaee/pdf/Path;->m_hand:J

    invoke-static {v5, v6, v4, v1}, Lcom/radaee/pdf/Path;->getNode(JI[F)I

    .line 146
    aget v5, v1, v3

    add-float/2addr v5, p2

    const/4 v6, 0x1

    aget v6, v1, v6

    add-float/2addr v6, p3

    int-to-float v7, p4

    sget-object v8, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v2, v5, v6, v7, v8}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 149
    :cond_1
    invoke-virtual {p1, v2, p5}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    return-void
.end method
