.class Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextBoundsCalculator;
.super Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextProcessor;
.source "SVGAndroidRenderer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TextBoundsCalculator"
.end annotation


# instance fields
.field final bbox:Landroid/graphics/RectF;

.field final synthetic this$0:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;

.field x:F

.field y:F


# direct methods
.method constructor <init>(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;FF)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x0,
            0x0
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .line 1933
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextBoundsCalculator;->this$0:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextProcessor;-><init>(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer-IA;)V

    .line 1930
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextBoundsCalculator;->bbox:Landroid/graphics/RectF;

    .line 1934
    iput p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextBoundsCalculator;->x:F

    .line 1935
    iput p3, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextBoundsCalculator;->y:F

    return-void
.end method


# virtual methods
.method public doTextContainer(Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;)Z
    .locals 4

    .line 1941
    instance-of v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPath;

    const/4 v1, 0x1

    if-eqz v0, :cond_2

    .line 1945
    move-object v0, p1

    check-cast v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPath;

    .line 1946
    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;->document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    iget-object v2, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPath;->href:Ljava/lang/String;

    invoke-virtual {p1, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->resolveIRI(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;

    move-result-object p1

    const/4 v2, 0x0

    if-nez p1, :cond_0

    .line 1948
    iget-object p1, v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPath;->href:Ljava/lang/String;

    new-array v0, v1, [Ljava/lang/Object;

    aput-object p1, v0, v2

    const-string p1, "TextPath path reference \'%s\' not found"

    invoke-static {p1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->-$$Nest$smerror(Ljava/lang/String;[Ljava/lang/Object;)V

    return v2

    .line 1951
    :cond_0
    check-cast p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;

    .line 1952
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathConverter;

    iget-object v3, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;->d:Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;

    invoke-direct {v0, v3}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathConverter;-><init>(Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;)V

    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathConverter;->getPath()Landroid/graphics/Path;

    move-result-object v0

    .line 1953
    iget-object v3, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;->transform:Landroid/graphics/Matrix;

    if-eqz v3, :cond_1

    .line 1954
    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Path;->transform:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    .line 1955
    :cond_1
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    .line 1956
    invoke-virtual {v0, p1, v1}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    .line 1957
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextBoundsCalculator;->bbox:Landroid/graphics/RectF;

    invoke-virtual {v0, p1}, Landroid/graphics/RectF;->union(Landroid/graphics/RectF;)V

    return v2

    :cond_2
    return v1
.end method

.method public processText(Ljava/lang/String;)V
    .locals 4

    .line 1966
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextBoundsCalculator;->this$0:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;

    invoke-static {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->-$$Nest$mvisible(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1968
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 1970
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextBoundsCalculator;->this$0:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;

    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->-$$Nest$fgetstate(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    move-result-object v1

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fillPaint:Landroid/graphics/Paint;

    const/4 v2, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v1, p1, v2, v3, v0}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 1971
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1, v0}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 1973
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextBoundsCalculator;->x:F

    iget v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextBoundsCalculator;->y:F

    invoke-virtual {v1, v0, v2}, Landroid/graphics/RectF;->offset(FF)V

    .line 1975
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextBoundsCalculator;->bbox:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->union(Landroid/graphics/RectF;)V

    .line 1979
    :cond_0
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextBoundsCalculator;->x:F

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextBoundsCalculator;->this$0:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;

    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->-$$Nest$fgetstate(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    move-result-object v2

    iget-object v2, v2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fillPaint:Landroid/graphics/Paint;

    invoke-static {v1, p1, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->-$$Nest$mmeasureText(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;Ljava/lang/String;Landroid/graphics/Paint;)F

    move-result p1

    add-float/2addr v0, p1

    iput v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextBoundsCalculator;->x:F

    return-void
.end method
