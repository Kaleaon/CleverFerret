.class final Lcom/vladsch/flexmark/ext/tables/TableVisitorExt$3;
.super Ljava/lang/Object;
.source "TableVisitorExt.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/ast/Visitor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/ext/tables/TableVisitorExt;->VISIT_HANDLERS(Lcom/vladsch/flexmark/ext/tables/TableVisitor;)[Lcom/vladsch/flexmark/util/ast/VisitHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/ast/Visitor<",
        "Lcom/vladsch/flexmark/ext/tables/TableSeparator;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$visitor:Lcom/vladsch/flexmark/ext/tables/TableVisitor;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/ext/tables/TableVisitor;)V
    .locals 0

    .line 21
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/tables/TableVisitorExt$3;->val$visitor:Lcom/vladsch/flexmark/ext/tables/TableVisitor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public visit(Lcom/vladsch/flexmark/ext/tables/TableSeparator;)V
    .locals 1

    .line 24
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/tables/TableVisitorExt$3;->val$visitor:Lcom/vladsch/flexmark/ext/tables/TableVisitor;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/ext/tables/TableVisitor;->visit(Lcom/vladsch/flexmark/ext/tables/TableSeparator;)V

    return-void
.end method

.method public bridge synthetic visit(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 0

    .line 21
    check-cast p1, Lcom/vladsch/flexmark/ext/tables/TableSeparator;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ext/tables/TableVisitorExt$3;->visit(Lcom/vladsch/flexmark/ext/tables/TableSeparator;)V

    return-void
.end method
