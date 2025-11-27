.class public interface abstract Lcom/vladsch/flexmark/util/dependency/Dependent;
.super Ljava/lang/Object;
.source "Dependent.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<S:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract affectsGlobalScope()Z
.end method

.method public abstract getAfterDependents()Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "+",
            "Ljava/lang/Class;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getBeforeDependents()Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "+",
            "Ljava/lang/Class;",
            ">;"
        }
    .end annotation
.end method
