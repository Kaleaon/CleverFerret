.class public interface abstract Lcom/vladsch/flexmark/parser/block/ParserState;
.super Ljava/lang/Object;
.source "ParserState.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/BlockTracker;
.implements Lcom/vladsch/flexmark/parser/block/BlockParserTracker;


# virtual methods
.method public abstract endsWithBlankLine(Lcom/vladsch/flexmark/util/ast/Node;)Z
.end method

.method public abstract getActiveBlockParser()Lcom/vladsch/flexmark/parser/block/BlockParser;
.end method

.method public abstract getActiveBlockParser(Lcom/vladsch/flexmark/util/ast/Block;)Lcom/vladsch/flexmark/parser/block/BlockParser;
.end method

.method public abstract getActiveBlockParsers()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/block/BlockParser;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getColumn()I
.end method

.method public abstract getIndent()I
.end method

.method public abstract getIndex()I
.end method

.method public abstract getInlineParser()Lcom/vladsch/flexmark/parser/InlineParser;
.end method

.method public abstract getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract getLineEndIndex()I
.end method

.method public abstract getLineEolLength()I
.end method

.method public abstract getLineNumber()I
.end method

.method public abstract getLineSegments()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getLineStart()I
.end method

.method public abstract getLineWithEOL()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract getNextNonSpaceIndex()I
.end method

.method public abstract getParserPhase()Lcom/vladsch/flexmark/parser/block/ParserPhase;
.end method

.method public abstract getParsing()Lcom/vladsch/flexmark/ast/util/Parsing;
.end method

.method public abstract getProperties()Lcom/vladsch/flexmark/util/options/MutableDataHolder;
.end method

.method public abstract isBlank()Z
.end method

.method public abstract isLastLineBlank(Lcom/vladsch/flexmark/util/ast/Node;)Z
.end method
