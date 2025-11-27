.class public final Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;
.super Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;
.source "SegmentedSequence.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final baseOffsets:[I

.field private final baseSeq:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field private final baseStartOffset:I

.field private final endOffset:I

.field private final length:I

.field private final nonBaseChars:[C

.field private final startOffset:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;[II[CI)V
    .locals 0

    .line 214
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;-><init>()V

    .line 215
    iput-object p1, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->baseSeq:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 216
    iput-object p2, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->baseOffsets:[I

    .line 217
    iput p3, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->baseStartOffset:I

    .line 218
    iput-object p4, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->nonBaseChars:[C

    .line 219
    iput p5, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->length:I

    .line 220
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->computeStartOffset()I

    move-result p1

    iput p1, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->startOffset:I

    .line 221
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->computeEndOffset()I

    move-result p1

    iput p1, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->endOffset:I

    return-void
.end method

.method private constructor <init>(Ljava/util/List;II)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            ">;II)V"
        }
    .end annotation

    .line 162
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;-><init>()V

    const/4 v0, 0x0

    .line 163
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getBaseSequence()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    iput-object v1, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->baseSeq:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 164
    iput p2, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->startOffset:I

    .line 165
    iput p3, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->endOffset:I

    .line 169
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p2

    if-lez p2, :cond_0

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getBaseSequence()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    goto :goto_0

    :cond_0
    sget-object p2, Lcom/vladsch/flexmark/util/sequence/SubSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 172
    :goto_0
    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    .line 173
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    const/4 p3, 0x0

    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 175
    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    .line 178
    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    .line 179
    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v1

    add-int/2addr p3, v1

    goto :goto_1

    .line 183
    :cond_1
    iput v0, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->baseStartOffset:I

    .line 184
    iput p3, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->length:I

    .line 185
    new-array p2, p3, [I

    iput-object p2, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->baseOffsets:[I

    .line 189
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 p2, 0x0

    move-object p3, p2

    const/4 v1, 0x0

    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 190
    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v3

    const/4 v4, 0x0

    :goto_3
    if-ge v4, v3, :cond_4

    .line 193
    invoke-interface {v2, v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getIndexOffset(I)I

    move-result v5

    if-gez v5, :cond_3

    if-nez p3, :cond_2

    .line 195
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 196
    :cond_2
    invoke-interface {v2, v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v5

    invoke-virtual {p3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 197
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    neg-int v5, v5

    .line 201
    :cond_3
    iget-object v6, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->baseOffsets:[I

    add-int v7, v4, v1

    aput v5, v6, v7

    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    :cond_4
    add-int/2addr v1, v3

    goto :goto_2

    :cond_5
    if-eqz p3, :cond_6

    .line 208
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->nonBaseChars:[C

    return-void

    .line 210
    :cond_6
    iput-object p2, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->nonBaseChars:[C

    return-void
.end method

.method private computeEndOffset()I
    .locals 3

    .line 244
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->length:I

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->getStartOffset()I

    move-result v0

    return v0

    .line 246
    :cond_0
    iget-object v1, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->baseOffsets:[I

    array-length v2, v1

    .line 248
    iget-object v2, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->nonBaseChars:[C

    if-eqz v2, :cond_3

    .line 250
    iget v1, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->baseStartOffset:I

    add-int/2addr v1, v0

    :goto_0
    add-int/lit8 v0, v1, -0x1

    if-lez v1, :cond_2

    .line 251
    iget-object v1, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->baseOffsets:[I

    aget v1, v1, v0

    if-ltz v1, :cond_1

    add-int/lit8 v1, v1, 0x1

    return v1

    :cond_1
    move v1, v0

    goto :goto_0

    .line 255
    :cond_2
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->getStartOffset()I

    move-result v0

    return v0

    .line 259
    :cond_3
    iget v2, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->baseStartOffset:I

    add-int/2addr v2, v0

    add-int/lit8 v2, v2, -0x1

    aget v0, v1, v2

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method private computeStartOffset()I
    .locals 3

    .line 225
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->baseOffsets:[I

    array-length v1, v0

    .line 228
    iget-object v2, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->nonBaseChars:[C

    if-eqz v2, :cond_2

    .line 230
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->baseStartOffset:I

    :goto_0
    if-ge v0, v1, :cond_1

    .line 231
    iget-object v2, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->baseOffsets:[I

    aget v2, v2, v0

    if-ltz v2, :cond_0

    return v2

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 235
    :cond_1
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->baseSeq:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v0

    return v0

    .line 239
    :cond_2
    iget v2, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->baseStartOffset:I

    if-ge v2, v1, :cond_3

    aget v0, v0, v2

    return v0

    :cond_3
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->baseSeq:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v0

    return v0
.end method

.method public static of(Ljava/util/List;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            ">;)",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;"
        }
    .end annotation

    .line 113
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    if-eqz v0, :cond_b

    const/4 v0, 0x0

    .line 115
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 116
    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getBaseSequence()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    .line 117
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 121
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v3, 0x0

    const/4 v4, -0x1

    move-object v5, v3

    const/4 v6, -0x1

    const/4 v7, -0x1

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_8

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 122
    invoke-interface {v8}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNull()Z

    move-result v9

    if-eqz v9, :cond_0

    goto :goto_0

    .line 124
    :cond_0
    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getBase()Ljava/lang/Object;

    invoke-interface {v8}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getBase()Ljava/lang/Object;

    if-ne v6, v4, :cond_1

    .line 128
    invoke-interface {v8}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v6

    .line 129
    :cond_1
    invoke-interface {v8}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v7

    .line 131
    invoke-interface {v8}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_2

    goto :goto_0

    .line 133
    :cond_2
    instance-of v9, v8, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;

    if-nez v9, :cond_6

    instance-of v9, v8, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;

    if-eqz v9, :cond_3

    goto :goto_2

    :cond_3
    if-nez v5, :cond_4

    goto :goto_1

    .line 141
    :cond_4
    invoke-interface {v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v9

    invoke-interface {v8}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v10

    if-eq v9, v10, :cond_5

    .line 142
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_1
    move-object v5, v8

    goto :goto_0

    .line 145
    :cond_5
    invoke-interface {v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v9

    invoke-interface {v8}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v8

    invoke-interface {v5, v9, v8}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v5

    goto :goto_0

    :cond_6
    :goto_2
    if-eqz v5, :cond_7

    .line 134
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 135
    :cond_7
    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object v5, v3

    goto :goto_0

    :cond_8
    if-eqz v5, :cond_9

    .line 151
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 153
    :cond_9
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result p0

    const/4 v1, 0x1

    if-ne p0, v1, :cond_a

    .line 154
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object p0

    .line 155
    :cond_a
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result p0

    if-eqz p0, :cond_b

    .line 156
    new-instance p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;

    invoke-direct {p0, v2, v6, v7}, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;-><init>(Ljava/util/List;II)V

    return-object p0

    .line 159
    :cond_b
    sget-object p0, Lcom/vladsch/flexmark/util/sequence/SubSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object p0
.end method

.method public static varargs of([Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 0

    .line 332
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-static {p0}, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->of(Ljava/util/List;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 2

    .line 293
    const-string v0, "String index out of range: "

    if-ltz p1, :cond_1

    iget-object v1, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->baseSeq:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v1

    if-gt p1, v1, :cond_1

    if-ltz p2, :cond_0

    .line 296
    iget-object v1, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->baseSeq:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v1

    if-gt p2, v1, :cond_0

    .line 300
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->baseSeq:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1

    .line 297
    :cond_0
    new-instance p1, Ljava/lang/StringIndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 294
    :cond_1
    new-instance p2, Ljava/lang/StringIndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public charAt(I)C
    .locals 3

    if-ltz p1, :cond_1

    .line 274
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->length:I

    if-ge p1, v0, :cond_1

    .line 278
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->baseOffsets:[I

    iget v1, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->baseStartOffset:I

    add-int/2addr v1, p1

    aget p1, v0, v1

    if-gez p1, :cond_0

    .line 286
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->nonBaseChars:[C

    neg-int p1, p1

    add-int/lit8 p1, p1, -0x1

    aget-char p1, v0, p1

    return p1

    .line 288
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->baseSeq:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result p1

    return p1

    .line 275
    :cond_1
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "String index: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " out of range: 0, "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->length()I

    move-result p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    if-eq p1, p0, :cond_1

    .line 327
    instance-of v0, p1, Ljava/lang/CharSequence;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method public getBase()Ljava/lang/Object;
    .locals 1

    .line 24
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->baseSeq:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getBase()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getBaseOffsets()[I
    .locals 1

    .line 72
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->baseOffsets:[I

    return-object v0
.end method

.method public getBaseSequence()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 29
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->baseSeq:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getBaseSequence()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    return-object v0
.end method

.method public getBaseStartOffset()I
    .locals 1

    .line 76
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->baseStartOffset:I

    return v0
.end method

.method public getEndOffset()I
    .locals 1

    .line 47
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->endOffset:I

    return v0
.end method

.method public getIndexOffset(I)I
    .locals 4

    .line 81
    const-string v0, " out of range: 0, "

    const-string v1, "String index: "

    if-ltz p1, :cond_4

    iget v2, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->length:I

    if-gt p1, v2, :cond_4

    const/4 v3, -0x1

    if-ne p1, v2, :cond_2

    if-eqz v2, :cond_1

    .line 89
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->baseOffsets:[I

    iget v1, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->baseStartOffset:I

    add-int/2addr v1, p1

    add-int/lit8 v1, v1, -0x1

    aget p1, v0, v1

    if-gez p1, :cond_0

    return v3

    :cond_0
    add-int/lit8 p1, p1, 0x1

    return p1

    .line 87
    :cond_1
    new-instance v2, Ljava/lang/StringIndexOutOfBoundsException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->length()I

    move-result p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v2, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 96
    :cond_2
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->baseOffsets:[I

    iget v1, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->baseStartOffset:I

    add-int/2addr v1, p1

    aget p1, v0, v1

    if-gez p1, :cond_3

    return v3

    :cond_3
    return p1

    .line 82
    :cond_4
    new-instance v2, Ljava/lang/StringIndexOutOfBoundsException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->length()I

    move-result p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v2, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public getIndexRange(II)Lcom/vladsch/flexmark/util/sequence/Range;
    .locals 7

    const/high16 v0, -0x80000000

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/high16 v3, -0x80000000

    const/high16 v4, -0x80000000

    .line 55
    :goto_0
    iget-object v5, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->baseOffsets:[I

    array-length v6, v5

    if-ge v2, v6, :cond_3

    .line 56
    aget v5, v5, v2

    if-ne v5, p1, :cond_0

    move v3, v2

    :cond_0
    if-ne v5, p2, :cond_1

    move v4, v2

    :cond_1
    if-eq v3, v0, :cond_2

    if-eq v4, v0, :cond_2

    goto :goto_1

    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    :goto_1
    if-gez v3, :cond_4

    goto :goto_2

    :cond_4
    move v1, v3

    :goto_2
    if-ge v4, v1, :cond_5

    move v4, v1

    :cond_5
    if-le v1, v4, :cond_6

    move v1, v4

    .line 68
    :cond_6
    invoke-static {v1, v4}, Lcom/vladsch/flexmark/util/sequence/Range;->of(II)Lcom/vladsch/flexmark/util/sequence/Range;

    move-result-object p1

    return-object p1
.end method

.method public getSourceRange()Lcom/vladsch/flexmark/util/sequence/Range;
    .locals 3

    .line 269
    new-instance v0, Lcom/vladsch/flexmark/util/sequence/Range;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->getStartOffset()I

    move-result v1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->getEndOffset()I

    move-result v2

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/sequence/Range;-><init>(II)V

    return-object v0
.end method

.method public getStartOffset()I
    .locals 1

    .line 38
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->startOffset:I

    return v0
.end method

.method public hashCode()I
    .locals 1

    .line 322
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public length()I
    .locals 1

    .line 264
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->length:I

    return v0
.end method

.method public subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 8

    .line 305
    const-string v0, "String index out of range: "

    if-ltz p1, :cond_2

    iget v1, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->length:I

    if-gt p1, v1, :cond_2

    if-ltz p2, :cond_1

    if-gt p2, v1, :cond_1

    if-nez p1, :cond_0

    if-ne p2, v1, :cond_0

    return-object p0

    .line 316
    :cond_0
    new-instance v2, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;

    iget-object v3, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->baseSeq:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v4, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->baseOffsets:[I

    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->baseStartOffset:I

    add-int v5, v0, p1

    iget-object v6, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->nonBaseChars:[C

    sub-int v7, p2, p1

    invoke-direct/range {v2 .. v7}, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;[II[CI)V

    return-object v2

    .line 310
    :cond_1
    new-instance p1, Ljava/lang/StringIndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 306
    :cond_2
    new-instance p2, Ljava/lang/StringIndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public bridge synthetic subSequence(II)Ljava/lang/CharSequence;
    .locals 0

    .line 13
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method
