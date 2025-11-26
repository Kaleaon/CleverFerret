.class public Lcom/vladsch/flexmark/ext/attributes/internal/AttributesAttributeProvider;
.super Ljava/lang/Object;
.source "AttributesAttributeProvider.java"

# interfaces
.implements Lcom/vladsch/flexmark/html/AttributeProvider;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/ext/attributes/internal/AttributesAttributeProvider$Factory;
    }
.end annotation


# instance fields
.field private final nodeAttributeRepository:Lcom/vladsch/flexmark/ext/attributes/internal/NodeAttributeRepository;


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/html/renderer/LinkResolverContext;)V
    .locals 1

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    invoke-interface {p1}, Lcom/vladsch/flexmark/html/renderer/LinkResolverContext;->getOptions()Lcom/vladsch/flexmark/util/options/DataHolder;

    move-result-object p1

    .line 26
    sget-object v0, Lcom/vladsch/flexmark/ext/attributes/AttributesExtension;->NODE_ATTRIBUTES:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/ext/attributes/internal/NodeAttributeRepository;

    iput-object p1, p0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesAttributeProvider;->nodeAttributeRepository:Lcom/vladsch/flexmark/ext/attributes/internal/NodeAttributeRepository;

    return-void
.end method


# virtual methods
.method public setAttributes(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/renderer/AttributablePart;Lcom/vladsch/flexmark/util/html/Attributes;)V
    .locals 5

    .line 31
    iget-object p2, p0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesAttributeProvider;->nodeAttributeRepository:Lcom/vladsch/flexmark/ext/attributes/internal/NodeAttributeRepository;

    invoke-virtual {p2, p1}, Lcom/vladsch/flexmark/ext/attributes/internal/NodeAttributeRepository;->get(Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object p2

    if-eqz p2, :cond_8

    .line 34
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;

    .line 35
    invoke-virtual {v0}, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->getChildren()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;

    move-result-object v0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/ast/Node;

    .line 36
    instance-of v2, v1, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;

    if-nez v2, :cond_2

    goto :goto_0

    .line 38
    :cond_2
    check-cast v1, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;

    .line 39
    invoke-virtual {v1}, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->isImplicitName()Z

    move-result v2

    const-string v3, "class"

    if-nez v2, :cond_4

    .line 40
    invoke-virtual {v1}, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->getName()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    .line 41
    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNotNull()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isBlank()Z

    move-result v4

    if-nez v4, :cond_1

    .line 42
    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 43
    invoke-virtual {p3, v2}, Lcom/vladsch/flexmark/util/html/Attributes;->remove(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/Attribute;

    .line 45
    :cond_3
    invoke-virtual {v1}, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->getValue()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {p3, v2, v1}, Lcom/vladsch/flexmark/util/html/Attributes;->addValue(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/Attribute;

    goto :goto_0

    .line 51
    :cond_4
    invoke-virtual {v1}, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->isClass()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 52
    invoke-virtual {v1}, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->getValue()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {p3, v3, v1}, Lcom/vladsch/flexmark/util/html/Attributes;->addValue(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/Attribute;

    goto :goto_0

    .line 53
    :cond_5
    invoke-virtual {v1}, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->isId()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 54
    instance-of v2, p1, Lcom/vladsch/flexmark/ast/AnchorRefTarget;

    if-eqz v2, :cond_6

    goto :goto_0

    .line 57
    :cond_6
    const-string v2, "id"

    invoke-virtual {p3, v2}, Lcom/vladsch/flexmark/util/html/Attributes;->remove(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/Attribute;

    .line 58
    invoke-virtual {v1}, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->getValue()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {p3, v2, v1}, Lcom/vladsch/flexmark/util/html/Attributes;->addValue(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/Attribute;

    goto :goto_0

    .line 62
    :cond_7
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Implicit attribute yet not class or id"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_8
    return-void
.end method
