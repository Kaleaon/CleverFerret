.class public interface abstract Lcom/vladsch/flexmark/html/CustomNodeRenderer;
.super Ljava/lang/Object;
.source "CustomNodeRenderer.java"

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
.method public abstract render(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TN;",
            "Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;",
            "Lcom/vladsch/flexmark/html/HtmlWriter;",
            ")V"
        }
    .end annotation
.end method
