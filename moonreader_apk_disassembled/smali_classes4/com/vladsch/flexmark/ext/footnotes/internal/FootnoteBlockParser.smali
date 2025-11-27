.class public Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser;
.super Lcom/vladsch/flexmark/parser/block/AbstractBlockParser;
.source "FootnoteBlockParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser$BlockFactory;,
        Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser$Factory;
    }
.end annotation


# static fields
.field static FOOTNOTE_DEF_PATTERN:Ljava/util/regex/Pattern; = null

.field static FOOTNOTE_ID:Ljava/lang/String; = ".*"

.field static FOOTNOTE_ID_PATTERN:Ljava/util/regex/Pattern;


# instance fields
.field private final block:Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

.field private content:Lcom/vladsch/flexmark/util/ast/BlockContent;

.field private final contentOffset:I

.field private final options:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteOptions;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 17
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\\[\\^\\s*("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser;->FOOTNOTE_ID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ")\\s*\\]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser;->FOOTNOTE_ID_PATTERN:Ljava/util/regex/Pattern;

    .line 18
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "^\\[\\^\\s*("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser;->FOOTNOTE_ID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ")\\s*\\]:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser;->FOOTNOTE_DEF_PATTERN:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteOptions;I)V
    .locals 1

    .line 25
    invoke-direct {p0}, Lcom/vladsch/flexmark/parser/block/AbstractBlockParser;-><init>()V

    .line 20
    new-instance v0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    invoke-direct {v0}, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser;->block:Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    .line 23
    new-instance v0, Lcom/vladsch/flexmark/util/ast/BlockContent;

    invoke-direct {v0}, Lcom/vladsch/flexmark/util/ast/BlockContent;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser;->content:Lcom/vladsch/flexmark/util/ast/BlockContent;

    .line 26
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser;->options:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteOptions;

    .line 27
    iput p2, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser;->contentOffset:I

    return-void
.end method

.method static synthetic access$100(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser;)Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;
    .locals 0

    .line 15
    iget-object p0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser;->block:Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    return-object p0
.end method


# virtual methods
.method public addLine(Lcom/vladsch/flexmark/parser/block/ParserState;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 1

    .line 61
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser;->content:Lcom/vladsch/flexmark/util/ast/BlockContent;

    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndent()I

    move-result p1

    invoke-virtual {v0, p2, p1}, Lcom/vladsch/flexmark/util/ast/BlockContent;->add(Lcom/vladsch/flexmark/util/sequence/BasedSequence;I)V

    return-void
.end method

.method public canContain(Lcom/vladsch/flexmark/parser/block/ParserState;Lcom/vladsch/flexmark/parser/block/BlockParser;Lcom/vladsch/flexmark/util/ast/Block;)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method

.method public closeBlock(Lcom/vladsch/flexmark/parser/block/ParserState;)V
    .locals 4

    .line 67
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser;->block:Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->setCharsFromContent()V

    .line 68
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser;->block:Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    iget-object v2, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser;->block:Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    invoke-virtual {v2}, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->getClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v2

    iget-object v3, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser;->block:Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    invoke-virtual {v3}, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    invoke-interface {v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-interface {v1, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trimStart()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->setFootnote(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 70
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getProperties()Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object p1

    sget-object v0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteExtension;->FOOTNOTES:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;

    .line 71
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser;->block:Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;->normalizeKey(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser;->block:Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    invoke-virtual {p1, v0, v1}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p1, 0x0

    .line 72
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser;->content:Lcom/vladsch/flexmark/util/ast/BlockContent;

    return-void
.end method

.method public getBlock()Lcom/vladsch/flexmark/util/ast/Block;
    .locals 1

    .line 36
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser;->block:Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    return-object v0
.end method

.method public getBlockContent()Lcom/vladsch/flexmark/util/ast/BlockContent;
    .locals 1

    .line 31
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser;->content:Lcom/vladsch/flexmark/util/ast/BlockContent;

    return-object v0
.end method

.method public isContainer()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public tryContinue(Lcom/vladsch/flexmark/parser/block/ParserState;)Lcom/vladsch/flexmark/parser/block/BlockContinue;
    .locals 2

    .line 41
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getNextNonSpaceIndex()I

    move-result v0

    .line 42
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->isBlank()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 43
    iget-object p1, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser;->block:Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p1

    if-nez p1, :cond_0

    .line 45
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockContinue;->none()Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 47
    :cond_0
    invoke-static {v0}, Lcom/vladsch/flexmark/parser/block/BlockContinue;->atIndex(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 51
    :cond_1
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndent()I

    move-result v0

    iget-object v1, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser;->options:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteOptions;

    iget v1, v1, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteOptions;->contentIndent:I

    if-lt v0, v1, :cond_2

    .line 52
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndex()I

    move-result p1

    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser;->options:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteOptions;

    iget v0, v0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteOptions;->contentIndent:I

    add-int/2addr p1, v0

    .line 53
    invoke-static {p1}, Lcom/vladsch/flexmark/parser/block/BlockContinue;->atIndex(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 55
    :cond_2
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockContinue;->none()Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1
.end method
