.class public Lcom/vladsch/flexmark/util/sequence/Range;
.super Ljava/lang/Object;
.source "Range.java"


# static fields
.field public static final NULL:Lcom/vladsch/flexmark/util/sequence/Range;


# instance fields
.field private final myEnd:I

.field private final myStart:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 4
    new-instance v0, Lcom/vladsch/flexmark/util/sequence/Range;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1}, Lcom/vladsch/flexmark/util/sequence/Range;-><init>(II)V

    sput-object v0, Lcom/vladsch/flexmark/util/sequence/Range;->NULL:Lcom/vladsch/flexmark/util/sequence/Range;

    return-void
.end method

.method public constructor <init>(II)V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput p1, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    .line 27
    iput p2, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/Range;)V
    .locals 1

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iget v0, p1, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    iput v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    .line 32
    iget p1, p1, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    iput p1, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    return-void
.end method

.method public static of(II)Lcom/vladsch/flexmark/util/sequence/Range;
    .locals 1

    .line 7
    new-instance v0, Lcom/vladsch/flexmark/util/sequence/Range;

    invoke-direct {v0, p0, p1}, Lcom/vladsch/flexmark/util/sequence/Range;-><init>(II)V

    return-object v0
.end method


# virtual methods
.method public compare(Lcom/vladsch/flexmark/util/sequence/Range;)I
    .locals 4

    .line 149
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    iget v1, p1, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    const/4 v2, -0x1

    if-ge v0, v1, :cond_0

    return v2

    :cond_0
    const/4 v3, 0x1

    if-le v0, v1, :cond_1

    return v3

    .line 153
    :cond_1
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    iget p1, p1, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    if-le v0, p1, :cond_2

    return v2

    :cond_2
    if-ge v0, p1, :cond_3

    return v3

    :cond_3
    const/4 p1, 0x0

    return p1
.end method

.method public component1()I
    .locals 1

    .line 17
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    return v0
.end method

.method public component2()I
    .locals 1

    .line 19
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    return v0
.end method

.method public contains(I)Z
    .locals 1

    .line 56
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    if-gt v0, p1, :cond_0

    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    if-ge p1, v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public contains(II)Z
    .locals 1

    .line 60
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    if-gt v0, p1, :cond_0

    iget p1, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    if-gt p2, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public doesContain(I)Z
    .locals 1

    .line 100
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    if-lt p1, v0, :cond_0

    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    if-ge p1, v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public doesContain(Lcom/vladsch/flexmark/util/sequence/Range;)Z
    .locals 2

    .line 85
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    iget v1, p1, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    if-lt v0, v1, :cond_0

    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    iget p1, p1, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    if-gt v0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public doesNotOverlap(Lcom/vladsch/flexmark/util/sequence/Range;)Z
    .locals 2

    .line 79
    iget v0, p1, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    iget v1, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    if-le v0, v1, :cond_1

    iget p1, p1, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    if-lt p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method public doesOverlap(Lcom/vladsch/flexmark/util/sequence/Range;)Z
    .locals 2

    .line 81
    iget v0, p1, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    iget v1, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    if-le v0, v1, :cond_0

    iget p1, p1, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    if-ge p1, v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public doesProperlyContain(Lcom/vladsch/flexmark/util/sequence/Range;)Z
    .locals 2

    .line 87
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    iget v1, p1, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    if-le v0, v1, :cond_0

    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    iget p1, p1, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    if-ge v0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    .line 221
    :cond_0
    instance-of v1, p1, Lcom/vladsch/flexmark/util/sequence/Range;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 222
    :cond_1
    check-cast p1, Lcom/vladsch/flexmark/util/sequence/Range;

    .line 223
    iget v1, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    iget v3, p1, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    if-ne v1, v3, :cond_2

    iget v1, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    iget p1, p1, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    if-ne v1, p1, :cond_2

    return v0

    :cond_2
    return v2
.end method

.method public exclude(Lcom/vladsch/flexmark/util/sequence/Range;)Lcom/vladsch/flexmark/util/sequence/Range;
    .locals 3

    .line 138
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    .line 139
    iget v1, p1, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    if-lt v0, v1, :cond_0

    iget v2, p1, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    if-ge v0, v2, :cond_0

    move v0, v2

    .line 141
    :cond_0
    iget v2, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    .line 142
    iget p1, p1, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    if-gt v2, p1, :cond_1

    if-le v2, v1, :cond_1

    goto :goto_0

    :cond_1
    move v1, v2

    :goto_0
    if-lt v0, v1, :cond_2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 145
    :cond_2
    invoke-virtual {p0, v0, v1}, Lcom/vladsch/flexmark/util/sequence/Range;->withRange(II)Lcom/vladsch/flexmark/util/sequence/Range;

    move-result-object p1

    return-object p1
