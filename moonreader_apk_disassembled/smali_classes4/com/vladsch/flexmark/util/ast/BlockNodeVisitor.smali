.class public Lcom/vladsch/flexmark/util/ast/BlockNodeVisitor;
.super Lcom/vladsch/flexmark/util/ast/NodeVisitor;
.source "BlockNodeVisitor.java"


# direct methods
.method public constructor <init>(Ljava/util/Collection;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lcom/vladsch/flexmark/util/ast/VisitHandler<",
            "*>;>;)V"
        }
    .end annotation

    .line 21
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/NodeVisitor;-><init>(Ljava/util/Collection;)V

    return-void
.end method

.method public varargs constructor <init>([Lcom/vladsch/flexmark/util/ast/VisitHandler;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/vladsch/flexmark/util/ast/VisitHandler<",
            "*>;)V"
        }
    .end annotation

    .line 13
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/NodeVisitor;-><init>([Lcom/vladsch/flexmark/util/ast/VisitHandler;)V

    return-void
.end method

.method public varargs constructor <init>([[Lcom/vladsch/flexmark/util/ast/VisitHandler;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([[",
            "Lcom/vladsch/flexmark/util/ast/VisitHandler<",
            "*>;)V"
        }
    .end annotation

    .line 17
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/NodeVisitor;-><init>([[Lcom/vladsch/flexmark/util/ast/VisitHandler;)V

    return-void
.end method


# virtual methods
.method public visit(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 1

    .line 26
    instance-of v0, p1, Lcom/vladsch/flexmark/util/ast/Block;

    if-eqz v0, :cond_0

    .line 27
    invoke-super {p0, p1}, Lcom/vladsch/flexmark/util/ast/NodeVisitor;->visit(Lcom/vladsch/flexmark/util/ast/Node;)V

    :cond_0
    return-void
.end method
