.class public interface abstract Lcom/vladsch/flexmark/util/ast/ReferencingNode;
.super Ljava/lang/Object;
.source "ReferencingNode.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R:",
        "Lcom/vladsch/flexmark/util/ast/NodeRepository<",
        "TB;>;B::",
        "Lcom/vladsch/flexmark/util/ast/ReferenceNode;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract getReference()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract getReferenceNode(Lcom/vladsch/flexmark/util/ast/Document;)Lcom/vladsch/flexmark/util/ast/ReferenceNode;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/ast/Document;",
            ")TB;"
        }
    .end annotation
.end method

.method public abstract getReferenceNode(Lcom/vladsch/flexmark/util/ast/NodeRepository;)Lcom/vladsch/flexmark/util/ast/ReferenceNode;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TR;)TB;"
        }
    .end annotation
.end method

.method public abstract isDefined()Z
.end method
