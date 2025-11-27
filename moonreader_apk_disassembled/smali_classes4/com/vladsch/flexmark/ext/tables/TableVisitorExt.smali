.class public Lcom/vladsch/flexmark/ext/tables/TableVisitorExt;
.super Ljava/lang/Object;
.source "TableVisitorExt.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static VISIT_HANDLERS(Lcom/vladsch/flexmark/ext/tables/TableVisitor;)[Lcom/vladsch/flexmark/util/ast/VisitHandler;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V::",
            "Lcom/vladsch/flexmark/ext/tables/TableVisitor;",
            ">(TV;)[",
            "Lcom/vladsch/flexmark/util/ast/VisitHandler<",
            "*>;"
        }
    .end annotation

    const/4 v0, 0x7

    .line 8
    new-array v0, v0, [Lcom/vladsch/flexmark/util/ast/VisitHandler;

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ext/tables/TableBlock;

    new-instance v3, Lcom/vladsch/flexmark/ext/tables/TableVisitorExt$1;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ext/tables/TableVisitorExt$1;-><init>(Lcom/vladsch/flexmark/ext/tables/TableVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ext/tables/TableHead;

    new-instance v3, Lcom/vladsch/flexmark/ext/tables/TableVisitorExt$2;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ext/tables/TableVisitorExt$2;-><init>(Lcom/vladsch/flexmark/ext/tables/TableVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v2, 0x1

    aput-object v1, v0, v2

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ext/tables/TableSeparator;

    new-instance v3, Lcom/vladsch/flexmark/ext/tables/TableVisitorExt$3;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ext/tables/TableVisitorExt$3;-><init>(Lcom/vladsch/flexmark/ext/tables/TableVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v2, 0x2

    aput-object v1, v0, v2

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ext/tables/TableBody;

    new-instance v3, Lcom/vladsch/flexmark/ext/tables/TableVisitorExt$4;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ext/tables/TableVisitorExt$4;-><init>(Lcom/vladsch/flexmark/ext/tables/TableVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v2, 0x3

    aput-object v1, v0, v2

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ext/tables/TableRow;

    new-instance v3, Lcom/vladsch/flexmark/ext/tables/TableVisitorExt$5;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ext/tables/TableVisitorExt$5;-><init>(Lcom/vladsch/flexmark/ext/tables/TableVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v2, 0x4

    aput-object v1, v0, v2

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ext/tables/TableCell;

    new-instance v3, Lcom/vladsch/flexmark/ext/tables/TableVisitorExt$6;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ext/tables/TableVisitorExt$6;-><init>(Lcom/vladsch/flexmark/ext/tables/TableVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v2, 0x5

    aput-object v1, v0, v2

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ext/tables/TableCaption;

    new-instance v3, Lcom/vladsch/flexmark/ext/tables/TableVisitorExt$7;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ext/tables/TableVisitorExt$7;-><init>(Lcom/vladsch/flexmark/ext/tables/TableVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 p0, 0x6

    aput-object v1, v0, p0

    return-object v0
.end method
