.class Lcom/vladsch/flexmark/util/collection/ClassificationBag$1;
.super Ljava/lang/Object;
.source "ClassificationBag.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/collection/CollectionHost;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/util/collection/ClassificationBag;-><init>(ILcom/vladsch/flexmark/util/Computable;Lcom/vladsch/flexmark/util/collection/CollectionHost;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/collection/CollectionHost<",
        "TV;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/util/collection/ClassificationBag;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/util/collection/ClassificationBag;)V
    .locals 0

    .line 31
    iput-object p1, p0, Lcom/vladsch/flexmark/util/collection/ClassificationBag$1;->this$0:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public adding(ILjava/lang/Object;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITV;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .line 34
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassificationBag$1;->this$0:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    invoke-static {v0}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->access$000(Lcom/vladsch/flexmark/util/collection/ClassificationBag;)Lcom/vladsch/flexmark/util/collection/CollectionHost;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassificationBag$1;->this$0:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    invoke-static {v0}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->access$000(Lcom/vladsch/flexmark/util/collection/ClassificationBag;)Lcom/vladsch/flexmark/util/collection/CollectionHost;

    move-result-object v0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->skipHostUpdate()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassificationBag$1;->this$0:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    invoke-static {v0}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->access$000(Lcom/vladsch/flexmark/util/collection/ClassificationBag;)Lcom/vladsch/flexmark/util/collection/CollectionHost;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->adding(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 35
    :cond_0
    iget-object p3, p0, Lcom/vladsch/flexmark/util/collection/ClassificationBag$1;->this$0:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    invoke-static {p3}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->access$100(Lcom/vladsch/flexmark/util/collection/ClassificationBag;)Lcom/vladsch/flexmark/util/collection/IndexedItemBitSetMap;

    move-result-object p3

    invoke-virtual {p3, p2, p1}, Lcom/vladsch/flexmark/util/collection/IndexedItemBitSetMap;->addItem(Ljava/lang/Object;I)Z

    return-void
.end method

.method public addingNulls(I)V
    .locals 1

    .line 54
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassificationBag$1;->this$0:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    invoke-static {v0}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->access$000(Lcom/vladsch/flexmark/util/collection/ClassificationBag;)Lcom/vladsch/flexmark/util/collection/CollectionHost;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassificationBag$1;->this$0:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    invoke-static {v0}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->access$000(Lcom/vladsch/flexmark/util/collection/ClassificationBag;)Lcom/vladsch/flexmark/util/collection/CollectionHost;

    move-result-object v0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->skipHostUpdate()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassificationBag$1;->this$0:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    invoke-static {v0}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->access$000(Lcom/vladsch/flexmark/util/collection/ClassificationBag;)Lcom/vladsch/flexmark/util/collection/CollectionHost;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->addingNulls(I)V

    :cond_0
    return-void
.end method

.method public clearing()V
    .locals 1

    .line 47
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassificationBag$1;->this$0:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    invoke-static {v0}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->access$000(Lcom/vladsch/flexmark/util/collection/ClassificationBag;)Lcom/vladsch/flexmark/util/collection/CollectionHost;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassificationBag$1;->this$0:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    invoke-static {v0}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->access$000(Lcom/vladsch/flexmark/util/collection/ClassificationBag;)Lcom/vladsch/flexmark/util/collection/CollectionHost;

    move-result-object v0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->skipHostUpdate()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassificationBag$1;->this$0:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    invoke-static {v0}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->access$000(Lcom/vladsch/flexmark/util/collection/ClassificationBag;)Lcom/vladsch/flexmark/util/collection/CollectionHost;

    move-result-object v0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->clearing()V

    .line 48
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassificationBag$1;->this$0:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    invoke-static {v0}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->access$100(Lcom/vladsch/flexmark/util/collection/ClassificationBag;)Lcom/vladsch/flexmark/util/collection/IndexedItemBitSetMap;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/IndexedItemBitSetMap;->clear()V

    return-void
.end method

.method public getIteratorModificationCount()I
    .locals 1

    .line 64
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassificationBag$1;->this$0:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->getModificationCount()I

    move-result v0

    return v0
.end method

.method public removing(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITV;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 40
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassificationBag$1;->this$0:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    invoke-static {v0}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->access$000(Lcom/vladsch/flexmark/util/collection/ClassificationBag;)Lcom/vladsch/flexmark/util/collection/CollectionHost;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassificationBag$1;->this$0:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    invoke-static {v0}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->access$000(Lcom/vladsch/flexmark/util/collection/ClassificationBag;)Lcom/vladsch/flexmark/util/collection/CollectionHost;

    move-result-object v0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->skipHostUpdate()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassificationBag$1;->this$0:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    invoke-static {v0}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->access$000(Lcom/vladsch/flexmark/util/collection/ClassificationBag;)Lcom/vladsch/flexmark/util/collection/CollectionHost;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->removing(ILjava/lang/Object;)Ljava/lang/Object;

    .line 41
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/ClassificationBag$1;->this$0:Lcom/vladsch/flexmark/util/collection/ClassificationBag;

    invoke-static {v0}, Lcom/vladsch/flexmark/util/collection/ClassificationBag;->access$100(Lcom/vladsch/flexmark/util/collection/ClassificationBag;)Lcom/vladsch/flexmark/util/collection/IndexedItemBitSetMap;

    move-result-object v0

    invoke-virtual {v0, p2, p1}, Lcom/vladsch/flexmark/util/collection/IndexedItemBitSetMap;->removeItem(Ljava/lang/Object;I)Z

    const/4 p1, 0x0

    return-object p1
.end method

.method public skipHostUpdate()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
