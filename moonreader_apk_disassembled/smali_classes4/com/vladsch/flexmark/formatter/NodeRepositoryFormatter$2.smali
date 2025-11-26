.class synthetic Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter$2;
.super Ljava/lang/Object;
.source "NodeRepositoryFormatter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$vladsch$flexmark$formatter$FormattingPhase:[I

.field static final synthetic $SwitchMap$com$vladsch$flexmark$formatter$RenderPurpose:[I

.field static final synthetic $SwitchMap$com$vladsch$flexmark$util$format$options$ElementPlacement:[I

.field static final synthetic $SwitchMap$com$vladsch$flexmark$util$format$options$ElementPlacementSort:[I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 196
    invoke-static {}, Lcom/vladsch/flexmark/util/format/options/ElementPlacement;->values()[Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter$2;->$SwitchMap$com$vladsch$flexmark$util$format$options$ElementPlacement:[I

    const/4 v1, 0x1

    :try_start_0
    sget-object v2, Lcom/vladsch/flexmark/util/format/options/ElementPlacement;->AS_IS:Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/format/options/ElementPlacement;->ordinal()I

    move-result v2

    aput v1, v0, v2
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    const/4 v0, 0x2

    :try_start_1
    sget-object v2, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter$2;->$SwitchMap$com$vladsch$flexmark$util$format$options$ElementPlacement:[I

    sget-object v3, Lcom/vladsch/flexmark/util/format/options/ElementPlacement;->GROUP_WITH_FIRST:Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    invoke-virtual {v3}, Lcom/vladsch/flexmark/util/format/options/ElementPlacement;->ordinal()I

    move-result v3

    aput v0, v2, v3
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    const/4 v2, 0x3

    :try_start_2
    sget-object v3, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter$2;->$SwitchMap$com$vladsch$flexmark$util$format$options$ElementPlacement:[I

    sget-object v4, Lcom/vladsch/flexmark/util/format/options/ElementPlacement;->GROUP_WITH_LAST:Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/format/options/ElementPlacement;->ordinal()I

    move-result v4

    aput v2, v3, v4
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    .line 160
    :catch_2
    invoke-static {}, Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;->values()[Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;

    move-result-object v3

    array-length v3, v3

    new-array v3, v3, [I

    sput-object v3, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter$2;->$SwitchMap$com$vladsch$flexmark$util$format$options$ElementPlacementSort:[I

    :try_start_3
    sget-object v4, Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;->AS_IS:Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;

    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;->ordinal()I

    move-result v4

    aput v1, v3, v4
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    :catch_3
    :try_start_4
    sget-object v3, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter$2;->$SwitchMap$com$vladsch$flexmark$util$format$options$ElementPlacementSort:[I

    sget-object v4, Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;->SORT:Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;

    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;->ordinal()I

    move-result v4

    aput v0, v3, v4
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_4

    :catch_4
    :try_start_5
    sget-object v3, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter$2;->$SwitchMap$com$vladsch$flexmark$util$format$options$ElementPlacementSort:[I

    sget-object v4, Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;->SORT_UNUSED_LAST:Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;

    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;->ordinal()I

    move-result v4

    aput v2, v3, v4
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_5

    .line 120
    :catch_5
    invoke-static {}, Lcom/vladsch/flexmark/formatter/FormattingPhase;->values()[Lcom/vladsch/flexmark/formatter/FormattingPhase;

    move-result-object v3

    array-length v3, v3

    new-array v3, v3, [I

    sput-object v3, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter$2;->$SwitchMap$com$vladsch$flexmark$formatter$FormattingPhase:[I

    :try_start_6
    sget-object v4, Lcom/vladsch/flexmark/formatter/FormattingPhase;->COLLECT:Lcom/vladsch/flexmark/formatter/FormattingPhase;

    invoke-virtual {v4}, Lcom/vladsch/flexmark/formatter/FormattingPhase;->ordinal()I

    move-result v4

    aput v1, v3, v4
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_6

    :catch_6
    :try_start_7
    sget-object v3, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter$2;->$SwitchMap$com$vladsch$flexmark$formatter$FormattingPhase:[I

    sget-object v4, Lcom/vladsch/flexmark/formatter/FormattingPhase;->DOCUMENT_TOP:Lcom/vladsch/flexmark/formatter/FormattingPhase;

    invoke-virtual {v4}, Lcom/vladsch/flexmark/formatter/FormattingPhase;->ordinal()I

    move-result v4

    aput v0, v3, v4
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_7

    :catch_7
    :try_start_8
    sget-object v3, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter$2;->$SwitchMap$com$vladsch$flexmark$formatter$FormattingPhase:[I

    sget-object v4, Lcom/vladsch/flexmark/formatter/FormattingPhase;->DOCUMENT_BOTTOM:Lcom/vladsch/flexmark/formatter/FormattingPhase;

    invoke-virtual {v4}, Lcom/vladsch/flexmark/formatter/FormattingPhase;->ordinal()I

    move-result v4

    aput v2, v3, v4
    :try_end_8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_8} :catch_8

    .line 58
    :catch_8
    invoke-static {}, Lcom/vladsch/flexmark/formatter/RenderPurpose;->values()[Lcom/vladsch/flexmark/formatter/RenderPurpose;

    move-result-object v3

    array-length v3, v3

    new-array v3, v3, [I

    sput-object v3, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter$2;->$SwitchMap$com$vladsch$flexmark$formatter$RenderPurpose:[I

    :try_start_9
    sget-object v4, Lcom/vladsch/flexmark/formatter/RenderPurpose;->TRANSLATION_SPANS:Lcom/vladsch/flexmark/formatter/RenderPurpose;

    invoke-virtual {v4}, Lcom/vladsch/flexmark/formatter/RenderPurpose;->ordinal()I

    move-result v4

    aput v1, v3, v4
    :try_end_9
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_9} :catch_9

    :catch_9
    :try_start_a
    sget-object v1, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter$2;->$SwitchMap$com$vladsch$flexmark$formatter$RenderPurpose:[I

    sget-object v3, Lcom/vladsch/flexmark/formatter/RenderPurpose;->TRANSLATED_SPANS:Lcom/vladsch/flexmark/formatter/RenderPurpose;

    invoke-virtual {v3}, Lcom/vladsch/flexmark/formatter/RenderPurpose;->ordinal()I

    move-result v3

    aput v0, v1, v3
    :try_end_a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_a .. :try_end_a} :catch_a

    :catch_a
    :try_start_b
    sget-object v0, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter$2;->$SwitchMap$com$vladsch$flexmark$formatter$RenderPurpose:[I

    sget-object v1, Lcom/vladsch/flexmark/formatter/RenderPurpose;->TRANSLATED:Lcom/vladsch/flexmark/formatter/RenderPurpose;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/formatter/RenderPurpose;->ordinal()I

    move-result v1

    aput v2, v0, v1
    :try_end_b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_b .. :try_end_b} :catch_b

    :catch_b
    :try_start_c
    sget-object v0, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter$2;->$SwitchMap$com$vladsch$flexmark$formatter$RenderPurpose:[I

    sget-object v1, Lcom/vladsch/flexmark/formatter/RenderPurpose;->FORMAT:Lcom/vladsch/flexmark/formatter/RenderPurpose;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/formatter/RenderPurpose;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_c} :catch_c

    :catch_c
    return-void
.end method
