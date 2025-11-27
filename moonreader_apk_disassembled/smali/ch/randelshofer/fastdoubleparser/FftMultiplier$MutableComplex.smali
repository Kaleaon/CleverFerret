.class final Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;
.super Ljava/lang/Object;
.source "FftMultiplier.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lch/randelshofer/fastdoubleparser/FftMultiplier;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "MutableComplex"
.end annotation


# instance fields
.field imag:D

.field real:D


# direct methods
.method constructor <init>()V
    .locals 0

    .line 988
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method add(Lch/randelshofer/fastdoubleparser/FftMultiplier$ComplexVector;I)V
    .locals 4

    .line 997
    iget-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    invoke-virtual {p1, p2}, Lch/randelshofer/fastdoubleparser/FftMultiplier$ComplexVector;->real(I)D

    move-result-wide v2

    add-double/2addr v0, v2

    iput-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    .line 998
    iget-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    invoke-virtual {p1, p2}, Lch/randelshofer/fastdoubleparser/FftMultiplier$ComplexVector;->imag(I)D

    move-result-wide p1

    add-double/2addr v0, p1

    iput-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    return-void
.end method

.method add(Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;)V
    .locals 4

    .line 992
    iget-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    iget-wide v2, p1, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    add-double/2addr v0, v2

    iput-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    .line 993
    iget-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    iget-wide v2, p1, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    add-double/2addr v0, v2

    iput-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    return-void
.end method

.method addInto(Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;)V
    .locals 4

    .line 1006
    iget-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    iget-wide v2, p1, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    add-double/2addr v0, v2

    iput-wide v0, p2, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    .line 1007
    iget-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    iget-wide v2, p1, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    add-double/2addr v0, v2

    iput-wide v0, p2, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    return-void
.end method

.method addTimesI(Lch/randelshofer/fastdoubleparser/FftMultiplier$ComplexVector;I)V
    .locals 4

    .line 1019
    iget-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    invoke-virtual {p1, p2}, Lch/randelshofer/fastdoubleparser/FftMultiplier$ComplexVector;->imag(I)D

    move-result-wide v2

    sub-double/2addr v0, v2

    iput-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    .line 1020
    iget-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    invoke-virtual {p1, p2}, Lch/randelshofer/fastdoubleparser/FftMultiplier$ComplexVector;->real(I)D

    move-result-wide p1

    add-double/2addr v0, p1

    iput-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    return-void
.end method

.method addTimesI(Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;)V
    .locals 4

    .line 1014
    iget-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    iget-wide v2, p1, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    sub-double/2addr v0, v2

    iput-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    .line 1015
    iget-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    iget-wide v2, p1, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    add-double/2addr v0, v2

    iput-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    return-void
.end method

.method addTimesIInto(Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;)V
    .locals 4

    .line 1028
    iget-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    iget-wide v2, p1, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    sub-double/2addr v0, v2

    iput-wide v0, p2, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    .line 1029
    iget-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    iget-wide v2, p1, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    add-double/2addr v0, v2

    iput-wide v0, p2, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    return-void
.end method

.method copyInto(Lch/randelshofer/fastdoubleparser/FftMultiplier$ComplexVector;I)V
    .locals 2

    .line 1033
    iget-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    invoke-virtual {p1, p2, v0, v1}, Lch/randelshofer/fastdoubleparser/FftMultiplier$ComplexVector;->real(ID)V

    .line 1034
    iget-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    invoke-virtual {p1, p2, v0, v1}, Lch/randelshofer/fastdoubleparser/FftMultiplier$ComplexVector;->imag(ID)V

    return-void
.end method

.method multiply(Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;)V
    .locals 8

    .line 1038
    iget-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    .line 1039
    iget-wide v2, p1, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    iget-wide v4, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    neg-double v4, v4

    iget-wide v6, p1, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    mul-double v4, v4, v6

    invoke-static/range {v0 .. v5}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->fma(DDD)D

    move-result-wide v2

    iput-wide v2, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    .line 1040
    iget-wide v2, p1, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    iget-wide v4, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    iget-wide v6, p1, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    mul-double v4, v4, v6

    invoke-static/range {v0 .. v5}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->fma(DDD)D

    move-result-wide v0

    iput-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    return-void
.end method

.method multiplyConjugate(Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;)V
    .locals 10

    .line 1047
    iget-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    .line 1048
    iget-wide v2, p1, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    iget-wide v4, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    iget-wide v6, p1, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    mul-double v4, v4, v6

    invoke-static/range {v0 .. v5}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->fma(DDD)D

    move-result-wide v2

    iput-wide v2, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    neg-double v4, v0

    .line 1049
    iget-wide v6, p1, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    iget-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    iget-wide v2, p1, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    mul-double v8, v0, v2

    invoke-static/range {v4 .. v9}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->fma(DDD)D

    move-result-wide v0

    iput-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    return-void
