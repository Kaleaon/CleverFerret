.class Lcom/flyersoft/components/androidsvg/utils/SVGBase$PolyLine;
.super Lcom/flyersoft/components/androidsvg/utils/SVGBase$GraphicsElement;
.source "SVGBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "PolyLine"
.end annotation


# instance fields
.field points:[F


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1644
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GraphicsElement;-><init>()V

    return-void
.end method


# virtual methods
.method getNodeName()Ljava/lang/String;
    .locals 1

    .line 1649
    const-string v0, "polyline"

    return-object v0
.end method
