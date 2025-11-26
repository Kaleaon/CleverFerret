.class public interface abstract Lcom/vladsch/flexmark/util/ast/Visitor;
.super Ljava/lang/Object;
.source "Visitor.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitor;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<N:",
        "Lcom/vladsch/flexmark/util/ast/Node;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitor<",
        "TN;>;"
    }
.end annotation


# virtual methods
.method public abstract visit(Lcom/vladsch/flexmark/util/ast/Node;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TN;)V"
        }
    .end annotation
.end method
