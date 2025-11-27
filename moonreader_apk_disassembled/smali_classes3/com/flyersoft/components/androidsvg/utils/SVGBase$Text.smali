.class Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;
.super Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPositionedContainer;
.source "SVGBase.java"

# interfaces
.implements Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextRoot;
.implements Lcom/flyersoft/components/androidsvg/utils/SVGBase$HasTransform;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Text"
.end annotation


# instance fields
.field transform:Landroid/graphics/Matrix;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1695
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPositionedContainer;-><init>()V

    return-void
.end method


# virtual methods
.method getNodeName()Ljava/lang/String;
    .locals 1

    .line 1702
    const-string v0, "text"

    return-object v0
.end method

.method public setTransform(Landroid/graphics/Matrix;)V
    .locals 0

    .line 1700
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Text;->transform:Landroid/graphics/Matrix;

    return-void
.end method
