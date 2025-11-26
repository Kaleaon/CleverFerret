.class public Lcom/vladsch/flexmark/ext/abbreviation/Abbreviation;
.super Lcom/vladsch/flexmark/util/ast/Node;
.source "Abbreviation.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/ast/DoNotDecorate;
.implements Lcom/vladsch/flexmark/util/ast/DoNotLinkDecorate;
.implements Lcom/vladsch/flexmark/util/ast/ReferencingNode;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vladsch/flexmark/util/ast/Node;",
        "Lcom/vladsch/flexmark/util/ast/DoNotDecorate;",
        "Lcom/vladsch/flexmark/util/ast/DoNotLinkDecorate;",
        "Lcom/vladsch/flexmark/util/ast/ReferencingNode<",
        "Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationRepository;",
        "Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;",
        ">;"
    }
.end annotation


# instance fields
.field protected final abbreviation:Lcom/vladsch/flexmark/util/sequence/BasedSequence;


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/ast/Node;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 15
    iput-object p2, p0, Lcom/vladsch/flexmark/ext/abbreviation/Abbreviation;->abbreviation:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method


# virtual methods
.method public getAbbreviation()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 19
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/abbreviation/Abbreviation;->abbreviation:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getAstExtra(Ljava/lang/StringBuilder;)V
    .locals 0

    .line 29
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ext/abbreviation/Abbreviation;->astExtraChars(Ljava/lang/StringBuilder;)V

    return-void
.end method

.method public getReference()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 44
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/abbreviation/Abbreviation;->abbreviation:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getReferenceNode(Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationRepository;)Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;
    .locals 1

    .line 54
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ext/abbreviation/Abbreviation;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationRepository;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;

    return-object p1
.end method

.method public getReferenceNode(Lcom/vladsch/flexmark/util/ast/Document;)Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;
    .locals 1

    .line 49
    sget-object v0, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationExtension;->ABBREVIATIONS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationRepository;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ext/abbreviation/Abbreviation;->getReferenceNode(Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationRepository;)Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic getReferenceNode(Lcom/vladsch/flexmark/util/ast/Document;)Lcom/vladsch/flexmark/util/ast/ReferenceNode;
    .locals 0

    .line 10
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ext/abbreviation/Abbreviation;->getReferenceNode(Lcom/vladsch/flexmark/util/ast/Document;)Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic getReferenceNode(Lcom/vladsch/flexmark/util/ast/NodeRepository;)Lcom/vladsch/flexmark/util/ast/ReferenceNode;
    .locals 0

    .line 10
    check-cast p1, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationRepository;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ext/abbreviation/Abbreviation;->getReferenceNode(Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationRepository;)Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;

    move-result-object p1

    return-object p1
.end method

.method public getSegments()[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 24
    sget-object v0, Lcom/vladsch/flexmark/ext/abbreviation/Abbreviation;->EMPTY_SEGMENTS:[Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public isDefined()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method protected toStringAttributes()Ljava/lang/String;
    .locals 2

    .line 34
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "text="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/vladsch/flexmark/ext/abbreviation/Abbreviation;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
