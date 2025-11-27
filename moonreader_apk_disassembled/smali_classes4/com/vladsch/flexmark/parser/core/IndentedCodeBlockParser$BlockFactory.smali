.class public Lcom/vladsch/flexmark/parser/core/IndentedCodeBlockParser$BlockFactory;
.super Lcom/vladsch/flexmark/parser/block/AbstractBlockParserFactory;
.source "IndentedCodeBlockParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/parser/core/IndentedCodeBlockParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BlockFactory"
.end annotation


# direct methods
.method private constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 0

    .line 112
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/block/AbstractBlockParserFactory;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;Lcom/vladsch/flexmark/parser/core/IndentedCodeBlockParser$1;)V
    .locals 0

    .line 110
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/core/IndentedCodeBlockParser$BlockFactory;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    return-void
.end method


# virtual methods
.method public tryStart(Lcom/vladsch/flexmark/parser/block/ParserState;Lcom/vladsch/flexmark/parser/block/MatchedBlockParser;)Lcom/vladsch/flexmark/parser/block/BlockStart;
    .locals 2

    .line 118
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndent()I

    move-result p2

    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getParsing()Lcom/vladsch/flexmark/ast/util/Parsing;

    move-result-object v0

    iget v0, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->CODE_BLOCK_INDENT:I

    if-lt p2, v0, :cond_0

    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->isBlank()Z

    move-result p2

    if-nez p2, :cond_0

    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getActiveBlockParser()Lcom/vladsch/flexmark/parser/block/BlockParser;

    move-result-object p2

    invoke-interface {p2}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object p2

    instance-of p2, p2, Lcom/vladsch/flexmark/ast/Paragraph;

    if-nez p2, :cond_0

    const/4 p2, 0x1

    .line 119
    new-array p2, p2, [Lcom/vladsch/flexmark/parser/block/BlockParser;

    new-instance v0, Lcom/vladsch/flexmark/parser/core/IndentedCodeBlockParser;

    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getProperties()Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/parser/core/IndentedCodeBlockParser;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    const/4 v1, 0x0

    aput-object v0, p2, v1

    invoke-static {p2}, Lcom/vladsch/flexmark/parser/block/BlockStart;->of([Lcom/vladsch/flexmark/parser/block/BlockParser;)Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p2

    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getColumn()I

    move-result v0

    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getParsing()Lcom/vladsch/flexmark/ast/util/Parsing;

    move-result-object p1

    iget p1, p1, Lcom/vladsch/flexmark/ast/util/Parsing;->CODE_BLOCK_INDENT:I

    add-int/2addr v0, p1

    invoke-virtual {p2, v0}, Lcom/vladsch/flexmark/parser/block/BlockStart;->atColumn(I)Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    return-object p1

    .line 121
    :cond_0
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockStart;->none()Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    return-object p1
.end method
