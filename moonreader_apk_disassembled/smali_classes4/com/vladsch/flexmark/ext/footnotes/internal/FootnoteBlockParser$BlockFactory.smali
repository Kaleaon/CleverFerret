.class Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser$BlockFactory;
.super Lcom/vladsch/flexmark/parser/block/AbstractBlockParserFactory;
.source "FootnoteBlockParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BlockFactory"
.end annotation


# instance fields
.field private final options:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteOptions;


# direct methods
.method private constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 1

    .line 111
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/block/AbstractBlockParserFactory;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    .line 112
    new-instance v0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteOptions;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteOptions;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser$BlockFactory;->options:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteOptions;

    return-void
.end method

.method synthetic constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser$1;)V
    .locals 0

    .line 107
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser$BlockFactory;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    return-void
.end method


# virtual methods
.method public tryStart(Lcom/vladsch/flexmark/parser/block/ParserState;Lcom/vladsch/flexmark/parser/block/MatchedBlockParser;)Lcom/vladsch/flexmark/parser/block/BlockStart;
    .locals 5

    .line 117
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndent()I

    move-result p2

    const/4 v0, 0x4

    if-lt p2, v0, :cond_0

    .line 118
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockStart;->none()Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    return-object p1

    .line 121
    :cond_0
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    .line 122
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getNextNonSpaceIndex()I

    move-result p1

    .line 124
    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v0

    invoke-interface {p2, p1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    .line 125
    sget-object v1, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser;->FOOTNOTE_DEF_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 126
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 128
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->start()I

    move-result v1

    add-int/2addr v1, p1

    .line 129
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->end()I

    move-result v0

    add-int/2addr p1, v0

    add-int/lit8 v0, v1, 0x2

    .line 130
    invoke-interface {p2, v1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    add-int/lit8 v2, p1, -0x2

    .line 131
    invoke-interface {p2, v0, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trim()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    .line 132
    invoke-interface {p2, v2, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    .line 134
    iget-object v2, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser$BlockFactory;->options:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteOptions;

    iget v2, v2, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteOptions;->contentIndent:I

    .line 136
    new-instance v3, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser;

    iget-object v4, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser$BlockFactory;->options:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteOptions;

    invoke-direct {v3, v4, v2}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser;-><init>(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteOptions;I)V

    .line 137
    invoke-static {v3}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser;->access$100(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser;)Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->setOpeningMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 138
    invoke-static {v3}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser;->access$100(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser;)Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->setText(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 139
    invoke-static {v3}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser;->access$100(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser;)Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->setClosingMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    const/4 p2, 0x1

    .line 141
    new-array p2, p2, [Lcom/vladsch/flexmark/parser/block/BlockParser;

    const/4 v0, 0x0

    aput-object v3, p2, v0

    invoke-static {p2}, Lcom/vladsch/flexmark/parser/block/BlockStart;->of([Lcom/vladsch/flexmark/parser/block/BlockParser;)Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p2

    .line 142
    invoke-virtual {p2, p1}, Lcom/vladsch/flexmark/parser/block/BlockStart;->atIndex(I)Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    return-object p1

    .line 144
    :cond_1
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockStart;->none()Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    return-object p1
.end method
