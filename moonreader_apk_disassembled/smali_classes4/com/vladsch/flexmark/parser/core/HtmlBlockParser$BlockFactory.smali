.class Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$BlockFactory;
.super Lcom/vladsch/flexmark/parser/block/AbstractBlockParserFactory;
.source "HtmlBlockParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BlockFactory"
.end annotation


# instance fields
.field private final myHtmlBlockCommentOnlyFullLine:Z

.field private final myHtmlBlockDeepParseFirstOpenTagOnOneLine:Z

.field private final myHtmlBlockDeepParseNonBlock:Z

.field private final myHtmlBlockDeepParser:Z

.field private final myHtmlBlockStartOnlyOnBlockTags:Z

.field private final myHtmlCommentBlocksInterruptParagraph:Z

.field private myPatterns:Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$Patterns;


# direct methods
.method private constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 1

    .line 289
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/block/AbstractBlockParserFactory;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    const/4 v0, 0x0

    .line 280
    iput-object v0, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$BlockFactory;->myPatterns:Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$Patterns;

    .line 290
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->HTML_COMMENT_BLOCKS_INTERRUPT_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$BlockFactory;->myHtmlCommentBlocksInterruptParagraph:Z

    .line 291
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSER:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$BlockFactory;->myHtmlBlockDeepParser:Z

    .line 292
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_NON_BLOCK:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$BlockFactory;->myHtmlBlockDeepParseNonBlock:Z

    .line 293
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_FIRST_OPEN_TAG_ON_ONE_LINE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$BlockFactory;->myHtmlBlockDeepParseFirstOpenTagOnOneLine:Z

    .line 294
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_COMMENT_ONLY_FULL_LINE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$BlockFactory;->myHtmlBlockCommentOnlyFullLine:Z

    .line 295
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_START_ONLY_ON_BLOCK_TAGS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$BlockFactory;->myHtmlBlockStartOnlyOnBlockTags:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$1;)V
    .locals 0

    .line 279
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$BlockFactory;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    return-void
.end method


