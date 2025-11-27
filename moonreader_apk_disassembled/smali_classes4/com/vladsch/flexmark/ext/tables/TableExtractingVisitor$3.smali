.class Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor$3;
.super Ljava/lang/Object;
.source "TableExtractingVisitor.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/ast/Visitor;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
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
.field final synthetic this$0:Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;)V
    .locals 0

    .line 32
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor$3;->this$0:Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public visit(Lcom/vladsch/flexmark/ext/tables/TableSeparator;)V
    .locals 1

    .line 35
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor$3;->this$0:Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;

    invoke-static {v0, p1}, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;->access$200(Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;Lcom/vladsch/flexmark/ext/tables/TableSeparator;)V

    return-void
.end method

.method public bridge synthetic visit(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 0

    .line 32
    check-cast p1, Lcom/vladsch/flexmark/ext/tables/TableSeparator;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor$3;->visit(Lcom/vladsch/flexmark/ext/tables/TableSeparator;)V

    return-void
.end method
