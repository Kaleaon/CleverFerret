.class public Lcom/vladsch/flexmark/util/dependency/DependentItem;
.super Ljava/lang/Object;
.source "DependentItem.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field dependencies:Ljava/util/BitSet;

.field public final dependent:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TD;"
        }
    .end annotation
.end field

.field public final dependentClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "+TD;>;"
        }
    .end annotation
.end field

.field dependents:Ljava/util/BitSet;

.field public final index:I

.field public final isGlobalScope:Z


# direct methods
.method public constructor <init>(ILjava/lang/Object;Ljava/lang/Class;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITD;",
            "Ljava/lang/Class<",
            "+TD;>;Z)V"
        }
    .end annotation

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput p1, p0, Lcom/vladsch/flexmark/util/dependency/DependentItem;->index:I

    .line 15
    iput-object p2, p0, Lcom/vladsch/flexmark/util/dependency/DependentItem;->dependent:Ljava/lang/Object;

    .line 16
    iput-object p3, p0, Lcom/vladsch/flexmark/util/dependency/DependentItem;->dependentClass:Ljava/lang/Class;

    .line 17
    iput-boolean p4, p0, Lcom/vladsch/flexmark/util/dependency/DependentItem;->isGlobalScope:Z

    return-void
.end method


# virtual methods
.method public addDependency(Lcom/vladsch/flexmark/util/dependency/DependentItem;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/dependency/DependentItem<",
            "TD;>;)V"
        }
    .end annotation

    .line 21
    iget-object v0, p0, Lcom/vladsch/flexmark/util/dependency/DependentItem;->dependencies:Ljava/util/BitSet;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/BitSet;

    invoke-direct {v0}, Ljava/util/BitSet;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/dependency/DependentItem;->dependencies:Ljava/util/BitSet;

    .line 22
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/dependency/DependentItem;->dependencies:Ljava/util/BitSet;

    iget p1, p1, Lcom/vladsch/flexmark/util/dependency/DependentItem;->index:I

    invoke-virtual {v0, p1}, Ljava/util/BitSet;->set(I)V

    return-void
.end method

.method public addDependency(Ljava/util/BitSet;)V
    .locals 1

    .line 26
    iget-object v0, p0, Lcom/vladsch/flexmark/util/dependency/DependentItem;->dependencies:Ljava/util/BitSet;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/BitSet;

    invoke-direct {v0}, Ljava/util/BitSet;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/dependency/DependentItem;->dependencies:Ljava/util/BitSet;

    .line 27
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/dependency/DependentItem;->dependencies:Ljava/util/BitSet;

    invoke-virtual {v0, p1}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    return-void
.end method

.method public addDependent(Lcom/vladsch/flexmark/util/dependency/DependentItem;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/dependency/DependentItem<",
            "TD;>;)V"
        }
    .end annotation

    .line 45
    iget-object v0, p0, Lcom/vladsch/flexmark/util/dependency/DependentItem;->dependents:Ljava/util/BitSet;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/BitSet;

    invoke-direct {v0}, Ljava/util/BitSet;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/dependency/DependentItem;->dependents:Ljava/util/BitSet;

    .line 46
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/dependency/DependentItem;->dependents:Ljava/util/BitSet;

    iget p1, p1, Lcom/vladsch/flexmark/util/dependency/DependentItem;->index:I

    invoke-virtual {v0, p1}, Ljava/util/BitSet;->set(I)V

    return-void
.end method

.method public addDependent(Ljava/util/BitSet;)V
    .locals 1

    .line 50
    iget-object v0, p0, Lcom/vladsch/flexmark/util/dependency/DependentItem;->dependents:Ljava/util/BitSet;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/BitSet;

    invoke-direct {v0}, Ljava/util/BitSet;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/dependency/DependentItem;->dependents:Ljava/util/BitSet;

    .line 51
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/dependency/DependentItem;->dependents:Ljava/util/BitSet;

    invoke-virtual {v0, p1}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    return-void
.end method

.method public hasDependencies()Z
    .locals 3

    .line 67
    iget-object v0, p0, Lcom/vladsch/flexmark/util/dependency/DependentItem;->dependencies:Ljava/util/BitSet;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0, v1}, Ljava/util/BitSet;->nextSetBit(I)I

    move-result v0

    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    return v1
.end method

.method public hasDependents()Z
    .locals 3

    .line 71
    iget-object v0, p0, Lcom/vladsch/flexmark/util/dependency/DependentItem;->dependents:Ljava/util/BitSet;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0, v1}, Ljava/util/BitSet;->nextSetBit(I)I

    move-result v0

    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    return v1
.end method

.method public removeDependency(Lcom/vladsch/flexmark/util/dependency/DependentItem;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/dependency/DependentItem<",
            "TD;>;)Z"
        }
    .end annotation

    .line 31
    iget-object v0, p0, Lcom/vladsch/flexmark/util/dependency/DependentItem;->dependencies:Ljava/util/BitSet;

    if-eqz v0, :cond_0

    .line 32
    iget p1, p1, Lcom/vladsch/flexmark/util/dependency/DependentItem;->index:I

    invoke-virtual {v0, p1}, Ljava/util/BitSet;->clear(I)V

    .line 34
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/dependency/DependentItem;->hasDependencies()Z

    move-result p1

    return p1
.end method

.method public removeDependency(Ljava/util/BitSet;)Z
    .locals 1

    .line 38
    iget-object v0, p0, Lcom/vladsch/flexmark/util/dependency/DependentItem;->dependencies:Ljava/util/BitSet;

    if-eqz v0, :cond_0

    .line 39
    invoke-virtual {v0, p1}, Ljava/util/BitSet;->andNot(Ljava/util/BitSet;)V

    .line 41
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/dependency/DependentItem;->hasDependencies()Z

    move-result p1

    return p1
.end method

.method public removeDependent(Lcom/vladsch/flexmark/util/dependency/DependentItem;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/dependency/DependentItem<",
            "TD;>;)V"
        }
    .end annotation

    .line 55
    iget-object v0, p0, Lcom/vladsch/flexmark/util/dependency/DependentItem;->dependents:Ljava/util/BitSet;

    if-eqz v0, :cond_0

    .line 56
    iget p1, p1, Lcom/vladsch/flexmark/util/dependency/DependentItem;->index:I

    invoke-virtual {v0, p1}, Ljava/util/BitSet;->clear(I)V

    :cond_0
    return-void
.end method

.method public removeDependent(Ljava/util/BitSet;)V
    .locals 1

    .line 61
    iget-object v0, p0, Lcom/vladsch/flexmark/util/dependency/DependentItem;->dependents:Ljava/util/BitSet;

    if-eqz v0, :cond_0

    .line 62
    invoke-virtual {v0, p1}, Ljava/util/BitSet;->andNot(Ljava/util/BitSet;)V

    :cond_0
    return-void
.end method
