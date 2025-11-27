.class public abstract Lcom/vladsch/flexmark/util/ast/AllNodesVisitor;
.super Ljava/lang/Object;
.source "AllNodesVisitor.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private visitChildren(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 1

    .line 11
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p1

    :goto_0
    if-eqz p1, :cond_0

    .line 15
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    .line 16
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/ast/AllNodesVisitor;->process(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 17
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/ast/AllNodesVisitor;->visit(Lcom/vladsch/flexmark/util/ast/Node;)V

    move-object p1, v0

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method protected abstract process(Lcom/vladsch/flexmark/util/ast/Node;)V
.end method

.method public visit(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/AllNodesVisitor;->visitChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method
