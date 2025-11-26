.class public Lcom/vladsch/flexmark/parser/internal/DocumentParser;
.super Ljava/lang/Object;
.source "DocumentParser.java"

# interfaces
.implements Lcom/vladsch/flexmark/parser/block/ParserState;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorCache;,
        Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockDependencyHandler;,
        Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencies;,
        Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencyStage;,
        Lcom/vladsch/flexmark/parser/internal/DocumentParser$CustomBlockParserDependencyHandler;,
        Lcom/vladsch/flexmark/parser/internal/DocumentParser$CustomBlockParserDependencyStage;,
        Lcom/vladsch/flexmark/parser/internal/DocumentParser$CustomBlockParserDependencies;,
        Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphDependencyHandler;,
        Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencyStage;,
        Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencies;,
        Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockParserMapper;
    }
.end annotation


# static fields
.field private static final CORE_BLOCK_PRE_PROCESSORS:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;",
            "Lcom/vladsch/flexmark/parser/block/BlockPreProcessorFactory;",
            ">;"
        }
    .end annotation
.end field

.field private static final CORE_FACTORIES_DATA_KEYS:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/vladsch/flexmark/parser/block/CustomBlockParserFactory;",
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final CORE_PARAGRAPH_PRE_PROCESSORS:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;",
            "Lcom/vladsch/flexmark/parser/block/ParagraphPreProcessorFactory;",
            ">;"
        }
    .end annotation
.end field

.field public static final INLINE_PARSER_FACTORY:Lcom/vladsch/flexmark/parser/InlineParserFactory;


# instance fields
.field private activeBlockParsers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/block/BlockParser;",
            ">;"
        }
    .end annotation
.end field

.field private blank:Z

.field private blankLine:Lcom/vladsch/flexmark/util/ast/BlankLine;

.field private final blankLinesInAst:Z

.field private final blockParserFactories:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/block/BlockParserFactory;",
            ">;"
        }
    .end annotation
.end field

.field private final blockPreProcessorDependencies:Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencies;

.field private final blockTracker:Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;

.field private column:I

.field private columnIsInTab:Z

.field private currentPhase:Lcom/vladsch/flexmark/parser/block/ParserPhase;

.field private final documentBlockParser:Lcom/vladsch/flexmark/parser/core/DocumentBlockParser;

.field private indent:I

.field private index:I

.field private final inlineParser:Lcom/vladsch/flexmark/parser/InlineParser;

.field private lastLineBlank:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private line:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field private lineEOLIndex:I

.field private lineEndIndex:I

.field private lineNumber:I

.field private final lineSegments:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            ">;"
        }
    .end annotation
.end field

.field private lineStart:I

.field private lineWithEOL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field private final myParsing:Lcom/vladsch/flexmark/ast/util/Parsing;

.field private nextNonSpace:I

.field private nextNonSpaceColumn:I

.field private final options:Lcom/vladsch/flexmark/util/options/DataHolder;

.field private final paragraphPreProcessorDependencies:Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencies;

.field private final trackDocumentLines:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 48
    new-instance v0, Lcom/vladsch/flexmark/parser/internal/DocumentParser$1;

    invoke-direct {v0}, Lcom/vladsch/flexmark/parser/internal/DocumentParser$1;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->INLINE_PARSER_FACTORY:Lcom/vladsch/flexmark/parser/InlineParserFactory;

    .line 62
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->CORE_FACTORIES_DATA_KEYS:Ljava/util/HashMap;

    .line 64
    new-instance v1, Lcom/vladsch/flexmark/parser/core/BlockQuoteParser$Factory;

    invoke-direct {v1}, Lcom/vladsch/flexmark/parser/core/BlockQuoteParser$Factory;-><init>()V

    sget-object v2, Lcom/vladsch/flexmark/parser/Parser;->BLOCK_QUOTE_PARSER:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    new-instance v1, Lcom/vladsch/flexmark/parser/core/HeadingParser$Factory;

    invoke-direct {v1}, Lcom/vladsch/flexmark/parser/core/HeadingParser$Factory;-><init>()V

    sget-object v2, Lcom/vladsch/flexmark/parser/Parser;->HEADING_PARSER:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    new-instance v1, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser$Factory;

    invoke-direct {v1}, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser$Factory;-><init>()V

    sget-object v2, Lcom/vladsch/flexmark/parser/Parser;->FENCED_CODE_BLOCK_PARSER:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    new-instance v1, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$Factory;

    invoke-direct {v1}, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$Factory;-><init>()V

    sget-object v2, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_PARSER:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    new-instance v1, Lcom/vladsch/flexmark/parser/core/ThematicBreakParser$Factory;

    invoke-direct {v1}, Lcom/vladsch/flexmark/parser/core/ThematicBreakParser$Factory;-><init>()V

    sget-object v2, Lcom/vladsch/flexmark/parser/Parser;->THEMATIC_BREAK_PARSER:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    new-instance v1, Lcom/vladsch/flexmark/parser/core/ListBlockParser$Factory;

    invoke-direct {v1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser$Factory;-><init>()V

    sget-object v2, Lcom/vladsch/flexmark/parser/Parser;->LIST_BLOCK_PARSER:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    new-instance v1, Lcom/vladsch/flexmark/parser/core/IndentedCodeBlockParser$Factory;

    invoke-direct {v1}, Lcom/vladsch/flexmark/parser/core/IndentedCodeBlockParser$Factory;-><init>()V

    sget-object v2, Lcom/vladsch/flexmark/parser/Parser;->INDENTED_CODE_BLOCK_PARSER:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->CORE_PARAGRAPH_PRE_PROCESSORS:Ljava/util/HashMap;

    .line 86
    sget-object v1, Lcom/vladsch/flexmark/parser/Parser;->REFERENCE_PARAGRAPH_PRE_PROCESSOR:Lcom/vladsch/flexmark/util/options/DataKey;

    new-instance v2, Lcom/vladsch/flexmark/parser/core/ReferencePreProcessorFactory;

    invoke-direct {v2}, Lcom/vladsch/flexmark/parser/core/ReferencePreProcessorFactory;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->CORE_BLOCK_PRE_PROCESSORS:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;Ljava/util/List;Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencies;Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencies;Lcom/vladsch/flexmark/parser/InlineParser;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/options/DataHolder;",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/block/CustomBlockParserFactory;",
            ">;",
            "Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencies;",
            "Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencies;",
            "Lcom/vladsch/flexmark/parser/InlineParser;",
            ")V"
        }
    .end annotation

    .line 340
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 100
    iput v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->lineNumber:I

    .line 105
    iput v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->lineStart:I

    .line 110
    iput v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->lineEOLIndex:I

    .line 115
    iput v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->lineEndIndex:I

    .line 120
    iput v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->index:I

    .line 125
    iput v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->column:I

    .line 132
    iput v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->nextNonSpace:I

    .line 133
    iput v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->nextNonSpaceColumn:I

    .line 134
    iput v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->indent:I

    const/4 v0, 0x0

    .line 136
    iput-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blankLine:Lcom/vladsch/flexmark/util/ast/BlankLine;

    .line 145
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->lineSegments:Ljava/util/List;

    .line 147
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->activeBlockParsers:Ljava/util/List;

    .line 149
    new-instance v0, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;

    invoke-direct {v0}, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blockTracker:Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;

    .line 200
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->lastLineBlank:Ljava/util/Map;

    .line 202
    sget-object v0, Lcom/vladsch/flexmark/parser/block/ParserPhase;->NONE:Lcom/vladsch/flexmark/parser/block/ParserPhase;

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->currentPhase:Lcom/vladsch/flexmark/parser/block/ParserPhase;

    .line 341
    iput-object p1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->options:Lcom/vladsch/flexmark/util/options/DataHolder;

    .line 342
    new-instance v0, Lcom/vladsch/flexmark/ast/util/Parsing;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/ast/util/Parsing;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->myParsing:Lcom/vladsch/flexmark/ast/util/Parsing;

    .line 344
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 345
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/parser/block/CustomBlockParserFactory;

    .line 346
    invoke-interface {v1, p1}, Lcom/vladsch/flexmark/parser/block/CustomBlockParserFactory;->create(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/parser/block/BlockParserFactory;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 349
    :cond_0
    iput-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blockParserFactories:Ljava/util/List;

    .line 350
    iput-object p3, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->paragraphPreProcessorDependencies:Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencies;

    .line 351
    iput-object p4, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blockPreProcessorDependencies:Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencies;

    .line 352
    iput-object p5, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->inlineParser:Lcom/vladsch/flexmark/parser/InlineParser;

    .line 354
    new-instance p2, Lcom/vladsch/flexmark/parser/core/DocumentBlockParser;

    invoke-direct {p2}, Lcom/vladsch/flexmark/parser/core/DocumentBlockParser;-><init>()V

    iput-object p2, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->documentBlockParser:Lcom/vladsch/flexmark/parser/core/DocumentBlockParser;

    .line 355
    invoke-direct {p0, p2}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->activateBlockParser(Lcom/vladsch/flexmark/parser/block/BlockParser;)V

    .line 356
    sget-object p2, Lcom/vladsch/flexmark/parser/block/ParserPhase;->STARTING:Lcom/vladsch/flexmark/parser/block/ParserPhase;

    iput-object p2, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->currentPhase:Lcom/vladsch/flexmark/parser/block/ParserPhase;

    .line 357
    sget-object p2, Lcom/vladsch/flexmark/parser/Parser;->BLANK_LINES_IN_AST:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, p2}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    iput-boolean p2, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blankLinesInAst:Z

    .line 358
    sget-object p2, Lcom/vladsch/flexmark/parser/Parser;->TRACK_DOCUMENT_LINES:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, p2}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->trackDocumentLines:Z

    return-void
