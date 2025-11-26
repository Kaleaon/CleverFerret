.class public abstract Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;
.super Ljava/lang/Object;
.source "NodeRepositoryFormatter.java"

# interfaces
.implements Lcom/vladsch/flexmark/formatter/PhasedNodeFormatter;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R:",
        "Lcom/vladsch/flexmark/util/ast/NodeRepository<",
        "TB;>;B:",
        "Lcom/vladsch/flexmark/util/ast/Node;",
        ":",
        "Lcom/vladsch/flexmark/util/ast/ReferenceNode<",
        "TR;TB;TN;>;N:",
        "Lcom/vladsch/flexmark/util/ast/Node;",
        ":",
        "Lcom/vladsch/flexmark/util/ast/ReferencingNode<",
        "TR;TB;>;>",
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/formatter/PhasedNodeFormatter;"
    }
.end annotation


# static fields
.field public static final FORMATTING_PHASES:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Lcom/vladsch/flexmark/formatter/FormattingPhase;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field protected final lastReference:Lcom/vladsch/flexmark/util/ast/Node;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TB;"
        }
    .end annotation
.end field

.field protected final myComparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "TB;>;"
        }
    .end annotation
.end field

.field private myContext:Lcom/vladsch/flexmark/formatter/NodeFormatterContext;

.field private final myReferenceMapKey:Lcom/vladsch/flexmark/util/options/DataKey;
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

.field protected recheckUndefinedReferences:Z

.field protected final referenceList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "TB;>;"
        }
    .end annotation
.end field

.field protected final referenceRepository:Lcom/vladsch/flexmark/util/ast/NodeRepository;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TR;"
        }
    .end annotation
.end field

.field private referenceTranslationMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected repositoryNodesDone:Z