.end method

.method set(Lch/randelshofer/fastdoubleparser/FftMultiplier$ComplexVector;I)V
    .locals 2

    .line 1053
    invoke-virtual {p1, p2}, Lch/randelshofer/fastdoubleparser/FftMultiplier$ComplexVector;->real(I)D

    move-result-wide v0

    iput-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    .line 1054
    invoke-virtual {p1, p2}, Lch/randelshofer/fastdoubleparser/FftMultiplier$ComplexVector;->imag(I)D

    move-result-wide p1

    iput-wide p1, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    return-void
.end method

.method squareInto(Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;)V
    .locals 6

    .line 1058
    iget-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    iget-wide v2, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    neg-double v4, v2

    mul-double v4, v4, v2

    move-wide v2, v0

    invoke-static/range {v0 .. v5}, Lch/randelshofer/fastdoubleparser/FastDoubleSwar;->fma(DDD)D

    move-result-wide v0

    iput-wide v0, p1, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    const-wide/high16 v0, 0x4000000000000000L    # 2.0

    .line 1059
    iget-wide v2, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    mul-double v2, v2, v0

    iget-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    mul-double v2, v2, v0

    iput-wide v2, p1, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    return-void
.end method

.method subtract(Lch/randelshofer/fastdoubleparser/FftMultiplier$ComplexVector;I)V
    .locals 4

    .line 1068
    iget-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    invoke-virtual {p1, p2}, Lch/randelshofer/fastdoubleparser/FftMultiplier$ComplexVector;->real(I)D

    move-result-wide v2

    sub-double/2addr v0, v2

    iput-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    .line 1069
    iget-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    invoke-virtual {p1, p2}, Lch/randelshofer/fastdoubleparser/FftMultiplier$ComplexVector;->imag(I)D

    move-result-wide p1

    sub-double/2addr v0, p1

    iput-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    return-void
.end method

.method subtract(Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;)V
    .locals 4

    .line 1063
    iget-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    iget-wide v2, p1, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    sub-double/2addr v0, v2

    iput-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    .line 1064
    iget-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    iget-wide v2, p1, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    sub-double/2addr v0, v2

    iput-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    return-void
.end method

.method subtractInto(Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;Lch/randelshofer/fastdoubleparser/FftMultiplier$ComplexVector;I)V
    .locals 4

    .line 1078
    iget-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    iget-wide v2, p1, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    sub-double/2addr v0, v2

    invoke-virtual {p2, p3, v0, v1}, Lch/randelshofer/fastdoubleparser/FftMultiplier$ComplexVector;->real(ID)V

    .line 1079
    iget-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    iget-wide v2, p1, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    sub-double/2addr v0, v2

    invoke-virtual {p2, p3, v0, v1}, Lch/randelshofer/fastdoubleparser/FftMultiplier$ComplexVector;->imag(ID)V

    return-void
.end method

.method subtractInto(Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;)V
    .locals 4

    .line 1073
    iget-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    iget-wide v2, p1, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    sub-double/2addr v0, v2

    iput-wide v0, p2, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    .line 1074
    iget-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    iget-wide v2, p1, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    sub-double/2addr v0, v2

    iput-wide v0, p2, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    return-void
.end method

.method subtractTimesI(Lch/randelshofer/fastdoubleparser/FftMultiplier$ComplexVector;I)V
    .locals 4

    .line 1088
    iget-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    invoke-virtual {p1, p2}, Lch/randelshofer/fastdoubleparser/FftMultiplier$ComplexVector;->imag(I)D

    move-result-wide v2

    add-double/2addr v0, v2

    iput-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    .line 1089
    iget-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    invoke-virtual {p1, p2}, Lch/randelshofer/fastdoubleparser/FftMultiplier$ComplexVector;->real(I)D

    move-result-wide p1

    sub-double/2addr v0, p1

    iput-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    return-void
.end method

.method subtractTimesI(Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;)V
    .locals 4

    .line 1083
    iget-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    iget-wide v2, p1, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    add-double/2addr v0, v2

    iput-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    .line 1084
    iget-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    iget-wide v2, p1, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    sub-double/2addr v0, v2

    iput-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    return-void
.end method

.method subtractTimesIInto(Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;)V
    .locals 4

    .line 1093
    iget-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    iget-wide v2, p1, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    add-double/2addr v0, v2

    iput-wide v0, p2, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    .line 1094
    iget-wide v0, p0, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    iget-wide v2, p1, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->real:D

    sub-double/2addr v0, v2

    iput-wide v0, p2, Lch/randelshofer/fastdoubleparser/FftMultiplier$MutableComplex;->imag:D

    return-void
.end method
