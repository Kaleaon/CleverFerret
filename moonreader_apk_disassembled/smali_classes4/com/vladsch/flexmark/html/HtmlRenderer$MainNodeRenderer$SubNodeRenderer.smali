.class Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer$SubNodeRenderer;
.super Lcom/vladsch/flexmark/html/NodeRendererSubContext;
.source "HtmlRenderer.java"

# interfaces
.implements Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SubNodeRenderer"
.end annotation


# instance fields
.field private final myMainNodeRenderer:Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;

.field final synthetic this$1:Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;Lcom/vladsch/flexmark/html/HtmlWriter;Z)V
    .locals 0

    .line 845
    iput-object p1, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer$SubNodeRenderer;->this$1:Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;

    .line 846
    invoke-direct {p0, p3}, Lcom/vladsch/flexmark/html/NodeRendererSubContext;-><init>(Lcom/vladsch/flexmark/html/HtmlWriter;)V

    .line 847
    iput-object p2, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer$SubNodeRenderer;->myMainNodeRenderer:Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;

    .line 848
    invoke-virtual {p2}, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object p1

    iget-boolean p1, p1, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->doNotRenderLinksInDocument:Z

    iput p1, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer$SubNodeRenderer;->doNotRenderLinksNesting:I

    if-eqz p4, :cond_0

    .line 850
    iget-object p1, p2, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->renderingNode:Lcom/vladsch/flexmark/util/ast/Node;

    iput-object p1, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer$SubNodeRenderer;->renderingNode:Lcom/vladsch/flexmark/util/ast/Node;

    .line 851
    iget-object p1, p2, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->renderingHandlerWrapper:Lcom/vladsch/flexmark/html/NodeRenderingHandlerWrapper;

    iput-object p1, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer$SubNodeRenderer;->renderingHandlerWrapper:Lcom/vladsch/flexmark/html/NodeRenderingHandlerWrapper;

    :cond_0
    return-void
.end method


# virtual methods
.method public delegateRender()V
    .locals 1

    .line 897
    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer$SubNodeRenderer;->myMainNodeRenderer:Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;

    invoke-virtual {v0, p0}, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->renderByPreviousHandler(Lcom/vladsch/flexmark/html/NodeRendererSubContext;)V

    return-void
.end method

.method public doNotRenderLinks()V
    .locals 0

    .line 948
    invoke-super {p0}, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->doNotRenderLinks()V

    return-void
.end method

.method public doNotRenderLinks(Z)V
    .locals 0

    .line 945
    invoke-super {p0, p1}, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->doNotRenderLinks(Z)V

    return-void
.end method

.method public doRenderLinks()V
    .locals 0

    .line 951
    invoke-super {p0}, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->doRenderLinks()V

    return-void
.end method

