.class public interface abstract Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;
.super Ljava/lang/Object;
.source "NodeRendererContext.java"

# interfaces
.implements Lcom/vladsch/flexmark/html/renderer/LinkResolverContext;


# virtual methods
.method public abstract delegateRender()V
.end method

.method public abstract doNotRenderLinks()V
.end method

.method public abstract doNotRenderLinks(Z)V
.end method

.method public abstract doRenderLinks()V
.end method

.method public abstract extendRenderingNodeAttributes(Lcom/vladsch/flexmark/html/renderer/AttributablePart;Lcom/vladsch/flexmark/util/html/Attributes;)Lcom/vladsch/flexmark/util/html/Attributes;
.end method

.method public abstract extendRenderingNodeAttributes(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/renderer/AttributablePart;Lcom/vladsch/flexmark/util/html/Attributes;)Lcom/vladsch/flexmark/util/html/Attributes;
.end method

.method public abstract getDelegatedSubContext(Ljava/lang/Appendable;Z)Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;
.end method

.method public abstract getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;
.end method

.method public abstract getHtmlWriter()Lcom/vladsch/flexmark/html/HtmlWriter;
.end method

.method public abstract getNodeId(Lcom/vladsch/flexmark/util/ast/Node;)Ljava/lang/String;
.end method

.method public abstract getRenderingPhase()Lcom/vladsch/flexmark/html/renderer/RenderingPhase;
.end method

.method public abstract getSubContext(Ljava/lang/Appendable;Z)Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;
.end method

.method public abstract isDoNotRenderLinks()Z
.end method
