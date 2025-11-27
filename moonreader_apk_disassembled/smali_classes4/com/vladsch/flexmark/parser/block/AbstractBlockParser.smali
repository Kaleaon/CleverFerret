.class public abstract Lcom/vladsch/flexmark/parser/block/AbstractBlockParser;
.super Ljava/lang/Object;
.source "AbstractBlockParser.java"

# interfaces
.implements Lcom/vladsch/flexmark/parser/block/BlockParser;


# instance fields
.field private isClosed:Z

.field private mutableData:Lcom/vladsch/flexmark/util/options/MutableDataSet;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 13
    iput-object v0, p0, Lcom/vladsch/flexmark/parser/block/AbstractBlockParser;->mutableData:Lcom/vladsch/flexmark/util/options/MutableDataSet;

    const/4 v0, 0x0

    .line 14
    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/block/AbstractBlockParser;->isClosed:Z

    return-void
.end method


# virtual methods
.method public addLine(Lcom/vladsch/flexmark/parser/block/ParserState;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    return-void
.end method

.method public breakOutOnDoubleBlankLine()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public canContain(Lcom/vladsch/flexmark/parser/block/ParserState;Lcom/vladsch/flexmark/parser/block/BlockParser;Lcom/vladsch/flexmark/util/ast/Block;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public canInterruptBy(Lcom/vladsch/flexmark/parser/block/BlockParserFactory;)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method

.method public final finalizeClosedBlock()V
    .locals 1

    const/4 v0, 0x0

    .line 77
    iput-object v0, p0, Lcom/vladsch/flexmark/parser/block/AbstractBlockParser;->mutableData:Lcom/vladsch/flexmark/util/options/MutableDataSet;

    const/4 v0, 0x1

    .line 78
    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/block/AbstractBlockParser;->isClosed:Z

    return-void
.end method

.method public getBlockContent()Lcom/vladsch/flexmark/util/ast/BlockContent;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getDataHolder()Lcom/vladsch/flexmark/util/options/MutableDataHolder;
    .locals 1

    .line 88
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/block/AbstractBlockParser;->mutableData:Lcom/vladsch/flexmark/util/options/MutableDataSet;

    if-nez v0, :cond_0

    .line 89
    new-instance v0, Lcom/vladsch/flexmark/util/options/MutableDataSet;

    invoke-direct {v0}, Lcom/vladsch/flexmark/util/options/MutableDataSet;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/block/AbstractBlockParser;->mutableData:Lcom/vladsch/flexmark/util/options/MutableDataSet;

    .line 91
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/block/AbstractBlockParser;->mutableData:Lcom/vladsch/flexmark/util/options/MutableDataSet;

    return-object v0
.end method

.method public isClosed()Z
    .locals 1

    .line 18
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/block/AbstractBlockParser;->isClosed:Z

    return v0
.end method

.method public isContainer()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isInterruptible()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isParagraphParser()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isPropagatingLastBlankLine(Lcom/vladsch/flexmark/parser/block/BlockParser;)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method

.method public isRawText()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public parseInlines(Lcom/vladsch/flexmark/parser/InlineParser;)V
    .locals 0

    return-void
.end method

.method public removeBlankLines()V
    .locals 3

    .line 96
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/block/AbstractBlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Block;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    :goto_0
    if-eqz v0, :cond_1

    .line 99
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v1

    .line 100
    instance-of v2, v0, Lcom/vladsch/flexmark/util/ast/BlankLine;

    if-eqz v2, :cond_0

    .line 101
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->unlink()V

    :cond_0
    move-object v0, v1

    goto :goto_0

    :cond_1
    return-void
.end method
