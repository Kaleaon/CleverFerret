.class Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextDrawer;
.super Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextProcessor;
.source "SVGAndroidRenderer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PlainTextDrawer"
.end annotation


# instance fields
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

    .line 1616
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextDrawer;->this$0:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextProcessor;-><init>(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer-IA;)V

    .line 1617
    iput p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextDrawer;->x:F

    .line 1618
    iput p3, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextDrawer;->y:F

    return-void
.end method


# virtual methods
.method public processText(Ljava/lang/String;)V
    .locals 5

    const/4 v0, 0x0

    .line 1624
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "TextSequence render"

    invoke-static {v1, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->-$$Nest$smdebug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1626
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextDrawer;->this$0:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;

    invoke-static {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->-$$Nest$mvisible(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1630
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->-$$Nest$sfgetSUPPORTS_PAINT_LETTER_SPACING()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextDrawer;->this$0:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;

    invoke-static {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->-$$Nest$fgetstate(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    move-result-object v0

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->letterSpacing:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextDrawer;->this$0:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 1631
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextDrawer;->this$0:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;

    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->-$$Nest$fgetstate(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    move-result-object v1

    iget-boolean v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->hasFill:Z

    if-eqz v1, :cond_1

    .line 1632
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextDrawer;->this$0:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;

    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->-$$Nest$fgetcanvas(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)Landroid/graphics/Canvas;

    move-result-object v1

    iget v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextDrawer;->x:F

    sub-float/2addr v2, v0

    iget v3, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextDrawer;->y:F

    iget-object v4, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextDrawer;->this$0:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;

    invoke-static {v4}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->-$$Nest$fgetstate(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    move-result-object v4

    iget-object v4, v4, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fillPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, p1, v2, v3, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 1633
    :cond_1
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextDrawer;->this$0:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;

    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->-$$Nest$fgetstate(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    move-result-object v1

    iget-boolean v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->hasStroke:Z

    if-eqz v1, :cond_2

    .line 1634
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextDrawer;->this$0:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;

    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->-$$Nest$fgetcanvas(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)Landroid/graphics/Canvas;

    move-result-object v1

    iget v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextDrawer;->x:F

    sub-float/2addr v2, v0

    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextDrawer;->y:F

    iget-object v3, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextDrawer;->this$0:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;

    invoke-static {v3}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->-$$Nest$fgetstate(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    move-result-object v3

    iget-object v3, v3, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->strokePaint:Landroid/graphics/Paint;

    invoke-virtual {v1, p1, v2, v0, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 1638
    :cond_2
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextDrawer;->x:F

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextDrawer;->this$0:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;

    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->-$$Nest$fgetstate(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    move-result-object v2

    iget-object v2, v2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fillPaint:Landroid/graphics/Paint;

    invoke-static {v1, p1, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->-$$Nest$mmeasureText(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;Ljava/lang/String;Landroid/graphics/Paint;)F

    move-result p1

    add-float/2addr v0, p1

    iput v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextDrawer;->x:F

    return-void
.end method
