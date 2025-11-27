.class public Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;
.super Ljava/lang/Object;
.source "FormatterOptions.java"


# instance fields
.field public final appendTransferredReferences:Z

.field public final atxHeaderTrailingMarker:Lcom/vladsch/flexmark/util/format/options/EqualizeTrailingMarker;

.field public final blockQuoteBlankLines:Z

.field public final blockQuoteMarkers:Lcom/vladsch/flexmark/util/format/options/BlockQuoteMarker;

.field public final charWidthProvider:Lcom/vladsch/flexmark/util/mappers/CharWidthProvider;

.field public final emulationProfile:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

.field public final fencedCodeMarkerLength:I

.field public final fencedCodeMarkerType:Lcom/vladsch/flexmark/util/format/options/CodeFenceMarker;

.field public final fencedCodeMatchClosingMarker:Z

.field public final fencedCodeMinimizeIndent:Z

.field public final fencedCodeSpaceBeforeInfo:Z

.field public final formatFlags:I

.field public final indentedCodeMinimizeIndent:Z

.field public final itemContentIndent:Z

.field public final keepExplicitLinksAtStart:Z

.field public final keepHardLineBreaks:Z

.field public final keepImageLinksAtStart:Z

.field public final keepSoftLineBreaks:Z

.field public final listAddBlankLineBefore:Z

.field public final listBulletMarker:Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;

.field public final listNumberedMarker:Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;

.field public final listRemoveEmptyItems:Z

.field public final listRenumberItems:Z

.field public final listSpacing:Lcom/vladsch/flexmark/util/format/options/ListSpacing;

.field public final maxBlankLines:I

.field public final maxTrailingBlankLines:I

.field public final minSetextMarkerLength:I

.field public final optimizedInlineRendering:Z

.field public final referencePlacement:Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

.field public final referenceSort:Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;

.field public final setextHeaderEqualizeMarker:Z

.field public final spaceAfterAtxMarker:Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;

.field public final thematicBreak:Ljava/lang/String;

.field public final translationExcludePattern:Ljava/lang/String;

.field public final translationHtmlBlockPrefix:Ljava/lang/String;

.field public final translationHtmlBlockTagPattern:Ljava/lang/String;

.field public final translationHtmlInlineTagPattern:Ljava/lang/String;

.field public final translationIdFormat:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 2

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    sget-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->FORMATTER_EMULATION_PROFILE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    iput-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->emulationProfile:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    .line 57
    iget-object v0, v0, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->family:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    sget-object v1, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->FIXED_INDENT:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->itemContentIndent:Z

    .line 59
    sget-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->SETEXT_HEADER_EQUALIZE_MARKER:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->setextHeaderEqualizeMarker:Z

    .line 60
    sget-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->FORMAT_FLAGS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->formatFlags:I

    .line 61
    sget-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->MAX_BLANK_LINES:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->maxBlankLines:I

    .line 62
    sget-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->MAX_TRAILING_BLANK_LINES:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->maxTrailingBlankLines:I

    .line 63
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->HEADING_SETEXT_MARKER_LENGTH:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->minSetextMarkerLength:I

    .line 64
    sget-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->SPACE_AFTER_ATX_MARKER:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;

    iput-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->spaceAfterAtxMarker:Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;

    .line 65
    sget-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->ATX_HEADER_TRAILING_MARKER:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/format/options/EqualizeTrailingMarker;

    iput-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->atxHeaderTrailingMarker:Lcom/vladsch/flexmark/util/format/options/EqualizeTrailingMarker;

    .line 66
    sget-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->THEMATIC_BREAK:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->thematicBreak:Ljava/lang/String;

    .line 67
    sget-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->TRANSLATION_ID_FORMAT:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->translationIdFormat:Ljava/lang/String;

    .line 68
    sget-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->TRANSLATION_HTML_BLOCK_PREFIX:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->translationHtmlBlockPrefix:Ljava/lang/String;

    .line 69
    sget-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->TRANSLATION_EXCLUDE_PATTERN:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->translationExcludePattern:Ljava/lang/String;

    .line 70
    sget-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->TRANSLATION_HTML_BLOCK_TAG_PATTERN:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->translationHtmlBlockTagPattern:Ljava/lang/String;

    .line 71
    sget-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->TRANSLATION_HTML_INLINE_TAG_PATTERN:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->translationHtmlInlineTagPattern:Ljava/lang/String;

    .line 72
    sget-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->BLOCK_QUOTE_BLANK_LINES:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->blockQuoteBlankLines:Z

    .line 73
    sget-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->BLOCK_QUOTE_MARKERS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/format/options/BlockQuoteMarker;

    iput-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->blockQuoteMarkers:Lcom/vladsch/flexmark/util/format/options/BlockQuoteMarker;

    .line 74
    sget-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->INDENTED_CODE_MINIMIZE_INDENT:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->indentedCodeMinimizeIndent:Z

    .line 75
    sget-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->FENCED_CODE_MINIMIZE_INDENT:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->fencedCodeMinimizeIndent:Z

    .line 76
    sget-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->FENCED_CODE_MATCH_CLOSING_MARKER:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->fencedCodeMatchClosingMarker:Z

    .line 77
    sget-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->FENCED_CODE_SPACE_BEFORE_INFO:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->fencedCodeSpaceBeforeInfo:Z

    .line 78
    sget-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->FENCED_CODE_MARKER_LENGTH:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->fencedCodeMarkerLength:I

    .line 79
    sget-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->FENCED_CODE_MARKER_TYPE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/format/options/CodeFenceMarker;

    iput-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->fencedCodeMarkerType:Lcom/vladsch/flexmark/util/format/options/CodeFenceMarker;

    .line 80
    sget-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->LIST_ADD_BLANK_LINE_BEFORE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->listAddBlankLineBefore:Z

    .line 83
    sget-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->LIST_RENUMBER_ITEMS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->listRenumberItems:Z

    .line 84
    sget-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->LIST_REMOVE_EMPTY_ITEMS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->listRemoveEmptyItems:Z

    .line 85
    sget-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->LIST_BULLET_MARKER:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;

    iput-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->listBulletMarker:Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;

    .line 86
    sget-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->LIST_NUMBERED_MARKER:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;

    iput-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->listNumberedMarker:Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;

    .line 87
    sget-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->LIST_SPACING:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    iput-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->listSpacing:Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    .line 88
    sget-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->REFERENCE_PLACEMENT:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    iput-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->referencePlacement:Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    .line 89
    sget-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->REFERENCE_SORT:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;

    iput-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->referenceSort:Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;

    .line 90
    sget-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->KEEP_IMAGE_LINKS_AT_START:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->keepImageLinksAtStart:Z

    .line 91
    sget-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->KEEP_EXPLICIT_LINKS_AT_START:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->keepExplicitLinksAtStart:Z

    .line 92
    sget-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->FORMAT_CHAR_WIDTH_PROVIDER:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/mappers/CharWidthProvider;

    iput-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->charWidthProvider:Lcom/vladsch/flexmark/util/mappers/CharWidthProvider;

    .line 93
    sget-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->KEEP_HARD_LINE_BREAKS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->keepHardLineBreaks:Z

    .line 94
    sget-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->KEEP_SOFT_LINE_BREAKS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->keepSoftLineBreaks:Z

    .line 95
    sget-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->APPEND_TRANSFERRED_REFERENCES:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->appendTransferredReferences:Z

    .line 96
    sget-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->OPTIMIZED_INLINE_RENDERING:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->optimizedInlineRendering:Z

    return-void
.end method
