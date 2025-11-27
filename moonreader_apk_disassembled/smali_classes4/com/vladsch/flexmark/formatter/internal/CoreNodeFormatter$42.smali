.class synthetic Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$42;
.super Ljava/lang/Object;
.source "CoreNodeFormatter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$vladsch$flexmark$formatter$RenderPurpose:[I

.field static final synthetic $SwitchMap$com$vladsch$flexmark$util$format$options$BlockQuoteMarker:[I

.field static final synthetic $SwitchMap$com$vladsch$flexmark$util$format$options$CodeFenceMarker:[I

.field static final synthetic $SwitchMap$com$vladsch$flexmark$util$format$options$EqualizeTrailingMarker:[I

.field static final synthetic $SwitchMap$com$vladsch$flexmark$util$format$options$ListBulletMarker:[I

.field static final synthetic $SwitchMap$com$vladsch$flexmark$util$format$options$ListNumberedMarker:[I

.field static final synthetic $SwitchMap$com$vladsch$flexmark$util$format$options$ListSpacing:[I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 976
    invoke-static {}, Lcom/vladsch/flexmark/formatter/RenderPurpose;->values()[Lcom/vladsch/flexmark/formatter/RenderPurpose;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$42;->$SwitchMap$com$vladsch$flexmark$formatter$RenderPurpose:[I

    const/4 v1, 0x1

    :try_start_0
    sget-object v2, Lcom/vladsch/flexmark/formatter/RenderPurpose;->TRANSLATION_SPANS:Lcom/vladsch/flexmark/formatter/RenderPurpose;

    invoke-virtual {v2}, Lcom/vladsch/flexmark/formatter/RenderPurpose;->ordinal()I

    move-result v2

    aput v1, v0, v2
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    const/4 v0, 0x2

    :try_start_1
    sget-object v2, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$42;->$SwitchMap$com$vladsch$flexmark$formatter$RenderPurpose:[I

    sget-object v3, Lcom/vladsch/flexmark/formatter/RenderPurpose;->TRANSLATED_SPANS:Lcom/vladsch/flexmark/formatter/RenderPurpose;

    invoke-virtual {v3}, Lcom/vladsch/flexmark/formatter/RenderPurpose;->ordinal()I

    move-result v3

    aput v0, v2, v3
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    const/4 v2, 0x3

    :try_start_2
    sget-object v3, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$42;->$SwitchMap$com$vladsch$flexmark$formatter$RenderPurpose:[I

    sget-object v4, Lcom/vladsch/flexmark/formatter/RenderPurpose;->TRANSLATED:Lcom/vladsch/flexmark/formatter/RenderPurpose;

    invoke-virtual {v4}, Lcom/vladsch/flexmark/formatter/RenderPurpose;->ordinal()I

    move-result v4

    aput v2, v3, v4
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    :catch_2
    const/4 v3, 0x4

    :try_start_3
    sget-object v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$42;->$SwitchMap$com$vladsch$flexmark$formatter$RenderPurpose:[I

    sget-object v5, Lcom/vladsch/flexmark/formatter/RenderPurpose;->FORMAT:Lcom/vladsch/flexmark/formatter/RenderPurpose;

    invoke-virtual {v5}, Lcom/vladsch/flexmark/formatter/RenderPurpose;->ordinal()I

    move-result v5

    aput v3, v4, v5
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    .line 776
    :catch_3
    invoke-static {}, Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;->values()[Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;

    move-result-object v4

    array-length v4, v4

    new-array v4, v4, [I

    sput-object v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$42;->$SwitchMap$com$vladsch$flexmark$util$format$options$ListBulletMarker:[I

    :try_start_4
    sget-object v5, Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;->ANY:Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;

    invoke-virtual {v5}, Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;->ordinal()I

    move-result v5

    aput v1, v4, v5
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_4

    :catch_4
    :try_start_5
    sget-object v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$42;->$SwitchMap$com$vladsch$flexmark$util$format$options$ListBulletMarker:[I

    sget-object v5, Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;->DASH:Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;

    invoke-virtual {v5}, Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;->ordinal()I

    move-result v5

    aput v0, v4, v5
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_5

    :catch_5
    :try_start_6
    sget-object v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$42;->$SwitchMap$com$vladsch$flexmark$util$format$options$ListBulletMarker:[I

    sget-object v5, Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;->ASTERISK:Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;

    invoke-virtual {v5}, Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;->ordinal()I

    move-result v5

    aput v2, v4, v5
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_6

    :catch_6
    :try_start_7
    sget-object v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$42;->$SwitchMap$com$vladsch$flexmark$util$format$options$ListBulletMarker:[I

    sget-object v5, Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;->PLUS:Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;

    invoke-virtual {v5}, Lcom/vladsch/flexmark/util/format/options/ListBulletMarker;->ordinal()I

    move-result v5

    aput v3, v4, v5
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_7

    .line 754
    :catch_7
    invoke-static {}, Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;->values()[Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;

    move-result-object v4

    array-length v4, v4

    new-array v4, v4, [I

    sput-object v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$42;->$SwitchMap$com$vladsch$flexmark$util$format$options$ListNumberedMarker:[I

    :try_start_8
    sget-object v5, Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;->ANY:Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;

    invoke-virtual {v5}, Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;->ordinal()I

    move-result v5

    aput v1, v4, v5
    :try_end_8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_8} :catch_8

    :catch_8
    :try_start_9
    sget-object v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$42;->$SwitchMap$com$vladsch$flexmark$util$format$options$ListNumberedMarker:[I

    sget-object v5, Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;->DOT:Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;

    invoke-virtual {v5}, Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;->ordinal()I

    move-result v5

    aput v0, v4, v5
    :try_end_9
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_9} :catch_9

    :catch_9
    :try_start_a
    sget-object v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$42;->$SwitchMap$com$vladsch$flexmark$util$format$options$ListNumberedMarker:[I

    sget-object v5, Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;->PAREN:Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;

    invoke-virtual {v5}, Lcom/vladsch/flexmark/util/format/options/ListNumberedMarker;->ordinal()I

    move-result v5

    aput v2, v4, v5
    :try_end_a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_a .. :try_end_a} :catch_a

    .line 697
    :catch_a
    invoke-static {}, Lcom/vladsch/flexmark/util/format/options/ListSpacing;->values()[Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    move-result-object v4

    array-length v4, v4

    new-array v4, v4, [I

    sput-object v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$42;->$SwitchMap$com$vladsch$flexmark$util$format$options$ListSpacing:[I

    :try_start_b
    sget-object v5, Lcom/vladsch/flexmark/util/format/options/ListSpacing;->AS_IS:Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    invoke-virtual {v5}, Lcom/vladsch/flexmark/util/format/options/ListSpacing;->ordinal()I

    move-result v5

    aput v1, v4, v5
    :try_end_b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_b .. :try_end_b} :catch_b

    :catch_b
    :try_start_c
    sget-object v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$42;->$SwitchMap$com$vladsch$flexmark$util$format$options$ListSpacing:[I

    sget-object v5, Lcom/vladsch/flexmark/util/format/options/ListSpacing;->LOOSE:Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    invoke-virtual {v5}, Lcom/vladsch/flexmark/util/format/options/ListSpacing;->ordinal()I

    move-result v5

    aput v0, v4, v5
    :try_end_c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_c} :catch_c

    :catch_c
    :try_start_d
    sget-object v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$42;->$SwitchMap$com$vladsch$flexmark$util$format$options$ListSpacing:[I

    sget-object v5, Lcom/vladsch/flexmark/util/format/options/ListSpacing;->TIGHT:Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    invoke-virtual {v5}, Lcom/vladsch/flexmark/util/format/options/ListSpacing;->ordinal()I

    move-result v5

    aput v2, v4, v5
    :try_end_d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_d .. :try_end_d} :catch_d

    :catch_d
    :try_start_e
    sget-object v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$42;->$SwitchMap$com$vladsch$flexmark$util$format$options$ListSpacing:[I

    sget-object v5, Lcom/vladsch/flexmark/util/format/options/ListSpacing;->LOOSEN:Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    invoke-virtual {v5}, Lcom/vladsch/flexmark/util/format/options/ListSpacing;->ordinal()I

    move-result v5

    aput v3, v4, v5
    :try_end_e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_e .. :try_end_e} :catch_e

    :catch_e
    :try_start_f
    sget-object v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$42;->$SwitchMap$com$vladsch$flexmark$util$format$options$ListSpacing:[I

    sget-object v5, Lcom/vladsch/flexmark/util/format/options/ListSpacing;->TIGHTEN:Lcom/vladsch/flexmark/util/format/options/ListSpacing;

    invoke-virtual {v5}, Lcom/vladsch/flexmark/util/format/options/ListSpacing;->ordinal()I

    move-result v5

    const/4 v6, 0x5

    aput v6, v4, v5
    :try_end_f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_f .. :try_end_f} :catch_f

    .line 542
    :catch_f
    invoke-static {}, Lcom/vladsch/flexmark/util/format/options/CodeFenceMarker;->values()[Lcom/vladsch/flexmark/util/format/options/CodeFenceMarker;

    move-result-object v4

    array-length v4, v4

    new-array v4, v4, [I

    sput-object v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$42;->$SwitchMap$com$vladsch$flexmark$util$format$options$CodeFenceMarker:[I

    :try_start_10
    sget-object v5, Lcom/vladsch/flexmark/util/format/options/CodeFenceMarker;->ANY:Lcom/vladsch/flexmark/util/format/options/CodeFenceMarker;

    invoke-virtual {v5}, Lcom/vladsch/flexmark/util/format/options/CodeFenceMarker;->ordinal()I

    move-result v5

    aput v1, v4, v5
    :try_end_10
    .catch Ljava/lang/NoSuchFieldError; {:try_start_10 .. :try_end_10} :catch_10

    :catch_10
    :try_start_11
    sget-object v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$42;->$SwitchMap$com$vladsch$flexmark$util$format$options$CodeFenceMarker:[I

    sget-object v5, Lcom/vladsch/flexmark/util/format/options/CodeFenceMarker;->BACK_TICK:Lcom/vladsch/flexmark/util/format/options/CodeFenceMarker;

    invoke-virtual {v5}, Lcom/vladsch/flexmark/util/format/options/CodeFenceMarker;->ordinal()I

    move-result v5

    aput v0, v4, v5
    :try_end_11
    .catch Ljava/lang/NoSuchFieldError; {:try_start_11 .. :try_end_11} :catch_11

    :catch_11
    :try_start_12
    sget-object v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$42;->$SwitchMap$com$vladsch$flexmark$util$format$options$CodeFenceMarker:[I

    sget-object v5, Lcom/vladsch/flexmark/util/format/options/CodeFenceMarker;->TILDE:Lcom/vladsch/flexmark/util/format/options/CodeFenceMarker;

    invoke-virtual {v5}, Lcom/vladsch/flexmark/util/format/options/CodeFenceMarker;->ordinal()I

    move-result v5

    aput v2, v4, v5
    :try_end_12
    .catch Ljava/lang/NoSuchFieldError; {:try_start_12 .. :try_end_12} :catch_12

    .line 484
    :catch_12
    invoke-static {}, Lcom/vladsch/flexmark/util/format/options/BlockQuoteMarker;->values()[Lcom/vladsch/flexmark/util/format/options/BlockQuoteMarker;

    move-result-object v4

    array-length v4, v4

    new-array v4, v4, [I

    sput-object v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$42;->$SwitchMap$com$vladsch$flexmark$util$format$options$BlockQuoteMarker:[I

    :try_start_13
    sget-object v5, Lcom/vladsch/flexmark/util/format/options/BlockQuoteMarker;->AS_IS:Lcom/vladsch/flexmark/util/format/options/BlockQuoteMarker;

    invoke-virtual {v5}, Lcom/vladsch/flexmark/util/format/options/BlockQuoteMarker;->ordinal()I

    move-result v5

    aput v1, v4, v5
    :try_end_13
    .catch Ljava/lang/NoSuchFieldError; {:try_start_13 .. :try_end_13} :catch_13

    :catch_13
    :try_start_14
    sget-object v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$42;->$SwitchMap$com$vladsch$flexmark$util$format$options$BlockQuoteMarker:[I

    sget-object v5, Lcom/vladsch/flexmark/util/format/options/BlockQuoteMarker;->ADD_COMPACT:Lcom/vladsch/flexmark/util/format/options/BlockQuoteMarker;

    invoke-virtual {v5}, Lcom/vladsch/flexmark/util/format/options/BlockQuoteMarker;->ordinal()I

    move-result v5

    aput v0, v4, v5
    :try_end_14
    .catch Ljava/lang/NoSuchFieldError; {:try_start_14 .. :try_end_14} :catch_14

    :catch_14
    :try_start_15
    sget-object v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$42;->$SwitchMap$com$vladsch$flexmark$util$format$options$BlockQuoteMarker:[I

    sget-object v5, Lcom/vladsch/flexmark/util/format/options/BlockQuoteMarker;->ADD_COMPACT_WITH_SPACE:Lcom/vladsch/flexmark/util/format/options/BlockQuoteMarker;

    invoke-virtual {v5}, Lcom/vladsch/flexmark/util/format/options/BlockQuoteMarker;->ordinal()I

    move-result v5

    aput v2, v4, v5
    :try_end_15
    .catch Ljava/lang/NoSuchFieldError; {:try_start_15 .. :try_end_15} :catch_15

    :catch_15
    :try_start_16
    sget-object v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$42;->$SwitchMap$com$vladsch$flexmark$util$format$options$BlockQuoteMarker:[I

    sget-object v5, Lcom/vladsch/flexmark/util/format/options/BlockQuoteMarker;->ADD_SPACED:Lcom/vladsch/flexmark/util/format/options/BlockQuoteMarker;

    invoke-virtual {v5}, Lcom/vladsch/flexmark/util/format/options/BlockQuoteMarker;->ordinal()I

    move-result v5

    aput v3, v4, v5
    :try_end_16
    .catch Ljava/lang/NoSuchFieldError; {:try_start_16 .. :try_end_16} :catch_16

    .line 440
    :catch_16
    invoke-static {}, Lcom/vladsch/flexmark/util/format/options/EqualizeTrailingMarker;->values()[Lcom/vladsch/flexmark/util/format/options/EqualizeTrailingMarker;

    move-result-object v4

    array-length v4, v4

    new-array v4, v4, [I

    sput-object v4, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$42;->$SwitchMap$com$vladsch$flexmark$util$format$options$EqualizeTrailingMarker:[I

    :try_start_17
    sget-object v5, Lcom/vladsch/flexmark/util/format/options/EqualizeTrailingMarker;->EQUALIZE:Lcom/vladsch/flexmark/util/format/options/EqualizeTrailingMarker;

    invoke-virtual {v5}, Lcom/vladsch/flexmark/util/format/options/EqualizeTrailingMarker;->ordinal()I

    move-result v5

    aput v1, v4, v5
    :try_end_17
    .catch Ljava/lang/NoSuchFieldError; {:try_start_17 .. :try_end_17} :catch_17

    :catch_17
    :try_start_18
    sget-object v1, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$42;->$SwitchMap$com$vladsch$flexmark$util$format$options$EqualizeTrailingMarker:[I

    sget-object v4, Lcom/vladsch/flexmark/util/format/options/EqualizeTrailingMarker;->ADD:Lcom/vladsch/flexmark/util/format/options/EqualizeTrailingMarker;

    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/format/options/EqualizeTrailingMarker;->ordinal()I

    move-result v4

    aput v0, v1, v4
    :try_end_18
    .catch Ljava/lang/NoSuchFieldError; {:try_start_18 .. :try_end_18} :catch_18

    :catch_18
    :try_start_19
    sget-object v0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$42;->$SwitchMap$com$vladsch$flexmark$util$format$options$EqualizeTrailingMarker:[I

    sget-object v1, Lcom/vladsch/flexmark/util/format/options/EqualizeTrailingMarker;->REMOVE:Lcom/vladsch/flexmark/util/format/options/EqualizeTrailingMarker;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/format/options/EqualizeTrailingMarker;->ordinal()I

    move-result v1

    aput v2, v0, v1
    :try_end_19
    .catch Ljava/lang/NoSuchFieldError; {:try_start_19 .. :try_end_19} :catch_19

    :catch_19
    :try_start_1a
    sget-object v0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$42;->$SwitchMap$com$vladsch$flexmark$util$format$options$EqualizeTrailingMarker:[I

    sget-object v1, Lcom/vladsch/flexmark/util/format/options/EqualizeTrailingMarker;->AS_IS:Lcom/vladsch/flexmark/util/format/options/EqualizeTrailingMarker;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/format/options/EqualizeTrailingMarker;->ordinal()I

    move-result v1

    aput v3, v0, v1
    :try_end_1a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1a .. :try_end_1a} :catch_1a

    :catch_1a
    return-void
.end method
