.class public interface abstract Lcom/vladsch/flexmark/parser/block/BlockParser;
.super Ljava/lang/Object;
.source "BlockParser.java"


# virtual methods
.method public abstract addLine(Lcom/vladsch/flexmark/parser/block/ParserState;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
.end method

.method public abstract breakOutOnDoubleBlankLine()Z
.end method

.method public abstract canContain(Lcom/vladsch/flexmark/parser/block/ParserState;Lcom/vladsch/flexmark/parser/block/BlockParser;Lcom/vladsch/flexmark/util/ast/Block;)Z
.end method

.method public abstract canInterruptBy(Lcom/vladsch/flexmark/parser/block/BlockParserFactory;)Z
.end method

.method public abstract closeBlock(Lcom/vladsch/flexmark/parser/block/ParserState;)V
.end method

.method public abstract finalizeClosedBlock()V
.end method

.method public abstract getBlock()Lcom/vladsch/flexmark/util/ast/Block;
.end method

.method public abstract getBlockContent()Lcom/vladsch/flexmark/util/ast/BlockContent;
.end method

.method public abstract getDataHolder()Lcom/vladsch/flexmark/util/options/MutableDataHolder;
.end method

.method public abstract isClosed()Z
.end method

.method public abstract isContainer()Z
.end method

.method public abstract isInterruptible()Z
.end method

.method public abstract isParagraphParser()Z
.end method

.method public abstract isPropagatingLastBlankLine(Lcom/vladsch/flexmark/parser/block/BlockParser;)Z
.end method

.method public abstract isRawText()Z
.end method

.method public abstract parseInlines(Lcom/vladsch/flexmark/parser/InlineParser;)V
.end method

.method public abstract tryContinue(Lcom/vladsch/flexmark/parser/block/ParserState;)Lcom/vladsch/flexmark/parser/block/BlockContinue;
.end method
