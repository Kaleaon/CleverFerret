.class public Lcom/vladsch/flexmark/ext/attributes/AttributesVisitorExt;
.super Ljava/lang/Object;
.source "AttributesVisitorExt.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static VISIT_HANDLERS(Lcom/vladsch/flexmark/ext/attributes/AttributesVisitor;)[Lcom/vladsch/flexmark/util/ast/VisitHandler;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V::",
            "Lcom/vladsch/flexmark/ext/attributes/AttributesVisitor;",
            ">(TV;)[",
            "Lcom/vladsch/flexmark/util/ast/VisitHandler<",
            "*>;"
        }
    .end annotation

    const/4 v0, 0x2

    .line 8
    new-array v0, v0, [Lcom/vladsch/flexmark/util/ast/VisitHandler;

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;

    new-instance v3, Lcom/vladsch/flexmark/ext/attributes/AttributesVisitorExt$1;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ext/attributes/AttributesVisitorExt$1;-><init>(Lcom/vladsch/flexmark/ext/attributes/AttributesVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;

    new-instance v3, Lcom/vladsch/flexmark/ext/attributes/AttributesVisitorExt$2;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ext/attributes/AttributesVisitorExt$2;-><init>(Lcom/vladsch/flexmark/ext/attributes/AttributesVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 p0, 0x1

    aput-object v1, v0, p0

    return-object v0
.end method
