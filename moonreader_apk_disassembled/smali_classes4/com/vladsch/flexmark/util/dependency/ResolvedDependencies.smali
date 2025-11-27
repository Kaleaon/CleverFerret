.class public Lcom/vladsch/flexmark/util/dependency/ResolvedDependencies;
.super Ljava/lang/Object;
.source "ResolvedDependencies.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final dependentStages:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "TT;>;)V"
        }
    .end annotation

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    iput-object p1, p0, Lcom/vladsch/flexmark/util/dependency/ResolvedDependencies;->dependentStages:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public getDependentStages()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 13
    iget-object v0, p0, Lcom/vladsch/flexmark/util/dependency/ResolvedDependencies;->dependentStages:Ljava/util/List;

    return-object v0
.end method

.method public isEmpty()Z
    .locals 1

    .line 17
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/dependency/ResolvedDependencies;->getDependentStages()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    return v0
.end method
