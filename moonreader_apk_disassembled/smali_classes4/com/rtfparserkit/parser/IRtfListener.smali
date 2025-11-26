.class public interface abstract Lcom/rtfparserkit/parser/IRtfListener;
.super Ljava/lang/Object;
.source "IRtfListener.java"


# virtual methods
.method public abstract processBinaryBytes([B)V
.end method

.method public abstract processCharacterBytes([B)V
.end method

.method public abstract processCommand(Lcom/rtfparserkit/rtf/Command;IZZ)V
.end method

.method public abstract processDocumentEnd()V
.end method

.method public abstract processDocumentStart()V
.end method

.method public abstract processGroupEnd()V
.end method

.method public abstract processGroupStart()V
.end method

.method public abstract processString(Ljava/lang/String;)V
.end method