.end method

.method private activateBlockParser(Lcom/vladsch/flexmark/parser/block/BlockParser;)V
    .locals 1

    .line 977
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->activeBlockParsers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 978
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blockTracker:Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->containsKey(Lcom/vladsch/flexmark/parser/block/BlockParser;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 979
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blockParserAdded(Lcom/vladsch/flexmark/parser/block/BlockParser;)V

    :cond_0
    return-void
.end method

.method private addChild(Lcom/vladsch/flexmark/parser/block/BlockParser;)Lcom/vladsch/flexmark/parser/block/BlockParser;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/vladsch/flexmark/parser/block/BlockParser;",
            ">(TT;)TT;"
        }
    .end annotation

    .line 966
    :goto_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->getActiveBlockParser()Lcom/vladsch/flexmark/parser/block/BlockParser;

    move-result-object v0

    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v1

    invoke-interface {v0, p0, p1, v1}, Lcom/vladsch/flexmark/parser/block/BlockParser;->canContain(Lcom/vladsch/flexmark/parser/block/ParserState;Lcom/vladsch/flexmark/parser/block/BlockParser;Lcom/vladsch/flexmark/util/ast/Block;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 967
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->getActiveBlockParser()Lcom/vladsch/flexmark/parser/block/BlockParser;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->finalize(Lcom/vladsch/flexmark/parser/block/BlockParser;)V

    goto :goto_0

    .line 970
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->getActiveBlockParser()Lcom/vladsch/flexmark/parser/block/BlockParser;

    move-result-object v0

    invoke-interface {v0}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v0

    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/util/ast/Block;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 971
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->activateBlockParser(Lcom/vladsch/flexmark/parser/block/BlockParser;)V

    return-object p1
.end method

.method private addLine()V
    .locals 5

    .line 843
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->lineWithEOL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget v1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->index:I

    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    .line 844
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->columnIsInTab:Z

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    .line 846
    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    .line 847
    iget v1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->column:I

    invoke-static {v1}, Lcom/vladsch/flexmark/ast/util/Parsing;->columnsToNextTabStop(I)I

    move-result v1

    .line 848
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v3

    add-int/2addr v3, v1

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_0

    const/16 v4, 0x20

    .line 850
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 853
    :cond_0
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->of(Ljava/lang/String;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;

    move-result-object v0

    .line 858
    :cond_1
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->getActiveBlockParser()Lcom/vladsch/flexmark/parser/block/BlockParser;

    move-result-object v1

    invoke-interface {v1, p0, v0}, Lcom/vladsch/flexmark/parser/block/BlockParser;->addLine(Lcom/vladsch/flexmark/parser/block/ParserState;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    return-void
.end method

.method private advance()V
    .locals 2

    .line 828
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->line:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget v1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->index:I

    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v0

    const/16 v1, 0x9

    if-ne v0, v1, :cond_0

    .line 830
    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->index:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->index:I

    .line 831
    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->column:I

    invoke-static {v0}, Lcom/vladsch/flexmark/ast/util/Parsing;->columnsToNextTabStop(I)I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->column:I

    return-void

    .line 833
    :cond_0
    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->index:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->index:I

    .line 834
    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->column:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->column:I

    return-void
.end method

.method private breakOutOfLists(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/block/BlockParser;",
            ">;)V"
        }
    .end annotation

    .line 945
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    const/4 v1, -0x1

    const/4 v2, -0x1

    :goto_0
    if-ltz v0, :cond_1

    .line 946
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vladsch/flexmark/parser/block/BlockParser;

    .line 947
    invoke-interface {v3}, Lcom/vladsch/flexmark/parser/block/BlockParser;->breakOutOnDoubleBlankLine()Z

    move-result v3

    if-eqz v3, :cond_0

    move v2, v0

    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_1
    if-eq v2, v1, :cond_2

    .line 953
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {p1, v2, v0}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->finalizeBlocks(Ljava/util/List;)Z

    :cond_2
    return-void
.end method

.method public static calculateBlockParserFactories(Lcom/vladsch/flexmark/util/options/DataHolder;Ljava/util/List;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/options/DataHolder;",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/block/CustomBlockParserFactory;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/block/CustomBlockParserFactory;",
            ">;"
        }
    .end annotation

    .line 372
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 374
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 377
    sget-object p1, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->CORE_FACTORIES_DATA_KEYS:Ljava/util/HashMap;

    invoke-virtual {p1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 378
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p0, v2}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 379
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 384
    :cond_1
    new-instance p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser$CustomBlockParserDependencyHandler;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser$CustomBlockParserDependencyHandler;-><init>(Lcom/vladsch/flexmark/parser/internal/DocumentParser$1;)V

    .line 385
    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/parser/internal/DocumentParser$CustomBlockParserDependencyHandler;->resolveDependencies(Ljava/util/List;)Lcom/vladsch/flexmark/util/dependency/ResolvedDependencies;

    move-result-object p0

    check-cast p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser$CustomBlockParserDependencies;

    .line 386
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 387
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/internal/DocumentParser$CustomBlockParserDependencies;->getDependentStages()Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/parser/internal/DocumentParser$CustomBlockParserDependencyStage;

    .line 388
    invoke-static {v0}, Lcom/vladsch/flexmark/parser/internal/DocumentParser$CustomBlockParserDependencyStage;->access$300(Lcom/vladsch/flexmark/parser/internal/DocumentParser$CustomBlockParserDependencyStage;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto :goto_1

    :cond_2
    return-object p1
.end method

.method public static calculateBlockPreProcessors(Lcom/vladsch/flexmark/util/options/DataHolder;Ljava/util/List;Lcom/vladsch/flexmark/parser/InlineParserFactory;)Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencies;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/options/DataHolder;",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/block/BlockPreProcessorFactory;",
            ">;",
            "Lcom/vladsch/flexmark/parser/InlineParserFactory;",
            ")",
            "Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencies;"
        }
    .end annotation

    .line 421
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 423
    invoke-interface {p2, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 427
    sget-object p1, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->CORE_BLOCK_PRE_PROCESSORS:Ljava/util/HashMap;

    invoke-virtual {p1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/options/DataKey;

    .line 428
    invoke-virtual {v0, p0}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 429
    sget-object v1, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->CORE_BLOCK_PRE_PROCESSORS:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/parser/block/BlockPreProcessorFactory;

    .line 430
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 434
    :cond_1
    new-instance p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockDependencyHandler;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockDependencyHandler;-><init>(Lcom/vladsch/flexmark/parser/internal/DocumentParser$1;)V

    .line 435
    invoke-virtual {p0, p2}, Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockDependencyHandler;->resolveDependencies(Ljava/util/List;)Lcom/vladsch/flexmark/util/dependency/ResolvedDependencies;

    move-result-object p0

    check-cast p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencies;

    return-object p0
.end method

.method public static calculateParagraphPreProcessors(Lcom/vladsch/flexmark/util/options/DataHolder;Ljava/util/List;Lcom/vladsch/flexmark/parser/InlineParserFactory;)Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencies;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/options/DataHolder;",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/block/ParagraphPreProcessorFactory;",
            ">;",
            "Lcom/vladsch/flexmark/parser/InlineParserFactory;",
            ")",
            "Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencies;"
        }
    .end annotation

    .line 398
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 400
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 402
    sget-object p1, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->INLINE_PARSER_FACTORY:Lcom/vladsch/flexmark/parser/InlineParserFactory;

    if-ne p2, p1, :cond_1

    .line 404
    sget-object p1, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->CORE_PARAGRAPH_PRE_PROCESSORS:Ljava/util/HashMap;

    invoke-virtual {p1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/vladsch/flexmark/util/options/DataKey;

    .line 405
    invoke-virtual {p2, p0}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 406
    sget-object v1, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->CORE_PARAGRAPH_PRE_PROCESSORS:Ljava/util/HashMap;

    invoke-virtual {v1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/vladsch/flexmark/parser/block/ParagraphPreProcessorFactory;

    .line 407
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 412
    :cond_1
    new-instance p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphDependencyHandler;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphDependencyHandler;-><init>(Lcom/vladsch/flexmark/parser/internal/DocumentParser$1;)V

    .line 413
    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphDependencyHandler;->resolveDependencies(Ljava/util/List;)Lcom/vladsch/flexmark/util/dependency/ResolvedDependencies;

    move-result-object p0

    check-cast p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencies;

    return-object p0
.end method

.method private deactivateBlockParser()V
    .locals 2

    .line 984
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->activeBlockParsers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    return-void
.end method

.method private finalize(Lcom/vladsch/flexmark/parser/block/BlockParser;)V
    .locals 3

    .line 882
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->getActiveBlockParser()Lcom/vladsch/flexmark/parser/block/BlockParser;

    move-result-object v0

    if-ne v0, p1, :cond_0

    .line 883
    invoke-direct {p0}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->deactivateBlockParser()V

    .line 886
    :cond_0
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v0

    .line 889
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Block;->getParent()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 890
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Block;->getLastChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v1

    .line 891
    instance-of v2, v1, Lcom/vladsch/flexmark/util/ast/BlankLine;

    if-eqz v2, :cond_1

    .line 892
    move-object v2, v1

    check-cast v2, Lcom/vladsch/flexmark/util/ast/BlankLine;

    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/ast/BlankLine;->getClaimedBlankLine()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v2

    if-eq v2, v0, :cond_1

    .line 894
    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/ast/Node;->getFirstInChain()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v1

    .line 895
    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/util/ast/Block;->insertChainAfter(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 896
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Block;->setCharsFromContentOnly()V

    .line 903
    :cond_1
    invoke-interface {p1, p0}, Lcom/vladsch/flexmark/parser/block/BlockParser;->closeBlock(Lcom/vladsch/flexmark/parser/block/ParserState;)V

    .line 904
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/BlockParser;->finalizeClosedBlock()V

    .line 908
    :goto_0
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Block;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p1

    .line 909
    instance-of v1, p1, Lcom/vladsch/flexmark/util/ast/BlankLine;

    if-eqz v1, :cond_2

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v1

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Block;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v2

    if-gt v1, v2, :cond_2

    .line 910
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->unlink()V

    goto :goto_0

    :cond_2
    return-void
.end method

.method private finalizeAndProcess()Lcom/vladsch/flexmark/util/ast/Document;
    .locals 2

    .line 1150
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->activeBlockParsers:Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->finalizeBlocks(Ljava/util/List;)Z

    .line 1157
    sget-object v0, Lcom/vladsch/flexmark/parser/block/ParserPhase;->PRE_PROCESS_PARAGRAPHS:Lcom/vladsch/flexmark/parser/block/ParserPhase;

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->currentPhase:Lcom/vladsch/flexmark/parser/block/ParserPhase;

    .line 1158
    invoke-direct {p0}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->preProcessParagraphs()V

    .line 1164
    sget-object v0, Lcom/vladsch/flexmark/parser/block/ParserPhase;->PRE_PROCESS_BLOCKS:Lcom/vladsch/flexmark/parser/block/ParserPhase;

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->currentPhase:Lcom/vladsch/flexmark/parser/block/ParserPhase;

    .line 1165
    invoke-direct {p0}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->preProcessBlocks()V

    .line 1172
    sget-object v0, Lcom/vladsch/flexmark/parser/block/ParserPhase;->PARSE_INLINES:Lcom/vladsch/flexmark/parser/block/ParserPhase;

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->currentPhase:Lcom/vladsch/flexmark/parser/block/ParserPhase;

    .line 1173
    invoke-direct {p0}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->processInlines()V

    .line 1179
    sget-object v0, Lcom/vladsch/flexmark/parser/block/ParserPhase;->DONE:Lcom/vladsch/flexmark/parser/block/ParserPhase;

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->currentPhase:Lcom/vladsch/flexmark/parser/block/ParserPhase;

    .line 1180
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->documentBlockParser:Lcom/vladsch/flexmark/parser/core/DocumentBlockParser;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/core/DocumentBlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Document;

    move-result-object v0

    .line 1181
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->inlineParser:Lcom/vladsch/flexmark/parser/InlineParser;

    invoke-interface {v1, v0}, Lcom/vladsch/flexmark/parser/InlineParser;->finalizeDocument(Lcom/vladsch/flexmark/util/ast/Document;)V

    return-object v0
.end method

.method private finalizeBlocks(Ljava/util/List;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/block/BlockParser;",
            ">;)Z"
        }
    .end annotation

    .line 1032
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    :goto_0
    if-ltz v0, :cond_0

    .line 1033
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vladsch/flexmark/parser/block/BlockParser;

    .line 1034
    invoke-direct {p0, v2}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->finalize(Lcom/vladsch/flexmark/parser/block/BlockParser;)V

    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_0
    return v1
.end method

.method private findBlockStart(Lcom/vladsch/flexmark/parser/block/BlockParser;)Lcom/vladsch/flexmark/parser/internal/BlockStartImpl;
    .locals 4

    .line 862
    new-instance v0, Lcom/vladsch/flexmark/parser/internal/MatchedBlockParserImpl;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/parser/internal/MatchedBlockParserImpl;-><init>(Lcom/vladsch/flexmark/parser/block/BlockParser;)V

    .line 863
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blockParserFactories:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vladsch/flexmark/parser/block/BlockParserFactory;

    .line 864
    invoke-interface {p1, v2}, Lcom/vladsch/flexmark/parser/block/BlockParser;->canInterruptBy(Lcom/vladsch/flexmark/parser/block/BlockParserFactory;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 865
    invoke-interface {v2, p0, v0}, Lcom/vladsch/flexmark/parser/block/BlockParserFactory;->tryStart(Lcom/vladsch/flexmark/parser/block/ParserState;Lcom/vladsch/flexmark/parser/block/MatchedBlockParser;)Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object v2

    .line 866
    instance-of v3, v2, Lcom/vladsch/flexmark/parser/internal/BlockStartImpl;

    if-eqz v3, :cond_0

    .line 867
    check-cast v2, Lcom/vladsch/flexmark/parser/internal/BlockStartImpl;

    return-object v2

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method private findNextNonSpace()V
    .locals 4

    .line 770
    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->index:I

    .line 771
    iget v1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->column:I

    const/4 v2, 0x1

    .line 773
    iput-boolean v2, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blank:Z

    .line 774
    :goto_0
    iget-object v2, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->line:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v2

    if-ge v0, v2, :cond_2

    .line 775
    iget-object v2, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->line:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v2, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v2

    const/16 v3, 0x9

    if-eq v2, v3, :cond_1

    const/16 v3, 0x20

    if-eq v2, v3, :cond_0

    const/4 v2, 0x0

    .line 786
    iput-boolean v2, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blank:Z

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 783
    rem-int/lit8 v2, v1, 0x4

    rsub-int/lit8 v2, v2, 0x4

    add-int/2addr v1, v2

    goto :goto_0

    .line 790
    :cond_2
    :goto_1
    iput v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->nextNonSpace:I

    .line 791
    iput v1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->nextNonSpaceColumn:I

    .line 792
    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->column:I

    sub-int/2addr v1, v0

    iput v1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->indent:I

    return-void
.end method

.method private incorporateLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 11

    .line 592
    iput-object p1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->line:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 p1, 0x0

    .line 593
    iput p1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->index:I

    .line 594
    iput p1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->column:I

    .line 595
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->columnIsInTab:Z

    .line 598
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->trackDocumentLines:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->lineSegments:Ljava/util/List;

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->lineWithEOL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    const/4 v0, 0x0

    .line 605
    iput-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blankLine:Lcom/vladsch/flexmark/util/ast/BlankLine;

    .line 607
    invoke-direct {p0}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->findNextNonSpace()V

    .line 609
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blank:Z

    if-eqz v1, :cond_1

    .line 610
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blankLinesInAst:Z

    if-eqz v1, :cond_1

    .line 612
    new-instance v1, Lcom/vladsch/flexmark/util/ast/BlankLine;

    iget-object v2, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->lineWithEOL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-direct {v1, v2}, Lcom/vladsch/flexmark/util/ast/BlankLine;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    iput-object v1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blankLine:Lcom/vladsch/flexmark/util/ast/BlankLine;

    .line 613
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->documentBlockParser:Lcom/vladsch/flexmark/parser/core/DocumentBlockParser;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/parser/core/DocumentBlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Document;

    move-result-object v1

    iget-object v2, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blankLine:Lcom/vladsch/flexmark/util/ast/BlankLine;

    invoke-virtual {v1, v2}, Lcom/vladsch/flexmark/util/ast/Document;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 617
    :cond_1
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->activeBlockParsers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x1

    invoke-interface {v1, v3, v2}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x1

    :cond_2
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    const/4 v5, -0x1

    if-eqz v4, :cond_9

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vladsch/flexmark/parser/block/BlockParser;

    .line 618
    iget-boolean v6, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blank:Z

    .line 620
    invoke-direct {p0}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->findNextNonSpace()V

    .line 622
    iget-boolean v7, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blank:Z

    if-eqz v7, :cond_4

    .line 623
    iget-boolean v7, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blankLinesInAst:Z

    if-eqz v7, :cond_4

    .line 624
    iget-object v7, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blankLine:Lcom/vladsch/flexmark/util/ast/BlankLine;

    if-nez v7, :cond_3

    .line 626
    new-instance v7, Lcom/vladsch/flexmark/util/ast/BlankLine;

    iget-object v8, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->lineWithEOL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-direct {v7, v8}, Lcom/vladsch/flexmark/util/ast/BlankLine;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    iput-object v7, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blankLine:Lcom/vladsch/flexmark/util/ast/BlankLine;

    .line 627
    iget-object v7, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->documentBlockParser:Lcom/vladsch/flexmark/parser/core/DocumentBlockParser;

    invoke-virtual {v7}, Lcom/vladsch/flexmark/parser/core/DocumentBlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Document;

    move-result-object v7

    iget-object v8, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blankLine:Lcom/vladsch/flexmark/util/ast/BlankLine;

    invoke-virtual {v7, v8}, Lcom/vladsch/flexmark/util/ast/Document;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    :cond_3
    if-nez v6, :cond_4

    .line 630
    invoke-interface {v4}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v6

    instance-of v6, v6, Lcom/vladsch/flexmark/util/ast/BlankLineContainer;

    if-eqz v6, :cond_4

    .line 631
    iget-object v6, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blankLine:Lcom/vladsch/flexmark/util/ast/BlankLine;

    invoke-interface {v4}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/vladsch/flexmark/util/ast/BlankLine;->setClaimedBlankLine(Lcom/vladsch/flexmark/util/ast/Block;)Lcom/vladsch/flexmark/util/ast/BlankLine;

    .line 636
    :cond_4
    invoke-interface {v4, p0}, Lcom/vladsch/flexmark/parser/block/BlockParser;->tryContinue(Lcom/vladsch/flexmark/parser/block/ParserState;)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object v6

    .line 637
    instance-of v7, v6, Lcom/vladsch/flexmark/parser/internal/BlockContinueImpl;

    if-eqz v7, :cond_9

    .line 638
    check-cast v6, Lcom/vladsch/flexmark/parser/internal/BlockContinueImpl;

    .line 639
    invoke-virtual {v6}, Lcom/vladsch/flexmark/parser/internal/BlockContinueImpl;->isFinalize()Z

    move-result v7

    if-eqz v7, :cond_5

    .line 640
    invoke-direct {p0, v4}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->finalize(Lcom/vladsch/flexmark/parser/block/BlockParser;)V

    return-void

    .line 643
    :cond_5
    invoke-virtual {v6}, Lcom/vladsch/flexmark/parser/internal/BlockContinueImpl;->getNewIndex()I

    move-result v7

    if-eq v7, v5, :cond_6

    .line 644
    invoke-virtual {v6}, Lcom/vladsch/flexmark/parser/internal/BlockContinueImpl;->getNewIndex()I

    move-result v5

    invoke-direct {p0, v5}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->setNewIndex(I)V

    .line 645
    iget-boolean v5, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blank:Z

    if-nez v5, :cond_7

    invoke-interface {v4}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v5

    instance-of v5, v5, Lcom/vladsch/flexmark/util/ast/BlankLineContainer;

    if-eqz v5, :cond_7

    .line 646
    invoke-direct {p0}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->findNextNonSpace()V

    .line 647
    iget-boolean v5, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blank:Z

    if-eqz v5, :cond_7

    .line 648
    new-instance v5, Lcom/vladsch/flexmark/util/ast/BlankLine;

    iget-object v6, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->lineWithEOL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v4}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lcom/vladsch/flexmark/util/ast/BlankLine;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/ast/Block;)V

    iput-object v5, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blankLine:Lcom/vladsch/flexmark/util/ast/BlankLine;

    .line 649
    invoke-interface {v4}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v5

    iget-object v6, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blankLine:Lcom/vladsch/flexmark/util/ast/BlankLine;

    invoke-virtual {v5, v6}, Lcom/vladsch/flexmark/util/ast/Block;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    goto :goto_1

    .line 652
    :cond_6
    invoke-virtual {v6}, Lcom/vladsch/flexmark/parser/internal/BlockContinueImpl;->getNewColumn()I

    move-result v7

    if-eq v7, v5, :cond_7

    .line 653
    invoke-virtual {v6}, Lcom/vladsch/flexmark/parser/internal/BlockContinueImpl;->getNewColumn()I

    move-result v5

    invoke-direct {p0, v5}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->setNewColumn(I)V

    .line 654
    iget-boolean v5, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blank:Z

    if-nez v5, :cond_7

    invoke-interface {v4}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v5

    instance-of v5, v5, Lcom/vladsch/flexmark/util/ast/BlankLineContainer;

    if-eqz v5, :cond_7

    .line 655
    invoke-direct {p0}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->findNextNonSpace()V

    .line 656
    iget-boolean v5, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blank:Z

    if-eqz v5, :cond_7

    .line 657
    new-instance v5, Lcom/vladsch/flexmark/util/ast/BlankLine;

    iget-object v6, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->lineWithEOL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v4}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lcom/vladsch/flexmark/util/ast/BlankLine;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/ast/Block;)V

    iput-object v5, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blankLine:Lcom/vladsch/flexmark/util/ast/BlankLine;

    .line 658
    invoke-interface {v4}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v5

    iget-object v6, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blankLine:Lcom/vladsch/flexmark/util/ast/BlankLine;

    invoke-virtual {v5, v6}, Lcom/vladsch/flexmark/util/ast/Block;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    :cond_7
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 664
    iget-object v5, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blankLine:Lcom/vladsch/flexmark/util/ast/BlankLine;

    if-eqz v5, :cond_2

    iget-boolean v6, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blankLinesInAst:Z

    if-nez v6, :cond_8

    invoke-virtual {v5}, Lcom/vladsch/flexmark/util/ast/BlankLine;->getClaimedBlankLine()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v5

    if-ne v5, v4, :cond_2

    .line 665
    :cond_8
    invoke-interface {v4}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v5

    instance-of v5, v5, Lcom/vladsch/flexmark/util/ast/BlankLineContainer;

    if-eqz v5, :cond_2

    .line 666
    invoke-interface {v4}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v4

    iget-object v5, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blankLine:Lcom/vladsch/flexmark/util/ast/BlankLine;

    invoke-virtual {v4, v5}, Lcom/vladsch/flexmark/util/ast/Block;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    goto/16 :goto_0

    .line 675
    :cond_9
    new-instance v1, Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->activeBlockParsers:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v6

    invoke-interface {v4, v2, v6}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 676
    iget-object v4, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->activeBlockParsers:Ljava/util/List;

    add-int/lit8 v6, v2, -0x1

    invoke-interface {v4, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vladsch/flexmark/parser/block/BlockParser;

    .line 678
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v6

    .line 681
    iget-boolean v7, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blank:Z

    if-eqz v7, :cond_a

    invoke-interface {v4}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->isLastLineBlank(Lcom/vladsch/flexmark/util/ast/Node;)Z

    move-result v7

    if-eqz v7, :cond_a

    .line 682
    new-instance v7, Ljava/util/ArrayList;

    iget-object v8, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->activeBlockParsers:Ljava/util/List;

    invoke-interface {v8, p1, v2}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v2

    invoke-direct {v7, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 683
    invoke-direct {p0, v7}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->breakOutOfLists(Ljava/util/List;)V

    .line 688
    :cond_a
    invoke-interface {v4}, Lcom/vladsch/flexmark/parser/block/BlockParser;->isInterruptible()Z

    move-result v2

    if-nez v2, :cond_c

    invoke-interface {v4}, Lcom/vladsch/flexmark/parser/block/BlockParser;->isContainer()Z

    move-result v2

    if-eqz v2, :cond_b

    goto :goto_2

    :cond_b
    const/4 v2, 0x0

    goto :goto_3

    :cond_c
    :goto_2
    const/4 v2, 0x1

    :goto_3
    move-object v7, v4

    :cond_d
    if-eqz v2, :cond_17

    .line 692
    iget-boolean v8, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blank:Z

    .line 693
    invoke-direct {p0}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->findNextNonSpace()V

    .line 695
    iget-boolean v9, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blank:Z

    if-eqz v9, :cond_e

    if-nez v8, :cond_e

    move-object v0, v7

    :cond_e
    if-nez v9, :cond_16

    .line 698
    iget v8, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->indent:I

    iget-object v9, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->myParsing:Lcom/vladsch/flexmark/ast/util/Parsing;

    iget v9, v9, Lcom/vladsch/flexmark/ast/util/Parsing;->CODE_BLOCK_INDENT:I

    if-ge v8, v9, :cond_f

    iget-object v8, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->line:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget v9, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->nextNonSpace:I

    invoke-static {v8, v9}, Lcom/vladsch/flexmark/ast/util/Parsing;->isLetter(Ljava/lang/CharSequence;I)Z

    move-result v8

    if-eqz v8, :cond_f

    goto :goto_6

    .line 703
    :cond_f
    invoke-direct {p0, v7}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->findBlockStart(Lcom/vladsch/flexmark/parser/block/BlockParser;)Lcom/vladsch/flexmark/parser/internal/BlockStartImpl;

    move-result-object v8

    if-nez v8, :cond_11

    .line 705
    invoke-interface {v7}, Lcom/vladsch/flexmark/parser/block/BlockParser;->isRawText()Z

    move-result p1

    if-eqz p1, :cond_10

    invoke-interface {v7}, Lcom/vladsch/flexmark/parser/block/BlockParser;->isInterruptible()Z

    move-result p1

    if-nez p1, :cond_17

    :cond_10
    iget p1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->nextNonSpace:I

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->setNewIndex(I)V

    goto :goto_7

    :cond_11
    if-nez v6, :cond_12

    .line 710
    invoke-direct {p0, v1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->finalizeBlocks(Ljava/util/List;)Z

    const/4 v6, 0x1

    .line 714
    :cond_12
    invoke-virtual {v8}, Lcom/vladsch/flexmark/parser/internal/BlockStartImpl;->getNewIndex()I

    move-result v9

    if-eq v9, v5, :cond_13

    .line 715
    invoke-virtual {v8}, Lcom/vladsch/flexmark/parser/internal/BlockStartImpl;->getNewIndex()I

    move-result v9

    invoke-direct {p0, v9}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->setNewIndex(I)V

    goto :goto_4

    .line 716
    :cond_13
    invoke-virtual {v8}, Lcom/vladsch/flexmark/parser/internal/BlockStartImpl;->getNewColumn()I

    move-result v9

    if-eq v9, v5, :cond_14

    .line 717
    invoke-virtual {v8}, Lcom/vladsch/flexmark/parser/internal/BlockStartImpl;->getNewColumn()I

    move-result v9

    invoke-direct {p0, v9}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->setNewColumn(I)V

    .line 720
    :cond_14
    :goto_4
    invoke-virtual {v8}, Lcom/vladsch/flexmark/parser/internal/BlockStartImpl;->isReplaceActiveBlockParser()Z

    move-result v9

    if-eqz v9, :cond_15

    .line 721
    invoke-direct {p0}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->removeActiveBlockParser()V

    .line 724
    :cond_15
    invoke-virtual {v8}, Lcom/vladsch/flexmark/parser/internal/BlockStartImpl;->getBlockParsers()[Lcom/vladsch/flexmark/parser/block/BlockParser;

    move-result-object v8

    array-length v9, v8

    const/4 v10, 0x0

    :goto_5
    if-ge v10, v9, :cond_d

    aget-object v2, v8, v10

    .line 725
    invoke-direct {p0, v2}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->addChild(Lcom/vladsch/flexmark/parser/block/BlockParser;)Lcom/vladsch/flexmark/parser/block/BlockParser;

    move-result-object v7

    .line 726
    invoke-interface {v2}, Lcom/vladsch/flexmark/parser/block/BlockParser;->isContainer()Z

    move-result v2

    add-int/lit8 v10, v10, 0x1

    goto :goto_5

    .line 699
    :cond_16
    :goto_6
    iget p1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->nextNonSpace:I

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->setNewIndex(I)V

    :cond_17
    :goto_7
    if-nez v6, :cond_18

    .line 734
    iget-boolean p1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blank:Z

    if-nez p1, :cond_18

    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->getActiveBlockParser()Lcom/vladsch/flexmark/parser/block/BlockParser;

    move-result-object p1

    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/BlockParser;->isParagraphParser()Z

    move-result p1

    if-eqz p1, :cond_18

    .line 736
    invoke-direct {p0}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->addLine()V

    return-void

    :cond_18
    if-nez v6, :cond_19

    .line 740
    invoke-direct {p0, v1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->finalizeBlocks(Ljava/util/List;)Z

    .line 743
    :cond_19
    invoke-direct {p0, v7, v4}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->propagateLastLineBlank(Lcom/vladsch/flexmark/parser/block/BlockParser;Lcom/vladsch/flexmark/parser/block/BlockParser;)V

    .line 745
    iget-boolean p1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blank:Z

    if-eqz p1, :cond_1b

    .line 746
    invoke-interface {v7}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object p1

    instance-of p1, p1, Lcom/vladsch/flexmark/util/ast/KeepTrailingBlankLineContainer;

    if-eqz p1, :cond_1b

    .line 747
    iget-object p1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blankLine:Lcom/vladsch/flexmark/util/ast/BlankLine;

    if-eqz p1, :cond_1a

    .line 748
    invoke-interface {v7}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object p1

    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blankLine:Lcom/vladsch/flexmark/util/ast/BlankLine;

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/util/ast/Block;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    goto :goto_8

    .line 750
    :cond_1a
    invoke-interface {v7}, Lcom/vladsch/flexmark/parser/block/BlockParser;->isContainer()Z

    move-result p1

    if-eqz p1, :cond_1b

    if-ne v0, v7, :cond_1b

    .line 752
    new-instance p1, Lcom/vladsch/flexmark/util/ast/BlankLine;

    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->lineWithEOL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v7}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v1

    invoke-direct {p1, v0, v1}, Lcom/vladsch/flexmark/util/ast/BlankLine;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/ast/Block;)V

    iput-object p1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blankLine:Lcom/vladsch/flexmark/util/ast/BlankLine;

    .line 753
    invoke-interface {v7}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object p1

    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blankLine:Lcom/vladsch/flexmark/util/ast/BlankLine;

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/util/ast/Block;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 759
    :cond_1b
    :goto_8
    invoke-interface {v7}, Lcom/vladsch/flexmark/parser/block/BlockParser;->isContainer()Z

    move-result p1

    if-nez p1, :cond_1c

    .line 760
    invoke-direct {p0}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->addLine()V

    return-void

    .line 761
    :cond_1c
    iget-boolean p1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blank:Z

    if-nez p1, :cond_1d

    .line 763
    new-instance p1, Lcom/vladsch/flexmark/parser/core/ParagraphParser;

    invoke-direct {p1}, Lcom/vladsch/flexmark/parser/core/ParagraphParser;-><init>()V

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->addChild(Lcom/vladsch/flexmark/parser/block/BlockParser;)Lcom/vladsch/flexmark/parser/block/BlockParser;

    .line 764
    invoke-direct {p0}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->addLine()V

    :cond_1d
    return-void
.end method

.method private preProcessBlocks()V
    .locals 6

    .line 1132
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blockTracker:Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->getNodeClassifier()Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    move-result-object v0

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blockPreProcessorDependencies:Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencies;

    invoke-static {v1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencies;->access$700(Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencies;)Ljava/util/Set;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->categoriesBitSet(Ljava/util/Collection;)Ljava/util/BitSet;

    move-result-object v0

    .line 1133
    invoke-virtual {v0}, Ljava/util/BitSet;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 1134
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blockPreProcessorDependencies:Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencies;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencies;->getDependentStages()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencyStage;

    .line 1135
    invoke-static {v1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencyStage;->access$100(Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencyStage;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vladsch/flexmark/parser/block/BlockPreProcessorFactory;

    .line 1136
    iget-object v3, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blockTracker:Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;

    invoke-virtual {v3}, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->getNodeClassifier()Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    move-result-object v3

    const-class v4, Lcom/vladsch/flexmark/util/ast/Block;

    invoke-interface {v2}, Lcom/vladsch/flexmark/parser/block/BlockPreProcessorFactory;->getBlockTypes()Ljava/util/Set;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->getCategoryItems(Ljava/lang/Class;Ljava/util/Collection;)Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;

    move-result-object v3

    .line 1137
    invoke-interface {v2, p0}, Lcom/vladsch/flexmark/parser/block/BlockPreProcessorFactory;->create(Lcom/vladsch/flexmark/parser/block/ParserState;)Lcom/vladsch/flexmark/parser/block/BlockPreProcessor;

    move-result-object v2

    .line 1139
    invoke-interface {v3}, Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vladsch/flexmark/util/ast/Block;

    .line 1140
    invoke-interface {v2, p0, v4}, Lcom/vladsch/flexmark/parser/block/BlockPreProcessor;->preProcess(Lcom/vladsch/flexmark/parser/block/ParserState;Lcom/vladsch/flexmark/util/ast/Block;)V

    goto :goto_0

    :cond_2
    return-void
.end method

.method private preProcessParagraph(Lcom/vladsch/flexmark/ast/Paragraph;Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencyStage;Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorCache;)V
    .locals 8

    .line 1060
    :cond_0
    invoke-static {p2}, Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencyStage;->access$600(Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencyStage;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_8

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vladsch/flexmark/parser/block/ParagraphPreProcessorFactory;

    .line 1061
    invoke-virtual {p3, v3}, Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorCache;->getItem(Lcom/vladsch/flexmark/util/ComputableFactory;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vladsch/flexmark/parser/block/ParagraphPreProcessor;

    .line 1063
    invoke-interface {v3, p1, p0}, Lcom/vladsch/flexmark/parser/block/ParagraphPreProcessor;->preProcessBlock(Lcom/vladsch/flexmark/ast/Paragraph;Lcom/vladsch/flexmark/parser/block/ParserState;)I

    move-result v3

    if-lez v3, :cond_1

    .line 1069
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Paragraph;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    .line 1070
    const-string v4, " \t\r\n"

    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v5

    invoke-interface {v2, v4, v3, v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->countLeading(Ljava/lang/CharSequence;II)I

    move-result v4

    add-int/2addr v3, v4

    invoke-interface {v2, v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    .line 1072
    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isBlank()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1074
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Paragraph;->unlink()V

    .line 1075
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blockRemoved(Lcom/vladsch/flexmark/util/ast/Block;)V

    return-void

    .line 1079
    :cond_2
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Paragraph;->getLineCount()I

    move-result v3

    const/4 v4, 0x0

    :goto_1
    if-ge v4, v3, :cond_4

    .line 1082
    invoke-virtual {p1, v4}, Lcom/vladsch/flexmark/ast/Paragraph;->getLineChars(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v5

    invoke-interface {v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v5

    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v6

    if-le v5, v6, :cond_3

    goto :goto_2

    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_4
    :goto_2
    if-lt v4, v3, :cond_5

    .line 1087
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Paragraph;->unlink()V

    .line 1088
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blockRemoved(Lcom/vladsch/flexmark/util/ast/Block;)V

    return-void

    .line 1090
    :cond_5
    invoke-virtual {p1, v4}, Lcom/vladsch/flexmark/ast/Paragraph;->getLineChars(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v5

    invoke-interface {v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v5

    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v6

    if-ne v5, v6, :cond_6

    .line 1092
    invoke-virtual {p1, p1, v4, v3}, Lcom/vladsch/flexmark/ast/Paragraph;->setContent(Lcom/vladsch/flexmark/ast/Paragraph;II)V

    goto :goto_3

    .line 1095
    :cond_6
    new-instance v5, Ljava/util/ArrayList;

    sub-int v6, v3, v4

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 1096
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Paragraph;->getContentLines()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7, v4, v3}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 1097
    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v3

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v7}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v7

    sub-int/2addr v3, v7

    if-lez v3, :cond_7

    .line 1098
    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v7}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v7

    if-ge v3, v7, :cond_7

    .line 1099
    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v7, v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    invoke-virtual {v5, v1, v3}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 1103
    :cond_7
    new-array v3, v6, [I

    .line 1104
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Paragraph;->getLineIndents()[I

    move-result-object v7

    invoke-static {v7, v4, v3, v1, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1105
    invoke-virtual {p1, v5}, Lcom/vladsch/flexmark/ast/Paragraph;->setContentLines(Ljava/util/List;)V

    .line 1106
    invoke-virtual {p1, v3}, Lcom/vladsch/flexmark/ast/Paragraph;->setLineIndents([I)V

    .line 1107
    invoke-virtual {p1, v2}, Lcom/vladsch/flexmark/ast/Paragraph;->setChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    :goto_3
    const/4 v2, 0x1

    goto/16 :goto_0

    :cond_8
    if-eqz v2, :cond_9

    .line 1113
    invoke-static {p2}, Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencyStage;->access$600(Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencyStage;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_0

    :cond_9
    return-void
.end method

.method private preProcessParagraphs()V
    .locals 8

    .line 1119
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blockTracker:Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->getNodeClassifier()Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    move-result-object v0

    const-class v1, Lcom/vladsch/flexmark/ast/Paragraph;

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->containsCategory(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1120
    new-instance v0, Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorCache;

    invoke-direct {v0, p0}, Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorCache;-><init>(Lcom/vladsch/flexmark/parser/block/ParserState;)V

    .line 1121
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->paragraphPreProcessorDependencies:Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencies;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencies;->getDependentStages()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencyStage;

    .line 1123
    iget-object v3, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blockTracker:Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;

    invoke-virtual {v3}, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->getNodeClassifier()Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    move-result-object v3

    const-class v4, Lcom/vladsch/flexmark/ast/Paragraph;

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const-class v6, Lcom/vladsch/flexmark/ast/Paragraph;

    const/4 v7, 0x0

    aput-object v6, v5, v7

    invoke-virtual {v3, v4, v5}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->getCategoryItems(Ljava/lang/Class;[Ljava/lang/Object;)Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;

    move-result-object v3

    invoke-interface {v3}, Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vladsch/flexmark/ast/Paragraph;

    .line 1124
    invoke-direct {p0, v4, v2, v0}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->preProcessParagraph(Lcom/vladsch/flexmark/ast/Paragraph;Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencyStage;Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorCache;)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method private processInlines()V
    .locals 3

    .line 921
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blockTracker:Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->allBlockParsers()Lcom/vladsch/flexmark/util/collection/OrderedSet;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/parser/block/BlockParser;

    .line 922
    iget-object v2, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->inlineParser:Lcom/vladsch/flexmark/parser/InlineParser;

    invoke-interface {v1, v2}, Lcom/vladsch/flexmark/parser/block/BlockParser;->parseInlines(Lcom/vladsch/flexmark/parser/InlineParser;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private propagateLastLineBlank(Lcom/vladsch/flexmark/parser/block/BlockParser;Lcom/vladsch/flexmark/parser/block/BlockParser;)V
    .locals 2

    .line 996
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blank:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 997
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Block;->getLastChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 998
    invoke-direct {p0, v0, v1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->setLastLineBlank(Lcom/vladsch/flexmark/util/ast/Node;Z)V

    .line 1006
    :cond_0
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blank:Z

    if-eqz v0, :cond_1

    invoke-interface {p1, p2}, Lcom/vladsch/flexmark/parser/block/BlockParser;->isPropagatingLastBlankLine(Lcom/vladsch/flexmark/parser/block/BlockParser;)Z

    move-result p2

    if-eqz p2, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    .line 1009
    :goto_0
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object p1

    :goto_1
    if-eqz p1, :cond_2

    .line 1011
    invoke-direct {p0, p1, v1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->setLastLineBlank(Lcom/vladsch/flexmark/util/ast/Node;Z)V

    .line 1012
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p1

    goto :goto_1

    :cond_2
    return-void
.end method

.method private removeActiveBlockParser()V
    .locals 1

    .line 988
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->getActiveBlockParser()Lcom/vladsch/flexmark/parser/block/BlockParser;

    move-result-object v0

    .line 989
    invoke-direct {p0}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->deactivateBlockParser()V

    .line 991
    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blockParserRemoved(Lcom/vladsch/flexmark/parser/block/BlockParser;)V

    .line 992
    invoke-interface {v0}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Block;->unlink()V

    return-void
.end method

.method private setLastLineBlank(Lcom/vladsch/flexmark/util/ast/Node;Z)V
    .locals 1

    .line 1017
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->lastLineBlank:Ljava/util/Map;

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private setNewColumn(I)V
    .locals 2

    .line 809
    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->nextNonSpaceColumn:I

    if-lt p1, v0, :cond_0

    .line 811
    iget v1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->nextNonSpace:I

    iput v1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->index:I

    .line 812
    iput v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->column:I

    .line 814
    :cond_0
    :goto_0
    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->column:I

    if-ge v0, p1, :cond_1

    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->index:I

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->line:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v1

    if-eq v0, v1, :cond_1

    .line 815
    invoke-direct {p0}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->advance()V

    goto :goto_0

    .line 817
    :cond_1
    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->column:I

    if-le v0, p1, :cond_2

    .line 819
    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->index:I

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->index:I

    .line 820
    iput p1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->column:I

    .line 821
    iput-boolean v1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->columnIsInTab:Z

    return-void

    :cond_2
    const/4 p1, 0x0

    .line 823
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->columnIsInTab:Z

    return-void
.end method

.method private setNewIndex(I)V
    .locals 2

    .line 796
    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->nextNonSpace:I

    if-lt p1, v0, :cond_0

    .line 798
    iput v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->index:I

    .line 799
    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->nextNonSpaceColumn:I

    iput v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->column:I

    .line 801
    :cond_0
    :goto_0
    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->index:I

    if-ge v0, p1, :cond_1

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->line:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v1

    if-eq v0, v1, :cond_1

    .line 802
    invoke-direct {p0}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->advance()V

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    .line 805
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->columnIsInTab:Z

    return-void
.end method


# virtual methods
.method public blockAdded(Lcom/vladsch/flexmark/util/ast/Block;)V
    .locals 1

    .line 165
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blockTracker:Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->blockAdded(Lcom/vladsch/flexmark/util/ast/Block;)V

    return-void
.end method

.method public blockAddedWithChildren(Lcom/vladsch/flexmark/util/ast/Block;)V
    .locals 1

    .line 169
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blockTracker:Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->blockAddedWithChildren(Lcom/vladsch/flexmark/util/ast/Block;)V

    return-void
.end method

.method public blockAddedWithDescendants(Lcom/vladsch/flexmark/util/ast/Block;)V
    .locals 1

    .line 173
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blockTracker:Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->blockAddedWithDescendants(Lcom/vladsch/flexmark/util/ast/Block;)V

    return-void
.end method

.method public blockParserAdded(Lcom/vladsch/flexmark/parser/block/BlockParser;)V
    .locals 1

    .line 157
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blockTracker:Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->blockParserAdded(Lcom/vladsch/flexmark/parser/block/BlockParser;)V

    return-void
.end method

.method public blockParserRemoved(Lcom/vladsch/flexmark/parser/block/BlockParser;)V
    .locals 1

    .line 161
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blockTracker:Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->blockParserRemoved(Lcom/vladsch/flexmark/parser/block/BlockParser;)V

    return-void
.end method

.method public blockRemoved(Lcom/vladsch/flexmark/util/ast/Block;)V
    .locals 1

    .line 177
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blockTracker:Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->blockRemoved(Lcom/vladsch/flexmark/util/ast/Block;)V

    return-void
.end method

.method public blockRemovedWithChildren(Lcom/vladsch/flexmark/util/ast/Block;)V
    .locals 1

    .line 181
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blockTracker:Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->blockRemovedWithChildren(Lcom/vladsch/flexmark/util/ast/Block;)V

    return-void
.end method

.method public blockRemovedWithDescendants(Lcom/vladsch/flexmark/util/ast/Block;)V
    .locals 1

    .line 185
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blockTracker:Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->blockRemovedWithDescendants(Lcom/vladsch/flexmark/util/ast/Block;)V

    return-void
.end method

.method public endsWithBlankLine(Lcom/vladsch/flexmark/util/ast/Node;)Z
    .locals 1

    :goto_0
    if-eqz p1, :cond_1

    .line 929
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->isLastLineBlank(Lcom/vladsch/flexmark/util/ast/Node;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x1

    return p1

    .line 932
    :cond_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getLastBlankLineChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public getActiveBlockParser()Lcom/vladsch/flexmark/parser/block/BlockParser;
    .locals 2

    .line 571
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->activeBlockParsers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/parser/block/BlockParser;

    return-object v0
.end method

.method public getActiveBlockParser(Lcom/vladsch/flexmark/util/ast/Block;)Lcom/vladsch/flexmark/parser/block/BlockParser;
    .locals 1

    .line 576
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blockTracker:Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->getKey(Lcom/vladsch/flexmark/util/ast/Block;)Lcom/vladsch/flexmark/parser/block/BlockParser;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 577
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/BlockParser;->isClosed()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    return-object p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getActiveBlockParsers()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/block/BlockParser;",
            ">;"
        }
    .end annotation

    .line 582
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->activeBlockParsers:Ljava/util/List;

    return-object v0
.end method

.method public getColumn()I
    .locals 1

    .line 556
    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->column:I

    return v0
.end method

.method public getIndent()I
    .locals 1

    .line 561
    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->indent:I

    return v0
.end method

.method public getIndex()I
    .locals 1

    .line 546
    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->index:I

    return v0
.end method

.method public getInlineParser()Lcom/vladsch/flexmark/parser/InlineParser;
    .locals 1

    .line 440
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->inlineParser:Lcom/vladsch/flexmark/parser/InlineParser;

    return-object v0
.end method

.method public getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 531
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->line:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getLineEndIndex()I
    .locals 1

    .line 526
    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->lineEndIndex:I

    return v0
.end method

.method public getLineEolLength()I
    .locals 2

    .line 541
    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->lineEndIndex:I

    iget v1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->lineEOLIndex:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public getLineNumber()I
    .locals 1

    .line 517
    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->lineNumber:I

    return v0
.end method

.method public getLineSegments()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            ">;"
        }
    .end annotation

    .line 153
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->lineSegments:Ljava/util/List;

    return-object v0
.end method

.method public getLineStart()I
    .locals 1

    .line 522
    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->lineStart:I

    return v0
.end method

.method public getLineWithEOL()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 536
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->lineWithEOL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getNextNonSpaceIndex()I
    .locals 1

    .line 551
    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->nextNonSpace:I

    return v0
.end method

.method public getParserPhase()Lcom/vladsch/flexmark/parser/block/ParserPhase;
    .locals 1

    .line 206
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->currentPhase:Lcom/vladsch/flexmark/parser/block/ParserPhase;

    return-object v0
.end method

.method public getParsing()Lcom/vladsch/flexmark/ast/util/Parsing;
    .locals 1

    .line 363
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->myParsing:Lcom/vladsch/flexmark/ast/util/Parsing;

    return-object v0
.end method

.method public getProperties()Lcom/vladsch/flexmark/util/options/MutableDataHolder;
    .locals 1

    .line 368
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->documentBlockParser:Lcom/vladsch/flexmark/parser/core/DocumentBlockParser;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/core/DocumentBlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Document;

    move-result-object v0

    return-object v0
.end method

.method public isBlank()Z
    .locals 1

    .line 566
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->blank:Z

    return v0
.end method

.method public isLastLineBlank(Lcom/vladsch/flexmark/util/ast/Node;)Z
    .locals 1

    .line 1022
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->lastLineBlank:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    if-eqz p1, :cond_0

    .line 1023
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public parse(Ljava/io/Reader;)Lcom/vladsch/flexmark/util/ast/Document;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 494
    instance-of v0, p1, Ljava/io/BufferedReader;

    if-eqz v0, :cond_0

    .line 495
    check-cast p1, Ljava/io/BufferedReader;

    goto :goto_0

    .line 497
    :cond_0
    new-instance v0, Ljava/io/BufferedReader;

    invoke-direct {v0, p1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    move-object p1, v0

    .line 500
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v1, 0x4000

    .line 501
    new-array v2, v1, [C

    .line 504
    :cond_1
    invoke-virtual {p1, v2}, Ljava/io/BufferedReader;->read([C)I

    move-result v3

    if-gez v3, :cond_2

    goto :goto_1

    :cond_2
    const/4 v4, 0x0

    .line 507
    invoke-virtual {v0, v2, v4, v3}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    if-ge v3, v1, :cond_1

    .line 511
    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->of(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    move-result-object p1

    .line 512
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->parse(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/ast/Document;

    move-result-object p1

    return-object p1
.end method

.method public parse(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/ast/Document;
    .locals 6

    .line 450
    invoke-static {p1}, Lcom/vladsch/flexmark/util/sequence/SubSequence;->of(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    const/4 v0, 0x0

    .line 455
    iput v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->lineNumber:I

    .line 457
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->documentBlockParser:Lcom/vladsch/flexmark/parser/core/DocumentBlockParser;

    iget-object v2, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->options:Lcom/vladsch/flexmark/util/options/DataHolder;

    invoke-virtual {v1, v2, p1}, Lcom/vladsch/flexmark/parser/core/DocumentBlockParser;->initializeDocument(Lcom/vladsch/flexmark/util/options/DataHolder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 458
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->inlineParser:Lcom/vladsch/flexmark/parser/InlineParser;

    iget-object v2, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->myParsing:Lcom/vladsch/flexmark/ast/util/Parsing;

    iget-object v3, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->documentBlockParser:Lcom/vladsch/flexmark/parser/core/DocumentBlockParser;

    invoke-virtual {v3}, Lcom/vladsch/flexmark/parser/core/DocumentBlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Document;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lcom/vladsch/flexmark/parser/InlineParser;->initializeDocument(Lcom/vladsch/flexmark/ast/util/Parsing;Lcom/vladsch/flexmark/util/ast/Document;)V

    .line 460
    sget-object v1, Lcom/vladsch/flexmark/parser/block/ParserPhase;->PARSE_BLOCKS:Lcom/vladsch/flexmark/parser/block/ParserPhase;

    iput-object v1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->currentPhase:Lcom/vladsch/flexmark/parser/block/ParserPhase;

    .line 462
    :goto_0
    invoke-static {p1, v0}, Lcom/vladsch/flexmark/ast/util/Parsing;->findLineBreak(Ljava/lang/CharSequence;I)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    .line 463
    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    add-int/lit8 v3, v1, 0x1

    .line 465
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v4

    if-ge v3, v4, :cond_0

    invoke-interface {p1, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v4

    const/16 v5, 0xd

    if-ne v4, v5, :cond_0

    invoke-interface {p1, v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v4

    const/16 v5, 0xa

    if-ne v4, v5, :cond_0

    add-int/lit8 v3, v1, 0x2

    .line 471
    :cond_0
    invoke-interface {p1, v0, v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v4

    iput-object v4, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->lineWithEOL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 472
    iput v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->lineStart:I

    .line 473
    iput v1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->lineEOLIndex:I

    .line 474
    iput v3, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->lineEndIndex:I

    .line 475
    invoke-direct {p0, v2}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->incorporateLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 476
    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->lineNumber:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->lineNumber:I

    move v0, v3

    goto :goto_0

    .line 480
    :cond_1
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v1

    if-lez v1, :cond_3

    if-eqz v0, :cond_2

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v1

    if-ge v0, v1, :cond_3

    .line 481
    :cond_2
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    iput-object v1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->lineWithEOL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 482
    iput v0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->lineStart:I

    .line 483
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result p1

    iput p1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->lineEOLIndex:I

    .line 484
    iput p1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->lineEndIndex:I

    .line 485
    iget-object p1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->lineWithEOL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->incorporateLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 486
    iget p1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->lineNumber:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->lineNumber:I

    .line 489
    :cond_3
    invoke-direct {p0}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->finalizeAndProcess()Lcom/vladsch/flexmark/util/ast/Document;

    move-result-object p1

    return-object p1
.end method
