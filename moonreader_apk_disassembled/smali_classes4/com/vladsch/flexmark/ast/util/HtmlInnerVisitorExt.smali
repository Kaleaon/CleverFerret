.class public Lcom/vladsch/flexmark/ast/util/HtmlInnerVisitorExt;
.super Ljava/lang/Object;
.source "HtmlInnerVisitorExt.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static VISIT_HANDLERS(Lcom/vladsch/flexmark/ast/util/HtmlInnerVisitor;)[Lcom/vladsch/flexmark/util/ast/VisitHandler;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V::",
            "Lcom/vladsch/flexmark/ast/util/HtmlInnerVisitor;",
            ">(TV;)[",
            "Lcom/vladsch/flexmark/util/ast/VisitHandler<",
            "*>;"
        }
    .end annotation

    const/4 v0, 0x2

    .line 10
    new-array v0, v0, [Lcom/vladsch/flexmark/util/ast/VisitHandler;

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ast/HtmlInnerBlock;

    new-instance v3, Lcom/vladsch/flexmark/ast/util/HtmlInnerVisitorExt$1;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ast/util/HtmlInnerVisitorExt$1;-><init>(Lcom/vladsch/flexmark/ast/util/HtmlInnerVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ast/HtmlInnerBlockComment;

    new-instance v3, Lcom/vladsch/flexmark/ast/util/HtmlInnerVisitorExt$2;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ast/util/HtmlInnerVisitorExt$2;-><init>(Lcom/vladsch/flexmark/ast/util/HtmlInnerVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 p0, 0x1

    aput-object v1, v0, p0

    return-object v0
.end method