# virtual methods
.method public tryStart(Lcom/vladsch/flexmark/parser/block/ParserState;Lcom/vladsch/flexmark/parser/block/MatchedBlockParser;)Lcom/vladsch/flexmark/parser/block/BlockStart;
    .locals 9

    .line 300
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getNextNonSpaceIndex()I

    move-result v0

    .line 301
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    .line 303
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndent()I

    move-result v2

    const/4 v3, 0x4

    if-ge v2, v3, :cond_a

    invoke-interface {v1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v2

    const/16 v3, 0x3c

    if-ne v2, v3, :cond_a

    invoke-interface {p2}, Lcom/vladsch/flexmark/parser/block/MatchedBlockParser;->getBlockParser()Lcom/vladsch/flexmark/parser/block/BlockParser;

    move-result-object v2

    instance-of v2, v2, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;

    if-nez v2, :cond_a

    .line 304
    iget-boolean v2, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$BlockFactory;->myHtmlBlockDeepParser:Z

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v2, :cond_3

    .line 305
    new-instance v2, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;

    sget-object v6, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_TAGS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getProperties()Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    invoke-direct {v2, v6}, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;-><init>(Ljava/util/List;)V

    .line 306
    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v6

    invoke-interface {v1, v0, v6}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$BlockFactory;->myHtmlBlockStartOnlyOnBlockTags:Z

    iget-boolean v6, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$BlockFactory;->myHtmlBlockDeepParseNonBlock:Z

    iget-boolean v7, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$BlockFactory;->myHtmlBlockDeepParseFirstOpenTagOnOneLine:Z

    invoke-virtual {v2, v0, v1, v6, v7}, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->parseHtmlChunk(Ljava/lang/CharSequence;ZZZ)V

    .line 307
    invoke-virtual {v2}, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->hadHtml()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 309
    invoke-virtual {v2}, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->getHtmlMatch()Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    move-result-object v0

    sget-object v1, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;->OPEN_TAG:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    if-eq v0, v1, :cond_0

    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$BlockFactory;->myHtmlCommentBlocksInterruptParagraph:Z

    if-nez v0, :cond_1

    invoke-virtual {v2}, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->getHtmlMatch()Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    move-result-object v0

    sget-object v1, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;->COMMENT:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    if-ne v0, v1, :cond_1

    :cond_0
    invoke-interface {p2}, Lcom/vladsch/flexmark/parser/block/MatchedBlockParser;->getBlockParser()Lcom/vladsch/flexmark/parser/block/BlockParser;

    move-result-object p2

    invoke-interface {p2}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object p2

    instance-of p2, p2, Lcom/vladsch/flexmark/ast/Paragraph;

    if-eqz p2, :cond_1

    goto/16 :goto_4

    .line 312
    :cond_1
    new-array p2, v5, [Lcom/vladsch/flexmark/parser/block/BlockParser;

    new-instance v0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;

    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getProperties()Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v1

    invoke-virtual {v2}, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->getHtmlMatch()Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    move-result-object v6

    sget-object v7, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;->COMMENT:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser$HtmlMatch;

    if-ne v6, v7, :cond_2

    goto :goto_0

    :cond_2
    const/4 v5, 0x0

    :goto_0
    invoke-direct {v0, v1, v3, v5, v2}, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;Ljava/util/regex/Pattern;ZLcom/vladsch/flexmark/parser/internal/HtmlDeepParser;)V

    aput-object v0, p2, v4

    invoke-static {p2}, Lcom/vladsch/flexmark/parser/block/BlockStart;->of([Lcom/vladsch/flexmark/parser/block/BlockParser;)Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p2

    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndex()I

    move-result p1

    invoke-virtual {p2, p1}, Lcom/vladsch/flexmark/parser/block/BlockStart;->atIndex(I)Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    return-object p1

    :cond_3
    const/4 v2, 0x1

    :goto_1
    const/4 v6, 0x7

    if-gt v2, v6, :cond_a

    if-ne v2, v6, :cond_4

    .line 318
    iget-boolean v6, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$BlockFactory;->myHtmlBlockStartOnlyOnBlockTags:Z

    if-nez v6, :cond_9

    invoke-interface {p2}, Lcom/vladsch/flexmark/parser/block/MatchedBlockParser;->getBlockParser()Lcom/vladsch/flexmark/parser/block/BlockParser;

    move-result-object v6

    invoke-interface {v6}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v6

    instance-of v6, v6, Lcom/vladsch/flexmark/ast/Paragraph;

    if-eqz v6, :cond_4

    goto/16 :goto_3

    .line 322
    :cond_4
    iget-object v6, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$BlockFactory;->myPatterns:Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$Patterns;

    if-nez v6, :cond_5

    .line 323
    new-instance v6, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$Patterns;

    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getParsing()Lcom/vladsch/flexmark/ast/util/Parsing;

    move-result-object v7

    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getProperties()Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$Patterns;-><init>(Lcom/vladsch/flexmark/ast/util/Parsing;Lcom/vladsch/flexmark/util/options/DataHolder;)V

    iput-object v6, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$BlockFactory;->myPatterns:Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$Patterns;

    .line 326
    :cond_5
    iget-object v6, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$BlockFactory;->myPatterns:Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$Patterns;

    iget-object v6, v6, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$Patterns;->BLOCK_PATTERNS:[[Ljava/util/regex/Pattern;

    aget-object v6, v6, v2

    aget-object v6, v6, v4

    .line 327
    iget-object v7, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$BlockFactory;->myPatterns:Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$Patterns;

    iget-object v7, v7, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$Patterns;->BLOCK_PATTERNS:[[Ljava/util/regex/Pattern;

    aget-object v7, v7, v2

    aget-object v7, v7, v5

    .line 328
    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v8

    invoke-interface {v1, v0, v8}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v6

    .line 329
    invoke-virtual {v6}, Ljava/util/regex/Matcher;->find()Z

    move-result v8

    if-eqz v8, :cond_9

    .line 332
    iget-boolean v8, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$BlockFactory;->myHtmlCommentBlocksInterruptParagraph:Z

    if-nez v8, :cond_6

    iget-object v8, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$BlockFactory;->myPatterns:Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$Patterns;

    iget v8, v8, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$Patterns;->COMMENT_PATTERN_INDEX:I

    if-ne v2, v8, :cond_6

    invoke-interface {p2}, Lcom/vladsch/flexmark/parser/block/MatchedBlockParser;->getBlockParser()Lcom/vladsch/flexmark/parser/block/BlockParser;

    move-result-object v8

    instance-of v8, v8, Lcom/vladsch/flexmark/parser/core/ParagraphParser;

    if-nez v8, :cond_9

    .line 334
    :cond_6
    iget-object p2, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$BlockFactory;->myPatterns:Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$Patterns;

    iget p2, p2, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$Patterns;->COMMENT_PATTERN_INDEX:I

    if-ne v2, p2, :cond_7

    iget-boolean p2, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$BlockFactory;->myHtmlBlockCommentOnlyFullLine:Z

    if-eqz p2, :cond_7

    .line 335
    iget-object p2, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$BlockFactory;->myPatterns:Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$Patterns;

    iget-object p2, p2, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$Patterns;->BLOCK_PATTERNS:[[Ljava/util/regex/Pattern;

    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$BlockFactory;->myPatterns:Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$Patterns;

    iget v0, v0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$Patterns;->COMMENT_PATTERN_INDEX:I

    aget-object p2, p2, v0

    aget-object p2, p2, v5

    invoke-virtual {v6}, Ljava/util/regex/Matcher;->end()I

    move-result v0

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v6

    invoke-interface {v1, v0, v6}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p2

    .line 336
    invoke-virtual {p2}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 338
    invoke-virtual {p2}, Ljava/util/regex/Matcher;->end()I

    move-result p2

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v0

    invoke-interface {v1, p2, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trim()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    .line 339
    const-string v0, "-->"

    invoke-virtual {p2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_7

    .line 340
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockStart;->none()Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    return-object p1

    .line 344
    :cond_7
    new-array p2, v5, [Lcom/vladsch/flexmark/parser/block/BlockParser;

    new-instance v0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;

    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getProperties()Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v1

    iget-object v6, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$BlockFactory;->myPatterns:Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$Patterns;

    iget v6, v6, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$Patterns;->COMMENT_PATTERN_INDEX:I

    if-ne v2, v6, :cond_8

    goto :goto_2

    :cond_8
    const/4 v5, 0x0

    :goto_2
    invoke-direct {v0, v1, v7, v5, v3}, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;Ljava/util/regex/Pattern;ZLcom/vladsch/flexmark/parser/internal/HtmlDeepParser;)V

    aput-object v0, p2, v4

    invoke-static {p2}, Lcom/vladsch/flexmark/parser/block/BlockStart;->of([Lcom/vladsch/flexmark/parser/block/BlockParser;)Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p2

    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndex()I

    move-result p1

    invoke-virtual {p2, p1}, Lcom/vladsch/flexmark/parser/block/BlockStart;->atIndex(I)Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    return-object p1

    :cond_9
    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_1

    .line 349
    :cond_a
    :goto_4
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockStart;->none()Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    return-object p1
.end method
