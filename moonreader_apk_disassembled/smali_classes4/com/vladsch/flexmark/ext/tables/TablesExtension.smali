.class public Lcom/vladsch/flexmark/ext/tables/TablesExtension;
.super Ljava/lang/Object;
.source "TablesExtension.java"

# interfaces
.implements Lcom/vladsch/flexmark/parser/Parser$ParserExtension;
.implements Lcom/vladsch/flexmark/html/HtmlRenderer$HtmlRendererExtension;
.implements Lcom/vladsch/flexmark/formatter/Formatter$FormatterExtension;


# static fields
.field public static final ADJUST_COLUMN_WIDTH:Lcom/vladsch/flexmark/util/options/DataKey;
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

.field public static final APPEND_MISSING_COLUMNS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final APPLY_COLUMN_ALIGNMENT:Lcom/vladsch/flexmark/util/options/DataKey;
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

.field public static final CLASS_NAME:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final COLUMN_SPANS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final DISCARD_EXTRA_COLUMNS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final FILL_MISSING_COLUMNS:Lcom/vladsch/flexmark/util/options/DataKey;
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

.field public static final FORMAT_ADJUST_COLUMN_WIDTH:Lcom/vladsch/flexmark/util/options/DataKey;
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

.field public static final FORMAT_APPLY_COLUMN_ALIGNMENT:Lcom/vladsch/flexmark/util/options/DataKey;
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

.field public static final FORMAT_CHAR_WIDTH_PROVIDER:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/util/mappers/CharWidthProvider;",
            ">;"
        }
    .end annotation
.end field

.field public static final FORMAT_FILL_MISSING_COLUMNS:Lcom/vladsch/flexmark/util/options/DataKey;
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

.field public static final FORMAT_LEAD_TRAIL_PIPES:Lcom/vladsch/flexmark/util/options/DataKey;
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

.field public static final FORMAT_LEFT_ALIGN_MARKER:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final FORMAT_MIN_SEPARATOR_COLUMN_WIDTH:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final FORMAT_MIN_SEPARATOR_DASHES:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final FORMAT_REMOVE_CAPTION:Lcom/vladsch/flexmark/util/options/DataKey;
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

.field public static final FORMAT_SPACE_AROUND_PIPES:Lcom/vladsch/flexmark/util/options/DataKey;
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

.field public static final FORMAT_TABLE_ADJUST_COLUMN_WIDTH:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final FORMAT_TABLE_APPLY_COLUMN_ALIGNMENT:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

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

.field public static final FORMAT_TABLE_FILL_MISSING_COLUMNS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
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

.field public static final FORMAT_TABLE_LEAD_TRAIL_PIPES:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final FORMAT_TABLE_LEFT_ALIGN_MARKER:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;",
            ">;"
        }
    .end annotation
.end field

.field public static final FORMAT_TABLE_MANIPULATOR:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/util/format/TableManipulator;",
            ">;"
        }
    .end annotation
.end field

.field public static final FORMAT_TABLE_MIN_SEPARATOR_COLUMN_WIDTH:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final FORMAT_TABLE_MIN_SEPARATOR_DASHES:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final FORMAT_TABLE_SPACE_AROUND_PIPES:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final FORMAT_TABLE_TRIM_CELL_WHITESPACE:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final HEADER_SEPARATOR_COLUMN_MATCH:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final LEAD_TRAIL_PIPES:Lcom/vladsch/flexmark/util/options/DataKey;
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

.field public static final LEFT_ALIGN_MARKER:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final MAX_HEADER_ROWS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final MIN_HEADER_ROWS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final MIN_SEPARATOR_COLUMN_WIDTH:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final MIN_SEPARATOR_DASHES:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final MULTI_LINE_ROWS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final REMOVE_CAPTION:Lcom/vladsch/flexmark/util/options/DataKey;
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

.field public static final SPACE_AROUND_PIPES:Lcom/vladsch/flexmark/util/options/DataKey;
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

