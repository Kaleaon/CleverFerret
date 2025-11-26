.class public Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;
.super Lcom/vladsch/flexmark/util/ast/NodeRepository;
.source "FootnoteRepository.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vladsch/flexmark/util/ast/NodeRepository<",
        "Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;",
        ">;"
    }
.end annotation


# instance fields
.field private referencedFootnoteBlocks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 1

    .line 51
    sget-object v0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteExtension;->FOOTNOTES_KEEP:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/KeepType;

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/NodeRepository;-><init>(Lcom/vladsch/flexmark/util/KeepType;)V

    .line 17
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;->referencedFootnoteBlocks:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public addFootnoteReference(Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;Lcom/vladsch/flexmark/ext/footnotes/Footnote;)V
    .locals 2

    .line 20
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->isReferenced()Z

    move-result v0

    if-nez v0, :cond_0

    .line 21
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;->referencedFootnoteBlocks:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 24
    :cond_0
    invoke-virtual {p2}, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->getStartOffset()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->setFirstReferenceOffset(I)V

    .line 26
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->getFootnoteReferences()I

    move-result v0

    add-int/lit8 v1, v0, 0x1

    .line 27
    invoke-virtual {p1, v1}, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->setFootnoteReferences(I)V

    .line 28
    invoke-virtual {p2, v0}, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->setReferenceOrdinal(I)V

    return-void
.end method

.method public getDataKey()Lcom/vladsch/flexmark/util/options/DataKey;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;",
            ">;"
        }
    .end annotation

    .line 56
    sget-object v0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteExtension;->FOOTNOTES:Lcom/vladsch/flexmark/util/options/DataKey;

    return-object v0
.end method

.method public getKeepDataKey()Lcom/vladsch/flexmark/util/options/DataKey;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/util/KeepType;",
            ">;"
        }
    .end annotation

    .line 61
    sget-object v0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteExtension;->FOOTNOTES_KEEP:Lcom/vladsch/flexmark/util/options/DataKey;

    return-object v0
.end method

.method public getReferencedElements(Lcom/vladsch/flexmark/util/ast/Node;)Ljava/util/Set;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ")",
            "Ljava/util/Set<",
            "Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;",
            ">;"
        }
    .end annotation

    .line 66
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 67
    new-instance v1, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository$2;

    invoke-direct {v1, p0, v0}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository$2;-><init>(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;Ljava/util/HashSet;)V

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Class;

    const-class v3, Lcom/vladsch/flexmark/ext/footnotes/Footnote;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-virtual {p0, p1, v1, v2}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;->visitNodes(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/ValueRunnable;[Ljava/lang/Class;)V

    return-object v0
.end method

.method public getReferencedFootnoteBlocks()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;",
            ">;"
        }
    .end annotation

    .line 47
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;->referencedFootnoteBlocks:Ljava/util/ArrayList;

    return-object v0
.end method

.method public resolveFootnoteOrdinals()V
    .locals 3

    .line 33
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;->referencedFootnoteBlocks:Ljava/util/ArrayList;

    new-instance v1, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository$1;

    invoke-direct {v1, p0}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository$1;-><init>(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;)V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 41
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;->referencedFootnoteBlocks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    add-int/lit8 v1, v1, 0x1

    .line 42
    invoke-virtual {v2, v1}, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->setFootnoteOrdinal(I)V

    goto :goto_0

    :cond_0
    return-void
.end method
