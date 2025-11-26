.class public Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;
.super Ljava/lang/Object;
.source "TableExtractingVisitor.java"


# instance fields
.field private myTable:Lcom/vladsch/flexmark/util/format/MarkdownTable;

.field private final myTables:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/format/MarkdownTable;",
            ">;"
        }
    .end annotation
.end field

.field private myVisitor:Lcom/vladsch/flexmark/util/ast/NodeVisitor;

.field private final options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 5

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    new-instance v0, Lcom/vladsch/flexmark/util/ast/NodeVisitor;

    const/4 v1, 0x7

    new-array v1, v1, [Lcom/vladsch/flexmark/util/ast/VisitHandler;

    new-instance v2, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v3, Lcom/vladsch/flexmark/ext/tables/TableBlock;

    new-instance v4, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor$1;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor$1;-><init>(Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v3, 0x0

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v3, Lcom/vladsch/flexmark/ext/tables/TableHead;

    new-instance v4, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor$2;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor$2;-><init>(Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v3, 0x1

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v3, Lcom/vladsch/flexmark/ext/tables/TableSeparator;

    new-instance v4, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor$3;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor$3;-><init>(Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v3, 0x2

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v3, Lcom/vladsch/flexmark/ext/tables/TableBody;

    new-instance v4, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor$4;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor$4;-><init>(Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v3, 0x3

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v3, Lcom/vladsch/flexmark/ext/tables/TableRow;

    new-instance v4, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor$5;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor$5;-><init>(Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v3, 0x4

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v3, Lcom/vladsch/flexmark/ext/tables/TableCell;

    new-instance v4, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor$6;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor$6;-><init>(Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v3, 0x5

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v3, Lcom/vladsch/flexmark/ext/tables/TableCaption;

    new-instance v4, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor$7;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor$7;-><init>(Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v3, 0x6

    aput-object v2, v1, v3

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/ast/NodeVisitor;-><init>([Lcom/vladsch/flexmark/util/ast/VisitHandler;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;->myVisitor:Lcom/vladsch/flexmark/util/ast/NodeVisitor;

    .line 68
    new-instance v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/util/format/TableFormatOptions;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    .line 69
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;->myTables:Ljava/util/List;

    return-void
.end method

.method static synthetic access$000(Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;Lcom/vladsch/flexmark/ext/tables/TableBlock;)V
    .locals 0

    .line 16
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;->visit(Lcom/vladsch/flexmark/ext/tables/TableBlock;)V

    return-void
.end method

.method static synthetic access$100(Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;Lcom/vladsch/flexmark/ext/tables/TableHead;)V
    .locals 0

    .line 16
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;->visit(Lcom/vladsch/flexmark/ext/tables/TableHead;)V

    return-void
.end method

.method static synthetic access$200(Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;Lcom/vladsch/flexmark/ext/tables/TableSeparator;)V
    .locals 0

    .line 16
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;->visit(Lcom/vladsch/flexmark/ext/tables/TableSeparator;)V

    return-void
.end method

.method static synthetic access$300(Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;Lcom/vladsch/flexmark/ext/tables/TableBody;)V
    .locals 0

    .line 16
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;->visit(Lcom/vladsch/flexmark/ext/tables/TableBody;)V

    return-void
.end method

.method static synthetic access$400(Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;Lcom/vladsch/flexmark/ext/tables/TableRow;)V
    .locals 0

    .line 16
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;->visit(Lcom/vladsch/flexmark/ext/tables/TableRow;)V

    return-void
.end method

.method static synthetic access$500(Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;Lcom/vladsch/flexmark/ext/tables/TableCell;)V
    .locals 0

    .line 16
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;->visit(Lcom/vladsch/flexmark/ext/tables/TableCell;)V

    return-void
.end method

.method static synthetic access$600(Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;Lcom/vladsch/flexmark/ext/tables/TableCaption;)V
    .locals 0

    .line 16
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;->visit(Lcom/vladsch/flexmark/ext/tables/TableCaption;)V

    return-void
.end method

.method private visit(Lcom/vladsch/flexmark/ext/tables/TableBlock;)V
    .locals 2

    .line 79
    new-instance v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;

    iget-object v1, p0, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/format/MarkdownTable;-><init>(Lcom/vladsch/flexmark/util/format/TableFormatOptions;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;->myTable:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    .line 80
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;->myVisitor:Lcom/vladsch/flexmark/util/ast/NodeVisitor;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/ast/NodeVisitor;->visitChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 81
    iget-object p1, p0, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;->myTables:Ljava/util/List;

    iget-object v0, p0, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;->myTable:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const/4 p1, 0x0

    .line 83
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;->myTable:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    return-void
.end method

.method private visit(Lcom/vladsch/flexmark/ext/tables/TableBody;)V
    .locals 2

    .line 98
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;->myTable:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->setSeparator(Z)V

    .line 99
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;->myTable:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->setHeader(Z)V

    .line 100
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;->myVisitor:Lcom/vladsch/flexmark/util/ast/NodeVisitor;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/ast/NodeVisitor;->visitChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method

.method private visit(Lcom/vladsch/flexmark/ext/tables/TableCaption;)V
    .locals 3

    .line 109
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;->myTable:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableCaption;->getOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableCaption;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableCaption;->getClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {v0, v1, v2, p1}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->setCaptionWithMarkers(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    return-void
.end method

.method private visit(Lcom/vladsch/flexmark/ext/tables/TableCell;)V
    .locals 8

    .line 113
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableCell;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    .line 114
    iget-object v1, p0, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget-boolean v1, v1, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->trimCellWhitespace:Z

    if-eqz v1, :cond_1

    .line 115
    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isBlank()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 116
    invoke-interface {v0, v1, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    goto :goto_0

    .line 118
    :cond_0
    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trim()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    :cond_1
    :goto_0
    move-object v3, v0

    .line 121
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;->myTable:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    new-instance v1, Lcom/vladsch/flexmark/util/format/TableCell;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableCell;->getOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableCell;->getClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v4

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableCell;->getSpan()I

    move-result v6

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableCell;->getAlignment()Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;

    move-result-object v5

    if-nez v5, :cond_2

    sget-object p1, Lcom/vladsch/flexmark/util/html/CellAlignment;->NONE:Lcom/vladsch/flexmark/util/html/CellAlignment;

    goto :goto_1

    :cond_2
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableCell;->getAlignment()Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;

    move-result-object p1

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;->cellAlignment()Lcom/vladsch/flexmark/util/html/CellAlignment;

    move-result-object p1

    :goto_1
    move-object v7, p1

    const/4 v5, 0x1

    invoke-direct/range {v1 .. v7}, Lcom/vladsch/flexmark/util/format/TableCell;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;IILcom/vladsch/flexmark/util/html/CellAlignment;)V

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->addCell(Lcom/vladsch/flexmark/util/format/TableCell;)V

    return-void
.end method

.method private visit(Lcom/vladsch/flexmark/ext/tables/TableHead;)V
    .locals 2

    .line 87
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;->myTable:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->setSeparator(Z)V

    .line 88
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;->myTable:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->setHeader(Z)V

    .line 89
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;->myVisitor:Lcom/vladsch/flexmark/util/ast/NodeVisitor;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/ast/NodeVisitor;->visitChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method

.method private visit(Lcom/vladsch/flexmark/ext/tables/TableRow;)V
    .locals 1

    .line 104
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;->myVisitor:Lcom/vladsch/flexmark/util/ast/NodeVisitor;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/ast/NodeVisitor;->visitChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 105
    iget-object p1, p0, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;->myTable:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->isSeparator()Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;->myTable:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->nextRow()V

    :cond_0
    return-void
.end method

.method private visit(Lcom/vladsch/flexmark/ext/tables/TableSeparator;)V
    .locals 2

    .line 93
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;->myTable:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->setSeparator(Z)V

    .line 94
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;->myVisitor:Lcom/vladsch/flexmark/util/ast/NodeVisitor;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/ast/NodeVisitor;->visitChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method


# virtual methods
.method public getTables(Lcom/vladsch/flexmark/util/ast/Node;)[Lcom/vladsch/flexmark/util/format/MarkdownTable;
    .locals 1

    const/4 v0, 0x0

    .line 73
    iput-object v0, p0, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;->myTable:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    .line 74
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;->myVisitor:Lcom/vladsch/flexmark/util/ast/NodeVisitor;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/ast/NodeVisitor;->visit(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 75
    iget-object p1, p0, Lcom/vladsch/flexmark/ext/tables/TableExtractingVisitor;->myTables:Ljava/util/List;

    const/4 v0, 0x0

    new-array v0, v0, [Lcom/vladsch/flexmark/util/format/MarkdownTable;

    invoke-interface {p1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lcom/vladsch/flexmark/util/format/MarkdownTable;

    return-object p1
.end method
