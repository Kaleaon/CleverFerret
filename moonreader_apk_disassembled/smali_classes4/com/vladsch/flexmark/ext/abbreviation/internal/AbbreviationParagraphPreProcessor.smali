.class public Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationParagraphPreProcessor;
.super Ljava/lang/Object;
.source "AbbreviationParagraphPreProcessor.java"

# interfaces
.implements Lcom/vladsch/flexmark/parser/block/ParagraphPreProcessor;


# static fields
.field private static ABBREVIATION_BLOCK:Ljava/util/regex/Pattern;


# instance fields
.field private final abbreviationMap:Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationRepository;

.field private final options:Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationOptions;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 20
    const-string v0, "\\s{0,3}(\\*\\[\\s*.*\\s*\\]:)\\s*[^\n\r]*(?:\r\n|\r|\n|$)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationParagraphPreProcessor;->ABBREVIATION_BLOCK:Ljava/util/regex/Pattern;

    return-void
.end method

.method private constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 1

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    new-instance v0, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationOptions;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationOptions;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationParagraphPreProcessor;->options:Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationOptions;

    .line 28
    sget-object v0, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationExtension;->ABBREVIATIONS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationRepository;

    iput-object p1, p0, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationParagraphPreProcessor;->abbreviationMap:Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationRepository;

    return-void
.end method

.method synthetic constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationParagraphPreProcessor$1;)V
    .locals 0

    .line 19
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationParagraphPreProcessor;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    return-void
.end method

.method public static Factory()Lcom/vladsch/flexmark/parser/block/ParagraphPreProcessorFactory;
    .locals 1

    .line 65
    new-instance v0, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationParagraphPreProcessor$1;

    invoke-direct {v0}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationParagraphPreProcessor$1;-><init>()V

    return-object v0
.end method


# virtual methods
.method public preProcessBlock(Lcom/vladsch/flexmark/ast/Paragraph;Lcom/vladsch/flexmark/parser/block/ParserState;)I
    .locals 8

    .line 33
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Paragraph;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    .line 34
    sget-object v1, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationParagraphPreProcessor;->ABBREVIATION_BLOCK:Ljava/util/regex/Pattern;

    invoke-virtual {v1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    const/4 v2, 0x0

    .line 36
    :goto_0
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 38
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->start()I

    move-result v3

    if-eq v3, v2, :cond_0

    goto :goto_1

    .line 40
    :cond_0
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->end()I

    move-result v2

    const/4 v3, 0x1

    .line 42
    invoke-virtual {v1, v3}, Ljava/util/regex/Matcher;->start(I)I

    move-result v4

    .line 43
    invoke-virtual {v1, v3}, Ljava/util/regex/Matcher;->end(I)I

    move-result v3

    add-int/lit8 v5, v4, 0x2

    .line 45
    invoke-interface {v0, v4, v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v4

    add-int/lit8 v6, v3, -0x2

    .line 46
    invoke-interface {v0, v5, v6}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v5

    invoke-interface {v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trim()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v5

    .line 47
    invoke-interface {v0, v6, v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v6

    .line 49
    new-instance v7, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;

    invoke-direct {v7}, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;-><init>()V

    .line 50
    invoke-virtual {v7, v4}, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->setOpeningMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 51
    invoke-virtual {v7, v5}, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->setText(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 52
    invoke-virtual {v7, v6}, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->setClosingMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 53
    invoke-interface {v0, v3, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    invoke-interface {v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trim()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    invoke-virtual {v7, v3}, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->setAbbreviation(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 54
    invoke-virtual {v7}, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->setCharsFromContent()V

    .line 56
    invoke-virtual {p1, v7}, Lcom/vladsch/flexmark/ast/Paragraph;->insertBefore(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 57
    invoke-interface {p2, v7}, Lcom/vladsch/flexmark/parser/block/ParserState;->blockAdded(Lcom/vladsch/flexmark/util/ast/Block;)V

    .line 59
    iget-object v3, p0, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationParagraphPreProcessor;->abbreviationMap:Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationRepository;

    invoke-virtual {v7}, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationRepository;->normalizeKey(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, v7}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationRepository;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    :goto_1
    return v2
.end method
