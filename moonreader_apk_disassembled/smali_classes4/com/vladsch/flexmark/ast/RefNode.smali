.class public abstract Lcom/vladsch/flexmark/ast/RefNode;
.super Lcom/vladsch/flexmark/ast/LinkNode;
.source "RefNode.java"

# interfaces
.implements Lcom/vladsch/flexmark/ast/LinkRefDerived;
.implements Lcom/vladsch/flexmark/util/ast/ReferencingNode;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vladsch/flexmark/ast/LinkNode;",
        "Lcom/vladsch/flexmark/ast/LinkRefDerived;",
        "Lcom/vladsch/flexmark/util/ast/ReferencingNode<",
        "Lcom/vladsch/flexmark/ast/util/ReferenceRepository;",
        "Lcom/vladsch/flexmark/ast/Reference;",
        ">;"
    }
.end annotation


# instance fields
.field protected isDefined:Z

.field protected reference:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field protected referenceClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field protected referenceOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field protected text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field protected textClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field protected textOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 52
    invoke-direct {p0}, Lcom/vladsch/flexmark/ast/LinkNode;-><init>()V

    .line 10
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->textOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 11
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 12
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->textClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 13
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->referenceOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 14
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->reference:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 15
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->referenceClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 v0, 0x0

    .line 16
    iput-boolean v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->isDefined:Z

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 56
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/LinkNode;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 10
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/RefNode;->textOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 11
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/RefNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 12
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/RefNode;->textClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 13
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/RefNode;->referenceOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 14
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/RefNode;->reference:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 15
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/RefNode;->referenceClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 p1, 0x0

    .line 16
    iput-boolean p1, p0, Lcom/vladsch/flexmark/ast/RefNode;->isDefined:Z

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 2

    .line 80
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v0

    invoke-interface {p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vladsch/flexmark/ast/LinkNode;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 10
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->textOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 11
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 12
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->textClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 13
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->referenceOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 14
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->reference:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 15
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->referenceClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 v0, 0x0

    .line 16
    iput-boolean v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->isDefined:Z

    .line 81
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/RefNode;->textOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 82
    iput-object p2, p0, Lcom/vladsch/flexmark/ast/RefNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 83
    iput-object p3, p0, Lcom/vladsch/flexmark/ast/RefNode;->textClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 87
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/LinkNode;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 10
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/RefNode;->textOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 11
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/RefNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 12
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/RefNode;->textClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 13
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/RefNode;->referenceOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 14
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/RefNode;->reference:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 15
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/RefNode;->referenceClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 p1, 0x0

    .line 16
    iput-boolean p1, p0, Lcom/vladsch/flexmark/ast/RefNode;->isDefined:Z

    .line 88
    iput-object p2, p0, Lcom/vladsch/flexmark/ast/RefNode;->textOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 89
    iput-object p3, p0, Lcom/vladsch/flexmark/ast/RefNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 90
    iput-object p4, p0, Lcom/vladsch/flexmark/ast/RefNode;->textClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 2

    .line 94
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v0

    invoke-interface {p5}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vladsch/flexmark/ast/LinkNode;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 10
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->textOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 11
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 12
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->textClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 13
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->referenceOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 14
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->reference:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 15
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 v0, 0x0

    .line 16
    iput-boolean v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->isDefined:Z

    .line 95
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/RefNode;->textOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 96
    iput-object p2, p0, Lcom/vladsch/flexmark/ast/RefNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 97
    iput-object p3, p0, Lcom/vladsch/flexmark/ast/RefNode;->textClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 98
    iput-object p4, p0, Lcom/vladsch/flexmark/ast/RefNode;->referenceOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 99
    iput-object p5, p0, Lcom/vladsch/flexmark/ast/RefNode;->referenceClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 2

    .line 60
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v0

    invoke-interface {p6}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vladsch/flexmark/ast/LinkNode;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 10
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->textOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 11
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 12
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->textClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 13
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->referenceOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 14
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->reference:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 15
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 v0, 0x0

    .line 16
    iput-boolean v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->isDefined:Z

    .line 61
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/RefNode;->textOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 62
    iput-object p2, p0, Lcom/vladsch/flexmark/ast/RefNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 63
    iput-object p3, p0, Lcom/vladsch/flexmark/ast/RefNode;->textClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 64
    iput-object p4, p0, Lcom/vladsch/flexmark/ast/RefNode;->referenceOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 65
    iput-object p5, p0, Lcom/vladsch/flexmark/ast/RefNode;->reference:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 66
    iput-object p6, p0, Lcom/vladsch/flexmark/ast/RefNode;->referenceClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 70
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/LinkNode;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 10
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/RefNode;->textOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 11
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/RefNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 12
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/RefNode;->textClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 13
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/RefNode;->referenceOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 14
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/RefNode;->reference:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 15
    sget-object p1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 p1, 0x0

    .line 16
    iput-boolean p1, p0, Lcom/vladsch/flexmark/ast/RefNode;->isDefined:Z

    .line 71
    iput-object p2, p0, Lcom/vladsch/flexmark/ast/RefNode;->textOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 72
    iput-object p3, p0, Lcom/vladsch/flexmark/ast/RefNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 73
    iput-object p4, p0, Lcom/vladsch/flexmark/ast/RefNode;->textClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 74
    iput-object p5, p0, Lcom/vladsch/flexmark/ast/RefNode;->referenceOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 75
    iput-object p6, p0, Lcom/vladsch/flexmark/ast/RefNode;->reference:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 76
    iput-object p7, p0, Lcom/vladsch/flexmark/ast/RefNode;->referenceClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method


# virtual methods
.method public getAstExtra(Ljava/lang/StringBuilder;)V
    .locals 5

    .line 43
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/RefNode;->isReferenceTextCombined()Z

    move-result v0

    const-string v1, "reference"

    const-string v2, "text"

    if-eqz v0, :cond_0

    .line 44
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->referenceOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v3, p0, Lcom/vladsch/flexmark/ast/RefNode;->reference:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v4, p0, Lcom/vladsch/flexmark/ast/RefNode;->referenceClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-static {p1, v0, v3, v4, v1}, Lcom/vladsch/flexmark/ast/RefNode;->delimitedSegmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    .line 45
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->textOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v1, p0, Lcom/vladsch/flexmark/ast/RefNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v3, p0, Lcom/vladsch/flexmark/ast/RefNode;->textClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-static {p1, v0, v1, v3, v2}, Lcom/vladsch/flexmark/ast/RefNode;->delimitedSegmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    return-void

    .line 47
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->textOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v3, p0, Lcom/vladsch/flexmark/ast/RefNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v4, p0, Lcom/vladsch/flexmark/ast/RefNode;->textClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-static {p1, v0, v3, v4, v2}, Lcom/vladsch/flexmark/ast/RefNode;->delimitedSegmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    .line 48
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->referenceOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/RefNode;->reference:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v3, p0, Lcom/vladsch/flexmark/ast/RefNode;->referenceClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-static {p1, v0, v2, v3, v1}, Lcom/vladsch/flexmark/ast/RefNode;->delimitedSegmentSpanChars(Ljava/lang/StringBuilder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/String;)V

    return-void
.end method

.method public getDummyReference()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 3

    .line 193
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/RefNode;->isDummyReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 194
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/RefNode;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    iget-object v1, p0, Lcom/vladsch/flexmark/ast/RefNode;->textOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v1

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/RefNode;->textClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v2

    invoke-interface {v0, v1, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    return-object v0

    .line 196
    :cond_0
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getReference()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 145
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->reference:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getReferenceClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 200
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->referenceClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getReferenceNode(Lcom/vladsch/flexmark/ast/util/ReferenceRepository;)Lcom/vladsch/flexmark/ast/Reference;
    .locals 1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 156
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->reference:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/ast/util/ReferenceRepository;->normalizeKey(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 157
    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/ast/util/ReferenceRepository;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/ast/Reference;

    return-object p1
.end method

.method public getReferenceNode(Lcom/vladsch/flexmark/util/ast/Document;)Lcom/vladsch/flexmark/ast/Reference;
    .locals 1

    .line 150
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->REFERENCES:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/util/ast/Document;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/ast/util/ReferenceRepository;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ast/RefNode;->getReferenceNode(Lcom/vladsch/flexmark/ast/util/ReferenceRepository;)Lcom/vladsch/flexmark/ast/Reference;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic getReferenceNode(Lcom/vladsch/flexmark/util/ast/Document;)Lcom/vladsch/flexmark/util/ast/ReferenceNode;
    .locals 0

    .line 9
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ast/RefNode;->getReferenceNode(Lcom/vladsch/flexmark/util/ast/Document;)Lcom/vladsch/flexmark/ast/Reference;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic getReferenceNode(Lcom/vladsch/flexmark/util/ast/NodeRepository;)Lcom/vladsch/flexmark/util/ast/ReferenceNode;
    .locals 0

    .line 9
    check-cast p1, Lcom/vladsch/flexmark/ast/util/ReferenceRepository;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ast/RefNode;->getReferenceNode(Lcom/vladsch/flexmark/ast/util/ReferenceRepository;)Lcom/vladsch/flexmark/ast/Reference;

    move-result-object p1

    return-object p1
.end method

.method public getReferenceOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 181
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->referenceOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getSegments()[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 8

    .line 20
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/RefNode;->isReferenceTextCombined()Z

    move-result v0

    const/4 v1, 0x5

    const/4 v2, 0x4

    const/4 v3, 0x3

    const/4 v4, 0x2

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x6

    if-eqz v0, :cond_0

    .line 21
    new-array v0, v7, [Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v7, p0, Lcom/vladsch/flexmark/ast/RefNode;->referenceOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v7, v0, v6

    iget-object v6, p0, Lcom/vladsch/flexmark/ast/RefNode;->reference:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v6, v0, v5

    iget-object v5, p0, Lcom/vladsch/flexmark/ast/RefNode;->referenceClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v5, v0, v4

    iget-object v4, p0, Lcom/vladsch/flexmark/ast/RefNode;->textOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v4, v0, v3

    iget-object v3, p0, Lcom/vladsch/flexmark/ast/RefNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v3, v0, v2

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/RefNode;->textClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    return-object v0

    .line 30
    :cond_0
    new-array v0, v7, [Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v7, p0, Lcom/vladsch/flexmark/ast/RefNode;->textOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v7, v0, v6

    iget-object v6, p0, Lcom/vladsch/flexmark/ast/RefNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v6, v0, v5

    iget-object v5, p0, Lcom/vladsch/flexmark/ast/RefNode;->textClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v5, v0, v4

    iget-object v4, p0, Lcom/vladsch/flexmark/ast/RefNode;->referenceOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v4, v0, v3

    iget-object v3, p0, Lcom/vladsch/flexmark/ast/RefNode;->reference:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v3, v0, v2

    iget-object v2, p0, Lcom/vladsch/flexmark/ast/RefNode;->referenceClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    aput-object v2, v0, v1

    return-object v0
.end method

.method public getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 140
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getTextClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 173
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->textClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getTextOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 161
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->textOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public isDefined()Z
    .locals 1

    .line 123
    iget-boolean v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->isDefined:Z

    return v0
.end method

.method public isDummyReference()Z
    .locals 2

    .line 136
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->textOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    sget-object v1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    sget-object v1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->textClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    sget-object v1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isReferenceTextCombined()Z
    .locals 2

    .line 118
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    sget-object v1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTentative()Z
    .locals 1

    .line 132
    iget-boolean v0, p0, Lcom/vladsch/flexmark/ast/RefNode;->isDefined:Z

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public setDefined(Z)V
    .locals 0

    .line 127
    iput-boolean p1, p0, Lcom/vladsch/flexmark/ast/RefNode;->isDefined:Z

    return-void
.end method

.method public setReference(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 189
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/RefNode;->reference:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setReferenceChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 4

    .line 103
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v0

    const/4 v1, 0x0

    .line 104
    invoke-interface {p1, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v2

    const/16 v3, 0x21

    if-ne v2, v3, :cond_0

    const/4 v2, 0x2

    goto :goto_0

    :cond_0
    const/4 v2, 0x1

    .line 105
    :goto_0
    invoke-interface {p1, v1, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    iput-object v1, p0, Lcom/vladsch/flexmark/ast/RefNode;->referenceOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    add-int/lit8 v1, v0, -0x1

    .line 106
    invoke-interface {p1, v2, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trim()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    iput-object v2, p0, Lcom/vladsch/flexmark/ast/RefNode;->reference:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 107
    invoke-interface {p1, v1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/RefNode;->referenceClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setReferenceClosingMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 204
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/RefNode;->referenceClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setReferenceOpeningMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 185
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/RefNode;->referenceOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setText(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 169
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/RefNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setTextChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 3

    .line 111
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 112
    invoke-interface {p1, v1, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    iput-object v1, p0, Lcom/vladsch/flexmark/ast/RefNode;->textOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    add-int/lit8 v1, v0, -0x1

    .line 113
    invoke-interface {p1, v2, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trim()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    iput-object v2, p0, Lcom/vladsch/flexmark/ast/RefNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 114
    invoke-interface {p1, v1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/ast/RefNode;->textClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setTextClosingMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 177
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/RefNode;->textClosingMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method public setTextOpeningMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 165
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/RefNode;->textOpeningMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method

.method protected toStringAttributes()Ljava/lang/String;
    .locals 2

    .line 209
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "text="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/vladsch/flexmark/ast/RefNode;->text:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", reference="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/vladsch/flexmark/ast/RefNode;->reference:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
