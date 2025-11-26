.class abstract Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;
.super Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;
.source "SVGBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "SvgElementBase"
.end annotation


# instance fields
.field baseStyle:Lcom/flyersoft/components/androidsvg/utils/Style;

.field classNames:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field id:Ljava/lang/String;

.field spacePreserve:Ljava/lang/Boolean;

.field style:Lcom/flyersoft/components/androidsvg/utils/Style;


# direct methods
.method constructor <init>()V
    .locals 1

    .line 1378
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;-><init>()V

    const/4 v0, 0x0

    .line 1380
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->id:Ljava/lang/String;

    .line 1381
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->spacePreserve:Ljava/lang/Boolean;

    .line 1382
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->baseStyle:Lcom/flyersoft/components/androidsvg/utils/Style;

    .line 1383
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->style:Lcom/flyersoft/components/androidsvg/utils/Style;

    .line 1384
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->classNames:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 1388
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->getNodeName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
