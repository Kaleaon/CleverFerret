.class public Lcom/vladsch/flexmark/util/ast/Document;
.super Lcom/vladsch/flexmark/util/ast/Block;
.source "Document.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/options/MutableDataHolder;


# instance fields
.field private final dataSet:Lcom/vladsch/flexmark/util/options/MutableDataSet;


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 22
    invoke-direct {p0, p2}, Lcom/vladsch/flexmark/util/ast/Block;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 23
    new-instance p2, Lcom/vladsch/flexmark/util/options/MutableDataSet;

    invoke-direct {p2, p1}, Lcom/vladsch/flexmark/util/options/MutableDataSet;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    iput-object p2, p0, Lcom/vladsch/flexmark/util/ast/Document;->dataSet:Lcom/vladsch/flexmark/util/options/MutableDataSet;

    return-void
.end method


# virtual methods
.method public clear()Lcom/vladsch/flexmark/util/options/MutableDataHolder;
    .locals 1

    .line 116
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public contains(Lcom/vladsch/flexmark/util/options/DataKey;)Z
    .locals 1

    .line 33
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Document;->dataSet:Lcom/vladsch/flexmark/util/options/MutableDataSet;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/MutableDataSet;->contains(Lcom/vladsch/flexmark/util/options/DataKey;)Z

    move-result p1

    return p1
.end method

