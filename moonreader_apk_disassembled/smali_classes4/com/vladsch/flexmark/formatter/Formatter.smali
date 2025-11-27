.class public Lcom/vladsch/flexmark/formatter/Formatter;
.super Ljava/lang/Object;
.source "Formatter.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/IRender;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;,
        Lcom/vladsch/flexmark/formatter/Formatter$FormatterExtension;,
        Lcom/vladsch/flexmark/formatter/Formatter$Builder;
    }
.end annotation


# static fields
.field public static final APPEND_TRANSFERRED_REFERENCES:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final ATX_HEADER_TRAILING_MARKER:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/util/format/options/EqualizeTrailingMarker;",
            ">;"
        }
    .end annotation
.end field

.field public static final BLOCK_QUOTE_BLANK_LINES:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final BLOCK_QUOTE_MARKERS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/util/format/options/BlockQuoteMarker;",
            ">;"
        }
    .end annotation
.end field

.field public static final CHAR_WIDTH_PROVIDER:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/util/mappers/CharWidthProvider;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final FENCED_CODE_MARKER_LENGTH:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final FENCED_CODE_MARKER_TYPE:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/util/format/options/CodeFenceMarker;",
            ">;"
        }
    .end annotation
.end field

.field public static final FENCED_CODE_MATCH_CLOSING_MARKER:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final FENCED_CODE_MINIMIZE_INDENT:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final FENCED_CODE_SPACE_BEFORE_INFO:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final FORMATTER_EMULATION_PROFILE:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/parser/ParserEmulationProfile;",
            ">;"
        }
    .end annotation
.end field

.field public static final FORMAT_ALL_OPTIONS:I = 0x7

.field public static final FORMAT_CHAR_WIDTH_PROVIDER:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/util/mappers/CharWidthProvider;",
            ">;"
        }
    .end annotation
.end field

.field public static final FORMAT_COLLAPSE_WHITESPACE:I = 0x2

.field public static final FORMAT_CONVERT_TABS:I = 0x1

.field public static final FORMAT_FLAGS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final FORMAT_SUPPRESS_TRAILING_WHITESPACE:I = 0x4

.field public static final FORMAT_TABLE_CAPTION:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;",
            ">;"
        }
    .end annotation
.end field

.field public static final FORMAT_TABLE_CAPTION_SPACES:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;",
            ">;"
        }
    .end annotation
.end field

.field public static final FORMAT_TABLE_INDENT_PREFIX:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final INDENTED_CODE_MINIMIZE_INDENT:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final KEEP_EXPLICIT_LINKS_AT_START:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final KEEP_HARD_LINE_BREAKS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final KEEP_IMAGE_LINKS_AT_START:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final KEEP_SOFT_LINE_BREAKS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final LIST_ADD_BLANK_LINE_BEFORE:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final LIST_BULLET_MARKER:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;",
            ">;"
        }
    .end annotation
.end field

.field public static final LIST_NUMBERED_MARKER:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;",
            ">;"
        }
    .end annotation
.end field

.field public static final LIST_REMOVE_EMPTY_ITEMS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final LIST_RENUMBER_ITEMS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final LIST_SPACING:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/util/format/options/ListSpacing;",
            ">;"
        }
    .end annotation
.end field

.field public static final MAX_BLANK_LINES:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final MAX_TRAILING_BLANK_LINES:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final NULL_ITERABLE:Ljava/lang/Iterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation
.end field

.field private static final NULL_ITERATOR:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator<",
            "+",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation
.end field

.field public static final OPTIMIZED_INLINE_RENDERING:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final REFERENCE_PLACEMENT:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/util/format/options/ElementPlacement;",
            ">;"
        }
    .end annotation
.end field

.field public static final REFERENCE_SORT:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;",
            ">;"
        }
    .end annotation
.end field

.field public static final SETEXT_HEADER_EQUALIZE_MARKER:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final SPACE_AFTER_ATX_MARKER:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;",
            ">;"
        }
    .end annotation
.end field

.field public static final THEMATIC_BREAK:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final TRANSLATION_EXCLUDE_PATTERN:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final TRANSLATION_HTML_BLOCK_PREFIX:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final TRANSLATION_HTML_BLOCK_TAG_PATTERN:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final TRANSLATION_HTML_INLINE_TAG_PATTERN:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final TRANSLATION_ID_FORMAT:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final builder:Lcom/vladsch/flexmark/formatter/Formatter$Builder;

