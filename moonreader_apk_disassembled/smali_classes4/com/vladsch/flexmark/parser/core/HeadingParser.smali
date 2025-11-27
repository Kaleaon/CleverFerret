.class public Lcom/vladsch/flexmark/parser/core/HeadingParser;
.super Lcom/vladsch/flexmark/parser/block/AbstractBlockParser;
.source "HeadingParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/parser/core/HeadingParser$HeadingOptions;,
        Lcom/vladsch/flexmark/parser/core/HeadingParser$BlockFactory;,
        Lcom/vladsch/flexmark/parser/core/HeadingParser$Factory;,
        Lcom/vladsch/flexmark/parser/core/HeadingParser$HeadingParsing;
    }
.end annotation


# instance fields
.field final block:Lcom/vladsch/flexmark/ast/Heading;


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 40
    invoke-direct {p0}, Lcom/vladsch/flexmark/parser/block/AbstractBlockParser;-><init>()V

    .line 38
    new-instance v0, Lcom/vladsch/flexmark/ast/Heading;

    invoke-direct {v0}, Lcom/vladsch/flexmark/ast/Heading;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/core/HeadingParser;->block:Lcom/vladsch/flexmark/ast/Heading;

    .line 41
    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/ast/Heading;->setLevel(I)V

    return-void
.end method


# virtual methods
.method public closeBlock(Lcom/vladsch/flexmark/parser/block/ParserState;)V
    .locals 0

    return-void
.end method

.method public getBlock()Lcom/vladsch/flexmark/util/ast/Block;
    .locals 1

    .line 46
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/HeadingParser;->block:Lcom/vladsch/flexmark/ast/Heading;

    return-object v0
.end method

.method public parseInlines(Lcom/vladsch/flexmark/parser/InlineParser;)V
    .locals 2

    .line 57
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/HeadingParser;->block:Lcom/vladsch/flexmark/ast/Heading;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/ast/Heading;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/HeadingParser;->block:Lcom/vladsch/flexmark/ast/Heading;

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/parser/InlineParser;->parse(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method

.method public tryContinue(Lcom/vladsch/flexmark/parser/block/ParserState;)Lcom/vladsch/flexmark/parser/block/BlockContinue;
    .locals 0

    .line 52
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockContinue;->none()Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1
.end method
