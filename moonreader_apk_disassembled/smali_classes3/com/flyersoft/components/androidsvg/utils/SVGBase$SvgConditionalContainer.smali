.class public abstract Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalContainer;
.super Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;
.source "SVGBase.java"

# interfaces
.implements Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;
.implements Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditional;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "SvgConditionalContainer"
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

.field requiredExtensions:Ljava/lang/String;

.field requiredFeatures:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field requiredFonts:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field requiredFormats:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field systemLanguage:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1455
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;-><init>()V

    .line 1457
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalContainer;->children:Ljava/util/List;

    const/4 v0, 0x0

    .line 1459
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalContainer;->requiredFeatures:Ljava/util/Set;

    .line 1460
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalContainer;->requiredExtensions:Ljava/lang/String;

    .line 1461
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalContainer;->systemLanguage:Ljava/util/Set;

    .line 1462
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalContainer;->requiredFormats:Ljava/util/Set;

    .line 1463
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalContainer;->requiredFonts:Ljava/util/Set;

    return-void
.end method


# virtual methods
.method public addChild(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    .line 1468
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalContainer;->children:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

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

    .line 1466
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalContainer;->children:Ljava/util/List;

    return-object v0
.end method

.method public getRequiredExtensions()Ljava/lang/String;
    .locals 1

    .line 1477
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalContainer;->requiredExtensions:Ljava/lang/String;

    return-object v0
.end method

.method public getRequiredFeatures()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1473
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalContainer;->requiredFeatures:Ljava/util/Set;

    return-object v0
.end method

.method public getRequiredFonts()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1489
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalContainer;->requiredFonts:Ljava/util/Set;

    return-object v0
.end method

.method public getRequiredFormats()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1485
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalContainer;->requiredFormats:Ljava/util/Set;

    return-object v0
.end method

.method public getSystemLanguage()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method public setRequiredExtensions(Ljava/lang/String;)V
    .locals 0

    .line 1475
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalContainer;->requiredExtensions:Ljava/lang/String;

    return-void
.end method

.method public setRequiredFeatures(Ljava/util/Set;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1471
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalContainer;->requiredFeatures:Ljava/util/Set;

    return-void
.end method

.method public setRequiredFonts(Ljava/util/Set;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1487
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalContainer;->requiredFonts:Ljava/util/Set;

    return-void
.end method

.method public setRequiredFormats(Ljava/util/Set;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1483
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalContainer;->requiredFormats:Ljava/util/Set;

    return-void
.end method

.method public setSystemLanguage(Ljava/util/Set;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1479
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalContainer;->systemLanguage:Ljava/util/Set;

    return-void
.end method

.method public bridge synthetic toString()Ljava/lang/String;
    .locals 1

    .line 1455
    invoke-super {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
