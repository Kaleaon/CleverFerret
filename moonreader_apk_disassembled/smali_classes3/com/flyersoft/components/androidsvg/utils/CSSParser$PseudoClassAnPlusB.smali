.class Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassAnPlusB;
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
    name = "PseudoClassAnPlusB"
.end annotation


# instance fields
.field private final a:I

.field private final b:I

.field private final isFromStart:Z

.field private final isOfType:Z

.field private final nodeName:Ljava/lang/String;


# direct methods
.method constructor <init>(IIZZLjava/lang/String;)V
    .locals 0

    .line 870
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 871
    iput p1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassAnPlusB;->a:I

    .line 872
    iput p2, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassAnPlusB;->b:I

    .line 873
    iput-boolean p3, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassAnPlusB;->isFromStart:Z

    .line 874
    iput-boolean p4, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassAnPlusB;->isOfType:Z

    .line 875
    iput-object p5, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassAnPlusB;->nodeName:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public matches(Lcom/flyersoft/components/androidsvg/utils/CSSParser$RuleMatchContext;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)Z
    .locals 6

    .line 883
    iget-boolean p1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassAnPlusB;->isOfType:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassAnPlusB;->nodeName:Ljava/lang/String;

    if-nez p1, :cond_0

    invoke-virtual {p2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->getNodeName()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassAnPlusB;->nodeName:Ljava/lang/String;

    .line 891
    :goto_0
    iget-object v0, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_4

    .line 893
    iget-object v0, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    invoke-interface {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;->getChildren()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :cond_1
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;

    .line 894
    check-cast v5, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;

    if-ne v5, p2, :cond_2

    move v3, v4

    :cond_2
    if-eqz p1, :cond_3

    .line 897
    invoke-virtual {v5}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->getNodeName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_4
    const/4 v3, 0x0

    const/4 v4, 0x1

    .line 902
    :cond_5
    iget-boolean p1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassAnPlusB;->isFromStart:Z

    if-eqz p1, :cond_6

    add-int/2addr v3, v2

    goto :goto_2

    :cond_6
    sub-int v3, v4, v3

    .line 907
    :goto_2
    iget p1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassAnPlusB;->a:I

    if-nez p1, :cond_8

    .line 910
    iget p1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassAnPlusB;->b:I

    if-ne v3, p1, :cond_7

    return v2

    :cond_7
    return v1

    .line 913
    :cond_8
    iget p2, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassAnPlusB;->b:I

    sub-int v0, v3, p2

    rem-int/2addr v0, p1

    if-nez v0, :cond_a

    sub-int p1, v3, p2

    .line 915
    invoke-static {p1}, Ljava/lang/Integer;->signum(I)I

    move-result p1

    if-eqz p1, :cond_9

    iget p1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassAnPlusB;->b:I

    sub-int/2addr v3, p1

    invoke-static {v3}, Ljava/lang/Integer;->signum(I)I

    move-result p1

    iget p2, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassAnPlusB;->a:I

    invoke-static {p2}, Ljava/lang/Integer;->signum(I)I

    move-result p2

    if-ne p1, p2, :cond_a

    :cond_9
    return v2

    :cond_a
    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 10

    .line 921
    iget-boolean v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassAnPlusB;->isFromStart:Z

    if-eqz v0, :cond_0

    const-string v0, ""

    goto :goto_0

    :cond_0
    const-string v0, "last-"

    .line 922
    :goto_0
    iget-boolean v1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassAnPlusB;->isOfType:Z

    const/4 v2, 0x2

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x3

    if-eqz v1, :cond_1

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    iget v6, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassAnPlusB;->a:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    iget v7, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassAnPlusB;->b:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    iget-object v8, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassAnPlusB;->nodeName:Ljava/lang/String;

    const/4 v9, 0x4

    new-array v9, v9, [Ljava/lang/Object;

    aput-object v0, v9, v4

    aput-object v6, v9, v3

    aput-object v7, v9, v2

    aput-object v8, v9, v5

    const-string v0, "nth-%schild(%dn%+d of type <%s>)"

    invoke-static {v1, v0, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 923
    :cond_1
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    iget v6, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassAnPlusB;->a:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    iget v7, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassAnPlusB;->b:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v0, v5, v4

    aput-object v6, v5, v3

    aput-object v7, v5, v2

    const-string v0, "nth-%schild(%dn%+d)"

    invoke-static {v1, v0, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
