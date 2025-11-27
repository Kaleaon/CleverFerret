.class public Lcom/vladsch/flexmark/parser/core/ListItemParser;
.super Lcom/vladsch/flexmark/parser/block/AbstractBlockParser;
.source "ListItemParser.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final myBlock:Lcom/vladsch/flexmark/ast/ListItem;

.field private myHadBlankLine:Z

.field private myIsEmpty:Z

.field private final myListData:Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;

.field private final myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

.field private final myParsing:Lcom/vladsch/flexmark/ast/util/Parsing;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method constructor <init>(Lcom/vladsch/flexmark/parser/ListOptions;Lcom/vladsch/flexmark/ast/util/Parsing;Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;)V
    .locals 1

    .line 26
    invoke-direct {p0}, Lcom/vladsch/flexmark/parser/block/AbstractBlockParser;-><init>()V

    const/4 v0, 0x0

    .line 23
    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myHadBlankLine:Z

    .line 24
    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myIsEmpty:Z

    .line 27
    iput-object p1, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    .line 28
    iput-object p3, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myListData:Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;

    .line 29
    iput-object p2, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myParsing:Lcom/vladsch/flexmark/ast/util/Parsing;

    .line 30
    iget-boolean p1, p3, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->isNumberedList:Z

    if-eqz p1, :cond_0

    new-instance p1, Lcom/vladsch/flexmark/ast/OrderedListItem;

    invoke-direct {p1}, Lcom/vladsch/flexmark/ast/OrderedListItem;-><init>()V

    goto :goto_0

    :cond_0
    new-instance p1, Lcom/vladsch/flexmark/ast/BulletListItem;

    invoke-direct {p1}, Lcom/vladsch/flexmark/ast/BulletListItem;-><init>()V

    :goto_0
    iput-object p1, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myBlock:Lcom/vladsch/flexmark/ast/ListItem;

    .line 31
    iget-object p2, p3, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->listMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/ast/ListItem;->setOpeningMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 32
    iget-object p2, p3, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->markerSuffix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/ast/ListItem;->setMarkerSuffix(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    return-void
.end method

.method private continueAtColumn(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;
    .locals 2

    .line 85
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myHadBlankLine:Z

    if-eqz v0, :cond_0

    .line 86
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myBlock:Lcom/vladsch/flexmark/ast/ListItem;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/ast/ListItem;->setContainsBlankLine(Z)V

    :cond_0
    const/4 v0, 0x0

    .line 88
    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myIsEmpty:Z

    .line 89
    invoke-static {p1}, Lcom/vladsch/flexmark/parser/block/BlockContinue;->atColumn(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public canContain(Lcom/vladsch/flexmark/parser/block/ParserState;Lcom/vladsch/flexmark/parser/block/BlockParser;Lcom/vladsch/flexmark/util/ast/Block;)Z
    .locals 1

    .line 57
    instance-of p3, p3, Lcom/vladsch/flexmark/ast/FencedCodeBlock;

    const/4 v0, 0x1

    if-eqz p3, :cond_1

    .line 59
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getProperties()Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object p1

    sget-object p3, Lcom/vladsch/flexmark/parser/Parser;->PARSER_EMULATION_PROFILE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, p3}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object p1

    sget-object p3, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->GITHUB_DOC:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    if-ne p1, p3, :cond_1

    .line 61
    check-cast p2, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;

    .line 62
    iget-object p1, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myListData:Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;

    iget p1, p1, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->markerIndent:I

    invoke-virtual {p2}, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;->getFenceMarkerIndent()I

    move-result p2

    if-ge p1, p2, :cond_0

    return v0

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    return v0
.end method

.method public closeBlock(Lcom/vladsch/flexmark/parser/block/ParserState;)V
    .locals 0

    .line 80
    iget-object p1, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myBlock:Lcom/vladsch/flexmark/ast/ListItem;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/ListItem;->setCharsFromContent()V

    return-void
.end method

.method public getBlock()Lcom/vladsch/flexmark/util/ast/Block;
    .locals 1

    .line 75
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myBlock:Lcom/vladsch/flexmark/ast/ListItem;

    return-object v0
.end method

.method getContentColumn()I
    .locals 2

    .line 37
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myListData:Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;

    iget v0, v0, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->markerColumn:I

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myListData:Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;

    iget-object v1, v1, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->listMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/parser/ListOptions;->isItemContentAfterSuffix()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myListData:Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;

    iget v1, v1, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->contentOffset:I

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myListData:Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;

    iget v1, v1, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->markerSuffixOffset:I

    :goto_0
    add-int/2addr v0, v1

    return v0
.end method

.method getContentIndent()I
    .locals 2

    .line 42
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myListData:Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;

    iget v0, v0, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->markerIndent:I

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myListData:Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;

    iget-object v1, v1, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->listMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/parser/ListOptions;->isItemContentAfterSuffix()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myListData:Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;

    iget v1, v1, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->contentOffset:I

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myListData:Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;

    iget v1, v1, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->markerSuffixOffset:I

    :goto_0
    add-int/2addr v0, v1

    return v0
.end method

.method getMarkerContentIndent()I
    .locals 2

    .line 46
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myListData:Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;

    iget v0, v0, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->markerIndent:I

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myListData:Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;

    iget-object v1, v1, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->listMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public isContainer()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public isPropagatingLastBlankLine(Lcom/vladsch/flexmark/parser/block/BlockParser;)Z
    .locals 1

    .line 70
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myBlock:Lcom/vladsch/flexmark/ast/ListItem;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/ast/ListItem;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    if-nez v0, :cond_1

    if-ne p0, p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method public tryContinue(Lcom/vladsch/flexmark/parser/block/ParserState;)Lcom/vladsch/flexmark/parser/block/BlockContinue;
    .locals 9

    .line 94
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->isBlank()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_3

    .line 96
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myBlock:Lcom/vladsch/flexmark/ast/ListItem;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/ast/ListItem;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 97
    :goto_0
    iput-boolean v2, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myIsEmpty:Z

    if-nez v2, :cond_1

    .line 98
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    if-nez v0, :cond_2

    .line 99
    :cond_1
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myBlock:Lcom/vladsch/flexmark/ast/ListItem;

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/ast/ListItem;->setHadBlankAfterItemParagraph(Z)V

    .line 101
    :cond_2
    iput-boolean v1, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myHadBlankLine:Z

    .line 102
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getNextNonSpaceIndex()I

    move-result p1

    invoke-static {p1}, Lcom/vladsch/flexmark/parser/block/BlockContinue;->atIndex(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 107
    :cond_3
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myBlock:Lcom/vladsch/flexmark/ast/ListItem;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/ast/ListItem;->getParent()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/parser/block/ParserState;->getActiveBlockParser(Lcom/vladsch/flexmark/util/ast/Block;)Lcom/vladsch/flexmark/parser/block/BlockParser;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;

    .line 109
    iget-object v2, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v2}, Lcom/vladsch/flexmark/parser/ListOptions;->getParserEmulationProfile()Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    move-result-object v2

    .line 110
    iget-object v3, v2, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->family:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    .line 111
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/core/ListItemParser;->getContentIndent()I

    move-result v4

    .line 112
    sget-object v5, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->COMMONMARK:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    if-ne v3, v5, :cond_e

    .line 126
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndent()I

    move-result v2

    .line 127
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getColumn()I

    move-result v3

    add-int/2addr v3, v4

    .line 129
    iget-object v5, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v5}, Lcom/vladsch/flexmark/parser/ListOptions;->getCodeIndent()I

    move-result v5

    add-int/2addr v5, v4

    if-lt v2, v5, :cond_4

    .line 131
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 132
    invoke-direct {p0, v3}, Lcom/vladsch/flexmark/parser/core/ListItemParser;->continueAtColumn(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 134
    :cond_4
    iget-object v5, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v5}, Lcom/vladsch/flexmark/parser/ListOptions;->getCodeIndent()I

    move-result v6

    invoke-static {v5, v6, p1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->parseListMarker(Lcom/vladsch/flexmark/parser/ListOptions;ILcom/vladsch/flexmark/parser/block/ParserState;)Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;

    move-result-object v5

    if-lt v2, v4, :cond_9

    if-eqz v5, :cond_7

    .line 138
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getActiveBlockParser()Lcom/vladsch/flexmark/parser/block/BlockParser;

    move-result-object v2

    .line 139
    invoke-interface {v2}, Lcom/vladsch/flexmark/parser/block/BlockParser;->isParagraphParser()Z

    move-result v4

    if-eqz v4, :cond_6

    .line 140
    invoke-interface {v2}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/ast/Block;->getParent()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v4

    instance-of v4, v4, Lcom/vladsch/flexmark/ast/ListItem;

    if-eqz v4, :cond_6

    invoke-interface {v2}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v4

    invoke-interface {v2}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/ast/Block;->getParent()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/ast/Block;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v2

    if-ne v4, v2, :cond_6

    .line 142
    iget-object v2, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    iget-object v4, v5, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->listBlock:Lcom/vladsch/flexmark/ast/ListBlock;

    iget-boolean v6, v5, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->isEmpty:Z

    .line 143
    invoke-virtual {v2, v4, v6, v1}, Lcom/vladsch/flexmark/parser/ListOptions;->canInterrupt(Lcom/vladsch/flexmark/ast/ListBlock;ZZ)Z

    move-result v1

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    iget-object v2, v5, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->listBlock:Lcom/vladsch/flexmark/ast/ListBlock;

    iget-boolean v4, v5, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->isEmpty:Z

    .line 144
    invoke-virtual {v1, v2, v4}, Lcom/vladsch/flexmark/parser/ListOptions;->canStartSubList(Lcom/vladsch/flexmark/ast/ListBlock;Z)Z

    move-result v1

    if-nez v1, :cond_6

    .line 146
    :cond_5
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledLineSkipActive(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 147
    invoke-direct {p0, v3}, Lcom/vladsch/flexmark/parser/core/ListItemParser;->continueAtColumn(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 150
    :cond_6
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledNewListLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 151
    invoke-direct {p0, v3}, Lcom/vladsch/flexmark/parser/core/ListItemParser;->continueAtColumn(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 154
    :cond_7
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myIsEmpty:Z

    if-eqz v1, :cond_8

    .line 156
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 157
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockContinue;->none()Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 159
    :cond_8
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 160
    invoke-direct {p0, v3}, Lcom/vladsch/flexmark/parser/core/ListItemParser;->continueAtColumn(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    :cond_9
    if-eqz v5, :cond_45

    .line 164
    iget-boolean v3, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myHadBlankLine:Z

    if-nez v3, :cond_a

    iget-object v3, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    iget-object v4, v5, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->listBlock:Lcom/vladsch/flexmark/ast/ListBlock;

    iget-boolean v6, v5, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->isEmpty:Z

    invoke-virtual {v3, v4, v6, v1}, Lcom/vladsch/flexmark/parser/ListOptions;->canInterrupt(Lcom/vladsch/flexmark/ast/ListBlock;ZZ)Z

    move-result v1

    if-nez v1, :cond_a

    .line 166
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 167
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getColumn()I

    move-result p1

    add-int/2addr p1, v2

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/core/ListItemParser;->continueAtColumn(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 170
    :cond_a
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/parser/ListOptions;->isItemTypeMismatchToNewList()Z

    move-result v1

    if-eqz v1, :cond_b

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/parser/ListOptions;->isItemTypeMismatchToSubList()Z

    move-result v1

    if-eqz v1, :cond_b

    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myHadBlankLine:Z

    if-eqz v1, :cond_b

    goto :goto_1

    .line 171
    :cond_b
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->getBlock()Lcom/vladsch/flexmark/ast/ListBlock;

    move-result-object v3

    iget-object v4, v5, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->listBlock:Lcom/vladsch/flexmark/ast/ListBlock;

    invoke-virtual {v1, v3, v4}, Lcom/vladsch/flexmark/parser/ListOptions;->startSubList(Lcom/vladsch/flexmark/ast/ListBlock;Lcom/vladsch/flexmark/ast/ListBlock;)Z

    move-result v1

    if-eqz v1, :cond_c

    .line 173
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledNewListLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 174
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getColumn()I

    move-result p1

    add-int/2addr p1, v2

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/core/ListItemParser;->continueAtColumn(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 176
    :cond_c
    :goto_1
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->getBlock()Lcom/vladsch/flexmark/ast/ListBlock;

    move-result-object v2

    iget-object v3, v5, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->listBlock:Lcom/vladsch/flexmark/ast/ListBlock;

    invoke-virtual {v1, v2, v3}, Lcom/vladsch/flexmark/parser/ListOptions;->startNewList(Lcom/vladsch/flexmark/ast/ListBlock;Lcom/vladsch/flexmark/ast/ListBlock;)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 178
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledNewListLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 179
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockContinue;->none()Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 182
    :cond_d
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledNewItemLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 183
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockContinue;->none()Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 190
    :cond_e
    iget-object v5, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v5}, Lcom/vladsch/flexmark/parser/ListOptions;->getItemIndent()I

    move-result v5

    .line 192
    sget-object v6, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->FIXED_INDENT:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    const/4 v7, -0x1

    if-ne v3, v6, :cond_19

    .line 205
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndent()I

    move-result v2

    .line 208
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getColumn()I

    move-result v3

    add-int/2addr v3, v5

    .line 210
    iget-object v4, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v4}, Lcom/vladsch/flexmark/parser/ListOptions;->getCodeIndent()I

    move-result v4

    if-lt v2, v4, :cond_f

    .line 212
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 213
    invoke-direct {p0, v3}, Lcom/vladsch/flexmark/parser/core/ListItemParser;->continueAtColumn(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 215
    :cond_f
    iget-object v4, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-static {v4, v7, p1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->parseListMarker(Lcom/vladsch/flexmark/parser/ListOptions;ILcom/vladsch/flexmark/parser/block/ParserState;)Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;

    move-result-object v4

    if-lt v2, v5, :cond_14

    if-eqz v4, :cond_12

    .line 219
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getActiveBlockParser()Lcom/vladsch/flexmark/parser/block/BlockParser;

    move-result-object v5

    .line 220
    invoke-interface {v5}, Lcom/vladsch/flexmark/parser/block/BlockParser;->isParagraphParser()Z

    move-result v6

    if-eqz v6, :cond_11

    .line 221
    invoke-interface {v5}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v6

    invoke-virtual {v6}, Lcom/vladsch/flexmark/util/ast/Block;->getParent()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v6

    instance-of v6, v6, Lcom/vladsch/flexmark/ast/ListItem;

    if-eqz v6, :cond_11

    invoke-interface {v5}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v6

    invoke-interface {v5}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vladsch/flexmark/util/ast/Block;->getParent()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vladsch/flexmark/util/ast/Block;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v5

    if-ne v6, v5, :cond_11

    .line 223
    iget-object v5, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    iget-object v6, v4, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->listBlock:Lcom/vladsch/flexmark/ast/ListBlock;

    iget-boolean v7, v4, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->isEmpty:Z

    .line 224
    invoke-virtual {v5, v6, v7, v1}, Lcom/vladsch/flexmark/parser/ListOptions;->canInterrupt(Lcom/vladsch/flexmark/ast/ListBlock;ZZ)Z

    move-result v1

    if-eqz v1, :cond_10

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    iget-object v5, v4, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->listBlock:Lcom/vladsch/flexmark/ast/ListBlock;

    iget-boolean v4, v4, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->isEmpty:Z

    .line 225
    invoke-virtual {v1, v5, v4}, Lcom/vladsch/flexmark/parser/ListOptions;->canStartSubList(Lcom/vladsch/flexmark/ast/ListBlock;Z)Z

    move-result v1

    if-nez v1, :cond_11

    .line 227
    :cond_10
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledLineSkipActive(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 228
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getColumn()I

    move-result p1

    add-int/2addr p1, v2

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/core/ListItemParser;->continueAtColumn(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 231
    :cond_11
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledNewListLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 232
    invoke-direct {p0, v3}, Lcom/vladsch/flexmark/parser/core/ListItemParser;->continueAtColumn(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 236
    :cond_12
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myIsEmpty:Z

    if-eqz v1, :cond_13

    .line 237
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 238
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockContinue;->none()Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 240
    :cond_13
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 241
    invoke-direct {p0, v3}, Lcom/vladsch/flexmark/parser/core/ListItemParser;->continueAtColumn(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    :cond_14
    if-eqz v4, :cond_45

    .line 245
    iget-boolean v3, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myHadBlankLine:Z

    if-nez v3, :cond_15

    iget-object v3, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    iget-object v5, v4, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->listBlock:Lcom/vladsch/flexmark/ast/ListBlock;

    iget-boolean v6, v4, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->isEmpty:Z

    invoke-virtual {v3, v5, v6, v1}, Lcom/vladsch/flexmark/parser/ListOptions;->canInterrupt(Lcom/vladsch/flexmark/ast/ListBlock;ZZ)Z

    move-result v1

    if-nez v1, :cond_15

    .line 247
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 248
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getColumn()I

    move-result p1

    add-int/2addr p1, v2

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/core/ListItemParser;->continueAtColumn(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 251
    :cond_15
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/parser/ListOptions;->isItemTypeMismatchToNewList()Z

    move-result v1

    if-eqz v1, :cond_16

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/parser/ListOptions;->isItemTypeMismatchToSubList()Z

    move-result v1

    if-eqz v1, :cond_16

    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myHadBlankLine:Z

    if-eqz v1, :cond_16

    goto :goto_2

    .line 252
    :cond_16
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->getBlock()Lcom/vladsch/flexmark/ast/ListBlock;

    move-result-object v3

    iget-object v5, v4, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->listBlock:Lcom/vladsch/flexmark/ast/ListBlock;

    invoke-virtual {v1, v3, v5}, Lcom/vladsch/flexmark/parser/ListOptions;->startSubList(Lcom/vladsch/flexmark/ast/ListBlock;Lcom/vladsch/flexmark/ast/ListBlock;)Z

    move-result v1

    if-eqz v1, :cond_17

    .line 254
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledNewListLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 255
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getColumn()I

    move-result p1

    add-int/2addr p1, v2

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/core/ListItemParser;->continueAtColumn(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 257
    :cond_17
    :goto_2
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->getBlock()Lcom/vladsch/flexmark/ast/ListBlock;

    move-result-object v2

    iget-object v3, v4, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->listBlock:Lcom/vladsch/flexmark/ast/ListBlock;

    invoke-virtual {v1, v2, v3}, Lcom/vladsch/flexmark/parser/ListOptions;->startNewList(Lcom/vladsch/flexmark/ast/ListBlock;Lcom/vladsch/flexmark/ast/ListBlock;)Z

    move-result v1

    if-eqz v1, :cond_18

    .line 259
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledNewListLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 260
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockContinue;->none()Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 263
    :cond_18
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledNewItemLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 264
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockContinue;->none()Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 271
    :cond_19
    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->getListData()Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;

    move-result-object v6

    iget v6, v6, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->markerIndent:I

    .line 272
    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->getListData()Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;

    move-result-object v8

    iget v8, v8, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->markerIndex:I

    .line 273
    sget-object v8, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->KRAMDOWN:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    if-ne v3, v8, :cond_25

    .line 289
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndent()I

    move-result v2

    .line 291
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getColumn()I

    move-result v3

    add-int/2addr v3, v4

    .line 293
    iget-object v8, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-static {v8, v7, p1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->parseListMarker(Lcom/vladsch/flexmark/parser/ListOptions;ILcom/vladsch/flexmark/parser/block/ParserState;)Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;

    move-result-object v7

    if-lt v2, v4, :cond_1e

    if-eqz v7, :cond_1c

    .line 298
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getActiveBlockParser()Lcom/vladsch/flexmark/parser/block/BlockParser;

    move-result-object v2

    .line 299
    invoke-interface {v2}, Lcom/vladsch/flexmark/parser/block/BlockParser;->isParagraphParser()Z

    move-result v4

    if-eqz v4, :cond_1b

    .line 300
    invoke-interface {v2}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/ast/Block;->getParent()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v4

    instance-of v4, v4, Lcom/vladsch/flexmark/ast/ListItem;

    if-eqz v4, :cond_1b

    invoke-interface {v2}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v4

    invoke-interface {v2}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/ast/Block;->getParent()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/ast/Block;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v2

    if-ne v4, v2, :cond_1b

    .line 302
    iget-object v2, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    iget-object v4, v7, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->listBlock:Lcom/vladsch/flexmark/ast/ListBlock;

    iget-boolean v5, v7, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->isEmpty:Z

    .line 303
    invoke-virtual {v2, v4, v5, v1}, Lcom/vladsch/flexmark/parser/ListOptions;->canInterrupt(Lcom/vladsch/flexmark/ast/ListBlock;ZZ)Z

    move-result v1

    if-eqz v1, :cond_1a

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    iget-object v2, v7, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->listBlock:Lcom/vladsch/flexmark/ast/ListBlock;

    iget-boolean v4, v7, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->isEmpty:Z

    .line 304
    invoke-virtual {v1, v2, v4}, Lcom/vladsch/flexmark/parser/ListOptions;->canStartSubList(Lcom/vladsch/flexmark/ast/ListBlock;Z)Z

    move-result v1

    if-nez v1, :cond_1b

    .line 306
    :cond_1a
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledLineSkipActive(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 307
    invoke-direct {p0, v3}, Lcom/vladsch/flexmark/parser/core/ListItemParser;->continueAtColumn(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 310
    :cond_1b
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledNewListLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 311
    invoke-direct {p0, v3}, Lcom/vladsch/flexmark/parser/core/ListItemParser;->continueAtColumn(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 315
    :cond_1c
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myIsEmpty:Z

    if-eqz v1, :cond_1d

    .line 316
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 317
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockContinue;->none()Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 319
    :cond_1d
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 320
    invoke-direct {p0, v3}, Lcom/vladsch/flexmark/parser/core/ListItemParser;->continueAtColumn(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    :cond_1e
    add-int/2addr v5, v6

    if-lt v2, v5, :cond_21

    .line 325
    iget-boolean v3, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myHadBlankLine:Z

    if-eqz v3, :cond_20

    .line 327
    iget-object v2, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myBlock:Lcom/vladsch/flexmark/ast/ListItem;

    invoke-virtual {v2}, Lcom/vladsch/flexmark/ast/ListItem;->isHadBlankAfterItemParagraph()Z

    move-result v2

    if-eqz v2, :cond_1f

    iget-object v2, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myBlock:Lcom/vladsch/flexmark/ast/ListItem;

    invoke-virtual {v2, v1}, Lcom/vladsch/flexmark/ast/ListItem;->setLoose(Z)V

    .line 328
    :cond_1f
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledLineSkipActive(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 329
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockContinue;->none()Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 332
    :cond_20
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledLineSkipActive(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 333
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getColumn()I

    move-result p1

    add-int/2addr p1, v2

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/core/ListItemParser;->continueAtColumn(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    :cond_21
    if-eqz v7, :cond_45

    if-lt v2, v6, :cond_45

    .line 338
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/parser/ListOptions;->isItemTypeMismatchToNewList()Z

    move-result v1

    if-eqz v1, :cond_22

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/parser/ListOptions;->isItemTypeMismatchToSubList()Z

    move-result v1

    if-eqz v1, :cond_22

    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myHadBlankLine:Z

    if-eqz v1, :cond_22

    goto :goto_3

    .line 339
    :cond_22
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->getBlock()Lcom/vladsch/flexmark/ast/ListBlock;

    move-result-object v3

    iget-object v4, v7, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->listBlock:Lcom/vladsch/flexmark/ast/ListBlock;

    invoke-virtual {v1, v3, v4}, Lcom/vladsch/flexmark/parser/ListOptions;->startSubList(Lcom/vladsch/flexmark/ast/ListBlock;Lcom/vladsch/flexmark/ast/ListBlock;)Z

    move-result v1

    if-eqz v1, :cond_23

    .line 341
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledNewListLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 342
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getColumn()I

    move-result p1

    add-int/2addr p1, v2

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/core/ListItemParser;->continueAtColumn(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 344
    :cond_23
    :goto_3
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->getBlock()Lcom/vladsch/flexmark/ast/ListBlock;

    move-result-object v2

    iget-object v3, v7, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->listBlock:Lcom/vladsch/flexmark/ast/ListBlock;

    invoke-virtual {v1, v2, v3}, Lcom/vladsch/flexmark/parser/ListOptions;->startNewList(Lcom/vladsch/flexmark/ast/ListBlock;Lcom/vladsch/flexmark/ast/ListBlock;)Z

    move-result v1

    if-eqz v1, :cond_24

    .line 346
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledNewListLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 347
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockContinue;->none()Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 350
    :cond_24
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledNewItemLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 351
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockContinue;->none()Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 357
    :cond_25
    sget-object v8, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->GITHUB_DOC:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    if-ne v2, v8, :cond_36

    .line 371
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndent()I

    move-result v2

    .line 372
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndex()I

    add-int/lit8 v3, v6, 0x4

    .line 375
    filled-new-array {v4, v3}, [I

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vladsch/flexmark/util/Utils;->maxLimit(I[I)I

    move-result v3

    .line 377
    iget-object v8, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v8}, Lcom/vladsch/flexmark/parser/ListOptions;->getCodeIndent()I

    move-result v8

    if-lt v2, v8, :cond_26

    .line 379
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 380
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getColumn()I

    move-result p1

    filled-new-array {v5}, [I

    move-result-object v0

    invoke-static {v4, v0}, Lcom/vladsch/flexmark/util/Utils;->maxLimit(I[I)I

    move-result v0

    add-int/2addr p1, v0

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/core/ListItemParser;->continueAtColumn(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 382
    :cond_26
    iget-object v4, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-static {v4, v7, p1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->parseListMarker(Lcom/vladsch/flexmark/parser/ListOptions;ILcom/vladsch/flexmark/parser/block/ParserState;)Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;

    move-result-object v4

    if-le v2, v5, :cond_2a

    if-eqz v4, :cond_29

    .line 387
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getActiveBlockParser()Lcom/vladsch/flexmark/parser/block/BlockParser;

    move-result-object v5

    .line 388
    invoke-interface {v5}, Lcom/vladsch/flexmark/parser/block/BlockParser;->isParagraphParser()Z

    move-result v6

    if-eqz v6, :cond_28

    .line 389
    invoke-interface {v5}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v6

    invoke-virtual {v6}, Lcom/vladsch/flexmark/util/ast/Block;->getParent()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v6

    instance-of v6, v6, Lcom/vladsch/flexmark/ast/ListItem;

    if-eqz v6, :cond_28

    invoke-interface {v5}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v6

    invoke-interface {v5}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vladsch/flexmark/util/ast/Block;->getParent()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vladsch/flexmark/util/ast/Block;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v5

    if-ne v6, v5, :cond_28

    .line 391
    iget-object v5, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    iget-object v6, v4, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->listBlock:Lcom/vladsch/flexmark/ast/ListBlock;

    iget-boolean v7, v4, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->isEmpty:Z

    .line 392
    invoke-virtual {v5, v6, v7, v1}, Lcom/vladsch/flexmark/parser/ListOptions;->canInterrupt(Lcom/vladsch/flexmark/ast/ListBlock;ZZ)Z

    move-result v1

    if-eqz v1, :cond_27

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    iget-object v5, v4, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->listBlock:Lcom/vladsch/flexmark/ast/ListBlock;

    iget-boolean v4, v4, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->isEmpty:Z

    .line 393
    invoke-virtual {v1, v5, v4}, Lcom/vladsch/flexmark/parser/ListOptions;->canStartSubList(Lcom/vladsch/flexmark/ast/ListBlock;Z)Z

    move-result v1

    if-nez v1, :cond_28

    .line 395
    :cond_27
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledLineSkipActive(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 396
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getColumn()I

    move-result p1

    add-int/2addr p1, v2

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/core/ListItemParser;->continueAtColumn(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 399
    :cond_28
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledNewListLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 400
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getColumn()I

    move-result p1

    add-int/2addr p1, v3

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/core/ListItemParser;->continueAtColumn(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 404
    :cond_29
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 405
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getColumn()I

    move-result p1

    add-int/2addr p1, v5

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/core/ListItemParser;->continueAtColumn(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    :cond_2a
    if-le v2, v6, :cond_2e

    if-eqz v4, :cond_2d

    .line 411
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getActiveBlockParser()Lcom/vladsch/flexmark/parser/block/BlockParser;

    move-result-object v5

    .line 412
    invoke-interface {v5}, Lcom/vladsch/flexmark/parser/block/BlockParser;->isParagraphParser()Z

    move-result v6

    if-eqz v6, :cond_2c

    .line 413
    invoke-interface {v5}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v6

    invoke-virtual {v6}, Lcom/vladsch/flexmark/util/ast/Block;->getParent()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v6

    instance-of v6, v6, Lcom/vladsch/flexmark/ast/ListItem;

    if-eqz v6, :cond_2c

    invoke-interface {v5}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v6

    invoke-interface {v5}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vladsch/flexmark/util/ast/Block;->getParent()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vladsch/flexmark/util/ast/Block;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v5

    if-ne v6, v5, :cond_2c

    .line 415
    iget-object v5, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    iget-object v6, v4, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->listBlock:Lcom/vladsch/flexmark/ast/ListBlock;

    iget-boolean v7, v4, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->isEmpty:Z

    .line 416
    invoke-virtual {v5, v6, v7, v1}, Lcom/vladsch/flexmark/parser/ListOptions;->canInterrupt(Lcom/vladsch/flexmark/ast/ListBlock;ZZ)Z

    move-result v1

    if-eqz v1, :cond_2b

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    iget-object v5, v4, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->listBlock:Lcom/vladsch/flexmark/ast/ListBlock;

    iget-boolean v4, v4, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->isEmpty:Z

    .line 417
    invoke-virtual {v1, v5, v4}, Lcom/vladsch/flexmark/parser/ListOptions;->canStartSubList(Lcom/vladsch/flexmark/ast/ListBlock;Z)Z

    move-result v1

    if-nez v1, :cond_2c

    .line 419
    :cond_2b
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledLineSkipActive(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 420
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getColumn()I

    move-result p1

    add-int/2addr p1, v2

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/core/ListItemParser;->continueAtColumn(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 423
    :cond_2c
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledNewListLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 424
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getColumn()I

    move-result p1

    add-int/2addr p1, v3

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/core/ListItemParser;->continueAtColumn(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 428
    :cond_2d
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 429
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getColumn()I

    move-result p1

    add-int/2addr p1, v3

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/core/ListItemParser;->continueAtColumn(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    :cond_2e
    if-eqz v4, :cond_34

    .line 435
    iget-object v5, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v5}, Lcom/vladsch/flexmark/parser/ListOptions;->isItemTypeMismatchToNewList()Z

    move-result v5

    if-eqz v5, :cond_2f

    iget-object v5, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v5}, Lcom/vladsch/flexmark/parser/ListOptions;->isItemTypeMismatchToSubList()Z

    move-result v5

    if-eqz v5, :cond_2f

    iget-boolean v5, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myHadBlankLine:Z

    if-eqz v5, :cond_2f

    goto :goto_4

    .line 436
    :cond_2f
    iget-object v5, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->getBlock()Lcom/vladsch/flexmark/ast/ListBlock;

    move-result-object v6

    iget-object v7, v4, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->listBlock:Lcom/vladsch/flexmark/ast/ListBlock;

    invoke-virtual {v5, v6, v7}, Lcom/vladsch/flexmark/parser/ListOptions;->startSubList(Lcom/vladsch/flexmark/ast/ListBlock;Lcom/vladsch/flexmark/ast/ListBlock;)Z

    move-result v5

    if-eqz v5, :cond_30

    .line 438
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledNewListLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 439
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getColumn()I

    move-result p1

    add-int/2addr p1, v3

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/core/ListItemParser;->continueAtColumn(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 441
    :cond_30
    :goto_4
    iget-object v3, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->getBlock()Lcom/vladsch/flexmark/ast/ListBlock;

    move-result-object v5

    iget-object v6, v4, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->listBlock:Lcom/vladsch/flexmark/ast/ListBlock;

    invoke-virtual {v3, v5, v6}, Lcom/vladsch/flexmark/parser/ListOptions;->startNewList(Lcom/vladsch/flexmark/ast/ListBlock;Lcom/vladsch/flexmark/ast/ListBlock;)Z

    move-result v3

    if-eqz v3, :cond_31

    .line 443
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledNewListLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 444
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockContinue;->none()Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 446
    :cond_31
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getActiveBlockParser()Lcom/vladsch/flexmark/parser/block/BlockParser;

    move-result-object v3

    .line 447
    invoke-interface {v3}, Lcom/vladsch/flexmark/parser/block/BlockParser;->isParagraphParser()Z

    move-result v5

    if-eqz v5, :cond_33

    .line 448
    invoke-interface {v3}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vladsch/flexmark/util/ast/Block;->getParent()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v5

    instance-of v5, v5, Lcom/vladsch/flexmark/ast/ListItem;

    if-eqz v5, :cond_33

    invoke-interface {v3}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v5

    invoke-interface {v3}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vladsch/flexmark/util/ast/Block;->getParent()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vladsch/flexmark/util/ast/Block;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v3

    if-ne v5, v3, :cond_33

    .line 450
    iget-object v3, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    iget-object v5, v4, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->listBlock:Lcom/vladsch/flexmark/ast/ListBlock;

    iget-boolean v6, v4, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->isEmpty:Z

    .line 451
    invoke-virtual {v3, v5, v6, v1}, Lcom/vladsch/flexmark/parser/ListOptions;->canInterrupt(Lcom/vladsch/flexmark/ast/ListBlock;ZZ)Z

    move-result v1

    if-eqz v1, :cond_32

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    iget-object v3, v4, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->listBlock:Lcom/vladsch/flexmark/ast/ListBlock;

    iget-boolean v4, v4, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->isEmpty:Z

    .line 452
    invoke-virtual {v1, v3, v4}, Lcom/vladsch/flexmark/parser/ListOptions;->canStartSubList(Lcom/vladsch/flexmark/ast/ListBlock;Z)Z

    move-result v1

    if-nez v1, :cond_33

    .line 454
    :cond_32
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledLineSkipActive(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 455
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getColumn()I

    move-result p1

    add-int/2addr p1, v2

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/core/ListItemParser;->continueAtColumn(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 458
    :cond_33
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledNewItemLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 459
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockContinue;->none()Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 463
    :cond_34
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myHadBlankLine:Z

    if-eqz v1, :cond_35

    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getActiveBlockParser()Lcom/vladsch/flexmark/parser/block/BlockParser;

    move-result-object v1

    instance-of v1, v1, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;

    if-eqz v1, :cond_45

    .line 466
    :cond_35
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 467
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getColumn()I

    move-result p1

    add-int/2addr p1, v2

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/core/ListItemParser;->continueAtColumn(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 472
    :cond_36
    sget-object v2, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->MARKDOWN:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    if-ne v3, v2, :cond_45

    .line 486
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndent()I

    move-result v2

    .line 488
    iget-object v3, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v3}, Lcom/vladsch/flexmark/parser/ListOptions;->getCodeIndent()I

    move-result v3

    if-lt v2, v3, :cond_37

    .line 490
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 491
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getColumn()I

    move-result p1

    add-int/2addr p1, v5

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/core/ListItemParser;->continueAtColumn(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 493
    :cond_37
    iget-object v3, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-static {v3, v7, p1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->parseListMarker(Lcom/vladsch/flexmark/parser/ListOptions;ILcom/vladsch/flexmark/parser/block/ParserState;)Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;

    move-result-object v3

    if-le v2, v5, :cond_3b

    if-eqz v3, :cond_3a

    .line 498
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getActiveBlockParser()Lcom/vladsch/flexmark/parser/block/BlockParser;

    move-result-object v4

    .line 499
    invoke-interface {v4}, Lcom/vladsch/flexmark/parser/block/BlockParser;->isParagraphParser()Z

    move-result v6

    if-eqz v6, :cond_39

    .line 500
    invoke-interface {v4}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v6

    invoke-virtual {v6}, Lcom/vladsch/flexmark/util/ast/Block;->getParent()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v6

    instance-of v6, v6, Lcom/vladsch/flexmark/ast/ListItem;

    if-eqz v6, :cond_39

    invoke-interface {v4}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v6

    invoke-interface {v4}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/ast/Block;->getParent()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/ast/Block;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v4

    if-ne v6, v4, :cond_39

    .line 502
    iget-object v4, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    iget-object v6, v3, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->listBlock:Lcom/vladsch/flexmark/ast/ListBlock;

    iget-boolean v7, v3, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->isEmpty:Z

    .line 503
    invoke-virtual {v4, v6, v7, v1}, Lcom/vladsch/flexmark/parser/ListOptions;->canInterrupt(Lcom/vladsch/flexmark/ast/ListBlock;ZZ)Z

    move-result v1

    if-eqz v1, :cond_38

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    iget-object v4, v3, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->listBlock:Lcom/vladsch/flexmark/ast/ListBlock;

    iget-boolean v3, v3, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->isEmpty:Z

    .line 504
    invoke-virtual {v1, v4, v3}, Lcom/vladsch/flexmark/parser/ListOptions;->canStartSubList(Lcom/vladsch/flexmark/ast/ListBlock;Z)Z

    move-result v1

    if-nez v1, :cond_39

    .line 506
    :cond_38
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledLineSkipActive(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 507
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getColumn()I

    move-result p1

    add-int/2addr p1, v2

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/core/ListItemParser;->continueAtColumn(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 510
    :cond_39
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledNewListLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 511
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getColumn()I

    move-result p1

    add-int/2addr p1, v5

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/core/ListItemParser;->continueAtColumn(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 515
    :cond_3a
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 516
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getColumn()I

    move-result p1

    add-int/2addr p1, v5

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/core/ListItemParser;->continueAtColumn(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    :cond_3b
    if-le v2, v6, :cond_3f

    if-eqz v3, :cond_3e

    .line 523
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getActiveBlockParser()Lcom/vladsch/flexmark/parser/block/BlockParser;

    move-result-object v4

    .line 524
    invoke-interface {v4}, Lcom/vladsch/flexmark/parser/block/BlockParser;->isParagraphParser()Z

    move-result v5

    if-eqz v5, :cond_3d

    .line 525
    invoke-interface {v4}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vladsch/flexmark/util/ast/Block;->getParent()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v5

    instance-of v5, v5, Lcom/vladsch/flexmark/ast/ListItem;

    if-eqz v5, :cond_3d

    invoke-interface {v4}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v5

    invoke-interface {v4}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/ast/Block;->getParent()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/ast/Block;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v4

    if-ne v5, v4, :cond_3d

    .line 527
    iget-object v4, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    iget-object v5, v3, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->listBlock:Lcom/vladsch/flexmark/ast/ListBlock;

    iget-boolean v6, v3, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->isEmpty:Z

    .line 528
    invoke-virtual {v4, v5, v6, v1}, Lcom/vladsch/flexmark/parser/ListOptions;->canInterrupt(Lcom/vladsch/flexmark/ast/ListBlock;ZZ)Z

    move-result v1

    if-eqz v1, :cond_3c

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    iget-object v4, v3, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->listBlock:Lcom/vladsch/flexmark/ast/ListBlock;

    iget-boolean v3, v3, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->isEmpty:Z

    .line 529
    invoke-virtual {v1, v4, v3}, Lcom/vladsch/flexmark/parser/ListOptions;->canStartSubList(Lcom/vladsch/flexmark/ast/ListBlock;Z)Z

    move-result v1

    if-nez v1, :cond_3d

    .line 531
    :cond_3c
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledLineSkipActive(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 532
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getColumn()I

    move-result p1

    add-int/2addr p1, v2

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/core/ListItemParser;->continueAtColumn(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 535
    :cond_3d
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledNewListLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 536
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getColumn()I

    move-result p1

    add-int/2addr p1, v2

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/core/ListItemParser;->continueAtColumn(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 540
    :cond_3e
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 541
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getColumn()I

    move-result p1

    add-int/2addr p1, v2

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/core/ListItemParser;->continueAtColumn(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    :cond_3f
    if-eqz v3, :cond_45

    .line 546
    iget-object v4, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v4}, Lcom/vladsch/flexmark/parser/ListOptions;->isItemTypeMismatchToNewList()Z

    move-result v4

    if-eqz v4, :cond_40

    iget-object v4, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v4}, Lcom/vladsch/flexmark/parser/ListOptions;->isItemTypeMismatchToSubList()Z

    move-result v4

    if-eqz v4, :cond_40

    iget-boolean v4, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myHadBlankLine:Z

    if-eqz v4, :cond_40

    goto :goto_5

    .line 547
    :cond_40
    iget-object v4, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->getBlock()Lcom/vladsch/flexmark/ast/ListBlock;

    move-result-object v5

    iget-object v6, v3, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->listBlock:Lcom/vladsch/flexmark/ast/ListBlock;

    invoke-virtual {v4, v5, v6}, Lcom/vladsch/flexmark/parser/ListOptions;->startSubList(Lcom/vladsch/flexmark/ast/ListBlock;Lcom/vladsch/flexmark/ast/ListBlock;)Z

    move-result v4

    if-eqz v4, :cond_41

    .line 549
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledNewListLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 550
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getColumn()I

    move-result p1

    add-int/2addr p1, v2

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/core/ListItemParser;->continueAtColumn(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 552
    :cond_41
    :goto_5
    iget-object v4, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->getBlock()Lcom/vladsch/flexmark/ast/ListBlock;

    move-result-object v5

    iget-object v6, v3, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->listBlock:Lcom/vladsch/flexmark/ast/ListBlock;

    invoke-virtual {v4, v5, v6}, Lcom/vladsch/flexmark/parser/ListOptions;->startNewList(Lcom/vladsch/flexmark/ast/ListBlock;Lcom/vladsch/flexmark/ast/ListBlock;)Z

    move-result v4

    if-eqz v4, :cond_42

    .line 554
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledNewListLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 555
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockContinue;->none()Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 557
    :cond_42
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getActiveBlockParser()Lcom/vladsch/flexmark/parser/block/BlockParser;

    move-result-object v4

    .line 558
    invoke-interface {v4}, Lcom/vladsch/flexmark/parser/block/BlockParser;->isParagraphParser()Z

    move-result v5

    if-eqz v5, :cond_44

    .line 559
    invoke-interface {v4}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vladsch/flexmark/util/ast/Block;->getParent()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v5

    instance-of v5, v5, Lcom/vladsch/flexmark/ast/ListItem;

    if-eqz v5, :cond_44

    invoke-interface {v4}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v5

    invoke-interface {v4}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/ast/Block;->getParent()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/ast/Block;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v4

    if-ne v5, v4, :cond_44

    .line 561
    iget-object v4, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    iget-object v5, v3, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->listBlock:Lcom/vladsch/flexmark/ast/ListBlock;

    iget-boolean v6, v3, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->isEmpty:Z

    .line 562
    invoke-virtual {v4, v5, v6, v1}, Lcom/vladsch/flexmark/parser/ListOptions;->canInterrupt(Lcom/vladsch/flexmark/ast/ListBlock;ZZ)Z

    move-result v1

    if-eqz v1, :cond_43

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/ListItemParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    iget-object v4, v3, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->listBlock:Lcom/vladsch/flexmark/ast/ListBlock;

    iget-boolean v3, v3, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->isEmpty:Z

    .line 563
    invoke-virtual {v1, v4, v3}, Lcom/vladsch/flexmark/parser/ListOptions;->canStartSubList(Lcom/vladsch/flexmark/ast/ListBlock;Z)Z

    move-result v1

    if-nez v1, :cond_44

    .line 565
    :cond_43
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledLineSkipActive(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 566
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getColumn()I

    move-result p1

    add-int/2addr p1, v2

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/core/ListItemParser;->continueAtColumn(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 569
    :cond_44
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setItemHandledNewItemLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 570
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockContinue;->none()Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1

    .line 580
    :cond_45
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockContinue;->none()Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1
.end method
