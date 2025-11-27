.class Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassOnlyChild;
.super Ljava/lang/Object;
.source "CSSParser.java"

# interfaces
.implements Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClass;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/CSSParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "PseudoClassOnlyChild"
.end annotation


# instance fields
.field private final isOfType:Z

.field private final nodeName:Ljava/lang/String;


# direct methods
.method public constructor <init>(ZLjava/lang/String;)V
    .locals 0

    .line 936
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 937
    iput-boolean p1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassOnlyChild;->isOfType:Z

    .line 938
    iput-object p2, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassOnlyChild;->nodeName:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public matches(Lcom/flyersoft/components/androidsvg/utils/CSSParser$RuleMatchContext;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)Z
    .locals 4

    .line 946
    iget-boolean p1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassOnlyChild;->isOfType:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassOnlyChild;->nodeName:Ljava/lang/String;

    if-nez p1, :cond_0

    invoke-virtual {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->getNodeName()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassOnlyChild;->nodeName:Ljava/lang/String;

    .line 953
    :goto_0
    iget-object v0, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_3

    .line 955
    iget-object p2, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    invoke-interface {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;->getChildren()Ljava/util/List;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    const/4 v0, 0x0

    :cond_1
    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;

    .line 956
    check-cast v3, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;

    if-eqz p1, :cond_2

    .line 957
    invoke-virtual {v3}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->getNodeName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_3
    const/4 v0, 0x1

    :cond_4
    if-ne v0, v2, :cond_5

    return v2

    :cond_5
    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 968
    iget-boolean v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassOnlyChild;->isOfType:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassOnlyChild;->nodeName:Ljava/lang/String;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    const-string v0, "only-of-type <%s>"

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 969
    :cond_0
    const-string v0, "only-child"

    return-object v0
.end method
