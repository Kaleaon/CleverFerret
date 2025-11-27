.class public final Lcom/vladsch/flexmark/util/sequence/CharSubSequence;
.super Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;
.source "CharSubSequence.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final base:Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

.field private final baseChars:[C

.field private final endOffset:I

.field private final startOffset:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>(Lcom/vladsch/flexmark/util/sequence/CharSubSequence;II)V
    .locals 1

    .line 43
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;-><init>()V

    .line 54
    iput-object p1, p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->base:Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    .line 55
    iget-object v0, p1, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->baseChars:[C

    iput-object v0, p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->baseChars:[C

    .line 56
    iget v0, p1, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->startOffset:I

    add-int/2addr v0, p2

    iput v0, p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->startOffset:I

    .line 57
    iget p1, p1, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->startOffset:I

    add-int/2addr p1, p3

    iput p1, p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->endOffset:I

    return-void
.end method

.method private constructor <init>([C)V
    .locals 4

    .line 31
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;-><init>()V

    .line 32
    array-length v0, p1

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    .line 34
    aget-char v3, p1, v2

    if-nez v3, :cond_0

    const v3, 0xfffd

    aput-char v3, p1, v2

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 37
    :cond_1
    iput-object p1, p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->baseChars:[C

    .line 38
    iput v1, p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->startOffset:I

    .line 39
    array-length p1, p1

    iput p1, p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->endOffset:I

    .line 40
    iput-object p0, p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->base:Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    return-void
.end method

.method public static of(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/CharSubSequence;
    .locals 2

    const/4 v0, 0x0

    .line 140
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    invoke-static {p0, v0, v1}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->of(Ljava/lang/CharSequence;II)Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    move-result-object p0

    return-object p0
.end method

.method public static of(Ljava/lang/CharSequence;I)Lcom/vladsch/flexmark/util/sequence/CharSubSequence;
    .locals 1

    .line 144
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    invoke-static {p0, p1, v0}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->of(Ljava/lang/CharSequence;II)Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    move-result-object p0

    return-object p0
.end method

.method public static of(Ljava/lang/CharSequence;II)Lcom/vladsch/flexmark/util/sequence/CharSubSequence;
    .locals 3

    const/4 v0, 0x0

    if-nez p1, :cond_3

    .line 154
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-ne p2, v1, :cond_3

    .line 155
    instance-of p1, p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    if-eqz p1, :cond_0

    check-cast p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    return-object p0

    .line 156
    :cond_0
    instance-of p1, p0, Ljava/lang/String;

    if-eqz p1, :cond_1

    new-instance p1, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    check-cast p0, Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object p0

    invoke-direct {p1, p0}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;-><init>([C)V

    return-object p1

    .line 157
    :cond_1
    instance-of p1, p0, Ljava/lang/StringBuilder;

    if-eqz p1, :cond_2

    .line 158
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result p1

    new-array p1, p1, [C

    .line 159
    move-object p2, p0

    check-cast p2, Ljava/lang/StringBuilder;

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result p0

    invoke-virtual {p2, v0, p0, p1, v0}, Ljava/lang/StringBuilder;->getChars(II[CI)V

    .line 160
    new-instance p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;-><init>([C)V

    return-object p0

    .line 161
    :cond_2
    new-instance p1, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object p0

    invoke-direct {p1, p0}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;-><init>([C)V

    return-object p1

    .line 163
    :cond_3
    instance-of v1, p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    if-eqz v1, :cond_4

    check-cast p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    move-result-object p0

    return-object p0

    .line 164
    :cond_4
    instance-of v1, p0, Ljava/lang/String;

    if-eqz v1, :cond_5

    new-instance v0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    check-cast p0, Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;-><init>([C)V

    invoke-virtual {v0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    move-result-object p0

    return-object p0

    .line 165
    :cond_5
    instance-of v1, p0, Ljava/lang/StringBuilder;

    if-eqz v1, :cond_6

    .line 166
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    new-array v1, v1, [C

    .line 167
    move-object v2, p0

    check-cast v2, Ljava/lang/StringBuilder;

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result p0

    invoke-virtual {v2, v0, p0, v1, v0}, Ljava/lang/StringBuilder;->getChars(II[CI)V

    .line 168
    new-instance p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    invoke-direct {p0, v1}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;-><init>([C)V

    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    move-result-object p0

    return-object p0

    .line 169
    :cond_6
    new-instance v0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;-><init>([C)V

    invoke-virtual {v0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    move-result-object p0

    return-object p0
.end method

.method public static of([CII)Lcom/vladsch/flexmark/util/sequence/CharSubSequence;
    .locals 3

    .line 148
    array-length v0, p0

    new-array v0, v0, [C

    const/4 v1, 0x0

    .line 149
    array-length v2, p0

    invoke-static {p0, v1, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    if-nez p1, :cond_0

    .line 150
    array-length p0, p0

    if-ne p2, p0, :cond_0

    new-instance p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    invoke-direct {p0, v0}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;-><init>([C)V

    return-object p0

    :cond_0
    new-instance p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    invoke-direct {p0, v0}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;-><init>([C)V

    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public appendTo(Ljava/lang/StringBuilder;II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 2

    .line 120
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->baseChars:[C

    iget v1, p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->startOffset:I

    add-int/2addr v1, p2

    sub-int/2addr p3, p2

    invoke-virtual {p1, v0, v1, p3}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    return-object p0
.end method

.method public bridge synthetic baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 0

    .line 7
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    move-result-object p1

    return-object p1
.end method

.method public baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/CharSubSequence;
    .locals 3

    if-ltz p1, :cond_2

    .line 109
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->baseChars:[C

    array-length v0, v0

    if-gt p2, v0, :cond_2

    .line 110
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->startOffset:I

    if-ne p1, v0, :cond_0

    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->endOffset:I

    if-ne p2, v0, :cond_0

    return-object p0

    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->base:Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    if-eq v0, p0, :cond_1

    invoke-virtual {v0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    move-result-object p1

    return-object p1

    :cond_1
    new-instance v1, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    invoke-direct {v1, v0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;-><init>(Lcom/vladsch/flexmark/util/sequence/CharSubSequence;II)V

    return-object v1

    .line 112
    :cond_2
    const-string v0, " out of range: 0, "

    const-string v1, "SubCharSequence index: "

    if-ltz p1, :cond_4

    iget-object v2, p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->base:Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->length()I

    move-result v2

    if-le p1, v2, :cond_3

    goto :goto_0

    .line 115
    :cond_3
    new-instance p1, Ljava/lang/StringIndexOutOfBoundsException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->length()I

    move-result p2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 113
    :cond_4
    :goto_0
    new-instance p2, Ljava/lang/StringIndexOutOfBoundsException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->length()I

    move-result p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public charAt(I)C
    .locals 3

    if-gez p1, :cond_1

    .line 80
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->endOffset:I

    iget v1, p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->startOffset:I

    sub-int/2addr v0, v1

    if-ge p1, v0, :cond_0

    goto :goto_0

    .line 83
    :cond_0
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "SubCharSequence index: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " out of range: 0, "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->length()I

    move-result p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 81
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->baseChars:[C

    iget v1, p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->startOffset:I

    add-int/2addr p1, v1

    aget-char p1, v0, p1

    return p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    if-eq p1, p0, :cond_1

    .line 131
    instance-of v0, p1, Ljava/lang/CharSequence;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->toString()Ljava/lang/String;

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

.method public bridge synthetic getBase()Ljava/lang/Object;
    .locals 1

    .line 7
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->getBase()[C

    move-result-object v0

    return-object v0
.end method

.method public getBase()[C
    .locals 1

    .line 20
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->baseChars:[C

    return-object v0
.end method

.method public bridge synthetic getBaseSequence()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 7
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->getBaseSequence()Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    move-result-object v0

    return-object v0
.end method

.method public getBaseSequence()Lcom/vladsch/flexmark/util/sequence/CharSubSequence;
    .locals 1

    .line 15
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->base:Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    return-object v0
.end method

.method public getEndOffset()I
    .locals 1

    .line 28
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->endOffset:I

    return v0
.end method

.method public getIndexOffset(I)I
    .locals 3

    if-gez p1, :cond_1

    .line 72
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->endOffset:I

    iget v1, p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->startOffset:I

    sub-int/2addr v0, v1

    if-gt p1, v0, :cond_0

    goto :goto_0

    .line 75
    :cond_0
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "SubCharSequence index: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " out of range: 0, "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->length()I

    move-result p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 73
    :cond_1
    :goto_0
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->startOffset:I

    add-int/2addr v0, p1

    return v0
.end method

.method public getSourceRange()Lcom/vladsch/flexmark/util/sequence/Range;
    .locals 3

    .line 67
    new-instance v0, Lcom/vladsch/flexmark/util/sequence/Range;

    iget v1, p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->startOffset:I

    iget v2, p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->endOffset:I

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/sequence/Range;-><init>(II)V

    return-object v0
.end method

.method public getStartOffset()I
    .locals 1

    .line 24
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->startOffset:I

    return v0
.end method

.method public hashCode()I
    .locals 1

    .line 126
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public length()I
    .locals 2

    .line 62
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->endOffset:I

    iget v1, p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->startOffset:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public bridge synthetic subSequence(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 0

    .line 7
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->subSequence(I)Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 0

    .line 7
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic subSequence(Lcom/vladsch/flexmark/util/sequence/Range;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 0

    .line 7
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->subSequence(Lcom/vladsch/flexmark/util/sequence/Range;)Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    move-result-object p1

    return-object p1
.end method

.method public subSequence(I)Lcom/vladsch/flexmark/util/sequence/CharSubSequence;
    .locals 1

    .line 93
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->length()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    move-result-object p1

    return-object p1
.end method

.method public subSequence(II)Lcom/vladsch/flexmark/util/sequence/CharSubSequence;
    .locals 4

    if-ltz p1, :cond_0

    .line 98
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->endOffset:I

    iget v1, p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->startOffset:I

    sub-int/2addr v0, v1

    if-gt p2, v0, :cond_0

    .line 99
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->base:Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    add-int/2addr p1, v1

    add-int/2addr v1, p2

    invoke-virtual {v0, p1, v1}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    move-result-object p1

    return-object p1

    .line 101
    :cond_0
    const-string v0, " out of range: 0, "

    const-string v1, "SubCharSequence index: "

    if-ltz p1, :cond_2

    iget v2, p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->startOffset:I

    add-int/2addr v2, p1

    iget v3, p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->endOffset:I

    if-le v2, v3, :cond_1

    goto :goto_0

    .line 104
    :cond_1
    new-instance p1, Ljava/lang/StringIndexOutOfBoundsException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->length()I

    move-result p2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 102
    :cond_2
    :goto_0
    new-instance p2, Ljava/lang/StringIndexOutOfBoundsException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->length()I

    move-result p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public subSequence(Lcom/vladsch/flexmark/util/sequence/Range;)Lcom/vladsch/flexmark/util/sequence/CharSubSequence;
    .locals 1

    .line 88
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/sequence/Range;->getStart()I

    move-result v0

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/sequence/Range;->getEnd()I

    move-result p1

    invoke-virtual {p0, v0, p1}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic subSequence(II)Ljava/lang/CharSequence;
    .locals 0

    .line 7
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    move-result-object p1

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 136
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->baseChars:[C

    iget v1, p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->startOffset:I

    iget v2, p0, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->endOffset:I

    sub-int/2addr v2, v1

    invoke-static {v0, v1, v2}, Ljava/lang/String;->valueOf([CII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
