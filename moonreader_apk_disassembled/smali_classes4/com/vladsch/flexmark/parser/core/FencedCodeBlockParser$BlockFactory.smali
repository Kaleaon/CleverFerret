.class Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser$BlockFactory;
.super Lcom/vladsch/flexmark/parser/block/AbstractBlockParserFactory;
.source "FencedCodeBlockParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BlockFactory"
.end annotation


# direct methods
.method private constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 0

    .line 174
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/block/AbstractBlockParserFactory;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser$1;)V
    .locals 0

    .line 172
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser$BlockFactory;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    return-void
.end method


# virtual methods
.method public tryStart(Lcom/vladsch/flexmark/parser/block/ParserState;Lcom/vladsch/flexmark/parser/block/MatchedBlockParser;)Lcom/vladsch/flexmark/parser/block/BlockStart;
    .locals 7

    .line 179
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getNextNonSpaceIndex()I

    move-result v5

    .line 180
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    .line 182
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndent()I

    move-result v0

    const/4 v1, 0x4

    if-ge v0, v1, :cond_0

    .line 183
    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v0

    invoke-interface {p2, v5, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    .line 184
    invoke-static {}, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;->access$100()Ljava/util/regex/Pattern;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v6, 0x0

    .line 185
    invoke-virtual {v0, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    .line 186
    invoke-virtual {v0, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 187
    new-instance v0, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;

    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getProperties()Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v1

    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndent()I

    move-result v4

    invoke-direct/range {v0 .. v5}, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;CIII)V

    .line 188
    invoke-static {v0}, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;->access$200(Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;)Lcom/vladsch/flexmark/ast/FencedCodeBlock;

    move-result-object p1

    invoke-interface {p2, v6, v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->setOpeningMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    const/4 p1, 0x1

    .line 189
    new-array p1, p1, [Lcom/vladsch/flexmark/parser/block/BlockParser;

    aput-object v0, p1, v6

    invoke-static {p1}, Lcom/vladsch/flexmark/parser/block/BlockStart;->of([Lcom/vladsch/flexmark/parser/block/BlockParser;)Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    add-int/2addr v5, v3

    invoke-virtual {p1, v5}, Lcom/vladsch/flexmark/parser/block/BlockStart;->atIndex(I)Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    return-object p1

    .line 192
    :cond_0
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockStart;->none()Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    return-object p1
.end method
