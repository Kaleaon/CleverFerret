.class public Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;
.super Ljava/lang/Object;
.source "Delimiter.java"

# interfaces
.implements Lcom/vladsch/flexmark/parser/delimiter/DelimiterRun;


# instance fields
.field private final canClose:Z

.field private final canOpen:Z

.field private final delimiterChar:C

.field private index:I

.field private final input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field private matched:Z

.field private next:Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

.field private final node:Lcom/vladsch/flexmark/ast/Text;

.field private numDelims:I

.field private previous:Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/ast/Text;CZZLcom/vladsch/flexmark/parser/core/delimiter/Delimiter;I)V
    .locals 1

    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 28
    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->matched:Z

    const/4 v0, 0x1

    .line 33
    iput v0, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->numDelims:I

    .line 108
    iput-object p1, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 109
    iput-object p2, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->node:Lcom/vladsch/flexmark/ast/Text;

    .line 110
    iput-char p3, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->delimiterChar:C

    .line 111
    iput-boolean p4, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->canOpen:Z

    .line 112
    iput-boolean p5, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->canClose:Z

    .line 113
    iput-object p6, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->previous:Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    .line 114
    iput p7, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->index:I

    return-void
.end method


# virtual methods
.method public canClose()Z
    .locals 1

    .line 164
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->canClose:Z

    return v0
.end method

.method public canOpen()Z
    .locals 1

    .line 159
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->canOpen:Z

    return v0
.end method

