.class Lcom/flyersoft/components/androidsvg/utils/SVGBase$SolidColor;
.super Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;
.source "SVGBase.java"

# interfaces
.implements Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "SolidColor"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1935
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;-><init>()V

    return-void
.end method


# virtual methods
.method public addChild(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)V
    .locals 0

    return-void
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

    .line 1944
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object v0
.end method

.method getNodeName()Ljava/lang/String;
    .locals 1

    .line 1948
    const-string v0, "solidColor"

    return-object v0
.end method
