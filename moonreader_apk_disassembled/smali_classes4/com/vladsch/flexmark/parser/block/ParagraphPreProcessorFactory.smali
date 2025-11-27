.class public interface abstract Lcom/vladsch/flexmark/parser/block/ParagraphPreProcessorFactory;
.super Ljava/lang/Object;
.source "ParagraphPreProcessorFactory.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/ComputableFactory;
.implements Lcom/vladsch/flexmark/util/dependency/Dependent;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/ComputableFactory<",
        "Lcom/vladsch/flexmark/parser/block/ParagraphPreProcessor;",
        "Lcom/vladsch/flexmark/parser/block/ParserState;",
        ">;",
        "Lcom/vladsch/flexmark/util/dependency/Dependent<",
        "Lcom/vladsch/flexmark/parser/block/ParagraphPreProcessorFactory;",
        ">;"
    }
.end annotation


# virtual methods
.method public abstract create(Lcom/vladsch/flexmark/parser/block/ParserState;)Lcom/vladsch/flexmark/parser/block/ParagraphPreProcessor;
.end method
