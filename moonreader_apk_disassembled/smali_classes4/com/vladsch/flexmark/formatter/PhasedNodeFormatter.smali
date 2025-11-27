.class public interface abstract Lcom/vladsch/flexmark/formatter/PhasedNodeFormatter;
.super Ljava/lang/Object;
.source "PhasedNodeFormatter.java"

# interfaces
.implements Lcom/vladsch/flexmark/formatter/NodeFormatter;


# virtual methods
.method public abstract getFormattingPhases()Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/vladsch/flexmark/formatter/FormattingPhase;",
            ">;"
        }
    .end annotation
.end method

.method public abstract renderDocument(Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/formatter/FormattingPhase;)V
.end method
