.class Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationBlockParser$BlockFactory;
.super Lcom/vladsch/flexmark/parser/block/AbstractBlockParserFactory;
.source "AbbreviationBlockParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationBlockParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BlockFactory"
.end annotation


# instance fields
.field private final options:Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationOptions;


# direct methods
.method private constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 1

    .line 78
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/block/AbstractBlockParserFactory;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    .line 79
    new-instance v0, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationOptions;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationOptions;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationBlockParser$BlockFactory;->options:Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationOptions;

    return-void
.end method

.method synthetic constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationBlockParser$1;)V
    .locals 0

    .line 74
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationBlockParser$BlockFactory;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    return-void
.end method


# virtual methods
.method public tryStart(Lcom/vladsch/flexmark/parser/block/ParserState;Lcom/vladsch/flexmark/parser/block/MatchedBlockParser;)Lcom/vladsch/flexmark/parser/block/BlockStart;
    .locals 6

    .line 84
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndent()I

    move-result p2

    const/4 v0, 0x4

    if-lt p2, v0, :cond_0

    .line 85
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockStart;->none()Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    return-object p1

    .line 88
    :cond_0
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    .line 89
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getNextNonSpaceIndex()I

    move-result p1

    .line 91
    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v0

    invoke-interface {p2, p1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    .line 92
    invoke-static {}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationBlockParser;->access$100()Ljava/util/regex/Pattern;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 93
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 95
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->start()I

    move-result v2

    add-int/2addr v2, p1

    .line 96
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->end()I

    move-result v3

    add-int/2addr p1, v3

    add-int/lit8 v3, v2, 0x2

    .line 97
    invoke-interface {v0, v2, v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    add-int/lit8 v4, p1, -0x2

    .line 98
    invoke-interface {v0, v3, v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    invoke-interface {v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trim()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    .line 99
    invoke-interface {v0, v4, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    .line 101
    new-instance v4, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationBlockParser;

    invoke-direct {v4}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationBlockParser;-><init>()V

    .line 102
    invoke-static {v4}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationBlockParser;->access$200(Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationBlockParser;)Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;

    move-result-object v5

    invoke-virtual {v5, v2}, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->setOpeningMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 103
    invoke-static {v4}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationBlockParser;->access$200(Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationBlockParser;)Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;

    move-result-object v2

    invoke-virtual {v2, v3}, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->setText(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 104
    invoke-static {v4}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationBlockParser;->access$200(Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationBlockParser;)Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->setClosingMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 105
    invoke-static {v4}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationBlockParser;->access$200(Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationBlockParser;)Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;

    move-result-object p1

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->end()I

    move-result v1

    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trim()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->setAbbreviation(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 106
    invoke-static {v4}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationBlockParser;->access$200(Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationBlockParser;)Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;

    move-result-object p1

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->setCharsFromContent()V

    const/4 p1, 0x1

    .line 108
    new-array p1, p1, [Lcom/vladsch/flexmark/parser/block/BlockParser;

    const/4 v0, 0x0

    aput-object v4, p1, v0

    invoke-static {p1}, Lcom/vladsch/flexmark/parser/block/BlockStart;->of([Lcom/vladsch/flexmark/parser/block/BlockParser;)Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    .line 109
    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/parser/block/BlockStart;->atIndex(I)Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    return-object p1

    .line 111
    :cond_1
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockStart;->none()Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    return-object p1
.end method
