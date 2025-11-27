.class Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$4;
.super Ljava/lang/Object;
.source "OrderedMultiMap.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/collection/CollectionHost;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->keyValueEntrySet()Lcom/vladsch/flexmark/util/collection/OrderedSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/collection/CollectionHost<",
        "Ljava/util/Map$Entry<",
        "TK;TV;>;>;"
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 590
    const-class v0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    return-void
.end method

.method constructor <init>(Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;)V
    .locals 0

    .line 590
    iput-object p1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$4;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic adding(ILjava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 590
    check-cast p2, Ljava/util/Map$Entry;

    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$4;->adding(ILjava/util/Map$Entry;Ljava/lang/Object;)V

    return-void
.end method

.method public adding(ILjava/util/Map$Entry;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .line 594
    iget-object p1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$4;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p3

    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p1, p3, p2}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->putKeyValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public addingNulls(I)V
    .locals 1

    .line 610
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$4;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->addNullEntry(I)V

    return-void
.end method

.method public clearing()V
    .locals 1

    .line 605
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$4;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->clear()V

    return-void
.end method

.method public getIteratorModificationCount()I
    .locals 1

    .line 620
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$4;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->getModificationCount()I

    move-result v0

    return v0
.end method

.method public bridge synthetic removing(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 590
    check-cast p2, Ljava/util/Map$Entry;

    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$4;->removing(ILjava/util/Map$Entry;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public removing(ILjava/util/Map$Entry;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 599
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$4;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-static {v0, p1, v1, v2}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->access$1000(Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;ILjava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    return-object p2

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public skipHostUpdate()Z
    .locals 1

    .line 615
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$4;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    invoke-static {v0}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->access$300(Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$4;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    invoke-static {v0}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->access$700(Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x1

    return v0
.end method
