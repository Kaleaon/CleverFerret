.class public Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;
.super Ljava/lang/Object;
.source "TextCollectingVisitor.java"


# instance fields
.field private final myLineBreakNodes:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/Class;",
            ">;"
        }
    .end annotation
.end field

.field private final myVisitor:Lcom/vladsch/flexmark/util/ast/NodeVisitor;

.field private out:Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;


# direct methods
.method public varargs constructor <init>([Ljava/lang/Class;)V
    .locals 4

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    array-length v0, p1

    if-nez v0, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/util/HashSet;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    move-object p1, v0

    :goto_0
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;->myLineBreakNodes:Ljava/util/HashSet;

    .line 37
    new-instance p1, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor$7;

    const/4 v0, 0x6

    new-array v0, v0, [Lcom/vladsch/flexmark/util/ast/VisitHandler;

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ast/Text;

    new-instance v3, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor$1;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor$1;-><init>(Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ast/TextBase;

    new-instance v3, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor$2;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor$2;-><init>(Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v2, 0x1

    aput-object v1, v0, v2

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ast/HtmlEntity;

    new-instance v3, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor$3;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor$3;-><init>(Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v2, 0x2

    aput-object v1, v0, v2

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ast/SoftLineBreak;

    new-instance v3, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor$4;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor$4;-><init>(Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v2, 0x3

    aput-object v1, v0, v2

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ast/Paragraph;

    new-instance v3, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor$5;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor$5;-><init>(Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v2, 0x4

    aput-object v1, v0, v2

    new-instance v1, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    const-class v2, Lcom/vladsch/flexmark/ast/HardLineBreak;

    new-instance v3, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor$6;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor$6;-><init>(Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/ast/VisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/Visitor;)V

    const/4 v2, 0x5

    aput-object v1, v0, v2

    invoke-direct {p1, p0, v0}, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor$7;-><init>(Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;[Lcom/vladsch/flexmark/util/ast/VisitHandler;)V

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;->myVisitor:Lcom/vladsch/flexmark/util/ast/NodeVisitor;

    return-void
.end method

.method static synthetic access$000(Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;Lcom/vladsch/flexmark/ast/Text;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;->visit(Lcom/vladsch/flexmark/ast/Text;)V

    return-void
.end method

.method static synthetic access$100(Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;Lcom/vladsch/flexmark/ast/TextBase;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;->visit(Lcom/vladsch/flexmark/ast/TextBase;)V

    return-void
.end method

.method static synthetic access$200(Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;Lcom/vladsch/flexmark/ast/HtmlEntity;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;->visit(Lcom/vladsch/flexmark/ast/HtmlEntity;)V

    return-void
.end method

.method static synthetic access$300(Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;Lcom/vladsch/flexmark/ast/SoftLineBreak;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;->visit(Lcom/vladsch/flexmark/ast/SoftLineBreak;)V

    return-void
.end method

.method static synthetic access$400(Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;Lcom/vladsch/flexmark/ast/Paragraph;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;->visit(Lcom/vladsch/flexmark/ast/Paragraph;)V

    return-void
.end method

.method static synthetic access$500(Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;Lcom/vladsch/flexmark/ast/HardLineBreak;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;->visit(Lcom/vladsch/flexmark/ast/HardLineBreak;)V

    return-void
.end method

.method static synthetic access$600(Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;)Ljava/util/HashSet;
    .locals 0

    .line 12
    iget-object p0, p0, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;->myLineBreakNodes:Ljava/util/HashSet;

    return-object p0
.end method

.method static synthetic access$700(Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;)Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;
    .locals 0

    .line 12
    iget-object p0, p0, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;->out:Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;

    return-object p0
.end method

.method protected static varargs concatArrays([[Ljava/lang/Class;)[Ljava/lang/Class;
    .locals 7

    .line 19
    array-length v0, p0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    aget-object v4, p0, v2

    .line 20
    array-length v4, v4

    add-int/2addr v3, v4

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 23
    :cond_0
    new-array v0, v3, [Ljava/lang/Class;

    .line 26
    array-length v2, p0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_1
    if-ge v3, v2, :cond_1

    aget-object v5, p0, v3

    .line 27
    array-length v6, v5

    invoke-static {v5, v1, v0, v4, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 28
    array-length v5, v5

    add-int/2addr v4, v5

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_1
    return-object v0
.end method

.method private visit(Lcom/vladsch/flexmark/ast/HardLineBreak;)V
    .locals 3

    .line 128
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/HardLineBreak;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    .line 129
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;->out:Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v2

    invoke-interface {p1, v1, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;->append(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;

    return-void
.end method

.method private visit(Lcom/vladsch/flexmark/ast/HtmlEntity;)V
    .locals 1

    .line 133
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;->out:Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/HtmlEntity;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->unescape()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;->append(Ljava/lang/String;)Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;

    return-void
.end method

.method private visit(Lcom/vladsch/flexmark/ast/Paragraph;)V
    .locals 3

    const/4 v0, 0x1

    .line 115
    new-array v0, v0, [Ljava/lang/Class;

    const-class v1, Lcom/vladsch/flexmark/util/ast/DoNotCollectText;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/ast/Paragraph;->isOrDescendantOfType([Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 116
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;->out:Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 117
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;->out:Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;

    const-string v1, "\n\n"

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;->append(Ljava/lang/String;)Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;

    .line 119
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;->myVisitor:Lcom/vladsch/flexmark/util/ast/NodeVisitor;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/ast/NodeVisitor;->visitChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    :cond_1
    return-void
.end method

.method private visit(Lcom/vladsch/flexmark/ast/SoftLineBreak;)V
    .locals 1

    .line 124
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;->out:Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/SoftLineBreak;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;->append(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;

    return-void
.end method

.method private visit(Lcom/vladsch/flexmark/ast/Text;)V
    .locals 3

    const/4 v0, 0x1

    .line 137
    new-array v0, v0, [Ljava/lang/Class;

    const-class v1, Lcom/vladsch/flexmark/util/ast/DoNotCollectText;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/ast/Text;->isOrDescendantOfType([Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 138
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;->out:Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Text;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;->append(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;

    :cond_0
    return-void
.end method

.method private visit(Lcom/vladsch/flexmark/ast/TextBase;)V
    .locals 1

    .line 143
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;->out:Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/TextBase;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;->append(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;

    return-void
.end method


# virtual methods
.method public collect(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 2

    .line 95
    new-instance v0, Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;->out:Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;

    .line 96
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;->myVisitor:Lcom/vladsch/flexmark/util/ast/NodeVisitor;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/ast/NodeVisitor;->visit(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method

.method public collectAndGetSegments(Lcom/vladsch/flexmark/util/ast/Node;)[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 0

    .line 105
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;->collect(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 106
    iget-object p1, p0, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;->out:Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;->toSegments()[Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public collectAndGetSequence(Lcom/vladsch/flexmark/util/ast/Node;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 0

    .line 110
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;->collect(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 111
    iget-object p1, p0, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;->out:Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;->toBasedSequence()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public collectAndGetText(Lcom/vladsch/flexmark/util/ast/Node;)Ljava/lang/String;
    .locals 0

    .line 100
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;->collect(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 101
    iget-object p1, p0, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;->out:Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getText()Ljava/lang/String;
    .locals 1

    .line 91
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;->out:Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
