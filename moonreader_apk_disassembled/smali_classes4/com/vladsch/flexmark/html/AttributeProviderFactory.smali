.class public interface abstract Lcom/vladsch/flexmark/html/AttributeProviderFactory;
.super Ljava/lang/Object;
.source "AttributeProviderFactory.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/ComputableFactory;
.implements Lcom/vladsch/flexmark/util/dependency/Dependent;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/ComputableFactory<",
        "Lcom/vladsch/flexmark/html/AttributeProvider;",
        "Lcom/vladsch/flexmark/html/renderer/LinkResolverContext;",
        ">;",
        "Lcom/vladsch/flexmark/util/dependency/Dependent<",
        "Lcom/vladsch/flexmark/html/AttributeProviderFactory;",
        ">;"
    }
.end annotation


# virtual methods
.method public abstract affectsGlobalScope()Z
.end method

.method public abstract create(Lcom/vladsch/flexmark/html/renderer/LinkResolverContext;)Lcom/vladsch/flexmark/html/AttributeProvider;
.end method

.method public abstract getAfterDependents()Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/Class<",
            "+",
            "Lcom/vladsch/flexmark/html/AttributeProviderFactory;",
            ">;>;"
        }
    .end annotation
.end method

.method public abstract getBeforeDependents()Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/Class<",
            "+",
            "Lcom/vladsch/flexmark/html/AttributeProviderFactory;",
            ">;>;"
        }
    .end annotation
.end method
