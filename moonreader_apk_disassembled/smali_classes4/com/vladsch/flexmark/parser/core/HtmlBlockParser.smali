.class public Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;
.super Lcom/vladsch/flexmark/parser/block/AbstractBlockParser;
.source "HtmlBlockParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$BlockFactory;,
        Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$Factory;,
        Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$Patterns;
    }
.end annotation


# static fields
.field public static final HTML_COMMENT_CLOSE:Ljava/lang/String; = "-->"

.field public static final HTML_COMMENT_OPEN:Ljava/lang/String; = "<!--"


# instance fields
.field private final block:Lcom/vladsch/flexmark/ast/HtmlBlockBase;

.field private final closingPattern:Ljava/util/regex/Pattern;

.field private content:Lcom/vladsch/flexmark/util/ast/BlockContent;

.field private final deepParser:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;

.field private finished:Z

.field private final myHtmlBlockDeepParseBlankLineInterrupts:Z

.field private final myHtmlBlockDeepParseBlankLineInterruptsPartialTag:Z

.field private final myHtmlBlockDeepParseIndentedCodeInterrupts:Z

.field private final myHtmlBlockDeepParseMarkdownInterruptsClosed:Z

.field private final myHtmlBlockDeepParseNonBlock:Z

.field private final parseInnerHtmlComments:Z


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;Ljava/util/regex/Pattern;ZLcom/vladsch/flexmark/parser/internal/HtmlDeepParser;)V
    .locals 1

    .line 103
    invoke-direct {p0}, Lcom/vladsch/flexmark/parser/block/AbstractBlockParser;-><init>()V

    const/4 v0, 0x0

    .line 92
    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;->finished:Z

    .line 93
    new-instance v0, Lcom/vladsch/flexmark/util/ast/BlockContent;

    invoke-direct {v0}, Lcom/vladsch/flexmark/util/ast/BlockContent;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;->content:Lcom/vladsch/flexmark/util/ast/BlockContent;

    .line 104
    iput-object p2, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;->closingPattern:Ljava/util/regex/Pattern;

    if-eqz p3, :cond_0

    .line 105
    new-instance p2, Lcom/vladsch/flexmark/ast/HtmlCommentBlock;

    invoke-direct {p2}, Lcom/vladsch/flexmark/ast/HtmlCommentBlock;-><init>()V

    goto :goto_0

    :cond_0
    new-instance p2, Lcom/vladsch/flexmark/ast/HtmlBlock;

    invoke-direct {p2}, Lcom/vladsch/flexmark/ast/HtmlBlock;-><init>()V

    :goto_0
    iput-object p2, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;->block:Lcom/vladsch/flexmark/ast/HtmlBlockBase;

    .line 106
    iput-object p4, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;->deepParser:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;

    .line 107
    sget-object p2, Lcom/vladsch/flexmark/parser/Parser;->PARSE_INNER_HTML_COMMENTS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, p2}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    iput-boolean p2, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;->parseInnerHtmlComments:Z

    .line 109
    sget-object p2, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_NON_BLOCK:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, p2}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    iput-boolean p2, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;->myHtmlBlockDeepParseNonBlock:Z

    .line 110
    sget-object p2, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_BLANK_LINE_INTERRUPTS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, p2}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    iput-boolean p2, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;->myHtmlBlockDeepParseBlankLineInterrupts:Z

    .line 111
    sget-object p2, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_MARKDOWN_INTERRUPTS_CLOSED:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, p2}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    iput-boolean p2, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;->myHtmlBlockDeepParseMarkdownInterruptsClosed:Z

    .line 112
    sget-object p2, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_BLANK_LINE_INTERRUPTS_PARTIAL_TAG:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, p2}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    iput-boolean p2, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;->myHtmlBlockDeepParseBlankLineInterruptsPartialTag:Z

    .line 113
    sget-object p2, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_INDENTED_CODE_INTERRUPTS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, p2}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;->myHtmlBlockDeepParseIndentedCodeInterrupts:Z

    return-void
.end method


