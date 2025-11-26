.class Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor$1;
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
        "Lcom/vladsch/flexmark/ext/tables/TableBlock;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;)V
    .locals 0

    .line 20
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor$1;->this$0:Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public visit(Lcom/vladsch/flexmark/ext/tables/TableBlock;)V
    .locals 1

    .line 23
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor$1;->this$0:Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;

    invoke-static {v0, p1}, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;->access$000(Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;Lcom/vladsch/flexmark/ext/tables/TableBlock;)V

    return-void
.end method

.method public bridge synthetic visit(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 0

    .line 20
    check-cast p1, Lcom/vladsch/flexmark/ext/tables/TableBlock;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor$1;->visit(Lcom/vladsch/flexmark/ext/tables/TableBlock;)V

    return-void
.end method
