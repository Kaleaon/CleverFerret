.class public final Lcom/google/android/material/color/utilities/QuantizerWsmeans;
.super Ljava/lang/Object;
.source "QuantizerWsmeans.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/material/color/utilities/QuantizerWsmeans$Distance;
    }
.end annotation


# static fields
.field private static final MAX_ITERATIONS:I = 0xa

.field private static final MIN_MOVEMENT_DISTANCE:D = 3.0


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static quantize([I[II)Ljava/util/Map;
    .locals 26
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([I[II)",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 78
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 79
    array-length v3, v0

    new-array v3, v3, [[D

    .line 80
    array-length v4, v0

    new-array v4, v4, [I

    .line 81
    new-instance v5, Lcom/google/android/material/color/utilities/PointProviderLab;

    invoke-direct {v5}, Lcom/google/android/material/color/utilities/PointProviderLab;-><init>()V

    const/4 v7, 0x0

    const/4 v8, 0x0

    .line 84
    :goto_0
    array-length v9, v0

    const/4 v10, 0x1

    if-ge v7, v9, :cond_1

    .line 85
    aget v9, v0, v7

    .line 86
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-interface {v2, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Integer;

    if-nez v11, :cond_0

    .line 88
    invoke-interface {v5, v9}, Lcom/google/android/material/color/utilities/PointProvider;->fromInt(I)[D

    move-result-object v11

    aput-object v11, v3, v8

    .line 89
    aput v9, v4, v8

    add-int/lit8 v8, v8, 0x1

    .line 92
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-interface {v2, v9, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 94
    :cond_0
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    add-int/2addr v11, v10

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-interface {v2, v9, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_1
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 98
    :cond_1
    new-array v0, v8, [I

    const/4 v7, 0x0

    :goto_2
    if-ge v7, v8, :cond_2

    .line 100
    aget v9, v4, v7

    .line 101
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v2, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    .line 102
    aput v9, v0, v7

    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    :cond_2
    move/from16 v7, p2

    .line 105
    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 106
    array-length v4, v1

    if-eqz v4, :cond_3

    .line 107
    array-length v4, v1

    invoke-static {v2, v4}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 110
    :cond_3
    new-array v4, v2, [[D

    const/4 v7, 0x0

    const/4 v9, 0x0

    .line 112
    :goto_3
    array-length v11, v1

    if-ge v7, v11, :cond_4

    .line 113
    aget v11, v1, v7

    invoke-interface {v5, v11}, Lcom/google/android/material/color/utilities/PointProvider;->fromInt(I)[D

    move-result-object v11

    aput-object v11, v4, v7

    add-int/lit8 v9, v9, 0x1

    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    :cond_4
    sub-int v1, v2, v9

    if-lez v1, :cond_5

    const/4 v7, 0x0

    :goto_4
    if-ge v7, v1, :cond_5

    add-int/lit8 v7, v7, 0x1

    goto :goto_4

    .line 122
    :cond_5
    new-array v1, v8, [I

    const/4 v7, 0x0

    :goto_5
    if-ge v7, v8, :cond_6

    .line 124
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v11

    int-to-double v13, v2

    mul-double v11, v11, v13

    invoke-static {v11, v12}, Ljava/lang/Math;->floor(D)D

    move-result-wide v11

    double-to-int v9, v11

    aput v9, v1, v7

    add-int/lit8 v7, v7, 0x1

    goto :goto_5

    .line 127
    :cond_6
    new-array v7, v2, [[I

    const/4 v9, 0x0

    :goto_6
    if-ge v9, v2, :cond_7

    .line 129
    new-array v11, v2, [I

    aput-object v11, v7, v9

    add-int/lit8 v9, v9, 0x1

    goto :goto_6

    .line 132
    :cond_7
    new-array v9, v2, [[Lcom/google/android/material/color/utilities/QuantizerWsmeans$Distance;

    const/4 v11, 0x0

    :goto_7
    if-ge v11, v2, :cond_9

    .line 134
    new-array v12, v2, [Lcom/google/android/material/color/utilities/QuantizerWsmeans$Distance;

    aput-object v12, v9, v11

    const/4 v12, 0x0

    :goto_8
    if-ge v12, v2, :cond_8

    .line 136
    aget-object v13, v9, v11

    new-instance v14, Lcom/google/android/material/color/utilities/QuantizerWsmeans$Distance;

    invoke-direct {v14}, Lcom/google/android/material/color/utilities/QuantizerWsmeans$Distance;-><init>()V

    aput-object v14, v13, v12

    add-int/lit8 v12, v12, 0x1

    goto :goto_8

    :cond_8
    add-int/lit8 v11, v11, 0x1

    goto :goto_7

    .line 140
    :cond_9
    new-array v11, v2, [I

    const/4 v12, 0x0

    :goto_9
    const/16 v13, 0xa

    if-ge v12, v13, :cond_16

    const/4 v13, 0x0

    :goto_a
    if-ge v13, v2, :cond_c

    add-int/lit8 v14, v13, 0x1

    move v15, v14

    :goto_b
    if-ge v15, v2, :cond_a

    const/16 v16, 0x1

    .line 144
    aget-object v10, v4, v13

    aget-object v6, v4, v15

    move-object/from16 p0, v0

    move-object/from16 p1, v1

    invoke-interface {v5, v10, v6}, Lcom/google/android/material/color/utilities/PointProvider;->distance([D[D)D

    move-result-wide v0

    .line 145
    aget-object v6, v9, v15

    aget-object v6, v6, v13

    iput-wide v0, v6, Lcom/google/android/material/color/utilities/QuantizerWsmeans$Distance;->distance:D

    .line 146
    aget-object v6, v9, v15

    aget-object v6, v6, v13

    iput v13, v6, Lcom/google/android/material/color/utilities/QuantizerWsmeans$Distance;->index:I

    .line 147
    aget-object v6, v9, v13

    aget-object v6, v6, v15

    iput-wide v0, v6, Lcom/google/android/material/color/utilities/QuantizerWsmeans$Distance;->distance:D

    .line 148
    aget-object v0, v9, v13

    aget-object v0, v0, v15

    iput v15, v0, Lcom/google/android/material/color/utilities/QuantizerWsmeans$Distance;->index:I

    add-int/lit8 v15, v15, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const/4 v10, 0x1

    goto :goto_b

    :cond_a
    move-object/from16 p0, v0

    move-object/from16 p1, v1

    const/16 v16, 0x1

    .line 150
    aget-object v0, v9, v13

    invoke-static {v0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    const/4 v0, 0x0

    :goto_c
    if-ge v0, v2, :cond_b

    .line 152
    aget-object v1, v7, v13

    aget-object v6, v9, v13

    aget-object v6, v6, v0

    iget v6, v6, Lcom/google/android/material/color/utilities/QuantizerWsmeans$Distance;->index:I

    aput v6, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    :cond_b
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move v13, v14

    const/4 v10, 0x1

    goto :goto_a

    :cond_c
    move-object/from16 p0, v0

    move-object/from16 p1, v1

    const/16 v16, 0x1

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_d
    if-ge v0, v8, :cond_11

    .line 158
    aget-object v6, v3, v0

    .line 159
    aget v10, p1, v0

    .line 160
    aget-object v13, v4, v10

    .line 161
    invoke-interface {v5, v6, v13}, Lcom/google/android/material/color/utilities/PointProvider;->distance([D[D)D

    move-result-wide v13

    move/from16 v18, v0

    move-wide/from16 v19, v13

    const/4 v0, -0x1

    const/4 v15, 0x0

    :goto_e
    if-ge v15, v2, :cond_f

    .line 166
    aget-object v21, v9, v10

    move/from16 v22, v1

    aget-object v1, v21, v15

    move-object/from16 v21, v3

    move-object/from16 v23, v4

    iget-wide v3, v1, Lcom/google/android/material/color/utilities/QuantizerWsmeans$Distance;->distance:D

    const-wide/high16 v24, 0x4010000000000000L    # 4.0

    mul-double v24, v24, v13

    cmpl-double v1, v3, v24

    if-ltz v1, :cond_d

    goto :goto_f

    .line 169
    :cond_d
    aget-object v1, v23, v15

    invoke-interface {v5, v6, v1}, Lcom/google/android/material/color/utilities/PointProvider;->distance([D[D)D

    move-result-wide v3

    cmpg-double v1, v3, v19

    if-gez v1, :cond_e

    move-wide/from16 v19, v3

    move v0, v15

    :cond_e
    :goto_f
    add-int/lit8 v15, v15, 0x1

    move-object/from16 v3, v21

    move/from16 v1, v22

    move-object/from16 v4, v23

    goto :goto_e

    :cond_f
    move/from16 v22, v1

    move-object/from16 v21, v3

    move-object/from16 v23, v4

    const/4 v1, -0x1

    if-eq v0, v1, :cond_10

    .line 177
    invoke-static/range {v19 .. v20}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v3

    invoke-static {v13, v14}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v13

    sub-double/2addr v3, v13

    invoke-static {v3, v4}, Ljava/lang/Math;->abs(D)D

    move-result-wide v3

    const-wide/high16 v13, 0x4008000000000000L    # 3.0

    cmpl-double v1, v3, v13

    if-lez v1, :cond_10

    add-int/lit8 v1, v22, 0x1

    .line 180
    aput v0, p1, v18

    goto :goto_10

    :cond_10
    move/from16 v1, v22

    :goto_10
    add-int/lit8 v0, v18, 0x1

    move-object/from16 v3, v21

    move-object/from16 v4, v23

    goto :goto_d

    :cond_11
    move/from16 v22, v1

    move-object/from16 v21, v3

    move-object/from16 v23, v4

    if-nez v22, :cond_12

    if-eqz v12, :cond_12

    goto/16 :goto_14

    .line 189
    :cond_12
    new-array v0, v2, [D

    .line 190
    new-array v1, v2, [D

    .line 191
    new-array v3, v2, [D

    const/4 v4, 0x0

    .line 192
    invoke-static {v11, v4}, Ljava/util/Arrays;->fill([II)V

    const/4 v6, 0x0

    :goto_11
    if-ge v6, v8, :cond_13

    .line 194
    aget v13, p1, v6

    .line 195
    aget-object v14, v21, v6

    .line 196
    aget v15, p0, v6

    .line 197
    aget v17, v11, v13

    add-int v17, v17, v15

    aput v17, v11, v13

    .line 198
    aget-wide v18, v0, v13

    aget-wide v24, v14, v4

    move-object v4, v11

    const/16 p2, 0x2

    int-to-double v10, v15

    mul-double v24, v24, v10

    add-double v18, v18, v24

    aput-wide v18, v0, v13

    .line 199
    aget-wide v18, v1, v13

    aget-wide v24, v14, v16

    mul-double v24, v24, v10

    add-double v18, v18, v24

    aput-wide v18, v1, v13

    .line 200
    aget-wide v18, v3, v13

    aget-wide v24, v14, p2

    mul-double v24, v24, v10

    add-double v18, v18, v24

    aput-wide v18, v3, v13

    add-int/lit8 v6, v6, 0x1

    move-object v11, v4

    const/4 v4, 0x0

    goto :goto_11

    :cond_13
    move-object v4, v11

    const/16 p2, 0x2

    const/4 v6, 0x0

    :goto_12
    if-ge v6, v2, :cond_15

    .line 204
    aget v10, v4, v6

    if-nez v10, :cond_14

    const/4 v10, 0x3

    .line 206
    new-array v10, v10, [D

    fill-array-data v10, :array_0

    aput-object v10, v23, v6

    const/16 v17, 0x0

    goto :goto_13

    .line 209
    :cond_14
    aget-wide v13, v0, v6

    int-to-double v10, v10

    div-double/2addr v13, v10

    .line 210
    aget-wide v18, v1, v6

    div-double v18, v18, v10

    .line 211
    aget-wide v24, v3, v6

    div-double v24, v24, v10

    .line 212
    aget-object v10, v23, v6

    const/16 v17, 0x0

    aput-wide v13, v10, v17

    .line 213
    aput-wide v18, v10, v16

    .line 214
    aput-wide v24, v10, p2

    :goto_13
    add-int/lit8 v6, v6, 0x1

    goto :goto_12

    :cond_15
    const/16 v17, 0x0

    add-int/lit8 v12, v12, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object v11, v4

    move-object/from16 v3, v21

    move-object/from16 v4, v23

    const/4 v10, 0x1

    goto/16 :goto_9

    :cond_16
    move-object/from16 v23, v4

    :goto_14
    move-object v4, v11

    const/16 v17, 0x0

    .line 218
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const/4 v6, 0x0

    :goto_15
    if-ge v6, v2, :cond_19

    .line 220
    aget v1, v4, v6

    if-nez v1, :cond_17

    goto :goto_16

    .line 225
    :cond_17
    aget-object v3, v23, v6

    invoke-interface {v5, v3}, Lcom/google/android/material/color/utilities/PointProvider;->toInt([D)I

    move-result v3

    .line 226
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v0, v7}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_18

    goto :goto_16

    .line 230
    :cond_18
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_16
    add-int/lit8 v6, v6, 0x1

    goto :goto_15

    :cond_19
    return-object v0

    :array_0
    .array-data 8
        0x0
        0x0
        0x0
    .end array-data
.end method
