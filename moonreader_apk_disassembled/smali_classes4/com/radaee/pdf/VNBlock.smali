.class public Lcom/radaee/pdf/VNBlock;
.super Ljava/lang/Object;
.source "VNBlock.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static Render(J)V
    .locals 1

    .line 16
    :try_start_0
    sget v0, Lcom/radaee/pdf/Global;->render_mode:I

    invoke-static {p0, p1, v0}, Lcom/radaee/pdf/VNBlock;->render(JI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p0

    .line 18
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 19
    const-string p0, "MR2"

    const-string p1, "-------VNBlock ERROR, maybe memory allocation failed-------"

    invoke-static {p0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public static native bmp(J)Landroid/graphics/Bitmap;
.end method

.method public static native destroy(J)V
.end method

.method public static native getPageNO(J)I
.end method

.method public static native getSta(J)I
.end method

.method private static native render(JI)V
.end method
