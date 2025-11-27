.class public final Lcom/vladsch/flexmark/util/sequence/MappedSequence;
.super Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;
.source "MappedSequence.java"


# instance fields
.field private final base:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field private final mapper:Lcom/vladsch/flexmark/util/mappers/CharMapper;


# direct methods
.method private constructor <init>(Lcom/vladsch/flexmark/util/mappers/CharMapper;Ljava/lang/CharSequence;)V
    .locals 0

    .line 16
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;-><init>()V

    .line 17
    invoke-static {p2}, Lcom/vladsch/flexmark/util/sequence/MappedSequence;->of(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    iput-object p2, p0, Lcom/vladsch/flexmark/util/sequence/MappedSequence;->base:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 18
    iput-object p1, p0, Lcom/vladsch/flexmark/util/sequence/MappedSequence;->mapper:Lcom/vladsch/flexmark/util/mappers/CharMapper;

    return-void
.end method

.method private constructor <init>(Lcom/vladsch/flexmark/util/mappers/CharMapper;Ljava/lang/CharSequence;I)V
    .locals 0

    .line 21
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;-><init>()V

    .line 22
    invoke-static {p2, p3}, Lcom/vladsch/flexmark/util/sequence/MappedSequence;->of(Ljava/lang/CharSequence;I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    iput-object p2, p0, Lcom/vladsch/flexmark/util/sequence/MappedSequence;->base:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 23
    iput-object p1, p0, Lcom/vladsch/flexmark/util/sequence/MappedSequence;->mapper:Lcom/vladsch/flexmark/util/mappers/CharMapper;

    return-void
.end method

.method private constructor <init>(Lcom/vladsch/flexmark/util/mappers/CharMapper;Ljava/lang/CharSequence;II)V
    .locals 0

    .line 26
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;-><init>()V

    .line 27
    invoke-static {p2, p3, p4}, Lcom/vladsch/flexmark/util/sequence/MappedSequence;->of(Ljava/lang/CharSequence;II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    iput-object p2, p0, Lcom/vladsch/flexmark/util/sequence/MappedSequence;->base:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 28
    iput-object p1, p0, Lcom/vladsch/flexmark/util/sequence/MappedSequence;->mapper:Lcom/vladsch/flexmark/util/mappers/CharMapper;

    return-void
.end method

.method public static of(Lcom/vladsch/flexmark/util/mappers/CharMapper;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/MappedSequence;
    .locals 1

    .line 32
    new-instance v0, Lcom/vladsch/flexmark/util/sequence/MappedSequence;

    invoke-direct {v0, p0, p1}, Lcom/vladsch/flexmark/util/sequence/MappedSequence;-><init>(Lcom/vladsch/flexmark/util/mappers/CharMapper;Ljava/lang/CharSequence;)V

    return-object v0
.end method

.method public static of(Lcom/vladsch/flexmark/util/mappers/CharMapper;Ljava/lang/CharSequence;I)Lcom/vladsch/flexmark/util/sequence/MappedSequence;
    .locals 1

    .line 36
    new-instance v0, Lcom/vladsch/flexmark/util/sequence/MappedSequence;

    invoke-direct {v0, p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/MappedSequence;-><init>(Lcom/vladsch/flexmark/util/mappers/CharMapper;Ljava/lang/CharSequence;I)V

    return-object v0
.end method

.method public static of(Lcom/vladsch/flexmark/util/mappers/CharMapper;Ljava/lang/CharSequence;II)Lcom/vladsch/flexmark/util/sequence/MappedSequence;
    .locals 1

    .line 40
    new-instance v0, Lcom/vladsch/flexmark/util/sequence/MappedSequence;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/vladsch/flexmark/util/sequence/MappedSequence;-><init>(Lcom/vladsch/flexmark/util/mappers/CharMapper;Ljava/lang/CharSequence;II)V

    return-object v0
.end method


# virtual methods
.method public baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 57
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/MappedSequence;->base:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    .line 58
    iget-object p2, p0, Lcom/vladsch/flexmark/util/sequence/MappedSequence;->base:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    if-ne p1, p2, :cond_0

    return-object p0

    :cond_0
    new-instance p2, Lcom/vladsch/flexmark/util/sequence/MappedSequence;

    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/MappedSequence;->mapper:Lcom/vladsch/flexmark/util/mappers/CharMapper;

    invoke-direct {p2, v0, p1}, Lcom/vladsch/flexmark/util/sequence/MappedSequence;-><init>(Lcom/vladsch/flexmark/util/mappers/CharMapper;Ljava/lang/CharSequence;)V

    return-object p2
.end method

.method public charAt(I)C
    .locals 1

    .line 45
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/MappedSequence;->base:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result p1

    .line 46
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/MappedSequence;->mapper:Lcom/vladsch/flexmark/util/mappers/CharMapper;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/mappers/CharMapper;->map(C)C

    move-result p1

    return p1
.end method

.method public getBase()Ljava/lang/Object;
    .locals 1

    .line 63
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/MappedSequence;->base:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getBase()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getBaseSequence()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 68
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/MappedSequence;->base:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getBaseSequence()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    return-object v0
.end method

.method public getCharMapper()Lcom/vladsch/flexmark/util/mappers/CharMapper;
    .locals 1

    .line 13
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/MappedSequence;->mapper:Lcom/vladsch/flexmark/util/mappers/CharMapper;

    return-object v0
.end method

.method public getEndOffset()I
    .locals 1

    .line 78
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/MappedSequence;->base:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v0

    return v0
.end method

.method public getIndexOffset(I)I
    .locals 1

    .line 83
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/MappedSequence;->base:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getIndexOffset(I)I

    move-result p1

    return p1
.end method

.method public getSourceRange()Lcom/vladsch/flexmark/util/sequence/Range;
    .locals 1

    .line 88
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/MappedSequence;->base:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getSourceRange()Lcom/vladsch/flexmark/util/sequence/Range;

    move-result-object v0

    return-object v0
.end method

.method public getStartOffset()I
    .locals 1

    .line 73
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/MappedSequence;->base:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v0

    return v0
.end method

.method public length()I
    .locals 1

    .line 93
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/MappedSequence;->base:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v0

    return v0
.end method

.method public subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 51
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/MappedSequence;->base:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    .line 52
    iget-object p2, p0, Lcom/vladsch/flexmark/util/sequence/MappedSequence;->base:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    if-ne p1, p2, :cond_0

    return-object p0

    :cond_0
    new-instance p2, Lcom/vladsch/flexmark/util/sequence/MappedSequence;

    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/MappedSequence;->mapper:Lcom/vladsch/flexmark/util/mappers/CharMapper;

    invoke-direct {p2, v0, p1}, Lcom/vladsch/flexmark/util/sequence/MappedSequence;-><init>(Lcom/vladsch/flexmark/util/mappers/CharMapper;Ljava/lang/CharSequence;)V

    return-object p2
.end method

.method public bridge synthetic subSequence(II)Ljava/lang/CharSequence;
    .locals 0

    .line 8
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/sequence/MappedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 99
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/sequence/MappedSequence;->length()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 100
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 101
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
