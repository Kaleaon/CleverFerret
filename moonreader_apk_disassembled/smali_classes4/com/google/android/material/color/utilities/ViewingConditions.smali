.class public final Lcom/google/android/material/color/utilities/ViewingConditions;
.super Ljava/lang/Object;
.source "ViewingConditions.java"


# static fields
.field public static final DEFAULT:Lcom/google/android/material/color/utilities/ViewingConditions;


# instance fields
.field private final aw:D

.field private final c:D

.field private final fl:D

.field private final flRoot:D

.field private final n:D

.field private final nbb:D

.field private final nc:D

.field private final ncb:D

.field private final rgbD:[D

.field private final z:D


# direct methods
.method static constructor <clinit>()V
    .locals 18

    .line 42
    invoke-static {}, Lcom/google/android/material/color/utilities/ColorUtils;->whitePointD65()[D

    move-result-object v0

    const/4 v1, 0x0

    aget-wide v2, v0, v1

    .line 43
    invoke-static {}, Lcom/google/android/material/color/utilities/ColorUtils;->whitePointD65()[D

    move-result-object v0

    const/4 v4, 0x1

    aget-wide v5, v0, v4

    .line 44
    invoke-static {}, Lcom/google/android/material/color/utilities/ColorUtils;->whitePointD65()[D

    move-result-object v0

    const/4 v7, 0x2

    aget-wide v8, v0, v7

    const/4 v0, 0x3

    new-array v10, v0, [D

    aput-wide v2, v10, v1

    aput-wide v5, v10, v4

    aput-wide v8, v10, v7

    const-wide/high16 v0, 0x4049000000000000L    # 50.0

    .line 46
    invoke-static {v0, v1}, Lcom/google/android/material/color/utilities/ColorUtils;->yFromLstar(D)D

    move-result-wide v0

    const-wide v2, 0x404fd4bbab8b494cL    # 63.66197723675813

    mul-double v0, v0, v2

    const-wide/high16 v2, 0x4059000000000000L    # 100.0

    div-double v11, v0, v2

    const-wide/high16 v15, 0x4000000000000000L    # 2.0

    const/16 v17, 0x0

    const-wide/high16 v13, 0x4049000000000000L    # 50.0

    .line 40
    invoke-static/range {v10 .. v17}, Lcom/google/android/material/color/utilities/ViewingConditions;->make([DDDDZ)Lcom/google/android/material/color/utilities/ViewingConditions;

    move-result-object v0

    sput-object v0, Lcom/google/android/material/color/utilities/ViewingConditions;->DEFAULT:Lcom/google/android/material/color/utilities/ViewingConditions;

    return-void
.end method

.method private constructor <init>(DDDDDD[DDDD)V
    .locals 0

    .line 189
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 190
    iput-wide p1, p0, Lcom/google/android/material/color/utilities/ViewingConditions;->n:D

    .line 191
    iput-wide p3, p0, Lcom/google/android/material/color/utilities/ViewingConditions;->aw:D

    .line 192
    iput-wide p5, p0, Lcom/google/android/material/color/utilities/ViewingConditions;->nbb:D

    .line 193
    iput-wide p7, p0, Lcom/google/android/material/color/utilities/ViewingConditions;->ncb:D

    .line 194
    iput-wide p9, p0, Lcom/google/android/material/color/utilities/ViewingConditions;->c:D

    .line 195
    iput-wide p11, p0, Lcom/google/android/material/color/utilities/ViewingConditions;->nc:D

    .line 196
    iput-object p13, p0, Lcom/google/android/material/color/utilities/ViewingConditions;->rgbD:[D

    .line 197
    iput-wide p14, p0, Lcom/google/android/material/color/utilities/ViewingConditions;->fl:D

    move-wide/from16 p1, p16

    .line 198
    iput-wide p1, p0, Lcom/google/android/material/color/utilities/ViewingConditions;->flRoot:D

    move-wide/from16 p1, p18

    .line 199
    iput-wide p1, p0, Lcom/google/android/material/color/utilities/ViewingConditions;->z:D

    return-void
.end method

.method static make([DDDDZ)Lcom/google/android/material/color/utilities/ViewingConditions;
    .locals 39

    move-wide/from16 v0, p1

    .line 127
    sget-object v2, Lcom/google/android/material/color/utilities/Cam16;->XYZ_TO_CAM16RGB:[[D

    const/4 v3, 0x0

    .line 129
    aget-wide v4, p0, v3

    aget-object v6, v2, v3

    aget-wide v7, v6, v3

    mul-double v7, v7, v4

    const/4 v9, 0x1

    aget-wide v10, p0, v9

    aget-wide v12, v6, v9

    mul-double v12, v12, v10

    add-double/2addr v7, v12

    const/4 v12, 0x2

    aget-wide v13, p0, v12

    aget-wide v15, v6, v12

    mul-double v15, v15, v13

    add-double/2addr v7, v15

    .line 130
    aget-object v6, v2, v9

    aget-wide v15, v6, v3

    mul-double v15, v15, v4

    aget-wide v17, v6, v9

    mul-double v17, v17, v10

    add-double v15, v15, v17

    aget-wide v17, v6, v12

    mul-double v17, v17, v13

    add-double v15, v15, v17

    .line 131
    aget-object v2, v2, v12

    aget-wide v17, v2, v3

    mul-double v4, v4, v17

    aget-wide v17, v2, v9

    mul-double v10, v10, v17

    add-double/2addr v4, v10

    aget-wide v10, v2, v12

    mul-double v13, v13, v10

    add-double/2addr v4, v13

    const-wide/high16 v10, 0x4024000000000000L    # 10.0

    div-double v13, p5, v10

    const-wide v17, 0x3fe999999999999aL    # 0.8

    add-double v30, v13, v17

    const-wide v13, 0x3feccccccccccccdL    # 0.9

    cmpl-double v2, v30, v13

    if-ltz v2, :cond_0

    sub-double v13, v30, v13

    mul-double v21, v13, v10

    const-wide v17, 0x3fe2e147ae147ae1L    # 0.59

    const-wide v19, 0x3fe6147ae147ae14L    # 0.69

    .line 135
    invoke-static/range {v17 .. v22}, Lcom/google/android/material/color/utilities/MathUtils;->lerp(DDD)D

    move-result-wide v10

    goto :goto_0

    :cond_0
    sub-double v13, v30, v17

    mul-double v21, v13, v10

    const-wide v17, 0x3fe0cccccccccccdL    # 0.525

    const-wide v19, 0x3fe2e147ae147ae1L    # 0.59

    .line 136
    invoke-static/range {v17 .. v22}, Lcom/google/android/material/color/utilities/MathUtils;->lerp(DDD)D

    move-result-wide v10

    :goto_0
    move-wide/from16 v28, v10

    const-wide/high16 v10, 0x3ff0000000000000L    # 1.0

    if-eqz p7, :cond_1

    move-wide/from16 v21, v10

    goto :goto_1

    :cond_1
    neg-double v13, v0

    const-wide/high16 v17, 0x4045000000000000L    # 42.0

    sub-double v13, v13, v17

    const-wide/high16 v17, 0x4057000000000000L    # 92.0

    div-double v13, v13, v17

    .line 140
    invoke-static {v13, v14}, Ljava/lang/Math;->exp(D)D

    move-result-wide v13

    const-wide v17, 0x3fd1c71c71c71c72L    # 0.2777777777777778

    mul-double v13, v13, v17

    sub-double v13, v10, v13

    mul-double v13, v13, v30

    move-wide/from16 v21, v13

    :goto_1
    const-wide/16 v17, 0x0

    const-wide/high16 v19, 0x3ff0000000000000L    # 1.0

    .line 141
    invoke-static/range {v17 .. v22}, Lcom/google/android/material/color/utilities/MathUtils;->clampDouble(DDD)D

    move-result-wide v13

    const-wide/high16 v17, 0x4059000000000000L    # 100.0

    div-double v19, v17, v7

    mul-double v19, v19, v13

    add-double v19, v19, v10

    sub-double v19, v19, v13

    div-double v21, v17, v15

    mul-double v21, v21, v13

    add-double v21, v21, v10

    sub-double v21, v21, v13

    div-double v23, v17, v4

    mul-double v23, v23, v13

    add-double v23, v23, v10

    sub-double v23, v23, v13

    const/4 v2, 0x3

    .line 143
    new-array v6, v2, [D

    aput-wide v19, v6, v3

    aput-wide v21, v6, v9

    aput-wide v23, v6, v12

    const-wide/high16 v13, 0x4014000000000000L    # 5.0

    mul-double v13, v13, v0

    add-double v19, v13, v10

    div-double v19, v10, v19

    mul-double v21, v19, v19

    mul-double v21, v21, v19

    mul-double v21, v21, v19

    sub-double v10, v10, v21

    mul-double v21, v21, v0

    const-wide v0, 0x3fb999999999999aL    # 0.1

    mul-double v0, v0, v10

    mul-double v0, v0, v10

    .line 150
    invoke-static {v13, v14}, Ljava/lang/Math;->cbrt(D)D

    move-result-wide v10

    mul-double v0, v0, v10

    add-double v0, v21, v0

    .line 151
    invoke-static/range {p3 .. p4}, Lcom/google/android/material/color/utilities/ColorUtils;->yFromLstar(D)D

    move-result-wide v10

    aget-wide v13, p0, v9

    div-double/2addr v10, v13

    const-wide v13, 0x3ff7ae147ae147aeL    # 1.48

    .line 152
    invoke-static {v10, v11}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v19

    add-double v37, v19, v13

    const-wide v13, 0x3fc999999999999aL    # 0.2

    .line 153
    invoke-static {v10, v11, v13, v14}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v13

    const-wide v19, 0x3fe7333333333333L    # 0.725

    div-double v24, v19, v13

    .line 155
    aget-wide v13, v6, v3

    mul-double v13, v13, v0

    mul-double v13, v13, v7

    div-double v13, v13, v17

    const-wide v7, 0x3fdae147ae147ae1L    # 0.42

    .line 157
    invoke-static {v13, v14, v7, v8}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v13

    aget-wide v19, v6, v9

    mul-double v19, v19, v0

    mul-double v19, v19, v15

    move-wide/from16 v21, v4

    const/4 v15, 0x0

    div-double v3, v19, v17

    .line 158
    invoke-static {v3, v4, v7, v8}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v3

    aget-wide v19, v6, v12

    mul-double v19, v19, v0

    mul-double v19, v19, v21

    move-wide/from16 p0, v10

    const/4 v5, 0x1

    div-double v9, v19, v17

    .line 159
    invoke-static {v9, v10, v7, v8}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v7

    new-array v9, v2, [D

    aput-wide v13, v9, v15

    aput-wide v3, v9, v5

    aput-wide v7, v9, v12

    .line 162
    aget-wide v3, v9, v15

    const-wide/high16 v7, 0x4079000000000000L    # 400.0

    mul-double v10, v3, v7

    const-wide v13, 0x403b2147ae147ae1L    # 27.13

    add-double/2addr v3, v13

    div-double/2addr v10, v3

    aget-wide v3, v9, v5

    mul-double v16, v3, v7

    add-double/2addr v3, v13

    div-double v16, v16, v3

    aget-wide v3, v9, v12

    mul-double v7, v7, v3

    add-double/2addr v3, v13

    div-double/2addr v7, v3

    new-array v2, v2, [D

    aput-wide v10, v2, v15

    aput-wide v16, v2, v5

    aput-wide v7, v2, v12

    const-wide/high16 v3, 0x4000000000000000L    # 2.0

    .line 169
    aget-wide v7, v2, v15

    mul-double v7, v7, v3

    aget-wide v3, v2, v5

    add-double/2addr v7, v3

    const-wide v3, 0x3fa999999999999aL    # 0.05

    aget-wide v9, v2, v12

    mul-double v9, v9, v3

    add-double/2addr v7, v9

    mul-double v22, v7, v24

    .line 170
    new-instance v19, Lcom/google/android/material/color/utilities/ViewingConditions;

    const-wide/high16 v2, 0x3fd0000000000000L    # 0.25

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v35

    move-wide/from16 v26, v24

    move-wide/from16 v20, p0

    move-wide/from16 v33, v0

    move-object/from16 v32, v6

    invoke-direct/range {v19 .. v38}, Lcom/google/android/material/color/utilities/ViewingConditions;-><init>(DDDDDD[DDDD)V

    return-object v19
.end method


# virtual methods
.method public getAw()D
    .locals 2

    .line 63
    iget-wide v0, p0, Lcom/google/android/material/color/utilities/ViewingConditions;->aw:D

    return-wide v0
.end method

.method getC()D
    .locals 2

    .line 79
    iget-wide v0, p0, Lcom/google/android/material/color/utilities/ViewingConditions;->c:D

    return-wide v0
.end method

.method getFl()D
    .locals 2

    .line 91
    iget-wide v0, p0, Lcom/google/android/material/color/utilities/ViewingConditions;->fl:D

    return-wide v0
.end method

.method public getFlRoot()D
    .locals 2

    .line 95
    iget-wide v0, p0, Lcom/google/android/material/color/utilities/ViewingConditions;->flRoot:D

    return-wide v0
.end method

.method public getN()D
    .locals 2

    .line 67
    iget-wide v0, p0, Lcom/google/android/material/color/utilities/ViewingConditions;->n:D

    return-wide v0
.end method

.method public getNbb()D
    .locals 2

    .line 71
    iget-wide v0, p0, Lcom/google/android/material/color/utilities/ViewingConditions;->nbb:D

    return-wide v0
.end method

.method getNc()D
    .locals 2

    .line 83
    iget-wide v0, p0, Lcom/google/android/material/color/utilities/ViewingConditions;->nc:D

    return-wide v0
.end method

.method getNcb()D
    .locals 2

    .line 75
    iget-wide v0, p0, Lcom/google/android/material/color/utilities/ViewingConditions;->ncb:D

    return-wide v0
.end method

.method public getRgbD()[D
    .locals 1

    .line 87
    iget-object v0, p0, Lcom/google/android/material/color/utilities/ViewingConditions;->rgbD:[D

    return-object v0
.end method

.method getZ()D
    .locals 2

    .line 99
    iget-wide v0, p0, Lcom/google/android/material/color/utilities/ViewingConditions;->z:D

    return-wide v0
.end method
