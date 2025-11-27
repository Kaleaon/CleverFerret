.class public Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeFormatter;
.super Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;
.source "AbbreviationNodeFormatter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeFormatter$Factory;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter<",
        "Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationRepository;",
        "Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;",
        "Lcom/vladsch/flexmark/ext/abbreviation/Abbreviation;",
        ">;"
    }
.end annotation


# static fields
.field public static final ABBREVIATION_TRANSLATION_MAP:Lcom/vladsch/flexmark/util/options/DataKey;
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
.field private final options:Lcom/vladsch/flexmark/ext/abbreviation/internal/FormatOptions;

.field private final transformUnderscores:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 17
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v2, "ABBREVIATION_TRANSLATION_MAP"

    invoke-direct {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeFormatter;->ABBREVIATION_TRANSLATION_MAP:Lcom/vladsch/flexmark/util/options/DataKey;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 4

    .line 22
    sget-object v0, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeFormatter;->ABBREVIATION_TRANSLATION_MAP:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-direct {p0, p1, v0}, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;Lcom/vladsch/flexmark/util/options/DataKey;)V

    .line 23
    new-instance v0, Lcom/vladsch/flexmark/ext/abbreviation/internal/FormatOptions;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/ext/abbreviation/internal/FormatOptions;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeFormatter;->options:Lcom/vladsch/flexmark/ext/abbreviation/internal/FormatOptions;

    .line 25
    sget-object v0, Lcom/vladsch/flexmark/formatter/Formatter;->TRANSLATION_ID_FORMAT:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-array v2, v0, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v1, v2, v3

    invoke-static {p1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 26
    const-string v1, "_"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {p1, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeFormatter;->transformUnderscores:Z

    return-void
.end method

.method static synthetic access$000(Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeFormatter;Lcom/vladsch/flexmark/ext/abbreviation/Abbreviation;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 16
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeFormatter;->render(Lcom/vladsch/flexmark/ext/abbreviation/Abbreviation;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$100(Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeFormatter;Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 16
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeFormatter;->render(Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ext/abbreviation/Abbreviation;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 1

    .line 95
    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->isTransformingText()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 96
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/abbreviation/Abbreviation;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeFormatter;->transformReferenceId(Ljava/lang/String;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;)Ljava/lang/String;

    move-result-object p1

    .line 97
    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void

    .line 99
    :cond_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/abbreviation/Abbreviation;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 91
    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeFormatter;->renderReference(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method


# virtual methods
.method public getNodeClasses()Ljava/util/Set;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/Class<",
            "*>;>;"
        }
    .end annotation

    .line 83
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeFormatter;->options:Lcom/vladsch/flexmark/ext/abbreviation/internal/FormatOptions;

    iget-object v0, v0, Lcom/vladsch/flexmark/ext/abbreviation/internal/FormatOptions;->abbreviationsPlacement:Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    sget-object v1, Lcom/vladsch/flexmark/util/format/options/ElementPlacement;->AS_IS:Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeFormatter;->options:Lcom/vladsch/flexmark/ext/abbreviation/internal/FormatOptions;

    iget-object v0, v0, Lcom/vladsch/flexmark/ext/abbreviation/internal/FormatOptions;->abbreviationsSort:Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;

    sget-object v1, Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;->SORT_UNUSED_LAST:Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 85
    :cond_0
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Class;

    const-class v2, Lcom/vladsch/flexmark/ext/abbreviation/Abbreviation;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public getNodeFormattingHandlers()Ljava/util/Set;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/vladsch/flexmark/formatter/NodeFormattingHandler<",
            "*>;>;"
        }
    .end annotation

    .line 65
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x2

    new-array v1, v1, [Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ext/abbreviation/Abbreviation;

    new-instance v4, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeFormatter$1;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeFormatter$1;-><init>(Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/4 v3, 0x0

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;

    new-instance v4, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeFormatter$2;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeFormatter$2;-><init>(Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public getReferencePlacement()Lcom/vladsch/flexmark/util/format/options/ElementPlacement;
    .locals 1

    .line 36
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeFormatter;->options:Lcom/vladsch/flexmark/ext/abbreviation/internal/FormatOptions;

    iget-object v0, v0, Lcom/vladsch/flexmark/ext/abbreviation/internal/FormatOptions;->abbreviationsPlacement:Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    return-object v0
.end method

.method public getReferenceSort()Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;
    .locals 1

    .line 41
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeFormatter;->options:Lcom/vladsch/flexmark/ext/abbreviation/internal/FormatOptions;

    iget-object v0, v0, Lcom/vladsch/flexmark/ext/abbreviation/internal/FormatOptions;->abbreviationsSort:Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;

    return-object v0
.end method

.method public getRepository(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationRepository;
    .locals 1

    .line 31
    sget-object v0, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationExtension;->ABBREVIATIONS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationRepository;

    return-object p1
.end method

.method public bridge synthetic getRepository(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/util/ast/NodeRepository;
    .locals 0

    .line 16
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeFormatter;->getRepository(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationRepository;

    move-result-object p1

    return-object p1
.end method

.method public modifyTransformedReference(Ljava/lang/String;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;)Ljava/lang/String;
    .locals 3

    .line 46
    iget-boolean v0, p0, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeFormatter;->transformUnderscores:Z

    if-eqz v0, :cond_1

    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->isTransformingText()Z

    move-result p2

    if-eqz p2, :cond_1

    .line 47
    const-string p2, "-"

    invoke-virtual {p1, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    const-string v2, "_"

    if-eqz v0, :cond_0

    invoke-virtual {p1, p2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 48
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    sub-int/2addr v0, v1

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 49
    :cond_0
    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 50
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v2, v1

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_1
    return-object p1
.end method

.method public renderReferenceBlock(Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 2

    .line 59
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->getOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object v0

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, p2}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeFormatter;->transformReferenceId(Ljava/lang/String;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p2

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->getClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p2

    const/16 v0, 0x20

    invoke-virtual {p2, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(C)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 60
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->getAbbreviation()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->appendTranslating(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p1

    invoke-virtual {p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->line()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void
.end method

.method public bridge synthetic renderReferenceBlock(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 16
    check-cast p1, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;

    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodeFormatter;->renderReferenceBlock(Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method
