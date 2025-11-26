.class public interface abstract Lcom/vladsch/flexmark/formatter/NodeFormatterContext;
.super Ljava/lang/Object;
.source "NodeFormatterContext.java"

# interfaces
.implements Lcom/vladsch/flexmark/formatter/TranslationContext;


# virtual methods
.method public abstract getCurrentNode()Lcom/vladsch/flexmark/util/ast/Node;
.end method

.method public abstract getDocument()Lcom/vladsch/flexmark/util/ast/Document;
.end method

.method public abstract getFormatterOptions()Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;
.end method

.method public abstract getFormattingPhase()Lcom/vladsch/flexmark/formatter/FormattingPhase;
.end method

.method public abstract getMarkdown()Lcom/vladsch/flexmark/formatter/MarkdownWriter;
.end method

.method public abstract getOptions()Lcom/vladsch/flexmark/util/options/DataHolder;
.end method

.method public abstract getSubContext(Ljava/lang/Appendable;)Lcom/vladsch/flexmark/formatter/NodeFormatterContext;
.end method

.method public abstract nodesOfType(Ljava/util/Collection;)Ljava/lang/Iterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ljava/lang/Class<",
            "*>;>;)",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation
.end method

.method public abstract nodesOfType([Ljava/lang/Class;)Ljava/lang/Iterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation
.end method

.method public abstract render(Lcom/vladsch/flexmark/util/ast/Node;)V
.end method

.method public abstract renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V
.end method

.method public abstract reversedNodesOfType(Ljava/util/Collection;)Ljava/lang/Iterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ljava/lang/Class<",
            "*>;>;)",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation
.end method

.method public abstract reversedNodesOfType([Ljava/lang/Class;)Ljava/lang/Iterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation
.end method
