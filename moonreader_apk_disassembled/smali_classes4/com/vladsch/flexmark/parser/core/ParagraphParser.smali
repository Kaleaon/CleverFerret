.class public Lcom/vladsch/flexmark/parser/core/ParagraphParser;
.super Lcom/vladsch/flexmark/parser/block/AbstractBlockParser;
.source "ParagraphParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/parser/core/ParagraphParser$Factory;
    }
.end annotation


# instance fields
.field private final block:Lcom/vladsch/flexmark/ast/Paragraph;

.field private content:Lcom/vladsch/flexmark/util/ast/BlockContent;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 9
    invoke-direct {p0}, Lcom/vladsch/flexmark/parser/block/AbstractBlockParser;-><init>()V

    .line 11
    new-instance v0, Lcom/vladsch/flexmark/ast/Paragraph;

    invoke-direct {v0}, Lcom/vladsch/flexmark/ast/Paragraph;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/core/ParagraphParser;->block:Lcom/vladsch/flexmark/ast/Paragraph;

    .line 12
    new-instance v0, Lcom/vladsch/flexmark/util/ast/BlockContent;

    invoke-direct {v0}, Lcom/vladsch/flexmark/util/ast/BlockContent;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/core/ParagraphParser;->content:Lcom/vladsch/flexmark/util/ast/BlockContent;

    return-void
.end method


# virtual methods
.method public addLine(Lcom/vladsch/flexmark/parser/block/ParserState;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 1

    .line 35
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/ParagraphParser;->content:Lcom/vladsch/flexmark/util/ast/BlockContent;

    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndent()I

    move-result p1

    invoke-virtual {v0, p2, p1}, Lcom/vladsch/flexmark/util/ast/BlockContent;->add(Lcom/vladsch/flexmark/util/sequence/BasedSequence;I)V

    return-void
.end method

.method public closeBlock(Lcom/vladsch/flexmark/parser/block/ParserState;)V
    .locals 1

    .line 50
    iget-object p1, p0, Lcom/vladsch/flexmark/parser/core/ParagraphParser;->block:Lcom/vladsch/flexmark/ast/Paragraph;

    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/ParagraphParser;->content:Lcom/vladsch/flexmark/util/ast/BlockContent;

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/ast/Paragraph;->setContent(Lcom/vladsch/flexmark/util/ast/BlockContent;)V

    const/4 p1, 0x0

    .line 51
    iput-object p1, p0, Lcom/vladsch/flexmark/parser/core/ParagraphParser;->content:Lcom/vladsch/flexmark/util/ast/BlockContent;

    return-void
.end method

.method public getBlock()Lcom/vladsch/flexmark/ast/Paragraph;
    .locals 1

    .line 20
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/ParagraphParser;->block:Lcom/vladsch/flexmark/ast/Paragraph;

    return-object v0
.end method

.method public bridge synthetic getBlock()Lcom/vladsch/flexmark/util/ast/Block;
    .locals 1

    .line 9
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/core/ParagraphParser;->getBlock()Lcom/vladsch/flexmark/ast/Paragraph;

    move-result-object v0

    return-object v0
.end method

.method public getBlockContent()Lcom/vladsch/flexmark/util/ast/BlockContent;
    .locals 1

    .line 15
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/ParagraphParser;->content:Lcom/vladsch/flexmark/util/ast/BlockContent;

    return-object v0
.end method

.method public isInterruptible()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public isParagraphParser()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public parseInlines(Lcom/vladsch/flexmark/parser/InlineParser;)V
    .locals 2

    .line 56
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/core/ParagraphParser;->getBlock()Lcom/vladsch/flexmark/ast/Paragraph;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/ast/Paragraph;->getContentChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/core/ParagraphParser;->getBlock()Lcom/vladsch/flexmark/ast/Paragraph;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/parser/InlineParser;->parse(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method

.method public tryContinue(Lcom/vladsch/flexmark/parser/block/ParserState;)Lcom/vladsch/flexmark/parser/block/BlockContinue;
    .locals 1

    .line 25
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->isBlank()Z

    move-result v0

    if-nez v0, :cond_0

    .line 26
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndex()I

    move-result p1

    invoke-static {p1}, Lcom/vladsch/flexmark/parser/block/BlockContinue;->atIndex(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 28
    :cond_0
    iget-object p1, p0, Lcom/vladsch/flexmark/parser/core/ParagraphParser;->block:Lcom/vladsch/flexmark/ast/Paragraph;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/ast/Paragraph;->setTrailingBlankLine(Z)V

    .line 29
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockContinue;->none()Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1
.end method
