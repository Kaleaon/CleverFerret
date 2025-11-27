.class Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextWidthCalculator;
.super Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextProcessor;
.source "SVGAndroidRenderer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TextWidthCalculator"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;

.field x:F


# direct methods
.method private constructor <init>(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            null
        }
    .end annotation

    .line 1891
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextWidthCalculator;->this$0:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextProcessor;-><init>(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer-IA;)V

    const/4 p1, 0x0

    .line 1893
    iput p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextWidthCalculator;->x:F

    return-void
.end method

.method synthetic constructor <init>(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextWidthCalculator;-><init>(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)V

    return-void
.end method


# virtual methods
.method public processText(Ljava/lang/String;)V
    .locals 3

    .line 1898
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextWidthCalculator;->x:F

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextWidthCalculator;->this$0:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;

    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->-$$Nest$fgetstate(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    move-result-object v2

    iget-object v2, v2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fillPaint:Landroid/graphics/Paint;

    invoke-static {v1, p1, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->-$$Nest$mmeasureText(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;Ljava/lang/String;Landroid/graphics/Paint;)F

    move-result p1

    add-float/2addr v0, p1

    iput v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextWidthCalculator;->x:F

    return-void
.end method
