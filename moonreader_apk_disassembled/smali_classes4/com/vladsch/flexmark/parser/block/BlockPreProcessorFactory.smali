.class public interface abstract Lcom/vladsch/flexmark/parser/block/BlockPreProcessorFactory;
.super Ljava/lang/Object;
.source "BlockPreProcessorFactory.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/ComputableFactory;
.implements Lcom/vladsch/flexmark/util/dependency/Dependent;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/ComputableFactory<",
        "Lcom/vladsch/flexmark/parser/block/BlockPreProcessor;",
        "Lcom/vladsch/flexmark/parser/block/ParserState;",
        ">;",
        "Lcom/vladsch/flexmark/util/dependency/Dependent<",
        "Lcom/vladsch/flexmark/parser/block/BlockPreProcessorFactory;",
        ">;"
    }
.end annotation


# virtual methods
.method public abstract create(Lcom/vladsch/flexmark/parser/block/ParserState;)Lcom/vladsch/flexmark/parser/block/BlockPreProcessor;
.end method

.method public abstract getBlockTypes()Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/Class<",
            "+",
            "Lcom/vladsch/flexmark/util/ast/Block;",
            ">;>;"
        }
    .end annotation
.end method
