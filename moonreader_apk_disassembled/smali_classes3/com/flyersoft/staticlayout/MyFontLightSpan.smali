.class public Lcom/flyersoft/staticlayout/MyFontLightSpan;
.super Landroid/text/style/CharacterStyle;
.source "MyFontLightSpan.java"

# interfaces
.implements Landroid/text/style/UpdateAppearance;
.implements Landroid/text/ParcelableSpan;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Landroid/text/style/CharacterStyle;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 0

    .line 17
    invoke-direct {p0}, Landroid/text/style/CharacterStyle;-><init>()V

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

    const/16 v0, 0x73

    return v0
.end method

.method public getSpanTypeIdInternal()I
    .locals 1

    .line 72
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyFontLightSpan;->getSpanTypeId()I

    move-result v0

    return v0
.end method

.method public updateDrawState(Landroid/text/TextPaint;)V
    .locals 4

    .line 37
    invoke-virtual {p1}, Landroid/text/TextPaint;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    .line 41
    :cond_0
    invoke-virtual {v0}, Landroid/graphics/Typeface;->getStyle()I

    move-result v1

    :goto_0
    and-int/lit8 v2, v1, 0x1

    if-nez v2, :cond_1

    return-void

    :cond_1
    and-int/lit8 v2, v1, 0x2

    if-nez v0, :cond_2

    .line 51
    invoke-static {v2}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    move-result-object v0

    goto :goto_1

    .line 53
    :cond_2
    invoke-static {v0, v2}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object v0

    .line 56
    :goto_1
    invoke-virtual {v0}, Landroid/graphics/Typeface;->getStyle()I

    move-result v3

    not-int v3, v3

    and-int/2addr v2, v3

    and-int/lit8 v2, v2, 0x2

    if-eqz v2, :cond_3

    .line 63
    invoke-static {p1}, Lcom/flyersoft/tools/A;->getPaintSkew(Landroid/graphics/Paint;)F

    move-result v1

    invoke-virtual {p1, v1}, Landroid/text/TextPaint;->setTextSkewX(F)V

    goto :goto_2

    .line 65
    :cond_3
    invoke-static {p1, v1}, Lcom/flyersoft/tools/A;->verifyPaintCustomSkew(Landroid/graphics/Paint;I)V

    .line 67
    :goto_2
    invoke-virtual {p1, v0}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    return-void
.end method

.method public writeToParcelInternal(Landroid/os/Parcel;I)V
    .locals 0

    .line 76
    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/staticlayout/MyFontLightSpan;->writeToParcel(Landroid/os/Parcel;I)V

    return-void
.end method
