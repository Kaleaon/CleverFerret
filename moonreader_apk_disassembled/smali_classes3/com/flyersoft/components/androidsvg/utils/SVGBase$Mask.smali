.class Lcom/flyersoft/components/androidsvg/utils/SVGBase$Mask;
.super Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalContainer;
.source "SVGBase.java"

# interfaces
.implements Lcom/flyersoft/components/androidsvg/utils/SVGBase$NotDirectlyRendered;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Mask"
.end annotation


# instance fields
.field height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

.field maskContentUnitsAreUser:Ljava/lang/Boolean;

.field maskUnitsAreUser:Ljava/lang/Boolean;

.field width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

.field x:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

.field y:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1921
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalContainer;-><init>()V

    return-void
.end method


# virtual methods
.method getNodeName()Ljava/lang/String;
    .locals 1

    .line 1931
    const-string v0, "mask"

    return-object v0
.end method
