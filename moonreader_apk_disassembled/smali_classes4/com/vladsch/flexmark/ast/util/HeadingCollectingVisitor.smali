.class public Lcom/vladsch/flexmark/ast/util/HeadingCollectingVisitor;
.super Ljava/lang/Object;
.source "HeadingCollectingVisitor.java"


# instance fields
.field private final headings:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/vladsch/flexmark/ast/Heading;",
            ">;"
        }
    .end annotation
.end field

.field private final myVisitor:Lcom/vladsch/flexmark/util/ast/NodeVisitor;


# direct methods
.method public constructor <init>()V
    .locals 5

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/util/HeadingCollectingVisitor;->headings:Ljava/util/ArrayList;

    .line 13
    new-instance v0, Lcom/vladsch/flexmark/util/ast/BlockNodeVisitor;

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/vladsch/flexmark/util/ast/VisitHandler;

    new-instance v2, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/Heading;

    new-instance v4, Lcom/vladsch/flexmark/ast/util/HeadingCollectingVisitor$1;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ast/util/HeadingCollectingVisitor$1;-><init>(Lcom/vladsch/flexmark/ast/util/HeadingCollectingVisitor;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/ast/BlockNodeVisitor;-><init>([Lcom/vladsch/flexmark/util/ast/VisitHandler;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/util/HeadingCollectingVisitor;->myVisitor:Lcom/vladsch/flexmark/util/ast/NodeVisitor;

    return-void
.end method

.method static synthetic access$000(Lcom/vladsch/flexmark/ast/util/HeadingCollectingVisitor;)Ljava/util/ArrayList;
    .locals 0

    .line 8
    iget-object p0, p0, Lcom/vladsch/flexmark/ast/util/HeadingCollectingVisitor;->headings:Ljava/util/ArrayList;

    return-object p0
.end method


# virtual methods
.method public collect(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 1

    .line 22
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/HeadingCollectingVisitor;->myVisitor:Lcom/vladsch/flexmark/util/ast/NodeVisitor;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/ast/NodeVisitor;->visit(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method

.method public collectAndGetHeadings(Lcom/vladsch/flexmark/util/ast/Node;)Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/vladsch/flexmark/ast/Heading;",
            ">;"
        }
    .end annotation

    .line 26
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/HeadingCollectingVisitor;->myVisitor:Lcom/vladsch/flexmark/util/ast/NodeVisitor;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/ast/NodeVisitor;->visit(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 27
    iget-object p1, p0, Lcom/vladsch/flexmark/ast/util/HeadingCollectingVisitor;->headings:Ljava/util/ArrayList;

    return-object p1
.end method

.method public getHeadings()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/vladsch/flexmark/ast/Heading;",
            ">;"
        }
    .end annotation

    .line 31
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/HeadingCollectingVisitor;->headings:Ljava/util/ArrayList;

    return-object v0
.end method
