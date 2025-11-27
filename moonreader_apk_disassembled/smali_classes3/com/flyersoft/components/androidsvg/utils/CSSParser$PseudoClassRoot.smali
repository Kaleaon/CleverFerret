.class Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassRoot;
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
    name = "PseudoClassRoot"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 975
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public matches(Lcom/flyersoft/components/androidsvg/utils/CSSParser$RuleMatchContext;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;)Z
    .locals 0

    .line 980
    iget-object p1, p2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgElementBase;->parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;

    if-nez p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 986
    const-string v0, "root"

    return-object v0
.end method
