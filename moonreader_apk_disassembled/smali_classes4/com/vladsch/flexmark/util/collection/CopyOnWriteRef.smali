.class public Lcom/vladsch/flexmark/util/collection/CopyOnWriteRef;
.super Ljava/lang/Object;
.source "CopyOnWriteRef.java"


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
.field private myCloner:Lcom/vladsch/flexmark/util/Computable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/Computable<",
            "TT;TT;>;"
        }
    .end annotation
.end field

.field private myMutable:Z

.field private myReferenceCount:I

.field private myValue:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Object;Lcom/vladsch/flexmark/util/Computable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lcom/vladsch/flexmark/util/Computable<",
            "TT;TT;>;)V"
        }
    .end annotation

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/vladsch/flexmark/util/collection/CopyOnWriteRef;->myValue:Ljava/lang/Object;

    const/4 p1, 0x0

    .line 13
    iput p1, p0, Lcom/vladsch/flexmark/util/collection/CopyOnWriteRef;->myReferenceCount:I

    .line 14
    iput-object p2, p0, Lcom/vladsch/flexmark/util/collection/CopyOnWriteRef;->myCloner:Lcom/vladsch/flexmark/util/Computable;

    return-void
.end method


# virtual methods
.method public getImmutable()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 22
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/CopyOnWriteRef;->myValue:Ljava/lang/Object;

    if-eqz v0, :cond_0

    iget v1, p0, Lcom/vladsch/flexmark/util/collection/CopyOnWriteRef;->myReferenceCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/vladsch/flexmark/util/collection/CopyOnWriteRef;->myReferenceCount:I

    :cond_0
    return-object v0
.end method

.method public getMutable()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 27
    iget v0, p0, Lcom/vladsch/flexmark/util/collection/CopyOnWriteRef;->myReferenceCount:I

    if-lez v0, :cond_0

    .line 28
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/CopyOnWriteRef;->myCloner:Lcom/vladsch/flexmark/util/Computable;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/CopyOnWriteRef;->myValue:Ljava/lang/Object;

    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/util/Computable;->compute(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/vladsch/flexmark/util/collection/CopyOnWriteRef;->myValue:Ljava/lang/Object;

    const/4 v0, 0x0

    .line 29
    iput v0, p0, Lcom/vladsch/flexmark/util/collection/CopyOnWriteRef;->myReferenceCount:I

    .line 31
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/CopyOnWriteRef;->myValue:Ljava/lang/Object;

    return-object v0
.end method

.method public getPeek()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 18
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/CopyOnWriteRef;->myValue:Ljava/lang/Object;

    return-object v0
.end method

.method public isMutable()Z
    .locals 1

    .line 40
    iget v0, p0, Lcom/vladsch/flexmark/util/collection/CopyOnWriteRef;->myReferenceCount:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setValue(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 35
    iput v0, p0, Lcom/vladsch/flexmark/util/collection/CopyOnWriteRef;->myReferenceCount:I

    .line 36
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/CopyOnWriteRef;->myCloner:Lcom/vladsch/flexmark/util/Computable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/Computable;->compute(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/util/collection/CopyOnWriteRef;->myValue:Ljava/lang/Object;

    return-void
.end method
