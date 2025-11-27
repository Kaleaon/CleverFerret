.class public interface abstract Lcom/vladsch/flexmark/parser/PostProcessorFactory;
.super Ljava/lang/Object;
.source "PostProcessorFactory.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/ComputableFactory;
.implements Lcom/vladsch/flexmark/util/dependency/Dependent;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/ComputableFactory<",
        "Lcom/vladsch/flexmark/parser/PostProcessor;",
        "Lcom/vladsch/flexmark/util/ast/Document;",
        ">;",
        "Lcom/vladsch/flexmark/util/dependency/Dependent<",
        "Lcom/vladsch/flexmark/parser/PostProcessorFactory;",
        ">;"
    }
.end annotation


# virtual methods
.method public abstract create(Lcom/vladsch/flexmark/util/ast/Document;)Lcom/vladsch/flexmark/parser/PostProcessor;
.end method

.method public abstract getNodeTypes()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/util/Set<",
            "Ljava/lang/Class<",
            "*>;>;>;"
        }
    .end annotation
.end method
