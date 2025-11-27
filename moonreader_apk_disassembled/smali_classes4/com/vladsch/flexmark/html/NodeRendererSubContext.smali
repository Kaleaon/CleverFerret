.class public abstract Lcom/vladsch/flexmark/html/NodeRendererSubContext;
.super Ljava/lang/Object;
.source "NodeRendererSubContext.java"

# interfaces
.implements Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;


# instance fields
.field doNotRenderLinksNesting:I

.field final htmlWriter:Lcom/vladsch/flexmark/html/HtmlWriter;

.field renderingHandlerWrapper:Lcom/vladsch/flexmark/html/NodeRenderingHandlerWrapper;

.field renderingNode:Lcom/vladsch/flexmark/util/ast/Node;


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->htmlWriter:Lcom/vladsch/flexmark/html/HtmlWriter;

    const/4 p1, 0x0

    .line 14
    iput-object p1, p0, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->renderingNode:Lcom/vladsch/flexmark/util/ast/Node;

    const/4 p1, 0x0

    .line 15
    iput p1, p0, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->doNotRenderLinksNesting:I

    return-void
.end method


# virtual methods
.method public doNotRenderLinks()V
    .locals 1

    .line 44
    iget v0, p0, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->doNotRenderLinksNesting:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->doNotRenderLinksNesting:I

    return-void
.end method

.method public doNotRenderLinks(Z)V
    .locals 0

    if-eqz p1, :cond_0

    .line 39
    invoke-virtual {p0}, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->doNotRenderLinks()V

    return-void

    .line 40
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->doRenderLinks()V

    return-void
.end method

.method public doRenderLinks()V
    .locals 2

    .line 48
    iget v0, p0, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->doNotRenderLinksNesting:I

    if-eqz v0, :cond_0

    add-int/lit8 v0, v0, -0x1

    .line 49
    iput v0, p0, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->doNotRenderLinksNesting:I

    return-void

    .line 48
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Not in do not render links context"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public flush()V
    .locals 1

    .line 23
    iget-object v0, p0, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->htmlWriter:Lcom/vladsch/flexmark/html/HtmlWriter;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->line()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/html/HtmlWriter;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->flush()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void
.end method

.method public flush(I)V
    .locals 1

    .line 27
    iget-object v0, p0, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->htmlWriter:Lcom/vladsch/flexmark/html/HtmlWriter;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->line()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/html/HtmlWriter;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->flush(I)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void
.end method

.method protected getDoNotRenderLinksNesting()I
    .locals 1

    .line 31
    iget v0, p0, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->doNotRenderLinksNesting:I

    return v0
.end method

.method public getHtmlWriter()Lcom/vladsch/flexmark/html/HtmlWriter;
    .locals 1

    .line 19
    iget-object v0, p0, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->htmlWriter:Lcom/vladsch/flexmark/html/HtmlWriter;

    return-object v0
.end method

.method public isDoNotRenderLinks()Z
    .locals 1

    .line 35
    iget v0, p0, Lcom/vladsch/flexmark/html/NodeRendererSubContext;->doNotRenderLinksNesting:I

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method
