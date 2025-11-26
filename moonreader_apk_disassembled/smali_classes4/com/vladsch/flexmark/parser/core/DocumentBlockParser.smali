.class public Lcom/vladsch/flexmark/parser/core/DocumentBlockParser;
.super Lcom/vladsch/flexmark/parser/block/AbstractBlockParser;
.source "DocumentBlockParser.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/ast/BlankLineContainer;


# instance fields
.field private document:Lcom/vladsch/flexmark/util/ast/Document;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Lcom/vladsch/flexmark/parser/block/AbstractBlockParser;-><init>()V

    return-void
.end method


# virtual methods
.method public addLine(Lcom/vladsch/flexmark/parser/block/ParserState;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    return-void
.end method

.method public canContain(Lcom/vladsch/flexmark/parser/block/ParserState;Lcom/vladsch/flexmark/parser/block/BlockParser;Lcom/vladsch/flexmark/util/ast/Block;)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method

.method public closeBlock(Lcom/vladsch/flexmark/parser/block/ParserState;)V
    .locals 2

    .line 51
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getProperties()Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v1, Lcom/vladsch/flexmark/parser/Parser;->TRACK_DOCUMENT_LINES:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 52
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/DocumentBlockParser;->document:Lcom/vladsch/flexmark/util/ast/Document;

    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLineSegments()Ljava/util/List;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/ast/Document;->setContent(Ljava/util/List;)V

    :cond_0
    return-void
.end method

.method public bridge synthetic getBlock()Lcom/vladsch/flexmark/util/ast/Block;
    .locals 1

    .line 15
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/core/DocumentBlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Document;

    move-result-object v0

    return-object v0
.end method

.method public getBlock()Lcom/vladsch/flexmark/util/ast/Document;
    .locals 1

    .line 37
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/DocumentBlockParser;->document:Lcom/vladsch/flexmark/util/ast/Document;

    return-object v0
.end method

.method public initializeDocument(Lcom/vladsch/flexmark/util/options/DataHolder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 1

    .line 22
    new-instance v0, Lcom/vladsch/flexmark/util/ast/Document;

    invoke-direct {v0, p1, p2}, Lcom/vladsch/flexmark/util/ast/Document;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/core/DocumentBlockParser;->document:Lcom/vladsch/flexmark/util/ast/Document;

    return-void
.end method

.method public isContainer()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public tryContinue(Lcom/vladsch/flexmark/parser/block/ParserState;)Lcom/vladsch/flexmark/parser/block/BlockContinue;
    .locals 0

    .line 42
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndex()I

    move-result p1

    invoke-static {p1}, Lcom/vladsch/flexmark/parser/block/BlockContinue;->atIndex(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1
.end method
