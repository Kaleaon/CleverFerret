.class public Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;
.super Lcom/vladsch/flexmark/parser/block/AbstractBlockParser;
.source "FencedCodeBlockParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser$BlockFactory;,
        Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser$Factory;
    }
.end annotation


# static fields
.field private static final CLOSING_FENCE:Ljava/util/regex/Pattern;

.field private static final OPENING_FENCE:Ljava/util/regex/Pattern;


# instance fields
.field private final block:Lcom/vladsch/flexmark/ast/FencedCodeBlock;

.field private final codeContentBlock:Z

.field private content:Lcom/vladsch/flexmark/util/ast/BlockContent;

.field private fenceChar:C

.field private fenceIndent:I

.field private fenceLength:I

.field private fenceMarkerIndent:I

.field private final matchingCloser:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 21
    const-string v0, "^`{3,}(?!.*`)|^~{3,}(?!.*~)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;->OPENING_FENCE:Ljava/util/regex/Pattern;

    .line 22
    const-string v0, "^(?:`{3,}|~{3,})(?=[ \t]*$)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;->CLOSING_FENCE:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;CIII)V
    .locals 1

    .line 33
    invoke-direct {p0}, Lcom/vladsch/flexmark/parser/block/AbstractBlockParser;-><init>()V

    .line 24
    new-instance v0, Lcom/vladsch/flexmark/ast/FencedCodeBlock;

    invoke-direct {v0}, Lcom/vladsch/flexmark/ast/FencedCodeBlock;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;->block:Lcom/vladsch/flexmark/ast/FencedCodeBlock;

    .line 25
    new-instance v0, Lcom/vladsch/flexmark/util/ast/BlockContent;

    invoke-direct {v0}, Lcom/vladsch/flexmark/util/ast/BlockContent;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;->content:Lcom/vladsch/flexmark/util/ast/BlockContent;

    .line 34
    iput-char p2, p0, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;->fenceChar:C

    .line 35
    iput p3, p0, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;->fenceLength:I

    .line 36
    iput p4, p0, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;->fenceIndent:I

    add-int/2addr p4, p5

    .line 37
    iput p4, p0, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;->fenceMarkerIndent:I

    .line 38
    sget-object p2, Lcom/vladsch/flexmark/parser/Parser;->MATCH_CLOSING_FENCE_CHARACTERS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, p2}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    iput-boolean p2, p0, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;->matchingCloser:Z

    .line 39
    sget-object p2, Lcom/vladsch/flexmark/parser/Parser;->FENCED_CODE_CONTENT_BLOCK:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, p2}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;->codeContentBlock:Z

    return-void
.end method

.method static synthetic access$100()Ljava/util/regex/Pattern;
    .locals 1

    .line 19
    sget-object v0, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;->OPENING_FENCE:Ljava/util/regex/Pattern;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;)Lcom/vladsch/flexmark/ast/FencedCodeBlock;
    .locals 0

    .line 19
    iget-object p0, p0, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;->block:Lcom/vladsch/flexmark/ast/FencedCodeBlock;

    return-object p0
.end method


