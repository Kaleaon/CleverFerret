.class public Lcom/radaee/pdf/BMP;
.super Ljava/lang/Object;
.source "BMP.java"


# instance fields
.field protected hand:J

.field private m_h:I

.field private m_w:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    .line 61
    iput-wide v0, p0, Lcom/radaee/pdf/BMP;->hand:J

    const/4 v0, 0x0

    .line 62
    iput v0, p0, Lcom/radaee/pdf/BMP;->m_w:I

    .line 63
    iput v0, p0, Lcom/radaee/pdf/BMP;->m_h:I

    return-void
.end method

.method private static native drawRect(JIIIIII)V
.end method

.method private static native drawToDIB(JJII)V
.end method

.method private static native free(Landroid/graphics/Bitmap;J)V
.end method

.method private static native get(Landroid/graphics/Bitmap;)J
.end method

.method private static native invert(J)V
.end method

.method private static native mulAlpha(J)V
.end method

.method private static native restoreRaw(JLjava/lang/String;)Z
.end method

.method private static native saveRaw(JLjava/lang/String;)Z
.end method


# virtual methods
.method public final Create(Landroid/graphics/Bitmap;)V
    .locals 2

    if-nez p1, :cond_0

    return-void

    .line 72
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/radaee/pdf/BMP;->m_w:I

    .line 73
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/radaee/pdf/BMP;->m_h:I

    .line 74
    invoke-static {p1}, Lcom/radaee/pdf/BMP;->get(Landroid/graphics/Bitmap;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/radaee/pdf/BMP;->hand:J

    return-void
.end method

.method public final DrawRect(IIIIII)V
    .locals 8

    .line 97
    iget-wide v0, p0, Lcom/radaee/pdf/BMP;->hand:J

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move v7, p6

    invoke-static/range {v0 .. v7}, Lcom/radaee/pdf/BMP;->drawRect(JIIIIII)V

    return-void
.end method

.method public final DrawToDIB(Lcom/radaee/pdf/DIB;II)V
    .locals 6

    if-nez p1, :cond_0

    return-void

    .line 79
    :cond_0
    iget-wide v0, p0, Lcom/radaee/pdf/BMP;->hand:J

    iget-wide v2, p1, Lcom/radaee/pdf/DIB;->hand:J

    move v4, p2

    move v5, p3

    invoke-static/range {v0 .. v5}, Lcom/radaee/pdf/BMP;->drawToDIB(JJII)V

    return-void
.end method

.method public final Free(Landroid/graphics/Bitmap;)V
    .locals 2

    if-nez p1, :cond_0

    return-void

    .line 121
    :cond_0
    iget-wide v0, p0, Lcom/radaee/pdf/BMP;->hand:J

    invoke-static {p1, v0, v1}, Lcom/radaee/pdf/BMP;->free(Landroid/graphics/Bitmap;J)V

    const-wide/16 v0, 0x0

    .line 122
    iput-wide v0, p0, Lcom/radaee/pdf/BMP;->hand:J

    return-void
.end method

.method public final GetHeight()I
    .locals 1

    .line 130
    iget v0, p0, Lcom/radaee/pdf/BMP;->m_h:I

    return v0
.end method

.method public final GetWidth()I
    .locals 1

    .line 126
    iget v0, p0, Lcom/radaee/pdf/BMP;->m_w:I

    return v0
.end method

.method public final Invert()V
    .locals 2

    .line 116
    iget-wide v0, p0, Lcom/radaee/pdf/BMP;->hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/BMP;->invert(J)V

    return-void
.end method

.method public final MulAlpha()V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 112
    iget-wide v0, p0, Lcom/radaee/pdf/BMP;->hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/BMP;->mulAlpha(J)V

    return-void
.end method

.method public final RestorePixs(Ljava/lang/String;)Z
    .locals 2

    .line 150
    iget-wide v0, p0, Lcom/radaee/pdf/BMP;->hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/BMP;->restoreRaw(JLjava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public final SavePixs(Ljava/lang/String;)Z
    .locals 2

    .line 140
    iget-wide v0, p0, Lcom/radaee/pdf/BMP;->hand:J

    invoke-static {v0, v1, p1}, Lcom/radaee/pdf/BMP;->saveRaw(JLjava/lang/String;)Z

    move-result p1

    return p1
.end method
