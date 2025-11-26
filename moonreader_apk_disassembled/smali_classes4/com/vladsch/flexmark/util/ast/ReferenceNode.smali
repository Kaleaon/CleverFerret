.class public interface abstract Lcom/vladsch/flexmark/util/ast/ReferenceNode;
.super Ljava/lang/Object;
.source "ReferenceNode.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R:",
        "Lcom/vladsch/flexmark/util/ast/NodeRepository<",
        "TB;>;B:",
        "Lcom/vladsch/flexmark/util/ast/Node;",
        "N:",
        "Lcom/vladsch/flexmark/util/ast/Node;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "TB;>;"
    }
.end annotation


# virtual methods
.method public abstract getReferencingNode(Lcom/vladsch/flexmark/util/ast/Node;)Lcom/vladsch/flexmark/util/ast/Node;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ")TN;"
        }
    .end annotation
.end method
