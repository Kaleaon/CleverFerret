.class public Lcom/radaee/pdf/Matrix;
.super Ljava/lang/Object;
.source "Matrix.java"


# instance fields
.field protected hand:J


# direct methods
.method public constructor <init>(FFFF)V
    .locals 2

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    .line 10
    iput-wide v0, p0, Lcom/radaee/pdf/Matrix;->hand:J

    .line 62
    invoke-static {p1, p2, p3, p4}, Lcom/radaee/pdf/Matrix;->createScale(FFFF)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/radaee/pdf/Matrix;->hand:J

    return-void
.end method

.method public constructor <init>(FFFFFF)V
    .locals 2

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    .line 10
    iput-wide v0, p0, Lcom/radaee/pdf/Matrix;->hand:J

    .line 39
    invoke-static/range {p1 .. p6}, Lcom/radaee/pdf/Matrix;->create(FFFFFF)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/radaee/pdf/Matrix;->hand:J

    return-void
.end method

.method protected constructor <init>(J)V
    .locals 0

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    iput-wide p1, p0, Lcom/radaee/pdf/Matrix;->hand:J

    return-void
.end method

.method private static native create(FFFFFF)J
.end method

.method private static native createScale(FFFF)J
.end method

.method private static native destroy(J)V
.end method

.method private static native invert(J)V
.end method

.method private static native transformInk(JJ)V
.end method

.method private static native transformPath(JJ)V
.end method

.method private static native transformPoint(J[F)V
.end method

.method private static native transformRect(J[F)V
.end method


# virtual methods
.method public final Destroy()V
    .locals 2

    .line 95
    iget-wide v0, p0, Lcom/radaee/pdf/Matrix;->hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/Matrix;->destroy(J)V

    const-wide/16 v0, 0x0

    .line 96
    iput-wide v0, p0, Lcom/radaee/pdf/Matrix;->hand:J

    return-void
.end method

.method public final Invert()V
    .locals 2

    .line 70
    iget-wide v0, p0, Lcom/radaee/pdf/Matrix;->hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/Matrix;->invert(J)V

    return-void
.end method

.method public final TransformInk(Lcom/radaee/pdf/Ink;)V
    .locals 4

    if-nez p1, :cond_0

    return-void

    .line 80
    :cond_0
    iget-wide v0, p0, Lcom/radaee/pdf/Matrix;->hand:J

    iget-wide v2, p1, Lcom/radaee/pdf/Ink;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Matrix;->transformInk(JJ)V

    return-void
.end method

.method public final TransformPath(Lcom/radaee/pdf/Path;)V
    .locals 4

    if-nez p1, :cond_0

    return-void

    .line 75
    :cond_0
    iget-wide v0, p0, Lcom/radaee/pdf/Matrix;->hand:J

    iget-wide v2, p1, Lcom/radaee/pdf/Path;->m_hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/Matrix;->transformPath(JJ)V

    return-void
.end method

.method public final TransformPoint([F)V
    .locals 2

    .line 88
    iget-wide v0, p0, Lcom/radaee/pdf/Matrix;->hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/Matrix;->transformPoint(J[F)V

    return-void
.end method

.method public final TransformRect([F)V
    .locals 2

    .line 84
    iget-wide v0, p0, Lcom/radaee/pdf/Matrix;->hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/Matrix;->transformRect(J[F)V

    return-void
.end method

.method protected finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 101
    invoke-virtual {p0}, Lcom/radaee/pdf/Matrix;->Destroy()V

    .line 102
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method
