.class Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassTarget;
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
    name = "PseudoClassTarget"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1058
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public matches(Lcom/flyersoft/components/androidsvg/utils/CSSParser$RuleMatchContext;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)Z
    .locals 1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 1064
    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$RuleMatchContext;->targetElement:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;

    if-ne p2, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 1072
    const-string v0, "target"

    return-object v0
.end method
