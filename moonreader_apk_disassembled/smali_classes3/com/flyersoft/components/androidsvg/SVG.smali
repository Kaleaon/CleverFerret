.class public Lcom/flyersoft/components/androidsvg/SVG;
.super Ljava/lang/Object;
.source "SVG.java"


# static fields
.field private static final VERSION:Ljava/lang/String; = "1.5"


# instance fields
.field private base:Lcom/flyersoft/components/androidsvg/utils/SVGBase;


# direct methods
.method private constructor <init>(Lcom/flyersoft/components/androidsvg/utils/SVGBase;)V
    .locals 0

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/SVG;->base:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    return-void
.end method

.method public static deregisterExternalFileResolver()V
    .locals 0

    .line 266
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->deregisterExternalFileResolver()V

    return-void
.end method

.method public static getFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/SVG;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 154
    new-instance v0, Lcom/flyersoft/components/androidsvg/SVG;

    invoke-static {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->getFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/flyersoft/components/androidsvg/SVG;-><init>(Lcom/flyersoft/components/androidsvg/utils/SVGBase;)V

    return-object v0
.end method

.method public static getFromInputStream(Ljava/io/InputStream;)Lcom/flyersoft/components/androidsvg/SVG;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    .line 93
    new-instance v0, Lcom/flyersoft/components/androidsvg/SVG;

    invoke-static {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->getFromInputStream(Ljava/io/InputStream;)Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/flyersoft/components/androidsvg/SVG;-><init>(Lcom/flyersoft/components/androidsvg/utils/SVGBase;)V

    return-object v0
.end method

.method public static getFromResource(Landroid/content/Context;I)Lcom/flyersoft/components/androidsvg/SVG;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    .line 122
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-static {p0, p1}, Lcom/flyersoft/components/androidsvg/SVG;->getFromResource(Landroid/content/res/Resources;I)Lcom/flyersoft/components/androidsvg/SVG;

    move-result-object p0

    return-object p0
.end method

.method public static getFromResource(Landroid/content/res/Resources;I)Lcom/flyersoft/components/androidsvg/SVG;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    .line 138
    new-instance v0, Lcom/flyersoft/components/androidsvg/SVG;

    invoke-static {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->getFromResource(Landroid/content/res/Resources;I)Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/flyersoft/components/androidsvg/SVG;-><init>(Lcom/flyersoft/components/androidsvg/utils/SVGBase;)V

    return-object v0
.end method

.method public static getFromString(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/SVG;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    .line 107
    new-instance v0, Lcom/flyersoft/components/androidsvg/SVG;

    invoke-static {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->getFromString(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/flyersoft/components/androidsvg/SVG;-><init>(Lcom/flyersoft/components/androidsvg/utils/SVGBase;)V

    return-object v0
.end method

.method public static getVersion()Ljava/lang/String;
    .locals 1

    .line 495
    const-string v0, "1.5"

    return-object v0
.end method

.method public static parsePath(Ljava/lang/String;)Landroid/graphics/Path;
    .locals 0

    .line 186
    invoke-static {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->parsePath(Ljava/lang/String;)Landroid/graphics/Path;

    move-result-object p0

    return-object p0
.end method

.method public static registerExternalFileResolver(Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;)V
    .locals 0

    .line 254
    invoke-static {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->registerExternalFileResolver(Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;)V

    return-void
.end method

.method public static setInternalEntitiesEnabled(Z)V
    .locals 0

    .line 217
    invoke-static {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->setInternalEntitiesEnabled(Z)V

    return-void
.end method


# virtual methods
.method public getDocumentAspectRatio()F
    .locals 1

    .line 731
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/SVG;->base:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->getDocumentAspectRatio()F

    move-result v0

    return v0
.end method

.method public getDocumentDescription()Ljava/lang/String;
    .locals 1

    .line 521
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/SVG;->base:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->getDocumentDescription()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDocumentHeight()F
    .locals 1

    .line 616
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/SVG;->base:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->getDocumentHeight()F

    move-result v0

    return v0
.end method

.method public getDocumentPreserveAspectRatio()Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;
    .locals 1

    .line 713
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/SVG;->base:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->getDocumentPreserveAspectRatio()Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    move-result-object v0

    return-object v0
.end method

.method public getDocumentSVGVersion()Ljava/lang/String;
    .locals 1

    .line 534
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/SVG;->base:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->getDocumentSVGVersion()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDocumentTitle()Ljava/lang/String;
    .locals 1

    .line 508
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/SVG;->base:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->getDocumentTitle()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDocumentViewBox()Landroid/graphics/RectF;
    .locals 1

    .line 683
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/SVG;->base:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->getDocumentViewBox()Landroid/graphics/RectF;

    move-result-object v0

    return-object v0
.end method

.method public getDocumentWidth()F
    .locals 1

    .line 568
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/SVG;->base:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->getDocumentWidth()F

    move-result v0

    return v0
.end method

.method public getExternalFileResolver()Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;
    .locals 1

    .line 281
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/SVG;->base:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->getExternalFileResolver()Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;

    move-result-object v0

    return-object v0
.end method

.method public getRenderDPI()F
    .locals 1

    .line 308
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/SVG;->base:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->getRenderDPI()F

    move-result v0

    return v0
.end method

.method getRootElement()Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;
    .locals 1

    .line 740
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/SVG;->base:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->getRootElement()Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;

    move-result-object v0

    return-object v0
.end method

.method public getViewList()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 549
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/SVG;->base:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->getViewList()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public isInternalEntitiesEnabled()Z
    .locals 1

    .line 234
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/SVG;->base:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->isInternalEntitiesEnabled()Z

    move-result v0

    return v0
.end method

.method public renderToCanvas(Landroid/graphics/Canvas;)V
    .locals 2

    const/4 v0, 0x0

    .line 411
    move-object v1, v0

    check-cast v1, Lcom/flyersoft/components/androidsvg/RenderOptions;

    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/components/androidsvg/SVG;->renderToCanvas(Landroid/graphics/Canvas;Lcom/flyersoft/components/androidsvg/RenderOptions;)V

    return-void
.end method

.method public renderToCanvas(Landroid/graphics/Canvas;Landroid/graphics/RectF;)V
    .locals 1

    .line 424
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/SVG;->base:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    invoke-virtual {v0, p1, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->renderToCanvas(Landroid/graphics/Canvas;Landroid/graphics/RectF;)V

    return-void
.end method

.method public renderToCanvas(Landroid/graphics/Canvas;Lcom/flyersoft/components/androidsvg/RenderOptions;)V
    .locals 1

    .line 438
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/SVG;->base:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    invoke-virtual {v0, p1, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->renderToCanvas(Landroid/graphics/Canvas;Lcom/flyersoft/components/androidsvg/RenderOptions;)V

    return-void
.end method

.method public renderToPicture()Landroid/graphics/Picture;
    .locals 2

    .line 327
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/SVG;->base:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->renderToPicture(Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;)Landroid/graphics/Picture;

    move-result-object v0

    return-object v0
.end method

.method public renderToPicture(II)Landroid/graphics/Picture;
    .locals 1

    const/4 v0, 0x0

    .line 341
    invoke-virtual {p0, p1, p2, v0}, Lcom/flyersoft/components/androidsvg/SVG;->renderToPicture(IILcom/flyersoft/components/androidsvg/RenderOptions;)Landroid/graphics/Picture;

    move-result-object p1

    return-object p1
.end method

.method public renderToPicture(IILcom/flyersoft/components/androidsvg/RenderOptions;)Landroid/graphics/Picture;
    .locals 1

    .line 372
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/SVG;->base:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    invoke-virtual {v0, p1, p2, p3}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->renderToPicture(IILcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;)Landroid/graphics/Picture;

    move-result-object p1

    return-object p1
.end method

.method public renderToPicture(Lcom/flyersoft/components/androidsvg/RenderOptions;)Landroid/graphics/Picture;
    .locals 1

    .line 356
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/SVG;->base:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    invoke-virtual {v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->renderToPicture(Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;)Landroid/graphics/Picture;

    move-result-object p1

    return-object p1
.end method

.method public renderViewToCanvas(Ljava/lang/String;Landroid/graphics/Canvas;)V
    .locals 1

    .line 458
    invoke-static {}, Lcom/flyersoft/components/androidsvg/RenderOptions;->create()Lcom/flyersoft/components/androidsvg/RenderOptions;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/flyersoft/components/androidsvg/RenderOptions;->view(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/RenderOptions;

    move-result-object p1

    invoke-virtual {p0, p2, p1}, Lcom/flyersoft/components/androidsvg/SVG;->renderToCanvas(Landroid/graphics/Canvas;Lcom/flyersoft/components/androidsvg/RenderOptions;)V

    return-void
.end method

.method public renderViewToCanvas(Ljava/lang/String;Landroid/graphics/Canvas;Landroid/graphics/RectF;)V
    .locals 1

    .line 479
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/SVG;->base:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    invoke-virtual {v0, p1, p2, p3}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->renderViewToCanvas(Ljava/lang/String;Landroid/graphics/Canvas;Landroid/graphics/RectF;)V

    return-void
.end method

.method public renderViewToPicture(Ljava/lang/String;II)Landroid/graphics/Picture;
    .locals 1

    .line 393
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/SVG;->base:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    invoke-virtual {v0, p1, p2, p3}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->renderViewToPicture(Ljava/lang/String;II)Landroid/graphics/Picture;

    move-result-object p1

    return-object p1
.end method

.method public setDocumentHeight(F)V
    .locals 1

    .line 630
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/SVG;->base:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    invoke-virtual {v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->setDocumentHeight(F)V

    return-void
.end method

.method public setDocumentHeight(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    .line 645
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/SVG;->base:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    invoke-virtual {v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->setDocumentHeight(Ljava/lang/String;)V

    return-void
.end method

.method public setDocumentPreserveAspectRatio(Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;)V
    .locals 1

    .line 699
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/SVG;->base:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    invoke-virtual {v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->setDocumentPreserveAspectRatio(Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;)V

    return-void
.end method

.method public setDocumentViewBox(FFFF)V
    .locals 1

    .line 670
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/SVG;->base:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->setDocumentViewBox(FFFF)V

    return-void
.end method

.method public setDocumentWidth(F)V
    .locals 1

    .line 582
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/SVG;->base:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    invoke-virtual {v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->setDocumentWidth(F)V

    return-void
.end method

.method public setDocumentWidth(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    .line 597
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/SVG;->base:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    invoke-virtual {v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->setDocumentWidth(Ljava/lang/String;)V

    return-void
.end method

.method public setRenderDPI(F)V
    .locals 1

    .line 297
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/SVG;->base:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

    invoke-virtual {v0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase;->setRenderDPI(F)V

    return-void
.end method
