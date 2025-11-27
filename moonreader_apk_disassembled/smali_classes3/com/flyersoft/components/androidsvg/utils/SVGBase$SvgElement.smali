.class abstract Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;
.super Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;
.source "SVGBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "SvgElement"
.end annotation


# instance fields
.field boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;


# direct methods
.method constructor <init>()V
    .locals 1

    .line 1394
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;-><init>()V

    const/4 v0, 0x0

    .line 1396
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->boundingBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    return-void
.end method
