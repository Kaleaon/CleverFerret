.class Lcom/flyersoft/components/androidsvg/utils/SVGBase$Group;
.super Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalContainer;
.source "SVGBase.java"

# interfaces
.implements Lcom/flyersoft/components/androidsvg/utils/SVGBase$HasTransform;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Group"
.end annotation


# instance fields
.field transform:Landroid/graphics/Matrix;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1525
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalContainer;-><init>()V

    return-void
.end method


# virtual methods
.method getNodeName()Ljava/lang/String;
    .locals 1

    .line 1533
    const-string v0, "group"

    return-object v0
.end method

.method public setTransform(Landroid/graphics/Matrix;)V
    .locals 0

    .line 1530
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Group;->transform:Landroid/graphics/Matrix;

    return-void
.end method
