.class public Lcom/vladsch/flexmark/util/collection/IndexedItemBitSetMap;
.super Lcom/vladsch/flexmark/util/collection/IndexedItemSetMapBase;
.source "IndexedItemBitSetMap.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "M:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/vladsch/flexmark/util/collection/IndexedItemSetMapBase<",
        "TK;",
        "Ljava/util/BitSet;",
        "TM;>;"
    }
.end annotation


# instance fields
.field private final myComputable:Lcom/vladsch/flexmark/util/Computable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/Computable<",
            "TK;TM;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/Computable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/Computable<",
            "TK;TM;>;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 11
    invoke-direct {p0, p1, v0}, Lcom/vladsch/flexmark/util/collection/IndexedItemBitSetMap;-><init>(Lcom/vladsch/flexmark/util/Computable;I)V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/Computable;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/Computable<",
            "TK;TM;>;I)V"
        }
    .end annotation

    .line 15
    invoke-direct {p0, p2}, Lcom/vladsch/flexmark/util/collection/IndexedItemSetMapBase;-><init>(I)V

    .line 16
    iput-object p1, p0, Lcom/vladsch/flexmark/util/collection/IndexedItemBitSetMap;->myComputable:Lcom/vladsch/flexmark/util/Computable;

    return-void
.end method


# virtual methods
.method public bridge synthetic addSetItem(Ljava/lang/Object;I)Z
    .locals 0

    .line 7
    check-cast p1, Ljava/util/BitSet;

    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/collection/IndexedItemBitSetMap;->addSetItem(Ljava/util/BitSet;I)Z

    move-result p1

    return p1
.end method

.method public addSetItem(Ljava/util/BitSet;I)Z
    .locals 1

    .line 35
    invoke-virtual {p1, p2}, Ljava/util/BitSet;->get(I)Z

    move-result v0

    .line 36
    invoke-virtual {p1, p2}, Ljava/util/BitSet;->set(I)V

    return v0
.end method

.method public bridge synthetic containsSetItem(Ljava/lang/Object;I)Z
    .locals 0

    .line 7
    check-cast p1, Ljava/util/BitSet;

    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/collection/IndexedItemBitSetMap;->containsSetItem(Ljava/util/BitSet;I)Z

    move-result p1

    return p1
.end method

.method public containsSetItem(Ljava/util/BitSet;I)Z
    .locals 0

    .line 49
    invoke-virtual {p1, p2}, Ljava/util/BitSet;->get(I)Z

    move-result p1

    return p1
.end method

.method public getComputable()Lcom/vladsch/flexmark/util/Computable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/Computable<",
            "TK;TM;>;"
        }
    .end annotation

    .line 20
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/IndexedItemBitSetMap;->myComputable:Lcom/vladsch/flexmark/util/Computable;

    return-object v0
.end method

.method public mapKey(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TM;)TK;"
        }
    .end annotation

    .line 25
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/IndexedItemBitSetMap;->myComputable:Lcom/vladsch/flexmark/util/Computable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/Computable;->compute(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic newSet()Ljava/lang/Object;
    .locals 1

    .line 7
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/IndexedItemBitSetMap;->newSet()Ljava/util/BitSet;

    move-result-object v0

    return-object v0
.end method

.method public newSet()Ljava/util/BitSet;
    .locals 1

    .line 30
    new-instance v0, Ljava/util/BitSet;

    invoke-direct {v0}, Ljava/util/BitSet;-><init>()V

    return-object v0
.end method

.method public bridge synthetic removeSetItem(Ljava/lang/Object;I)Z
    .locals 0

    .line 7
    check-cast p1, Ljava/util/BitSet;

    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/collection/IndexedItemBitSetMap;->removeSetItem(Ljava/util/BitSet;I)Z

    move-result p1

    return p1
.end method

.method public removeSetItem(Ljava/util/BitSet;I)Z
    .locals 1

    .line 42
    invoke-virtual {p1, p2}, Ljava/util/BitSet;->get(I)Z

    move-result v0

    .line 43
    invoke-virtual {p1, p2}, Ljava/util/BitSet;->clear(I)V

    return v0
.end method
