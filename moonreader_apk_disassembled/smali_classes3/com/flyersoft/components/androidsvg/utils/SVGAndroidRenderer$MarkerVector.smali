.class Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;
.super Ljava/lang/Object;
.source "SVGAndroidRenderer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MarkerVector"
.end annotation


# instance fields
.field dx:F

.field dy:F

.field isAmbiguous:Z

.field final x:F

.field final y:F


# direct methods
.method constructor <init>(FFFF)V
    .locals 3

    .line 3071
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 3067
    iput v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->dx:F

    iput v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->dy:F

    const/4 v0, 0x0

    .line 3068
    iput-boolean v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->isAmbiguous:Z

    .line 3072
    iput p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->x:F

    .line 3073
    iput p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->y:F

    mul-float p1, p3, p3

    mul-float p2, p4, p4

    add-float/2addr p1, p2

    float-to-double p1, p1

    .line 3075
    invoke-static {p1, p2}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide p1

    const-wide/16 v0, 0x0

    cmpl-double v2, p1, v0

    if-eqz v2, :cond_0

    float-to-double v0, p3

    div-double/2addr v0, p1

    double-to-float p3, v0

    .line 3077
    iput p3, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->dx:F

    float-to-double p3, p4

    div-double/2addr p3, p1

    double-to-float p1, p3

    .line 3078
    iput p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->dy:F

    :cond_0
    return-void
.end method


# virtual methods
.method add(FF)V
    .locals 5

    .line 3087
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->x:F

    sub-float/2addr p1, v0

    .line 3088
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->y:F

    sub-float/2addr p2, v0

    mul-float v0, p1, p1

    mul-float v1, p2, p2

    add-float/2addr v0, v1

    float-to-double v0, v0

    .line 3089
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmpl-double v4, v0, v2

    if-eqz v4, :cond_0

    float-to-double v2, p1

    div-double/2addr v2, v0

    double-to-float p1, v2

    float-to-double v2, p2

    div-double/2addr v2, v0

    double-to-float p2, v2

    .line 3095
    :cond_0
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->dx:F

    neg-float v1, v0

    cmpl-float v1, p1, v1

    if-nez v1, :cond_1

    iget v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->dy:F

    neg-float v1, v1

    cmpl-float v1, p2, v1

    if-nez v1, :cond_1

    const/4 v0, 0x1

    .line 3096
    iput-boolean v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->isAmbiguous:Z

    neg-float p2, p2

    .line 3098
    iput p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->dx:F

    .line 3099
    iput p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->dy:F

    return-void

    :cond_1
    add-float/2addr v0, p1

    .line 3101
    iput v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->dx:F

    .line 3102
    iget p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->dy:F

    add-float/2addr p1, p2

    iput p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->dy:F

    return-void
.end method

.method add(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;)V
    .locals 4

    .line 3109
    iget v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->dx:F

    iget v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->dx:F

    neg-float v2, v1

    cmpl-float v2, v0, v2

    if-nez v2, :cond_0

    iget v2, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->dy:F

    iget v3, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->dy:F

    neg-float v3, v3

    cmpl-float v3, v2, v3

    if-nez v3, :cond_0

    const/4 v0, 0x1

    .line 3110
    iput-boolean v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->isAmbiguous:Z

    neg-float v0, v2

    .line 3112
    iput v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->dx:F

    .line 3113
    iget p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->dx:F

    iput p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->dy:F

    return-void

    :cond_0
    add-float/2addr v1, v0

    .line 3115
    iput v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->dx:F

    .line 3116
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->dy:F

    iget p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->dy:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->dy:F

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 3124
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->x:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->y:F

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->dx:F

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->dy:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
