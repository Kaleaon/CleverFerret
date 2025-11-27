.class abstract Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPreserveAspectRatioContainer;
.super Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalContainer;
.source "SVGBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "SvgPreserveAspectRatioContainer"
.end annotation


# instance fields
.field preserveAspectRatio:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;


# direct methods
.method constructor <init>()V
    .locals 1

    .line 1499
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalContainer;-><init>()V

    const/4 v0, 0x0

    .line 1501
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPreserveAspectRatioContainer;->preserveAspectRatio:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    return-void
.end method
