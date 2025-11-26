.class public Lcom/vladsch/flexmark/ast/util/BlockVisitorExt;
.super Ljava/lang/Object;
.source "BlockVisitorExt.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static VISIT_HANDLERS(Lcom/vladsch/flexmark/ast/util/BlockVisitor;)[Lcom/vladsch/flexmark/util/ast/VisitHandler;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V::",
            "Lcom/vladsch/flexmark/ast/util/BlockVisitor;",
            ">(TV;)[",
            "Lcom/vladsch/flexmark/util/ast/VisitHandler<",
            "*>;"
        }
    .end annotation

    const/16 v0, 0xe

    .line 10
    new-array v0, v0, [Lcom/vladsch/flexmark/util/ast/VisitHandler;

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ast/BlockQuote;

    new-instance v3, Lcom/vladsch/flexmark/ast/util/BlockVisitorExt$1;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ast/util/BlockVisitorExt$1;-><init>(Lcom/vladsch/flexmark/ast/util/BlockVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ast/BulletList;

    new-instance v3, Lcom/vladsch/flexmark/ast/util/BlockVisitorExt$2;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ast/util/BlockVisitorExt$2;-><init>(Lcom/vladsch/flexmark/ast/util/BlockVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v2, 0x1

    aput-object v1, v0, v2

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/util/ast/Document;

    new-instance v3, Lcom/vladsch/flexmark/ast/util/BlockVisitorExt$3;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ast/util/BlockVisitorExt$3;-><init>(Lcom/vladsch/flexmark/ast/util/BlockVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v2, 0x2

    aput-object v1, v0, v2

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ast/FencedCodeBlock;

    new-instance v3, Lcom/vladsch/flexmark/ast/util/BlockVisitorExt$4;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ast/util/BlockVisitorExt$4;-><init>(Lcom/vladsch/flexmark/ast/util/BlockVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v2, 0x3

    aput-object v1, v0, v2

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ast/Heading;

    new-instance v3, Lcom/vladsch/flexmark/ast/util/BlockVisitorExt$5;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ast/util/BlockVisitorExt$5;-><init>(Lcom/vladsch/flexmark/ast/util/BlockVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v2, 0x4

    aput-object v1, v0, v2

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ast/HtmlBlock;

    new-instance v3, Lcom/vladsch/flexmark/ast/util/BlockVisitorExt$6;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ast/util/BlockVisitorExt$6;-><init>(Lcom/vladsch/flexmark/ast/util/BlockVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v2, 0x5

    aput-object v1, v0, v2

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ast/HtmlCommentBlock;

    new-instance v3, Lcom/vladsch/flexmark/ast/util/BlockVisitorExt$7;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ast/util/BlockVisitorExt$7;-><init>(Lcom/vladsch/flexmark/ast/util/BlockVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v2, 0x6

    aput-object v1, v0, v2

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ast/IndentedCodeBlock;

    new-instance v3, Lcom/vladsch/flexmark/ast/util/BlockVisitorExt$8;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ast/util/BlockVisitorExt$8;-><init>(Lcom/vladsch/flexmark/ast/util/BlockVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v2, 0x7

    aput-object v1, v0, v2

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ast/BulletListItem;

    new-instance v3, Lcom/vladsch/flexmark/ast/util/BlockVisitorExt$9;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ast/util/BlockVisitorExt$9;-><init>(Lcom/vladsch/flexmark/ast/util/BlockVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/16 v2, 0x8

    aput-object v1, v0, v2

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ast/OrderedListItem;

    new-instance v3, Lcom/vladsch/flexmark/ast/util/BlockVisitorExt$10;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ast/util/BlockVisitorExt$10;-><init>(Lcom/vladsch/flexmark/ast/util/BlockVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/16 v2, 0x9

    aput-object v1, v0, v2

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ast/OrderedList;

    new-instance v3, Lcom/vladsch/flexmark/ast/util/BlockVisitorExt$11;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ast/util/BlockVisitorExt$11;-><init>(Lcom/vladsch/flexmark/ast/util/BlockVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/16 v2, 0xa

    aput-object v1, v0, v2

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ast/Paragraph;

    new-instance v3, Lcom/vladsch/flexmark/ast/util/BlockVisitorExt$12;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ast/util/BlockVisitorExt$12;-><init>(Lcom/vladsch/flexmark/ast/util/BlockVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/16 v2, 0xb

    aput-object v1, v0, v2

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ast/Reference;

    new-instance v3, Lcom/vladsch/flexmark/ast/util/BlockVisitorExt$13;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ast/util/BlockVisitorExt$13;-><init>(Lcom/vladsch/flexmark/ast/util/BlockVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/16 v2, 0xc

    aput-object v1, v0, v2

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ast/ThematicBreak;

    new-instance v3, Lcom/vladsch/flexmark/ast/util/BlockVisitorExt$14;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ast/util/BlockVisitorExt$14;-><init>(Lcom/vladsch/flexmark/ast/util/BlockVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/16 p0, 0xd

    aput-object v1, v0, p0

    return-object v0
.end method
