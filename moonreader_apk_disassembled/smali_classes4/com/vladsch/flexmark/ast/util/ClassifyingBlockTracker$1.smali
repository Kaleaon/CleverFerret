.class Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker$1;
.super Ljava/lang/Object;
.source "ClassifyingBlockTracker.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/collection/CollectionHost;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/collection/CollectionHost<",
        "Lcom/vladsch/flexmark/util/Paired<",
        "Lcom/vladsch/flexmark/parser/block/BlockParser;",
        "Lcom/vladsch/flexmark/util/ast/Block;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;)V
    .locals 0

    .line 18
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker$1;->this$0:Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public adding(ILcom/vladsch/flexmark/util/Paired;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/vladsch/flexmark/util/Paired<",
            "Lcom/vladsch/flexmark/parser/block/BlockParser;",
            "Lcom/vladsch/flexmark/util/ast/Block;",
            ">;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .line 21
    invoke-interface {p2}, Lcom/vladsch/flexmark/util/Paired;->getSecond()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/ast/Block;

    if-eqz p1, :cond_0

    .line 22
    iget-object p2, p0, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker$1;->this$0:Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;

    iget-object p2, p2, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->nodeClassifier:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    invoke-virtual {p2, p1}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->add(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method

.method public bridge synthetic adding(ILjava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 18
    check-cast p2, Lcom/vladsch/flexmark/util/Paired;

    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker$1;->adding(ILcom/vladsch/flexmark/util/Paired;Ljava/lang/Object;)V

    return-void
.end method

.method public addingNulls(I)V
    .locals 0

    return-void
.end method

.method public clearing()V
    .locals 1

    .line 34
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker$1;->this$0:Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;

    iget-object v0, v0, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->nodeClassifier:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->clear()V

    return-void
.end method

.method public getIteratorModificationCount()I
    .locals 1

    .line 49
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker$1;->this$0:Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;

    iget-object v0, v0, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->allBlockParsersMap:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->getModificationCount()I

    move-result v0

    return v0
.end method

.method public removing(ILcom/vladsch/flexmark/util/Paired;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/vladsch/flexmark/util/Paired<",
            "Lcom/vladsch/flexmark/parser/block/BlockParser;",
            "Lcom/vladsch/flexmark/util/ast/Block;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 27
    invoke-interface {p2}, Lcom/vladsch/flexmark/util/Paired;->getSecond()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/ast/Block;

    if-eqz p1, :cond_0

    .line 28
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker$1;->this$0:Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;

    iget-object v0, v0, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker;->nodeClassifier:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->remove(Ljava/lang/Object;)Z

    :cond_0
    return-object p2
.end method

.method public bridge synthetic removing(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 18
    check-cast p2, Lcom/vladsch/flexmark/util/Paired;

    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/ast/util/ClassifyingBlockTracker$1;->removing(ILcom/vladsch/flexmark/util/Paired;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public skipHostUpdate()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
