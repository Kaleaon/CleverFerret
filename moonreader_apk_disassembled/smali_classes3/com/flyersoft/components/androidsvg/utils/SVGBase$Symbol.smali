.class Lcom/flyersoft/components/androidsvg/utils/SVGBase$Symbol;
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
    name = "Symbol"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1781
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgViewBoxContainer;-><init>()V

    return-void
.end method


# virtual methods
.method getNodeName()Ljava/lang/String;
    .locals 1

    .line 1784
    const-string v0, "symbol"

    return-object v0
.end method
