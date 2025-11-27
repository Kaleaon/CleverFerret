.class public interface abstract Lcom/vladsch/flexmark/ast/util/LinkResolvingVisitor;
.super Ljava/lang/Object;
.source "LinkResolvingVisitor.java"

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
.method public abstract resolveLink(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/renderer/ResolvedLink;)Lcom/vladsch/flexmark/html/renderer/ResolvedLink;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TN;",
            "Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;",
            "Lcom/vladsch/flexmark/html/renderer/ResolvedLink;",
            ")",
            "Lcom/vladsch/flexmark/html/renderer/ResolvedLink;"
        }
    .end annotation
.end method
