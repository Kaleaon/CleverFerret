.class Lcom/flyersoft/components/androidsvg/utils/SVGBase$Image;
.super Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPreserveAspectRatioContainer;
.source "SVGBase.java"

# interfaces
.implements Lcom/flyersoft/components/androidsvg/utils/SVGBase$HasTransform;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Image"
.end annotation


# instance fields
.field height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

.field href:Ljava/lang/String;

.field transform:Landroid/graphics/Matrix;

.field width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

.field x:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

.field y:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1896
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPreserveAspectRatioContainer;-><init>()V

    return-void
.end method


# virtual methods
.method getNodeName()Ljava/lang/String;
    .locals 1

    .line 1908
    const-string v0, "image"

    return-object v0
.end method

.method public setTransform(Landroid/graphics/Matrix;)V
    .locals 0

    .line 1906
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Image;->transform:Landroid/graphics/Matrix;

    return-void
.end method
