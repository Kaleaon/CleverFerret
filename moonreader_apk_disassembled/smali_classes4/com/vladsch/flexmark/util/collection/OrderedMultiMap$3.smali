.class Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$3;
.super Ljava/lang/Object;
.source "OrderedMultiMap.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/collection/iteration/Indexed;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->getIndexedProxy()Lcom/vladsch/flexmark/util/collection/iteration/Indexed;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/collection/iteration/Indexed<",
        "Ljava/util/Map$Entry<",
        "TK;TV;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;)V
    .locals 0

    .line 99
    iput-object p1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$3;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic get(I)Ljava/lang/Object;
    .locals 0

    .line 99
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$3;->get(I)Ljava/util/Map$Entry;

    move-result-object p1

    return-object p1
.end method

.method public get(I)Ljava/util/Map$Entry;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;"
        }
    .end annotation

    .line 102
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$3;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    invoke-static {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->access$800(Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;I)Ljava/util/Map$Entry;

    move-result-object p1

    return-object p1
.end method

.method public modificationCount()I
    .locals 1

    .line 122
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$3;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->getModificationCount()I

    move-result v0

    return v0
.end method

.method public removeAt(I)V
    .locals 1

    .line 112
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$3;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    invoke-static {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->access$900(Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;I)Z

    return-void
.end method

.method public bridge synthetic set(ILjava/lang/Object;)V
    .locals 0

    .line 99
    check-cast p2, Ljava/util/Map$Entry;

    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$3;->set(ILjava/util/Map$Entry;)V

    return-void
.end method

.method public set(ILjava/util/Map$Entry;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;)V"
        }
    .end annotation

    .line 107
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1
.end method

.method public size()I
    .locals 1

    .line 117
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$3;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->size()I

    move-result v0

    return v0
.end method