.field protected final unusedReferences:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 15
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x3

    new-array v1, v1, [Lcom/vladsch/flexmark/formatter/FormattingPhase;

    const/4 v2, 0x0

    sget-object v3, Lcom/vladsch/flexmark/formatter/FormattingPhase;->COLLECT:Lcom/vladsch/flexmark/formatter/FormattingPhase;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    sget-object v3, Lcom/vladsch/flexmark/formatter/FormattingPhase;->DOCUMENT_TOP:Lcom/vladsch/flexmark/formatter/FormattingPhase;

    aput-object v3, v1, v2

    const/4 v2, 0x2

    sget-object v3, Lcom/vladsch/flexmark/formatter/FormattingPhase;->DOCUMENT_BOTTOM:Lcom/vladsch/flexmark/formatter/FormattingPhase;

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->FORMATTING_PHASES:Ljava/util/HashSet;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;Lcom/vladsch/flexmark/util/options/DataKey;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/options/DataHolder;",
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    iput-object p2, p0, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->myReferenceMapKey:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 88
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->getRepository(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/util/ast/NodeRepository;

    move-result-object p2

    iput-object p2, p0, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->referenceRepository:Lcom/vladsch/flexmark/util/ast/NodeRepository;

    .line 89
    invoke-virtual {p2}, Lcom/vladsch/flexmark/util/ast/NodeRepository;->values()Ljava/util/List;

    move-result-object p2

    iput-object p2, p0, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->referenceList:Ljava/util/List;

    .line 90
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p2, 0x0

    goto :goto_0

    :cond_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/vladsch/flexmark/util/ast/Node;

    :goto_0
    iput-object p2, p0, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->lastReference:Lcom/vladsch/flexmark/util/ast/Node;

    .line 91
    new-instance p2, Ljava/util/HashSet;

    invoke-direct {p2}, Ljava/util/HashSet;-><init>()V

    iput-object p2, p0, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->unusedReferences:Ljava/util/HashSet;

    .line 92
    sget-object p2, Lcom/vladsch/flexmark/html/HtmlRenderer;->RECHECK_UNDEFINED_REFERENCES:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {p2, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->recheckUndefinedReferences:Z

    const/4 p1, 0x0

    .line 93
    iput-boolean p1, p0, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->repositoryNodesDone:Z

    .line 95
    new-instance p1, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter$1;

    invoke-direct {p1, p0}, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter$1;-><init>(Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;)V

    iput-object p1, p0, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->myComparator:Ljava/util/Comparator;

    return-void
.end method

.method private formatReferences(Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 6

    .line 158
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->referenceList:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 160
    sget-object v1, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter$2;->$SwitchMap$com$vladsch$flexmark$util$format$options$ElementPlacementSort:[I

    invoke-virtual {p0}, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->getReferenceSort()Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;->ordinal()I

    move-result v2

    aget v1, v1, v2

    const/4 v2, 0x2

    if-eq v1, v2, :cond_3

    const/4 v2, 0x3

    if-eq v1, v2, :cond_0

    goto :goto_1

    .line 169
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 170
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 171
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vladsch/flexmark/util/ast/Node;

    .line 172
    iget-object v5, p0, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->unusedReferences:Ljava/util/HashSet;

    invoke-virtual {v5, v4}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 173
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 175
    :cond_1
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 178
    :cond_2
    invoke-virtual {p0}, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->getReferenceComparator()Ljava/util/Comparator;

    move-result-object v3

    invoke-static {v1, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 179
    invoke-virtual {p0}, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->getReferenceComparator()Ljava/util/Comparator;

    move-result-object v3

    invoke-static {v2, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 180
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 181
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 182
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto :goto_1

    .line 165
    :cond_3
    invoke-virtual {p0}, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->getReferenceComparator()Ljava/util/Comparator;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 186
    :goto_1
    invoke-virtual {p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->blankLine()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 187
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/ast/Node;

    .line 188
    invoke-virtual {p0, v1, p1, p2}, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->renderReferenceBlock(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    goto :goto_2

    .line 190
    :cond_4
    invoke-virtual {p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->blankLine()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    const/4 p1, 0x1

    .line 191
    iput-boolean p1, p0, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->repositoryNodesDone:Z

    return-void
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

    .line 105
    sget-object v0, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->FORMATTING_PHASES:Ljava/util/HashSet;

    return-object v0
.end method

.method public getReferenceComparator()Ljava/util/Comparator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Comparator<",
            "TB;>;"
        }
    .end annotation

    .line 22
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->myComparator:Ljava/util/Comparator;

    return-object v0
.end method

.method public abstract getReferencePlacement()Lcom/vladsch/flexmark/util/format/options/ElementPlacement;
.end method

.method public abstract getReferenceSort()Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;
.end method

.method public abstract getRepository(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/util/ast/NodeRepository;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/options/DataHolder;",
            ")TR;"
        }
    .end annotation
.end method

.method protected getTranslationReferencePlacement()Lcom/vladsch/flexmark/util/format/options/ElementPlacement;
    .locals 1

    .line 43
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->myContext:Lcom/vladsch/flexmark/formatter/NodeFormatterContext;

    invoke-interface {v0}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->isTransformingText()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 44
    sget-object v0, Lcom/vladsch/flexmark/util/format/options/ElementPlacement;->AS_IS:Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    return-object v0

    .line 46
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->getReferencePlacement()Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    move-result-object v0

    return-object v0
.end method

.method public modifyTransformedReference(Ljava/lang/String;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;)Ljava/lang/String;
    .locals 0

    return-object p1
.end method

.method public renderDocument(Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/formatter/FormattingPhase;)V
    .locals 2

    .line 111
    iput-object p1, p0, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->myContext:Lcom/vladsch/flexmark/formatter/NodeFormatterContext;

    .line 113
    invoke-interface {p1}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->isTransformingText()Z

    move-result p3

    if-eqz p3, :cond_1

    iget-object p3, p0, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->myReferenceMapKey:Lcom/vladsch/flexmark/util/options/DataKey;

    if-eqz p3, :cond_1

    .line 114
    invoke-interface {p1}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getRenderPurpose()Lcom/vladsch/flexmark/formatter/RenderPurpose;

    move-result-object p3

    sget-object v0, Lcom/vladsch/flexmark/formatter/RenderPurpose;->TRANSLATION_SPANS:Lcom/vladsch/flexmark/formatter/RenderPurpose;

    if-ne p3, v0, :cond_0

    .line 115
    invoke-interface {p1}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getTranslationStore()Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object p3

    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->myReferenceMapKey:Lcom/vladsch/flexmark/util/options/DataKey;

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-interface {p3, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 117
    :cond_0
    invoke-interface {p1}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getTranslationStore()Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object p3

    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->myReferenceMapKey:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p3, v0}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/util/Map;

    iput-object p3, p0, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->referenceTranslationMap:Ljava/util/Map;

    .line 120
    :cond_1
    sget-object p3, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter$2;->$SwitchMap$com$vladsch$flexmark$formatter$FormattingPhase:[I

    invoke-virtual {p4}, Lcom/vladsch/flexmark/formatter/FormattingPhase;->ordinal()I

    move-result p4

    aget p3, p3, p4

    const/4 p4, 0x1

    if-eq p3, p4, :cond_4

    const/4 p4, 0x2

    if-eq p3, p4, :cond_3

    const/4 p4, 0x3

    if-eq p3, p4, :cond_2

    goto :goto_2

    .line 146
    :cond_2
    invoke-virtual {p0}, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->getTranslationReferencePlacement()Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    move-result-object p3

    sget-object p4, Lcom/vladsch/flexmark/util/format/options/ElementPlacement;->DOCUMENT_BOTTOM:Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    if-ne p3, p4, :cond_7

    .line 148
    invoke-direct {p0, p1, p2}, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->formatReferences(Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void

    .line 139
    :cond_3
    invoke-virtual {p0}, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->getTranslationReferencePlacement()Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    move-result-object p3

    sget-object p4, Lcom/vladsch/flexmark/util/format/options/ElementPlacement;->DOCUMENT_TOP:Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    if-ne p3, p4, :cond_7

    .line 141
    invoke-direct {p0, p1, p2}, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->formatReferences(Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void

    .line 122
    :cond_4
    invoke-virtual {p0}, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->getTranslationReferencePlacement()Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    move-result-object p2

    sget-object p3, Lcom/vladsch/flexmark/util/format/options/ElementPlacement;->AS_IS:Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    if-eq p2, p3, :cond_7

    invoke-virtual {p0}, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->getReferenceSort()Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;

    move-result-object p2

    sget-object p3, Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;->SORT_UNUSED_LAST:Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;

    if-ne p2, p3, :cond_7

    .line 124
    iget-object p2, p0, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->unusedReferences:Ljava/util/HashSet;

    iget-object p3, p0, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->referenceList:Ljava/util/List;

    invoke-virtual {p2, p3}, Ljava/util/HashSet;->addAll(Ljava/util/Collection;)Z

    .line 125
    invoke-virtual {p0}, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->getNodeClasses()Ljava/util/Set;

    move-result-object p2

    invoke-interface {p1, p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->nodesOfType(Ljava/util/Collection;)Ljava/lang/Iterable;

    move-result-object p1

    .line 126
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_5
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_7

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/vladsch/flexmark/util/ast/Node;

    .line 127
    iget-object p3, p0, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->lastReference:Lcom/vladsch/flexmark/util/ast/Node;

    if-nez p3, :cond_6

    const/4 p2, 0x0

    goto :goto_1

    :cond_6
    check-cast p3, Lcom/vladsch/flexmark/util/ast/ReferenceNode;

    invoke-interface {p3, p2}, Lcom/vladsch/flexmark/util/ast/ReferenceNode;->getReferencingNode(Lcom/vladsch/flexmark/util/ast/Node;)Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p2

    :goto_1
    if-eqz p2, :cond_5

    .line 129
    check-cast p2, Lcom/vladsch/flexmark/util/ast/ReferencingNode;

    iget-object p3, p0, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->referenceRepository:Lcom/vladsch/flexmark/util/ast/NodeRepository;

    invoke-interface {p2, p3}, Lcom/vladsch/flexmark/util/ast/ReferencingNode;->getReferenceNode(Lcom/vladsch/flexmark/util/ast/NodeRepository;)Lcom/vladsch/flexmark/util/ast/ReferenceNode;

    move-result-object p2

    check-cast p2, Lcom/vladsch/flexmark/util/ast/Node;

    if-eqz p2, :cond_5

    .line 131
    iget-object p3, p0, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->unusedReferences:Ljava/util/HashSet;

    invoke-virtual {p3, p2}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_7
    :goto_2
    return-void
.end method

.method protected renderReference(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TB;",
            "Lcom/vladsch/flexmark/formatter/NodeFormatterContext;",
            "Lcom/vladsch/flexmark/formatter/MarkdownWriter;",
            ")V"
        }
    .end annotation

    .line 195
    iget-boolean v0, p0, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->repositoryNodesDone:Z

    if-nez v0, :cond_4

    .line 196
    sget-object v0, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter$2;->$SwitchMap$com$vladsch$flexmark$util$format$options$ElementPlacement:[I

    invoke-virtual {p0}, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->getTranslationReferencePlacement()Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/format/options/ElementPlacement;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 210
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->lastReference:Lcom/vladsch/flexmark/util/ast/Node;

    if-ne p1, v0, :cond_4

    .line 211
    invoke-direct {p0, p2, p3}, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->formatReferences(Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void

    .line 206
    :cond_1
    invoke-direct {p0, p2, p3}, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->formatReferences(Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void

    .line 198
    :cond_2
    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->renderReferenceBlock(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    .line 199
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p2

    if-eqz p2, :cond_3

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    if-eq p2, p1, :cond_4

    .line 200
    :cond_3
    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->blankLine()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    :cond_4
    :goto_0
    return-void
.end method

.method public abstract renderReferenceBlock(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TB;",
            "Lcom/vladsch/flexmark/formatter/NodeFormatterContext;",
            "Lcom/vladsch/flexmark/formatter/MarkdownWriter;",
            ")V"
        }
    .end annotation
.end method

.method protected transformReferenceId(Ljava/lang/String;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;)Ljava/lang/String;
    .locals 3

    .line 55
    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->isTransformingText()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 58
    sget-object v0, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter$2;->$SwitchMap$com$vladsch$flexmark$formatter$RenderPurpose:[I

    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getRenderPurpose()Lcom/vladsch/flexmark/formatter/RenderPurpose;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vladsch/flexmark/formatter/RenderPurpose;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eq v0, v1, :cond_1

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    goto :goto_1

    .line 74
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->modifyTransformedReference(Ljava/lang/String;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;)Ljava/lang/String;

    move-result-object p1

    .line 75
    invoke-interface {p2, v2, p1, v2, v2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->transformNonTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 61
    :cond_1
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->referenceTranslationMap:Ljava/util/Map;

    if-eqz v0, :cond_3

    .line 62
    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 63
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->referenceTranslationMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    goto :goto_0

    .line 65
    :cond_2
    invoke-interface {p2, v2, p1, v2, v2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->transformNonTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    .line 66
    iget-object v1, p0, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->referenceTranslationMap:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object p1, v0

    goto :goto_0

    .line 69
    :cond_3
    invoke-interface {p2, v2, p1, v2, v2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->transformNonTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    .line 71
    :goto_0
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;->modifyTransformedReference(Ljava/lang/String;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;)Ljava/lang/String;

    move-result-object p1

    :cond_4
    :goto_1
    return-object p1
.end method
