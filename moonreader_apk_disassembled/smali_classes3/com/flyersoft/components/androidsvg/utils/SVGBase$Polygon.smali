.class Lcom/flyersoft/components/androidsvg/utils/SVGBase$Polygon;
.super Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;
.source "SVGBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Polygon"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1653
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;-><init>()V

    return-void
.end method


# virtual methods
.method getNodeName()Ljava/lang/String;
    .locals 1

    .line 1656
    const-string v0, "polygon"

    return-object v0
.end method
