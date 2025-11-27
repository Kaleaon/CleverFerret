.class public interface abstract Lcom/vladsch/flexmark/html/renderer/PhasedNodeRenderer;
.super Ljava/lang/Object;
.source "PhasedNodeRenderer.java"

# interfaces
.implements Lcom/vladsch/flexmark/html/renderer/NodeRenderer;


# virtual methods
.method public abstract getRenderingPhases()Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/vladsch/flexmark/html/renderer/RenderingPhase;",
            ">;"
        }
    .end annotation
.end method

.method public abstract renderDocument(Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/html/renderer/RenderingPhase;)V
.end method
