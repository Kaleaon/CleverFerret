.class public Lcom/vladsch/flexmark/parser/core/BlockQuoteParser;
.super Lcom/vladsch/flexmark/parser/block/AbstractBlockParser;
.source "BlockQuoteParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/parser/core/BlockQuoteParser$BlockFactory;,
        Lcom/vladsch/flexmark/parser/core/BlockQuoteParser$Factory;
    }
.end annotation


# static fields
.field public static final MARKER_CHAR:C = '>'


# instance fields
.field private final allowLeadingSpace:Z

.field private final block:Lcom/vladsch/flexmark/ast/BlockQuote;

.field private final continueToBlankLine:Z

.field private final ignoreBlankLine:Z

.field private final interruptsItemParagraph:Z

.field private final interruptsParagraph:Z

.field private lastWasBlankLine:I

.field private final withLeadSpacesInterruptsItemParagraph:Z


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 2

    .line 29
    invoke-direct {p0}, Lcom/vladsch/flexmark/parser/block/AbstractBlockParser;-><init>()V

    .line 20
    new-instance v0, Lcom/vladsch/flexmark/ast/BlockQuote;

    invoke-direct {v0}, Lcom/vladsch/flexmark/ast/BlockQuote;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/core/BlockQuoteParser;->block:Lcom/vladsch/flexmark/ast/BlockQuote;

    const/4 v1, 0x0

    .line 27
    iput v1, p0, Lcom/vladsch/flexmark/parser/core/BlockQuoteParser;->lastWasBlankLine:I

    .line 30
    invoke-virtual {v0, p2}, Lcom/vladsch/flexmark/ast/BlockQuote;->setOpeningMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 31
    sget-object p2, Lcom/vladsch/flexmark/parser/Parser;->BLOCK_QUOTE_EXTEND_TO_BLANK_LINE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, p2}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    iput-boolean p2, p0, Lcom/vladsch/flexmark/parser/core/BlockQuoteParser;->continueToBlankLine:Z

    .line 32
    sget-object p2, Lcom/vladsch/flexmark/parser/Parser;->BLOCK_QUOTE_ALLOW_LEADING_SPACE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, p2}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    iput-boolean p2, p0, Lcom/vladsch/flexmark/parser/core/BlockQuoteParser;->allowLeadingSpace:Z

    .line 33
    sget-object p2, Lcom/vladsch/flexmark/parser/Parser;->BLOCK_QUOTE_IGNORE_BLANK_LINE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, p2}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    iput-boolean p2, p0, Lcom/vladsch/flexmark/parser/core/BlockQuoteParser;->ignoreBlankLine:Z

    .line 34
    sget-object p2, Lcom/vladsch/flexmark/parser/Parser;->BLOCK_QUOTE_INTERRUPTS_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, p2}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    iput-boolean p2, p0, Lcom/vladsch/flexmark/parser/core/BlockQuoteParser;->interruptsParagraph:Z

    .line 35
    sget-object p2, Lcom/vladsch/flexmark/parser/Parser;->BLOCK_QUOTE_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, p2}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    iput-boolean p2, p0, Lcom/vladsch/flexmark/parser/core/BlockQuoteParser;->interruptsItemParagraph:Z

    .line 36
    sget-object p2, Lcom/vladsch/flexmark/parser/Parser;->BLOCK_QUOTE_WITH_LEAD_SPACES_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, p2}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/core/BlockQuoteParser;->withLeadSpacesInterruptsItemParagraph:Z

    return-void
.end method

