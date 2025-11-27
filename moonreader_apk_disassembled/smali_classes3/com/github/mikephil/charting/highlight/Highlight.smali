.class public Lcom/github/mikephil/charting/highlight/Highlight;
.super Ljava/lang/Object;
.source "Highlight.java"


# instance fields
.field private axis:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

.field private mDataIndex:I

.field private mDataSetIndex:I

.field private mDrawX:F

.field private mDrawY:F

.field private mStackIndex:I

.field private mX:F

.field private mXPx:F

.field private mY:F

.field private mYPx:F


# direct methods
.method public constructor <init>(FFFFIILcom/github/mikephil/charting/components/YAxis$AxisDependency;)V
    .locals 7

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move-object v6, p7

    .line 100
    invoke-direct/range {v0 .. v6}, Lcom/github/mikephil/charting/highlight/Highlight;-><init>(FFFFILcom/github/mikephil/charting/components/YAxis$AxisDependency;)V

    .line 101
    iput p6, v0, Lcom/github/mikephil/charting/highlight/Highlight;->mStackIndex:I

    return-void
.end method

.method public constructor <init>(FFFFILcom/github/mikephil/charting/components/YAxis$AxisDependency;)V
    .locals 1

    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 36
    iput v0, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mDataIndex:I

    .line 46
    iput v0, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mStackIndex:I

    .line 82
    iput p1, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mX:F

    .line 83
    iput p2, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mY:F

    .line 84
    iput p3, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mXPx:F

    .line 85
    iput p4, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mYPx:F

    .line 86
    iput p5, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mDataSetIndex:I

    .line 87
    iput-object p6, p0, Lcom/github/mikephil/charting/highlight/Highlight;->axis:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    return-void
.end method

.method public constructor <init>(FFI)V
    .locals 1

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 36
    iput v0, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mDataIndex:I

    .line 46
    iput v0, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mStackIndex:I

    .line 64
    iput p1, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mX:F

    .line 65
    iput p2, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mY:F

    .line 66
    iput p3, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mDataSetIndex:I

    return-void
.end method

.method public constructor <init>(FII)V
    .locals 1

    const/high16 v0, 0x7fc00000    # Float.NaN

    .line 70
    invoke-direct {p0, p1, v0, p2}, Lcom/github/mikephil/charting/highlight/Highlight;-><init>(FFI)V

    .line 71
    iput p3, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mStackIndex:I

    return-void
.end method


# virtual methods
.method public equalTo(Lcom/github/mikephil/charting/highlight/Highlight;)Z
    .locals 3

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 222
    :cond_0
    iget v1, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mDataSetIndex:I

    iget v2, p1, Lcom/github/mikephil/charting/highlight/Highlight;->mDataSetIndex:I

    if-ne v1, v2, :cond_1

    iget v1, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mX:F

    iget v2, p1, Lcom/github/mikephil/charting/highlight/Highlight;->mX:F

    cmpl-float v1, v1, v2

    if-nez v1, :cond_1

    iget v1, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mStackIndex:I

    iget v2, p1, Lcom/github/mikephil/charting/highlight/Highlight;->mStackIndex:I

    if-ne v1, v2, :cond_1

    iget v1, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mDataIndex:I

    iget p1, p1, Lcom/github/mikephil/charting/highlight/Highlight;->mDataIndex:I

    if-ne v1, p1, :cond_1

    const/4 p1, 0x1

    return p1

    :cond_1
    return v0
.end method

.method public getAxis()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;
    .locals 1

    .line 178
    iget-object v0, p0, Lcom/github/mikephil/charting/highlight/Highlight;->axis:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    return-object v0
.end method

.method public getDataIndex()I
    .locals 1

    .line 142
    iget v0, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mDataIndex:I

    return v0
.end method

.method public getDataSetIndex()I
    .locals 1

    .line 155
    iget v0, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mDataSetIndex:I

    return v0
.end method

.method public getDrawX()F
    .locals 1

    .line 198
    iget v0, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mDrawX:F

    return v0
.end method

.method public getDrawY()F
    .locals 1

    .line 207
    iget v0, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mDrawY:F

    return v0
.end method

.method public getStackIndex()I
    .locals 1

    .line 165
    iget v0, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mStackIndex:I

    return v0
.end method

.method public getX()F
    .locals 1

    .line 110
    iget v0, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mX:F

    return v0
.end method

.method public getXPx()F
    .locals 1

    .line 126
    iget v0, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mXPx:F

    return v0
.end method

.method public getY()F
    .locals 1

    .line 119
    iget v0, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mY:F

    return v0
.end method

.method public getYPx()F
    .locals 1

    .line 133
    iget v0, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mYPx:F

    return v0
.end method

.method public isStacked()Z
    .locals 1

    .line 169
    iget v0, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mStackIndex:I

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setDataIndex(I)V
    .locals 0

    .line 146
    iput p1, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mDataIndex:I

    return-void
.end method

.method public setDraw(FF)V
    .locals 0

    .line 188
    iput p1, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mDrawX:F

    .line 189
    iput p2, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mDrawY:F

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 232
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Highlight, x: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mX:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ", y: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mY:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ", dataSetIndex: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mDataSetIndex:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", stackIndex (only stacked barentry): "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mStackIndex:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
