.class public Lcom/flyersoft/staticlayout/MyTypefaceSpan;
.super Landroid/text/style/MetricAffectingSpan;
.source "MyTypefaceSpan.java"

# interfaces
.implements Landroid/text/ParcelableSpan;


# instance fields
.field private final mFamily:Ljava/lang/String;

.field private mIgnoreReplacement:Z


# direct methods
.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 0

    .line 29
    invoke-direct {p0}, Landroid/text/style/MetricAffectingSpan;-><init>()V

    .line 30
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/staticlayout/MyTypefaceSpan;->mFamily:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 20
    invoke-direct {p0}, Landroid/text/style/MetricAffectingSpan;-><init>()V

    .line 21
    iput-object p1, p0, Lcom/flyersoft/staticlayout/MyTypefaceSpan;->mFamily:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 0

    .line 24
    invoke-direct {p0}, Landroid/text/style/MetricAffectingSpan;-><init>()V

    .line 25
    iput-boolean p2, p0, Lcom/flyersoft/staticlayout/MyTypefaceSpan;->mIgnoreReplacement:Z

    .line 26
    iput-object p1, p0, Lcom/flyersoft/staticlayout/MyTypefaceSpan;->mFamily:Ljava/lang/String;

    return-void
.end method

.method private apply(Landroid/graphics/Paint;Ljava/lang/String;)V
    .locals 3

    .line 65
    invoke-virtual {p1}, Landroid/graphics/Paint;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    .line 69
    :cond_0
    invoke-virtual {v0}, Landroid/graphics/Typeface;->getStyle()I

    move-result v0

    .line 73
    :goto_0
    iget-boolean v2, p0, Lcom/flyersoft/staticlayout/MyTypefaceSpan;->mIgnoreReplacement:Z

    invoke-static {p2, v0, v1, v1, v2}, Lcom/flyersoft/tools/A;->getTypeFace2(Ljava/lang/String;IZZZ)Landroid/graphics/Typeface;

    move-result-object p2

    .line 74
    invoke-virtual {p2}, Landroid/graphics/Typeface;->getStyle()I

    move-result v1

    not-int v1, v1

    and-int/2addr v1, v0

    and-int/lit8 v2, v1, 0x1

    if-eqz v2, :cond_1

    const/4 v2, 0x1

    .line 77
    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    :cond_1
    and-int/lit8 v1, v1, 0x2

    if-eqz v1, :cond_2

    .line 81
    invoke-static {p1}, Lcom/flyersoft/tools/A;->getPaintSkew(Landroid/graphics/Paint;)F

    move-result v0

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setTextSkewX(F)V

    goto :goto_1

    .line 83
    :cond_2
    invoke-static {p1, v0}, Lcom/flyersoft/tools/A;->verifyPaintCustomSkew(Landroid/graphics/Paint;I)V

    .line 85
    :goto_1
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getFamily()Ljava/lang/String;
    .locals 1

    .line 49
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyTypefaceSpan;->mFamily:Ljava/lang/String;

    return-object v0
.end method

.method public getSpanTypeId()I
    .locals 1

    const/16 v0, 0x514

    return v0
.end method

.method public getSpanTypeIdInternal()I
    .locals 1

    .line 89
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/MyTypefaceSpan;->getSpanTypeId()I

    move-result v0

    return v0
.end method

.method public updateDrawState(Landroid/text/TextPaint;)V
    .locals 1

    .line 54
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyTypefaceSpan;->mFamily:Ljava/lang/String;

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/staticlayout/MyTypefaceSpan;->apply(Landroid/graphics/Paint;Ljava/lang/String;)V

    return-void
.end method

.method public updateMeasureState(Landroid/text/TextPaint;)V
    .locals 1

    .line 59
    iget-object v0, p0, Lcom/flyersoft/staticlayout/MyTypefaceSpan;->mFamily:Ljava/lang/String;

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/staticlayout/MyTypefaceSpan;->apply(Landroid/graphics/Paint;Ljava/lang/String;)V

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 42
    iget-object p2, p0, Lcom/flyersoft/staticlayout/MyTypefaceSpan;->mFamily:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return-void
.end method

.method public writeToParcelInternal(Landroid/os/Parcel;I)V
    .locals 0

    .line 93
    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/staticlayout/MyTypefaceSpan;->writeToParcel(Landroid/os/Parcel;I)V

    return-void
.end method
