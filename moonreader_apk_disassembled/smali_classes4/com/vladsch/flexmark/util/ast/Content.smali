.class public interface abstract Lcom/vladsch/flexmark/util/ast/Content;
.super Ljava/lang/Object;
.source "Content.java"


# virtual methods
.method public abstract getContentChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract getContentChars(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract getContentLines()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getContentLines(II)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getLineChars(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract getLineCount()I
.end method

.method public abstract getSpanningChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method
