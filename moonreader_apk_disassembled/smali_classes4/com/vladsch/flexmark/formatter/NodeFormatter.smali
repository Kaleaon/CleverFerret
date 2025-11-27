.class public interface abstract Lcom/vladsch/flexmark/formatter/NodeFormatter;
.super Ljava/lang/Object;
.source "NodeFormatter.java"


# virtual methods
.method public abstract getNodeClasses()Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/Class<",
            "*>;>;"
        }
    .end annotation
.end method

.method public abstract getNodeFormattingHandlers()Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/vladsch/flexmark/formatter/NodeFormattingHandler<",
            "*>;>;"
        }
    .end annotation
.end method
