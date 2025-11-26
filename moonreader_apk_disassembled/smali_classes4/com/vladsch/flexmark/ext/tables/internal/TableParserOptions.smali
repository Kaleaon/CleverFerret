.class Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;
.super Ljava/lang/Object;
.source "TableParserOptions.java"


# instance fields
.field public final appendMissingColumns:Z

.field public final className:Ljava/lang/String;

.field public final columnSpans:Z

.field public final discardExtraColumns:Z

.field public final headerSeparatorColumnMatch:Z

.field public final maxHeaderRows:I

.field public final minHeaderRows:I

.field public final minSeparatorDashes:I

.field public final multiLineRows:Z

.field public final trimCellWhitespace:Z

.field public final withCaption:Z


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 1

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    sget-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->MAX_HEADER_ROWS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;->maxHeaderRows:I

    .line 21
    sget-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->MIN_HEADER_ROWS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;->minHeaderRows:I

    .line 22
    sget-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->MIN_SEPARATOR_DASHES:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;->minSeparatorDashes:I

    .line 23
    sget-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->APPEND_MISSING_COLUMNS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;->appendMissingColumns:Z

    .line 24
    sget-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->DISCARD_EXTRA_COLUMNS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;->discardExtraColumns:Z

    .line 25
    sget-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->COLUMN_SPANS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;->columnSpans:Z

    .line 26
    sget-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->TRIM_CELL_WHITESPACE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;->trimCellWhitespace:Z

    .line 27
    sget-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->HEADER_SEPARATOR_COLUMN_MATCH:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;->headerSeparatorColumnMatch:Z

    .line 28
    sget-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->CLASS_NAME:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;->className:Ljava/lang/String;

    .line 29
    sget-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->WITH_CAPTION:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;->withCaption:Z

    .line 30
    sget-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->MULTI_LINE_ROWS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;->multiLineRows:Z

    return-void
.end method