.method static isMarker(Lcom/vladsch/flexmark/parser/block/ParserState;IZZZZZZ)Z
    .locals 2

    .line 104
    invoke-interface {p0}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz p2, :cond_0

    if-eqz p5, :cond_5

    .line 105
    :cond_0
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result p2

    if-ge p1, p2, :cond_5

    invoke-interface {v0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p1

    const/16 p2, 0x3e

    if-ne p1, p2, :cond_5

    if-nez p4, :cond_1

    .line 106
    invoke-interface {p0}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndent()I

    move-result p1

    if-nez p1, :cond_5

    :cond_1
    if-eqz p3, :cond_2

    if-eqz p6, :cond_5

    :cond_2
    const/4 p1, 0x1

    if-eqz p3, :cond_4

    if-nez p7, :cond_4

    .line 108
    invoke-interface {p0}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndent()I

    move-result p0

    if-nez p0, :cond_3

    return p1

    :cond_3
    return v1

    .line 110
    :cond_4
    invoke-interface {p0}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndent()I

    move-result p2

    invoke-interface {p0}, Lcom/vladsch/flexmark/parser/block/ParserState;->getParsing()Lcom/vladsch/flexmark/ast/util/Parsing;

    move-result-object p0

    iget p0, p0, Lcom/vladsch/flexmark/ast/util/Parsing;->CODE_BLOCK_INDENT:I

    if-ge p2, p0, :cond_5

    return p1

    :cond_5
    return v1
.end method


# virtual methods
.method public canContain(Lcom/vladsch/flexmark/parser/block/ParserState;Lcom/vladsch/flexmark/parser/block/BlockParser;Lcom/vladsch/flexmark/util/ast/Block;)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method

.method public closeBlock(Lcom/vladsch/flexmark/parser/block/ParserState;)V
    .locals 1

    .line 61
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/BlockQuoteParser;->block:Lcom/vladsch/flexmark/ast/BlockQuote;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/ast/BlockQuote;->setCharsFromContent()V

    .line 63
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getProperties()Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object p1

    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->BLANK_LINES_IN_AST:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_0

    .line 64
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/core/BlockQuoteParser;->removeBlankLines()V

    :cond_0
    return-void
.end method

.method public getBlock()Lcom/vladsch/flexmark/ast/BlockQuote;
    .locals 1

    .line 56
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/BlockQuoteParser;->block:Lcom/vladsch/flexmark/ast/BlockQuote;

    return-object v0
.end method

.method public bridge synthetic getBlock()Lcom/vladsch/flexmark/util/ast/Block;
    .locals 1

    .line 17
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/core/BlockQuoteParser;->getBlock()Lcom/vladsch/flexmark/ast/BlockQuote;

    move-result-object v0

    return-object v0
.end method

.method public isContainer()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public isPropagatingLastBlankLine(Lcom/vladsch/flexmark/parser/block/BlockParser;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public tryContinue(Lcom/vladsch/flexmark/parser/block/ParserState;)Lcom/vladsch/flexmark/parser/block/BlockContinue;
    .locals 8

    .line 70
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getNextNonSpaceIndex()I

    move-result v1

    .line 72
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->isBlank()Z

    move-result v0

    if-nez v0, :cond_3

    iget-boolean v4, p0, Lcom/vladsch/flexmark/parser/core/BlockQuoteParser;->allowLeadingSpace:Z

    iget-boolean v5, p0, Lcom/vladsch/flexmark/parser/core/BlockQuoteParser;->interruptsParagraph:Z

    iget-boolean v6, p0, Lcom/vladsch/flexmark/parser/core/BlockQuoteParser;->interruptsItemParagraph:Z

    iget-boolean v7, p0, Lcom/vladsch/flexmark/parser/core/BlockQuoteParser;->withLeadSpacesInterruptsItemParagraph:Z

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, p1

    invoke-static/range {v0 .. v7}, Lcom/vladsch/flexmark/parser/core/BlockQuoteParser;->isMarker(Lcom/vladsch/flexmark/parser/block/ParserState;IZZZZZZ)Z

    move-result p1

    if-nez p1, :cond_0

    iget-boolean v2, p0, Lcom/vladsch/flexmark/parser/core/BlockQuoteParser;->continueToBlankLine:Z

    if-eqz v2, :cond_4

    iget v2, p0, Lcom/vladsch/flexmark/parser/core/BlockQuoteParser;->lastWasBlankLine:I

    if-nez v2, :cond_4

    .line 73
    :cond_0
    invoke-interface {v0}, Lcom/vladsch/flexmark/parser/block/ParserState;->getColumn()I

    move-result v2

    invoke-interface {v0}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndent()I

    move-result v3

    add-int/2addr v2, v3

    const/4 v3, 0x0

    .line 74
    iput v3, p0, Lcom/vladsch/flexmark/parser/core/BlockQuoteParser;->lastWasBlankLine:I

    if-eqz p1, :cond_2

    add-int/lit8 p1, v2, 0x1

    .line 79
    invoke-interface {v0}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    add-int/lit8 v1, v1, 0x1

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/ast/util/Parsing;->isSpaceOrTab(Ljava/lang/CharSequence;I)Z

    move-result v0

    if-eqz v0, :cond_1

    add-int/lit8 v2, v2, 0x2

    goto :goto_0

    :cond_1
    move v2, p1

    .line 83
    :cond_2
    :goto_0
    invoke-static {v2}, Lcom/vladsch/flexmark/parser/block/BlockContinue;->atColumn(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    :cond_3
    move-object v0, p1

    .line 85
    :cond_4
    iget-boolean p1, p0, Lcom/vladsch/flexmark/parser/core/BlockQuoteParser;->ignoreBlankLine:Z

    if-eqz p1, :cond_5

    invoke-interface {v0}, Lcom/vladsch/flexmark/parser/block/ParserState;->isBlank()Z

    move-result p1

    if-eqz p1, :cond_5

    .line 86
    iget p1, p0, Lcom/vladsch/flexmark/parser/core/BlockQuoteParser;->lastWasBlankLine:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/vladsch/flexmark/parser/core/BlockQuoteParser;->lastWasBlankLine:I

    .line 87
    invoke-interface {v0}, Lcom/vladsch/flexmark/parser/block/ParserState;->getColumn()I

    move-result p1

    invoke-interface {v0}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndent()I

    move-result v0

    add-int/2addr p1, v0

    .line 88
    invoke-static {p1}, Lcom/vladsch/flexmark/parser/block/BlockContinue;->atColumn(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 90
    :cond_5
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockContinue;->none()Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1
.end method