.method public convertDelimitersToText(ILcom/vladsch/flexmark/parser/core/delimiter/Delimiter;)V
    .locals 2

    .line 148
    new-instance v0, Lcom/vladsch/flexmark/ast/Text;

    invoke-direct {v0}, Lcom/vladsch/flexmark/ast/Text;-><init>()V

    .line 149
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getTailChars(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/ast/Text;->setChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 150
    new-instance v1, Lcom/vladsch/flexmark/ast/Text;

    invoke-direct {v1}, Lcom/vladsch/flexmark/ast/Text;-><init>()V

    .line 151
    invoke-virtual {p2, p1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getLeadChars(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {v1, p1}, Lcom/vladsch/flexmark/ast/Text;->setChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 153
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getNode()Lcom/vladsch/flexmark/ast/Text;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/ast/Text;->insertAfter(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 154
    invoke-virtual {p2}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getNode()Lcom/vladsch/flexmark/ast/Text;

    move-result-object p1

    invoke-virtual {p1, v1}, Lcom/vladsch/flexmark/ast/Text;->insertBefore(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method

.method public getDelimiterChar()C
    .locals 1

    .line 63
    iget-char v0, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->delimiterChar:C

    return v0
.end method

.method public getEndIndex()I
    .locals 2

    .line 88
    iget v0, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->index:I

    iget v1, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->numDelims:I

    add-int/2addr v0, v1

    return v0
.end method

.method public getIndex()I
    .locals 1

    .line 92
    iget v0, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->index:I

    return v0
.end method

.method public getInput()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 80
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getLeadChars(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 3

    .line 104
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getStartIndex()I

    move-result v1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getStartIndex()I

    move-result v2

    add-int/2addr v2, p1

    invoke-interface {v0, v1, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public getNext()Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;
    .locals 1

    .line 42
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->next:Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    return-object v0
.end method

.method public bridge synthetic getNext()Lcom/vladsch/flexmark/parser/delimiter/DelimiterRun;
    .locals 1

    .line 9
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getNext()Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    move-result-object v0

    return-object v0
.end method

.method public getNextNonDelimiterTextNode()Lcom/vladsch/flexmark/ast/Text;
    .locals 2

    .line 127
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->node:Lcom/vladsch/flexmark/ast/Text;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/ast/Text;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    .line 128
    instance-of v1, v0, Lcom/vladsch/flexmark/ast/Text;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->next:Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    if-eqz v1, :cond_0

    iget-object v1, v1, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->node:Lcom/vladsch/flexmark/ast/Text;

    if-eq v1, v0, :cond_1

    .line 129
    :cond_0
    check-cast v0, Lcom/vladsch/flexmark/ast/Text;

    return-object v0

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public getNode()Lcom/vladsch/flexmark/ast/Text;
    .locals 1

    .line 76
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->node:Lcom/vladsch/flexmark/ast/Text;

    return-object v0
.end method

.method public getNumDelims()I
    .locals 1

    .line 71
    iget v0, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->numDelims:I

    return v0
.end method

.method public getPrevious()Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;
    .locals 1

    .line 37
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->previous:Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    return-object v0
.end method

.method public bridge synthetic getPrevious()Lcom/vladsch/flexmark/parser/delimiter/DelimiterRun;
    .locals 1

    .line 9
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getPrevious()Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    move-result-object v0

    return-object v0
.end method

.method public getPreviousNonDelimiterTextNode()Lcom/vladsch/flexmark/ast/Text;
    .locals 2

    .line 118
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->node:Lcom/vladsch/flexmark/ast/Text;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/ast/Text;->getPrevious()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    .line 119
    instance-of v1, v0, Lcom/vladsch/flexmark/ast/Text;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->previous:Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    if-eqz v1, :cond_0

    iget-object v1, v1, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->node:Lcom/vladsch/flexmark/ast/Text;

    if-eq v1, v0, :cond_1

    .line 120
    :cond_0
    check-cast v0, Lcom/vladsch/flexmark/ast/Text;

    return-object v0

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public getStartIndex()I
    .locals 1

    .line 84
    iget v0, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->index:I

    return v0
.end method

.method public getTailChars(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 2

    .line 100
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getEndIndex()I

    move-result v1

    sub-int/2addr v1, p1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getEndIndex()I

    move-result p1

    invoke-interface {v0, v1, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public isMatched()Z
    .locals 1

    .line 67
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->matched:Z

    return v0
.end method

.method public length()I
    .locals 1

    .line 169
    iget v0, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->numDelims:I

    return v0
.end method

.method public moveNodesBetweenDelimitersTo(Lcom/vladsch/flexmark/ast/DelimitedNode;Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;)V
    .locals 3

    .line 136
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getNode()Lcom/vladsch/flexmark/ast/Text;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/ast/Text;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    :goto_0
    if-eqz v0, :cond_0

    .line 137
    invoke-virtual {p2}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getNode()Lcom/vladsch/flexmark/ast/Text;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 138
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v1

    .line 139
    move-object v2, p1

    check-cast v2, Lcom/vladsch/flexmark/util/ast/Node;

    invoke-virtual {v2, v0}, Lcom/vladsch/flexmark/util/ast/Node;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    move-object v0, v1

    goto :goto_0

    .line 143
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getEndIndex()I

    move-result v1

    invoke-virtual {p2}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getStartIndex()I

    move-result p2

    invoke-interface {v0, v1, p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-interface {p1, p2}, Lcom/vladsch/flexmark/ast/DelimitedNode;->setText(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 144
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getNode()Lcom/vladsch/flexmark/ast/Text;

    move-result-object p2

    check-cast p1, Lcom/vladsch/flexmark/util/ast/Node;

    invoke-virtual {p2, p1}, Lcom/vladsch/flexmark/ast/Text;->insertAfter(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method

.method public setIndex(I)V
    .locals 0

    .line 96
    iput p1, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->index:I

    return-void
.end method

.method public setMatched(Z)V
    .locals 0

    .line 46
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->matched:Z

    return-void
.end method

.method public setNext(Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;)V
    .locals 0

    .line 54
    iput-object p1, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->next:Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    return-void
.end method

.method public setNumDelims(I)V
    .locals 0

    .line 58
    iput p1, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->numDelims:I

    return-void
.end method

.method public setPrevious(Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;)V
    .locals 0

    .line 50
    iput-object p1, p0, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->previous:Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    return-void
.end method
