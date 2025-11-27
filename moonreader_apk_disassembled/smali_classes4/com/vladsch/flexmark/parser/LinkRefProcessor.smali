.class public interface abstract Lcom/vladsch/flexmark/parser/LinkRefProcessor;
.super Ljava/lang/Object;
.source "LinkRefProcessor.java"


# virtual methods
.method public abstract adjustInlineText(Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/util/ast/Node;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract allowDelimiters(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/util/ast/Node;)Z
.end method

.method public abstract createNode(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/ast/Node;
.end method

.method public abstract getBracketNestingLevel()I
.end method

.method public abstract getWantExclamationPrefix()Z
.end method

.method public abstract isMatch(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Z
.end method

.method public abstract updateNodeElements(Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/util/ast/Node;)V
.end method
