.class final Lcom/vladsch/flexmark/superscript/SuperscriptVisitorExt$1;
.super Ljava/lang/Object;
.source "SuperscriptVisitorExt.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/ast/Visitor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/superscript/SuperscriptVisitorExt;->VISIT_HANDLERS(Lcom/vladsch/flexmark/superscript/SuperscriptVisitor;)[Lcom/vladsch/flexmark/util/ast/VisitHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/ast/Visitor<",
        "Lcom/vladsch/flexmark/superscript/Superscript;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$visitor:Lcom/vladsch/flexmark/superscript/SuperscriptVisitor;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/superscript/SuperscriptVisitor;)V
    .locals 0

    .line 10
    iput-object p1, p0, Lcom/vladsch/flexmark/superscript/SuperscriptVisitorExt$1;->val$visitor:Lcom/vladsch/flexmark/superscript/SuperscriptVisitor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public visit(Lcom/vladsch/flexmark/superscript/Superscript;)V
    .locals 1

    .line 10
    iget-object v0, p0, Lcom/vladsch/flexmark/superscript/SuperscriptVisitorExt$1;->val$visitor:Lcom/vladsch/flexmark/superscript/SuperscriptVisitor;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/superscript/SuperscriptVisitor;->visit(Lcom/vladsch/flexmark/superscript/Superscript;)V

    return-void
.end method

.method public bridge synthetic visit(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 0

    .line 10
    check-cast p1, Lcom/vladsch/flexmark/superscript/Superscript;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/superscript/SuperscriptVisitorExt$1;->visit(Lcom/vladsch/flexmark/superscript/Superscript;)V

    return-void
.end method
