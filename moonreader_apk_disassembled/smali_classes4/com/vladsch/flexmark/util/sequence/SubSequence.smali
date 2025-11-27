.class public final Lcom/vladsch/flexmark/util/sequence/SubSequence;
.super Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;
.source "SubSequence.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final base:Lcom/vladsch/flexmark/util/sequence/SubSequence;

.field private final baseSeq:Ljava/lang/CharSequence;

.field private final endOffset:I

.field private final startOffset:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>(Lcom/vladsch/flexmark/util/sequence/SubSequence;II)V
    .locals 1

    .line 39
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;-><init>()V

    .line 42
    iput-object p1, p0, Lcom/vladsch/flexmark/util/sequence/SubSequence;->base:Lcom/vladsch/flexmark/util/sequence/SubSequence;

    .line 43
    iget-object v0, p1, Lcom/vladsch/flexmark/util/sequence/SubSequence;->baseSeq:Ljava/lang/CharSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/util/sequence/SubSequence;->baseSeq:Ljava/lang/CharSequence;

    .line 44
    iget v0, p1, Lcom/vladsch/flexmark/util/sequence/SubSequence;->startOffset:I

    add-int/2addr v0, p2

    iput v0, p0, Lcom/vladsch/flexmark/util/sequence/SubSequence;->startOffset:I

    .line 45
    iget p1, p1, Lcom/vladsch/flexmark/util/sequence/SubSequence;->startOffset:I

    add-int/2addr p1, p3

    iput p1, p0, Lcom/vladsch/flexmark/util/sequence/SubSequence;->endOffset:I

    return-void
.end method

.method private constructor <init>(Ljava/lang/CharSequence;)V
    .locals 1

    .line 31
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;-><init>()V

    .line 33
    iput-object p0, p0, Lcom/vladsch/flexmark/util/sequence/SubSequence;->base:Lcom/vladsch/flexmark/util/sequence/SubSequence;

    .line 34
    iput-object p1, p0, Lcom/vladsch/flexmark/util/sequence/SubSequence;->baseSeq:Ljava/lang/CharSequence;

    const/4 v0, 0x0

    .line 35
    iput v0, p0, Lcom/vladsch/flexmark/util/sequence/SubSequence;->startOffset:I

    .line 36
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    iput p1, p0, Lcom/vladsch/flexmark/util/sequence/SubSequence;->endOffset:I

    return-void
.end method

