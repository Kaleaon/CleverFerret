.class public Lcom/radaee/pdf/VNPage;
.super Ljava/lang/Object;
.source "VNPage.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/radaee/pdf/VNPage$VNPageListener;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static Draw(JLcom/radaee/pdf/VNPage$VNPageListener;Lcom/radaee/pdf/BMP;II)J
    .locals 7

    .line 56
    iget-wide v3, p3, Lcom/radaee/pdf/BMP;->hand:J

    move-wide v0, p0

    move-object v2, p2

    move v5, p4

    move v6, p5

    invoke-static/range {v0 .. v6}, Lcom/radaee/pdf/VNPage;->draw(JLcom/radaee/pdf/VNPage$VNPageListener;JII)J

    move-result-wide p0

    return-wide p0
.end method

.method public static DrawStep2(JLcom/radaee/pdf/BMP;J)V
    .locals 6

    .line 60
    iget-wide v2, p2, Lcom/radaee/pdf/BMP;->hand:J

    move-wide v0, p0

    move-wide v4, p3

    invoke-static/range {v0 .. v5}, Lcom/radaee/pdf/VNPage;->drawStep2(JJJ)V

    return-void
.end method

.method public static InvertMatrix(JFF)Lcom/radaee/pdf/Matrix;
    .locals 1

    .line 68
    invoke-static {p0, p1, p2, p3}, Lcom/radaee/pdf/VNPage;->invertMatrix(JFF)J

    move-result-wide p0

    const-wide/16 p2, 0x0

    cmp-long v0, p0, p2

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 70
    :cond_0
    new-instance p2, Lcom/radaee/pdf/Matrix;

    invoke-direct {p2, p0, p1}, Lcom/radaee/pdf/Matrix;-><init>(J)V

    return-object p2
.end method

.method public static ZoomStart(JLcom/radaee/pdf/BMP;I)V
    .locals 2

    .line 63
    iget-wide v0, p2, Lcom/radaee/pdf/BMP;->hand:J

    invoke-static {p0, p1, v0, v1, p3}, Lcom/radaee/pdf/VNPage;->zoomStart(JJI)V

    return-void
.end method

.method public static native blkDraw(JLcom/radaee/pdf/VNPage$VNPageListener;Landroid/graphics/Canvas;FFFFII)Z
.end method

.method public static native blkEnd(JLcom/radaee/pdf/VNPage$VNPageListener;)V
.end method

.method public static native blkRendered(J)Z
.end method

.method public static native blkStart(JLcom/radaee/pdf/VNPage$VNPageListener;FFFF)V
.end method

.method public static native blkStart0(JLcom/radaee/pdf/VNPage$VNPageListener;FF)V
.end method

.method public static native blkStart1(JLcom/radaee/pdf/VNPage$VNPageListener;)V
.end method

.method public static native blkStart2(JLcom/radaee/pdf/VNPage$VNPageListener;FF)V
.end method

.method public static native clips(JLcom/radaee/pdf/VNPage$VNPageListener;Z)V
.end method

.method protected static native create(JIIILandroid/graphics/Bitmap$Config;)J
.end method

.method protected static native createFromSuperDoc(JIIILandroid/graphics/Bitmap$Config;)J
.end method

.method public static native destroy(JLcom/radaee/pdf/VNPage$VNPageListener;)V
.end method

.method private static native draw(JLcom/radaee/pdf/VNPage$VNPageListener;JII)J
.end method

.method public static native drawStep1(JLcom/radaee/pdf/VNPage$VNPageListener;Landroid/graphics/Canvas;J)Z
.end method

.method private static native drawStep2(JJJ)V
.end method

.method public static native endPage(JLcom/radaee/pdf/VNPage$VNPageListener;)V
.end method

.method public static native finished(J)Z
.end method

.method public static native getHeight(J)I
.end method

.method public static native getPDFX(JI)F
.end method

.method public static native getPDFY(JI)F
.end method

.method public static native getPageNo(J)I
.end method

.method public static native getVX(JF)I
.end method

.method public static native getVY(JF)I
.end method

.method public static native getWidth(J)I
.end method

.method public static native getX(J)I
.end method

.method public static native getY(J)I
.end method

.method private static native invertMatrix(JFF)J
.end method

.method public static native layout(JIIFZ)V
.end method

.method public static native locVert(JII)I
.end method

.method public static native lovHorz(JII)I
.end method

.method public static native renderAsync(JLcom/radaee/pdf/VNPage$VNPageListener;IIII)V
.end method

.method public static native renderSync(JLcom/radaee/pdf/VNPage$VNPageListener;IIII)V
.end method

.method public static native resultDestroy(J)V
.end method

.method public static native setX(JI)V
.end method

.method public static native toDIBX(JF)F
.end method

.method public static native toDIBY(JF)F
.end method

.method public static native toPDFSize(JF)F
.end method

.method public static native toPDFX(JFF)F
.end method

.method public static native toPDFY(JFF)F
.end method

.method public static native zoomConfirm(JLcom/radaee/pdf/VNPage$VNPageListener;IIII)V
.end method

.method private static native zoomStart(JJI)V
.end method
