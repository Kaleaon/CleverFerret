.class Lcom/vladsch/flexmark/util/collection/OrderedMap$2;
.super Ljava/lang/Object;
.source "OrderedMap.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/collection/iteration/Indexed;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/util/collection/OrderedMap;->getIndexedEntryProxy()Lcom/vladsch/flexmark/util/collection/iteration/Indexed;
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
.field final synthetic this$0:Lcom/vladsch/flexmark/util/collection/OrderedMap;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/util/collection/OrderedMap;)V
    .locals 0

    .line 70
    iput-object p1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap$2;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic get(I)Ljava/lang/Object;
    .locals 0

    .line 70
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedMap$2;->get(I)Ljava/util/Map$Entry;

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

    .line 73
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap$2;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMap;

    invoke-static {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->access$100(Lcom/vladsch/flexmark/util/collection/OrderedMap;I)Ljava/util/Map$Entry;

    move-result-object p1

    return-object p1
.end method

.method public modificationCount()I
    .locals 1

    .line 93
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap$2;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMap;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->getModificationCount()I

    move-result v0

    return v0
.end method

.method public removeAt(I)V
    .locals 1

    .line 83
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap$2;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMap;

    invoke-static {v0}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->access$200(Lcom/vladsch/flexmark/util/collection/OrderedMap;)Lcom/vladsch/flexmark/util/collection/OrderedSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->removeIndexHosted(I)Ljava/lang/Object;

    return-void
.end method

.method public bridge synthetic set(ILjava/lang/Object;)V
    .locals 0

    .line 70
    check-cast p2, Ljava/util/Map$Entry;

    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/collection/OrderedMap$2;->set(ILjava/util/Map$Entry;)V

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

    .line 78
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1
.end method

.method public size()I
    .locals 1

    .line 88
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap$2;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMap;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->size()I

    move-result v0

    return v0
.end method
