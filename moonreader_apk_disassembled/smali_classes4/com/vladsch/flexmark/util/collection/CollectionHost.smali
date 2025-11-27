.class public interface abstract Lcom/vladsch/flexmark/util/collection/CollectionHost;
.super Ljava/lang/Object;
.source "CollectionHost.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract adding(ILjava/lang/Object;Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITK;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation
.end method

.method public abstract addingNulls(I)V
.end method

.method public abstract clearing()V
.end method

.method public abstract getIteratorModificationCount()I
.end method

.method public abstract removing(ILjava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITK;)",
            "Ljava/lang/Object;"
        }
    .end annotation
.end method

.method public abstract skipHostUpdate()Z
.end method
