.class Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathTextDrawer;
.super Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextDrawer;
.source "SVGAndroidRenderer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PathTextDrawer"
.end annotation


# instance fields
.field private final path:Landroid/graphics/Path;

.field final synthetic this$0:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;Landroid/graphics/Path;FF)V
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

    .line 1851
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathTextDrawer;->this$0:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;

    .line 1852
    invoke-direct {p0, p1, p3, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PlainTextDrawer;-><init>(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;FF)V

    .line 1853
    iput-object p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathTextDrawer;->path:Landroid/graphics/Path;

    return-void
.end method


# virtual methods
.method public processText(Ljava/lang/String;)V
    .locals 14

    .line 1859
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathTextDrawer;->this$0:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;

    invoke-static {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->-$$Nest$mvisible(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1863
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->-$$Nest$sfgetSUPPORTS_PAINT_LETTER_SPACING()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathTextDrawer;->this$0:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;

    invoke-static {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->-$$Nest$fgetstate(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    move-result-object v0

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    iget-object v0, v0, Lcom/flyersoft/components/androidsvg/utils/Style;->letterSpacing:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathTextDrawer;->this$0:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;->floatValue(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)F

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 1864
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathTextDrawer;->this$0:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;

    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->-$$Nest$fgetstate(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    move-result-object v1

    iget-boolean v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->hasFill:Z

    if-eqz v1, :cond_1

    .line 1865
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathTextDrawer;->this$0:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;

    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->-$$Nest$fgetcanvas(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)Landroid/graphics/Canvas;

    move-result-object v2

    iget-object v4, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathTextDrawer;->path:Landroid/graphics/Path;

    iget v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathTextDrawer;->x:F

    sub-float v5, v1, v0

    iget v6, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathTextDrawer;->y:F

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathTextDrawer;->this$0:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;

    invoke-static {v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->-$$Nest$fgetstate(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    move-result-object v1

    iget-object v7, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fillPaint:Landroid/graphics/Paint;

    move-object v3, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawTextOnPath(Ljava/lang/String;Landroid/graphics/Path;FFLandroid/graphics/Paint;)V

    goto :goto_1

    :cond_1
    move-object v3, p1

    .line 1866
    :goto_1
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathTextDrawer;->this$0:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;

    invoke-static {p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->-$$Nest$fgetstate(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    move-result-object p1

    iget-boolean p1, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->hasStroke:Z

    if-eqz p1, :cond_3

    .line 1867
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathTextDrawer;->this$0:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;

    invoke-static {p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->-$$Nest$fgetcanvas(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)Landroid/graphics/Canvas;

    move-result-object v8

    iget-object v10, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathTextDrawer;->path:Landroid/graphics/Path;

    iget p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathTextDrawer;->x:F

    sub-float v11, p1, v0

    iget v12, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathTextDrawer;->y:F

    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathTextDrawer;->this$0:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;

    invoke-static {p1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->-$$Nest$fgetstate(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    move-result-object p1

    iget-object v13, p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->strokePaint:Landroid/graphics/Paint;

    move-object v9, v3

    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawTextOnPath(Ljava/lang/String;Landroid/graphics/Path;FFLandroid/graphics/Paint;)V

    goto :goto_2

    :cond_2
    move-object v3, p1

    .line 1871
    :cond_3
    :goto_2
    iget p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathTextDrawer;->x:F

    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathTextDrawer;->this$0:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;

    invoke-static {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->-$$Nest$fgetstate(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;)Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;

    move-result-object v1

    iget-object v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$RendererState;->fillPaint:Landroid/graphics/Paint;

    invoke-static {v0, v3, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->-$$Nest$mmeasureText(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;Ljava/lang/String;Landroid/graphics/Paint;)F

    move-result v0

    add-float/2addr p1, v0

    iput p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$PathTextDrawer;->x:F

    return-void
.end method