.field public static final TRIM_CELL_WHITESPACE:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final WITH_CAPTION:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 28
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v2, "TRIM_CELL_WHITESPACE"

    invoke-direct {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->TRIM_CELL_WHITESPACE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 29
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const/4 v2, 0x3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MIN_SEPARATOR_DASHES"

    invoke-direct {v0, v3, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->MIN_SEPARATOR_DASHES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 30
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const v2, 0x7fffffff

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "MAX_HEADER_ROWS"

    invoke-direct {v0, v3, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->MAX_HEADER_ROWS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 31
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const/4 v2, 0x0

    .line 32
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    .line 31
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v4, "MIN_HEADER_ROWS"

    invoke-direct {v0, v4, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->MIN_HEADER_ROWS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 32
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v2, "APPEND_MISSING_COLUMNS"

    invoke-direct {v0, v2, v3}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->APPEND_MISSING_COLUMNS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 33
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v2, "DISCARD_EXTRA_COLUMNS"

    invoke-direct {v0, v2, v3}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->DISCARD_EXTRA_COLUMNS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 34
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v2, "COLUMN_SPANS"

    invoke-direct {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->COLUMN_SPANS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 35
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v2, "HEADER_SEPARATOR_COLUMN_MATCH"

    invoke-direct {v0, v2, v3}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->HEADER_SEPARATOR_COLUMN_MATCH:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 36
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v2, "CLASS_NAME"

    const-string v4, ""

    invoke-direct {v0, v2, v4}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->CLASS_NAME:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 37
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v2, "WITH_CAPTION"

    invoke-direct {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->WITH_CAPTION:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 38
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "MULTI_LINE_ROWS"

    invoke-direct {v0, v1, v3}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->MULTI_LINE_ROWS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 41
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_TRIM_CELL_WHITESPACE:Lcom/vladsch/flexmark/util/options/DataKey;

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->FORMAT_TABLE_TRIM_CELL_WHITESPACE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 42
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_LEAD_TRAIL_PIPES:Lcom/vladsch/flexmark/util/options/DataKey;

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->FORMAT_TABLE_LEAD_TRAIL_PIPES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 43
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_SPACE_AROUND_PIPES:Lcom/vladsch/flexmark/util/options/DataKey;

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->FORMAT_TABLE_SPACE_AROUND_PIPES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 44
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_ADJUST_COLUMN_WIDTH:Lcom/vladsch/flexmark/util/options/DataKey;

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->FORMAT_TABLE_ADJUST_COLUMN_WIDTH:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 45
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_APPLY_COLUMN_ALIGNMENT:Lcom/vladsch/flexmark/util/options/DataKey;

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->FORMAT_TABLE_APPLY_COLUMN_ALIGNMENT:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 46
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_FILL_MISSING_COLUMNS:Lcom/vladsch/flexmark/util/options/DataKey;

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->FORMAT_TABLE_FILL_MISSING_COLUMNS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 47
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_LEFT_ALIGN_MARKER:Lcom/vladsch/flexmark/util/options/DataKey;

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->FORMAT_TABLE_LEFT_ALIGN_MARKER:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 48
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_MIN_SEPARATOR_COLUMN_WIDTH:Lcom/vladsch/flexmark/util/options/DataKey;

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->FORMAT_TABLE_MIN_SEPARATOR_COLUMN_WIDTH:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 49
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_MIN_SEPARATOR_DASHES:Lcom/vladsch/flexmark/util/options/DataKey;

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->FORMAT_TABLE_MIN_SEPARATOR_DASHES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 50
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_CHAR_WIDTH_PROVIDER:Lcom/vladsch/flexmark/util/options/DataKey;

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->FORMAT_CHAR_WIDTH_PROVIDER:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 51
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_MANIPULATOR:Lcom/vladsch/flexmark/util/options/DataKey;

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->FORMAT_TABLE_MANIPULATOR:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 52
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_CAPTION:Lcom/vladsch/flexmark/util/options/DataKey;

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->FORMAT_TABLE_CAPTION:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 53
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_CAPTION_SPACES:Lcom/vladsch/flexmark/util/options/DataKey;

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->FORMAT_TABLE_CAPTION_SPACES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 54
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_INDENT_PREFIX:Lcom/vladsch/flexmark/util/options/DataKey;

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->FORMAT_TABLE_INDENT_PREFIX:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 59
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_LEAD_TRAIL_PIPES:Lcom/vladsch/flexmark/util/options/DataKey;

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->FORMAT_LEAD_TRAIL_PIPES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 63
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_SPACE_AROUND_PIPES:Lcom/vladsch/flexmark/util/options/DataKey;

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->FORMAT_SPACE_AROUND_PIPES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 67
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_ADJUST_COLUMN_WIDTH:Lcom/vladsch/flexmark/util/options/DataKey;

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->FORMAT_ADJUST_COLUMN_WIDTH:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 71
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_APPLY_COLUMN_ALIGNMENT:Lcom/vladsch/flexmark/util/options/DataKey;

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->FORMAT_APPLY_COLUMN_ALIGNMENT:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 75
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_FILL_MISSING_COLUMNS:Lcom/vladsch/flexmark/util/options/DataKey;

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->FORMAT_FILL_MISSING_COLUMNS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 80
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->REMOVE_CAPTION:Lcom/vladsch/flexmark/util/options/DataKey;

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->FORMAT_REMOVE_CAPTION:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 85
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_LEFT_ALIGN_MARKER:Lcom/vladsch/flexmark/util/options/DataKey;

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->FORMAT_LEFT_ALIGN_MARKER:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 89
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_MIN_SEPARATOR_COLUMN_WIDTH:Lcom/vladsch/flexmark/util/options/DataKey;

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->FORMAT_MIN_SEPARATOR_COLUMN_WIDTH:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 93
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_MIN_SEPARATOR_DASHES:Lcom/vladsch/flexmark/util/options/DataKey;

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->FORMAT_MIN_SEPARATOR_DASHES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 98
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->REMOVE_CAPTION:Lcom/vladsch/flexmark/util/options/DataKey;

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->REMOVE_CAPTION:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 103
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->LEAD_TRAIL_PIPES:Lcom/vladsch/flexmark/util/options/DataKey;

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->LEAD_TRAIL_PIPES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 107
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->SPACE_AROUND_PIPES:Lcom/vladsch/flexmark/util/options/DataKey;

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->SPACE_AROUND_PIPES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 111
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->ADJUST_COLUMN_WIDTH:Lcom/vladsch/flexmark/util/options/DataKey;

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->ADJUST_COLUMN_WIDTH:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 115
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->APPLY_COLUMN_ALIGNMENT:Lcom/vladsch/flexmark/util/options/DataKey;

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->APPLY_COLUMN_ALIGNMENT:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 119
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FILL_MISSING_COLUMNS:Lcom/vladsch/flexmark/util/options/DataKey;

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->FILL_MISSING_COLUMNS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 123
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->LEFT_ALIGN_MARKER:Lcom/vladsch/flexmark/util/options/DataKey;

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->LEFT_ALIGN_MARKER:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 127
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->MIN_SEPARATOR_COLUMN_WIDTH:Lcom/vladsch/flexmark/util/options/DataKey;

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->MIN_SEPARATOR_COLUMN_WIDTH:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 131
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->CHAR_WIDTH_PROVIDER:Lcom/vladsch/flexmark/util/options/DataKey;

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->CHAR_WIDTH_PROVIDER:Lcom/vladsch/flexmark/util/options/DataKey;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create()Lcom/vladsch/flexmark/util/builder/Extension;
    .locals 1

    .line 134
    new-instance v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;

    invoke-direct {v0}, Lcom/vladsch/flexmark/ext/tables/TablesExtension;-><init>()V

    return-object v0
.end method


# virtual methods
.method public extend(Lcom/vladsch/flexmark/formatter/Formatter$Builder;)V
    .locals 1

    .line 139
    new-instance v0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter$Factory;

    invoke-direct {v0}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter$Factory;-><init>()V

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/formatter/Formatter$Builder;->nodeFormatterFactory(Lcom/vladsch/flexmark/formatter/NodeFormatterFactory;)Lcom/vladsch/flexmark/formatter/Formatter$Builder;

    return-void
.end method

.method public extend(Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;Ljava/lang/String;)V
    .locals 0

    .line 159
    const-string p2, "HTML"

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->isRendererType(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 160
    new-instance p2, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer$Factory;

    invoke-direct {p2}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer$Factory;-><init>()V

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->nodeRendererFactory(Lcom/vladsch/flexmark/html/renderer/NodeRendererFactory;)Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;

    return-void

    .line 161
    :cond_0
    const-string p2, "JIRA"

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->isRendererType(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 162
    new-instance p2, Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer$Factory;

    invoke-direct {p2}, Lcom/vladsch/flexmark/ext/tables/internal/TableJiraRenderer$Factory;-><init>()V

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;->nodeRendererFactory(Lcom/vladsch/flexmark/html/renderer/NodeRendererFactory;)Lcom/vladsch/flexmark/html/HtmlRenderer$Builder;

    :cond_1
    return-void
.end method

.method public extend(Lcom/vladsch/flexmark/parser/Parser$Builder;)V
    .locals 1

    .line 154
    invoke-static {}, Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor;->Factory()Lcom/vladsch/flexmark/parser/block/ParagraphPreProcessorFactory;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/parser/Parser$Builder;->paragraphPreProcessorFactory(Lcom/vladsch/flexmark/parser/block/ParagraphPreProcessorFactory;)Lcom/vladsch/flexmark/parser/Parser$Builder;

    return-void
.end method

.method public parserOptions(Lcom/vladsch/flexmark/util/options/MutableDataHolder;)V
    .locals 0

    return-void
.end method

.method public rendererOptions(Lcom/vladsch/flexmark/util/options/MutableDataHolder;)V
    .locals 0

    return-void
.end method
