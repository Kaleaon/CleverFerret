.class public interface abstract Lcom/vladsch/flexmark/ast/util/AttributeProvidingVisitor;
.super Ljava/lang/Object;
.source "AttributeProvidingVisitor.java"

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
.method public abstract setAttributes(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/renderer/AttributablePart;Lcom/vladsch/flexmark/util/html/Attributes;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TN;",
            "Lcom/vladsch/flexmark/html/renderer/AttributablePart;",
            "Lcom/vladsch/flexmark/util/html/Attributes;",
            ")V"
        }
    .end annotation
.end method
