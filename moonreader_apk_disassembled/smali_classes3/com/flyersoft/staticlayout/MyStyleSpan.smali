.class public Lcom/flyersoft/staticlayout/MyStyleSpan;
.super Landroid/text/style/MetricAffectingSpan;
.source "MyStyleSpan.java"

# interfaces
.implements Landroid/text/ParcelableSpan;


# instance fields
.field private final mFontWeightAdjustment:I

.field private final mStyle:I


# direct methods
.method public constructor <init>(I)V
    .locals 1

    const v0, 0x7fffffff

    .line 20
    invoke-direct {p0, p1, v0}, Lcom/flyersoft/staticlayout/MyStyleSpan;-><init>(II)V

    return-void
.end method

.method public constructor <init>(II)V
    .locals 0

    .line 23
    invoke-direct {p0}, Landroid/text/style/MetricAffectingSpan;-><init>()V

    .line 24
    iput p1, p0, Lcom/flyersoft/staticlayout/MyStyleSpan;->mStyle:I

    .line 25
    iput p2, p0, Lcom/flyersoft/staticlayout/MyStyleSpan;->mFontWeightAdjustment:I

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    .line 28
    invoke-direct {p0}, Landroid/text/style/MetricAffectingSpan;-><init>()V

    .line 29
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/staticlayout/MyStyleSpan;->mStyle:I

    .line 30
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/flyersoft/staticlayout/MyStyleSpan;->mFontWeightAdjustment:I

    return-void
.end method

.method private static apply(Landroid/graphics/Paint;II)V
    .locals 5

    .line 87
    invoke-virtual {p0}, Landroid/graphics/Paint;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    .line 91
    :cond_0
    invoke-virtual {v0}, Landroid/graphics/Typeface;->getStyle()I

    move-result v2

    :goto_0
    or-int/2addr v2, p1

    if-nez v0, :cond_1

    .line 98
    invoke-static {v2}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    move-result-object v0

    goto :goto_1

    .line 100
    :cond_1
    invoke-static {v0, v2}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object v0

    .line 104
    :goto_1
    invoke-static {}, Lcom/flyersoft/tools/A;->AndroidP()Z

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_3

    and-int/lit8 v3, p1, 0x1

    if-eqz v3, :cond_3

    if-eqz p2, :cond_3

    const v3, 0x7fffffff

    if-eq p2, v3, :cond_3

    .line 109
    invoke-static {v0}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/graphics/Typeface;)I

    move-result v3

    add-int/2addr v3, p2

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result p2

    const/16 v3, 0x3e8

    .line 108
    invoke-static {p2, v3}, Ljava/lang/Math;->min(II)I

    move-result p2

    and-int/lit8 v3, v2, 0x2

    if-eqz v3, :cond_2

    const/4 v1, 0x1

    .line 112
    :cond_2
    invoke-static {v0, p2, v1}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/graphics/Typeface;IZ)Landroid/graphics/Typeface;

    move-result-object v0

    .line 116
    :cond_3
    invoke-virtual {v0}, Landroid/graphics/Typeface;->getStyle()I

    move-result p2

    not-int p2, p2

    and-int/2addr p2, v2

    and-int/lit8 v1, p2, 0x1

    if-eqz v1, :cond_4

    .line 119
    invoke-virtual {p0, v4}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    :cond_4
    and-int/lit8 p2, p2, 0x2

    if-eqz p2, :cond_5

    .line 123
    invoke-static {p0}, Lcom/flyersoft/tools/A;->getPaintSkew(Landroid/graphics/Paint;)F

    move-result p1

    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setTextSkewX(F)V

    goto :goto_2

    .line 125
    :cond_5
    invoke-static {p0, p1}, Lcom/flyersoft/tools/A;->verifyPaintCustomSkew(Landroid/graphics/Paint;I)V

    .line 127
    :goto_2
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getFontWeightAdjustment()I
    .locals 1

    .line 71
    iget v0, p0, Lcom/flyersoft/staticlayout/MyStyleSpan;->mFontWeightAdjustment:I

    return v0
.end method

.method public getSpanTypeId()I
    .locals 1

    .line 35
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyStyleSpan;->getSpanTypeIdInternal()I

    move-result v0

    return v0
.end method

.method public getSpanTypeIdInternal()I
    .locals 1

    const/16 v0, 0x2bc

    return v0
.end method

.method public getStyle()I
    .locals 1

    .line 61
    iget v0, p0, Lcom/flyersoft/staticlayout/MyStyleSpan;->mStyle:I

    return v0
.end method

.method public updateDrawState(Landroid/text/TextPaint;)V
    .locals 2

    .line 76
    iget v0, p0, Lcom/flyersoft/staticlayout/MyStyleSpan;->mStyle:I

    iget v1, p0, Lcom/flyersoft/staticlayout/MyStyleSpan;->mFontWeightAdjustment:I

    invoke-static {p1, v0, v1}, Lcom/flyersoft/staticlayout/MyStyleSpan;->apply(Landroid/graphics/Paint;II)V

    return-void
.end method

.method public updateMeasureState(Landroid/text/TextPaint;)V
    .locals 2

    .line 81
    iget v0, p0, Lcom/flyersoft/staticlayout/MyStyleSpan;->mStyle:I

    iget v1, p0, Lcom/flyersoft/staticlayout/MyStyleSpan;->mFontWeightAdjustment:I

    invoke-static {p1, v0, v1}, Lcom/flyersoft/staticlayout/MyStyleSpan;->apply(Landroid/graphics/Paint;II)V

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 49
    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/staticlayout/MyStyleSpan;->writeToParcelInternal(Landroid/os/Parcel;I)V

    return-void
.end method

.method public writeToParcelInternal(Landroid/os/Parcel;I)V
    .locals 0

    .line 53
    iget p2, p0, Lcom/flyersoft/staticlayout/MyStyleSpan;->mStyle:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 54
    iget p2, p0, Lcom/flyersoft/staticlayout/MyStyleSpan;->mFontWeightAdjustment:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
