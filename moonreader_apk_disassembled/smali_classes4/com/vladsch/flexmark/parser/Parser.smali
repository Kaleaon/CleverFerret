.class public Lcom/vladsch/flexmark/parser/Parser;
.super Ljava/lang/Object;
.source "Parser.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/IParse;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/parser/Parser$ReferenceHoldingExtension;,
        Lcom/vladsch/flexmark/parser/Parser$ParserExtension;,
        Lcom/vladsch/flexmark/parser/Parser$Builder;
    }
.end annotation


# static fields
.field public static final ASTERISK_DELIMITER_PROCESSOR:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final BLANK_LINES_IN_AST:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final BLOCK_QUOTE_ALLOW_LEADING_SPACE:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final BLOCK_QUOTE_EXTEND_TO_BLANK_LINE:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final BLOCK_QUOTE_IGNORE_BLANK_LINE:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final BLOCK_QUOTE_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final BLOCK_QUOTE_INTERRUPTS_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final BLOCK_QUOTE_PARSER:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final BLOCK_QUOTE_TO_BLANK_LINE:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final BLOCK_QUOTE_WITH_LEAD_SPACES_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final CODE_BLOCK_INDENT:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final CODE_CONTENT_BLOCK:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final CODE_SOFT_LINE_BREAKS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final EXTENSIONS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Iterable<",
            "Lcom/vladsch/flexmark/util/builder/Extension;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final FENCED_CODE_BLOCK_PARSER:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final FENCED_CODE_CONTENT_BLOCK:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final HARD_LINE_BREAK_LIMIT:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final HEADING_CAN_INTERRUPT_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final HEADING_NO_ATX_SPACE:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final HEADING_NO_EMPTY_HEADING_WITHOUT_SPACE:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final HEADING_NO_LEAD_SPACE:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final HEADING_PARSER:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final HEADING_SETEXT_MARKER_LENGTH:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final HTML_BLOCK_COMMENT_ONLY_FULL_LINE:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final HTML_BLOCK_DEEP_PARSER:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final HTML_BLOCK_DEEP_PARSE_BLANK_LINE_INTERRUPTS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final HTML_BLOCK_DEEP_PARSE_BLANK_LINE_INTERRUPTS_PARTIAL_TAG:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final HTML_BLOCK_DEEP_PARSE_FIRST_OPEN_TAG_ON_ONE_LINE:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final HTML_BLOCK_DEEP_PARSE_INDENTED_CODE_INTERRUPTS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final HTML_BLOCK_DEEP_PARSE_MARKDOWN_INTERRUPTS_CLOSED:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final HTML_BLOCK_DEEP_PARSE_NON_BLOCK:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final HTML_BLOCK_PARSER:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final HTML_BLOCK_START_ONLY_ON_BLOCK_TAGS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final HTML_BLOCK_TAGS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final HTML_COMMENT_BLOCKS_INTERRUPT_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final HTML_FOR_TRANSLATOR:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final INDENTED_CODE_BLOCK_PARSER:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final INDENTED_CODE_NO_TRAILING_BLANK_LINES:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final INLINE_DELIMITER_DIRECTIONAL_PUNCTUATIONS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final INTELLIJ_DUMMY_IDENTIFIER:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final LINKS_ALLOW_MATCHED_PARENTHESES:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final LISTS_AUTO_LOOSE:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final LISTS_AUTO_LOOSE_ONE_LEVEL_LISTS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final LISTS_BULLET_ITEM_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final LISTS_BULLET_ITEM_INTERRUPTS_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final LISTS_CODE_INDENT:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final LISTS_DELIMITER_MISMATCH_TO_NEW_LIST:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final LISTS_EMPTY_BULLET_ITEM_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final LISTS_EMPTY_BULLET_ITEM_INTERRUPTS_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final LISTS_EMPTY_BULLET_SUB_ITEM_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final LISTS_EMPTY_ORDERED_ITEM_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final LISTS_EMPTY_ORDERED_ITEM_INTERRUPTS_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final LISTS_EMPTY_ORDERED_NON_ONE_ITEM_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final LISTS_EMPTY_ORDERED_NON_ONE_ITEM_INTERRUPTS_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final LISTS_EMPTY_ORDERED_NON_ONE_SUB_ITEM_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final LISTS_EMPTY_ORDERED_SUB_ITEM_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final LISTS_END_ON_DOUBLE_BLANK:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final LISTS_ITEM_CONTENT_AFTER_SUFFIX:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final LISTS_ITEM_INDENT:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final LISTS_ITEM_MARKER_SPACE:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final LISTS_ITEM_MARKER_SUFFIXES:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "[",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final LISTS_ITEM_PREFIX_CHARS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final LISTS_ITEM_TYPE_MISMATCH_TO_NEW_LIST:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final LISTS_ITEM_TYPE_MISMATCH_TO_SUB_LIST:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final LISTS_LOOSE_WHEN_BLANK_LINE_FOLLOWS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final LISTS_LOOSE_WHEN_CONTAINS_BLANK_LINE:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final LISTS_LOOSE_WHEN_HAS_LOOSE_SUB_ITEM:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final LISTS_LOOSE_WHEN_HAS_NON_LIST_CHILDREN:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final LISTS_LOOSE_WHEN_HAS_TRAILING_BLANK_LINE:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final LISTS_LOOSE_WHEN_LAST_ITEM_PREV_HAS_TRAILING_BLANK_LINE:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final LISTS_LOOSE_WHEN_PREV_HAS_TRAILING_BLANK_LINE:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final LISTS_NEW_ITEM_CODE_INDENT:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final LISTS_NUMBERED_ITEM_MARKER_SUFFIXED:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final LISTS_ORDERED_ITEM_DOT_ONLY:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final LISTS_ORDERED_ITEM_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final LISTS_ORDERED_ITEM_INTERRUPTS_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final LISTS_ORDERED_LIST_MANUAL_START:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final LISTS_ORDERED_NON_ONE_ITEM_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final LISTS_ORDERED_NON_ONE_ITEM_INTERRUPTS_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final LIST_BLOCK_PARSER:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final MATCH_CLOSING_FENCE_CHARACTERS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final MATCH_NESTED_LINK_REFS_FIRST:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final PARSER_EMULATION_FAMILY:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/parser/ParserEmulationProfile;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final PARSER_EMULATION_PROFILE:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/parser/ParserEmulationProfile;",
            ">;"
        }
    .end annotation
