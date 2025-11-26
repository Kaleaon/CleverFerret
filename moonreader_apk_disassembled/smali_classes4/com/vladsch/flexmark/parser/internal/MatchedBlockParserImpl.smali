.class public Lcom/vladsch/flexmark/parser/internal/MatchedBlockParserImpl;
.super Ljava/lang/Object;
.source "MatchedBlockParserImpl.java"

# interfaces
.implements Lcom/vladsch/flexmark/parser/block/MatchedBlockParser;


# instance fields
.field private final matchedBlockParser:Lcom/vladsch/flexmark/parser/block/BlockParser;


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/parser/block/BlockParser;)V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/vladsch/flexmark/parser/internal/MatchedBlockParserImpl;->matchedBlockParser:Lcom/vladsch/flexmark/parser/block/BlockParser;

    return-void
.end method


# virtual methods
.method public getBlockParser()Lcom/vladsch/flexmark/parser/block/BlockParser;
    .locals 1

    .line 34
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/MatchedBlockParserImpl;->matchedBlockParser:Lcom/vladsch/flexmark/parser/block/BlockParser;

    return-object v0
.end method

.method public getParagraphContent()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 39
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/MatchedBlockParserImpl;->matchedBlockParser:Lcom/vladsch/flexmark/parser/block/BlockParser;

    invoke-interface {v0}, Lcom/vladsch/flexmark/parser/block/BlockParser;->isParagraphParser()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 40
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/MatchedBlockParserImpl;->matchedBlockParser:Lcom/vladsch/flexmark/parser/block/BlockParser;

    invoke-interface {v0}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlockContent()Lcom/vladsch/flexmark/util/ast/BlockContent;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/BlockContent;->getContents()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getParagraphDataHolder()Lcom/vladsch/flexmark/util/options/MutableDataHolder;
    .locals 1

    .line 47
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/MatchedBlockParserImpl;->matchedBlockParser:Lcom/vladsch/flexmark/parser/block/BlockParser;

    invoke-interface {v0}, Lcom/vladsch/flexmark/parser/block/BlockParser;->isParagraphParser()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 48
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/MatchedBlockParserImpl;->matchedBlockParser:Lcom/vladsch/flexmark/parser/block/BlockParser;

    invoke-interface {v0}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getDataHolder()Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getParagraphEolLengths()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 22
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/MatchedBlockParserImpl;->matchedBlockParser:Lcom/vladsch/flexmark/parser/block/BlockParser;

    invoke-interface {v0}, Lcom/vladsch/flexmark/parser/block/BlockParser;->isParagraphParser()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 23
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/MatchedBlockParserImpl;->matchedBlockParser:Lcom/vladsch/flexmark/parser/block/BlockParser;

    invoke-interface {v0}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlockContent()Lcom/vladsch/flexmark/util/ast/BlockContent;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/BlockContent;->getLineIndents()Ljava/util/List;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getParagraphLines()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            ">;"
        }
    .end annotation

    .line 15
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/MatchedBlockParserImpl;->matchedBlockParser:Lcom/vladsch/flexmark/parser/block/BlockParser;

    invoke-interface {v0}, Lcom/vladsch/flexmark/parser/block/BlockParser;->isParagraphParser()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 16
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/MatchedBlockParserImpl;->matchedBlockParser:Lcom/vladsch/flexmark/parser/block/BlockParser;

    invoke-interface {v0}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlockContent()Lcom/vladsch/flexmark/util/ast/BlockContent;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/BlockContent;->getLines()Ljava/util/List;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method
