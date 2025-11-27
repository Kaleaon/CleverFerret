.class public interface abstract Lcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;
.super Ljava/lang/Object;
.source "DelimiterProcessor.java"


# virtual methods
.method public abstract canBeCloser(Ljava/lang/String;Ljava/lang/String;ZZZZZZ)Z
.end method

.method public abstract canBeOpener(Ljava/lang/String;Ljava/lang/String;ZZZZZZ)Z
.end method

.method public abstract getClosingCharacter()C
.end method

.method public abstract getDelimiterUse(Lcom/vladsch/flexmark/parser/delimiter/DelimiterRun;Lcom/vladsch/flexmark/parser/delimiter/DelimiterRun;)I
.end method

.method public abstract getMinLength()I
.end method

.method public abstract getOpeningCharacter()C
.end method

.method public abstract process(Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;I)V
.end method

.method public abstract skipNonOpenerCloser()Z
.end method

.method public abstract unmatchedDelimiterNode(Lcom/vladsch/flexmark/parser/InlineParser;Lcom/vladsch/flexmark/parser/delimiter/DelimiterRun;)Lcom/vladsch/flexmark/util/ast/Node;
.end method