.end field

.field public static final PARSE_INNER_HTML_COMMENTS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final PARSE_JEKYLL_MACROS_IN_URLS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final PARSE_MULTI_LINE_IMAGE_URLS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final REFERENCES:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/ast/util/ReferenceRepository;",
            ">;"
        }
    .end annotation
.end field

.field public static final REFERENCES_KEEP:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/util/KeepType;",
            ">;"
        }
    .end annotation
.end field

.field public static final REFERENCE_PARAGRAPH_PRE_PROCESSOR:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final SPACE_IN_LINK_ELEMENTS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final SPACE_IN_LINK_URLS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final STRONG_WRAPS_EMPHASIS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final THEMATIC_BREAK_PARSER:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final THEMATIC_BREAK_RELAXED_START:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final TRACK_DOCUMENT_LINES:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
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

.field public static final UNDERSCORE_DELIMITER_PROCESSOR:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final WWW_AUTO_LINK_ELEMENT:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final blockParserFactories:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/block/CustomBlockParserFactory;",
            ">;"
        }
    .end annotation
.end field

.field private final blockPreProcessorDependencies:Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencies;

.field private final builder:Lcom/vladsch/flexmark/parser/Parser$Builder;

.field private final delimiterCharacters:Ljava/util/BitSet;

.field private final delimiterProcessors:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Character;",
            "Lcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;",
            ">;"
        }
    .end annotation
.end field

.field private final inlineParserExtensionFactories:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/InlineParserExtensionFactory;",
            ">;"
        }
    .end annotation
.end field

.field private final inlineParserFactory:Lcom/vladsch/flexmark/parser/InlineParserFactory;

.field private final linkRefProcessors:Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;

.field private final options:Lcom/vladsch/flexmark/util/options/DataHolder;

.field private final paragraphPreProcessorFactories:Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencies;

.field private final postProcessorDependencies:Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencies;