.method public encodeUrl(Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 1

    .line 871
    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer$SubNodeRenderer;->myMainNodeRenderer:Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->encodeUrl(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public extendRenderingNodeAttributes(Lcom/vladsch/flexmark/html/renderer/AttributablePart;Lcom/vladsch/flexmark/util/html/Attributes;)Lcom/vladsch/flexmark/util/html/Attributes;
    .locals 1

    .line 875
    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer$SubNodeRenderer;->myMainNodeRenderer:Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;

    invoke-virtual {v0, p1, p2}, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->extendRenderingNodeAttributes(Lcom/vladsch/flexmark/html/renderer/AttributablePart;Lcom/vladsch/flexmark/util/html/Attributes;)Lcom/vladsch/flexmark/util/html/Attributes;

    move-result-object p1

    return-object p1
.end method

.method public extendRenderingNodeAttributes(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/renderer/AttributablePart;Lcom/vladsch/flexmark/util/html/Attributes;)Lcom/vladsch/flexmark/util/html/Attributes;
    .locals 1

    .line 883
    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer$SubNodeRenderer;->myMainNodeRenderer:Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;

    invoke-virtual {v0, p1, p2, p3}, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->extendRenderingNodeAttributes(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/renderer/AttributablePart;Lcom/vladsch/flexmark/util/html/Attributes;)Lcom/vladsch/flexmark/util/html/Attributes;

    move-result-object p1

    return-object p1
.end method

.method public getCurrentNode()Lcom/vladsch/flexmark/util/ast/Node;
    .locals 1

    .line 902
    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer$SubNodeRenderer;->myMainNodeRenderer:Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->getCurrentNode()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    return-object v0
.end method

.method public getDelegatedSubContext(Ljava/lang/Appendable;Z)Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;
    .locals 3

    .line 925
    new-instance v0, Lcom/vladsch/flexmark/html/HtmlWriter;

    iget-object v1, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer$SubNodeRenderer;->htmlWriter:Lcom/vladsch/flexmark/html/HtmlWriter;

    invoke-direct {v0, v1, p1, p2}, Lcom/vladsch/flexmark/html/HtmlWriter;-><init>(Lcom/vladsch/flexmark/html/HtmlWriter;Ljava/lang/Appendable;Z)V

    .line 926
    invoke-virtual {v0, p0}, Lcom/vladsch/flexmark/html/HtmlWriter;->setContext(Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;)V

    .line 928
    new-instance p1, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer$SubNodeRenderer;

    iget-object p2, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer$SubNodeRenderer;->this$1:Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;

    iget-object v1, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer$SubNodeRenderer;->myMainNodeRenderer:Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;

    const/4 v2, 0x1

    invoke-direct {p1, p2, v1, v0, v2}, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer$SubNodeRenderer;-><init>(Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;Lcom/vladsch/flexmark/html/HtmlWriter;Z)V

    return-object p1
.end method

.method protected getDoNotRenderLinksNesting()I
    .locals 1

    .line 939
    invoke-super {p0}, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->getDoNotRenderLinksNesting()I

    move-result v0

    return v0
.end method

.method public getDocument()Lcom/vladsch/flexmark/util/ast/Document;
    .locals 1

    .line 865
    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer$SubNodeRenderer;->myMainNodeRenderer:Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->getDocument()Lcom/vladsch/flexmark/util/ast/Document;

    move-result-object v0

    return-object v0
.end method

.method public getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;
    .locals 1

    .line 862
    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer$SubNodeRenderer;->myMainNodeRenderer:Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object v0

    return-object v0
.end method

.method public getHtmlWriter()Lcom/vladsch/flexmark/html/HtmlWriter;
    .locals 1

    .line 937
    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer$SubNodeRenderer;->htmlWriter:Lcom/vladsch/flexmark/html/HtmlWriter;

    return-object v0
.end method

.method public getNodeId(Lcom/vladsch/flexmark/util/ast/Node;)Ljava/lang/String;
    .locals 1

    .line 856
    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer$SubNodeRenderer;->myMainNodeRenderer:Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->getNodeId(Lcom/vladsch/flexmark/util/ast/Node;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getOptions()Lcom/vladsch/flexmark/util/options/DataHolder;
    .locals 1

    .line 859
    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer$SubNodeRenderer;->myMainNodeRenderer:Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->getOptions()Lcom/vladsch/flexmark/util/options/DataHolder;

    move-result-object v0

    return-object v0
.end method

.method public getRenderingPhase()Lcom/vladsch/flexmark/html/renderer/RenderingPhase;
    .locals 1

    .line 868
    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer$SubNodeRenderer;->myMainNodeRenderer:Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->getRenderingPhase()Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

    move-result-object v0

    return-object v0
.end method

.method public getSubContext(Ljava/lang/Appendable;Z)Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;
    .locals 3

    .line 917
    new-instance v0, Lcom/vladsch/flexmark/html/HtmlWriter;

    iget-object v1, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer$SubNodeRenderer;->htmlWriter:Lcom/vladsch/flexmark/html/HtmlWriter;

    invoke-direct {v0, v1, p1, p2}, Lcom/vladsch/flexmark/html/HtmlWriter;-><init>(Lcom/vladsch/flexmark/html/HtmlWriter;Ljava/lang/Appendable;Z)V

    .line 918
    invoke-virtual {v0, p0}, Lcom/vladsch/flexmark/html/HtmlWriter;->setContext(Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;)V

    .line 920
    new-instance p1, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer$SubNodeRenderer;

    iget-object p2, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer$SubNodeRenderer;->this$1:Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;

    iget-object v1, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer$SubNodeRenderer;->myMainNodeRenderer:Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;

    const/4 v2, 0x0

    invoke-direct {p1, p2, v1, v0, v2}, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer$SubNodeRenderer;-><init>(Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;Lcom/vladsch/flexmark/html/HtmlWriter;Z)V

    return-object p1
.end method

.method public isDoNotRenderLinks()Z
    .locals 1

    .line 942
    invoke-super {p0}, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->isDoNotRenderLinks()Z

    move-result v0

    return v0
.end method

.method public render(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 1

    .line 892
    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer$SubNodeRenderer;->myMainNodeRenderer:Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;

    invoke-virtual {v0, p1, p0}, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->renderNode(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/NodeRendererSubContext;)V

    return-void
.end method

.method public renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 1

    .line 933
    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer$SubNodeRenderer;->myMainNodeRenderer:Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;

    invoke-virtual {v0, p1, p0}, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->renderChildrenNode(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/NodeRendererSubContext;)V

    return-void
.end method

.method public resolveLink(Lcom/vladsch/flexmark/html/renderer/LinkType;Ljava/lang/CharSequence;Lcom/vladsch/flexmark/util/html/Attributes;Ljava/lang/Boolean;)Lcom/vladsch/flexmark/html/renderer/ResolvedLink;
    .locals 1

    .line 912
    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer$SubNodeRenderer;->myMainNodeRenderer:Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->resolveLink(Lcom/vladsch/flexmark/html/renderer/LinkType;Ljava/lang/CharSequence;Lcom/vladsch/flexmark/util/html/Attributes;Ljava/lang/Boolean;)Lcom/vladsch/flexmark/html/renderer/ResolvedLink;

    move-result-object p1

    return-object p1
.end method

.method public resolveLink(Lcom/vladsch/flexmark/html/renderer/LinkType;Ljava/lang/CharSequence;Ljava/lang/Boolean;)Lcom/vladsch/flexmark/html/renderer/ResolvedLink;
    .locals 1

    .line 907
    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer$SubNodeRenderer;->myMainNodeRenderer:Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;

    invoke-virtual {v0, p1, p2, p3}, Lcom/vladsch/flexmark/html/HtmlRenderer$MainNodeRenderer;->resolveLink(Lcom/vladsch/flexmark/html/renderer/LinkType;Ljava/lang/CharSequence;Ljava/lang/Boolean;)Lcom/vladsch/flexmark/html/renderer/ResolvedLink;

    move-result-object p1

    return-object p1
.end method
