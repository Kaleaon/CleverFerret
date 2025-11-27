.class public Lcom/flyersoft/staticlayout/MySquigglySpan;
.super Landroid/text/style/CharacterStyle;
.source "MySquigglySpan.java"

# interfaces
.implements Landroid/text/style/UpdateAppearance;
.implements Landroid/text/ParcelableSpan;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Landroid/text/style/CharacterStyle;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 0

    .line 16
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

    const/16 v0, 0x70

    return v0
.end method

.method public getSpanTypeIdInternal()I
    .locals 1

    .line 38
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MySquigglySpan;->getSpanTypeId()I

    move-result v0

    return v0
.end method

.method public updateDrawState(Landroid/text/TextPaint;)V
    .locals 2

    const/4 v0, 0x1

    .line 32
    invoke-virtual {p1, v0}, Landroid/text/TextPaint;->setUnderlineText(Z)V

    .line 33
    invoke-static {p1}, Lcom/flyersoft/tools/A;->getPaintSkew(Landroid/graphics/Paint;)F

    move-result v0

    invoke-virtual {p1, v0}, Landroid/text/TextPaint;->setTextSkewX(F)V

    const/high16 v0, 0x3f800000    # 1.0f

    const/4 v1, -0x1

    .line 34
    invoke-virtual {p1, v0, v0, v0, v1}, Landroid/text/TextPaint;->setShadowLayer(FFFI)V

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    return-void
.end method

.method public writeToParcelInternal(Landroid/os/Parcel;I)V
    .locals 0

    .line 42
    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/staticlayout/MySquigglySpan;->writeToParcel(Landroid/os/Parcel;I)V

    return-void
.end method
