.class Lcom/flyersoft/components/androidsvg/utils/SVGBase$Marker;
.super Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgViewBoxContainer;
.source "SVGBase.java"

# interfaces
.implements Lcom/flyersoft/components/androidsvg/utils/SVGBase$NotDirectlyRendered;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Marker"
.end annotation


# instance fields
.field markerHeight:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

.field markerUnitsAreUser:Z

.field markerWidth:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

.field orient:Ljava/lang/Float;

.field refX:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

.field refY:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1788
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgViewBoxContainer;-><init>()V

    return-void
.end method


# virtual methods
.method getNodeName()Ljava/lang/String;
    .locals 1

    .line 1798
    const-string v0, "marker"

    return-object v0
.end method
