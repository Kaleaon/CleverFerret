.class abstract Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientElement;
.super Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;
.source "SVGBase.java"

# interfaces
.implements Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "GradientElement"
.end annotation


# instance fields
.field children:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;",
            ">;"
        }
    .end annotation
.end field

.field gradientTransform:Landroid/graphics/Matrix;

.field gradientUnitsAreUser:Ljava/lang/Boolean;

.field href:Ljava/lang/String;

.field spreadMethod:Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;


# direct methods
.method constructor <init>()V
    .locals 1

    .line 1802
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;-><init>()V

    .line 1804
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientElement;->children:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public addChild(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    .line 1820
    instance-of v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Stop;

    if-eqz v0, :cond_0

    .line 1821
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientElement;->children:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void

    .line 1823
    :cond_0
    new-instance v0, Lcom/flyersoft/components/androidsvg/SVGParseException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Gradient elements cannot contain "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " elements."

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getChildren()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;",
            ">;"
        }
    .end annotation

    .line 1814
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientElement;->children:Ljava/util/List;

    return-object v0
.end method
