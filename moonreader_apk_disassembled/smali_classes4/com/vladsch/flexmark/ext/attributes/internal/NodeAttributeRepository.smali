.class public Lcom/vladsch/flexmark/ext/attributes/internal/NodeAttributeRepository;
.super Ljava/lang/Object;
.source "NodeAttributeRepository.java"

# interfaces
.implements Ljava/util/Map;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Map<",
        "Lcom/vladsch/flexmark/util/ast/Node;",
        "Ljava/util/ArrayList<",
        "Lcom/vladsch/flexmark/ext/attributes/AttributesNode;",
        ">;>;"
    }
.end annotation


# instance fields
.field protected final nodeAttributesHashMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            "Ljava/util/ArrayList<",
            "Lcom/vladsch/flexmark/ext/attributes/AttributesNode;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/ext/attributes/internal/NodeAttributeRepository;->nodeAttributesHashMap:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .line 79
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/internal/NodeAttributeRepository;->nodeAttributesHashMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    return-void
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .locals 1

    .line 39
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/internal/NodeAttributeRepository;->nodeAttributesHashMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .locals 1

    .line 44
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/internal/NodeAttributeRepository;->nodeAttributesHashMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsValue(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public entrySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/util/Map$Entry<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            "Ljava/util/ArrayList<",
            "Lcom/vladsch/flexmark/ext/attributes/AttributesNode;",
            ">;>;>;"
        }
    .end annotation

    .line 94
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/internal/NodeAttributeRepository;->nodeAttributesHashMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 12
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ext/attributes/internal/NodeAttributeRepository;->get(Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object p1

    return-object p1
.end method

.method public get(Ljava/lang/Object;)Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/vladsch/flexmark/ext/attributes/AttributesNode;",
            ">;"
        }
    .end annotation

    .line 49
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/internal/NodeAttributeRepository;->nodeAttributesHashMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    return-object p1
.end method

.method public getDataKey()Lcom/vladsch/flexmark/util/options/DataKey;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Lcom/vladsch/flexmark/ext/attributes/internal/NodeAttributeRepository;",
            ">;"
        }
    .end annotation

    .line 20
    sget-object v0, Lcom/vladsch/flexmark/ext/attributes/AttributesExtension;->NODE_ATTRIBUTES:Lcom/vladsch/flexmark/util/options/DataKey;

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

    .line 24
    sget-object v0, Lcom/vladsch/flexmark/ext/attributes/AttributesExtension;->ATTRIBUTES_KEEP:Lcom/vladsch/flexmark/util/options/DataKey;

    return-object v0
.end method

.method public isEmpty()Z
    .locals 1

    .line 34
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/internal/NodeAttributeRepository;->nodeAttributesHashMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public keySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation

    .line 84
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/internal/NodeAttributeRepository;->nodeAttributesHashMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 12
    check-cast p1, Lcom/vladsch/flexmark/util/ast/Node;

    check-cast p2, Ljava/util/ArrayList;

    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/ext/attributes/internal/NodeAttributeRepository;->put(Lcom/vladsch/flexmark/util/ast/Node;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object p1

    return-object p1
.end method

.method public put(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/ext/attributes/AttributesNode;)Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            "Lcom/vladsch/flexmark/ext/attributes/AttributesNode;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/vladsch/flexmark/ext/attributes/AttributesNode;",
            ">;"
        }
    .end annotation

    .line 58
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/internal/NodeAttributeRepository;->nodeAttributesHashMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 60
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 61
    iget-object v1, p0, Lcom/vladsch/flexmark/ext/attributes/internal/NodeAttributeRepository;->nodeAttributesHashMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    :cond_0
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method public put(Lcom/vladsch/flexmark/util/ast/Node;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            "Ljava/util/ArrayList<",
            "Lcom/vladsch/flexmark/ext/attributes/AttributesNode;",
            ">;)",
            "Ljava/util/ArrayList<",
            "Lcom/vladsch/flexmark/ext/attributes/AttributesNode;",
            ">;"
        }
    .end annotation

    .line 54
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/internal/NodeAttributeRepository;->nodeAttributesHashMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    return-object p1
.end method

.method public putAll(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "+",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            "+",
            "Ljava/util/ArrayList<",
            "Lcom/vladsch/flexmark/ext/attributes/AttributesNode;",
            ">;>;)V"
        }
    .end annotation

    .line 74
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/internal/NodeAttributeRepository;->nodeAttributesHashMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    return-void
.end method

.method public bridge synthetic remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 12
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ext/attributes/internal/NodeAttributeRepository;->remove(Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object p1

    return-object p1
.end method

.method public remove(Ljava/lang/Object;)Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/vladsch/flexmark/ext/attributes/AttributesNode;",
            ">;"
        }
    .end annotation

    .line 69
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/internal/NodeAttributeRepository;->nodeAttributesHashMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    return-object p1
.end method

.method public size()I
    .locals 1

    .line 29
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/internal/NodeAttributeRepository;->nodeAttributesHashMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    return v0
.end method

.method public values()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Ljava/util/ArrayList<",
            "Lcom/vladsch/flexmark/ext/attributes/AttributesNode;",
            ">;>;"
        }
    .end annotation

    .line 89
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/internal/NodeAttributeRepository;->nodeAttributesHashMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method
