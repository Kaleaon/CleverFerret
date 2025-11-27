.class Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextToPath;
.super Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextProcessor;
.source "SVGAndroidRenderer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PlainTextToPath"
.end annotation


# instance fields
.field final textAsPath:Landroid/graphics/Path;

.field final synthetic this$0:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;

.field x:F

.field y:F


# direct methods
.method constructor <init>(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;FFLandroid/graphics/Path;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x0,
            0x0,
            0x0
        }
        names = {
            null,
            null,
            null,
            null
        }
    .end annotation

    .line 4424
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextToPath;->this$0:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextProcessor;-><init>(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer-IA;)V

    .line 4425
    iput p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextToPath;->x:F

    .line 4426
    iput p3, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextToPath;->y:F

    .line 4427
    iput-object p4, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextToPath;->textAsPath:Landroid/graphics/Path;

    return-void
.end method


# virtual methods
.method public doTextContainer(Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;)Z
    .locals 2

    .line 4433
    instance-of p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPath;

    if-eqz p1, :cond_0

    .line 4435
    const-string p1, "Using <textPath> elements in a clip path is not supported."

    const/4 v0, 0x0

    new-array v1, v0, [Ljava/lang/Object;

    invoke-static {p1, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->-$$Nest$smwarn(Ljava/lang/String;[Ljava/lang/Object;)V

    return v0

    :cond_0
    const/4 p1, 0x1

    return p1
.end method

.method public processText(Ljava/lang/String;)V
    .locals 8

    .line 4444
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextToPath;->this$0:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;

    invoke-static {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->-$$Nest$mvisible(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 4447
    new-instance v7, Landroid/graphics/Path;

    invoke-direct {v7}, Landroid/graphics/Path;-><init>()V

    .line 4448
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextToPath;->this$0:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;

    invoke-static {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->-$$Nest$fgetstate(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    move-result-object v0

    iget-object v1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fillPaint:Landroid/graphics/Paint;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    iget v5, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextToPath;->x:F

    iget v6, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextToPath;->y:F

    const/4 v3, 0x0

    move-object v2, p1

    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Paint;->getTextPath(Ljava/lang/String;IIFFLandroid/graphics/Path;)V

    .line 4449
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextToPath;->textAsPath:Landroid/graphics/Path;

    invoke-virtual {p1, v7}, Landroid/graphics/Path;->addPath(Landroid/graphics/Path;)V

    goto :goto_0

    :cond_0
    move-object v2, p1

    .line 4453
    :goto_0
    iget p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextToPath;->x:F

    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextToPath;->this$0:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;

    invoke-static {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->-$$Nest$fgetstate(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    move-result-object v1

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fillPaint:Landroid/graphics/Paint;

    invoke-static {v0, v2, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->-$$Nest$mmeasureText(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;Ljava/lang/String;Landroid/graphics/Paint;)F

    move-result v0

    add-float/2addr p1, v0

    iput p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextToPath;->x:F

    return-void
.end method
