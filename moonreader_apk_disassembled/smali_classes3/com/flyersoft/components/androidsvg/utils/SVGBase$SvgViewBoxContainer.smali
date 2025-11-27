.class abstract Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgViewBoxContainer;
.super Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPreserveAspectRatioContainer;
.source "SVGBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "SvgViewBoxContainer"
.end annotation


# instance fields
.field viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1505
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPreserveAspectRatioContainer;-><init>()V

    return-void
.end method
