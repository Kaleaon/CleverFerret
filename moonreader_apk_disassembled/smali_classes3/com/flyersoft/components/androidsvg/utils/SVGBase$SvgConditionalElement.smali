.class abstract Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalElement;
.super Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;
.source "SVGBase.java"

# interfaces
.implements Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditional;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "SvgConditionalElement"
.end annotation


# instance fields
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
.method constructor <init>()V
    .locals 1

    .line 1417
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElement;-><init>()V

    const/4 v0, 0x0

    .line 1419
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalElement;->requiredFeatures:Ljava/util/Set;

    .line 1420
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalElement;->requiredExtensions:Ljava/lang/String;

    .line 1421
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalElement;->systemLanguage:Ljava/util/Set;

    .line 1422
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalElement;->requiredFormats:Ljava/util/Set;

    .line 1423
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalElement;->requiredFonts:Ljava/util/Set;

    return-void
.end method


# virtual methods
.method public getRequiredExtensions()Ljava/lang/String;
    .locals 1

    .line 1432
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalElement;->requiredExtensions:Ljava/lang/String;

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

    .line 1428
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalElement;->requiredFeatures:Ljava/util/Set;

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

    .line 1444
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalElement;->requiredFonts:Ljava/util/Set;

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

    .line 1440
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalElement;->requiredFormats:Ljava/util/Set;

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

    .line 1436
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalElement;->systemLanguage:Ljava/util/Set;

    return-object v0
.end method

.method public setRequiredExtensions(Ljava/lang/String;)V
    .locals 0

    .line 1430
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalElement;->requiredExtensions:Ljava/lang/String;

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

    .line 1426
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalElement;->requiredFeatures:Ljava/util/Set;

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

    .line 1442
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalElement;->requiredFonts:Ljava/util/Set;

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

    .line 1438
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalElement;->requiredFormats:Ljava/util/Set;

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

    .line 1434
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalElement;->systemLanguage:Ljava/util/Set;

    return-void
.end method
