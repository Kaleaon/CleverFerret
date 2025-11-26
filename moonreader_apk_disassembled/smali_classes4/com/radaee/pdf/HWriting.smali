.class public Lcom/radaee/pdf/HWriting;
.super Ljava/lang/Object;
.source "HWriting.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field protected hand:J

.field private m_bmp:Landroid/graphics/Bitmap;


# direct methods
.method public constructor <init>(IIFFIII)V
    .locals 2

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    .line 16
    iput-wide v0, p0, Lcom/radaee/pdf/HWriting;->hand:J

    .line 36
    invoke-static/range {p1 .. p7}, Lcom/radaee/pdf/HWriting;->create(IIFFIII)I

    move-result p3

    int-to-long p3, p3

    iput-wide p3, p0, Lcom/radaee/pdf/HWriting;->hand:J

    .line 37
    sget-object p3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, p2, p3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/radaee/pdf/HWriting;->m_bmp:Landroid/graphics/Bitmap;

    return-void
.end method

.method private static native create(IIFFIII)I
.end method

.method private static native destroy(J)V
.end method

.method private static native onDown(JFF)V
.end method

.method private static native onDraw(JJ)V
.end method

.method private static native onMove(JFF)V
.end method

.method private static native onUp(JFF)V
.end method


# virtual methods
.method public Destroy()V
    .locals 2

    .line 44
    iget-wide v0, p0, Lcom/radaee/pdf/HWriting;->hand:J

    invoke-static {v0, v1}, Lcom/radaee/pdf/HWriting;->destroy(J)V

    const-wide/16 v0, 0x0

    .line 45
    iput-wide v0, p0, Lcom/radaee/pdf/HWriting;->hand:J

    .line 46
    iget-object v0, p0, Lcom/radaee/pdf/HWriting;->m_bmp:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    .line 47
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    const/4 v0, 0x0

    .line 48
    iput-object v0, p0, Lcom/radaee/pdf/HWriting;->m_bmp:Landroid/graphics/Bitmap;

    :cond_0
    return-void
.end method

.method public OnDown(FF)V
    .locals 2

    .line 58
    iget-wide v0, p0, Lcom/radaee/pdf/HWriting;->hand:J

    invoke-static {v0, v1, p1, p2}, Lcom/radaee/pdf/HWriting;->onDown(JFF)V

    return-void
.end method

.method public OnDraw(Lcom/radaee/pdf/BMP;)V
    .locals 4

    .line 84
    iget-wide v0, p0, Lcom/radaee/pdf/HWriting;->hand:J

    iget-wide v2, p1, Lcom/radaee/pdf/BMP;->hand:J

    invoke-static {v0, v1, v2, v3}, Lcom/radaee/pdf/HWriting;->onDraw(JJ)V

    return-void
.end method

.method public OnMove(FF)V
    .locals 2

    .line 67
    iget-wide v0, p0, Lcom/radaee/pdf/HWriting;->hand:J

    invoke-static {v0, v1, p1, p2}, Lcom/radaee/pdf/HWriting;->onMove(JFF)V

    return-void
.end method

.method public OnUp(FF)V
    .locals 2

    .line 76
    iget-wide v0, p0, Lcom/radaee/pdf/HWriting;->hand:J

    invoke-static {v0, v1, p1, p2}, Lcom/radaee/pdf/HWriting;->onUp(JFF)V

    return-void
.end method

.method protected finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 89
    invoke-virtual {p0}, Lcom/radaee/pdf/HWriting;->Destroy()V

    .line 90
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method
