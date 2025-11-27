.class public Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;
.super Ljava/lang/Object;
.source "RenderOptionsBase.java"


# instance fields
.field css:Ljava/lang/String;

.field cssRuleset:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;

.field preserveAspectRatio:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

.field targetId:Ljava/lang/String;

.field viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

.field viewId:Ljava/lang/String;

.field viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 45
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->css:Ljava/lang/String;

    .line 46
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->cssRuleset:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;

    .line 48
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->preserveAspectRatio:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    .line 49
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->targetId:Ljava/lang/String;

    .line 50
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    .line 51
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->viewId:Ljava/lang/String;

    .line 52
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    return-void
.end method

.method public constructor <init>(Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;)V
    .locals 1

    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 45
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->css:Ljava/lang/String;

    .line 46
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->cssRuleset:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;

    .line 48
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->preserveAspectRatio:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    .line 49
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->targetId:Ljava/lang/String;

    .line 50
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    .line 51
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->viewId:Ljava/lang/String;

    .line 52
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    if-nez p1, :cond_0

    return-void

    .line 82
    :cond_0
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->css:Ljava/lang/String;

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->css:Ljava/lang/String;

    .line 83
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->cssRuleset:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->cssRuleset:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;

    .line 85
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->preserveAspectRatio:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->preserveAspectRatio:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    .line 86
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    .line 87
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->viewId:Ljava/lang/String;

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->viewId:Ljava/lang/String;

    .line 88
    iget-object v0, p1, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    .line 89
    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->targetId:Ljava/lang/String;

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->targetId:Ljava/lang/String;

    return-void
.end method

.method public static create()Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;
    .locals 1

    .line 70
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;-><init>()V

    return-object v0
.end method


# virtual methods
.method public css(Lcom/flyersoft/components/androidsvg/CSS;)Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;
    .locals 0

    .line 100
    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/CSS;->cssRuleset:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->cssRuleset:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;

    const/4 p1, 0x0

    .line 101
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->css:Ljava/lang/String;

    return-object p0
.end method

.method public css(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;
    .locals 0

    .line 107
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->css:Ljava/lang/String;

    const/4 p1, 0x0

    .line 108
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->cssRuleset:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;

    return-object p0
.end method

.method public hasCss()Z
    .locals 1

    .line 118
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->css:Ljava/lang/String;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-gtz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->cssRuleset:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Ruleset;

    if-eqz v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    return v0

    :cond_2
    const/4 v0, 0x0

    return v0
.end method

.method public hasPreserveAspectRatio()Z
    .locals 1

    .line 143
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->preserveAspectRatio:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public hasTarget()Z
    .locals 1

    .line 251
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->targetId:Ljava/lang/String;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public hasView()Z
    .locals 1

    .line 170
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->viewId:Ljava/lang/String;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public hasViewBox()Z
    .locals 1

    .line 199
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public hasViewPort()Z
    .locals 1

    .line 227
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public preserveAspectRatio(Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;)Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;
    .locals 0

    .line 132
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->preserveAspectRatio:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    return-object p0
.end method

.method public target(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;
    .locals 0

    .line 240
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->targetId:Ljava/lang/String;

    return-object p0
.end method

.method public view(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;
    .locals 0

    .line 159
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->viewId:Ljava/lang/String;

    return-object p0
.end method

.method public viewBox(FFFF)Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;
    .locals 1

    .line 188
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;-><init>(FFFF)V

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->viewBox:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    return-object p0
.end method

.method public viewPort(FFFF)Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;
    .locals 1

    .line 216
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;-><init>(FFFF)V

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->viewPort:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Box;

    return-object p0
.end method
