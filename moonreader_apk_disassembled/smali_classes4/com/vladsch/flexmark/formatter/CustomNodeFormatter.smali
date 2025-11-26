.class public interface abstract Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;
.super Ljava/lang/Object;
.source "CustomNodeFormatter.java"

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
.method public abstract render(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TN;",
            "Lcom/vladsch/flexmark/formatter/NodeFormatterContext;",
            "Lcom/vladsch/flexmark/formatter/MarkdownWriter;",
            ")V"
        }
    .end annotation
.end method
