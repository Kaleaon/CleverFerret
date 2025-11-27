.class final Lcom/vladsch/flexmark/ast/util/BlockVisitorExt$2;
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
        "Lcom/vladsch/flexmark/ast/BulletList;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$visitor:Lcom/vladsch/flexmark/ast/util/BlockVisitor;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/ast/util/BlockVisitor;)V
    .locals 0

    .line 17
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/util/BlockVisitorExt$2;->val$visitor:Lcom/vladsch/flexmark/ast/util/BlockVisitor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public visit(Lcom/vladsch/flexmark/ast/BulletList;)V
    .locals 1

    .line 20
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/BlockVisitorExt$2;->val$visitor:Lcom/vladsch/flexmark/ast/util/BlockVisitor;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/ast/util/BlockVisitor;->visit(Lcom/vladsch/flexmark/ast/BulletList;)V

    return-void
.end method

.method public bridge synthetic visit(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 0

    .line 17
    check-cast p1, Lcom/vladsch/flexmark/ast/BulletList;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ast/util/BlockVisitorExt$2;->visit(Lcom/vladsch/flexmark/ast/BulletList;)V

    return-void
.end method
