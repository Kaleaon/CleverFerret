.class Lcom/vladsch/flexmark/parser/core/ThematicBreakParser$BlockFactory;
.super Lcom/vladsch/flexmark/parser/block/AbstractBlockParserFactory;
.source "ThematicBreakParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/parser/core/ThematicBreakParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BlockFactory"
.end annotation


# instance fields
.field private final options:Lcom/vladsch/flexmark/parser/core/ThematicBreakParser$ThematicBreakOptions;


# direct methods
.method private constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 1

    .line 83
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/block/AbstractBlockParserFactory;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    .line 84
    new-instance v0, Lcom/vladsch/flexmark/parser/core/ThematicBreakParser$ThematicBreakOptions;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/parser/core/ThematicBreakParser$ThematicBreakOptions;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/core/ThematicBreakParser$BlockFactory;->options:Lcom/vladsch/flexmark/parser/core/ThematicBreakParser$ThematicBreakOptions;

    return-void
.end method

.method synthetic constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;Lcom/vladsch/flexmark/parser/core/ThematicBreakParser$1;)V
    .locals 0

    .line 79
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/core/ThematicBreakParser$BlockFactory;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    return-void
.end method


# virtual methods
.method public tryStart(Lcom/vladsch/flexmark/parser/block/ParserState;Lcom/vladsch/flexmark/parser/block/MatchedBlockParser;)Lcom/vladsch/flexmark/parser/block/BlockStart;
    .locals 2

    .line 89
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndent()I

    move-result v0

    const/4 v1, 0x4

    if-ge v0, v1, :cond_2

    invoke-interface {p2}, Lcom/vladsch/flexmark/parser/block/MatchedBlockParser;->getBlockParser()Lcom/vladsch/flexmark/parser/block/BlockParser;

    move-result-object p2

    invoke-interface {p2}, Lcom/vladsch/flexmark/parser/block/BlockParser;->isParagraphParser()Z

    move-result p2

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/vladsch/flexmark/parser/core/ThematicBreakParser$BlockFactory;->options:Lcom/vladsch/flexmark/parser/core/ThematicBreakParser$ThematicBreakOptions;

    iget-boolean p2, p2, Lcom/vladsch/flexmark/parser/core/ThematicBreakParser$ThematicBreakOptions;->relaxedStart:Z

    if-nez p2, :cond_0

    goto :goto_0

    .line 92
    :cond_0
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    .line 93
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getNextNonSpaceIndex()I

    move-result v0

    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v1

    invoke-interface {p2, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    .line 94
    invoke-static {}, Lcom/vladsch/flexmark/parser/core/ThematicBreakParser;->access$100()Ljava/util/regex/Pattern;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    .line 95
    new-array v0, v0, [Lcom/vladsch/flexmark/parser/block/BlockParser;

    new-instance v1, Lcom/vladsch/flexmark/parser/core/ThematicBreakParser;

    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndex()I

    move-result p1

    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-direct {v1, p1}, Lcom/vladsch/flexmark/parser/core/ThematicBreakParser;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    const/4 p1, 0x0

    aput-object v1, v0, p1

    invoke-static {v0}, Lcom/vladsch/flexmark/parser/block/BlockStart;->of([Lcom/vladsch/flexmark/parser/block/BlockParser;)Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/parser/block/BlockStart;->atIndex(I)Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    return-object p1

    .line 97
    :cond_1
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockStart;->none()Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    return-object p1

    .line 90
    :cond_2
    :goto_0
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockStart;->none()Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    return-object p1
.end method
