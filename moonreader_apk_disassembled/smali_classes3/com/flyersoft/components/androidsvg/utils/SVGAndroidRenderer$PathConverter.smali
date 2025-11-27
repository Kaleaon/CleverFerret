.class public Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathConverter;
.super Ljava/lang/Object;
.source "SVGAndroidRenderer.java"

# interfaces
.implements Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathInterface;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "PathConverter"
.end annotation


# instance fields
.field lastX:F

.field lastY:F

.field final path:Landroid/graphics/Path;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;)V
    .locals 1

    .line 2792
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2788
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathConverter;->path:Landroid/graphics/Path;

    if-nez p1, :cond_0

    return-void

    .line 2795
    :cond_0
    invoke-virtual {p1, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->enumeratePath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathInterface;)V

    return-void
.end method


# virtual methods
.method public arcTo(FFFZZFF)V
    .locals 10

    .line 2838
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathConverter;->lastX:F

    iget v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathConverter;->lastY:F

    move-object v9, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    invoke-static/range {v0 .. v9}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->-$$Nest$smarcTo(FFFFFZZFFLcom/flyersoft/components/androidsvg/utils/SVGBase$PathInterface;)V

    .line 2839
    iput v7, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathConverter;->lastX:F

    .line 2840
    iput v8, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathConverter;->lastY:F

    return-void
.end method

.method public close()V
    .locals 1

    .line 2846
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathConverter;->path:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    return-void
.end method

.method public cubicTo(FFFFFF)V
    .locals 7

    .line 2822
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathConverter;->path:Landroid/graphics/Path;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 2823
    iput v5, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathConverter;->lastX:F

    .line 2824
    iput v6, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathConverter;->lastY:F

    return-void
.end method

.method getPath()Landroid/graphics/Path;
    .locals 1

    .line 2800
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathConverter;->path:Landroid/graphics/Path;

    return-object v0
.end method

.method public lineTo(FF)V
    .locals 1

    .line 2814
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathConverter;->path:Landroid/graphics/Path;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 2815
    iput p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathConverter;->lastX:F

    .line 2816
    iput p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathConverter;->lastY:F

    return-void
.end method

.method public moveTo(FF)V
    .locals 1

    .line 2806
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathConverter;->path:Landroid/graphics/Path;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 2807
    iput p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathConverter;->lastX:F

    .line 2808
    iput p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathConverter;->lastY:F

    return-void
.end method

.method public quadTo(FFFF)V
    .locals 1

    .line 2830
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathConverter;->path:Landroid/graphics/Path;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/graphics/Path;->quadTo(FFFF)V

    .line 2831
    iput p3, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathConverter;->lastX:F

    .line 2832
    iput p4, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathConverter;->lastY:F

    return-void
.end method
