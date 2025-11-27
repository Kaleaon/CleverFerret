.class public Lcom/vladsch/flexmark/parser/MutableListOptions;
.super Lcom/vladsch/flexmark/parser/ListOptions;
.source "MutableListOptions.java"


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 8
    invoke-direct {p0}, Lcom/vladsch/flexmark/parser/ListOptions;-><init>()V

    .line 9
    new-instance v0, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    invoke-super {p0}, Lcom/vladsch/flexmark/parser/ListOptions;->getItemInterrupt()Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;-><init>(Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/MutableListOptions;->itemInterrupt:Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;

    return-void
.end method

.method constructor <init>(Lcom/vladsch/flexmark/parser/ListOptions;)V
    .locals 1

    .line 17
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/ListOptions;-><init>(Lcom/vladsch/flexmark/parser/ListOptions;)V

    .line 18
    new-instance p1, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    invoke-super {p0}, Lcom/vladsch/flexmark/parser/ListOptions;->getItemInterrupt()Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;-><init>(Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;)V

    iput-object p1, p0, Lcom/vladsch/flexmark/parser/MutableListOptions;->itemInterrupt:Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 0

    .line 13
    invoke-static {p1}, Lcom/vladsch/flexmark/parser/ListOptions;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/parser/ListOptions;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/MutableListOptions;-><init>(Lcom/vladsch/flexmark/parser/ListOptions;)V

    return-void
.end method


# virtual methods
.method public getMutable()Lcom/vladsch/flexmark/parser/MutableListOptions;
    .locals 1

    .line 22
    new-instance v0, Lcom/vladsch/flexmark/parser/MutableListOptions;

    invoke-direct {v0, p0}, Lcom/vladsch/flexmark/parser/MutableListOptions;-><init>(Lcom/vladsch/flexmark/parser/ListOptions;)V

    return-object v0
.end method

.method public setAutoLoose(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;
    .locals 0

    .line 29
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/MutableListOptions;->autoLoose:Z

    return-object p0
.end method

.method public setAutoLooseOneLevelLists(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;
    .locals 0

    .line 30
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/MutableListOptions;->autoLooseOneLevelLists:Z

    return-object p0
.end method

.method public setCodeIndent(I)Lcom/vladsch/flexmark/parser/MutableListOptions;
    .locals 0

    .line 47
    iput p1, p0, Lcom/vladsch/flexmark/parser/MutableListOptions;->codeIndent:I

    return-object p0
.end method

.method public setDelimiterMismatchToNewList(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;
    .locals 0

    .line 31
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/MutableListOptions;->delimiterMismatchToNewList:Z

    return-object p0
.end method

.method public setEndOnDoubleBlank(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;
    .locals 0

    .line 32
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/MutableListOptions;->endOnDoubleBlank:Z

    return-object p0
.end method

.method public setItemIndent(I)Lcom/vladsch/flexmark/parser/MutableListOptions;
    .locals 0

    .line 48
    iput p1, p0, Lcom/vladsch/flexmark/parser/MutableListOptions;->itemIndent:I

    return-object p0
.end method

.method public setItemInterrupt(Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;)Lcom/vladsch/flexmark/parser/MutableListOptions;
    .locals 0

    .line 27
    iput-object p1, p0, Lcom/vladsch/flexmark/parser/MutableListOptions;->itemInterrupt:Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;

    return-object p0
.end method

.method public setItemMarkerSpace(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;
    .locals 0

    .line 33
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/MutableListOptions;->itemMarkerSpace:Z

    return-object p0
.end method

.method public setItemMarkerSuffixes([Ljava/lang/String;)Lcom/vladsch/flexmark/parser/MutableListOptions;
    .locals 0

    .line 50
    iput-object p1, p0, Lcom/vladsch/flexmark/parser/MutableListOptions;->itemMarkerSuffixes:[Ljava/lang/String;

    return-object p0
.end method

.method public setItemTypeMismatchToNewList(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;
    .locals 0

    .line 34
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/MutableListOptions;->itemTypeMismatchToNewList:Z

    return-object p0
.end method

.method public setItemTypeMismatchToSubList(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;
    .locals 0

    .line 35
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/MutableListOptions;->itemTypeMismatchToSubList:Z

    return-object p0
.end method

.method public setLooseWhenBlankLineFollowsItemParagraph(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;
    .locals 0

    .line 39
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/MutableListOptions;->looseWhenBlankLineFollowsItemParagraph:Z

    return-object p0
.end method

.method public setLooseWhenContainsBlankLine(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;
    .locals 0

    .line 42
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/MutableListOptions;->looseWhenContainsBlankLine:Z

    return-object p0
.end method

.method public setLooseWhenHasLooseSubItem(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;
    .locals 0

    .line 40
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/MutableListOptions;->looseWhenHasLooseSubItem:Z

    return-object p0
.end method

.method public setLooseWhenHasNonListChildren(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;
    .locals 0

    .line 38
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/MutableListOptions;->looseWhenHasNonListChildren:Z

    return-object p0
.end method

.method public setLooseWhenHasTrailingBlankLine(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;
    .locals 0

    .line 41
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/MutableListOptions;->looseWhenHasTrailingBlankLine:Z

    return-object p0
.end method

.method public setLooseWhenLastItemPrevHasTrailingBlankLine(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;
    .locals 0

    .line 37
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/MutableListOptions;->looseWhenLastItemPrevHasTrailingBlankLine:Z

    return-object p0
.end method

.method public setLooseWhenPrevHasTrailingBlankLine(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;
    .locals 0

    .line 36
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/MutableListOptions;->looseWhenPrevHasTrailingBlankLine:Z

    return-object p0
.end method

.method public setNewItemCodeIndent(I)Lcom/vladsch/flexmark/parser/MutableListOptions;
    .locals 0

    .line 49
    iput p1, p0, Lcom/vladsch/flexmark/parser/MutableListOptions;->newItemCodeIndent:I

    return-object p0
.end method

.method public setNumberedItemMarkerSuffixed(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;
    .locals 0

    .line 43
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/MutableListOptions;->numberedItemMarkerSuffixed:Z

    return-object p0
.end method

.method public setOrderedItemDotOnly(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;
    .locals 0

    .line 44
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/MutableListOptions;->orderedItemDotOnly:Z

    return-object p0
.end method

.method public setOrderedListManualStart(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;
    .locals 0

    .line 45
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/MutableListOptions;->orderedListManualStart:Z

    return-object p0
.end method

.method public setParserEmulationFamily(Lcom/vladsch/flexmark/parser/ParserEmulationProfile;)Lcom/vladsch/flexmark/parser/MutableListOptions;
    .locals 0

    .line 26
    iput-object p1, p0, Lcom/vladsch/flexmark/parser/MutableListOptions;->myParserEmulationProfile:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    return-object p0
.end method
