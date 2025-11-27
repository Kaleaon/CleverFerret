.class public final Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;
.super Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;
.source "PrefixedSubSequence.java"


# instance fields
.field private final base:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field private final prefix:Ljava/lang/String;

.field private final prefixLength:I


# direct methods
.method private constructor <init>(Ljava/lang/String;Lcom/vladsch/flexmark/util/sequence/BasedSequence;IIZ)V
    .locals 1

    .line 42
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;-><init>()V

    if-eqz p5, :cond_0

    const/4 p5, 0x0

    const v0, 0xfffd

    .line 43
    invoke-virtual {p1, p5, v0}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p5

    goto :goto_0

    :cond_0
    move-object p5, p1

    :goto_0
    iput-object p5, p0, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->prefix:Ljava/lang/String;

    .line 44
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    iput p1, p0, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->prefixLength:I

    .line 45
    invoke-static {p2, p3, p4}, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->of(Ljava/lang/CharSequence;II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->base:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public static of(Ljava/lang/String;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;
    .locals 2

    const/4 v0, 0x0

    .line 120
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v1

    invoke-static {p0, p1, v0, v1}, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->of(Ljava/lang/String;Lcom/vladsch/flexmark/util/sequence/BasedSequence;II)Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;

    move-result-object p0

    return-object p0
.end method

.method public static of(Ljava/lang/String;Lcom/vladsch/flexmark/util/sequence/BasedSequence;I)Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;
    .locals 1

    .line 124
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v0

    invoke-static {p0, p1, p2, v0}, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->of(Ljava/lang/String;Lcom/vladsch/flexmark/util/sequence/BasedSequence;II)Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;

    move-result-object p0

    return-object p0
.end method

.method public static of(Ljava/lang/String;Lcom/vladsch/flexmark/util/sequence/BasedSequence;II)Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;
    .locals 6

    .line 128
    new-instance v0, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;

    const/4 v5, 0x1

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;-><init>(Ljava/lang/String;Lcom/vladsch/flexmark/util/sequence/BasedSequence;IIZ)V

    return-object v0
.end method

.method public static repeatOf(CILcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;
    .locals 1

    .line 116
    invoke-static {p0, p1}, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->of(CI)Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;

    move-result-object p0

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    const/4 p1, 0x0

    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v0

    invoke-static {p0, p2, p1, v0}, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->of(Ljava/lang/String;Lcom/vladsch/flexmark/util/sequence/BasedSequence;II)Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;

    move-result-object p0

    return-object p0
.end method

.method public static repeatOf(Ljava/lang/CharSequence;ILcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;
    .locals 1

    .line 112
    invoke-static {p0, p1}, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->of(Ljava/lang/CharSequence;I)Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;

    move-result-object p0

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/RepeatedCharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    const/4 p1, 0x0

    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v0

    invoke-static {p0, p2, p1, v0}, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->of(Ljava/lang/String;Lcom/vladsch/flexmark/util/sequence/BasedSequence;II)Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 39
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->base:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public charAt(I)C
    .locals 3

    if-ltz p1, :cond_1

    .line 64
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->base:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v0

    iget v1, p0, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->prefixLength:I

    add-int/2addr v0, v1

    if-ge p1, v0, :cond_1

    if-ge p1, v1, :cond_0

    .line 66
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->prefix:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->charAt(I)C

    move-result p1

    return p1

    .line 68
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->base:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    sub-int/2addr p1, v1

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result p1

    return p1

    .line 71
    :cond_1
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "String index out of range: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    if-eq p1, p0, :cond_1

    .line 108
    instance-of v0, p1, Ljava/lang/CharSequence;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->toString()Ljava/lang/String;

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

    .line 14
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->base:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getBase()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getBaseSequence()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 19
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->base:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getBaseSequence()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    return-object v0
.end method

.method public getEndOffset()I
    .locals 1

    .line 29
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->base:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v0

    return v0
.end method

.method public getIndexOffset(I)I
    .locals 2

    .line 55
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->prefixLength:I

    if-ge p1, v0, :cond_0

    const/4 p1, -0x1

    return p1

    .line 59
    :cond_0
    iget-object v1, p0, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->base:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    sub-int/2addr p1, v0

    invoke-interface {v1, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getIndexOffset(I)I

    move-result p1

    return p1
.end method

.method public getSourceRange()Lcom/vladsch/flexmark/util/sequence/Range;
    .locals 1

    .line 34
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->base:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getSourceRange()Lcom/vladsch/flexmark/util/sequence/Range;

    move-result-object v0

    return-object v0
.end method

.method public getStartOffset()I
    .locals 1

    .line 24
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->base:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v0

    return v0
.end method

.method public hashCode()I
    .locals 1

    .line 103
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public length()I
    .locals 2

    .line 50
    iget v0, p0, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->prefixLength:I

    iget-object v1, p0, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->base:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 9

    if-ltz p1, :cond_2

    .line 76
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->base:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v0

    iget v1, p0, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->prefixLength:I

    add-int/2addr v0, v1

    if-gt p2, v0, :cond_2

    if-ge p1, v1, :cond_1

    if-gt p2, v1, :cond_0

    .line 80
    new-instance v2, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;

    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->prefix:Ljava/lang/String;

    invoke-virtual {v0, p1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    iget-object p1, p0, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->base:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 p2, 0x0

    invoke-interface {p1, p2, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v4

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v5, 0x0

    invoke-direct/range {v2 .. v7}, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;-><init>(Ljava/lang/String;Lcom/vladsch/flexmark/util/sequence/BasedSequence;IIZ)V

    return-object v2

    .line 83
    :cond_0
    new-instance v3, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;

    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->prefix:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->base:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget p1, p0, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->prefixLength:I

    sub-int v7, p2, p1

    const/4 v8, 0x0

    const/4 v6, 0x0

    invoke-direct/range {v3 .. v8}, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;-><init>(Ljava/lang/String;Lcom/vladsch/flexmark/util/sequence/BasedSequence;IIZ)V

    return-object v3

    .line 87
    :cond_1
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->base:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    sub-int/2addr p1, v1

    sub-int/2addr p2, v1

    invoke-interface {v0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1

    .line 90
    :cond_2
    const-string v0, "String index out of range: "

    if-ltz p1, :cond_4

    iget-object v1, p0, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->base:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v1

    iget v2, p0, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->prefixLength:I

    add-int/2addr v1, v2

    if-le p1, v1, :cond_3

    goto :goto_0

    .line 93
    :cond_3
    new-instance p1, Ljava/lang/StringIndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 91
    :cond_4
    :goto_0
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

    .line 7
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 98
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->prefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->base:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
