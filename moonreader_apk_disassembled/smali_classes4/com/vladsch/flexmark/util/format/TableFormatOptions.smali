.class public Lcom/vladsch/flexmark/util/format/TableFormatOptions;
.super Ljava/lang/Object;
.source "TableFormatOptions.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/options/MutableDataSetter;


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

.field public static final FORMAT_CHAR_WIDTH_PROVIDER:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/util/mappers/CharWidthProvider;",
            ">;"
        }
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

.field public static final FORMAT_TABLE_DUMP_TRACKING_OFFSETS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
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

.field public static final INTELLIJ_DUMMY_IDENTIFIER:Ljava/lang/String; = "\u001f"

.field public static final INTELLIJ_DUMMY_IDENTIFIER_CHAR:C = '\u001f'

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

    .annotation runtime Ljava/lang/Deprecated;
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

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# instance fields
.field public final adjustColumnWidth:Z

.field public final applyColumnAlignment:Z

.field public final charWidthProvider:Lcom/vladsch/flexmark/util/mappers/CharWidthProvider;

.field public final colonWidth:I

.field public final dashWidth:I

.field public final dumpIntellijOffsets:Z

.field public final fillMissingColumns:Z

.field public final formatTableCaption:Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;

.field public final formatTableCaptionSpaces:Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;

.field public final formatTableIndentPrefix:Ljava/lang/String;

.field public final leadTrailPipes:Z

.field public final leftAlignMarker:Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;

.field public final minSeparatorColumnWidth:I

.field public final minSeparatorDashes:I

.field public final pipeWidth:I

.field public final removeCaption:Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public final spaceAroundPipes:Z

.field public final spacePad:I

.field public final spaceWidth:I

.field public final tableManipulator:Lcom/vladsch/flexmark/util/format/TableManipulator;

.field public final trimCellWhitespace:Z


