.class public Lcom/flyersoft/components/androidsvg/utils/CSSBase;
.super Ljava/lang/Object;
.source "CSSBase.java"


# instance fields
.field protected cssRuleset:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;


# direct methods
.method protected constructor <init>(Ljava/lang/String;)V
    .locals 3

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser;

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Source;->RenderOptions:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Source;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSParser;-><init>(Lcom/flyersoft/components/androidsvg/utils/CSSParser$Source;Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;)V

    invoke-virtual {v0, p1}, Lcom/flyersoft/components/androidsvg/utils/CSSParser;->parse(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSBase;->cssRuleset:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;

    return-void
.end method
