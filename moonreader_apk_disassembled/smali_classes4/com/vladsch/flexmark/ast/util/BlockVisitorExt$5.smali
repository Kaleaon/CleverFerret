.class final Lcom/vladsch/flexmark/ast/util/BlockVisitorExt$5;
.super Ljava/lang/Object;
.source "BlockVisitorExt.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/ast/Visitor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/ast/util/BlockVisitorExt;->VISIT_HANDLERS(Lcom/vladsch/flexmark/ast/util/BlockVisitor;)[Lcom/vladsch/flexmark/util/ast/VisitHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/ast/Visitor<",
        "Lcom/vladsch/flexmark/ast/Heading;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$visitor:Lcom/vladsch/flexmark/ast/util/BlockVisitor;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/ast/util/BlockVisitor;)V
    .locals 0

    .line 35
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/util/BlockVisitorExt$5;->val$visitor:Lcom/vladsch/flexmark/ast/util/BlockVisitor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public visit(Lcom/vladsch/flexmark/ast/Heading;)V
    .locals 1

    .line 38
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/BlockVisitorExt$5;->val$visitor:Lcom/vladsch/flexmark/ast/util/BlockVisitor;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/ast/util/BlockVisitor;->visit(Lcom/vladsch/flexmark/ast/Heading;)V

    return-void
.end method

.method public bridge synthetic visit(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 0

    .line 35
    check-cast p1, Lcom/vladsch/flexmark/ast/Heading;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ast/util/BlockVisitorExt$5;->visit(Lcom/vladsch/flexmark/ast/Heading;)V

    return-void
.end method
