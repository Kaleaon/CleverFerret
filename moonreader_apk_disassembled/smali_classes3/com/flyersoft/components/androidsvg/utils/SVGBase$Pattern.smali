.class Lcom/flyersoft/components/androidsvg/utils/SVGBase$Pattern;
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
    name = "Pattern"
.end annotation


# instance fields
.field height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

.field href:Ljava/lang/String;

.field patternContentUnitsAreUser:Ljava/lang/Boolean;

.field patternTransform:Landroid/graphics/Matrix;

.field patternUnitsAreUser:Ljava/lang/Boolean;

.field width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

.field x:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

.field y:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1880
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgViewBoxContainer;-><init>()V

    return-void
.end method


# virtual methods
.method getNodeName()Ljava/lang/String;
    .locals 1

    .line 1892
    const-string v0, "pattern"

    return-object v0
.end method