.method public get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 37
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Document;->dataSet:Lcom/vladsch/flexmark/util/options/MutableDataSet;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/MutableDataSet;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getAll()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lcom/vladsch/flexmark/util/options/DataKey;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 27
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Document;->dataSet:Lcom/vladsch/flexmark/util/options/MutableDataSet;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/options/MutableDataSet;->getAll()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getLineCount()I
    .locals 2

    .line 47
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Document;->lineSegments:Ljava/util/List;

    sget-object v1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->EMPTY_LIST:Ljava/util/List;

    if-ne v0, v1, :cond_2

    .line 48
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Document;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->lastChar()C

    move-result v0

    const/16 v1, 0xa

    if-eq v0, v1, :cond_1

    const/16 v1, 0xd

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x0

    .line 49
    :goto_1
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Document;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/vladsch/flexmark/util/ast/Document;->getLineNumber(I)I

    move-result v1

    add-int/2addr v0, v1

    return v0

    .line 51
    :cond_2
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Document;->lineSegments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getLineNumber(I)I
    .locals 5

    .line 65
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Document;->lineSegments:Ljava/util/List;

    sget-object v1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->EMPTY_LIST:Ljava/util/List;

    const/4 v2, 0x0

    if-ne v0, v1, :cond_3

    .line 66
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Document;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    add-int/lit8 v1, p1, 0x1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Document;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    invoke-interface {v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v3

    filled-new-array {v3}, [I

    move-result-object v3

    invoke-static {v1, v3}, Lcom/vladsch/flexmark/util/Utils;->maxLimit(I[I)I

    move-result v1

    invoke-interface {v0, v2, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    .line 68
    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    return v2

    .line 70
    :cond_0
    invoke-interface {v0, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->endOfLineAnyEOL(I)I

    move-result v1

    .line 71
    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v3

    :goto_0
    if-ge v1, v3, :cond_2

    .line 73
    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->eolLength(I)I

    move-result v4

    add-int/2addr v1, v4

    if-lt p1, v1, :cond_1

    add-int/lit8 v2, v2, 0x1

    .line 75
    :cond_1
    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->endOfLineAnyEOL(I)I

    move-result v1

    goto :goto_0

    :cond_2
    return v2

    .line 80
    :cond_3
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Document;->lineSegments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    :goto_1
    if-ge v2, v0, :cond_5

    .line 82
    iget-object v1, p0, Lcom/vladsch/flexmark/util/ast/Document;->lineSegments:Ljava/util/List;

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v1

    if-ge p1, v1, :cond_4

    return v2

    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_5
    return v0
.end method

.method public getOrCompute(Lcom/vladsch/flexmark/util/options/DataKey;Lcom/vladsch/flexmark/util/collection/DataValueFactory;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "TT;>;",
            "Lcom/vladsch/flexmark/util/collection/DataValueFactory<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 91
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Document;->dataSet:Lcom/vladsch/flexmark/util/options/MutableDataSet;

    invoke-virtual {v0, p1, p2}, Lcom/vladsch/flexmark/util/options/MutableDataSet;->getOrCompute(Lcom/vladsch/flexmark/util/options/DataKey;Lcom/vladsch/flexmark/util/collection/DataValueFactory;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getSegments()[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 18
    sget-object v0, Lcom/vladsch/flexmark/util/ast/Document;->EMPTY_SEGMENTS:[Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public keySet()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lcom/vladsch/flexmark/util/options/DataKey;",
            ">;"
        }
    .end annotation

    .line 30
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Document;->dataSet:Lcom/vladsch/flexmark/util/options/MutableDataSet;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/options/MutableDataSet;->keySet()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public remove(Lcom/vladsch/flexmark/util/options/DataKey;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "TT;>;)",
            "Lcom/vladsch/flexmark/util/options/MutableDataHolder;"
        }
    .end annotation

    .line 94
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Document;->dataSet:Lcom/vladsch/flexmark/util/options/MutableDataSet;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/MutableDataSet;->remove(Lcom/vladsch/flexmark/util/options/DataKey;)Lcom/vladsch/flexmark/util/options/MutableDataSet;

    move-result-object p1

    return-object p1
.end method

.method public set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "+TT;>;TT;)",
            "Lcom/vladsch/flexmark/util/options/MutableDataHolder;"
        }
    .end annotation

    .line 97
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Document;->dataSet:Lcom/vladsch/flexmark/util/options/MutableDataSet;

    invoke-virtual {v0, p1, p2}, Lcom/vladsch/flexmark/util/options/MutableDataSet;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataSet;

    move-result-object p1

    return-object p1
.end method

.method public setAll(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;
    .locals 1

    .line 104
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Document;->dataSet:Lcom/vladsch/flexmark/util/options/MutableDataSet;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/MutableDataSet;->setAll(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/util/options/MutableDataSet;

    .line 105
    iget-object p1, p0, Lcom/vladsch/flexmark/util/ast/Document;->dataSet:Lcom/vladsch/flexmark/util/options/MutableDataSet;

    return-object p1
.end method

.method public setFrom(Lcom/vladsch/flexmark/util/options/MutableDataSetter;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;
    .locals 1

    .line 100
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Document;->dataSet:Lcom/vladsch/flexmark/util/options/MutableDataSet;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/MutableDataSet;->setFrom(Lcom/vladsch/flexmark/util/options/MutableDataSetter;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object p1

    return-object p1
.end method

.method public setIn(Lcom/vladsch/flexmark/util/options/MutableDataHolder;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;
    .locals 1

    .line 42
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Document;->dataSet:Lcom/vladsch/flexmark/util/options/MutableDataSet;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/MutableDataSet;->setIn(Lcom/vladsch/flexmark/util/options/MutableDataHolder;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object p1

    return-object p1
.end method

.method public toImmutable()Lcom/vladsch/flexmark/util/options/DataHolder;
    .locals 1

    .line 112
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Document;->dataSet:Lcom/vladsch/flexmark/util/options/MutableDataSet;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/options/MutableDataSet;->toImmutable()Lcom/vladsch/flexmark/util/options/DataHolder;

    move-result-object v0

    return-object v0
.end method

.method public toMutable()Lcom/vladsch/flexmark/util/options/MutableDataHolder;
    .locals 1

    .line 109
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/Document;->dataSet:Lcom/vladsch/flexmark/util/options/MutableDataSet;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/options/MutableDataSet;->toMutable()Lcom/vladsch/flexmark/util/options/MutableDataSet;

    move-result-object v0

    return-object v0
.end method
