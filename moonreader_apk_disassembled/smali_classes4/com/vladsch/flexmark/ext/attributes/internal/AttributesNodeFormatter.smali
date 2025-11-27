.class public Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter;
.super Ljava/lang/Object;
.source "AttributesNodeFormatter.java"

# interfaces
.implements Lcom/vladsch/flexmark/formatter/PhasedNodeFormatter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter$Factory;
    }
.end annotation


# static fields
.field public static final ATTRIBUTE_ORIGINAL_ID_MAP:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final ATTRIBUTE_TRANSLATED_MAP:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final ATTRIBUTE_TRANSLATION_ID:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final ATTRIBUTE_TRANSLATION_MAP:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field private attributeOriginalId:I

.field private attributeOriginalIdMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private attributeTranslatedMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private attributeTranslationMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 18
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v2, "ATTRIBUTE_TRANSLATION_MAP"

    invoke-direct {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter;->ATTRIBUTE_TRANSLATION_MAP:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 19
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v2, "ATTRIBUTE_TRANSLATED_MAP"

    invoke-direct {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter;->ATTRIBUTE_TRANSLATED_MAP:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 20
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v2, "ATTRIBUTE_ORIGINAL_ID_MAP"

    invoke-direct {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter;->ATTRIBUTE_ORIGINAL_ID_MAP:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 21
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "ATTRIBUTE_TRANSLATION_ID"

    invoke-direct {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter;->ATTRIBUTE_TRANSLATION_ID:Lcom/vladsch/flexmark/util/options/DataKey;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getEncodedIdAttribute(Ljava/lang/String;Ljava/lang/String;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)Ljava/lang/String;
    .locals 7

    .line 80
    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getTranslationStore()Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v1, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter;->ATTRIBUTE_TRANSLATION_MAP:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Ljava/util/Map;

    .line 81
    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getTranslationStore()Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v1, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter;->ATTRIBUTE_TRANSLATED_MAP:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Ljava/util/Map;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    .line 82
    invoke-static/range {v1 .. v6}, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter;->getEncodedIdAttribute(Ljava/lang/String;Ljava/lang/String;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;Ljava/util/Map;Ljava/util/Map;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static getEncodedIdAttribute(Ljava/lang/String;Ljava/lang/String;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;Ljava/util/Map;Ljava/util/Map;)Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/vladsch/flexmark/formatter/NodeFormatterContext;",
            "Lcom/vladsch/flexmark/formatter/MarkdownWriter;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 88
    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getTranslationStore()Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object p3

    sget-object v0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter;->ATTRIBUTE_TRANSLATION_ID:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p3, v0}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/Integer;

    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result p3

    .line 90
    sget-object v1, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter$3;->$SwitchMap$com$vladsch$flexmark$formatter$RenderPurpose:[I

    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getRenderPurpose()Lcom/vladsch/flexmark/formatter/RenderPurpose;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vladsch/flexmark/formatter/RenderPurpose;->ordinal()I

    move-result v2

    aget v1, v1, v2

    const/4 v2, 0x1

    if-eq v1, v2, :cond_1

    const/4 p4, 0x3

    if-eq v1, p4, :cond_0

    goto :goto_1

    .line 116
    :cond_0
    invoke-interface {p5, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-eqz p1, :cond_4

    .line 118
    invoke-interface {p5, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    goto :goto_1

    .line 92
    :cond_1
    invoke-interface {p4, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    const/4 v3, 0x0

    if-nez v1, :cond_2

    .line 93
    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getFormatterOptions()Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    move-result-object v1

    iget-object v1, v1, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->translationIdFormat:Ljava/lang/String;

    add-int/lit8 p3, p3, 0x1

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    new-array v5, v2, [Ljava/lang/Object;

    aput-object v4, v5, v3

    invoke-static {v1, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 94
    invoke-interface {p4, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    invoke-interface {p5, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object p0, v1

    goto :goto_0

    .line 97
    :cond_2
    invoke-interface {p4, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    :goto_0
    if-eqz p1, :cond_3

    .line 100
    invoke-interface {p4, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 101
    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getFormatterOptions()Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    move-result-object v1

    iget-object v1, v1, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->translationIdFormat:Ljava/lang/String;

    add-int/lit8 p3, p3, 0x1

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 102
    invoke-interface {p4, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    invoke-interface {p5, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object p1, v1

    goto :goto_1

    .line 105
    :cond_3
    invoke-interface {p4, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 128
    :cond_4
    :goto_1
    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getTranslationStore()Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object p2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-interface {p2, v0, p3}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    if-nez p1, :cond_5

    return-object p0

    .line 133
    :cond_5
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p0, 0x3a

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private getEncodedOriginalId(Ljava/lang/String;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;)Ljava/lang/String;
    .locals 5

    .line 138
    sget-object v0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter$3;->$SwitchMap$com$vladsch$flexmark$formatter$RenderPurpose:[I

    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getRenderPurpose()Lcom/vladsch/flexmark/formatter/RenderPurpose;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vladsch/flexmark/formatter/RenderPurpose;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x0

    const-string v2, "#"

    const/4 v3, 0x1

    if-eq v0, v3, :cond_2

    const/4 v4, 0x2

    if-eq v0, v4, :cond_1

    const/4 p2, 0x3

    if-eq v0, p2, :cond_0

    return-object p1

    .line 150
    :cond_0
    iget p2, p0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter;->attributeOriginalId:I

    add-int/2addr p2, v3

    iput p2, p0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter;->attributeOriginalId:I

    .line 151
    iget-object p2, p0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter;->attributeOriginalIdMap:Ljava/util/Map;

    invoke-interface {p2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1

    .line 147
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getFormatterOptions()Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    move-result-object p2

    iget-object p2, p2, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->translationIdFormat:Ljava/lang/String;

    iget v0, p0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter;->attributeOriginalId:I

    add-int/2addr v0, v3

    iput v0, p0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter;->attributeOriginalId:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    new-array v2, v3, [Ljava/lang/Object;

    aput-object v0, v2, v1

    invoke-static {p2, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 141
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getFormatterOptions()Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    move-result-object p2

    iget-object p2, p2, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->translationIdFormat:Ljava/lang/String;

    iget v2, p0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter;->attributeOriginalId:I

    add-int/2addr v2, v3

    iput v2, p0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter;->attributeOriginalId:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v2, v3, v1

    invoke-static {p2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 142
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter;->attributeOriginalIdMap:Ljava/util/Map;

    invoke-interface {v0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p2
.end method


# virtual methods
.method public getFormattingPhases()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/vladsch/flexmark/formatter/FormattingPhase;",
            ">;"
        }
    .end annotation

    .line 39
    sget-object v0, Lcom/vladsch/flexmark/formatter/FormattingPhase;->COLLECT:Lcom/vladsch/flexmark/formatter/FormattingPhase;

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getNodeClasses()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/Class<",
            "*>;>;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method public getNodeFormattingHandlers()Ljava/util/Set;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/vladsch/flexmark/formatter/NodeFormattingHandler<",
            "*>;>;"
        }
    .end annotation

    .line 63
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 64
    new-instance v1, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v2, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;

    new-instance v3, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter$1;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter$1;-><init>(Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 70
    new-instance v1, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v2, Lcom/vladsch/flexmark/ext/attributes/AttributesDelimiter;

    new-instance v3, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter$2;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter$2;-><init>(Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method render(Lcom/vladsch/flexmark/ext/attributes/AttributesNode;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 11

    move-object v3, p3

    .line 160
    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->isTransformingText()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 161
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->getOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 163
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->getChildren()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;

    move-result-object v0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    move-result-object v6

    const/4 v7, 0x1

    const/4 v0, 0x1

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/ast/Node;

    .line 164
    move-object v8, v1

    check-cast v8, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;

    if-nez v0, :cond_0

    const/16 v0, 0x20

    .line 165
    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(C)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 166
    :cond_0
    invoke-virtual {v8}, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->isId()Z

    move-result v0

    const/4 v9, 0x0

    if-eqz v0, :cond_5

    .line 168
    invoke-virtual {v8}, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->getValue()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v10

    const/16 v0, 0x3a

    .line 169
    invoke-interface {v10, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->indexOf(C)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    .line 171
    invoke-virtual {v8}, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter;->getEncodedOriginalId(Ljava/lang/String;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;)Ljava/lang/String;

    move-result-object v0

    .line 172
    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    goto/16 :goto_1

    .line 174
    :cond_1
    invoke-interface {v10, v9, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    add-int/lit8 v0, v0, 0x1

    .line 175
    invoke-interface {v10, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 176
    iget-object v4, p0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter;->attributeTranslationMap:Ljava/util/Map;

    iget-object v5, p0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter;->attributeTranslatedMap:Ljava/util/Map;

    move-object v2, v1

    move-object v1, v0

    move-object v0, v2

    move-object v2, p2

    invoke-static/range {v0 .. v5}, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter;->getEncodedIdAttribute(Ljava/lang/String;Ljava/lang/String;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;Ljava/util/Map;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    .line 177
    sget-object v1, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter$3;->$SwitchMap$com$vladsch$flexmark$formatter$RenderPurpose:[I

    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getRenderPurpose()Lcom/vladsch/flexmark/formatter/RenderPurpose;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vladsch/flexmark/formatter/RenderPurpose;->ordinal()I

    move-result v2

    aget v1, v1, v2

    const-string v2, "#"

    if-eq v1, v7, :cond_4

    const/4 v4, 0x2

    if-eq v1, v4, :cond_4

    const/4 v0, 0x3

    if-eq v1, v0, :cond_2

    .line 193
    invoke-virtual {v8}, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    goto :goto_1

    .line 187
    :cond_2
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter;->attributeOriginalIdMap:Ljava/util/Map;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-nez v0, :cond_3

    .line 188
    invoke-virtual {v8}, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_3
    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    goto :goto_1

    .line 181
    :cond_4
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 182
    iget-object v2, p0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter;->attributeOriginalIdMap:Ljava/util/Map;

    invoke-virtual {v8}, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v1, 0x23

    .line 183
    invoke-virtual {p3, v1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(C)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    goto :goto_1

    .line 198
    :cond_5
    const-string v0, "."

    invoke-virtual {v8}, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {p3, v0, v1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->appendNonTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    :goto_1
    const/4 v0, 0x0

    goto/16 :goto_0

    .line 202
    :cond_6
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->getClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void

    .line 204
    :cond_7
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void
.end method

.method public renderDocument(Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/formatter/FormattingPhase;)V
    .locals 1

    .line 45
    invoke-interface {p1}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->isTransformingText()Z

    move-result p2

    if-eqz p2, :cond_1

    .line 46
    invoke-interface {p1}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getRenderPurpose()Lcom/vladsch/flexmark/formatter/RenderPurpose;

    move-result-object p2

    sget-object p3, Lcom/vladsch/flexmark/formatter/RenderPurpose;->TRANSLATION_SPANS:Lcom/vladsch/flexmark/formatter/RenderPurpose;

    if-ne p2, p3, :cond_0

    .line 47
    invoke-interface {p1}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getTranslationStore()Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object p2

    sget-object p3, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter;->ATTRIBUTE_TRANSLATION_MAP:Lcom/vladsch/flexmark/util/options/DataKey;

    new-instance p4, Ljava/util/HashMap;

    invoke-direct {p4}, Ljava/util/HashMap;-><init>()V

    invoke-interface {p2, p3, p4}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 48
    invoke-interface {p1}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getTranslationStore()Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object p2

    sget-object p3, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter;->ATTRIBUTE_TRANSLATED_MAP:Lcom/vladsch/flexmark/util/options/DataKey;

    new-instance p4, Ljava/util/HashMap;

    invoke-direct {p4}, Ljava/util/HashMap;-><init>()V

    invoke-interface {p2, p3, p4}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 49
    invoke-interface {p1}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getTranslationStore()Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object p2

    sget-object p3, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter;->ATTRIBUTE_ORIGINAL_ID_MAP:Lcom/vladsch/flexmark/util/options/DataKey;

    new-instance p4, Ljava/util/HashMap;

    invoke-direct {p4}, Ljava/util/HashMap;-><init>()V

    invoke-interface {p2, p3, p4}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 51
    :cond_0
    invoke-interface {p1}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getTranslationStore()Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object p2

    sget-object p3, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter;->ATTRIBUTE_TRANSLATION_ID:Lcom/vladsch/flexmark/util/options/DataKey;

    const/4 p4, 0x0

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p2, p3, v0}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 52
    iput p4, p0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter;->attributeOriginalId:I

    .line 54
    invoke-interface {p1}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getTranslationStore()Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object p2

    sget-object p3, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter;->ATTRIBUTE_TRANSLATION_MAP:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p2, p3}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/Map;

    iput-object p2, p0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter;->attributeTranslationMap:Ljava/util/Map;

    .line 55
    invoke-interface {p1}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getTranslationStore()Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object p2

    sget-object p3, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter;->ATTRIBUTE_TRANSLATED_MAP:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p2, p3}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/Map;

    iput-object p2, p0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter;->attributeTranslatedMap:Ljava/util/Map;

    .line 56
    invoke-interface {p1}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getTranslationStore()Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object p1

    sget-object p2, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter;->ATTRIBUTE_ORIGINAL_ID_MAP:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, p2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map;

    iput-object p1, p0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter;->attributeOriginalIdMap:Ljava/util/Map;

    :cond_1
    return-void
.end method
