.class public Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;
.super Ljava/lang/Object;
.source "Bracket.java"


# instance fields
.field private allowed:Z

.field private bracketAfter:Z

.field private final image:Z

.field private final index:I

.field private final input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field private final node:Lcom/vladsch/flexmark/ast/Text;

.field private final previous:Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;

.field private final previousDelimiter:Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;


# direct methods
.method private constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/ast/Text;ILcom/vladsch/flexmark/parser/core/delimiter/Bracket;Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;Z)V
    .locals 1

    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 28
    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->allowed:Z

    const/4 v0, 0x0

    .line 34
    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->bracketAfter:Z

    .line 85
    iput-object p2, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->node:Lcom/vladsch/flexmark/ast/Text;

    .line 86
    iput p3, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->index:I

    .line 87
    iput-boolean p6, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->image:Z

    .line 88
    iput-object p4, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->previous:Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;

    .line 89
    iput-object p5, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->previousDelimiter:Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    .line 90
    iput-object p1, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public static image(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/ast/Text;ILcom/vladsch/flexmark/parser/core/delimiter/Bracket;Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;)Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;
    .locals 7

    .line 81
    new-instance v0, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;

    const/4 v6, 0x1

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v6}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/ast/Text;ILcom/vladsch/flexmark/parser/core/delimiter/Bracket;Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;Z)V

    return-object v0
.end method

.method public static link(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/ast/Text;ILcom/vladsch/flexmark/parser/core/delimiter/Bracket;Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;)Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;
    .locals 7

    .line 77
    new-instance v0, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;

    const/4 v6, 0x0

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v6}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/ast/Text;ILcom/vladsch/flexmark/parser/core/delimiter/Bracket;Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;Z)V

    return-object v0
.end method


# virtual methods
.method public getEndIndex()I
    .locals 1

    .line 69
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->image:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->index:I

    add-int/lit8 v0, v0, 0x2

    return v0

    :cond_0
    iget v0, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->index:I

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public getNode()Lcom/vladsch/flexmark/ast/Text;
    .locals 1

    .line 73
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->node:Lcom/vladsch/flexmark/ast/Text;

    return-object v0
.end method

.method public getPrevious()Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;
    .locals 1

    .line 53
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->previous:Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;

    return-object v0
.end method

.method public getPreviousDelimiter()Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;
    .locals 1

    .line 61
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->previousDelimiter:Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    return-object v0
.end method

.method public getStartIndex()I
    .locals 1

    .line 65
    iget v0, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->index:I

    return v0
.end method

.method public isAllowed()Z
    .locals 1

    .line 37
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->allowed:Z

    return v0
.end method

.method public isBracketAfter()Z
    .locals 1

    .line 45
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->bracketAfter:Z

    return v0
.end method

.method public isImage()Z
    .locals 1

    .line 57
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->image:Z

    return v0
.end method

.method public isStraddling(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Z
    .locals 3

    .line 95
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v0

    .line 96
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result p1

    .line 97
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->previousDelimiter:Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getNext()Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    move-result-object v1

    :goto_0
    if-eqz v1, :cond_3

    .line 99
    invoke-virtual {v1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getEndIndex()I

    move-result v2

    if-lt v2, p1, :cond_1

    goto :goto_1

    :cond_1
    if-lt v2, v0, :cond_2

    .line 103
    invoke-virtual {v1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->isMatched()Z

    move-result v2

    if-nez v2, :cond_2

    const/4 p1, 0x1

    return p1

    .line 105
    :cond_2
    invoke-virtual {v1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getNext()Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    move-result-object v1

    goto :goto_0

    :cond_3
    :goto_1
    const/4 p1, 0x0

    return p1
.end method

.method public setAllowed(Z)V
    .locals 0

    .line 41
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->allowed:Z

    return-void
.end method

.method public setBracketAfter(Z)V
    .locals 0

    .line 49
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->bracketAfter:Z

    return-void
.end method
