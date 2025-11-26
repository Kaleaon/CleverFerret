.class public Lcom/flyersoft/staticlayout/MyShadowSpan;
.super Landroid/text/style/CharacterStyle;
.source "MyShadowSpan.java"

# interfaces
.implements Landroid/text/style/UpdateAppearance;
.implements Landroid/text/ParcelableSpan;


# instance fields
.field color:I

.field property:Ljava/lang/String;

.field r:F

.field x:F

.field y:F


# direct methods
.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 0

    .line 20
    invoke-direct {p0}, Landroid/text/style/CharacterStyle;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 16
    invoke-direct {p0}, Landroid/text/style/CharacterStyle;-><init>()V

    .line 17
    iput-object p1, p0, Lcom/flyersoft/staticlayout/MyShadowSpan;->property:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getSpanTypeId()I
    .locals 1

    const/16 v0, 0x71

    return v0
.end method

.method public getSpanTypeIdInternal()I
    .locals 1

    .line 71
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyShadowSpan;->getSpanTypeId()I

    move-result v0

    return v0
.end method

.method public updateDrawState(Landroid/text/TextPaint;)V
    .locals 6

    .line 38
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyShadowSpan;->property:Ljava/lang/String;

    const/high16 v1, 0x3f800000    # 1.0f

    if-eqz v0, :cond_5

    .line 39
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "shadow: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/flyersoft/staticlayout/MyShadowSpan;->property:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    invoke-static {v3}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 40
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyShadowSpan;->property:Ljava/lang/String;

    const-string v3, " +"

    invoke-virtual {v0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 41
    array-length v3, v0

    const/4 v5, 0x4

    if-ne v3, v5, :cond_4

    const/4 v3, 0x3

    .line 43
    aget-object v3, v0, v3

    invoke-static {v3}, Lcom/flyersoft/tools/T;->getHtmlColor(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    if-eqz v3, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    .line 47
    :cond_0
    aget-object v3, v0, v4

    invoke-static {v3}, Lcom/flyersoft/tools/T;->getHtmlColor(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    if-eqz v3, :cond_1

    goto :goto_0

    :cond_1
    const/4 v2, -0x1

    :goto_0
    if-eqz v3, :cond_4

    .line 52
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iput v3, p0, Lcom/flyersoft/staticlayout/MyShadowSpan;->color:I

    .line 53
    aget-object v3, v0, v2

    invoke-static {v3}, Lcom/flyersoft/components/CSS;->getBorderSize(Ljava/lang/String;)F

    move-result v3

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v4

    mul-float v3, v3, v4

    iput v3, p0, Lcom/flyersoft/staticlayout/MyShadowSpan;->x:F

    add-int/lit8 v3, v2, 0x1

    .line 54
    aget-object v3, v0, v3

    invoke-static {v3}, Lcom/flyersoft/components/CSS;->getBorderSize(Ljava/lang/String;)F

    move-result v3

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v4

    mul-float v3, v3, v4

    iput v3, p0, Lcom/flyersoft/staticlayout/MyShadowSpan;->y:F

    add-int/lit8 v2, v2, 0x2

    .line 55
    aget-object v0, v0, v2

    invoke-static {v0}, Lcom/flyersoft/components/CSS;->getBorderSize(Ljava/lang/String;)F

    move-result v0

    invoke-static {}, Lcom/flyersoft/components/CSS;->EM()F

    move-result v2

    mul-float v0, v0, v2

    iput v0, p0, Lcom/flyersoft/staticlayout/MyShadowSpan;->r:F

    const/4 v2, 0x0

    cmpl-float v0, v0, v2

    if-nez v0, :cond_2

    const/high16 v0, 0x3f000000    # 0.5f

    .line 56
    invoke-static {v0}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v0

    iput v0, p0, Lcom/flyersoft/staticlayout/MyShadowSpan;->r:F

    .line 57
    :cond_2
    iget v0, p0, Lcom/flyersoft/staticlayout/MyShadowSpan;->r:F

    cmpg-float v0, v0, v1

    if-gez v0, :cond_3

    iput v1, p0, Lcom/flyersoft/staticlayout/MyShadowSpan;->r:F

    .line 58
    :cond_3
    iget v0, p0, Lcom/flyersoft/staticlayout/MyShadowSpan;->r:F

    const/high16 v2, 0x41c80000    # 25.0f

    cmpl-float v0, v0, v2

    if-lez v0, :cond_4

    const/high16 v0, 0x41c00000    # 24.0f

    iput v0, p0, Lcom/flyersoft/staticlayout/MyShadowSpan;->r:F

    :cond_4
    const/4 v0, 0x0

    .line 61
    iput-object v0, p0, Lcom/flyersoft/staticlayout/MyShadowSpan;->property:Ljava/lang/String;

    .line 63
    :cond_5
    iget v0, p0, Lcom/flyersoft/staticlayout/MyShadowSpan;->color:I

    if-nez v0, :cond_7

    .line 64
    invoke-static {v1}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v0

    iput v0, p0, Lcom/flyersoft/staticlayout/MyShadowSpan;->y:F

    iput v0, p0, Lcom/flyersoft/staticlayout/MyShadowSpan;->x:F

    iput v0, p0, Lcom/flyersoft/staticlayout/MyShadowSpan;->r:F

    .line 65
    invoke-virtual {p1}, Landroid/text/TextPaint;->getColor()I

    move-result v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->isWhiteFont(I)Z

    move-result v0

    if-eqz v0, :cond_6

    const v0, -0xeeeeef

    goto :goto_1

    :cond_6
    const v0, -0xbbbbbc

    :goto_1
    iput v0, p0, Lcom/flyersoft/staticlayout/MyShadowSpan;->color:I

    .line 67
    :cond_7
    iget v0, p0, Lcom/flyersoft/staticlayout/MyShadowSpan;->r:F

    iget v1, p0, Lcom/flyersoft/staticlayout/MyShadowSpan;->x:F

    iget v2, p0, Lcom/flyersoft/staticlayout/MyShadowSpan;->y:F

    iget v3, p0, Lcom/flyersoft/staticlayout/MyShadowSpan;->color:I

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/text/TextPaint;->setShadowLayer(FFFI)V

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    return-void
.end method

.method public writeToParcelInternal(Landroid/os/Parcel;I)V
    .locals 0

    .line 75
    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/staticlayout/MyShadowSpan;->writeToParcel(Landroid/os/Parcel;I)V

    return-void
.end method
