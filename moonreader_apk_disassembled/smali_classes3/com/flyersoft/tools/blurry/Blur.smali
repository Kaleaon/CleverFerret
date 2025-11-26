.class Lcom/flyersoft/tools/blurry/Blur;
.super Ljava/lang/Object;
.source "Blur.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static of(Landroid/content/Context;Landroid/graphics/Bitmap;Lcom/flyersoft/tools/blurry/BlurFactor;)Landroid/graphics/Bitmap;
    .locals 6

    .line 45
    iget v0, p2, Lcom/flyersoft/tools/blurry/BlurFactor;->width:I

    iget v1, p2, Lcom/flyersoft/tools/blurry/BlurFactor;->sampling:I

    div-int/2addr v0, v1

    .line 46
    iget v1, p2, Lcom/flyersoft/tools/blurry/BlurFactor;->height:I

    iget v2, p2, Lcom/flyersoft/tools/blurry/BlurFactor;->sampling:I

    div-int/2addr v1, v2

    .line 48
    filled-new-array {v0, v1}, [I

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/tools/blurry/Helper;->hasZero([I)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 52
    :cond_0
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 54
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 55
    iget v2, p2, Lcom/flyersoft/tools/blurry/BlurFactor;->sampling:I

    int-to-float v2, v2

    const/high16 v3, 0x3f800000    # 1.0f

    div-float v2, v3, v2

    iget v4, p2, Lcom/flyersoft/tools/blurry/BlurFactor;->sampling:I

    int-to-float v4, v4

    div-float/2addr v3, v4

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Canvas;->scale(FF)V

    .line 56
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    const/4 v3, 0x3

    .line 57
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setFlags(I)V

    .line 58
    new-instance v3, Landroid/graphics/PorterDuffColorFilter;

    iget v4, p2, Lcom/flyersoft/tools/blurry/BlurFactor;->color:I

    sget-object v5, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v3, v4, v5}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    .line 60
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    const/4 v3, 0x0

    .line 61
    invoke-virtual {v1, p1, v3, v3, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    const/4 p1, 0x1

    .line 64
    :try_start_0
    iget v1, p2, Lcom/flyersoft/tools/blurry/BlurFactor;->radius:I

    invoke-static {p0, v0, v1}, Lcom/flyersoft/tools/blurry/Blur;->rs(Landroid/content/Context;Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    move-result-object p0
    :try_end_0
    .catch Landroid/renderscript/RSRuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 66
    :catch_0
    iget p0, p2, Lcom/flyersoft/tools/blurry/BlurFactor;->radius:I

    invoke-static {v0, p0, p1}, Lcom/flyersoft/tools/blurry/Blur;->stack(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    move-result-object p0

    .line 69
    :goto_0
    iget v0, p2, Lcom/flyersoft/tools/blurry/BlurFactor;->sampling:I

    if-ne v0, p1, :cond_1

    return-object p0

    .line 72
    :cond_1
    iget v0, p2, Lcom/flyersoft/tools/blurry/BlurFactor;->width:I

    iget p2, p2, Lcom/flyersoft/tools/blurry/BlurFactor;->height:I

    invoke-static {p0, v0, p2, p1}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 73
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    return-object p1
.end method

.method public static of(Landroid/view/View;Lcom/flyersoft/tools/blurry/BlurFactor;)Landroid/graphics/Bitmap;
    .locals 1

    const/4 v0, 0x1

    .line 35
    invoke-virtual {p0, v0}, Landroid/view/View;->setDrawingCacheEnabled(Z)V

    .line 36
    invoke-virtual {p0}, Landroid/view/View;->destroyDrawingCache()V

    const/high16 v0, 0x80000

    .line 37
    invoke-virtual {p0, v0}, Landroid/view/View;->setDrawingCacheQuality(I)V

    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getDrawingCache()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 39
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, v0, p1}, Lcom/flyersoft/tools/blurry/Blur;->of(Landroid/content/Context;Landroid/graphics/Bitmap;Lcom/flyersoft/tools/blurry/BlurFactor;)Landroid/graphics/Bitmap;

    move-result-object p0

    .line 40
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    return-object p0
.end method

.method private static rs(Landroid/content/Context;Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/renderscript/RSRuntimeException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 84
    :try_start_0
    invoke-static {p0}, Landroid/renderscript/RenderScript;->create(Landroid/content/Context;)Landroid/renderscript/RenderScript;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 85
    :try_start_1
    new-instance v1, Landroid/renderscript/RenderScript$RSMessageHandler;

    invoke-direct {v1}, Landroid/renderscript/RenderScript$RSMessageHandler;-><init>()V

    invoke-virtual {p0, v1}, Landroid/renderscript/RenderScript;->setMessageHandler(Landroid/renderscript/RenderScript$RSMessageHandler;)V

    .line 86
    sget-object v1, Landroid/renderscript/Allocation$MipmapControl;->MIPMAP_NONE:Landroid/renderscript/Allocation$MipmapControl;

    const/4 v2, 0x1

    invoke-static {p0, p1, v1, v2}, Landroid/renderscript/Allocation;->createFromBitmap(Landroid/renderscript/RenderScript;Landroid/graphics/Bitmap;Landroid/renderscript/Allocation$MipmapControl;I)Landroid/renderscript/Allocation;

    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 88
    :try_start_2
    invoke-virtual {v1}, Landroid/renderscript/Allocation;->getType()Landroid/renderscript/Type;

    move-result-object v2

    invoke-static {p0, v2}, Landroid/renderscript/Allocation;->createTyped(Landroid/renderscript/RenderScript;Landroid/renderscript/Type;)Landroid/renderscript/Allocation;

    move-result-object v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 89
    :try_start_3
    invoke-static {p0}, Landroid/renderscript/Element;->U8_4(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v3

    invoke-static {p0, v3}, Landroid/renderscript/ScriptIntrinsicBlur;->create(Landroid/renderscript/RenderScript;Landroid/renderscript/Element;)Landroid/renderscript/ScriptIntrinsicBlur;

    move-result-object v0

    .line 91
    invoke-virtual {v0, v1}, Landroid/renderscript/ScriptIntrinsicBlur;->setInput(Landroid/renderscript/Allocation;)V

    int-to-float p2, p2

    .line 92
    invoke-virtual {v0, p2}, Landroid/renderscript/ScriptIntrinsicBlur;->setRadius(F)V

    .line 93
    invoke-virtual {v0, v2}, Landroid/renderscript/ScriptIntrinsicBlur;->forEach(Landroid/renderscript/Allocation;)V

    .line 94
    invoke-virtual {v2, p1}, Landroid/renderscript/Allocation;->copyTo(Landroid/graphics/Bitmap;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz p0, :cond_0

    .line 97
    invoke-virtual {p0}, Landroid/renderscript/RenderScript;->destroy()V

    :cond_0
    if-eqz v1, :cond_1

    .line 100
    invoke-virtual {v1}, Landroid/renderscript/Allocation;->destroy()V

    :cond_1
    if-eqz v2, :cond_2

    .line 103
    invoke-virtual {v2}, Landroid/renderscript/Allocation;->destroy()V

    :cond_2
    if-eqz v0, :cond_3

    .line 106
    invoke-virtual {v0}, Landroid/renderscript/ScriptIntrinsicBlur;->destroy()V

    :cond_3
    return-object p1

    :catchall_0
    move-exception p1

    move-object v4, v0

    move-object v0, p0

    move-object p0, v4

    goto :goto_1

    :catchall_1
    move-exception p1

    move-object v2, v0

    goto :goto_0

    :catchall_2
    move-exception p1

    move-object v1, v0

    move-object v2, v1

    :goto_0
    move-object v0, p0

    move-object p0, v2

    goto :goto_1

    :catchall_3
    move-exception p1

    move-object p0, v0

    move-object v1, p0

    move-object v2, v1

    :goto_1
    if-eqz v0, :cond_4

    .line 97
    invoke-virtual {v0}, Landroid/renderscript/RenderScript;->destroy()V

    :cond_4
    if-eqz v1, :cond_5

    .line 100
    invoke-virtual {v1}, Landroid/renderscript/Allocation;->destroy()V

    :cond_5
    if-eqz v2, :cond_6

    .line 103
    invoke-virtual {v2}, Landroid/renderscript/Allocation;->destroy()V

    :cond_6
    if-eqz p0, :cond_7

    .line 106
    invoke-virtual {p0}, Landroid/renderscript/ScriptIntrinsicBlur;->destroy()V

    .line 108
    :cond_7
    throw p1
.end method

.method private static stack(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;
    .locals 37

    move/from16 v0, p1

    const/4 v1, 0x1

    if-eqz p2, :cond_0

    move-object/from16 v3, p0

    goto :goto_0

    .line 147
    :cond_0
    invoke-virtual/range {p0 .. p0}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v2

    move-object/from16 v3, p0

    invoke-virtual {v3, v2, v1}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object v2

    move-object v3, v2

    :goto_0
    if-ge v0, v1, :cond_1

    const/4 v0, 0x0

    return-object v0

    .line 154
    :cond_1
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    .line 155
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v10

    mul-int v2, v6, v10

    .line 157
    new-array v4, v2, [I

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v5, 0x0

    move v9, v6

    .line 158
    invoke-virtual/range {v3 .. v10}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    add-int/lit8 v5, v6, -0x1

    add-int/lit8 v7, v10, -0x1

    add-int v8, v0, v0

    add-int/lit8 v9, v8, 0x1

    .line 165
    new-array v11, v2, [I

    .line 166
    new-array v12, v2, [I

    .line 167
    new-array v2, v2, [I

    .line 169
    invoke-static {v6, v10}, Ljava/lang/Math;->max(II)I

    move-result v13

    new-array v13, v13, [I

    const/4 v14, 0x2

    add-int/2addr v8, v14

    shr-int/2addr v8, v1

    mul-int v8, v8, v8

    mul-int/lit16 v15, v8, 0x100

    const/16 v16, 0x1

    .line 173
    new-array v1, v15, [I

    const/16 p2, 0x0

    const/4 v14, 0x0

    :goto_1
    if-ge v14, v15, :cond_2

    .line 175
    div-int v17, v14, v8

    aput v17, v1, v14

    add-int/lit8 v14, v14, 0x1

    goto :goto_1

    :cond_2
    const/4 v14, 0x2

    .line 180
    new-array v8, v14, [I

    const/4 v14, 0x3

    aput v14, v8, v16

    aput v9, v8, p2

    sget-object v14, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v14, v8}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [[I

    add-int/lit8 v14, v0, 0x1

    const/4 v15, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    :goto_2
    if-ge v15, v10, :cond_7

    move-object/from16 v19, v1

    neg-int v1, v0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x0

    :goto_3
    const v29, 0xff00

    const/high16 v30, 0xff0000

    if-gt v1, v0, :cond_4

    move-object/from16 v31, v2

    move-object/from16 v32, v3

    const/4 v2, 0x0

    .line 192
    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-static {v5, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    add-int v3, v17, v3

    aget v3, v4, v3

    add-int v33, v1, v0

    .line 193
    aget-object v33, v8, v33

    and-int v30, v3, v30

    shr-int/lit8 v30, v30, 0x10

    .line 194
    aput v30, v33, v2

    and-int v29, v3, v29

    shr-int/lit8 v29, v29, 0x8

    .line 195
    aput v29, v33, v16

    and-int/lit16 v3, v3, 0xff

    const/16 v29, 0x2

    .line 196
    aput v3, v33, v29

    .line 197
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v3

    sub-int v3, v14, v3

    .line 198
    aget v30, v33, v2

    mul-int v2, v30, v3

    add-int v28, v28, v2

    .line 199
    aget v2, v33, v16

    mul-int v34, v2, v3

    add-int v20, v20, v34

    .line 200
    aget v33, v33, v29

    mul-int v3, v3, v33

    add-int v21, v21, v3

    if-lez v1, :cond_3

    add-int v25, v25, v30

    add-int v26, v26, v2

    add-int v27, v27, v33

    goto :goto_4

    :cond_3
    add-int v22, v22, v30

    add-int v23, v23, v2

    add-int v24, v24, v33

    :goto_4
    add-int/lit8 v1, v1, 0x1

    move-object/from16 v2, v31

    move-object/from16 v3, v32

    const/16 p2, 0x0

    goto :goto_3

    :cond_4
    move-object/from16 v31, v2

    move-object/from16 v32, v3

    move v2, v0

    const/4 v1, 0x0

    :goto_5
    if-ge v1, v6, :cond_6

    .line 215
    aget v3, v19, v28

    aput v3, v11, v17

    .line 216
    aget v3, v19, v20

    aput v3, v12, v17

    .line 217
    aget v3, v19, v21

    aput v3, v31, v17

    sub-int v28, v28, v22

    sub-int v20, v20, v23

    sub-int v21, v21, v24

    sub-int v3, v2, v0

    add-int/2addr v3, v9

    .line 224
    rem-int/2addr v3, v9

    aget-object v3, v8, v3

    const/16 v33, 0x0

    .line 226
    aget v34, v3, v33

    sub-int v22, v22, v34

    .line 227
    aget v33, v3, v16

    sub-int v23, v23, v33

    const/16 v33, 0x2

    .line 228
    aget v34, v3, v33

    sub-int v24, v24, v34

    if-nez v15, :cond_5

    add-int v33, v1, v0

    move/from16 v34, v1

    add-int/lit8 v1, v33, 0x1

    .line 231
    invoke-static {v1, v5}, Ljava/lang/Math;->min(II)I

    move-result v1

    aput v1, v13, v34

    goto :goto_6

    :cond_5
    move/from16 v34, v1

    .line 233
    :goto_6
    aget v1, v13, v34

    add-int v1, v18, v1

    aget v1, v4, v1

    and-int v33, v1, v30

    shr-int/lit8 v33, v33, 0x10

    const/16 v35, 0x0

    .line 235
    aput v33, v3, v35

    and-int v35, v1, v29

    shr-int/lit8 v35, v35, 0x8

    .line 236
    aput v35, v3, v16

    and-int/lit16 v1, v1, 0xff

    const/16 v36, 0x2

    .line 237
    aput v1, v3, v36

    add-int v25, v25, v33

    add-int v26, v26, v35

    add-int v27, v27, v1

    add-int v28, v28, v25

    add-int v20, v20, v26

    add-int v21, v21, v27

    add-int/lit8 v2, v2, 0x1

    .line 247
    rem-int/2addr v2, v9

    .line 248
    rem-int v1, v2, v9

    aget-object v1, v8, v1

    const/16 v33, 0x0

    .line 250
    aget v3, v1, v33

    add-int v22, v22, v3

    .line 251
    aget v33, v1, v16

    add-int v23, v23, v33

    const/16 v36, 0x2

    .line 252
    aget v1, v1, v36

    add-int v24, v24, v1

    sub-int v25, v25, v3

    sub-int v26, v26, v33

    sub-int v27, v27, v1

    add-int/lit8 v17, v17, 0x1

    add-int/lit8 v1, v34, 0x1

    goto/16 :goto_5

    :cond_6
    add-int v18, v18, v6

    add-int/lit8 v15, v15, 0x1

    move-object/from16 v1, v19

    move-object/from16 v2, v31

    move-object/from16 v3, v32

    const/16 p2, 0x0

    goto/16 :goto_2

    :cond_7
    move-object/from16 v19, v1

    move-object/from16 v31, v2

    move-object/from16 v32, v3

    const/4 v2, 0x0

    :goto_7
    if-ge v2, v6, :cond_d

    neg-int v1, v0

    mul-int v3, v1, v6

    move/from16 v24, v2

    move v2, v3

    const/4 v3, 0x0

    const/4 v5, 0x0

    const/4 v15, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    :goto_8
    if-gt v1, v0, :cond_a

    const/4 v0, 0x0

    .line 266
    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v25

    add-int v25, v25, v24

    add-int v26, v1, p1

    .line 268
    aget-object v26, v8, v26

    .line 270
    aget v27, v11, v25

    aput v27, v26, v0

    .line 271
    aget v0, v12, v25

    aput v0, v26, v16

    .line 272
    aget v0, v31, v25

    const/16 v36, 0x2

    aput v0, v26, v36

    .line 274
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v0

    sub-int v0, v14, v0

    .line 276
    aget v27, v11, v25

    mul-int v27, v27, v0

    add-int v23, v23, v27

    .line 277
    aget v27, v12, v25

    mul-int v27, v27, v0

    add-int v3, v3, v27

    .line 278
    aget v25, v31, v25

    mul-int v25, v25, v0

    add-int v5, v5, v25

    if-lez v1, :cond_8

    const/16 v33, 0x0

    .line 281
    aget v0, v26, v33

    add-int v20, v20, v0

    .line 282
    aget v0, v26, v16

    add-int v21, v21, v0

    const/16 v36, 0x2

    .line 283
    aget v0, v26, v36

    add-int v22, v22, v0

    goto :goto_9

    :cond_8
    const/16 v33, 0x0

    const/16 v36, 0x2

    .line 285
    aget v0, v26, v33

    add-int/2addr v15, v0

    .line 286
    aget v0, v26, v16

    add-int v17, v17, v0

    .line 287
    aget v0, v26, v36

    add-int v18, v18, v0

    :goto_9
    if-ge v1, v7, :cond_9

    add-int/2addr v2, v6

    :cond_9
    add-int/lit8 v1, v1, 0x1

    move/from16 v0, p1

    goto :goto_8

    :cond_a
    move/from16 v1, v23

    move/from16 v0, v24

    const/4 v2, 0x0

    move/from16 v23, p1

    :goto_a
    if-ge v2, v10, :cond_c

    const/high16 v25, -0x1000000

    .line 298
    aget v26, v4, v0

    and-int v25, v26, v25

    aget v26, v19, v1

    shl-int/lit8 v26, v26, 0x10

    or-int v25, v25, v26

    aget v26, v19, v3

    shl-int/lit8 v26, v26, 0x8

    or-int v25, v25, v26

    aget v26, v19, v5

    or-int v25, v25, v26

    aput v25, v4, v0

    sub-int/2addr v1, v15

    sub-int v3, v3, v17

    sub-int v5, v5, v18

    sub-int v25, v23, p1

    add-int v25, v25, v9

    .line 305
    rem-int v25, v25, v9

    aget-object v25, v8, v25

    const/16 v33, 0x0

    .line 307
    aget v26, v25, v33

    sub-int v15, v15, v26

    .line 308
    aget v26, v25, v16

    sub-int v17, v17, v26

    const/16 v36, 0x2

    .line 309
    aget v26, v25, v36

    sub-int v18, v18, v26

    move/from16 v26, v0

    if-nez v24, :cond_b

    add-int v0, v2, v14

    .line 312
    invoke-static {v0, v7}, Ljava/lang/Math;->min(II)I

    move-result v0

    mul-int v0, v0, v6

    aput v0, v13, v2

    .line 314
    :cond_b
    aget v0, v13, v2

    add-int v0, v24, v0

    .line 316
    aget v27, v11, v0

    const/16 v33, 0x0

    aput v27, v25, v33

    .line 317
    aget v28, v12, v0

    aput v28, v25, v16

    .line 318
    aget v0, v31, v0

    const/16 v36, 0x2

    aput v0, v25, v36

    add-int v20, v20, v27

    add-int v21, v21, v28

    add-int v22, v22, v0

    add-int v1, v1, v20

    add-int v3, v3, v21

    add-int v5, v5, v22

    add-int/lit8 v23, v23, 0x1

    .line 328
    rem-int v23, v23, v9

    .line 329
    aget-object v0, v8, v23

    const/16 v33, 0x0

    .line 331
    aget v25, v0, v33

    add-int v15, v15, v25

    .line 332
    aget v27, v0, v16

    add-int v17, v17, v27

    const/16 v36, 0x2

    .line 333
    aget v0, v0, v36

    add-int v18, v18, v0

    sub-int v20, v20, v25

    sub-int v21, v21, v27

    sub-int v22, v22, v0

    add-int v0, v26, v6

    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_a

    :cond_c
    const/16 v33, 0x0

    const/16 v36, 0x2

    add-int/lit8 v2, v24, 0x1

    move/from16 v0, p1

    goto/16 :goto_7

    :cond_d
    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v5, 0x0

    move v9, v6

    move-object/from16 v3, v32

    .line 343
    invoke-virtual/range {v3 .. v10}, Landroid/graphics/Bitmap;->setPixels([IIIIIII)V

    return-object v3
.end method
