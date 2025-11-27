.class public interface abstract Lcom/vladsch/flexmark/parser/block/MatchedBlockParser;
.super Ljava/lang/Object;
.source "MatchedBlockParser.java"


# virtual methods
.method public abstract getBlockParser()Lcom/vladsch/flexmark/parser/block/BlockParser;
.end method

.method public abstract getParagraphContent()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract getParagraphDataHolder()Lcom/vladsch/flexmark/util/options/MutableDataHolder;
.end method

.method public abstract getParagraphEolLengths()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getParagraphLines()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            ">;"
        }
    .end annotation
.end method
