.class final Lcom/vladsch/flexmark/ast/util/InlineVisitorExt$15;
.super Ljava/lang/Object;
.source "InlineVisitorExt.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/ast/Visitor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/ast/util/InlineVisitorExt;->VISIT_HANDLERS(Lcom/vladsch/flexmark/ast/util/InlineVisitor;)[Lcom/vladsch/flexmark/util/ast/VisitHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/ast/Visitor<",
        "Lcom/vladsch/flexmark/ast/Text;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$visitor:Lcom/vladsch/flexmark/ast/util/InlineVisitor;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/ast/util/InlineVisitor;)V
    .locals 0

    .line 94
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/util/InlineVisitorExt$15;->val$visitor:Lcom/vladsch/flexmark/ast/util/InlineVisitor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public visit(Lcom/vladsch/flexmark/ast/Text;)V
    .locals 1

    .line 97
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/InlineVisitorExt$15;->val$visitor:Lcom/vladsch/flexmark/ast/util/InlineVisitor;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/ast/util/InlineVisitor;->visit(Lcom/vladsch/flexmark/ast/Text;)V

    return-void
.end method

.method public bridge synthetic visit(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 0

    .line 94
    check-cast p1, Lcom/vladsch/flexmark/ast/Text;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ast/util/InlineVisitorExt$15;->visit(Lcom/vladsch/flexmark/ast/Text;)V

    return-void
.end method
