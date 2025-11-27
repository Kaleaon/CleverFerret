.class public abstract Lcom/vladsch/flexmark/formatter/NodeFormatterSubContext;
.super Ljava/lang/Object;
.source "NodeFormatterSubContext.java"

# interfaces
.implements Lcom/vladsch/flexmark/formatter/NodeFormatterContext;


# instance fields
.field protected final markdown:Lcom/vladsch/flexmark/formatter/MarkdownWriter;

.field renderingNode:Lcom/vladsch/flexmark/util/ast/Node;


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-object p1, p0, Lcom/vladsch/flexmark/formatter/NodeFormatterSubContext;->markdown:Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    const/4 p1, 0x0

    .line 11
    iput-object p1, p0, Lcom/vladsch/flexmark/formatter/NodeFormatterSubContext;->renderingNode:Lcom/vladsch/flexmark/util/ast/Node;

    return-void
.end method


# virtual methods
.method public flush()V
    .locals 1

    .line 27
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/NodeFormatterSubContext;->markdown:Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->line()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->flush()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void
.end method

.method public flush(I)V
    .locals 1

    .line 31
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/NodeFormatterSubContext;->markdown:Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->line()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->flush(I)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void
.end method

.method public getMarkdown()Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1

    .line 23
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/NodeFormatterSubContext;->markdown:Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-object v0
.end method

.method public getRenderingNode()Lcom/vladsch/flexmark/util/ast/Node;
    .locals 1

    .line 15
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/NodeFormatterSubContext;->renderingNode:Lcom/vladsch/flexmark/util/ast/Node;

    return-object v0
.end method

.method public setRenderingNode(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 0

    .line 19
    iput-object p1, p0, Lcom/vladsch/flexmark/formatter/NodeFormatterSubContext;->renderingNode:Lcom/vladsch/flexmark/util/ast/Node;

    return-void
.end method