# virtual methods
.method public addLine(Lcom/vladsch/flexmark/parser/block/ParserState;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 3

    .line 148
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;->deepParser:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;

    if-eqz v0, :cond_0

    .line 149
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;->content:Lcom/vladsch/flexmark/util/ast/BlockContent;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/BlockContent;->getLineCount()I

    move-result v0

    if-lez v0, :cond_1

    .line 151
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;->deepParser:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;->myHtmlBlockDeepParseNonBlock:Z

    const/4 v2, 0x0

    invoke-virtual {v0, p2, v2, v1, v2}, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->parseHtmlChunk(Ljava/lang/CharSequence;ZZZ)V

    goto :goto_0

    .line 154
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;->closingPattern:Ljava/util/regex/Pattern;

    if-eqz v0, :cond_1

    invoke-virtual {v0, p2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    .line 155
    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;->finished:Z

    .line 159
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;->content:Lcom/vladsch/flexmark/util/ast/BlockContent;

    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndent()I

    move-result p1

    invoke-virtual {v0, p2, p1}, Lcom/vladsch/flexmark/util/ast/BlockContent;->add(Lcom/vladsch/flexmark/util/sequence/BasedSequence;I)V

    return-void
.end method

.method public canContain(Lcom/vladsch/flexmark/parser/block/ParserState;Lcom/vladsch/flexmark/parser/block/BlockParser;Lcom/vladsch/flexmark/util/ast/Block;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public canInterruptBy(Lcom/vladsch/flexmark/parser/block/BlockParserFactory;)Z
    .locals 2

    .line 164
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;->myHtmlBlockDeepParseMarkdownInterruptsClosed:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;->deepParser:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;

    if-eqz v0, :cond_1

    instance-of v1, p1, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$Factory;

    if-nez v1, :cond_1

    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;->myHtmlBlockDeepParseIndentedCodeInterrupts:Z

    if-nez v1, :cond_0

    instance-of p1, p1, Lcom/vladsch/flexmark/parser/core/IndentedCodeBlockParser$BlockFactory;

    if-nez p1, :cond_1

    .line 168
    :cond_0
    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->isHtmlClosed()Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public closeBlock(Lcom/vladsch/flexmark/parser/block/ParserState;)V
    .locals 5

    .line 188
    iget-object p1, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;->block:Lcom/vladsch/flexmark/ast/HtmlBlockBase;

    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;->content:Lcom/vladsch/flexmark/util/ast/BlockContent;

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/ast/HtmlBlockBase;->setContent(Lcom/vladsch/flexmark/util/ast/BlockContent;)V

    const/4 p1, 0x0

    .line 189
    iput-object p1, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;->content:Lcom/vladsch/flexmark/util/ast/BlockContent;

    .line 192
    iget-object p1, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;->block:Lcom/vladsch/flexmark/ast/HtmlBlockBase;

    instance-of v0, p1, Lcom/vladsch/flexmark/ast/HtmlCommentBlock;

    if-nez v0, :cond_5

    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;->parseInnerHtmlComments:Z

    if-eqz v0, :cond_5

    .line 195
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/HtmlBlockBase;->getContentChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    .line 196
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->eolLength()I

    move-result v0

    const/4 v1, 0x0

    if-lez v0, :cond_0

    const/4 v0, -0x1

    invoke-interface {p1, v1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->midSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    .line 210
    :cond_0
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v0

    :goto_0
    if-ge v1, v0, :cond_4

    .line 213
    const-string v2, "<!--"

    invoke-interface {p1, v2, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->indexOf(Ljava/lang/CharSequence;I)I

    move-result v2

    if-gez v2, :cond_1

    goto :goto_1

    :cond_1
    add-int/lit8 v3, v2, 0x4

    .line 217
    const-string v4, "-->"

    invoke-interface {p1, v4, v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->indexOf(Ljava/lang/CharSequence;I)I

    move-result v3

    if-gez v3, :cond_2

    goto :goto_1

    :cond_2
    if-ge v1, v2, :cond_3

    .line 223
    new-instance v4, Lcom/vladsch/flexmark/ast/HtmlInnerBlock;

    invoke-interface {p1, v1, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-direct {v4, v1}, Lcom/vladsch/flexmark/ast/HtmlInnerBlock;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 224
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;->block:Lcom/vladsch/flexmark/ast/HtmlBlockBase;

    invoke-virtual {v1, v4}, Lcom/vladsch/flexmark/ast/HtmlBlockBase;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    :cond_3
    add-int/lit8 v1, v3, 0x3

    .line 228
    new-instance v3, Lcom/vladsch/flexmark/ast/HtmlInnerBlockComment;

    invoke-interface {p1, v2, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    invoke-direct {v3, v2}, Lcom/vladsch/flexmark/ast/HtmlInnerBlockComment;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 229
    iget-object v2, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;->block:Lcom/vladsch/flexmark/ast/HtmlBlockBase;

    invoke-virtual {v2, v3}, Lcom/vladsch/flexmark/ast/HtmlBlockBase;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    goto :goto_0

    :cond_4
    :goto_1
    if-lez v1, :cond_5

    .line 233
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v0

    if-ge v1, v0, :cond_5

    .line 234
    new-instance v0, Lcom/vladsch/flexmark/ast/HtmlInnerBlock;

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v2

    invoke-interface {p1, v1, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/ast/HtmlInnerBlock;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 235
    iget-object p1, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;->block:Lcom/vladsch/flexmark/ast/HtmlBlockBase;

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/ast/HtmlBlockBase;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    :cond_5
    return-void
.end method

.method public getBlock()Lcom/vladsch/flexmark/util/ast/Block;
    .locals 1

    .line 119
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;->block:Lcom/vladsch/flexmark/ast/HtmlBlockBase;

    return-object v0
.end method

.method public isInterruptible()Z
    .locals 1

    .line 178
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;->myHtmlBlockDeepParseMarkdownInterruptsClosed:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;->deepParser:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->isHtmlClosed()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isRawText()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public tryContinue(Lcom/vladsch/flexmark/parser/block/ParserState;)Lcom/vladsch/flexmark/parser/block/BlockContinue;
    .locals 1

    .line 124
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;->deepParser:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;

    if-eqz v0, :cond_3

    .line 125
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->isBlank()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 126
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;->deepParser:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->isHtmlClosed()Z

    move-result v0

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;->myHtmlBlockDeepParseBlankLineInterrupts:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;->deepParser:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->haveOpenRawTag()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;->myHtmlBlockDeepParseBlankLineInterruptsPartialTag:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;->deepParser:Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/internal/HtmlDeepParser;->isBlankLineInterruptible()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 127
    :cond_1
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockContinue;->none()Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 131
    :cond_2
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndex()I

    move-result p1

    invoke-static {p1}, Lcom/vladsch/flexmark/parser/block/BlockContinue;->atIndex(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 133
    :cond_3
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;->finished:Z

    if-eqz v0, :cond_4

    .line 134
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockContinue;->none()Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 138
    :cond_4
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->isBlank()Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser;->closingPattern:Ljava/util/regex/Pattern;

    if-nez v0, :cond_5

    .line 139
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockContinue;->none()Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 141
    :cond_5
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndex()I

    move-result p1

    invoke-static {p1}, Lcom/vladsch/flexmark/parser/block/BlockContinue;->atIndex(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1
.end method
