.class public abstract Lcom/vladsch/flexmark/ast/util/AnchorRefTargetBlockVisitor;
.super Lcom/vladsch/flexmark/util/ast/NodeVisitorBase;
.source "AnchorRefTargetBlockVisitor.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/ast/NodeVisitorBase;-><init>()V

    return-void
.end method


# virtual methods
.method protected abstract visit(Lcom/vladsch/flexmark/ast/AnchorRefTarget;)V
.end method

.method public visit(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 1

    .line 18
    instance-of v0, p1, Lcom/vladsch/flexmark/ast/AnchorRefTarget;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lcom/vladsch/flexmark/ast/AnchorRefTarget;

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/ast/util/AnchorRefTargetBlockVisitor;->visit(Lcom/vladsch/flexmark/ast/AnchorRefTarget;)V

    .line 19
    :cond_0
    instance-of v0, p1, Lcom/vladsch/flexmark/util/ast/Block;

    if-eqz v0, :cond_1

    .line 20
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ast/util/AnchorRefTargetBlockVisitor;->visitChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    :cond_1
    return-void
.end method
