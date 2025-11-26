.class public Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;
.super Ljava/lang/Object;
.source "SVGBase.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Length"
.end annotation


# static fields
.field static final PERCENT_100:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

.field static final ZERO:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;


# instance fields
.field final unit:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

.field final value:F


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1207
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;-><init>(F)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->ZERO:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 1208
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    const/high16 v1, 0x42c80000    # 100.0f

    sget-object v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->percent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;-><init>(FLcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->PERCENT_100:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    return-void
.end method

.method public constructor <init>(F)V
    .locals 0

    .line 1217
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1218
    iput p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->value:F

    .line 1219
    sget-object p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->px:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->unit:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    return-void
.end method

.method public constructor <init>(FLcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;)V
    .locals 0

    .line 1211
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1212
    iput p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->value:F

    .line 1213
    iput-object p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->unit:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    return-void
.end method


# virtual methods
.method floatValue()F
    .locals 1

    .line 1224
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->value:F

    return v0
.end method

.method floatValue(F)F
    .locals 2

    .line 1303
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->unit:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->ordinal()I

    move-result v0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_4

    const/4 v1, 0x4

    if-eq v0, v1, :cond_3

    const/4 v1, 0x5

    if-eq v0, v1, :cond_2

    const/4 v1, 0x6

    if-eq v0, v1, :cond_1

    const/4 v1, 0x7

    if-eq v0, v1, :cond_0

    .line 1320
    iget p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->value:F

    return p1

    .line 1314
    :cond_0
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->value:F

    mul-float v0, v0, p1

    const/high16 p1, 0x40c00000    # 6.0f

    div-float/2addr v0, p1

    return v0

    .line 1312
    :cond_1
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->value:F

    mul-float v0, v0, p1

    const/high16 p1, 0x42900000    # 72.0f

    div-float/2addr v0, p1

    return v0

    .line 1310
    :cond_2
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->value:F

    mul-float v0, v0, p1

    const p1, 0x41cb3333    # 25.4f

    div-float/2addr v0, p1

    return v0

    .line 1308
    :cond_3
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->value:F

    mul-float v0, v0, p1

    const p1, 0x40228f5c    # 2.54f

    div-float/2addr v0, p1

    return v0

    .line 1306
    :cond_4
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->value:F

    mul-float v0, v0, p1

    return v0
.end method

.method floatValue(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F
    .locals 6

    .line 1273
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->unit:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->percent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    if-ne v0, v1, :cond_2

    .line 1275
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->getEffectiveViewPortInUserUnits()Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    move-result-object p1

    if-nez p1, :cond_0

    .line 1277
    iget p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->value:F

    return p1

    .line 1278
    :cond_0
    iget v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->width:F

    .line 1279
    iget p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->height:F

    const/high16 v1, 0x42c80000    # 100.0f

    cmpl-float v2, v0, p1

    if-nez v2, :cond_1

    .line 1281
    iget p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->value:F

    mul-float p1, p1, v0

    div-float/2addr p1, v1

    return p1

    :cond_1
    mul-float v0, v0, v0

    mul-float p1, p1, p1

    add-float/2addr v0, p1

    float-to-double v2, v0

    .line 1282
    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v2

    const-wide v4, 0x3ff6a09e667f3bccL    # 1.414213562373095

    div-double/2addr v2, v4

    double-to-float p1, v2

    .line 1283
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->value:F

    mul-float v0, v0, p1

    div-float/2addr v0, v1

    return v0

    .line 1285
    :cond_2
    invoke-virtual {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueX(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result p1

    return p1
.end method

.method floatValue(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;F)F
    .locals 2

    .line 1292
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->unit:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->percent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    if-ne v0, v1, :cond_0

    .line 1294
    iget p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->value:F

    mul-float p1, p1, p2

    const/high16 p2, 0x42c80000    # 100.0f

    div-float/2addr p1, p2

    return p1

    .line 1296
    :cond_0
    invoke-virtual {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueX(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result p1

    return p1
.end method

.method floatValueX(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F
    .locals 1

    .line 1230
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->unit:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->ordinal()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 1253
    iget p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->value:F

    return p1

    .line 1247
    :pswitch_0
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->getEffectiveViewPortInUserUnits()Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    move-result-object p1

    if-nez p1, :cond_0

    .line 1249
    iget p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->value:F

    return p1

    .line 1250
    :cond_0
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->value:F

    iget p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->width:F

    mul-float v0, v0, p1

    const/high16 p1, 0x42c80000    # 100.0f

    div-float/2addr v0, p1

    return v0

    .line 1245
    :pswitch_1
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->value:F

    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->getDPI()F

    move-result p1

    mul-float v0, v0, p1

    const/high16 p1, 0x40c00000    # 6.0f

    div-float/2addr v0, p1

    return v0

    .line 1243
    :pswitch_2
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->value:F

    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->getDPI()F

    move-result p1

    mul-float v0, v0, p1

    const/high16 p1, 0x42900000    # 72.0f

    div-float/2addr v0, p1

    return v0

    .line 1241
    :pswitch_3
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->value:F

    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->getDPI()F

    move-result p1

    mul-float v0, v0, p1

    const p1, 0x41cb3333    # 25.4f

    div-float/2addr v0, p1

    return v0

    .line 1239
    :pswitch_4
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->value:F

    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->getDPI()F

    move-result p1

    mul-float v0, v0, p1

    const p1, 0x40228f5c    # 2.54f

    div-float/2addr v0, p1

    return v0

    .line 1237
    :pswitch_5
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->value:F

    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->getDPI()F

    move-result p1

    mul-float v0, v0, p1

    return v0

    .line 1235
    :pswitch_6
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->value:F

    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->getCurrentFontXHeight()F

    move-result p1

    mul-float v0, v0, p1

    return v0

    .line 1233
    :pswitch_7
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->value:F

    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->getCurrentFontSize()F

    move-result p1

    mul-float v0, v0, p1

    return v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method floatValueY(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F
    .locals 2

    .line 1260
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->unit:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->percent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    if-ne v0, v1, :cond_1

    .line 1261
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->getEffectiveViewPortInUserUnits()Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    move-result-object p1

    if-nez p1, :cond_0

    .line 1263
    iget p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->value:F

    return p1

    .line 1264
    :cond_0
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->value:F

    iget p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;->height:F

    mul-float v0, v0, p1

    const/high16 p1, 0x42c80000    # 100.0f

    div-float/2addr v0, p1

    return v0

    .line 1266
    :cond_1
    invoke-virtual {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValueX(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result p1

    return p1
.end method

.method isNegative()Z
    .locals 2

    .line 1331
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->value:F

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method isZero()Z
    .locals 2

    .line 1326
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->value:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1337
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->value:F

    invoke-static {v1}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->unit:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