# direct methods
.method static constructor <clinit>()V
    .locals 13

    .line 16
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const-string v3, "FORMAT_TABLE_LEAD_TRAIL_PIPES"

    invoke-direct {v0, v3, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_LEAD_TRAIL_PIPES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 17
    new-instance v3, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v4, "FORMAT_TABLE_SPACE_AROUND_PIPES"

    invoke-direct {v3, v4, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v3, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_SPACE_AROUND_PIPES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 18
    new-instance v4, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v5, "FORMAT_TABLE_ADJUST_COLUMN_WIDTH"

    invoke-direct {v4, v5, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v4, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_ADJUST_COLUMN_WIDTH:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 19
    new-instance v5, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v6, "FORMAT_TABLE_APPLY_COLUMN_ALIGNMENT"

    invoke-direct {v5, v6, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v5, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_APPLY_COLUMN_ALIGNMENT:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 20
    new-instance v6, Lcom/vladsch/flexmark/util/options/DataKey;

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    const-string v8, "FORMAT_TABLE_FILL_MISSING_COLUMNS"

    invoke-direct {v6, v8, v7}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v6, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_FILL_MISSING_COLUMNS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 22
    new-instance v8, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v9, "FORMAT_TABLE_LEFT_ALIGN_MARKER"

    sget-object v10, Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;->AS_IS:Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;

    invoke-direct {v8, v9, v10}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v8, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_LEFT_ALIGN_MARKER:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 23
    new-instance v9, Lcom/vladsch/flexmark/util/options/DataKey;

    const/4 v10, 0x3

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    const-string v11, "FORMAT_TABLE_MIN_SEPARATOR_COLUMN_WIDTH"

    invoke-direct {v9, v11, v10}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v9, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_MIN_SEPARATOR_COLUMN_WIDTH:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 24
    new-instance v10, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v11, "FORMAT_TABLE_MIN_SEPARATOR_DASHES"

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {v10, v11, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v10, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_MIN_SEPARATOR_DASHES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 25
    new-instance v1, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v11, "FORMAT_TABLE_TRIM_CELL_WHITESPACE"

    invoke-direct {v1, v11, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v1, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_TRIM_CELL_WHITESPACE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 26
    new-instance v2, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v11, "FORMAT_TABLE_CAPTION"

    sget-object v12, Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;->AS_IS:Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;

    invoke-direct {v2, v11, v12}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v2, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_CAPTION:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 27
    new-instance v2, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v11, "FORMAT_TABLE_CAPTION_SPACES"

    sget-object v12, Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;->AS_IS:Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;

    invoke-direct {v2, v11, v12}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v2, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_CAPTION_SPACES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 28
    new-instance v2, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v11, "FORMAT_TABLE_INDENT_PREFIX"

    const-string v12, ""

    invoke-direct {v2, v11, v12}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v2, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_INDENT_PREFIX:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 29
    new-instance v2, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v11, "FORMAT_TABLE_MANIPULATOR"

    sget-object v12, Lcom/vladsch/flexmark/util/format/TableManipulator;->NULL:Lcom/vladsch/flexmark/util/format/TableManipulator;

    invoke-direct {v2, v11, v12}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v2, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_MANIPULATOR:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 31
    new-instance v2, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v11, "FORMAT_CHAR_WIDTH_PROVIDER"

    sget-object v12, Lcom/vladsch/flexmark/util/mappers/CharWidthProvider;->NULL:Lcom/vladsch/flexmark/util/mappers/CharWidthProvider;

    invoke-direct {v2, v11, v12}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v2, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_CHAR_WIDTH_PROVIDER:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 33
    new-instance v11, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v12, "FORMAT_TABLE_DUMP_TRACKING_OFFSETS"

    invoke-direct {v11, v12, v7}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v11, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_DUMP_TRACKING_OFFSETS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 38
    new-instance v11, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v12, "REMOVE_CAPTION"

    invoke-direct {v11, v12, v7}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v11, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->REMOVE_CAPTION:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 43
    sput-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->LEAD_TRAIL_PIPES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 47
    sput-object v3, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->SPACE_AROUND_PIPES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 51
    sput-object v4, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->ADJUST_COLUMN_WIDTH:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 55
    sput-object v5, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->APPLY_COLUMN_ALIGNMENT:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 59
    sput-object v6, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FILL_MISSING_COLUMNS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 63
    sput-object v8, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->LEFT_ALIGN_MARKER:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 67
    sput-object v9, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->MIN_SEPARATOR_COLUMN_WIDTH:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 71
    sput-object v10, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->MIN_SEPARATOR_DASHES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 75
    sput-object v1, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->TRIM_CELL_WHITESPACE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 79
    sput-object v2, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->CHAR_WIDTH_PROVIDER:Lcom/vladsch/flexmark/util/options/DataKey;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 111
    invoke-direct {p0, v0}, Lcom/vladsch/flexmark/util/format/TableFormatOptions;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 3

    .line 114
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 115
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_LEAD_TRAIL_PIPES:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->leadTrailPipes:Z

    .line 116
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_SPACE_AROUND_PIPES:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->spaceAroundPipes:Z

    .line 117
    sget-object v1, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_ADJUST_COLUMN_WIDTH:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v1, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iput-boolean v1, p0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->adjustColumnWidth:Z

    .line 118
    sget-object v1, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_APPLY_COLUMN_ALIGNMENT:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v1, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iput-boolean v1, p0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->applyColumnAlignment:Z

    .line 119
    sget-object v1, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_FILL_MISSING_COLUMNS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v1, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iput-boolean v1, p0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->fillMissingColumns:Z

    .line 120
    sget-object v1, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_LEFT_ALIGN_MARKER:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v1, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;

    iput-object v1, p0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->leftAlignMarker:Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;

    .line 121
    sget-object v1, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->REMOVE_CAPTION:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v1, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iput-boolean v1, p0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->removeCaption:Z

    .line 122
    sget-object v1, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_MIN_SEPARATOR_COLUMN_WIDTH:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v1, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iput v1, p0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->minSeparatorColumnWidth:I

    .line 123
    sget-object v1, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_MIN_SEPARATOR_DASHES:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v1, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iput v1, p0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->minSeparatorDashes:I

    .line 124
    sget-object v1, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_CHAR_WIDTH_PROVIDER:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v1, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/mappers/CharWidthProvider;

    iput-object v1, p0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->charWidthProvider:Lcom/vladsch/flexmark/util/mappers/CharWidthProvider;

    .line 125
    sget-object v2, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_CAPTION:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v2, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;

    iput-object v2, p0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->formatTableCaption:Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;

    .line 126
    sget-object v2, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_CAPTION_SPACES:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v2, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;

    iput-object v2, p0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->formatTableCaptionSpaces:Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;

    .line 127
    sget-object v2, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_INDENT_PREFIX:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v2, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, p0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->formatTableIndentPrefix:Ljava/lang/String;

    .line 128
    sget-object v2, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_TRIM_CELL_WHITESPACE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v2, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    iput-boolean v2, p0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->trimCellWhitespace:Z

    .line 129
    sget-object v2, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_MANIPULATOR:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v2, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vladsch/flexmark/util/format/TableManipulator;

    iput-object v2, p0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->tableManipulator:Lcom/vladsch/flexmark/util/format/TableManipulator;

    .line 130
    sget-object v2, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_DUMP_TRACKING_OFFSETS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v2, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->dumpIntellijOffsets:Z

    .line 132
    invoke-interface {v1}, Lcom/vladsch/flexmark/util/mappers/CharWidthProvider;->spaceWidth()I

    move-result p1

    iput p1, p0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->spaceWidth:I

    if-eqz v0, :cond_0

    mul-int/lit8 p1, p1, 0x2

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 133
    :goto_0
    iput p1, p0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->spacePad:I

    const/16 p1, 0x7c

    .line 134
    invoke-interface {v1, p1}, Lcom/vladsch/flexmark/util/mappers/CharWidthProvider;->charWidth(C)I

    move-result p1

    iput p1, p0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->pipeWidth:I

    const/16 p1, 0x3a

    .line 135
    invoke-interface {v1, p1}, Lcom/vladsch/flexmark/util/mappers/CharWidthProvider;->charWidth(C)I

    move-result p1

    iput p1, p0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->colonWidth:I

    const/16 p1, 0x2d

    .line 136
    invoke-interface {v1, p1}, Lcom/vladsch/flexmark/util/mappers/CharWidthProvider;->charWidth(C)I

    move-result p1

    iput p1, p0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->dashWidth:I

    return-void
.end method


# virtual methods
.method public setIn(Lcom/vladsch/flexmark/util/options/MutableDataHolder;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;
    .locals 2

    .line 141
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_LEAD_TRAIL_PIPES:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->leadTrailPipes:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 142
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_SPACE_AROUND_PIPES:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->spaceAroundPipes:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 143
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_ADJUST_COLUMN_WIDTH:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->adjustColumnWidth:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 144
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_APPLY_COLUMN_ALIGNMENT:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->applyColumnAlignment:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 145
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_FILL_MISSING_COLUMNS:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->fillMissingColumns:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 146
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_LEFT_ALIGN_MARKER:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->leftAlignMarker:Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 147
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->REMOVE_CAPTION:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->removeCaption:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 148
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_MIN_SEPARATOR_COLUMN_WIDTH:Lcom/vladsch/flexmark/util/options/DataKey;

    iget v1, p0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->minSeparatorColumnWidth:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 149
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_MIN_SEPARATOR_DASHES:Lcom/vladsch/flexmark/util/options/DataKey;

    iget v1, p0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->minSeparatorDashes:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 150
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_CHAR_WIDTH_PROVIDER:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->charWidthProvider:Lcom/vladsch/flexmark/util/mappers/CharWidthProvider;

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 151
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_CAPTION:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->formatTableCaption:Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 152
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_CAPTION_SPACES:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->formatTableCaptionSpaces:Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 153
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_INDENT_PREFIX:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->formatTableIndentPrefix:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 154
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_TRIM_CELL_WHITESPACE:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->trimCellWhitespace:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 155
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_MANIPULATOR:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->tableManipulator:Lcom/vladsch/flexmark/util/format/TableManipulator;

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 156
    sget-object v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->FORMAT_TABLE_DUMP_TRACKING_OFFSETS:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->dumpIntellijOffsets:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    return-object p1
.end method
