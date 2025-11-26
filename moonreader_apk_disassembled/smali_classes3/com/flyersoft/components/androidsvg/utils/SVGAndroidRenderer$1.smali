.class synthetic Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$1;
.super Ljava/lang/Object;
.source "SVGAndroidRenderer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$flyersoft$components$androidsvg$PreserveAspectRatio$Alignment:[I

.field static final synthetic $SwitchMap$com$flyersoft$components$androidsvg$utils$Style$CSSBlendMode:[I

.field static final synthetic $SwitchMap$com$flyersoft$components$androidsvg$utils$Style$LineCap:[I

.field static final synthetic $SwitchMap$com$flyersoft$components$androidsvg$utils$Style$LineJoin:[I


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 2364
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;->values()[Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$1;->$SwitchMap$com$flyersoft$components$androidsvg$utils$Style$LineJoin:[I

    const/4 v1, 0x1

    :try_start_0
    sget-object v2, Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;->Miter:Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;

    invoke-virtual {v2}, Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;->ordinal()I

    move-result v2

    aput v1, v0, v2
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    const/4 v0, 0x2

    :try_start_1
    sget-object v2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$1;->$SwitchMap$com$flyersoft$components$androidsvg$utils$Style$LineJoin:[I

    sget-object v3, Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;->Round:Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;

    invoke-virtual {v3}, Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;->ordinal()I

    move-result v3

    aput v0, v2, v3
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    const/4 v2, 0x3

    :try_start_2
    sget-object v3, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$1;->$SwitchMap$com$flyersoft$components$androidsvg$utils$Style$LineJoin:[I

    sget-object v4, Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;->Bevel:Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;

    invoke-virtual {v4}, Lcom/flyersoft/components/androidsvg/utils/Style$LineJoin;->ordinal()I

    move-result v4

    aput v2, v3, v4
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    .line 2345
    :catch_2
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/Style$LineCap;->values()[Lcom/flyersoft/components/androidsvg/utils/Style$LineCap;

    move-result-object v3

    array-length v3, v3

    new-array v3, v3, [I

    sput-object v3, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$1;->$SwitchMap$com$flyersoft$components$androidsvg$utils$Style$LineCap:[I

    :try_start_3
    sget-object v4, Lcom/flyersoft/components/androidsvg/utils/Style$LineCap;->Butt:Lcom/flyersoft/components/androidsvg/utils/Style$LineCap;

    invoke-virtual {v4}, Lcom/flyersoft/components/androidsvg/utils/Style$LineCap;->ordinal()I

    move-result v4

    aput v1, v3, v4
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    :catch_3
    :try_start_4
    sget-object v3, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$1;->$SwitchMap$com$flyersoft$components$androidsvg$utils$Style$LineCap:[I

    sget-object v4, Lcom/flyersoft/components/androidsvg/utils/Style$LineCap;->Round:Lcom/flyersoft/components/androidsvg/utils/Style$LineCap;

    invoke-virtual {v4}, Lcom/flyersoft/components/androidsvg/utils/Style$LineCap;->ordinal()I

    move-result v4

    aput v0, v3, v4
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_4

    :catch_4
    :try_start_5
    sget-object v3, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$1;->$SwitchMap$com$flyersoft$components$androidsvg$utils$Style$LineCap:[I

    sget-object v4, Lcom/flyersoft/components/androidsvg/utils/Style$LineCap;->Square:Lcom/flyersoft/components/androidsvg/utils/Style$LineCap;

    invoke-virtual {v4}, Lcom/flyersoft/components/androidsvg/utils/Style$LineCap;->ordinal()I

    move-result v4

    aput v2, v3, v4
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_5

    .line 2228
    :catch_5
    invoke-static {}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->values()[Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    move-result-object v3

    array-length v3, v3

    new-array v3, v3, [I

    sput-object v3, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$1;->$SwitchMap$com$flyersoft$components$androidsvg$PreserveAspectRatio$Alignment:[I

    :try_start_6
    sget-object v4, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->xMidYMin:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    invoke-virtual {v4}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->ordinal()I

    move-result v4

    aput v1, v3, v4
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_6

    :catch_6
    :try_start_7
    sget-object v3, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$1;->$SwitchMap$com$flyersoft$components$androidsvg$PreserveAspectRatio$Alignment:[I

    sget-object v4, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->xMidYMid:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    invoke-virtual {v4}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->ordinal()I

    move-result v4

    aput v0, v3, v4
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_7

    :catch_7
    :try_start_8
    sget-object v3, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$1;->$SwitchMap$com$flyersoft$components$androidsvg$PreserveAspectRatio$Alignment:[I

    sget-object v4, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->xMidYMax:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    invoke-virtual {v4}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->ordinal()I

    move-result v4

    aput v2, v3, v4
    :try_end_8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_8} :catch_8

    :catch_8
    const/4 v3, 0x4

    :try_start_9
    sget-object v4, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$1;->$SwitchMap$com$flyersoft$components$androidsvg$PreserveAspectRatio$Alignment:[I

    sget-object v5, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->xMaxYMin:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    invoke-virtual {v5}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->ordinal()I

    move-result v5

    aput v3, v4, v5
    :try_end_9
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_9} :catch_9

    :catch_9
    const/4 v4, 0x5

    :try_start_a
    sget-object v5, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$1;->$SwitchMap$com$flyersoft$components$androidsvg$PreserveAspectRatio$Alignment:[I

    sget-object v6, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->xMaxYMid:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    invoke-virtual {v6}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->ordinal()I

    move-result v6

    aput v4, v5, v6
    :try_end_a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_a .. :try_end_a} :catch_a

    :catch_a
    const/4 v5, 0x6

    :try_start_b
    sget-object v6, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$1;->$SwitchMap$com$flyersoft$components$androidsvg$PreserveAspectRatio$Alignment:[I

    sget-object v7, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->xMaxYMax:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    invoke-virtual {v7}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->ordinal()I

    move-result v7

    aput v5, v6, v7
    :try_end_b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_b .. :try_end_b} :catch_b

    :catch_b
    const/4 v6, 0x7

    :try_start_c
    sget-object v7, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$1;->$SwitchMap$com$flyersoft$components$androidsvg$PreserveAspectRatio$Alignment:[I

    sget-object v8, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->xMinYMid:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    invoke-virtual {v8}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->ordinal()I

    move-result v8

    aput v6, v7, v8
    :try_end_c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_c} :catch_c

    :catch_c
    const/16 v7, 0x8

    :try_start_d
    sget-object v8, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$1;->$SwitchMap$com$flyersoft$components$androidsvg$PreserveAspectRatio$Alignment:[I

    sget-object v9, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->xMinYMax:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    invoke-virtual {v9}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->ordinal()I

    move-result v9

    aput v7, v8, v9
    :try_end_d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_d .. :try_end_d} :catch_d

    .line 889
    :catch_d
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;->values()[Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;

    move-result-object v8

    array-length v8, v8

    new-array v8, v8, [I

    sput-object v8, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$1;->$SwitchMap$com$flyersoft$components$androidsvg$utils$Style$CSSBlendMode:[I

    :try_start_e
    sget-object v9, Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;->multiply:Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;

    invoke-virtual {v9}, Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;->ordinal()I

    move-result v9

    aput v1, v8, v9
    :try_end_e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_e .. :try_end_e} :catch_e

    :catch_e
    :try_start_f
    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$1;->$SwitchMap$com$flyersoft$components$androidsvg$utils$Style$CSSBlendMode:[I

    sget-object v8, Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;->screen:Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;

    invoke-virtual {v8}, Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;->ordinal()I

    move-result v8

    aput v0, v1, v8
    :try_end_f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_f .. :try_end_f} :catch_f

    :catch_f
    :try_start_10
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$1;->$SwitchMap$com$flyersoft$components$androidsvg$utils$Style$CSSBlendMode:[I

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;->overlay:Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;

    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;->ordinal()I

    move-result v1

    aput v2, v0, v1
    :try_end_10
    .catch Ljava/lang/NoSuchFieldError; {:try_start_10 .. :try_end_10} :catch_10

    :catch_10
    :try_start_11
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$1;->$SwitchMap$com$flyersoft$components$androidsvg$utils$Style$CSSBlendMode:[I

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;->darken:Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;

    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;->ordinal()I

    move-result v1

    aput v3, v0, v1
    :try_end_11
    .catch Ljava/lang/NoSuchFieldError; {:try_start_11 .. :try_end_11} :catch_11

    :catch_11
    :try_start_12
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$1;->$SwitchMap$com$flyersoft$components$androidsvg$utils$Style$CSSBlendMode:[I

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;->lighten:Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;

    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;->ordinal()I

    move-result v1

    aput v4, v0, v1
    :try_end_12
    .catch Ljava/lang/NoSuchFieldError; {:try_start_12 .. :try_end_12} :catch_12

    :catch_12
    :try_start_13
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$1;->$SwitchMap$com$flyersoft$components$androidsvg$utils$Style$CSSBlendMode:[I

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;->color_dodge:Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;

    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;->ordinal()I

    move-result v1

    aput v5, v0, v1
    :try_end_13
    .catch Ljava/lang/NoSuchFieldError; {:try_start_13 .. :try_end_13} :catch_13

    :catch_13
    :try_start_14
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$1;->$SwitchMap$com$flyersoft$components$androidsvg$utils$Style$CSSBlendMode:[I

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;->color_burn:Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;

    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;->ordinal()I

    move-result v1

    aput v6, v0, v1
    :try_end_14
    .catch Ljava/lang/NoSuchFieldError; {:try_start_14 .. :try_end_14} :catch_14

    :catch_14
    :try_start_15
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$1;->$SwitchMap$com$flyersoft$components$androidsvg$utils$Style$CSSBlendMode:[I

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;->hard_light:Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;

    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;->ordinal()I

    move-result v1

    aput v7, v0, v1
    :try_end_15
    .catch Ljava/lang/NoSuchFieldError; {:try_start_15 .. :try_end_15} :catch_15

    :catch_15
    :try_start_16
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$1;->$SwitchMap$com$flyersoft$components$androidsvg$utils$Style$CSSBlendMode:[I

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;->soft_light:Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;

    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;->ordinal()I

    move-result v1

    const/16 v2, 0x9

    aput v2, v0, v1
    :try_end_16
    .catch Ljava/lang/NoSuchFieldError; {:try_start_16 .. :try_end_16} :catch_16

    :catch_16
    :try_start_17
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$1;->$SwitchMap$com$flyersoft$components$androidsvg$utils$Style$CSSBlendMode:[I

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;->difference:Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;

    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;->ordinal()I

    move-result v1

    const/16 v2, 0xa

    aput v2, v0, v1
    :try_end_17
    .catch Ljava/lang/NoSuchFieldError; {:try_start_17 .. :try_end_17} :catch_17

    :catch_17
    :try_start_18
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$1;->$SwitchMap$com$flyersoft$components$androidsvg$utils$Style$CSSBlendMode:[I

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;->exclusion:Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;

    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;->ordinal()I

    move-result v1

    const/16 v2, 0xb

    aput v2, v0, v1
    :try_end_18
    .catch Ljava/lang/NoSuchFieldError; {:try_start_18 .. :try_end_18} :catch_18

    :catch_18
    :try_start_19
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$1;->$SwitchMap$com$flyersoft$components$androidsvg$utils$Style$CSSBlendMode:[I

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;->hue:Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;

    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;->ordinal()I

    move-result v1

    const/16 v2, 0xc

    aput v2, v0, v1
    :try_end_19
    .catch Ljava/lang/NoSuchFieldError; {:try_start_19 .. :try_end_19} :catch_19

    :catch_19
    :try_start_1a
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$1;->$SwitchMap$com$flyersoft$components$androidsvg$utils$Style$CSSBlendMode:[I

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;->saturation:Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;

    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;->ordinal()I

    move-result v1

    const/16 v2, 0xd

    aput v2, v0, v1
    :try_end_1a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1a .. :try_end_1a} :catch_1a

    :catch_1a
    :try_start_1b
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$1;->$SwitchMap$com$flyersoft$components$androidsvg$utils$Style$CSSBlendMode:[I

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;->color:Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;

    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;->ordinal()I

    move-result v1

    const/16 v2, 0xe

    aput v2, v0, v1
    :try_end_1b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1b .. :try_end_1b} :catch_1b

    :catch_1b
    :try_start_1c
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$1;->$SwitchMap$com$flyersoft$components$androidsvg$utils$Style$CSSBlendMode:[I

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;->luminosity:Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;

    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;->ordinal()I

    move-result v1

    const/16 v2, 0xf

    aput v2, v0, v1
    :try_end_1c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1c .. :try_end_1c} :catch_1c

    :catch_1c
    :try_start_1d
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$1;->$SwitchMap$com$flyersoft$components$androidsvg$utils$Style$CSSBlendMode:[I

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;->normal:Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;

    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/Style$CSSBlendMode;->ordinal()I

    move-result v1

    const/16 v2, 0x10

    aput v2, v0, v1
    :try_end_1d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1d .. :try_end_1d} :catch_1d

    :catch_1d
    return-void
.end method