.end method

.method public expandToInclude(II)Lcom/vladsch/flexmark/util/sequence/Range;
    .locals 1

    .line 211
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    if-le v0, p1, :cond_0

    goto :goto_0

    :cond_0
    move p1, v0

    :goto_0
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    if-ge v0, p2, :cond_1

    goto :goto_1

    :cond_1
    move p2, v0

    :goto_1
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/Range;->withRange(II)Lcom/vladsch/flexmark/util/sequence/Range;

    move-result-object p1

    return-object p1
.end method

.method public expandToInclude(Lcom/vladsch/flexmark/util/sequence/Range;)Lcom/vladsch/flexmark/util/sequence/Range;
    .locals 1

    .line 207
    iget v0, p1, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    iget p1, p1, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    invoke-virtual {p0, v0, p1}, Lcom/vladsch/flexmark/util/sequence/Range;->expandToInclude(II)Lcom/vladsch/flexmark/util/sequence/Range;

    move-result-object p1

    return-object p1
.end method

.method public getEnd()I
    .locals 1

    .line 15
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    return v0
.end method

.method public getSpan()I
    .locals 2

    .line 162
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    iget v1, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public getStart()I
    .locals 1

    .line 13
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    return v0
.end method

.method public hashCode()I
    .locals 2

    .line 228
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    mul-int/lit8 v0, v0, 0x1f

    .line 229
    iget v1, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    add-int/2addr v0, v1

    return v0
.end method

.method public include(I)Lcom/vladsch/flexmark/util/sequence/Range;
    .locals 0

    .line 199
    invoke-virtual {p0, p1, p1}, Lcom/vladsch/flexmark/util/sequence/Range;->include(II)Lcom/vladsch/flexmark/util/sequence/Range;

    move-result-object p1

    return-object p1
.end method

