.class public Lcom/vladsch/flexmark/util/ast/BlankLine;
.super Lcom/vladsch/flexmark/util/ast/Block;
.source "BlankLine.java"


# instance fields
.field private claimedBlankLine:Lcom/vladsch/flexmark/util/ast/Block;


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 22
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/Block;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    const/4 p1, 0x0

    .line 6
    iput-object p1, p0, Lcom/vladsch/flexmark/util/ast/BlankLine;->claimedBlankLine:Lcom/vladsch/flexmark/util/ast/Block;

    .line 23
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/BlankLine;->setCharsFromContent()V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/ast/Block;)V
    .locals 0

    .line 27
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/Block;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    const/4 p1, 0x0

    .line 6
    iput-object p1, p0, Lcom/vladsch/flexmark/util/ast/BlankLine;->claimedBlankLine:Lcom/vladsch/flexmark/util/ast/Block;

    .line 28
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/BlankLine;->setCharsFromContent()V

    .line 29
    iput-object p2, p0, Lcom/vladsch/flexmark/util/ast/BlankLine;->claimedBlankLine:Lcom/vladsch/flexmark/util/ast/Block;

    return-void
.end method


# virtual methods
.method public getClaimedBlankLine()Lcom/vladsch/flexmark/util/ast/Block;
    .locals 1

    .line 13
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/BlankLine;->claimedBlankLine:Lcom/vladsch/flexmark/util/ast/Block;

    return-object v0
.end method

.method public getSegments()[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 34
    sget-object v0, Lcom/vladsch/flexmark/util/ast/BlankLine;->EMPTY_SEGMENTS:[Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public isClaimed()Z
    .locals 1

    .line 9
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/BlankLine;->claimedBlankLine:Lcom/vladsch/flexmark/util/ast/Block;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setClaimedBlankLine(Lcom/vladsch/flexmark/util/ast/Block;)Lcom/vladsch/flexmark/util/ast/BlankLine;
    .locals 0

    .line 17
    iput-object p1, p0, Lcom/vladsch/flexmark/util/ast/BlankLine;->claimedBlankLine:Lcom/vladsch/flexmark/util/ast/Block;

    return-object p0
.end method
