.class public abstract Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler;
.super Ljava/lang/Object;
.source "NodeAdaptingVisitHandler.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<N:",
        "Lcom/vladsch/flexmark/util/ast/Node;",
        "A::",
        "Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitor<",
        "TN;>;>",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field protected final myAdapter:Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TA;"
        }
    .end annotation
.end field

.field protected final myClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "+TN;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitor;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+TN;>;TA;)V"
        }
    .end annotation

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler;->myClass:Ljava/lang/Class;

    .line 14
    iput-object p2, p0, Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler;->myAdapter:Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitor;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_3

    .line 35
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_0

    .line 37
    :cond_1
    check-cast p1, Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler;

    .line 39
    iget-object v2, p0, Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler;->myClass:Ljava/lang/Class;

    iget-object v3, p1, Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler;->myClass:Ljava/lang/Class;

    if-eq v2, v3, :cond_2

    return v1

    .line 40
    :cond_2
    iget-object v2, p0, Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler;->myAdapter:Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitor;

    iget-object p1, p1, Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler;->myAdapter:Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitor;

    if-ne v2, p1, :cond_3

    return v0

    :cond_3
    :goto_0
    return v1
.end method

.method public getNodeAdapter()Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitor;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TA;"
        }
    .end annotation

    .line 22
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler;->myAdapter:Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitor;

    return-object v0
.end method

.method public getNodeType()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "+TN;>;"
        }
    .end annotation

    .line 18
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler;->myClass:Ljava/lang/Class;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .line 45
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler;->myClass:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    .line 46
    iget-object v1, p0, Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler;->myAdapter:Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitor;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method
