.class public Lcom/flyersoft/staticlayout/ArrayUtils;
.super Ljava/lang/Object;
.source "ArrayUtils.java"


# static fields
.field private static final CACHE_SIZE:I = 0x49

.field private static EMPTY:[Ljava/lang/Object;

.field private static sCache:[Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    .line 32
    new-array v0, v0, [Ljava/lang/Object;

    sput-object v0, Lcom/flyersoft/staticlayout/ArrayUtils;->EMPTY:[Ljava/lang/Object;

    const/16 v0, 0x49

    .line 34
    new-array v0, v0, [Ljava/lang/Object;

    sput-object v0, Lcom/flyersoft/staticlayout/ArrayUtils;->sCache:[Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static contains([Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;TT;)Z"
        }
    .end annotation

    .line 127
    array-length v0, p0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_2

    aget-object v3, p0, v2

    const/4 v4, 0x1

    if-nez v3, :cond_0

    if-nez p1, :cond_1

    return v4

    :cond_0
    if-eqz p1, :cond_1

    .line 131
    invoke-virtual {v3, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    return v4

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    return v1
.end method

.method public static emptyArray(Ljava/lang/Class;)[Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)[TT;"
        }
    .end annotation

    .line 103
    const-class v0, Ljava/lang/Object;

    if-ne p0, v0, :cond_0

    .line 104
    sget-object p0, Lcom/flyersoft/staticlayout/ArrayUtils;->EMPTY:[Ljava/lang/Object;

    return-object p0

    .line 107
    :cond_0
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v0

    div-int/lit8 v0, v0, 0x8

    const v1, 0x7fffffff

    and-int/2addr v0, v1

    rem-int/lit8 v0, v0, 0x49

    .line 108
    sget-object v1, Lcom/flyersoft/staticlayout/ArrayUtils;->sCache:[Ljava/lang/Object;

    aget-object v1, v1, v0

    if-eqz v1, :cond_1

    .line 110
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v2

    if-eq v2, p0, :cond_2

    :cond_1
    const/4 v1, 0x0

    .line 111
    invoke-static {p0, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v1

    .line 112
    sget-object p0, Lcom/flyersoft/staticlayout/ArrayUtils;->sCache:[Ljava/lang/Object;

    aput-object v1, p0, v0

    .line 117
    :cond_2
    check-cast v1, [Ljava/lang/Object;

    return-object v1
.end method

.method public static equals([B[BI)Z
    .locals 5

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p0, :cond_4

    if-eqz p1, :cond_4

    .line 86
    array-length v2, p0

    if-lt v2, p2, :cond_4

    array-length v2, p1

    if-ge v2, p2, :cond_1

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    :goto_0
    if-ge v2, p2, :cond_3

    .line 90
    aget-byte v3, p0, v2

    aget-byte v4, p1, v2

    if-eq v3, v4, :cond_2

    return v1

    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    return v0

    :cond_4
    :goto_1
    return v1
.end method

.method public static idealBooleanArraySize(I)I
    .locals 0

    .line 47
    invoke-static {p0}, Lcom/flyersoft/staticlayout/ArrayUtils;->idealByteArraySize(I)I

    move-result p0

    return p0
.end method

.method public static idealByteArraySize(I)I
    .locals 2

    const/4 v0, 0x4

    :goto_0
    const/16 v1, 0x20

    if-ge v0, v1, :cond_1

    const/4 v1, 0x1

    shl-int/2addr v1, v0

    add-int/lit8 v1, v1, -0xc

    if-gt p0, v1, :cond_0

    return v1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return p0
.end method

.method public static idealCharArraySize(I)I
    .locals 0

    mul-int/lit8 p0, p0, 0x2

    .line 55
    invoke-static {p0}, Lcom/flyersoft/staticlayout/ArrayUtils;->idealByteArraySize(I)I

    move-result p0

    div-int/lit8 p0, p0, 0x2

    return p0
.end method

.method public static idealFloatArraySize(I)I
    .locals 0

    mul-int/lit8 p0, p0, 0x4

    .line 63
    invoke-static {p0}, Lcom/flyersoft/staticlayout/ArrayUtils;->idealByteArraySize(I)I

    move-result p0

    div-int/lit8 p0, p0, 0x4

    return p0
.end method

.method public static idealIntArraySize(I)I
    .locals 0

    mul-int/lit8 p0, p0, 0x4

    .line 59
    invoke-static {p0}, Lcom/flyersoft/staticlayout/ArrayUtils;->idealByteArraySize(I)I

    move-result p0

    div-int/lit8 p0, p0, 0x4

    return p0
.end method

.method public static idealLongArraySize(I)I
    .locals 0

    mul-int/lit8 p0, p0, 0x8

    .line 71
    invoke-static {p0}, Lcom/flyersoft/staticlayout/ArrayUtils;->idealByteArraySize(I)I

    move-result p0

    div-int/lit8 p0, p0, 0x8

    return p0
.end method

.method public static idealObjectArraySize(I)I
    .locals 0

    mul-int/lit8 p0, p0, 0x4

    .line 67
    invoke-static {p0}, Lcom/flyersoft/staticlayout/ArrayUtils;->idealByteArraySize(I)I

    move-result p0

    div-int/lit8 p0, p0, 0x4

    return p0
.end method

.method public static idealShortArraySize(I)I
    .locals 0

    mul-int/lit8 p0, p0, 0x2

    .line 51
    invoke-static {p0}, Lcom/flyersoft/staticlayout/ArrayUtils;->idealByteArraySize(I)I

    move-result p0

    div-int/lit8 p0, p0, 0x2

    return p0
.end method
