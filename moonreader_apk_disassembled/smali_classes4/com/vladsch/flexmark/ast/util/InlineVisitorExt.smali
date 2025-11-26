.class public Lcom/vladsch/flexmark/ast/util/InlineVisitorExt;
.super Ljava/lang/Object;
.source "InlineVisitorExt.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static VISIT_HANDLERS(Lcom/vladsch/flexmark/ast/util/InlineVisitor;)[Lcom/vladsch/flexmark/util/ast/VisitHandler;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V::",
            "Lcom/vladsch/flexmark/ast/util/InlineVisitor;",
            ">(TV;)[",
            "Lcom/vladsch/flexmark/util/ast/VisitHandler<",
            "*>;"
        }
    .end annotation

    const/16 v0, 0xf

    .line 9
    new-array v0, v0, [Lcom/vladsch/flexmark/util/ast/VisitHandler;

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ast/AutoLink;

    new-instance v3, Lcom/vladsch/flexmark/ast/util/InlineVisitorExt$1;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ast/util/InlineVisitorExt$1;-><init>(Lcom/vladsch/flexmark/ast/util/InlineVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ast/Code;

    new-instance v3, Lcom/vladsch/flexmark/ast/util/InlineVisitorExt$2;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ast/util/InlineVisitorExt$2;-><init>(Lcom/vladsch/flexmark/ast/util/InlineVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v2, 0x1

    aput-object v1, v0, v2

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ast/Emphasis;

    new-instance v3, Lcom/vladsch/flexmark/ast/util/InlineVisitorExt$3;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ast/util/InlineVisitorExt$3;-><init>(Lcom/vladsch/flexmark/ast/util/InlineVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v2, 0x2

    aput-object v1, v0, v2

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ast/HardLineBreak;

    new-instance v3, Lcom/vladsch/flexmark/ast/util/InlineVisitorExt$4;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ast/util/InlineVisitorExt$4;-><init>(Lcom/vladsch/flexmark/ast/util/InlineVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v2, 0x3

    aput-object v1, v0, v2

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ast/HtmlEntity;

    new-instance v3, Lcom/vladsch/flexmark/ast/util/InlineVisitorExt$5;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ast/util/InlineVisitorExt$5;-><init>(Lcom/vladsch/flexmark/ast/util/InlineVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v2, 0x4

    aput-object v1, v0, v2

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ast/HtmlInline;

    new-instance v3, Lcom/vladsch/flexmark/ast/util/InlineVisitorExt$6;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ast/util/InlineVisitorExt$6;-><init>(Lcom/vladsch/flexmark/ast/util/InlineVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v2, 0x5

    aput-object v1, v0, v2

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ast/HtmlInlineComment;

    new-instance v3, Lcom/vladsch/flexmark/ast/util/InlineVisitorExt$7;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ast/util/InlineVisitorExt$7;-><init>(Lcom/vladsch/flexmark/ast/util/InlineVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v2, 0x6

    aput-object v1, v0, v2

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ast/Image;

    new-instance v3, Lcom/vladsch/flexmark/ast/util/InlineVisitorExt$8;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ast/util/InlineVisitorExt$8;-><init>(Lcom/vladsch/flexmark/ast/util/InlineVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v2, 0x7

    aput-object v1, v0, v2

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ast/ImageRef;

    new-instance v3, Lcom/vladsch/flexmark/ast/util/InlineVisitorExt$9;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ast/util/InlineVisitorExt$9;-><init>(Lcom/vladsch/flexmark/ast/util/InlineVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/16 v2, 0x8

    aput-object v1, v0, v2

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ast/Link;

    new-instance v3, Lcom/vladsch/flexmark/ast/util/InlineVisitorExt$10;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ast/util/InlineVisitorExt$10;-><init>(Lcom/vladsch/flexmark/ast/util/InlineVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/16 v2, 0x9

    aput-object v1, v0, v2

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ast/LinkRef;

    new-instance v3, Lcom/vladsch/flexmark/ast/util/InlineVisitorExt$11;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ast/util/InlineVisitorExt$11;-><init>(Lcom/vladsch/flexmark/ast/util/InlineVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/16 v2, 0xa

    aput-object v1, v0, v2

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ast/MailLink;

    new-instance v3, Lcom/vladsch/flexmark/ast/util/InlineVisitorExt$12;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ast/util/InlineVisitorExt$12;-><init>(Lcom/vladsch/flexmark/ast/util/InlineVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/16 v2, 0xb

    aput-object v1, v0, v2

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ast/SoftLineBreak;

    new-instance v3, Lcom/vladsch/flexmark/ast/util/InlineVisitorExt$13;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ast/util/InlineVisitorExt$13;-><init>(Lcom/vladsch/flexmark/ast/util/InlineVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/16 v2, 0xc

    aput-object v1, v0, v2

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ast/StrongEmphasis;

    new-instance v3, Lcom/vladsch/flexmark/ast/util/InlineVisitorExt$14;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ast/util/InlineVisitorExt$14;-><init>(Lcom/vladsch/flexmark/ast/util/InlineVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/16 v2, 0xd

    aput-object v1, v0, v2

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ast/Text;

    new-instance v3, Lcom/vladsch/flexmark/ast/util/InlineVisitorExt$15;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ast/util/InlineVisitorExt$15;-><init>(Lcom/vladsch/flexmark/ast/util/InlineVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/16 p0, 0xe

    aput-object v1, v0, p0

    return-object v0
.end method