.field final formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

.field final nodeFormatterFactories:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/formatter/NodeFormatterFactory;",
            ">;"
        }
    .end annotation
.end field

.field private final options:Lcom/vladsch/flexmark/util/options/DataHolder;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 44
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const/4 v1, 0x0

    .line 63
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    .line 44
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v3, "FORMAT_FLAGS"

    invoke-direct {v0, v3, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->FORMAT_FLAGS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 52
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const/4 v1, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v3, "MAX_BLANK_LINES"

    invoke-direct {v0, v3, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->MAX_BLANK_LINES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 53
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const/4 v1, 0x1

    .line 55
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    .line 53
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v4, "MAX_TRAILING_BLANK_LINES"

    invoke-direct {v0, v4, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->MAX_TRAILING_BLANK_LINES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 54
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "SPACE_AFTER_ATX_MARKER"

    sget-object v4, Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;->ADD:Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;

    invoke-direct {v0, v1, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->SPACE_AFTER_ATX_MARKER:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 55
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "SETEXT_HEADER_EQUALIZE_MARKER"

    invoke-direct {v0, v1, v3}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->SETEXT_HEADER_EQUALIZE_MARKER:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 56
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "ATX_HEADER_TRAILING_MARKER"

    sget-object v4, Lcom/vladsch/flexmark/util/format/options/EqualizeTrailingMarker;->AS_IS:Lcom/vladsch/flexmark/util/format/options/EqualizeTrailingMarker;

    invoke-direct {v0, v1, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->ATX_HEADER_TRAILING_MARKER:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 57
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const/4 v1, 0x0

    move-object v4, v1

    check-cast v4, Ljava/lang/String;

    const-string v4, "THEMATIC_BREAK"

    invoke-direct {v0, v4, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->THEMATIC_BREAK:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 58
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "BLOCK_QUOTE_BLANK_LINES"

    invoke-direct {v0, v1, v3}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->BLOCK_QUOTE_BLANK_LINES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 59
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "BLOCK_QUOTE_MARKERS"

    sget-object v4, Lcom/vladsch/flexmark/util/format/options/BlockQuoteMarker;->ADD_COMPACT_WITH_SPACE:Lcom/vladsch/flexmark/util/format/options/BlockQuoteMarker;

    invoke-direct {v0, v1, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->BLOCK_QUOTE_MARKERS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 60
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "INDENTED_CODE_MINIMIZE_INDENT"

    invoke-direct {v0, v1, v3}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->INDENTED_CODE_MINIMIZE_INDENT:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 61
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "FENCED_CODE_MINIMIZE_INDENT"

    invoke-direct {v0, v1, v3}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->FENCED_CODE_MINIMIZE_INDENT:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 62
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "FENCED_CODE_MATCH_CLOSING_MARKER"

    invoke-direct {v0, v1, v3}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->FENCED_CODE_MATCH_CLOSING_MARKER:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 63
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "FENCED_CODE_SPACE_BEFORE_INFO"

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->FENCED_CODE_SPACE_BEFORE_INFO:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 64
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const/4 v1, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v4, "FENCED_CODE_MARKER_LENGTH"

    invoke-direct {v0, v4, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->FENCED_CODE_MARKER_LENGTH:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 65
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "FENCED_CODE_MARKER_TYPE"

    sget-object v4, Lcom/vladsch/flexmark/util/format/options/CodeFenceMarker;->ANY:Lcom/vladsch/flexmark/util/format/options/CodeFenceMarker;

    invoke-direct {v0, v1, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->FENCED_CODE_MARKER_TYPE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 66
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "LIST_ADD_BLANK_LINE_BEFORE"

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->LIST_ADD_BLANK_LINE_BEFORE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 69
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "LIST_RENUMBER_ITEMS"

    invoke-direct {v0, v1, v3}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->LIST_RENUMBER_ITEMS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 70
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "LIST_REMOVE_EMPTY_ITEMS"

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->LIST_REMOVE_EMPTY_ITEMS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 71
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "LIST_BULLET_MARKER"

    sget-object v4, Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;->ANY:Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;

    invoke-direct {v0, v1, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->LIST_BULLET_MARKER:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 72
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "LIST_NUMBERED_MARKER"

    sget-object v4, Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;->ANY:Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;

    invoke-direct {v0, v1, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->LIST_NUMBERED_MARKER:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 73
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "LIST_SPACING"

    sget-object v4, Lcom/vladsch/flexmark/util/format/options/ListSpacing;->AS_IS:Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    invoke-direct {v0, v1, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->LIST_SPACING:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 74
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "REFERENCE_PLACEMENT"

    sget-object v4, Lcom/vladsch/flexmark/util/format/options/ElementPlacement;->AS_IS:Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    invoke-direct {v0, v1, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->REFERENCE_PLACEMENT:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 75
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "REFERENCE_SORT"

    sget-object v4, Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;->AS_IS:Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;

    invoke-direct {v0, v1, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->REFERENCE_SORT:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 76
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "KEEP_IMAGE_LINKS_AT_START"

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->KEEP_IMAGE_LINKS_AT_START:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 77
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "KEEP_EXPLICIT_LINKS_AT_START"

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->KEEP_EXPLICIT_LINKS_AT_START:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 78
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "OPTIMIZED_INLINE_RENDERING"

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->OPTIMIZED_INLINE_RENDERING:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 81
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_CHAR_WIDTH_PROVIDER:Lcom/vladsch/flexmark/util/options/DataKey;

    sput-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->FORMAT_CHAR_WIDTH_PROVIDER:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 86
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_CHAR_WIDTH_PROVIDER:Lcom/vladsch/flexmark/util/options/DataKey;

    sput-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->CHAR_WIDTH_PROVIDER:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 88
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_CAPTION:Lcom/vladsch/flexmark/util/options/DataKey;

    sput-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->FORMAT_TABLE_CAPTION:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 89
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_CAPTION_SPACES:Lcom/vladsch/flexmark/util/options/DataKey;

    sput-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->FORMAT_TABLE_CAPTION_SPACES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 90
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_INDENT_PREFIX:Lcom/vladsch/flexmark/util/options/DataKey;

    sput-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->FORMAT_TABLE_INDENT_PREFIX:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 93
    new-instance v0, Lcom/vladsch/flexmark/util/collection/DynamicDefaultKey;

    const-string v1, "FORMATTER_EMULATION_PROFILE"

    sget-object v4, Lcom/vladsch/flexmark/parser/Parser;->PARSER_EMULATION_PROFILE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-direct {v0, v1, v4}, Lcom/vladsch/flexmark/util/collection/DynamicDefaultKey;-><init>(Ljava/lang/String;Lcom/vladsch/flexmark/util/options/DataKey;)V

    sput-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->FORMATTER_EMULATION_PROFILE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 96
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "TRANSLATION_ID_FORMAT"

    const-string v4, "_%d_"

    invoke-direct {v0, v1, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->TRANSLATION_ID_FORMAT:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 97
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "TRANSLATION_HTML_BLOCK_PREFIX"

    const-string v4, "_"

    invoke-direct {v0, v1, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->TRANSLATION_HTML_BLOCK_PREFIX:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 98
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "TRANSLATION_EXCLUDE_PATTERN"

    const-string v4, "^[^\\p{IsAlphabetic}]*$"

    invoke-direct {v0, v1, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->TRANSLATION_EXCLUDE_PATTERN:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 99
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->TRANSLATION_HTML_BLOCK_TAG_PATTERN:Lcom/vladsch/flexmark/util/options/DataKey;

    sput-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->TRANSLATION_HTML_BLOCK_TAG_PATTERN:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 100
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->TRANSLATION_HTML_INLINE_TAG_PATTERN:Lcom/vladsch/flexmark/util/options/DataKey;

    sput-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->TRANSLATION_HTML_INLINE_TAG_PATTERN:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 102
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "KEEP_HARD_LINE_BREAKS"

    invoke-direct {v0, v1, v3}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->KEEP_HARD_LINE_BREAKS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 103
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "KEEP_SOFT_LINE_BREAKS"

    invoke-direct {v0, v1, v3}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->KEEP_SOFT_LINE_BREAKS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 104
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "APPEND_TRANSFERRED_REFERENCES"

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->APPEND_TRANSFERRED_REFERENCES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 340
    new-instance v0, Lcom/vladsch/flexmark/formatter/Formatter$2;

    invoke-direct {v0}, Lcom/vladsch/flexmark/formatter/Formatter$2;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->NULL_ITERATOR:Ljava/util/Iterator;

    .line 356
    new-instance v0, Lcom/vladsch/flexmark/formatter/Formatter$3;

    invoke-direct {v0}, Lcom/vladsch/flexmark/formatter/Formatter$3;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->NULL_ITERABLE:Ljava/lang/Iterable;

    return-void
.end method

.method private constructor <init>(Lcom/vladsch/flexmark/formatter/Formatter$Builder;)V
    .locals 2

    .line 111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 112
    new-instance v0, Lcom/vladsch/flexmark/formatter/Formatter$Builder;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/formatter/Formatter$Builder;-><init>(Lcom/vladsch/flexmark/formatter/Formatter$Builder;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter;->builder:Lcom/vladsch/flexmark/formatter/Formatter$Builder;

    .line 113
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataSet;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/util/options/DataSet;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter;->options:Lcom/vladsch/flexmark/util/options/DataHolder;

    .line 114
    new-instance v1, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    invoke-direct {v1, v0}, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    iput-object v1, p0, Lcom/vladsch/flexmark/formatter/Formatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    .line 115
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p1, Lcom/vladsch/flexmark/formatter/Formatter$Builder;->nodeFormatterFactories:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter;->nodeFormatterFactories:Ljava/util/List;

    .line 116
    iget-object p1, p1, Lcom/vladsch/flexmark/formatter/Formatter$Builder;->nodeFormatterFactories:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 119
    new-instance p1, Lcom/vladsch/flexmark/formatter/Formatter$1;

    invoke-direct {p1, p0}, Lcom/vladsch/flexmark/formatter/Formatter$1;-><init>(Lcom/vladsch/flexmark/formatter/Formatter;)V

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/vladsch/flexmark/formatter/Formatter$Builder;Lcom/vladsch/flexmark/formatter/Formatter$1;)V
    .locals 0

    .line 40
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/formatter/Formatter;-><init>(Lcom/vladsch/flexmark/formatter/Formatter$Builder;)V

    return-void
.end method

.method public static builder()Lcom/vladsch/flexmark/formatter/Formatter$Builder;
    .locals 1

    .line 150
    new-instance v0, Lcom/vladsch/flexmark/formatter/Formatter$Builder;

    invoke-direct {v0}, Lcom/vladsch/flexmark/formatter/Formatter$Builder;-><init>()V

    return-object v0
.end method

.method public static builder(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/formatter/Formatter$Builder;
    .locals 1

    .line 160
    new-instance v0, Lcom/vladsch/flexmark/formatter/Formatter$Builder;

    invoke-direct {v0, p0}, Lcom/vladsch/flexmark/formatter/Formatter$Builder;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    return-object v0
.end method


# virtual methods
.method public getOptions()Lcom/vladsch/flexmark/util/options/DataHolder;
    .locals 2

    .line 141
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataSet;

    iget-object v1, p0, Lcom/vladsch/flexmark/formatter/Formatter;->builder:Lcom/vladsch/flexmark/formatter/Formatter$Builder;

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/options/DataSet;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    return-object v0
.end method

.method public getTranslationHandler()Lcom/vladsch/flexmark/formatter/TranslationHandler;
    .locals 4

    .line 136
    new-instance v0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;

    iget-object v1, p0, Lcom/vladsch/flexmark/formatter/Formatter;->options:Lcom/vladsch/flexmark/util/options/DataHolder;

    iget-object v2, p0, Lcom/vladsch/flexmark/formatter/Formatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    new-instance v3, Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator$Factory;

    invoke-direct {v3}, Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator$Factory;-><init>()V

    invoke-direct {v0, v1, v2, v3}, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;Lcom/vladsch/flexmark/html/renderer/HtmlIdGeneratorFactory;)V

    return-object v0
.end method

.method public getTranslationHandler(Lcom/vladsch/flexmark/formatter/TranslationHandlerFactory;Lcom/vladsch/flexmark/html/renderer/HtmlIdGeneratorFactory;)Lcom/vladsch/flexmark/formatter/TranslationHandler;
    .locals 2

    .line 128
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter;->options:Lcom/vladsch/flexmark/util/options/DataHolder;

    iget-object v1, p0, Lcom/vladsch/flexmark/formatter/Formatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    invoke-interface {p1, v0, v1, p2}, Lcom/vladsch/flexmark/formatter/TranslationHandlerFactory;->create(Lcom/vladsch/flexmark/util/options/DataHolder;Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;Lcom/vladsch/flexmark/html/renderer/HtmlIdGeneratorFactory;)Lcom/vladsch/flexmark/formatter/TranslationHandler;

    move-result-object p1

    return-object p1
.end method

.method public getTranslationHandler(Lcom/vladsch/flexmark/html/renderer/HtmlIdGeneratorFactory;)Lcom/vladsch/flexmark/formatter/TranslationHandler;
    .locals 3

    .line 132
    new-instance v0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;

    iget-object v1, p0, Lcom/vladsch/flexmark/formatter/Formatter;->options:Lcom/vladsch/flexmark/util/options/DataHolder;

    iget-object v2, p0, Lcom/vladsch/flexmark/formatter/Formatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    invoke-direct {v0, v1, v2, p1}, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;Lcom/vladsch/flexmark/html/renderer/HtmlIdGeneratorFactory;)V

    return-object v0
.end method

.method public render(Lcom/vladsch/flexmark/util/ast/Node;)Ljava/lang/String;
    .locals 1

    .line 194
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 195
    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/formatter/Formatter;->render(Lcom/vladsch/flexmark/util/ast/Node;Ljava/lang/Appendable;)V

    .line 196
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public render(Lcom/vladsch/flexmark/util/ast/Node;Ljava/lang/Appendable;)V
    .locals 6

    .line 170
    new-instance v0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;

    iget-object v2, p0, Lcom/vladsch/flexmark/formatter/Formatter;->options:Lcom/vladsch/flexmark/util/options/DataHolder;

    new-instance v3, Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    iget-object v1, p0, Lcom/vladsch/flexmark/formatter/Formatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget v1, v1, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->formatFlags:I

    invoke-direct {v3, p2, v1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;-><init>(Ljava/lang/Appendable;I)V

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getDocument()Lcom/vladsch/flexmark/util/ast/Document;

    move-result-object v4

    const/4 v5, 0x0

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;-><init>(Lcom/vladsch/flexmark/formatter/Formatter;Lcom/vladsch/flexmark/util/options/DataHolder;Lcom/vladsch/flexmark/formatter/MarkdownWriter;Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/formatter/TranslationHandler;)V

    .line 171
    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->render(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 172
    iget-object p1, v1, Lcom/vladsch/flexmark/formatter/Formatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget p1, p1, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->maxTrailingBlankLines:I

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->flush(I)V

    return-void
.end method

.method public render(Lcom/vladsch/flexmark/util/ast/Node;Ljava/lang/Appendable;I)V
    .locals 6

    .line 182
    new-instance v0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;

    iget-object v2, p0, Lcom/vladsch/flexmark/formatter/Formatter;->options:Lcom/vladsch/flexmark/util/options/DataHolder;

    new-instance v3, Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    iget-object v1, p0, Lcom/vladsch/flexmark/formatter/Formatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget v1, v1, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->formatFlags:I

    invoke-direct {v3, p2, v1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;-><init>(Ljava/lang/Appendable;I)V

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getDocument()Lcom/vladsch/flexmark/util/ast/Document;

    move-result-object v4

    const/4 v5, 0x0

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;-><init>(Lcom/vladsch/flexmark/formatter/Formatter;Lcom/vladsch/flexmark/util/options/DataHolder;Lcom/vladsch/flexmark/formatter/MarkdownWriter;Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/formatter/TranslationHandler;)V

    .line 183
    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->render(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 184
    invoke-virtual {v0, p3}, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->flush(I)V

    return-void
.end method

.method public translationRender(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/TranslationHandler;Lcom/vladsch/flexmark/formatter/RenderPurpose;)Ljava/lang/String;
    .locals 1

    .line 232
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 233
    invoke-virtual {p0, p1, v0, p2, p3}, Lcom/vladsch/flexmark/formatter/Formatter;->translationRender(Lcom/vladsch/flexmark/util/ast/Node;Ljava/lang/Appendable;Lcom/vladsch/flexmark/formatter/TranslationHandler;Lcom/vladsch/flexmark/formatter/RenderPurpose;)V

    .line 234
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public translationRender(Lcom/vladsch/flexmark/util/ast/Node;Ljava/lang/Appendable;ILcom/vladsch/flexmark/formatter/TranslationHandler;Lcom/vladsch/flexmark/formatter/RenderPurpose;)V
    .locals 6

    .line 219
    invoke-interface {p4, p5}, Lcom/vladsch/flexmark/formatter/TranslationHandler;->setRenderPurpose(Lcom/vladsch/flexmark/formatter/RenderPurpose;)V

    .line 220
    new-instance v0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;

    iget-object v2, p0, Lcom/vladsch/flexmark/formatter/Formatter;->options:Lcom/vladsch/flexmark/util/options/DataHolder;

    new-instance v3, Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    iget-object p5, p0, Lcom/vladsch/flexmark/formatter/Formatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget p5, p5, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->formatFlags:I

    invoke-direct {v3, p2, p5}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;-><init>(Ljava/lang/Appendable;I)V

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getDocument()Lcom/vladsch/flexmark/util/ast/Document;

    move-result-object v4

    move-object v1, p0

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;-><init>(Lcom/vladsch/flexmark/formatter/Formatter;Lcom/vladsch/flexmark/util/options/DataHolder;Lcom/vladsch/flexmark/formatter/MarkdownWriter;Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/formatter/TranslationHandler;)V

    .line 221
    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->render(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 222
    invoke-virtual {v0, p3}, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->flush(I)V

    return-void
.end method

.method public translationRender(Lcom/vladsch/flexmark/util/ast/Node;Ljava/lang/Appendable;Lcom/vladsch/flexmark/formatter/TranslationHandler;Lcom/vladsch/flexmark/formatter/RenderPurpose;)V
    .locals 6

    .line 206
    invoke-interface {p3, p4}, Lcom/vladsch/flexmark/formatter/TranslationHandler;->setRenderPurpose(Lcom/vladsch/flexmark/formatter/RenderPurpose;)V

    .line 207
    new-instance v0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;

    iget-object v2, p0, Lcom/vladsch/flexmark/formatter/Formatter;->options:Lcom/vladsch/flexmark/util/options/DataHolder;

    new-instance v3, Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    iget-object p4, p0, Lcom/vladsch/flexmark/formatter/Formatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget p4, p4, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->formatFlags:I

    invoke-direct {v3, p2, p4}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;-><init>(Ljava/lang/Appendable;I)V

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getDocument()Lcom/vladsch/flexmark/util/ast/Document;

    move-result-object v4

    move-object v1, p0

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;-><init>(Lcom/vladsch/flexmark/formatter/Formatter;Lcom/vladsch/flexmark/util/options/DataHolder;Lcom/vladsch/flexmark/formatter/MarkdownWriter;Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/formatter/TranslationHandler;)V

    .line 208
    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->render(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 209
    iget-object p1, v1, Lcom/vladsch/flexmark/formatter/Formatter;->formatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget p1, p1, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->maxTrailingBlankLines:I

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->flush(I)V

    return-void
.end method

.method public withOptions(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/formatter/Formatter;
    .locals 3

    if-nez p1, :cond_0

    return-object p0

    .line 238
    :cond_0
    new-instance v0, Lcom/vladsch/flexmark/formatter/Formatter;

    new-instance v1, Lcom/vladsch/flexmark/formatter/Formatter$Builder;

    iget-object v2, p0, Lcom/vladsch/flexmark/formatter/Formatter;->builder:Lcom/vladsch/flexmark/formatter/Formatter$Builder;

    invoke-direct {v1, v2, p1}, Lcom/vladsch/flexmark/formatter/Formatter$Builder;-><init>(Lcom/vladsch/flexmark/formatter/Formatter$Builder;Lcom/vladsch/flexmark/util/options/DataHolder;)V

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/formatter/Formatter;-><init>(Lcom/vladsch/flexmark/formatter/Formatter$Builder;)V

    return-object v0
.end method

.method public bridge synthetic withOptions(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/util/IRender;
    .locals 0

    .line 39
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/formatter/Formatter;->withOptions(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/formatter/Formatter;

    move-result-object p1

    return-object p1
.end method
