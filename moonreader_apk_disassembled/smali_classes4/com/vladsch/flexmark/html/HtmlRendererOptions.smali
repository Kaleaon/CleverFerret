.class public Lcom/vladsch/flexmark/html/HtmlRendererOptions;
.super Ljava/lang/Object;
.source "HtmlRendererOptions.java"


# instance fields
.field public final autolinkWwwPrefix:Ljava/lang/String;

.field public final codeStyleHtmlClose:Ljava/lang/String;

.field public final codeStyleHtmlOpen:Ljava/lang/String;

.field public final doNotRenderLinksInDocument:Z

.field public final emphasisStyleHtmlClose:Ljava/lang/String;

.field public final emphasisStyleHtmlOpen:Ljava/lang/String;

.field public final escapeHtmlBlocks:Z

.field public final escapeHtmlCommentBlocks:Z

.field public final escapeInlineHtml:Z

.field public final escapeInlineHtmlComments:Z

.field public final formatFlags:I

.field public final generateHeaderIds:Z

.field public final hardBreak:Ljava/lang/String;

.field public final htmlBlockCloseTagEol:Z

.field public final htmlBlockOpenTagEol:Z

.field public final indentSize:I

.field public final inlineCodeSpliceClass:Ljava/lang/String;

.field public final isSoftBreakAllSpaces:Z

.field public final languageClassPrefix:Ljava/lang/String;

.field public final maxTrailingBlankLines:I

.field public final noLanguageClass:Ljava/lang/String;

.field public final noPTagsUseBr:Z

.field public final percentEncodeUrls:Z

.field public final renderHeaderId:Z

.field public final softBreak:Ljava/lang/String;

.field public final sourcePositionAttribute:Ljava/lang/String;

.field public final sourcePositionParagraphLines:Z

.field public final sourceWrapHtmlBlocks:Z

.field public final strongEmphasisStyleHtmlClose:Ljava/lang/String;

.field public final strongEmphasisStyleHtmlOpen:Ljava/lang/String;

.field public final suppressHtmlBlocks:Z

.field public final suppressHtmlCommentBlocks:Z

.field public final suppressInlineHtml:Z

.field public final suppressInlineHtmlComments:Z

.field public final suppressedLinks:Ljava/util/regex/Pattern;

.field public final unescapeHtmlEntities:Z


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 4

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->SOFT_BREAK:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->softBreak:Ljava/lang/String;

    .line 49
    invoke-static {v0}, Lcom/vladsch/flexmark/util/Utils;->isWhiteSpaceNoEOL(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->isSoftBreakAllSpaces:Z

    .line 50
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->HARD_BREAK:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->hardBreak:Ljava/lang/String;

    .line 51
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->STRONG_EMPHASIS_STYLE_HTML_OPEN:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->strongEmphasisStyleHtmlOpen:Ljava/lang/String;

    .line 52
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->STRONG_EMPHASIS_STYLE_HTML_CLOSE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->strongEmphasisStyleHtmlClose:Ljava/lang/String;

    .line 53
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->EMPHASIS_STYLE_HTML_OPEN:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->emphasisStyleHtmlOpen:Ljava/lang/String;

    .line 54
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->EMPHASIS_STYLE_HTML_CLOSE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->emphasisStyleHtmlClose:Ljava/lang/String;

    .line 55
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->CODE_STYLE_HTML_OPEN:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->codeStyleHtmlOpen:Ljava/lang/String;

    .line 56
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->CODE_STYLE_HTML_CLOSE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->codeStyleHtmlClose:Ljava/lang/String;

    .line 57
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->ESCAPE_HTML_BLOCKS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->escapeHtmlBlocks:Z

    .line 58
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->ESCAPE_HTML_COMMENT_BLOCKS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->escapeHtmlCommentBlocks:Z

    .line 59
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->ESCAPE_INLINE_HTML:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->escapeInlineHtml:Z

    .line 60
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->ESCAPE_INLINE_HTML_COMMENTS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->escapeInlineHtmlComments:Z

    .line 61
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->PERCENT_ENCODE_URLS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->percentEncodeUrls:Z

    .line 62
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->INDENT_SIZE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->indentSize:I

    .line 63
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->SUPPRESS_HTML_BLOCKS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->suppressHtmlBlocks:Z

    .line 64
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->SUPPRESS_HTML_COMMENT_BLOCKS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->suppressHtmlCommentBlocks:Z

    .line 65
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->SUPPRESS_INLINE_HTML:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->suppressInlineHtml:Z

    .line 66
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->SUPPRESS_INLINE_HTML_COMMENTS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->suppressInlineHtmlComments:Z

    .line 67
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->DO_NOT_RENDER_LINKS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->doNotRenderLinksInDocument:Z

    .line 68
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->RENDER_HEADER_ID:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->renderHeaderId:Z

    .line 69
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->GENERATE_HEADER_ID:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->generateHeaderIds:Z

    .line 70
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->FENCED_CODE_LANGUAGE_CLASS_PREFIX:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->languageClassPrefix:Ljava/lang/String;

    .line 71
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->FENCED_CODE_NO_LANGUAGE_CLASS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->noLanguageClass:Ljava/lang/String;

    .line 72
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->SOURCE_POSITION_ATTRIBUTE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->sourcePositionAttribute:Ljava/lang/String;

    .line 73
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez v1, :cond_0

    sget-object v1, Lcom/vladsch/flexmark/html/HtmlRenderer;->SOURCE_POSITION_PARAGRAPH_LINES:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v1, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    iput-boolean v1, p0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->sourcePositionParagraphLines:Z

    .line 74
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->SOURCE_WRAP_HTML_BLOCKS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    :goto_1
    iput-boolean v2, p0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->sourceWrapHtmlBlocks:Z

    .line 75
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->FORMAT_FLAGS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->formatFlags:I

    .line 76
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->MAX_TRAILING_BLANK_LINES:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->maxTrailingBlankLines:I

    .line 77
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->HTML_BLOCK_OPEN_TAG_EOL:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->htmlBlockOpenTagEol:Z

    .line 78
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->HTML_BLOCK_CLOSE_TAG_EOL:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->htmlBlockCloseTagEol:Z

    .line 79
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->UNESCAPE_HTML_ENTITIES:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->unescapeHtmlEntities:Z

    .line 80
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->NO_P_TAGS_USE_BR:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->noPTagsUseBr:Z

    .line 81
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->INLINE_CODE_SPLICE_CLASS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->inlineCodeSpliceClass:Ljava/lang/String;

    .line 82
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->AUTOLINK_WWW_PREFIX:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->autolinkWwwPrefix:Ljava/lang/String;

    .line 84
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->SUPPRESSED_LINKS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 85
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 p1, 0x0

    goto :goto_2

    :cond_2
    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object p1

    :goto_2
    iput-object p1, p0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->suppressedLinks:Ljava/util/regex/Pattern;

    return-void
.end method
