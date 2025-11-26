.class public Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;
.super Ljava/lang/Object;
.source "LineCollectingVisitor.java"


# instance fields
.field private myEOLs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private myEndOffset:I

.field private myLines:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/sequence/Range;",
            ">;"
        }
    .end annotation
.end field

.field private myStartOffset:I

.field private final myVisitor:Lcom/vladsch/flexmark/util/ast/NodeVisitor;


# direct methods
.method public constructor <init>()V
    .locals 5

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-instance v0, Lcom/vladsch/flexmark/util/ast/NodeVisitor;

    const/4 v1, 0x6

    new-array v1, v1, [Lcom/vladsch/flexmark/util/ast/VisitHandler;

    new-instance v2, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/Text;

    new-instance v4, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor$1;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor$1;-><init>(Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v3, 0x0

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/TextBase;

    new-instance v4, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor$2;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor$2;-><init>(Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v3, 0x1

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/HtmlEntity;

    new-instance v4, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor$3;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor$3;-><init>(Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v3, 0x2

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/HtmlInline;

    new-instance v4, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor$4;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor$4;-><init>(Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v3, 0x3

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/SoftLineBreak;

    new-instance v4, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor$5;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor$5;-><init>(Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v3, 0x4

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/HardLineBreak;

    new-instance v4, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor$6;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor$6;-><init>(Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v3, 0x5

    aput-object v2, v1, v3

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/ast/NodeVisitor;-><init>([Lcom/vladsch/flexmark/util/ast/VisitHandler;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;->myVisitor:Lcom/vladsch/flexmark/util/ast/NodeVisitor;

    .line 62
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;->myLines:Ljava/util/List;

    return-void
.end method

.method static synthetic access$000(Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;Lcom/vladsch/flexmark/ast/Text;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;->visit(Lcom/vladsch/flexmark/ast/Text;)V

    return-void
.end method

.method static synthetic access$100(Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;Lcom/vladsch/flexmark/ast/TextBase;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;->visit(Lcom/vladsch/flexmark/ast/TextBase;)V

    return-void
.end method

.method static synthetic access$200(Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;Lcom/vladsch/flexmark/ast/HtmlEntity;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;->visit(Lcom/vladsch/flexmark/ast/HtmlEntity;)V

    return-void
.end method

.method static synthetic access$300(Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;Lcom/vladsch/flexmark/ast/HtmlInline;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;->visit(Lcom/vladsch/flexmark/ast/HtmlInline;)V

    return-void
.end method

.method static synthetic access$400(Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;Lcom/vladsch/flexmark/ast/SoftLineBreak;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;->visit(Lcom/vladsch/flexmark/ast/SoftLineBreak;)V

    return-void
.end method

.method static synthetic access$500(Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;Lcom/vladsch/flexmark/ast/HardLineBreak;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;->visit(Lcom/vladsch/flexmark/ast/HardLineBreak;)V

    return-void
.end method

.method private finalizeLines()V
    .locals 3

    .line 66
    iget v0, p0, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;->myStartOffset:I

    iget v1, p0, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;->myEndOffset:I

    if-ge v0, v1, :cond_0

    .line 67
    new-instance v0, Lcom/vladsch/flexmark/util/sequence/Range;

    iget v1, p0, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;->myStartOffset:I

    iget v2, p0, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;->myEndOffset:I

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/sequence/Range;-><init>(II)V

    .line 68
    iget-object v1, p0, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;->myLines:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 69
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;->myEOLs:Ljava/util/List;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    iget v0, p0, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;->myEndOffset:I

    iput v0, p0, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;->myStartOffset:I

    :cond_0
    return-void
.end method

.method private visit(Lcom/vladsch/flexmark/ast/HardLineBreak;)V
    .locals 3

    .line 105
    new-instance v0, Lcom/vladsch/flexmark/util/sequence/Range;

    iget v1, p0, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;->myStartOffset:I

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/HardLineBreak;->getEndOffset()I

    move-result v2

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/sequence/Range;-><init>(II)V

    .line 106
    iget-object v1, p0, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;->myLines:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 107
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;->myEOLs:Ljava/util/List;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/HardLineBreak;->getTextLength()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 108
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/HardLineBreak;->getEndOffset()I

    move-result p1

    iput p1, p0, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;->myStartOffset:I

    return-void
.end method

.method private visit(Lcom/vladsch/flexmark/ast/HtmlEntity;)V
    .locals 0

    .line 112
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/HtmlEntity;->getEndOffset()I

    move-result p1

    iput p1, p0, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;->myEndOffset:I

    return-void
.end method

.method private visit(Lcom/vladsch/flexmark/ast/HtmlInline;)V
    .locals 0

    .line 116
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/HtmlInline;->getEndOffset()I

    move-result p1

    iput p1, p0, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;->myEndOffset:I

    return-void
.end method

.method private visit(Lcom/vladsch/flexmark/ast/SoftLineBreak;)V
    .locals 3

    .line 98
    new-instance v0, Lcom/vladsch/flexmark/util/sequence/Range;

    iget v1, p0, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;->myStartOffset:I

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/SoftLineBreak;->getEndOffset()I

    move-result v2

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/sequence/Range;-><init>(II)V

    .line 99
    iget-object v1, p0, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;->myLines:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 100
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;->myEOLs:Ljava/util/List;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/SoftLineBreak;->getTextLength()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 101
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/SoftLineBreak;->getEndOffset()I

    move-result p1

    iput p1, p0, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;->myStartOffset:I

    return-void
.end method

.method private visit(Lcom/vladsch/flexmark/ast/Text;)V
    .locals 0

    .line 120
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Text;->getEndOffset()I

    move-result p1

    iput p1, p0, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;->myEndOffset:I

    return-void
.end method

.method private visit(Lcom/vladsch/flexmark/ast/TextBase;)V
    .locals 0

    .line 124
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/TextBase;->getEndOffset()I

    move-result p1

    iput p1, p0, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;->myEndOffset:I

    return-void
.end method


# virtual methods
.method public collect(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 1

    .line 85
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;->myLines:Ljava/util/List;

    .line 86
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;->myEOLs:Ljava/util/List;

    .line 87
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getStartOffset()I

    move-result v0

    iput v0, p0, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;->myStartOffset:I

    .line 88
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getEndOffset()I

    move-result v0

    iput v0, p0, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;->myEndOffset:I

    .line 89
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;->myVisitor:Lcom/vladsch/flexmark/util/ast/NodeVisitor;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/ast/NodeVisitor;->visit(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method

.method public collectAndGetRanges(Lcom/vladsch/flexmark/util/ast/Node;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ")",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/sequence/Range;",
            ">;"
        }
    .end annotation

    .line 93
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;->collect(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 94
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;->getLines()Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public getEOLs()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 80
    invoke-direct {p0}, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;->finalizeLines()V

    .line 81
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;->myEOLs:Ljava/util/List;

    return-object v0
.end method

.method public getLines()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/sequence/Range;",
            ">;"
        }
    .end annotation

    .line 75
    invoke-direct {p0}, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;->finalizeLines()V

    .line 76
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;->myLines:Ljava/util/List;

    return-object v0
.end method