.method public include(II)Lcom/vladsch/flexmark/util/sequence/Range;
    .locals 1

    .line 203
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/Range;->isNull()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/vladsch/flexmark/util/sequence/Range;

    invoke-direct {v0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/Range;-><init>(II)V

    return-object v0

    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/Range;->expandToInclude(II)Lcom/vladsch/flexmark/util/sequence/Range;

    move-result-object p1

    return-object p1
.end method

.method public include(Lcom/vladsch/flexmark/util/sequence/Range;)Lcom/vladsch/flexmark/util/sequence/Range;
    .locals 1

    .line 195
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/sequence/Range;->isNull()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/Range;->isNull()Z

    move-result p1

    if-eqz p1, :cond_0

    sget-object p1, Lcom/vladsch/flexmark/util/sequence/Range;->NULL:Lcom/vladsch/flexmark/util/sequence/Range;

    return-object p1

    :cond_0
    return-object p0

    :cond_1
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/sequence/Range;->expandToInclude(Lcom/vladsch/flexmark/util/sequence/Range;)Lcom/vladsch/flexmark/util/sequence/Range;

    move-result-object p1

    return-object p1
.end method

.method public intersect(Lcom/vladsch/flexmark/util/sequence/Range;)Lcom/vladsch/flexmark/util/sequence/Range;
    .locals 2

    .line 128
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    .line 129
    iget v1, p1, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    if-ge v0, v1, :cond_0

    move v0, v1

    .line 130
    :cond_0
    iget v1, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    .line 131
    iget p1, p1, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    if-le v1, p1, :cond_1

    move v1, p1

    :cond_1
    if-lt v0, v1, :cond_2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 134
    :cond_2
    invoke-virtual {p0, v0, v1}, Lcom/vladsch/flexmark/util/sequence/Range;->withRange(II)Lcom/vladsch/flexmark/util/sequence/Range;

    move-result-object p1

    return-object p1
.end method

.method public isAdjacent(I)Z
    .locals 2

    .line 104
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    if-eq p1, v0, :cond_1

    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    :goto_0
    return v1
.end method

.method public isAdjacent(Lcom/vladsch/flexmark/util/sequence/Range;)Z
    .locals 2

    .line 183
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    iget v1, p1, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    iget p1, p1, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    if-ne v0, p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method public isAdjacentAfter(I)Z
    .locals 2

    .line 124
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    if-ne v0, p1, :cond_0

    return v1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public isAdjacentAfter(Lcom/vladsch/flexmark/util/sequence/Range;)Z
    .locals 1

    .line 191
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    iget p1, p1, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    if-ne v0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public isAdjacentBefore(I)Z
    .locals 1

    .line 120
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    if-ne v0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public isAdjacentBefore(Lcom/vladsch/flexmark/util/sequence/Range;)Z
    .locals 1

    .line 187
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    iget p1, p1, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    if-ne v0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public isContainedBy(II)Z
    .locals 1

    .line 91
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    if-lt p2, v0, :cond_0

    iget p2, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    if-gt p1, p2, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public isContainedBy(Lcom/vladsch/flexmark/util/sequence/Range;)Z
    .locals 2

    .line 95
    iget v0, p1, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    iget v1, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    if-lt v0, v1, :cond_0

    iget p1, p1, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    if-gt p1, v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public isEmpty()Z
    .locals 2

    .line 89
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    iget v1, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isEnd(I)Z
    .locals 1

    .line 112
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public isEqual(Lcom/vladsch/flexmark/util/sequence/Range;)Z
    .locals 2

    .line 83
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    iget v1, p1, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    if-ne v0, v1, :cond_0

    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    iget p1, p1, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    if-ne v0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public isLast(I)Z
    .locals 2

    .line 116
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    if-lt p1, v0, :cond_0

    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    if-ne p1, v0, :cond_0

    return v1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public isNotNull()Z
    .locals 1

    .line 174
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/Range;->NULL:Lcom/vladsch/flexmark/util/sequence/Range;

    if-eq p0, v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isNull()Z
    .locals 1

    .line 170
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/Range;->NULL:Lcom/vladsch/flexmark/util/sequence/Range;

    if-ne p0, v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isProperlyContainedBy(II)Z
    .locals 1

    .line 93
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    if-le p2, v0, :cond_0

    iget p2, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    if-ge p1, p2, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public isProperlyContainedBy(Lcom/vladsch/flexmark/util/sequence/Range;)Z
    .locals 2

    .line 97
    iget v0, p1, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    iget v1, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    if-le v0, v1, :cond_0

    iget p1, p1, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    if-ge p1, v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public isStart(I)Z
    .locals 1

    .line 108
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public leadBy(I)Z
    .locals 1

    .line 72
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    if-gt v0, p1, :cond_0

    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    if-ge p1, v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public leads(I)Z
    .locals 1

    .line 64
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    if-gt v0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public length()I
    .locals 2

    .line 166
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    iget v1, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public safeSubSequence(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 3

    const/4 v0, 0x0

    .line 52
    iget v1, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    iget v2, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {p1, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->of(Ljava/lang/CharSequence;II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public subSequence(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 2

    .line 48
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    iget v1, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    invoke-static {p1, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->of(Ljava/lang/CharSequence;II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 179
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "["

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public trailedBy(I)Z
    .locals 1

    .line 76
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    if-gt v0, p1, :cond_0

    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    if-ge p1, v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public trails(I)Z
    .locals 1

    .line 68
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    if-le v0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public withEnd(I)Lcom/vladsch/flexmark/util/sequence/Range;
    .locals 2

    .line 40
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    if-ne p1, v0, :cond_0

    return-object p0

    :cond_0
    new-instance v0, Lcom/vladsch/flexmark/util/sequence/Range;

    iget v1, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    invoke-direct {v0, v1, p1}, Lcom/vladsch/flexmark/util/sequence/Range;-><init>(II)V

    return-object v0
.end method

.method public withRange(II)Lcom/vladsch/flexmark/util/sequence/Range;
    .locals 1

    .line 44
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    if-ne p1, v0, :cond_0

    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    if-ne p2, v0, :cond_0

    return-object p0

    :cond_0
    new-instance v0, Lcom/vladsch/flexmark/util/sequence/Range;

    invoke-direct {v0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/Range;-><init>(II)V

    return-object v0
.end method

.method public withStart(I)Lcom/vladsch/flexmark/util/sequence/Range;
    .locals 2

    .line 36
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myStart:I

    if-ne p1, v0, :cond_0

    return-object p0

    :cond_0
    new-instance v0, Lcom/vladsch/flexmark/util/sequence/Range;

    iget v1, p0, Lcom/vladsch/flexmark/util/sequence/Range;->myEnd:I

    invoke-direct {v0, p1, v1}, Lcom/vladsch/flexmark/util/sequence/Range;-><init>(II)V

    return-object v0
.end method
