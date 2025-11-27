.class public final Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;
.super Ljava/lang/Object;
.source "SegmentedSequenceBuilder.java"


# instance fields
.field private final base:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field private final segments:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 1

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;->segments:Ljava/util/ArrayList;

    .line 15
    iput-object p1, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;->base:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;I)V
    .locals 1

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;->segments:Ljava/util/ArrayList;

    .line 20
    iput-object p1, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;->base:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method


# virtual methods
.method public append(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;
    .locals 1

    .line 24
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;->segments:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public append(Ljava/lang/String;)Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;
    .locals 3

    .line 30
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;->segments:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 31
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;->base:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 v1, 0x0

    invoke-interface {v0, v1, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    goto :goto_0

    .line 33
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;->segments:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 34
    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v1

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v2

    invoke-interface {v0, v1, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    .line 36
    :goto_0
    invoke-static {p1, v0}, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->of(Ljava/lang/String;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;->append(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;

    move-result-object p1

    return-object p1
.end method

.method public isEmpty()Z
    .locals 2

    .line 64
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;->segments:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 65
    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method public length()I
    .locals 7

    .line 50
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;->segments:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 51
    invoke-interface {v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_0

    goto :goto_0

    :cond_0
    if-eqz v2, :cond_1

    .line 53
    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v5

    invoke-interface {v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v6

    if-ge v5, v6, :cond_1

    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-interface {v2, v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v2

    const-string v5, " \t\r\n"

    invoke-virtual {v5, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    const/4 v6, -0x1

    if-ne v2, v6, :cond_1

    invoke-interface {v4, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v2

    invoke-virtual {v5, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-ne v2, v6, :cond_1

    add-int/lit8 v3, v3, 0x1

    :cond_1
    add-int/lit8 v3, v3, 0x1

    move-object v2, v4

    goto :goto_0

    :cond_2
    return v3
.end method

.method public toBasedSequence()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 40
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;->segments:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->of(Ljava/util/List;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    return-object v0
.end method

.method public toSegments()[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 2

    .line 44
    iget-object v0, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;->segments:Ljava/util/ArrayList;

    sget-object v1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->EMPTY_SEGMENTS:[Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 7

    .line 73
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 75
    iget-object v1, p0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;->segments:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x0

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 76
    invoke-interface {v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_0

    goto :goto_0

    :cond_0
    if-eqz v2, :cond_1

    .line 78
    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v4

    invoke-interface {v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v5

    if-ge v4, v5, :cond_1

    .line 79
    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-interface {v2, v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v4

    const-string v5, " \t\r\n"

    invoke-virtual {v5, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    const/4 v6, -0x1

    if-ne v4, v6, :cond_1

    const/4 v4, 0x0

    .line 80
    invoke-interface {v3, v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v4

    invoke-virtual {v5, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    if-ne v4, v6, :cond_1

    .line 81
    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v2

    invoke-interface {v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v4

    invoke-interface {v3, v2, v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    const-string v4, " "

    invoke-interface {v2, v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->endsWith(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/16 v2, 0x20

    .line 83
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 86
    :cond_1
    invoke-interface {v3, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->appendTo(Ljava/lang/StringBuilder;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-object v2, v3

    goto :goto_0

    .line 90
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