.field private final specialCharacters:Ljava/util/BitSet;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 43
    sget-object v0, Lcom/vladsch/flexmark/util/builder/BuilderBase;->EXTENSIONS:Lcom/vladsch/flexmark/util/options/DataKey;

    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->EXTENSIONS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 45
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "REFERENCES_KEEP"

    sget-object v2, Lcom/vladsch/flexmark/util/KeepType;->FIRST:Lcom/vladsch/flexmark/util/KeepType;

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->REFERENCES_KEEP:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 46
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    new-instance v1, Lcom/vladsch/flexmark/parser/Parser$1;

    invoke-direct {v1}, Lcom/vladsch/flexmark/parser/Parser$1;-><init>()V

    const-string v2, "REFERENCES"

    invoke-direct {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Lcom/vladsch/flexmark/util/collection/DataValueFactory;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->REFERENCES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 53
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const-string v3, "ASTERISK_DELIMITER_PROCESSOR"

    invoke-direct {v0, v3, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->ASTERISK_DELIMITER_PROCESSOR:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 55
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    const-string v5, "TRACK_DOCUMENT_LINES"

    invoke-direct {v0, v5, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->TRACK_DOCUMENT_LINES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 57
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v5, "BLOCK_QUOTE_PARSER"

    invoke-direct {v0, v5, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->BLOCK_QUOTE_PARSER:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 58
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v5, "BLOCK_QUOTE_EXTEND_TO_BLANK_LINE"

    invoke-direct {v0, v5, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->BLOCK_QUOTE_EXTEND_TO_BLANK_LINE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 59
    new-instance v5, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v6, "BLOCK_QUOTE_IGNORE_BLANK_LINE"

    invoke-direct {v5, v6, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v5, Lcom/vladsch/flexmark/parser/Parser;->BLOCK_QUOTE_IGNORE_BLANK_LINE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 60
    new-instance v5, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v6, "BLOCK_QUOTE_ALLOW_LEADING_SPACE"

    invoke-direct {v5, v6, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v5, Lcom/vladsch/flexmark/parser/Parser;->BLOCK_QUOTE_ALLOW_LEADING_SPACE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 61
    new-instance v5, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v6, "BLOCK_QUOTE_INTERRUPTS_PARAGRAPH"

    invoke-direct {v5, v6, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v5, Lcom/vladsch/flexmark/parser/Parser;->BLOCK_QUOTE_INTERRUPTS_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 62
    new-instance v5, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v6, "BLOCK_QUOTE_INTERRUPTS_ITEM_PARAGRAPH"

    invoke-direct {v5, v6, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v5, Lcom/vladsch/flexmark/parser/Parser;->BLOCK_QUOTE_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 63
    new-instance v5, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v6, "BLOCK_QUOTE_WITH_LEAD_SPACES_INTERRUPTS_ITEM_PARAGRAPH"

    invoke-direct {v5, v6, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v5, Lcom/vladsch/flexmark/parser/Parser;->BLOCK_QUOTE_WITH_LEAD_SPACES_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 69
    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->BLOCK_QUOTE_TO_BLANK_LINE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 71
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v5, "FENCED_CODE_BLOCK_PARSER"

    invoke-direct {v0, v5, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->FENCED_CODE_BLOCK_PARSER:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 72
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v5, "MATCH_CLOSING_FENCE_CHARACTERS"

    invoke-direct {v0, v5, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->MATCH_CLOSING_FENCE_CHARACTERS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 73
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v5, "FENCED_CODE_CONTENT_BLOCK"

    invoke-direct {v0, v5, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->FENCED_CODE_CONTENT_BLOCK:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 75
    new-instance v5, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v6, "CODE_SOFT_LINE_BREAKS"

    invoke-direct {v5, v6, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v5, Lcom/vladsch/flexmark/parser/Parser;->CODE_SOFT_LINE_BREAKS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 79
    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->CODE_CONTENT_BLOCK:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 81
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v5, "HARD_LINE_BREAK_LIMIT"

    invoke-direct {v0, v5, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->HARD_LINE_BREAK_LIMIT:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 83
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v5, "HEADING_PARSER"

    invoke-direct {v0, v5, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->HEADING_PARSER:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 84
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v5, "HEADING_SETEXT_MARKER_LENGTH"

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {v0, v5, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->HEADING_SETEXT_MARKER_LENGTH:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 85
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "HEADING_NO_ATX_SPACE"

    invoke-direct {v0, v1, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->HEADING_NO_ATX_SPACE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 86
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "HEADING_NO_EMPTY_HEADING_WITHOUT_SPACE"

    invoke-direct {v0, v1, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->HEADING_NO_EMPTY_HEADING_WITHOUT_SPACE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 87
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "HEADING_NO_LEAD_SPACE"

    invoke-direct {v0, v1, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->HEADING_NO_LEAD_SPACE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 88
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "HEADING_CAN_INTERRUPT_ITEM_PARAGRAPH"

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->HEADING_CAN_INTERRUPT_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 90
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "HTML_BLOCK_PARSER"

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_PARSER:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 91
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "HTML_COMMENT_BLOCKS_INTERRUPT_PARAGRAPH"

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->HTML_COMMENT_BLOCKS_INTERRUPT_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 92
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "HTML_FOR_TRANSLATOR"

    invoke-direct {v0, v1, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->HTML_FOR_TRANSLATOR:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 94
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "INLINE_DELIMITER_DIRECTIONAL_PUNCTUATIONS"

    invoke-direct {v0, v1, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->INLINE_DELIMITER_DIRECTIONAL_PUNCTUATIONS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 96
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "INDENTED_CODE_BLOCK_PARSER"

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->INDENTED_CODE_BLOCK_PARSER:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 97
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "INDENTED_CODE_NO_TRAILING_BLANK_LINES"

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->INDENTED_CODE_NO_TRAILING_BLANK_LINES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 99
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "INTELLIJ_DUMMY_IDENTIFIER"

    invoke-direct {v0, v1, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->INTELLIJ_DUMMY_IDENTIFIER:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 101
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "MATCH_NESTED_LINK_REFS_FIRST"

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->MATCH_NESTED_LINK_REFS_FIRST:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 102
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "PARSE_INNER_HTML_COMMENTS"

    invoke-direct {v0, v1, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->PARSE_INNER_HTML_COMMENTS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 103
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "PARSE_MULTI_LINE_IMAGE_URLS"

    invoke-direct {v0, v1, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->PARSE_MULTI_LINE_IMAGE_URLS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 104
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "PARSE_JEKYLL_MACROS_IN_URLS"

    invoke-direct {v0, v1, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->PARSE_JEKYLL_MACROS_IN_URLS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 105
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "SPACE_IN_LINK_URLS"

    invoke-direct {v0, v1, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->SPACE_IN_LINK_URLS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 106
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "SPACE_IN_LINK_ELEMENTS"

    invoke-direct {v0, v1, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->SPACE_IN_LINK_ELEMENTS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 107
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "WWW_AUTO_LINK_ELEMENT"

    invoke-direct {v0, v1, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->WWW_AUTO_LINK_ELEMENT:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 109
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "REFERENCE_BLOCK_PRE_PROCESSOR"

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->REFERENCE_PARAGRAPH_PRE_PROCESSOR:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 110
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "THEMATIC_BREAK_PARSER"

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->THEMATIC_BREAK_PARSER:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 111
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "THEMATIC_BREAK_RELAXED_START"

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->THEMATIC_BREAK_RELAXED_START:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 113
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "UNDERSCORE_DELIMITER_PROCESSOR"

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->UNDERSCORE_DELIMITER_PROCESSOR:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 114
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "BLANK_LINES_IN_AST"

    invoke-direct {v0, v1, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->BLANK_LINES_IN_AST:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 119
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "STRONG_WRAPS_EMPHASIS"

    invoke-direct {v0, v1, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->STRONG_WRAPS_EMPHASIS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 124
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "LINKS_ALLOW_MATCHED_PARENTHESES"

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->LINKS_ALLOW_MATCHED_PARENTHESES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 127
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "LIST_BLOCK_PARSER"

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->LIST_BLOCK_PARSER:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 128
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "PARSER_EMULATION_PROFILE"

    sget-object v5, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->COMMONMARK:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    invoke-direct {v0, v1, v5}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->PARSER_EMULATION_PROFILE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 131
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v5, "HTML_BLOCK_DEEP_PARSER"

    invoke-direct {v1, v5, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSER:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 132
    new-instance v5, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v6, "HTML_BLOCK_DEEP_PARSE_NON_BLOCK"

    invoke-direct {v5, v6, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v5, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_NON_BLOCK:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 133
    new-instance v5, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v6, "HTML_BLOCK_COMMENT_ONLY_FULL_LINE"

    invoke-direct {v5, v6, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v5, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_COMMENT_ONLY_FULL_LINE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 134
    new-instance v5, Lcom/vladsch/flexmark/util/collection/DynamicDefaultKey;

    const-string v6, "HTML_BLOCK_START_ONLY_ON_BLOCK_TAGS"

    invoke-direct {v5, v6, v1}, Lcom/vladsch/flexmark/util/collection/DynamicDefaultKey;-><init>(Ljava/lang/String;Lcom/vladsch/flexmark/util/options/DataKey;)V

    sput-object v5, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_START_ONLY_ON_BLOCK_TAGS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 135
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    new-instance v5, Lcom/vladsch/flexmark/parser/Parser$2;

    invoke-direct {v5}, Lcom/vladsch/flexmark/parser/Parser$2;-><init>()V

    const-string v6, "HTML_BLOCK_TAGS"

    invoke-direct {v1, v6, v5}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Lcom/vladsch/flexmark/util/collection/DataValueFactory;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_TAGS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 210
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v5, "HTML_BL OCK_DEEP_PARSE_BLANK_LINE_INTERRUPTS"

    invoke-direct {v1, v5, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_BLANK_LINE_INTERRUPTS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 215
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v5, "HTML_BL HTML_BLOCK_DEEP_PARSE_FIRST_OPEN_TAG_ON_ONE_LINE"

    invoke-direct {v1, v5, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_FIRST_OPEN_TAG_ON_ONE_LINE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 220
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v5, "HTML_BLOCK_DEEP_PARSE_MARKDOWN_INTERRUPTS_CLOSED"

    invoke-direct {v1, v5, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_MARKDOWN_INTERRUPTS_CLOSED:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 225
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v5, "HTML_BLOCK_DEEP_PARSE_BLANK_LINE_INTERRUPTS_PARTIAL_TAG"

    invoke-direct {v1, v5, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_BLANK_LINE_INTERRUPTS_PARTIAL_TAG:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 230
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v5, "HTML_BLOCK_DEEP_PARSE_INDENTED_CODE_INTERRUPTS"

    invoke-direct {v1, v5, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_INDENTED_CODE_INTERRUPTS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 235
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v5, "TRANSLATION_HTML_BLOCK_TAG_PATTERN"

    const-string v6, "__(?:\\d+)_"

    invoke-direct {v1, v5, v6}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->TRANSLATION_HTML_BLOCK_TAG_PATTERN:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 236
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v5, "TRANSLATION_HTML_INLINE_TAG_PATTERN"

    const-string v6, "_(?:\\d+)_"

    invoke-direct {v1, v5, v6}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->TRANSLATION_HTML_INLINE_TAG_PATTERN:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 241
    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->PARSER_EMULATION_FAMILY:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 245
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const/4 v1, 0x4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v5, "LISTS_CODE_INDENT"

    invoke-direct {v0, v5, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_CODE_INDENT:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 246
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v5, "LISTS_ITEM_INDENT"

    invoke-direct {v0, v5, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ITEM_INDENT:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 249
    new-instance v5, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v6, "LISTS_NEW_ITEM_CODE_INDENT"

    invoke-direct {v5, v6, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v5, Lcom/vladsch/flexmark/parser/Parser;->LISTS_NEW_ITEM_CODE_INDENT:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 252
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v5, "LISTS_ITEM_MARKER_SPACE"

    invoke-direct {v1, v5, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ITEM_MARKER_SPACE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 256
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v5, "LISTS_ITEM_MARKER_SUFFIXES"

    new-array v3, v3, [Ljava/lang/String;

    invoke-direct {v1, v5, v3}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ITEM_MARKER_SUFFIXES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 257
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v3, "LISTS_NUMBERED_ITEM_MARKER_SUFFIXED"

    invoke-direct {v1, v3, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->LISTS_NUMBERED_ITEM_MARKER_SUFFIXED:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 260
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v3, "LISTS_AUTO_LOOSE"

    invoke-direct {v1, v3, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->LISTS_AUTO_LOOSE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 261
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v3, "LISTS_AUTO_LOOSE_ONE_LEVEL_LISTS"

    invoke-direct {v1, v3, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->LISTS_AUTO_LOOSE_ONE_LEVEL_LISTS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 262
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v3, "LISTS_LOOSE_WHEN_PREV_HAS_TRAILING_BLANK_LINE"

    invoke-direct {v1, v3, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->LISTS_LOOSE_WHEN_PREV_HAS_TRAILING_BLANK_LINE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 263
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v3, "LISTS_LOOSE_WHEN_LAST_ITEM_PREV_HAS_TRAILING_BLANK_LINE"

    invoke-direct {v1, v3, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->LISTS_LOOSE_WHEN_LAST_ITEM_PREV_HAS_TRAILING_BLANK_LINE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 264
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v3, "LISTS_LOOSE_WHEN_HAS_NON_LIST_CHILDREN"

    invoke-direct {v1, v3, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->LISTS_LOOSE_WHEN_HAS_NON_LIST_CHILDREN:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 265
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v3, "LISTS_LOOSE_WHEN_BLANK_LINE_FOLLOWS_ITEM_PARAGRAPH"

    invoke-direct {v1, v3, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->LISTS_LOOSE_WHEN_BLANK_LINE_FOLLOWS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 266
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v3, "LISTS_LOOSE_WHEN_HAS_LOOSE_SUB_ITEM"

    invoke-direct {v1, v3, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->LISTS_LOOSE_WHEN_HAS_LOOSE_SUB_ITEM:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 267
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v3, "LISTS_LOOSE_WHEN_HAS_TRAILING_BLANK_LINE"

    invoke-direct {v1, v3, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->LISTS_LOOSE_WHEN_HAS_TRAILING_BLANK_LINE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 268
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v3, "LISTS_LOOSE_WHEN_CONTAINS_BLANK_LINE"

    invoke-direct {v1, v3, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->LISTS_LOOSE_WHEN_CONTAINS_BLANK_LINE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 269
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v3, "LISTS_DELIMITER_MISMATCH_TO_NEW_LIST"

    invoke-direct {v1, v3, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->LISTS_DELIMITER_MISMATCH_TO_NEW_LIST:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 270
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v3, "LISTS_END_ON_DOUBLE_BLANK"

    invoke-direct {v1, v3, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->LISTS_END_ON_DOUBLE_BLANK:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 271
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v3, "LISTS_ITEM_TYPE_MISMATCH_TO_NEW_LIST"

    invoke-direct {v1, v3, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ITEM_TYPE_MISMATCH_TO_NEW_LIST:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 272
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v3, "LISTS_ITEM_TYPE_MISMATCH_TO_SUB_LIST"

    invoke-direct {v1, v3, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ITEM_TYPE_MISMATCH_TO_SUB_LIST:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 273
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v3, "LISTS_ORDERED_ITEM_DOT_ONLY"

    invoke-direct {v1, v3, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ORDERED_ITEM_DOT_ONLY:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 274
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v3, "LISTS_ORDERED_LIST_MANUAL_START"

    invoke-direct {v1, v3, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ORDERED_LIST_MANUAL_START:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 275
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v3, "LISTS_ITEM_CONTENT_AFTER_SUFFIX"

    invoke-direct {v1, v3, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ITEM_CONTENT_AFTER_SUFFIX:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 286
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v3, "LISTS_BULLET_ITEM_INTERRUPTS_PARAGRAPH"

    invoke-direct {v1, v3, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->LISTS_BULLET_ITEM_INTERRUPTS_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 287
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v3, "LISTS_ORDERED_ITEM_INTERRUPTS_PARAGRAPH"

    invoke-direct {v1, v3, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ORDERED_ITEM_INTERRUPTS_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 288
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v3, "LISTS_ORDERED_NON_ONE_ITEM_INTERRUPTS_PARAGRAPH"

    invoke-direct {v1, v3, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ORDERED_NON_ONE_ITEM_INTERRUPTS_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 290
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v3, "LISTS_EMPTY_BULLET_ITEM_INTERRUPTS_PARAGRAPH"

    invoke-direct {v1, v3, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->LISTS_EMPTY_BULLET_ITEM_INTERRUPTS_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 291
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v3, "LISTS_EMPTY_ORDERED_ITEM_INTERRUPTS_PARAGRAPH"

    invoke-direct {v1, v3, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->LISTS_EMPTY_ORDERED_ITEM_INTERRUPTS_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 292
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v3, "LISTS_EMPTY_ORDERED_NON_ONE_ITEM_INTERRUPTS_PARAGRAPH"

    invoke-direct {v1, v3, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->LISTS_EMPTY_ORDERED_NON_ONE_ITEM_INTERRUPTS_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 294
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v3, "LISTS_BULLET_ITEM_INTERRUPTS_ITEM_PARAGRAPH"

    invoke-direct {v1, v3, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->LISTS_BULLET_ITEM_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 295
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v3, "LISTS_ORDERED_ITEM_INTERRUPTS_ITEM_PARAGRAPH"

    invoke-direct {v1, v3, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ORDERED_ITEM_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 296
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v3, "LISTS_ORDERED_NON_ONE_ITEM_INTERRUPTS_ITEM_PARAGRAPH"

    invoke-direct {v1, v3, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ORDERED_NON_ONE_ITEM_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 299
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v3, "LISTS_EMPTY_BULLET_ITEM_INTERRUPTS_ITEM_PARAGRAPH"

    invoke-direct {v1, v3, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->LISTS_EMPTY_BULLET_ITEM_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 300
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v3, "LISTS_EMPTY_ORDERED_ITEM_INTERRUPTS_ITEM_PARAGRAPH"

    invoke-direct {v1, v3, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->LISTS_EMPTY_ORDERED_ITEM_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 301
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v3, "LISTS_EMPTY_ORDERED_NON_ONE_ITEM_INTERRUPTS_ITEM_PARAGRAPH"

    invoke-direct {v1, v3, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->LISTS_EMPTY_ORDERED_NON_ONE_ITEM_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 305
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v2, "LISTS_EMPTY_BULLET_SUB_ITEM_INTERRUPTS_ITEM_PARAGRAPH"

    invoke-direct {v1, v2, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->LISTS_EMPTY_BULLET_SUB_ITEM_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 306
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v2, "LISTS_EMPTY_ORDERED_SUB_ITEM_INTERRUPTS_ITEM_PARAGRAPH"

    invoke-direct {v1, v2, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->LISTS_EMPTY_ORDERED_SUB_ITEM_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 307
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v2, "LISTS_EMPTY_ORDERED_NON_ONE_SUB_ITEM_INTERRUPTS_ITEM_PARAGRAPH"

    invoke-direct {v1, v2, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->LISTS_EMPTY_ORDERED_NON_ONE_SUB_ITEM_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 308
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v2, "LISTS_ITEM_PREFIX_CHARS"

    const-string v3, "*-+"

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ITEM_PREFIX_CHARS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 311
    new-instance v1, Lcom/vladsch/flexmark/util/collection/DynamicDefaultKey;

    const-string v2, "CODE_BLOCK_INDENT"

    invoke-direct {v1, v2, v0}, Lcom/vladsch/flexmark/util/collection/DynamicDefaultKey;-><init>(Ljava/lang/String;Lcom/vladsch/flexmark/util/options/DataKey;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/Parser;->CODE_BLOCK_INDENT:Lcom/vladsch/flexmark/util/options/DataKey;

    return-void
.end method

.method private constructor <init>(Lcom/vladsch/flexmark/parser/Parser$Builder;)V
    .locals 3

    .line 326
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 327
    new-instance v0, Lcom/vladsch/flexmark/parser/Parser$Builder;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/parser/Parser$Builder;-><init>(Lcom/vladsch/flexmark/parser/Parser$Builder;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/Parser;->builder:Lcom/vladsch/flexmark/parser/Parser$Builder;

    .line 328
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataSet;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/util/options/DataSet;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/Parser;->options:Lcom/vladsch/flexmark/util/options/DataHolder;

    .line 329
    invoke-static {p1}, Lcom/vladsch/flexmark/parser/Parser$Builder;->access$000(Lcom/vladsch/flexmark/parser/Parser$Builder;)Ljava/util/List;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->calculateBlockParserFactories(Lcom/vladsch/flexmark/util/options/DataHolder;Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/vladsch/flexmark/parser/Parser;->blockParserFactories:Ljava/util/List;

    .line 330
    invoke-static {p1}, Lcom/vladsch/flexmark/parser/Parser$Builder;->access$100(Lcom/vladsch/flexmark/parser/Parser$Builder;)Lcom/vladsch/flexmark/parser/InlineParserFactory;

    move-result-object v1

    if-nez v1, :cond_0

    sget-object v1, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->INLINE_PARSER_FACTORY:Lcom/vladsch/flexmark/parser/InlineParserFactory;

    goto :goto_0

    :cond_0
    invoke-static {p1}, Lcom/vladsch/flexmark/parser/Parser$Builder;->access$100(Lcom/vladsch/flexmark/parser/Parser$Builder;)Lcom/vladsch/flexmark/parser/InlineParserFactory;

    move-result-object v1

    :goto_0
    iput-object v1, p0, Lcom/vladsch/flexmark/parser/Parser;->inlineParserFactory:Lcom/vladsch/flexmark/parser/InlineParserFactory;

    .line 331
    invoke-static {p1}, Lcom/vladsch/flexmark/parser/Parser$Builder;->access$200(Lcom/vladsch/flexmark/parser/Parser$Builder;)Ljava/util/List;

    move-result-object v2

    invoke-static {v0, v2, v1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->calculateParagraphPreProcessors(Lcom/vladsch/flexmark/util/options/DataHolder;Ljava/util/List;Lcom/vladsch/flexmark/parser/InlineParserFactory;)Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencies;

    move-result-object v2

    iput-object v2, p0, Lcom/vladsch/flexmark/parser/Parser;->paragraphPreProcessorFactories:Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencies;

    .line 332
    invoke-static {p1}, Lcom/vladsch/flexmark/parser/Parser$Builder;->access$300(Lcom/vladsch/flexmark/parser/Parser$Builder;)Ljava/util/List;

    move-result-object v2

    invoke-static {v0, v2, v1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->calculateBlockPreProcessors(Lcom/vladsch/flexmark/util/options/DataHolder;Ljava/util/List;Lcom/vladsch/flexmark/parser/InlineParserFactory;)Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencies;

    move-result-object v1

    iput-object v1, p0, Lcom/vladsch/flexmark/parser/Parser;->blockPreProcessorDependencies:Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencies;

    .line 333
    invoke-static {p1}, Lcom/vladsch/flexmark/parser/Parser$Builder;->access$400(Lcom/vladsch/flexmark/parser/Parser$Builder;)Ljava/util/List;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->calculateDelimiterProcessors(Lcom/vladsch/flexmark/util/options/DataHolder;Ljava/util/List;)Ljava/util/Map;

    move-result-object v1

    iput-object v1, p0, Lcom/vladsch/flexmark/parser/Parser;->delimiterProcessors:Ljava/util/Map;

    .line 334
    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->calculateDelimiterCharacters(Lcom/vladsch/flexmark/util/options/DataHolder;Ljava/util/Set;)Ljava/util/BitSet;

    move-result-object v1

    iput-object v1, p0, Lcom/vladsch/flexmark/parser/Parser;->delimiterCharacters:Ljava/util/BitSet;

    .line 335
    invoke-static {p1}, Lcom/vladsch/flexmark/parser/Parser$Builder;->access$500(Lcom/vladsch/flexmark/parser/Parser$Builder;)Ljava/util/List;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->calculateLinkRefProcessors(Lcom/vladsch/flexmark/util/options/DataHolder;Ljava/util/List;)Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;

    move-result-object v2

    iput-object v2, p0, Lcom/vladsch/flexmark/parser/Parser;->linkRefProcessors:Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;

    .line 336
    invoke-static {v0, v1}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->calculateSpecialCharacters(Lcom/vladsch/flexmark/util/options/DataHolder;Ljava/util/BitSet;)Ljava/util/BitSet;

    move-result-object v1

    iput-object v1, p0, Lcom/vladsch/flexmark/parser/Parser;->specialCharacters:Ljava/util/BitSet;

    .line 337
    invoke-static {p1}, Lcom/vladsch/flexmark/parser/Parser$Builder;->access$600(Lcom/vladsch/flexmark/parser/Parser$Builder;)Ljava/util/List;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/parser/internal/PostProcessorManager;->calculatePostProcessors(Lcom/vladsch/flexmark/util/options/DataHolder;Ljava/util/List;)Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencies;

    move-result-object v0

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/Parser;->postProcessorDependencies:Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencies;

    .line 338
    invoke-static {p1}, Lcom/vladsch/flexmark/parser/Parser$Builder;->access$700(Lcom/vladsch/flexmark/parser/Parser$Builder;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/parser/Parser;->inlineParserExtensionFactories:Ljava/util/List;

    return-void
.end method

.method synthetic constructor <init>(Lcom/vladsch/flexmark/parser/Parser$Builder;Lcom/vladsch/flexmark/parser/Parser$1;)V
    .locals 0

    .line 42
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/Parser;-><init>(Lcom/vladsch/flexmark/parser/Parser$Builder;)V

    return-void
.end method

.method public static varargs addExtensions(Lcom/vladsch/flexmark/util/options/MutableDataHolder;[Lcom/vladsch/flexmark/util/builder/Extension;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;
    .locals 2

    .line 653
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->EXTENSIONS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p0, v0}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    .line 654
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 656
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 657
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/builder/Extension;

    .line 658
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 660
    :cond_0
    sget-object p1, Lcom/vladsch/flexmark/parser/Parser;->EXTENSIONS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p0, p1, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    return-object p0
.end method

.method public static builder()Lcom/vladsch/flexmark/parser/Parser$Builder;
    .locals 1

    .line 347
    new-instance v0, Lcom/vladsch/flexmark/parser/Parser$Builder;

    invoke-direct {v0}, Lcom/vladsch/flexmark/parser/Parser$Builder;-><init>()V

    return-object v0
.end method

.method public static builder(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/parser/Parser$Builder;
    .locals 1

    .line 351
    new-instance v0, Lcom/vladsch/flexmark/parser/Parser$Builder;

    invoke-direct {v0, p0}, Lcom/vladsch/flexmark/parser/Parser$Builder;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    return-object v0
.end method

.method private postProcess(Lcom/vladsch/flexmark/util/ast/Document;)Lcom/vladsch/flexmark/util/ast/Document;
    .locals 1

    .line 401
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/Parser;->postProcessorDependencies:Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencies;

    invoke-static {p1, v0}, Lcom/vladsch/flexmark/parser/internal/PostProcessorManager;->processDocument(Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencies;)Lcom/vladsch/flexmark/util/ast/Document;

    move-result-object p1

    return-object p1
.end method

.method public static varargs removeExtensions(Lcom/vladsch/flexmark/util/options/MutableDataHolder;[Ljava/lang/Class;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;
    .locals 6

    .line 672
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->EXTENSIONS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p0, v0}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    .line 673
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 675
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vladsch/flexmark/util/builder/Extension;

    .line 677
    array-length v3, p1

    const/4 v4, 0x0

    :goto_1
    if-ge v4, v3, :cond_1

    aget-object v5, p1, v4

    .line 678
    invoke-virtual {v5, v2}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    goto :goto_0

    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 684
    :cond_1
    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 688
    :cond_2
    sget-object p1, Lcom/vladsch/flexmark/parser/Parser;->EXTENSIONS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p0, p1, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    return-object p0
.end method

.method public static transferReferences(Lcom/vladsch/flexmark/util/ast/NodeRepository;Lcom/vladsch/flexmark/util/ast/NodeRepository;Z)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">(",
            "Lcom/vladsch/flexmark/util/ast/NodeRepository<",
            "TT;>;",
            "Lcom/vladsch/flexmark/util/ast/NodeRepository<",
            "TT;>;Z)Z"
        }
    .end annotation

    .line 449
    invoke-static {p0, p1, p2}, Lcom/vladsch/flexmark/util/ast/NodeRepository;->transferReferences(Lcom/vladsch/flexmark/util/ast/NodeRepository;Lcom/vladsch/flexmark/util/ast/NodeRepository;Z)Z

    move-result p0

    return p0
.end method


# virtual methods
.method public getOptions()Lcom/vladsch/flexmark/util/options/DataHolder;
    .locals 2

    .line 411
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataSet;

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/Parser;->builder:Lcom/vladsch/flexmark/parser/Parser$Builder;

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/options/DataSet;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    return-object v0
.end method

.method public parse(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/ast/Document;
    .locals 11

    .line 363
    new-instance v0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/Parser;->options:Lcom/vladsch/flexmark/util/options/DataHolder;

    iget-object v8, p0, Lcom/vladsch/flexmark/parser/Parser;->blockParserFactories:Ljava/util/List;

    iget-object v9, p0, Lcom/vladsch/flexmark/parser/Parser;->paragraphPreProcessorFactories:Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencies;

    iget-object v10, p0, Lcom/vladsch/flexmark/parser/Parser;->blockPreProcessorDependencies:Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencies;

    move-object v2, v1

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/Parser;->inlineParserFactory:Lcom/vladsch/flexmark/parser/InlineParserFactory;

    iget-object v3, p0, Lcom/vladsch/flexmark/parser/Parser;->specialCharacters:Ljava/util/BitSet;

    iget-object v4, p0, Lcom/vladsch/flexmark/parser/Parser;->delimiterCharacters:Ljava/util/BitSet;

    iget-object v5, p0, Lcom/vladsch/flexmark/parser/Parser;->delimiterProcessors:Ljava/util/Map;

    iget-object v6, p0, Lcom/vladsch/flexmark/parser/Parser;->linkRefProcessors:Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;

    iget-object v7, p0, Lcom/vladsch/flexmark/parser/Parser;->inlineParserExtensionFactories:Ljava/util/List;

    .line 364
    invoke-interface/range {v1 .. v7}, Lcom/vladsch/flexmark/parser/InlineParserFactory;->inlineParser(Lcom/vladsch/flexmark/util/options/DataHolder;Ljava/util/BitSet;Ljava/util/BitSet;Ljava/util/Map;Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;Ljava/util/List;)Lcom/vladsch/flexmark/parser/InlineParser;

    move-result-object v5

    move-object v1, v2

    move-object v2, v8

    move-object v3, v9

    move-object v4, v10

    invoke-direct/range {v0 .. v5}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;Ljava/util/List;Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencies;Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencies;Lcom/vladsch/flexmark/parser/InlineParser;)V

    .line 365
    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->parse(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/ast/Document;

    move-result-object p1

    .line 366
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/Parser;->postProcess(Lcom/vladsch/flexmark/util/ast/Document;)Lcom/vladsch/flexmark/util/ast/Document;

    move-result-object p1

    return-object p1
.end method

.method public parse(Ljava/lang/String;)Lcom/vladsch/flexmark/util/ast/Document;
    .locals 11

    .line 378
    new-instance v0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/Parser;->options:Lcom/vladsch/flexmark/util/options/DataHolder;

    iget-object v8, p0, Lcom/vladsch/flexmark/parser/Parser;->blockParserFactories:Ljava/util/List;

    iget-object v9, p0, Lcom/vladsch/flexmark/parser/Parser;->paragraphPreProcessorFactories:Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencies;

    iget-object v10, p0, Lcom/vladsch/flexmark/parser/Parser;->blockPreProcessorDependencies:Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencies;

    move-object v2, v1

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/Parser;->inlineParserFactory:Lcom/vladsch/flexmark/parser/InlineParserFactory;

    iget-object v3, p0, Lcom/vladsch/flexmark/parser/Parser;->specialCharacters:Ljava/util/BitSet;

    iget-object v4, p0, Lcom/vladsch/flexmark/parser/Parser;->delimiterCharacters:Ljava/util/BitSet;

    iget-object v5, p0, Lcom/vladsch/flexmark/parser/Parser;->delimiterProcessors:Ljava/util/Map;

    iget-object v6, p0, Lcom/vladsch/flexmark/parser/Parser;->linkRefProcessors:Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;

    iget-object v7, p0, Lcom/vladsch/flexmark/parser/Parser;->inlineParserExtensionFactories:Ljava/util/List;

    .line 379
    invoke-interface/range {v1 .. v7}, Lcom/vladsch/flexmark/parser/InlineParserFactory;->inlineParser(Lcom/vladsch/flexmark/util/options/DataHolder;Ljava/util/BitSet;Ljava/util/BitSet;Ljava/util/Map;Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;Ljava/util/List;)Lcom/vladsch/flexmark/parser/InlineParser;

    move-result-object v5

    move-object v1, v2

    move-object v2, v8

    move-object v3, v9

    move-object v4, v10

    invoke-direct/range {v0 .. v5}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;Ljava/util/List;Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencies;Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencies;Lcom/vladsch/flexmark/parser/InlineParser;)V

    .line 380
    invoke-static {p1}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->of(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->parse(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/ast/Document;

    move-result-object p1

    .line 381
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/Parser;->postProcess(Lcom/vladsch/flexmark/util/ast/Document;)Lcom/vladsch/flexmark/util/ast/Document;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic parse(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/ast/Node;
    .locals 0

    .line 42
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/Parser;->parse(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/ast/Document;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic parse(Ljava/lang/String;)Lcom/vladsch/flexmark/util/ast/Node;
    .locals 0

    .line 42
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/Parser;->parse(Ljava/lang/String;)Lcom/vladsch/flexmark/util/ast/Document;

    move-result-object p1

    return-object p1
.end method

.method public parseReader(Ljava/io/Reader;)Lcom/vladsch/flexmark/util/ast/Document;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 394
    new-instance v0, Lcom/vladsch/flexmark/parser/internal/DocumentParser;

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/Parser;->options:Lcom/vladsch/flexmark/util/options/DataHolder;

    iget-object v8, p0, Lcom/vladsch/flexmark/parser/Parser;->blockParserFactories:Ljava/util/List;

    iget-object v9, p0, Lcom/vladsch/flexmark/parser/Parser;->paragraphPreProcessorFactories:Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencies;

    iget-object v10, p0, Lcom/vladsch/flexmark/parser/Parser;->blockPreProcessorDependencies:Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencies;

    move-object v2, v1

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/Parser;->inlineParserFactory:Lcom/vladsch/flexmark/parser/InlineParserFactory;

    iget-object v3, p0, Lcom/vladsch/flexmark/parser/Parser;->specialCharacters:Ljava/util/BitSet;

    iget-object v4, p0, Lcom/vladsch/flexmark/parser/Parser;->delimiterCharacters:Ljava/util/BitSet;

    iget-object v5, p0, Lcom/vladsch/flexmark/parser/Parser;->delimiterProcessors:Ljava/util/Map;

    iget-object v6, p0, Lcom/vladsch/flexmark/parser/Parser;->linkRefProcessors:Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;

    iget-object v7, p0, Lcom/vladsch/flexmark/parser/Parser;->inlineParserExtensionFactories:Ljava/util/List;

    .line 395
    invoke-interface/range {v1 .. v7}, Lcom/vladsch/flexmark/parser/InlineParserFactory;->inlineParser(Lcom/vladsch/flexmark/util/options/DataHolder;Ljava/util/BitSet;Ljava/util/BitSet;Ljava/util/Map;Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;Ljava/util/List;)Lcom/vladsch/flexmark/parser/InlineParser;

    move-result-object v5

    move-object v1, v2

    move-object v2, v8

    move-object v3, v9

    move-object v4, v10

    invoke-direct/range {v0 .. v5}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;Ljava/util/List;Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencies;Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockPreProcessorDependencies;Lcom/vladsch/flexmark/parser/InlineParser;)V

    .line 396
    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser;->parse(Ljava/io/Reader;)Lcom/vladsch/flexmark/util/ast/Document;

    move-result-object p1

    .line 397
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/Parser;->postProcess(Lcom/vladsch/flexmark/util/ast/Document;)Lcom/vladsch/flexmark/util/ast/Document;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic parseReader(Ljava/io/Reader;)Lcom/vladsch/flexmark/util/ast/Node;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 42
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/Parser;->parseReader(Ljava/io/Reader;)Lcom/vladsch/flexmark/util/ast/Document;

    move-result-object p1

    return-object p1
.end method

.method public transferReferences(Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/util/ast/Document;)Z
    .locals 1

    const/4 v0, 0x0

    .line 416
    invoke-virtual {p0, p1, p2, v0}, Lcom/vladsch/flexmark/parser/Parser;->transferReferences(Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/util/ast/Document;Ljava/lang/Boolean;)Z

    move-result p1

    return p1
.end method

.method public transferReferences(Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/util/ast/Document;Ljava/lang/Boolean;)Z
    .locals 6

    .line 424
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/Parser;->options:Lcom/vladsch/flexmark/util/options/DataHolder;

    sget-object v1, Lcom/vladsch/flexmark/parser/Parser;->EXTENSIONS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/util/options/DataHolder;->contains(Lcom/vladsch/flexmark/util/options/DataKey;)Z

    move-result v0

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v0, :cond_1

    .line 425
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/Parser;->options:Lcom/vladsch/flexmark/util/options/DataHolder;

    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vladsch/flexmark/util/builder/Extension;

    .line 426
    instance-of v5, v4, Lcom/vladsch/flexmark/parser/Parser$ReferenceHoldingExtension;

    if-eqz v5, :cond_0

    .line 427
    check-cast v4, Lcom/vladsch/flexmark/parser/Parser$ReferenceHoldingExtension;

    .line 428
    invoke-interface {v4, p1, p2}, Lcom/vladsch/flexmark/parser/Parser$ReferenceHoldingExtension;->transferReferences(Lcom/vladsch/flexmark/util/options/MutableDataHolder;Lcom/vladsch/flexmark/util/options/DataHolder;)Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    .line 434
    :cond_2
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->REFERENCES:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/util/ast/Document;->contains(Lcom/vladsch/flexmark/util/options/DataKey;)Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-virtual {p2, v0}, Lcom/vladsch/flexmark/util/ast/Document;->contains(Lcom/vladsch/flexmark/util/options/DataKey;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 435
    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vladsch/flexmark/util/ast/NodeRepository;

    invoke-virtual {v0, p2}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/vladsch/flexmark/util/ast/NodeRepository;

    if-eqz p3, :cond_3

    .line 436
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    goto :goto_1

    :cond_3
    sget-object p3, Lcom/vladsch/flexmark/parser/Parser;->REFERENCES_KEEP:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p3

    sget-object v0, Lcom/vladsch/flexmark/util/KeepType;->FIRST:Lcom/vladsch/flexmark/util/KeepType;

    if-ne p3, v0, :cond_4

    const/4 v3, 0x1

    .line 435
    :cond_4
    :goto_1
    invoke-static {v4, p2, v3}, Lcom/vladsch/flexmark/parser/Parser;->transferReferences(Lcom/vladsch/flexmark/util/ast/NodeRepository;Lcom/vladsch/flexmark/util/ast/NodeRepository;Z)Z

    move-result p2

    if-eqz p2, :cond_5

    const/4 v1, 0x1

    :cond_5
    if-eqz v1, :cond_6

    .line 443
    sget-object p2, Lcom/vladsch/flexmark/html/HtmlRenderer;->RECHECK_UNDEFINED_REFERENCES:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p3

    invoke-virtual {p1, p2, p3}, Lcom/vladsch/flexmark/util/ast/Document;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    :cond_6
    return v1
.end method

.method public withOptions(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/parser/Parser;
    .locals 3

    if-nez p1, :cond_0

    return-object p0

    .line 406
    :cond_0
    new-instance v0, Lcom/vladsch/flexmark/parser/Parser;

    new-instance v1, Lcom/vladsch/flexmark/parser/Parser$Builder;

    iget-object v2, p0, Lcom/vladsch/flexmark/parser/Parser;->builder:Lcom/vladsch/flexmark/parser/Parser$Builder;

    invoke-direct {v1, v2, p1}, Lcom/vladsch/flexmark/parser/Parser$Builder;-><init>(Lcom/vladsch/flexmark/parser/Parser$Builder;Lcom/vladsch/flexmark/util/options/DataHolder;)V

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/parser/Parser;-><init>(Lcom/vladsch/flexmark/parser/Parser$Builder;)V

    return-object v0
.end method

.method public bridge synthetic withOptions(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/util/IParse;
    .locals 0

    .line 42
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/Parser;->withOptions(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/parser/Parser;

    move-result-object p1

    return-object p1
.end method
