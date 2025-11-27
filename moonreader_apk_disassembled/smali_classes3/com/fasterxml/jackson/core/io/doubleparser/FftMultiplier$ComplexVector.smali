.class final Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;
.super Ljava/lang/Object;
.source "FftMultiplier.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ComplexVector"
.end annotation


# static fields
.field private static final COMPLEX_SIZE_SHIFT:I = 0x1

.field private static final IMAG:I = 0x1

.field private static final REAL:I


# instance fields
.field private final a:[D

.field private final length:I

.field private final offset:I


# direct methods
.method constructor <init>(I)V
    .locals 1

    .line 753
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    shl-int/lit8 v0, p1, 0x1

    .line 754
    new-array v0, v0, [D

    iput-object v0, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    .line 755
    iput p1, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->length:I

    const/4 p1, 0x0

    .line 756
    iput p1, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->offset:I

    return-void
.end method

.method constructor <init>(Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;II)V
    .locals 0

    .line 766
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sub-int/2addr p3, p2

    .line 767
    iput p3, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->length:I

    .line 768
    iget-object p1, p1, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    iput-object p1, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    shl-int/lit8 p1, p2, 0x1

    .line 769
    iput p1, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->offset:I

    return-void
.end method

.method static synthetic access$000(Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;)I
    .locals 0

    .line 730
    iget p0, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->length:I

    return p0
.end method

.method private imagIdx(I)I
    .locals 1

    shl-int/lit8 p1, p1, 0x1

    .line 840
    iget v0, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->offset:I

    add-int/2addr p1, v0

    add-int/lit8 p1, p1, 0x1

    return p1
.end method

.method private realIdx(I)I
    .locals 1

    shl-int/lit8 p1, p1, 0x1

    .line 941
    iget v0, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->offset:I

    add-int/2addr p1, v0

    return p1
.end method


# virtual methods
.method add(ILcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;)V
    .locals 6

    .line 773
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->realIdx(I)I

    move-result v1

    aget-wide v2, v0, v1

    iget-wide v4, p2, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;->real:D

    add-double/2addr v2, v4

    aput-wide v2, v0, v1

    .line 774
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->imagIdx(I)I

    move-result p1

    aget-wide v1, v0, p1

    iget-wide v3, p2, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;->imag:D

    add-double/2addr v1, v3

    aput-wide v1, v0, p1

    return-void
.end method

.method addInto(ILcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;ILcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;)V
    .locals 5

    .line 778
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->realIdx(I)I

    move-result v1

    aget-wide v1, v0, v1

    invoke-virtual {p2, p3}, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->real(I)D

    move-result-wide v3

    add-double/2addr v1, v3

    iput-wide v1, p4, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;->real:D

    .line 779
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->imagIdx(I)I

    move-result p1

    aget-wide v1, v0, p1

    invoke-virtual {p2, p3}, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->imag(I)D

    move-result-wide p1

    add-double/2addr v1, p1

    iput-wide v1, p4, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;->imag:D

    return-void
.end method

.method addTimesIInto(ILcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;ILcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;)V
    .locals 5

    .line 783
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->realIdx(I)I

    move-result v1

    aget-wide v1, v0, v1

    invoke-virtual {p2, p3}, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->imag(I)D

    move-result-wide v3

    sub-double/2addr v1, v3

    iput-wide v1, p4, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;->real:D

    .line 784
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->imagIdx(I)I

    move-result p1

    aget-wide v1, v0, p1

    invoke-virtual {p2, p3}, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->real(I)D

    move-result-wide p1

    add-double/2addr v1, p1

    iput-wide v1, p4, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;->imag:D

    return-void
.end method

.method applyInverseWeights(Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;)V
    .locals 22

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 792
    iget v2, v0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->offset:I

    .line 793
    iget v3, v1, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->offset:I

    .line 794
    iget-object v1, v1, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    const/4 v4, 0x0

    .line 795
    :goto_0
    iget v5, v0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->length:I

    if-ge v4, v5, :cond_0

    .line 798
    iget-object v5, v0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    aget-wide v6, v5, v2

    add-int/lit8 v12, v2, 0x1

    .line 799
    aget-wide v13, v5, v12

    .line 800
    aget-wide v8, v1, v3

    add-int/lit8 v15, v3, 0x1

    aget-wide v10, v1, v15

    mul-double v10, v10, v13

    invoke-static/range {v6 .. v11}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->fma(DDD)D

    move-result-wide v8

    aput-wide v8, v5, v2

    .line 801
    iget-object v5, v0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    neg-double v6, v6

    aget-wide v18, v1, v15

    aget-wide v8, v1, v3

    mul-double v20, v13, v8

    move-wide/from16 v16, v6

    invoke-static/range {v16 .. v21}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->fma(DDD)D

    move-result-wide v6

    aput-wide v6, v5, v12

    add-int/lit8 v2, v2, 0x2

    add-int/lit8 v3, v3, 0x2

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method applyWeights(Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;)V
    .locals 9

    .line 815
    iget v0, p1, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->offset:I

    .line 816
    iget-object p1, p1, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    .line 817
    iget v1, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->offset:I

    iget v2, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->length:I

    add-int/2addr v2, v1

    shl-int/lit8 v2, v2, 0x1

    :goto_0
    if-ge v1, v2, :cond_0

    .line 819
    iget-object v3, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    aget-wide v4, v3, v1

    .line 820
    aget-wide v6, p1, v0

    mul-double v6, v6, v4

    aput-wide v6, v3, v1

    add-int/lit8 v6, v1, 0x1

    add-int/lit8 v7, v0, 0x1

    .line 821
    aget-wide v7, p1, v7

    mul-double v4, v4, v7

    aput-wide v4, v3, v6

    add-int/lit8 v0, v0, 0x2

    add-int/lit8 v1, v1, 0x2

    goto :goto_0

    :cond_0
    return-void
.end method

.method copyInto(ILcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;)V
    .locals 3

    .line 827
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->realIdx(I)I

    move-result v1

    aget-wide v1, v0, v1

    iput-wide v1, p2, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;->real:D

    .line 828
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->imagIdx(I)I

    move-result p1

    aget-wide v1, v0, p1

    iput-wide v1, p2, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;->imag:D

    return-void
.end method

.method imag(I)D
    .locals 3

    .line 832
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    shl-int/lit8 p1, p1, 0x1

    iget v1, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->offset:I

    add-int/2addr p1, v1

    add-int/lit8 p1, p1, 0x1

    aget-wide v1, v0, p1

    return-wide v1
.end method

.method imag(ID)V
    .locals 2

    .line 836
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    shl-int/lit8 p1, p1, 0x1

    iget v1, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->offset:I

    add-int/2addr p1, v1

    add-int/lit8 p1, p1, 0x1

    aput-wide p2, v0, p1

    return-void
.end method

.method multiply(ILcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;)V
    .locals 12

    .line 848
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->realIdx(I)I

    move-result v0

    .line 849
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->imagIdx(I)I

    move-result p1

    .line 850
    iget-object v1, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    aget-wide v2, v1, v0

    .line 851
    aget-wide v8, v1, p1

    .line 852
    iget-wide v4, p2, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;->real:D

    neg-double v6, v8

    iget-wide v10, p2, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;->imag:D

    mul-double v6, v6, v10

    invoke-static/range {v2 .. v7}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->fma(DDD)D

    move-result-wide v4

    aput-wide v4, v1, v0

    .line 853
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    iget-wide v4, p2, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;->imag:D

    iget-wide v6, p2, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;->real:D

    mul-double v6, v6, v8

    invoke-static/range {v2 .. v7}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->fma(DDD)D

    move-result-wide v1

    aput-wide v1, v0, p1

    return-void
.end method

.method multiplyByIAnd(ILcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;)V
    .locals 12

    .line 861
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->realIdx(I)I

    move-result v0

    .line 862
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->imagIdx(I)I

    move-result p1

    .line 863
    iget-object v1, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    aget-wide v2, v1, v0

    .line 864
    aget-wide v4, v1, p1

    neg-double v6, v2

    .line 865
    iget-wide v8, p2, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;->imag:D

    neg-double v4, v4

    iget-wide v10, p2, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;->real:D

    mul-double v10, v10, v4

    invoke-static/range {v6 .. v11}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->fma(DDD)D

    move-result-wide v6

    aput-wide v6, v1, v0

    .line 866
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    move-wide v6, v4

    iget-wide v4, p2, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;->real:D

    iget-wide v8, p2, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;->imag:D

    mul-double v6, v6, v8

    invoke-static/range {v2 .. v7}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->fma(DDD)D

    move-result-wide v1

    aput-wide v1, v0, p1

    return-void
.end method

.method multiplyConjugate(ILcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;)V
    .locals 19

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    .line 874
    invoke-direct/range {p0 .. p1}, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->realIdx(I)I

    move-result v2

    .line 875
    invoke-direct/range {p0 .. p1}, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->imagIdx(I)I

    move-result v3

    .line 876
    iget-object v4, v0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    aget-wide v5, v4, v2

    .line 877
    aget-wide v11, v4, v3

    .line 878
    iget-wide v7, v1, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;->real:D

    iget-wide v9, v1, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;->imag:D

    mul-double v9, v9, v11

    invoke-static/range {v5 .. v10}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->fma(DDD)D

    move-result-wide v7

    aput-wide v7, v4, v2

    .line 879
    iget-object v2, v0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    neg-double v13, v5

    iget-wide v4, v1, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;->imag:D

    iget-wide v6, v1, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;->real:D

    mul-double v17, v11, v6

    move-wide v15, v4

    invoke-static/range {v13 .. v18}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->fma(DDD)D

    move-result-wide v4

    aput-wide v4, v2, v3

    return-void
.end method

.method multiplyConjugateInto(ILcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;)V
    .locals 19

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    .line 883
    iget-object v3, v0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    invoke-direct/range {p0 .. p1}, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->realIdx(I)I

    move-result v4

    aget-wide v5, v3, v4

    .line 884
    iget-object v3, v0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    invoke-direct/range {p0 .. p1}, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->imagIdx(I)I

    move-result v4

    aget-wide v11, v3, v4

    .line 885
    iget-wide v7, v1, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;->real:D

    iget-wide v3, v1, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;->imag:D

    mul-double v9, v11, v3

    invoke-static/range {v5 .. v10}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->fma(DDD)D

    move-result-wide v3

    iput-wide v3, v2, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;->real:D

    neg-double v13, v5

    .line 886
    iget-wide v3, v1, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;->imag:D

    iget-wide v5, v1, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;->real:D

    mul-double v17, v11, v5

    move-wide v15, v3

    invoke-static/range {v13 .. v18}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->fma(DDD)D

    move-result-wide v3

    iput-wide v3, v2, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;->imag:D

    return-void
.end method

.method multiplyConjugateTimesI(ILcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;)V
    .locals 12

    .line 895
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->realIdx(I)I

    move-result v0

    .line 896
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->imagIdx(I)I

    move-result p1

    .line 897
    iget-object v1, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    aget-wide v2, v1, v0

    .line 898
    aget-wide v4, v1, p1

    neg-double v6, v2

    .line 899
    iget-wide v8, p2, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;->imag:D

    iget-wide v2, p2, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;->real:D

    mul-double v10, v4, v2

    invoke-static/range {v6 .. v11}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->fma(DDD)D

    move-result-wide v2

    aput-wide v2, v1, v0

    .line 900
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    iget-wide v8, p2, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;->real:D

    neg-double v1, v4

    iget-wide v3, p2, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;->imag:D

    mul-double v10, v1, v3

    invoke-static/range {v6 .. v11}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->fma(DDD)D

    move-result-wide v1

    aput-wide v1, v0, p1

    return-void
.end method

.method multiplyInto(ILcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;)V
    .locals 10

    .line 904
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->realIdx(I)I

    move-result v1

    aget-wide v2, v0, v1

    .line 905
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->imagIdx(I)I

    move-result p1

    aget-wide v8, v0, p1

    .line 906
    iget-wide v4, p2, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;->real:D

    neg-double v0, v8

    iget-wide v6, p2, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;->imag:D

    mul-double v6, v6, v0

    invoke-static/range {v2 .. v7}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->fma(DDD)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;->real:D

    .line 907
    iget-wide v4, p2, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;->imag:D

    iget-wide p1, p2, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;->real:D

    mul-double v6, v8, p1

    invoke-static/range {v2 .. v7}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->fma(DDD)D

    move-result-wide p1

    iput-wide p1, p3, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;->imag:D

    return-void
.end method

.method multiplyPointwise(Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;)V
    .locals 17

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 913
    iget v2, v1, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->offset:I

    .line 914
    iget-object v1, v1, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    .line 915
    iget v3, v0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->offset:I

    iget v4, v0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->length:I

    add-int/2addr v4, v3

    shl-int/lit8 v4, v4, 0x1

    :goto_0
    if-ge v3, v4, :cond_0

    .line 918
    iget-object v5, v0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    aget-wide v6, v5, v3

    add-int/lit8 v12, v3, 0x1

    .line 919
    aget-wide v13, v5, v12

    .line 920
    aget-wide v8, v1, v2

    add-int/lit8 v10, v2, 0x1

    .line 921
    aget-wide v15, v1, v10

    neg-double v10, v13

    mul-double v10, v10, v15

    .line 922
    invoke-static/range {v6 .. v11}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->fma(DDD)D

    move-result-wide v10

    aput-wide v10, v5, v3

    .line 923
    iget-object v5, v0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    mul-double v10, v13, v8

    move-wide v8, v15

    invoke-static/range {v6 .. v11}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->fma(DDD)D

    move-result-wide v6

    aput-wide v6, v5, v12

    add-int/lit8 v2, v2, 0x2

    add-int/lit8 v3, v3, 0x2

    goto :goto_0

    :cond_0
    return-void
.end method

.method part(II)D
    .locals 1

    .line 929
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    shl-int/lit8 p1, p1, 0x1

    add-int/2addr p1, p2

    aget-wide p1, v0, p1

    return-wide p1
.end method

.method real(I)D
    .locals 3

    .line 933
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    shl-int/lit8 p1, p1, 0x1

    iget v1, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->offset:I

    add-int/2addr p1, v1

    aget-wide v1, v0, p1

    return-wide v1
.end method

.method real(ID)V
    .locals 2

    .line 937
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    shl-int/lit8 p1, p1, 0x1

    iget v1, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->offset:I

    add-int/2addr p1, v1

    aput-wide p2, v0, p1

    return-void
.end method

.method set(IDD)V
    .locals 1

    .line 945
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->realIdx(I)I

    move-result p1

    .line 946
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    aput-wide p2, v0, p1

    add-int/lit8 p1, p1, 0x1

    .line 947
    aput-wide p4, v0, p1

    return-void
.end method

.method squarePointwise()V
    .locals 12

    .line 956
    iget v0, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->offset:I

    iget v1, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->length:I

    add-int/2addr v1, v0

    shl-int/lit8 v1, v1, 0x1

    :goto_0
    if-ge v0, v1, :cond_0

    .line 958
    iget-object v2, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    aget-wide v3, v2, v0

    add-int/lit8 v9, v0, 0x1

    .line 959
    aget-wide v10, v2, v9

    neg-double v5, v10

    mul-double v7, v5, v10

    move-wide v5, v3

    .line 960
    invoke-static/range {v3 .. v8}, Lcom/fasterxml/jackson/core/io/doubleparser/FastDoubleSwar;->fma(DDD)D

    move-result-wide v5

    aput-wide v5, v2, v0

    .line 961
    iget-object v2, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    const-wide/high16 v5, 0x4000000000000000L    # 2.0

    mul-double v3, v3, v5

    mul-double v3, v3, v10

    aput-wide v3, v2, v9

    add-int/lit8 v0, v0, 0x2

    goto :goto_0

    :cond_0
    return-void
.end method

.method subtractInto(ILcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;ILcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;)V
    .locals 5

    .line 966
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->realIdx(I)I

    move-result v1

    aget-wide v1, v0, v1

    invoke-virtual {p2, p3}, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->real(I)D

    move-result-wide v3

    sub-double/2addr v1, v3

    iput-wide v1, p4, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;->real:D

    .line 967
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->imagIdx(I)I

    move-result p1

    aget-wide v1, v0, p1

    invoke-virtual {p2, p3}, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->imag(I)D

    move-result-wide p1

    sub-double/2addr v1, p1

    iput-wide v1, p4, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;->imag:D

    return-void
.end method

.method subtractTimesIInto(ILcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;ILcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;)V
    .locals 5

    .line 971
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->realIdx(I)I

    move-result v1

    aget-wide v1, v0, v1

    invoke-virtual {p2, p3}, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->imag(I)D

    move-result-wide v3

    add-double/2addr v1, v3

    iput-wide v1, p4, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;->real:D

    .line 972
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->imagIdx(I)I

    move-result p1

    aget-wide v1, v0, p1

    invoke-virtual {p2, p3}, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->real(I)D

    move-result-wide p1

    sub-double/2addr v1, p1

    iput-wide v1, p4, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$MutableComplex;->imag:D

    return-void
.end method

.method timesTwoToThe(II)V
    .locals 6

    .line 976
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->realIdx(I)I

    move-result v0

    .line 977
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->imagIdx(I)I

    move-result p1

    .line 978
    iget-object v1, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    aget-wide v2, v1, v0

    .line 979
    aget-wide v4, v1, p1

    .line 980
    invoke-static {v2, v3, p2}, Ljava/lang/Math;->scalb(DI)D

    move-result-wide v2

    aput-wide v2, v1, v0

    .line 981
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/doubleparser/FftMultiplier$ComplexVector;->a:[D

    invoke-static {v4, v5, p2}, Ljava/lang/Math;->scalb(DI)D

    move-result-wide v1

    aput-wide v1, v0, p1

    return-void
.end method
