.class public Lcom/flyersoft/components/androidsvg/RenderOptions;
.super Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;
.source "RenderOptions.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 49
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/flyersoft/components/androidsvg/RenderOptions;)V
    .locals 0

    .line 69
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;-><init>(Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;)V

    return-void
.end method

.method public static create()Lcom/flyersoft/components/androidsvg/RenderOptions;
    .locals 1

    .line 59
    new-instance v0, Lcom/flyersoft/components/androidsvg/RenderOptions;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/RenderOptions;-><init>()V

    return-object v0
.end method


# virtual methods
.method public css(Lcom/flyersoft/components/androidsvg/CSS;)Lcom/flyersoft/components/androidsvg/RenderOptions;
    .locals 0

    .line 93
    invoke-super {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->css(Lcom/flyersoft/components/androidsvg/CSS;)Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/components/androidsvg/RenderOptions;

    return-object p1
.end method

.method public css(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/RenderOptions;
    .locals 0

    .line 81
    invoke-super {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->css(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/components/androidsvg/RenderOptions;

    return-object p1
.end method

.method public bridge synthetic css(Lcom/flyersoft/components/androidsvg/CSS;)Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            null
        }
    .end annotation

    .line 40
    invoke-virtual {p0, p1}, Lcom/flyersoft/components/androidsvg/RenderOptions;->css(Lcom/flyersoft/components/androidsvg/CSS;)Lcom/flyersoft/components/androidsvg/RenderOptions;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic css(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            null
        }
    .end annotation

    .line 40
    invoke-virtual {p0, p1}, Lcom/flyersoft/components/androidsvg/RenderOptions;->css(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/RenderOptions;

    move-result-object p1

    return-object p1
.end method

.method public hasCss()Z
    .locals 1

    .line 103
    invoke-super {p0}, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->hasCss()Z

    move-result v0

    return v0
.end method

.method public hasPreserveAspectRatio()Z
    .locals 1

    .line 127
    invoke-super {p0}, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->hasPreserveAspectRatio()Z

    move-result v0

    return v0
.end method

.method public hasTarget()Z
    .locals 1

    .line 231
    invoke-super {p0}, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->hasTarget()Z

    move-result v0

    return v0
.end method

.method public hasView()Z
    .locals 1

    .line 153
    invoke-super {p0}, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->hasView()Z

    move-result v0

    return v0
.end method

.method public hasViewBox()Z
    .locals 1

    .line 181
    invoke-super {p0}, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->hasViewBox()Z

    move-result v0

    return v0
.end method

.method public hasViewPort()Z
    .locals 1

    .line 208
    invoke-super {p0}, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->hasViewPort()Z

    move-result v0

    return v0
.end method

.method public preserveAspectRatio(Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;)Lcom/flyersoft/components/androidsvg/RenderOptions;
    .locals 0

    .line 117
    invoke-super {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->preserveAspectRatio(Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;)Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/components/androidsvg/RenderOptions;

    return-object p1
.end method

.method public bridge synthetic preserveAspectRatio(Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;)Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            null
        }
    .end annotation

    .line 40
    invoke-virtual {p0, p1}, Lcom/flyersoft/components/androidsvg/RenderOptions;->preserveAspectRatio(Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;)Lcom/flyersoft/components/androidsvg/RenderOptions;

    move-result-object p1

    return-object p1
.end method

.method public target(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/RenderOptions;
    .locals 0

    .line 221
    invoke-super {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->target(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/components/androidsvg/RenderOptions;

    return-object p1
.end method

.method public bridge synthetic target(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            null
        }
    .end annotation

    .line 40
    invoke-virtual {p0, p1}, Lcom/flyersoft/components/androidsvg/RenderOptions;->target(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/RenderOptions;

    move-result-object p1

    return-object p1
.end method

.method public view(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/RenderOptions;
    .locals 0

    .line 143
    invoke-super {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->view(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/components/androidsvg/RenderOptions;

    return-object p1
.end method

.method public bridge synthetic view(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            null
        }
    .end annotation

    .line 40
    invoke-virtual {p0, p1}, Lcom/flyersoft/components/androidsvg/RenderOptions;->view(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/RenderOptions;

    move-result-object p1

    return-object p1
.end method

.method public viewBox(FFFF)Lcom/flyersoft/components/androidsvg/RenderOptions;
    .locals 0

    .line 171
    invoke-super {p0, p1, p2, p3, p4}, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->viewBox(FFFF)Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/components/androidsvg/RenderOptions;

    return-object p1
.end method

.method public bridge synthetic viewBox(FFFF)Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000,
            0x1000,
            0x1000
        }
        names = {
            null,
            null,
            null,
            null
        }
    .end annotation

    .line 40
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/flyersoft/components/androidsvg/RenderOptions;->viewBox(FFFF)Lcom/flyersoft/components/androidsvg/RenderOptions;

    move-result-object p1

    return-object p1
.end method

.method public viewPort(FFFF)Lcom/flyersoft/components/androidsvg/RenderOptions;
    .locals 0

    .line 198
    invoke-super {p0, p1, p2, p3, p4}, Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;->viewPort(FFFF)Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/components/androidsvg/RenderOptions;

    return-object p1
.end method

.method public bridge synthetic viewPort(FFFF)Lcom/flyersoft/components/androidsvg/utils/RenderOptionsBase;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000,
            0x1000,
            0x1000
        }
        names = {
            null,
            null,
            null,
            null
        }
    .end annotation

    .line 40
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/flyersoft/components/androidsvg/RenderOptions;->viewPort(FFFF)Lcom/flyersoft/components/androidsvg/RenderOptions;

    move-result-object p1

    return-object p1
.end method