# virtual methods
.method public addLine(Lcom/vladsch/flexmark/parser/block/ParserState;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 1

    .line 89
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;->content:Lcom/vladsch/flexmark/util/ast/BlockContent;

    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndent()I

    move-result p1

    invoke-virtual {v0, p2, p1}, Lcom/vladsch/flexmark/util/ast/BlockContent;->add(Lcom/vladsch/flexmark/util/sequence/BasedSequence;I)V

    return-void
.end method

.method public closeBlock(Lcom/vladsch/flexmark/parser/block/ParserState;)V
    .locals 3

    .line 100
    iget-object p1, p0, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;->content:Lcom/vladsch/flexmark/util/ast/BlockContent;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/BlockContent;->getLines()Ljava/util/List;

    move-result-object p1

    .line 101
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_3

    const/4 v0, 0x0

    .line 102
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 103
    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isBlank()Z

    move-result v2

    if-nez v2, :cond_0

    .line 104
    iget-object v2, p0, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;->block:Lcom/vladsch/flexmark/ast/FencedCodeBlock;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trim()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->setInfo(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 107
    :cond_0
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;->content:Lcom/vladsch/flexmark/util/ast/BlockContent;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/ast/BlockContent;->getSpanningChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    .line 108
    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v2

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v0

    invoke-interface {v1, v2, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    .line 110
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_2

    .line 112
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-interface {p1, v2, v1}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object p1

    .line 113
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;->block:Lcom/vladsch/flexmark/ast/FencedCodeBlock;

    invoke-virtual {v1, v0, p1}, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->setContent(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/util/List;)V

    .line 114
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;->codeContentBlock:Z

    if-eqz v0, :cond_1

    .line 115
    new-instance v0, Lcom/vladsch/flexmark/ast/CodeBlock;

    invoke-direct {v0}, Lcom/vladsch/flexmark/ast/CodeBlock;-><init>()V

    .line 116
    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/ast/CodeBlock;->setContent(Ljava/util/List;)V

    .line 117
    invoke-virtual {v0}, Lcom/vladsch/flexmark/ast/CodeBlock;->setCharsFromContent()V

    .line 118
    iget-object p1, p0, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;->block:Lcom/vladsch/flexmark/ast/FencedCodeBlock;

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    goto :goto_0

    .line 120
    :cond_1
    new-instance v0, Lcom/vladsch/flexmark/ast/Text;

    invoke-static {p1}, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->of(Ljava/util/List;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/ast/Text;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 121
    iget-object p1, p0, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;->block:Lcom/vladsch/flexmark/ast/FencedCodeBlock;

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    goto :goto_0

    .line 124
    :cond_2
    iget-object p1, p0, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;->block:Lcom/vladsch/flexmark/ast/FencedCodeBlock;

    sget-object v1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->EMPTY_LIST:Ljava/util/List;

    invoke-virtual {p1, v0, v1}, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->setContent(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/util/List;)V

    goto :goto_0

    .line 127
    :cond_3
    iget-object p1, p0, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;->block:Lcom/vladsch/flexmark/ast/FencedCodeBlock;

    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;->content:Lcom/vladsch/flexmark/util/ast/BlockContent;

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->setContent(Lcom/vladsch/flexmark/util/ast/BlockContent;)V

    .line 130
    :goto_0
    iget-object p1, p0, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;->block:Lcom/vladsch/flexmark/ast/FencedCodeBlock;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->setCharsFromContent()V

    const/4 p1, 0x0

    .line 131
    iput-object p1, p0, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;->content:Lcom/vladsch/flexmark/util/ast/BlockContent;

    return-void
.end method

.method public getBlock()Lcom/vladsch/flexmark/util/ast/Block;
    .locals 1

    .line 44
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;->block:Lcom/vladsch/flexmark/ast/FencedCodeBlock;

    return-object v0
.end method

.method public getFenceIndent()I
    .locals 1

    .line 48
    iget v0, p0, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;->fenceIndent:I

    return v0
.end method

.method public getFenceMarkerIndent()I
    .locals 1

    .line 52
    iget v0, p0, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;->fenceMarkerIndent:I

    return v0
.end method

.method public isPropagatingLastBlankLine(Lcom/vladsch/flexmark/parser/block/BlockParser;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public tryContinue(Lcom/vladsch/flexmark/parser/block/ParserState;)Lcom/vladsch/flexmark/parser/block/BlockContinue;
    .locals 5

    .line 57
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getNextNonSpaceIndex()I

    move-result v0

    .line 58
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndex()I

    move-result v1

    .line 59
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    .line 61
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndent()I

    move-result p1

    const/4 v3, 0x3

    if-gt p1, v3, :cond_1

    .line 62
    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result p1

    if-ge v0, p1, :cond_1

    iget-boolean p1, p0, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;->matchingCloser:Z

    if-eqz p1, :cond_0

    .line 63
    invoke-interface {v2, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result p1

    iget-char v3, p0, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;->fenceChar:C

    if-ne p1, v3, :cond_1

    .line 66
    :cond_0
    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result p1

    invoke-interface {v2, v0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    .line 67
    sget-object v0, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;->CLOSING_FENCE:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 68
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v3

    if-eqz v3, :cond_1

    const/4 v3, 0x0

    .line 69
    invoke-virtual {v0, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    .line 71
    iget v4, p0, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;->fenceLength:I

    if-lt v0, v4, :cond_1

    .line 73
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;->block:Lcom/vladsch/flexmark/ast/FencedCodeBlock;

    invoke-interface {p1, v3, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {v1, p1}, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->setClosingMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 74
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockContinue;->finished()Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 79
    :cond_1
    iget p1, p0, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;->fenceIndent:I

    :goto_0
    if-lez p1, :cond_2

    .line 80
    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v0

    if-ge v1, v0, :cond_2

    invoke-interface {v2, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v0

    const/16 v3, 0x20

    if-ne v0, v3, :cond_2

    add-int/lit8 v1, v1, 0x1

    add-int/lit8 p1, p1, -0x1

    goto :goto_0

    .line 84
    :cond_2
    invoke-static {v1}, Lcom/vladsch/flexmark/parser/block/BlockContinue;->atIndex(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1
.end method
