.class public Lcom/vladsch/flexmark/parser/core/IndentedCodeBlockParser;
.super Lcom/vladsch/flexmark/parser/block/AbstractBlockParser;
.source "IndentedCodeBlockParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/parser/core/IndentedCodeBlockParser$BlockFactory;,
        Lcom/vladsch/flexmark/parser/core/IndentedCodeBlockParser$Factory;
    }
.end annotation


# instance fields
.field private final block:Lcom/vladsch/flexmark/ast/IndentedCodeBlock;

.field private final codeContentBlock:Z

.field private content:Lcom/vladsch/flexmark/util/ast/BlockContent;

.field private trimTrailingBlankLines:Z


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 1

    .line 21
    invoke-direct {p0}, Lcom/vladsch/flexmark/parser/block/AbstractBlockParser;-><init>()V

    .line 16
    new-instance v0, Lcom/vladsch/flexmark/ast/IndentedCodeBlock;

    invoke-direct {v0}, Lcom/vladsch/flexmark/ast/IndentedCodeBlock;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/core/IndentedCodeBlockParser;->block:Lcom/vladsch/flexmark/ast/IndentedCodeBlock;

    .line 17
    new-instance v0, Lcom/vladsch/flexmark/util/ast/BlockContent;

    invoke-direct {v0}, Lcom/vladsch/flexmark/util/ast/BlockContent;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/core/IndentedCodeBlockParser;->content:Lcom/vladsch/flexmark/util/ast/BlockContent;

    .line 22
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->INDENTED_CODE_NO_TRAILING_BLANK_LINES:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/core/IndentedCodeBlockParser;->trimTrailingBlankLines:Z

    .line 23
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->FENCED_CODE_CONTENT_BLOCK:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/core/IndentedCodeBlockParser;->codeContentBlock:Z

    return-void
.end method


# virtual methods
.method public addLine(Lcom/vladsch/flexmark/parser/block/ParserState;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 1

    .line 44
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/IndentedCodeBlockParser;->content:Lcom/vladsch/flexmark/util/ast/BlockContent;

    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndent()I

    move-result p1

    invoke-virtual {v0, p2, p1}, Lcom/vladsch/flexmark/util/ast/BlockContent;->add(Lcom/vladsch/flexmark/util/sequence/BasedSequence;I)V

    return-void
.end method

.method public closeBlock(Lcom/vladsch/flexmark/parser/block/ParserState;)V
    .locals 4

    .line 50
    iget-boolean p1, p0, Lcom/vladsch/flexmark/parser/core/IndentedCodeBlockParser;->trimTrailingBlankLines:Z

    if-eqz p1, :cond_3

    .line 52
    iget-object p1, p0, Lcom/vladsch/flexmark/parser/core/IndentedCodeBlockParser;->content:Lcom/vladsch/flexmark/util/ast/BlockContent;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/BlockContent;->getLines()Ljava/util/List;

    move-result-object p1

    .line 53
    new-instance v0, Lcom/vladsch/flexmark/util/collection/iteration/Reverse;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/util/collection/iteration/Reverse;-><init>(Ljava/util/List;)V

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/iteration/Reverse;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 54
    invoke-interface {v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isBlank()Z

    move-result v3

    if-nez v3, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    if-lez v2, :cond_2

    .line 58
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/IndentedCodeBlockParser;->block:Lcom/vladsch/flexmark/ast/IndentedCodeBlock;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    sub-int/2addr v3, v2

    invoke-interface {p1, v1, v3}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/ast/IndentedCodeBlock;->setContent(Ljava/util/List;)V

    goto :goto_2

    .line 59
    :cond_2
    iget-object p1, p0, Lcom/vladsch/flexmark/parser/core/IndentedCodeBlockParser;->block:Lcom/vladsch/flexmark/ast/IndentedCodeBlock;

    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/IndentedCodeBlockParser;->content:Lcom/vladsch/flexmark/util/ast/BlockContent;

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/ast/IndentedCodeBlock;->setContent(Lcom/vladsch/flexmark/util/ast/BlockContent;)V

    goto :goto_2

    .line 61
    :cond_3
    iget-object p1, p0, Lcom/vladsch/flexmark/parser/core/IndentedCodeBlockParser;->block:Lcom/vladsch/flexmark/ast/IndentedCodeBlock;

    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/IndentedCodeBlockParser;->content:Lcom/vladsch/flexmark/util/ast/BlockContent;

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/ast/IndentedCodeBlock;->setContent(Lcom/vladsch/flexmark/util/ast/BlockContent;)V

    .line 64
    :goto_2
    iget-boolean p1, p0, Lcom/vladsch/flexmark/parser/core/IndentedCodeBlockParser;->codeContentBlock:Z

    if-eqz p1, :cond_4

    .line 65
    new-instance p1, Lcom/vladsch/flexmark/ast/CodeBlock;

    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/IndentedCodeBlockParser;->block:Lcom/vladsch/flexmark/ast/IndentedCodeBlock;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/ast/IndentedCodeBlock;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/IndentedCodeBlockParser;->block:Lcom/vladsch/flexmark/ast/IndentedCodeBlock;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/ast/IndentedCodeBlock;->getContentLines()Ljava/util/List;

    move-result-object v1

    invoke-direct {p1, v0, v1}, Lcom/vladsch/flexmark/ast/CodeBlock;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/util/List;)V

    .line 66
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/IndentedCodeBlockParser;->block:Lcom/vladsch/flexmark/ast/IndentedCodeBlock;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/ast/IndentedCodeBlock;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    :cond_4
    const/4 p1, 0x0

    .line 68
    iput-object p1, p0, Lcom/vladsch/flexmark/parser/core/IndentedCodeBlockParser;->content:Lcom/vladsch/flexmark/util/ast/BlockContent;

    return-void
.end method

.method public getBlock()Lcom/vladsch/flexmark/util/ast/Block;
    .locals 1

    .line 28
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/IndentedCodeBlockParser;->block:Lcom/vladsch/flexmark/ast/IndentedCodeBlock;

    return-object v0
.end method

.method public tryContinue(Lcom/vladsch/flexmark/parser/block/ParserState;)Lcom/vladsch/flexmark/parser/block/BlockContinue;
    .locals 2

    .line 33
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndent()I

    move-result v0

    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getParsing()Lcom/vladsch/flexmark/ast/util/Parsing;

    move-result-object v1

    iget v1, v1, Lcom/vladsch/flexmark/ast/util/Parsing;->CODE_BLOCK_INDENT:I

    if-lt v0, v1, :cond_0

    .line 34
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getColumn()I

    move-result v0

    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getParsing()Lcom/vladsch/flexmark/ast/util/Parsing;

    move-result-object p1

    iget p1, p1, Lcom/vladsch/flexmark/ast/util/Parsing;->CODE_BLOCK_INDENT:I

    add-int/2addr v0, p1

    invoke-static {v0}, Lcom/vladsch/flexmark/parser/block/BlockContinue;->atColumn(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 35
    :cond_0
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->isBlank()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 36
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getNextNonSpaceIndex()I

    move-result p1

    invoke-static {p1}, Lcom/vladsch/flexmark/parser/block/BlockContinue;->atIndex(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 38
    :cond_1
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockContinue;->none()Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1
.end method
