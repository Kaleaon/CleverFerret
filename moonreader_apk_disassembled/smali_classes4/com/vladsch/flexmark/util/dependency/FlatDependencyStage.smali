.class public Lcom/vladsch/flexmark/util/dependency/FlatDependencyStage;
.super Ljava/lang/Object;
.source "FlatDependencyStage.java"


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
.field private final dependents:Ljava/util/List;
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

    .line 10
    iput-object p1, p0, Lcom/vladsch/flexmark/util/dependency/FlatDependencyStage;->dependents:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public getDependents()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 14
    iget-object v0, p0, Lcom/vladsch/flexmark/util/dependency/FlatDependencyStage;->dependents:Ljava/util/List;

    return-object v0
.end method
