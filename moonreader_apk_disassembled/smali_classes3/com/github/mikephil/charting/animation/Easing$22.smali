.class final Lcom/github/mikephil/charting/animation/Easing$22;
.super Ljava/lang/Object;
.source "Easing.java"

# interfaces
.implements Lcom/github/mikephil/charting/animation/Easing$EasingFunction;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/github/mikephil/charting/animation/Easing;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 224
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getInterpolation(F)F
    .locals 8

    const/4 v0, 0x0

    cmpl-float v1, p1, v0

    if-nez v1, :cond_0

    return v0

    :cond_0
    const/high16 v0, 0x40000000    # 2.0f

    mul-float p1, p1, v0

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, p1, v0

    if-nez v0, :cond_1

    return v1

    :cond_1
    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    .line 236
    invoke-static {v2, v3}, Ljava/lang/Math;->asin(D)D

    move-result-wide v2

    double-to-float v0, v2

    const v2, 0x3d92ad5c

    mul-float v0, v0, v2

    const v2, 0x40c90fdb

    const-wide/high16 v3, 0x4000000000000000L    # 2.0

    const v5, 0x400e38e4

    cmpg-float v6, p1, v1

    if-gez v6, :cond_2

    sub-float/2addr p1, v1

    const/high16 v6, 0x41200000    # 10.0f

    mul-float v6, v6, p1

    float-to-double v6, v6

    .line 239
    invoke-static {v3, v4, v6, v7}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v3

    double-to-float v3, v3

    mul-float p1, p1, v1

    sub-float/2addr p1, v0

    mul-float p1, p1, v2

    mul-float p1, p1, v5

    float-to-double v0, p1

    .line 240
    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v0

    double-to-float p1, v0

    mul-float v3, v3, p1

    const/high16 p1, -0x41000000    # -0.5f

    mul-float v3, v3, p1

    return v3

    :cond_2
    sub-float/2addr p1, v1

    const/high16 v6, -0x3ee00000    # -10.0f

    mul-float v6, v6, p1

    float-to-double v6, v6

    .line 243
    invoke-static {v3, v4, v6, v7}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v3

    double-to-float v3, v3

    const/high16 v4, 0x3f000000    # 0.5f

    mul-float v3, v3, v4

    mul-float p1, p1, v1

    sub-float/2addr p1, v0

    mul-float p1, p1, v2

    mul-float p1, p1, v5

    float-to-double v4, p1

    .line 244
    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    move-result-wide v4

    double-to-float p1, v4

    mul-float v3, v3, p1

    add-float/2addr v3, v1

    return v3
.end method
