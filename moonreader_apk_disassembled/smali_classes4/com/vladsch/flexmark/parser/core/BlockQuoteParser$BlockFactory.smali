.class Lcom/vladsch/flexmark/parser/core/BlockQuoteParser$BlockFactory;
.super Lcom/vladsch/flexmark/parser/block/AbstractBlockParserFactory;
.source "BlockQuoteParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/parser/core/BlockQuoteParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BlockFactory"
.end annotation


# instance fields
.field private final allowLeadingSpace:Z

.field private final interruptsItemParagraph:Z

.field private final interruptsParagraph:Z

.field private final withLeadSpacesInterruptsItemParagraph:Z


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 1

    .line 153
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/block/AbstractBlockParserFactory;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    .line 154
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->BLOCK_QUOTE_ALLOW_LEADING_SPACE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/core/BlockQuoteParser$BlockFactory;->allowLeadingSpace:Z

    .line 155
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->BLOCK_QUOTE_INTERRUPTS_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/core/BlockQuoteParser$BlockFactory;->interruptsParagraph:Z

    .line 156
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->BLOCK_QUOTE_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/core/BlockQuoteParser$BlockFactory;->interruptsItemParagraph:Z

    .line 157
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->BLOCK_QUOTE_WITH_LEAD_SPACES_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/core/BlockQuoteParser$BlockFactory;->withLeadSpacesInterruptsItemParagraph:Z

    return-void
.end method


# virtual methods
.method public tryStart(Lcom/vladsch/flexmark/parser/block/ParserState;Lcom/vladsch/flexmark/parser/block/MatchedBlockParser;)Lcom/vladsch/flexmark/parser/block/BlockStart;
    .locals 10

    .line 161
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getNextNonSpaceIndex()I

    move-result v1

    .line 162
    invoke-interface {p2}, Lcom/vladsch/flexmark/parser/block/MatchedBlockParser;->getBlockParser()Lcom/vladsch/flexmark/parser/block/BlockParser;

    move-result-object p2

    .line 163
    invoke-interface {p2}, Lcom/vladsch/flexmark/parser/block/BlockParser;->isParagraphParser()Z

    move-result v2

    const/4 v8, 0x0

    const/4 v9, 0x1

    if-eqz v2, :cond_0

    .line 164
    invoke-interface {p2}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Block;->getParent()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v0

    instance-of v0, v0, Lcom/vladsch/flexmark/ast/ListItem;

    if-eqz v0, :cond_0

    invoke-interface {p2}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v0

    invoke-interface {p2}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object p2

    invoke-virtual {p2}, Lcom/vladsch/flexmark/util/ast/Block;->getParent()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object p2

    invoke-virtual {p2}, Lcom/vladsch/flexmark/util/ast/Block;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p2

    if-ne v0, p2, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    .line 166
    :goto_0
    iget-boolean v4, p0, Lcom/vladsch/flexmark/parser/core/BlockQuoteParser$BlockFactory;->allowLeadingSpace:Z

    iget-boolean v5, p0, Lcom/vladsch/flexmark/parser/core/BlockQuoteParser$BlockFactory;->interruptsParagraph:Z

    iget-boolean v6, p0, Lcom/vladsch/flexmark/parser/core/BlockQuoteParser$BlockFactory;->interruptsItemParagraph:Z

    iget-boolean v7, p0, Lcom/vladsch/flexmark/parser/core/BlockQuoteParser$BlockFactory;->withLeadSpacesInterruptsItemParagraph:Z

    move-object v0, p1

    invoke-static/range {v0 .. v7}, Lcom/vladsch/flexmark/parser/core/BlockQuoteParser;->isMarker(Lcom/vladsch/flexmark/parser/block/ParserState;IZZZZZZ)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 167
    invoke-interface {v0}, Lcom/vladsch/flexmark/parser/block/ParserState;->getColumn()I

    move-result p1

    invoke-interface {v0}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndent()I

    move-result p2

    add-int/2addr p1, p2

    add-int/lit8 p2, p1, 0x1

    .line 169
    invoke-interface {v0}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    add-int/lit8 v3, v1, 0x1

    invoke-static {v2, v3}, Lcom/vladsch/flexmark/ast/util/Parsing;->isSpaceOrTab(Ljava/lang/CharSequence;I)Z

    move-result v2

    if-eqz v2, :cond_1

    add-int/lit8 p2, p1, 0x2

    .line 172
    :cond_1
    new-array p1, v9, [Lcom/vladsch/flexmark/parser/block/BlockParser;

    new-instance v2, Lcom/vladsch/flexmark/parser/core/BlockQuoteParser;

    invoke-interface {v0}, Lcom/vladsch/flexmark/parser/block/ParserState;->getProperties()Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v4

    invoke-interface {v0}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-interface {v0, v1, v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-direct {v2, v4, v0}, Lcom/vladsch/flexmark/parser/core/BlockQuoteParser;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    aput-object v2, p1, v8

    invoke-static {p1}, Lcom/vladsch/flexmark/parser/block/BlockStart;->of([Lcom/vladsch/flexmark/parser/block/BlockParser;)Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/parser/block/BlockStart;->atColumn(I)Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    return-object p1

    .line 174
    :cond_2
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockStart;->none()Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    return-object p1
.end method
