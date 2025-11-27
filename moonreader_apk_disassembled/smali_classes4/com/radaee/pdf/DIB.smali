.class public Lcom/radaee/pdf/DIB;
.super Ljava/lang/Object;
.source "DIB.java"


# instance fields
.field protected hand:J

.field private m_h:I

.field private m_w:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    .line 61
    iput-wide v0, p0, Lcom/radaee/pdf/DIB;->hand:J

    return-void
.end method

.method private static native drawRect(JIIIIII)V
.end method

.method private static native drawToBmp(JJII)V
.end method

.method private static native drawToBmp2(JJIIII)V
.end method

.method private static native drawToDIB(JJII)V
.end method

.method private static native free(J)I
.end method

.method private static native get(JII)J
.end method

.method private static native glGenTexture(JZ)I
.end method

.method private static native makeGray(J)V
.end method

.method private static native restoreRaw(JLjava/lang/String;[I)J
.end method

.method private static native saveRaw(JLjava/lang/String;)Z
.end method


# virtual methods
.method public final CreateOrResize(II)V
    .locals 2

    .line 66
    iget-wide v0, p0, Lcom/radaee/pdf/DIB;->hand:J

    invoke-static {v0, v1, p1, p2}, Lcom/radaee/pdf/DIB;->get(JII)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/radaee/pdf/DIB;->hand:J

    .line 67
    iput p1, p0, Lcom/radaee/pdf/DIB;->m_w:I

    .line 68
    iput p2, p0, Lcom/radaee/pdf/DIB;->m_h:I

    return-void
.end method

.method public final DrawRect(IIIIII)V
    .locals 8

    .line 105
    iget-wide v0, p0, Lcom/radaee/pdf/DIB;->hand:J

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move v7, p6

    invoke-static/range {v0 .. v7}, Lcom/radaee/pdf/DIB;->drawRect(JIIIIII)V

    return-void
.end method

.method public final DrawToBmp(Lcom/radaee/pdf/BMP;II)V
    .locals 6

    if-nez p1, :cond_0

    return-void

    .line 78
    :cond_0
    iget-wide v0, p0, Lcom/radaee/pdf/DIB;->hand:J

    iget-wide v2, p1, Lcom/radaee/pdf/BMP;->hand:J

    move v4, p2

    move v5, p3

    invoke-static/range {v0 .. v5}, Lcom/radaee/pdf/DIB;->drawToBmp(JJII)V

    return-void
.end method

.method public final DrawToBmp2(Lcom/radaee/pdf/BMP;IIII)V
    .locals 8

    if-nez p1, :cond_0

    return-void

    .line 101
    :cond_0
    iget-wide v0, p0, Lcom/radaee/pdf/DIB;->hand:J

    iget-wide v2, p1, Lcom/radaee/pdf/BMP;->hand:J

    move v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    invoke-static/range {v0 .. v7}, Lcom/radaee/pdf/DIB;->drawToBmp2(JJIIII)V

    return-void
.end method

.method public final DrawToDIB(Lcom/radaee/pdf/DIB;II)V
    .locals 6

    if-nez p1, :cond_0

    return-void

    .line 73
    :cond_0
    iget-wide v0, p0, Lcom/radaee/pdf/DIB;->hand:J

    iget-wide v2, p1, Lcom/radaee/pdf/DIB;->hand:J

    move v4, p2

    move v5, p3

    invoke-static/range {v0 .. v5}, Lcom/radaee/pdf/DIB;->drawToDIB(JJII)V

    return-void
.end method

.method public final Free()V
    .locals 2

    .line 121
    iget-wide v0, p0, Lcom/radaee/pdf/DIB;->hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/DIB;->free(J)I

    const-wide/16 v0, 0x0

    .line 122
    iput-wide v0, p0, Lcom/radaee/pdf/DIB;->hand:J

    return-void
.end method

.method public GLGenTexture()I
    .locals 3

    .line 109
    iget-wide v0, p0, Lcom/radaee/pdf/DIB;->hand:J

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lcom/radaee/pdf/DIB;->glGenTexture(JZ)I

    move-result v0

    return v0
.end method

.method public GetHeight()I
    .locals 1

    .line 117
    iget v0, p0, Lcom/radaee/pdf/DIB;->m_h:I

    return v0
.end method

.method public GetWidth()I
    .locals 1

    .line 113
    iget v0, p0, Lcom/radaee/pdf/DIB;->m_w:I

    return v0
.end method

.method public final IsEmpty()Z
    .locals 5

    .line 63
    iget-wide v0, p0, Lcom/radaee/pdf/DIB;->hand:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public final MakeGray()V
    .locals 2

    .line 88
    iget-wide v0, p0, Lcom/radaee/pdf/DIB;->hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/DIB;->makeGray(J)V

    return-void
.end method

.method public final RestorePixs(Ljava/lang/String;)Z
    .locals 5

    const/4 v0, 0x2

    .line 141
    new-array v0, v0, [I

    .line 142
    iget-wide v1, p0, Lcom/radaee/pdf/DIB;->hand:J

    invoke-static {v1, v2, p1, v0}, Lcom/radaee/pdf/DIB;->restoreRaw(JLjava/lang/String;[I)J

    move-result-wide v1

    const/4 p1, 0x0

    .line 143
    aget v3, v0, p1

    if-lez v3, :cond_0

    const/4 v4, 0x1

    aget v0, v0, v4

    if-lez v0, :cond_0

    .line 145
    iput v3, p0, Lcom/radaee/pdf/DIB;->m_w:I

    .line 146
    iput v0, p0, Lcom/radaee/pdf/DIB;->m_h:I

    .line 147
    iput-wide v1, p0, Lcom/radaee/pdf/DIB;->hand:J

    return v4

    :cond_0
    return p1
.end method

.method public final SavePixs(Ljava/lang/String;)Z
    .locals 2

    .line 131
    iget-wide v0, p0, Lcom/radaee/pdf/DIB;->hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/DIB;->saveRaw(JLjava/lang/String;)Z

    move-result p1

    return p1
.end method

.method protected finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 156
    invoke-virtual {p0}, Lcom/radaee/pdf/DIB;->Free()V

    .line 157
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method
