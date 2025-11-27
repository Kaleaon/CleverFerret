.class synthetic Lcom/vladsch/flexmark/util/format/MarkdownTable$8;
.super Ljava/lang/Object;
.source "MarkdownTable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/util/format/MarkdownTable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$vladsch$flexmark$util$format$options$DiscretionaryText:[I

.field static final synthetic $SwitchMap$com$vladsch$flexmark$util$format$options$TableCaptionHandling:[I

.field static final synthetic $SwitchMap$com$vladsch$flexmark$util$html$CellAlignment:[I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1232
    invoke-static {}, Lcom/vladsch/flexmark/util/html/CellAlignment;->values()[Lcom/vladsch/flexmark/util/html/CellAlignment;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/vladsch/flexmark/util/format/MarkdownTable$8;->$SwitchMap$com$vladsch$flexmark$util$html$CellAlignment:[I

    const/4 v1, 0x1

    :try_start_0
    sget-object v2, Lcom/vladsch/flexmark/util/html/CellAlignment;->LEFT:Lcom/vladsch/flexmark/util/html/CellAlignment;

    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/html/CellAlignment;->ordinal()I

    move-result v2

    aput v1, v0, v2
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    const/4 v0, 0x2

    :try_start_1
    sget-object v2, Lcom/vladsch/flexmark/util/format/MarkdownTable$8;->$SwitchMap$com$vladsch$flexmark$util$html$CellAlignment:[I

    sget-object v3, Lcom/vladsch/flexmark/util/html/CellAlignment;->RIGHT:Lcom/vladsch/flexmark/util/html/CellAlignment;

    invoke-virtual {v3}, Lcom/vladsch/flexmark/util/html/CellAlignment;->ordinal()I

    move-result v3

    aput v0, v2, v3
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    const/4 v2, 0x3

    :try_start_2
    sget-object v3, Lcom/vladsch/flexmark/util/format/MarkdownTable$8;->$SwitchMap$com$vladsch$flexmark$util$html$CellAlignment:[I

    sget-object v4, Lcom/vladsch/flexmark/util/html/CellAlignment;->CENTER:Lcom/vladsch/flexmark/util/html/CellAlignment;

    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/html/CellAlignment;->ordinal()I

    move-result v4

    aput v2, v3, v4
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    .line 1036
    :catch_2
    invoke-static {}, Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;->values()[Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;

    move-result-object v3

    array-length v3, v3

    new-array v3, v3, [I

    sput-object v3, Lcom/vladsch/flexmark/util/format/MarkdownTable$8;->$SwitchMap$com$vladsch$flexmark$util$format$options$TableCaptionHandling:[I

    :try_start_3
    sget-object v4, Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;->ADD:Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;

    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;->ordinal()I

    move-result v4

    aput v1, v3, v4
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    :catch_3
    :try_start_4
    sget-object v3, Lcom/vladsch/flexmark/util/format/MarkdownTable$8;->$SwitchMap$com$vladsch$flexmark$util$format$options$TableCaptionHandling:[I

    sget-object v4, Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;->REMOVE_EMPTY:Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;

    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;->ordinal()I

    move-result v4

    aput v0, v3, v4
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_4

    :catch_4
    :try_start_5
    sget-object v3, Lcom/vladsch/flexmark/util/format/MarkdownTable$8;->$SwitchMap$com$vladsch$flexmark$util$format$options$TableCaptionHandling:[I

    sget-object v4, Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;->REMOVE:Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;

    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;->ordinal()I

    move-result v4

    aput v2, v3, v4
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_5

    :catch_5
    :try_start_6
    sget-object v3, Lcom/vladsch/flexmark/util/format/MarkdownTable$8;->$SwitchMap$com$vladsch$flexmark$util$format$options$TableCaptionHandling:[I

    sget-object v4, Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;->AS_IS:Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;

    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/format/options/TableCaptionHandling;->ordinal()I

    move-result v4

    const/4 v5, 0x4

    aput v5, v3, v4
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_6

    .line 962
    :catch_6
    invoke-static {}, Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;->values()[Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;

    move-result-object v3

    array-length v3, v3

    new-array v3, v3, [I

    sput-object v3, Lcom/vladsch/flexmark/util/format/MarkdownTable$8;->$SwitchMap$com$vladsch$flexmark$util$format$options$DiscretionaryText:[I

    :try_start_7
    sget-object v4, Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;->ADD:Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;

    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;->ordinal()I

    move-result v4

    aput v1, v3, v4
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_7

    :catch_7
    :try_start_8
    sget-object v1, Lcom/vladsch/flexmark/util/format/MarkdownTable$8;->$SwitchMap$com$vladsch$flexmark$util$format$options$DiscretionaryText:[I

    sget-object v3, Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;->REMOVE:Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;

    invoke-virtual {v3}, Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;->ordinal()I

    move-result v3

    aput v0, v1, v3
    :try_end_8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_8} :catch_8

    :catch_8
    :try_start_9
    sget-object v0, Lcom/vladsch/flexmark/util/format/MarkdownTable$8;->$SwitchMap$com$vladsch$flexmark$util$format$options$DiscretionaryText:[I

    sget-object v1, Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;->AS_IS:Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/format/options/DiscretionaryText;->ordinal()I

    move-result v1

    aput v2, v0, v1
    :try_end_9
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_9} :catch_9

    :catch_9
    return-void
.end method
