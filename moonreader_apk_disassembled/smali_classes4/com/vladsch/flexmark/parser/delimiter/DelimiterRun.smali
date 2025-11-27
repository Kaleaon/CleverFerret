.class public interface abstract Lcom/vladsch/flexmark/parser/delimiter/DelimiterRun;
.super Ljava/lang/Object;
.source "DelimiterRun.java"


# virtual methods
.method public abstract canClose()Z
.end method

.method public abstract canOpen()Z
.end method

.method public abstract getDelimiterChar()C
.end method

.method public abstract getNext()Lcom/vladsch/flexmark/parser/delimiter/DelimiterRun;
.end method

.method public abstract getNode()Lcom/vladsch/flexmark/ast/Text;
.end method

.method public abstract getPrevious()Lcom/vladsch/flexmark/parser/delimiter/DelimiterRun;
.end method

.method public abstract length()I
.end method