.method public static of(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 131
    instance-of v0, p0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    if-eqz v0, :cond_0

    check-cast p0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object p0

    :cond_0
    if-nez p0, :cond_1

    .line 133
    sget-object p0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object p0

    :cond_1
    new-instance v0, Lcom/vladsch/flexmark/util/sequence/SubSequence;

    invoke-direct {v0, p0}, Lcom/vladsch/flexmark/util/sequence/SubSequence;-><init>(Ljava/lang/CharSequence;)V

    return-object v0
.end method

.method public static of(Ljava/lang/CharSequence;I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 138
    instance-of v0, p0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    if-eqz v0, :cond_0

    check-cast p0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {p0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p0

    return-object p0

    :cond_0
    if-nez p0, :cond_1

    .line 140
    sget-object p0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object p0

    :cond_1
    if-nez p1, :cond_2

    new-instance p1, Lcom/vladsch/flexmark/util/sequence/SubSequence;

    invoke-direct {p1, p0}, Lcom/vladsch/flexmark/util/sequence/SubSequence;-><init>(Ljava/lang/CharSequence;)V

    return-object p1

    :cond_2
    new-instance v0, Lcom/vladsch/flexmark/util/sequence/SubSequence;

    invoke-direct {v0, p0}, Lcom/vladsch/flexmark/util/sequence/SubSequence;-><init>(Ljava/lang/CharSequence;)V

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result p0

    invoke-virtual {v0, p1, p0}, Lcom/vladsch/flexmark/util/sequence/SubSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/SubSequence;

    move-result-object p0

    return-object p0
.end method

.method public static of(Ljava/lang/CharSequence;II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 145
    instance-of v0, p0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    if-eqz v0, :cond_0

    check-cast p0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p0

    return-object p0

    :cond_0
    if-nez p0, :cond_1

    .line 147
    sget-object p0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object p0

    :cond_1
    if-nez p1, :cond_2

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-ne p2, v0, :cond_2

    new-instance p1, Lcom/vladsch/flexmark/util/sequence/SubSequence;

    invoke-direct {p1, p0}, Lcom/vladsch/flexmark/util/sequence/SubSequence;-><init>(Ljava/lang/CharSequence;)V

    return-object p1

    :cond_2
    new-instance v0, Lcom/vladsch/flexmark/util/sequence/SubSequence;

    invoke-direct {v0, p0}, Lcom/vladsch/flexmark/util/sequence/SubSequence;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/SubSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/SubSequence;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public appendTo(Ljava/lang/StringBuilder;II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 2

    .line 109
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/SubSequence;->baseSeq:Ljava/lang/CharSequence;

    iget v1, p0, Lcom/vladsch/flexmark/util/sequence/SubSequence;->startOffset:I

    add-int/2addr p2, v1

    add-int/2addr v1, p3

    invoke-virtual {p1, v0, p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    return-object p0
.end method

.method public bridge synthetic baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 0

    .line 7
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/SubSequence;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/SubSequence;

    move-result-object p1

    return-object p1
.end method

.method public baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/SubSequence;
    .locals 3

    if-ltz p1, :cond_2

    .line 98
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/SubSequence;->base:Lcom/vladsch/flexmark/util/sequence/SubSequence;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/sequence/SubSequence;->length()I

    move-result v0

    if-gt p2, v0, :cond_2

    .line 99
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/SubSequence;->startOffset:I

    if-ne p1, v0, :cond_0

    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/SubSequence;->endOffset:I

    if-ne p2, v0, :cond_0

    return-object p0

    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/SubSequence;->base:Lcom/vladsch/flexmark/util/sequence/SubSequence;

    if-eq v0, p0, :cond_1

    invoke-virtual {v0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/SubSequence;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/SubSequence;

    move-result-object p1

    return-object p1

    :cond_1
    new-instance v0, Lcom/vladsch/flexmark/util/sequence/SubSequence;

    invoke-direct {v0, p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/SubSequence;-><init>(Lcom/vladsch/flexmark/util/sequence/SubSequence;II)V

    return-object v0

    .line 101
    :cond_2
    const-string v0, " out of range: 0, "

    const-string v1, "SubCharSequence index: "

    if-ltz p1, :cond_4

    iget-object v2, p0, Lcom/vladsch/flexmark/util/sequence/SubSequence;->base:Lcom/vladsch/flexmark/util/sequence/SubSequence;

    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/sequence/SubSequence;->length()I

    move-result v2

    if-le p1, v2, :cond_3

    goto :goto_0

    .line 104
    :cond_3
    new-instance p1, Ljava/lang/StringIndexOutOfBoundsException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/SubSequence;->length()I

    move-result p2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 102
    :cond_4
    :goto_0
    new-instance p2, Ljava/lang/StringIndexOutOfBoundsException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/SubSequence;->length()I

    move-result p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public charAt(I)C
    .locals 3

    if-ltz p1, :cond_1

    .line 68
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/SubSequence;->endOffset:I

    iget v1, p0, Lcom/vladsch/flexmark/util/sequence/SubSequence;->startOffset:I

    sub-int/2addr v0, v1

    if-ge p1, v0, :cond_1

    .line 69
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/SubSequence;->baseSeq:Ljava/lang/CharSequence;

    add-int/2addr p1, v1

    invoke-interface {v0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p1

    if-nez p1, :cond_0

    const p1, 0xfffd

    :cond_0
    return p1

    .line 72
    :cond_1
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "SubCharSequence index: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " out of range: 0, "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/SubSequence;->length()I

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

    .line 120
    instance-of v0, p1, Ljava/lang/CharSequence;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/SubSequence;->toString()Ljava/lang/String;

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

    .line 20
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/SubSequence;->baseSeq:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public bridge synthetic getBaseSequence()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 7
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/SubSequence;->getBaseSequence()Lcom/vladsch/flexmark/util/sequence/SubSequence;

    move-result-object v0

    return-object v0
.end method

.method public getBaseSequence()Lcom/vladsch/flexmark/util/sequence/SubSequence;
    .locals 1

    .line 15
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/SubSequence;->base:Lcom/vladsch/flexmark/util/sequence/SubSequence;

    return-object v0
.end method

.method public getEndOffset()I
    .locals 1

    .line 28
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/SubSequence;->endOffset:I

    return v0
.end method

.method public getIndexOffset(I)I
    .locals 3

    if-ltz p1, :cond_0

    .line 60
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/SubSequence;->endOffset:I

    iget v1, p0, Lcom/vladsch/flexmark/util/sequence/SubSequence;->startOffset:I

    sub-int/2addr v0, v1

    if-gt p1, v0, :cond_0

    add-int/2addr v1, p1

    return v1

    .line 63
    :cond_0
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "SubCharSequence index: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " out of range: 0, "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/SubSequence;->length()I

    move-result p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getSourceRange()Lcom/vladsch/flexmark/util/sequence/Range;
    .locals 3

    .line 55
    new-instance v0, Lcom/vladsch/flexmark/util/sequence/Range;

    iget v1, p0, Lcom/vladsch/flexmark/util/sequence/SubSequence;->startOffset:I

    iget v2, p0, Lcom/vladsch/flexmark/util/sequence/SubSequence;->endOffset:I

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/sequence/Range;-><init>(II)V

    return-object v0
.end method

.method public getStartOffset()I
    .locals 1

    .line 24
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/SubSequence;->startOffset:I

    return v0
.end method

.method public hashCode()I
    .locals 1

    .line 115
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/SubSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public length()I
    .locals 2

    .line 50
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/SubSequence;->endOffset:I

    iget v1, p0, Lcom/vladsch/flexmark/util/sequence/SubSequence;->startOffset:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public bridge synthetic subSequence(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 0

    .line 7
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/sequence/SubSequence;->subSequence(I)Lcom/vladsch/flexmark/util/sequence/SubSequence;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 0

    .line 7
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/SubSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/SubSequence;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic subSequence(Lcom/vladsch/flexmark/util/sequence/Range;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 0

    .line 7
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/sequence/SubSequence;->subSequence(Lcom/vladsch/flexmark/util/sequence/Range;)Lcom/vladsch/flexmark/util/sequence/SubSequence;

    move-result-object p1

    return-object p1
.end method

.method public subSequence(I)Lcom/vladsch/flexmark/util/sequence/SubSequence;
    .locals 1

    .line 82
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/SubSequence;->length()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/util/sequence/SubSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/SubSequence;

    move-result-object p1

    return-object p1
.end method

.method public subSequence(II)Lcom/vladsch/flexmark/util/sequence/SubSequence;
    .locals 4

    if-ltz p1, :cond_0

    .line 87
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/SubSequence;->endOffset:I

    iget v1, p0, Lcom/vladsch/flexmark/util/sequence/SubSequence;->startOffset:I

    sub-int/2addr v0, v1

    if-gt p2, v0, :cond_0

    add-int/2addr p1, v1

    add-int/2addr v1, p2

    .line 88
    invoke-virtual {p0, p1, v1}, Lcom/vladsch/flexmark/util/sequence/SubSequence;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/SubSequence;

    move-result-object p1

    return-object p1

    .line 90
    :cond_0
    const-string v0, " out of range: 0, "

    const-string v1, "SubCharSequence index: "

    if-ltz p1, :cond_2

    iget v2, p0, Lcom/vladsch/flexmark/util/sequence/SubSequence;->startOffset:I

    add-int/2addr v2, p1

    iget v3, p0, Lcom/vladsch/flexmark/util/sequence/SubSequence;->endOffset:I

    if-le v2, v3, :cond_1

    goto :goto_0

    .line 93
    :cond_1
    new-instance p1, Ljava/lang/StringIndexOutOfBoundsException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/SubSequence;->length()I

    move-result p2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 91
    :cond_2
    :goto_0
    new-instance p2, Ljava/lang/StringIndexOutOfBoundsException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/SubSequence;->length()I

    move-result p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public subSequence(Lcom/vladsch/flexmark/util/sequence/Range;)Lcom/vladsch/flexmark/util/sequence/SubSequence;
    .locals 1

    .line 77
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/sequence/Range;->getStart()I

    move-result v0

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/sequence/Range;->getEnd()I

    move-result p1

    invoke-virtual {p0, v0, p1}, Lcom/vladsch/flexmark/util/sequence/SubSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/SubSequence;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic subSequence(II)Ljava/lang/CharSequence;
    .locals 0

    .line 7
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/SubSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/SubSequence;

    move-result-object p1

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 125
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/SubSequence;->length()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const/4 v1, 0x0

    .line 126
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/SubSequence;->length()I

    move-result v2

    invoke-virtual {p0, v0, v1, v2}, Lcom/vladsch/flexmark/util/sequence/SubSequence;->appendTo(Ljava/lang/StringBuilder;II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 127
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
