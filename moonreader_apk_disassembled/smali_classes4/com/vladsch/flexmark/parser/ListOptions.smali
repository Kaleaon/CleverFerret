.class public Lcom/vladsch/flexmark/parser/ListOptions;
.super Ljava/lang/Object;
.source "ListOptions.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/options/MutableDataSetter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;,
        Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;
    }
.end annotation


# instance fields
.field protected autoLoose:Z

.field protected autoLooseOneLevelLists:Z

.field protected codeIndent:I

.field protected delimiterMismatchToNewList:Z

.field protected endOnDoubleBlank:Z

.field protected itemContentAfterSuffix:Z

.field protected itemIndent:I

.field protected itemInterrupt:Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;

.field protected itemMarkerSpace:Z

.field protected itemMarkerSuffixes:[Ljava/lang/String;

.field protected itemPrefixChars:Ljava/lang/String;

.field protected itemTypeMismatchToNewList:Z

.field protected itemTypeMismatchToSubList:Z

.field protected looseWhenBlankLineFollowsItemParagraph:Z

.field protected looseWhenContainsBlankLine:Z

.field protected looseWhenHasLooseSubItem:Z

.field protected looseWhenHasNonListChildren:Z

.field protected looseWhenHasTrailingBlankLine:Z

.field protected looseWhenLastItemPrevHasTrailingBlankLine:Z

.field protected looseWhenPrevHasTrailingBlankLine:Z

.field protected myParserEmulationProfile:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

.field protected newItemCodeIndent:I

.field protected numberedItemMarkerSuffixed:Z

.field protected orderedItemDotOnly:Z

.field protected orderedListManualStart:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    const/4 v0, 0x0

    .line 40
    move-object v1, v0

    check-cast v1, Lcom/vladsch/flexmark/util/options/DataHolder;

    invoke-direct {p0, v0}, Lcom/vladsch/flexmark/parser/ListOptions;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    return-void
.end method

.method constructor <init>(Lcom/vladsch/flexmark/parser/ListOptions;)V
    .locals 2

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/ListOptions;->getParserEmulationProfile()Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    move-result-object v0

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->myParserEmulationProfile:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    .line 75
    new-instance v0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/ListOptions;->getItemInterrupt()Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;-><init>(Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemInterrupt:Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;

    .line 77
    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/ListOptions;->isAutoLoose()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->autoLoose:Z

    .line 78
    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/ListOptions;->isAutoLooseOneLevelLists()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->autoLooseOneLevelLists:Z

    .line 79
    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/ListOptions;->isDelimiterMismatchToNewList()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->delimiterMismatchToNewList:Z

    .line 80
    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/ListOptions;->isEndOnDoubleBlank()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->endOnDoubleBlank:Z

    .line 81
    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/ListOptions;->isItemMarkerSpace()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemMarkerSpace:Z

    .line 82
    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/ListOptions;->isItemTypeMismatchToNewList()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemTypeMismatchToNewList:Z

    .line 83
    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/ListOptions;->isItemTypeMismatchToSubList()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemTypeMismatchToSubList:Z

    .line 84
    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/ListOptions;->isLooseWhenPrevHasTrailingBlankLine()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenPrevHasTrailingBlankLine:Z

    .line 85
    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/ListOptions;->isLooseWhenLastItemPrevHasTrailingBlankLine()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenLastItemPrevHasTrailingBlankLine:Z

    .line 86
    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/ListOptions;->isLooseWhenHasNonListChildren()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenHasNonListChildren:Z

    .line 87
    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/ListOptions;->isLooseWhenBlankLineFollowsItemParagraph()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenBlankLineFollowsItemParagraph:Z

    .line 88
    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/ListOptions;->isLooseWhenHasLooseSubItem()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenHasLooseSubItem:Z

    .line 89
    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/ListOptions;->isLooseWhenHasTrailingBlankLine()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenHasTrailingBlankLine:Z

    .line 90
    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/ListOptions;->isLooseWhenContainsBlankLine()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenContainsBlankLine:Z

    .line 91
    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/ListOptions;->isNumberedItemMarkerSuffixed()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->numberedItemMarkerSuffixed:Z

    .line 92
    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/ListOptions;->isOrderedItemDotOnly()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->orderedItemDotOnly:Z

    .line 93
    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/ListOptions;->isOrderedListManualStart()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->orderedListManualStart:Z

    .line 94
    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/ListOptions;->isItemContentAfterSuffix()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemContentAfterSuffix:Z

    .line 95
    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/ListOptions;->getItemPrefixChars()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemPrefixChars:Ljava/lang/String;

    .line 97
    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/ListOptions;->getCodeIndent()I

    move-result v0

    iput v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->codeIndent:I

    .line 98
    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/ListOptions;->getItemIndent()I

    move-result v0

    iput v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemIndent:I

    .line 99
    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/ListOptions;->getNewItemCodeIndent()I

    move-result v0

    iput v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->newItemCodeIndent:I

    .line 100
    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/ListOptions;->getItemMarkerSuffixes()[Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemMarkerSuffixes:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 1

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->PARSER_EMULATION_PROFILE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->myParserEmulationProfile:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    .line 45
    new-instance v0, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemInterrupt:Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;

    .line 47
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_AUTO_LOOSE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->autoLoose:Z

    .line 48
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_AUTO_LOOSE_ONE_LEVEL_LISTS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->autoLooseOneLevelLists:Z

    .line 49
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_DELIMITER_MISMATCH_TO_NEW_LIST:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->delimiterMismatchToNewList:Z

    .line 50
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_END_ON_DOUBLE_BLANK:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->endOnDoubleBlank:Z

    .line 51
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ITEM_MARKER_SPACE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemMarkerSpace:Z

    .line 52
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ITEM_TYPE_MISMATCH_TO_NEW_LIST:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemTypeMismatchToNewList:Z

    .line 53
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ITEM_TYPE_MISMATCH_TO_SUB_LIST:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemTypeMismatchToSubList:Z

    .line 54
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_LOOSE_WHEN_PREV_HAS_TRAILING_BLANK_LINE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenPrevHasTrailingBlankLine:Z

    .line 55
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_LOOSE_WHEN_LAST_ITEM_PREV_HAS_TRAILING_BLANK_LINE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenLastItemPrevHasTrailingBlankLine:Z

    .line 56
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_LOOSE_WHEN_HAS_NON_LIST_CHILDREN:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenHasNonListChildren:Z

    .line 57
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_LOOSE_WHEN_BLANK_LINE_FOLLOWS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenBlankLineFollowsItemParagraph:Z

    .line 58
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_LOOSE_WHEN_HAS_LOOSE_SUB_ITEM:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenHasLooseSubItem:Z

    .line 59
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_LOOSE_WHEN_HAS_TRAILING_BLANK_LINE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenHasTrailingBlankLine:Z

    .line 60
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_LOOSE_WHEN_CONTAINS_BLANK_LINE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenContainsBlankLine:Z

    .line 61
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_NUMBERED_ITEM_MARKER_SUFFIXED:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->numberedItemMarkerSuffixed:Z

    .line 62
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ORDERED_ITEM_DOT_ONLY:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->orderedItemDotOnly:Z

    .line 63
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ORDERED_LIST_MANUAL_START:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->orderedListManualStart:Z

    .line 64
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ITEM_CONTENT_AFTER_SUFFIX:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemContentAfterSuffix:Z

    .line 65
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ITEM_PREFIX_CHARS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemPrefixChars:Ljava/lang/String;

    .line 67
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_CODE_INDENT:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->codeIndent:I

    .line 68
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ITEM_INDENT:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemIndent:I

    .line 69
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_NEW_ITEM_CODE_INDENT:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->newItemCodeIndent:I

    .line 70
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ITEM_MARKER_SUFFIXES:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    iput-object p1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemMarkerSuffixes:[Ljava/lang/String;

    return-void
.end method

.method public static varargs addItemMarkerSuffixes(Lcom/vladsch/flexmark/util/options/MutableDataHolder;[Ljava/lang/String;)V
    .locals 9

    .line 212
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ITEM_MARKER_SUFFIXES:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p0}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    .line 213
    array-length v1, p1

    .line 215
    array-length v2, p1

    .line 216
    array-length v3, v0

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v3, :cond_3

    aget-object v6, v0, v5

    const/4 v7, 0x0

    :goto_1
    if-ge v7, v2, :cond_1

    .line 218
    aget-object v8, p1, v7

    if-eqz v8, :cond_0

    .line 219
    invoke-virtual {v8, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    add-int/lit8 v1, v1, -0x1

    const/4 v6, 0x0

    .line 221
    aput-object v6, p1, v7

    goto :goto_2

    :cond_0
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    :cond_1
    :goto_2
    if-nez v1, :cond_2

    goto :goto_3

    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_3
    :goto_3
    if-lez v1, :cond_6

    .line 230
    array-length v2, v0

    add-int/2addr v2, v1

    new-array v1, v2, [Ljava/lang/String;

    .line 231
    array-length v2, v0

    invoke-static {v0, v4, v1, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 233
    array-length v0, v0

    .line 234
    array-length v2, p1

    :goto_4
    if-ge v4, v2, :cond_5

    aget-object v3, p1, v4

    if-eqz v3, :cond_4

    add-int/lit8 v5, v0, 0x1

    .line 236
    aput-object v3, v1, v0

    move v0, v5

    :cond_4
    add-int/lit8 v4, v4, 0x1

    goto :goto_4

    .line 239
    :cond_5
    sget-object p1, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ITEM_MARKER_SUFFIXES:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p0, p1, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    :cond_6
    return-void
.end method

.method public static getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/parser/ListOptions;
    .locals 1

    .line 104
    new-instance v0, Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-direct {v0, p0}, Lcom/vladsch/flexmark/parser/ListOptions;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    return-object v0
.end method

.method public static getNew(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/parser/ListOptions;
    .locals 1

    .line 108
    new-instance v0, Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-direct {v0, p0}, Lcom/vladsch/flexmark/parser/ListOptions;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    return-object v0
.end method


# virtual methods
.method public canInterrupt(Lcom/vladsch/flexmark/ast/ListBlock;ZZ)Z
    .locals 3

    .line 140
    instance-of v0, p1, Lcom/vladsch/flexmark/ast/OrderedList;

    if-eqz v0, :cond_0

    .line 141
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/ListOptions;->isOrderedListManualStart()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    check-cast p1, Lcom/vladsch/flexmark/ast/OrderedList;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/OrderedList;->getStartNumber()I

    move-result p1

    if-ne p1, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 143
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/ListOptions;->getItemInterrupt()Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;

    move-result-object p1

    invoke-virtual {p1, v0, v2, p2, p3}, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->canInterrupt(ZZZZ)Z

    move-result p1

    return p1
.end method

.method public canStartSubList(Lcom/vladsch/flexmark/ast/ListBlock;Z)Z
    .locals 3

    .line 147
    instance-of v0, p1, Lcom/vladsch/flexmark/ast/OrderedList;

    if-eqz v0, :cond_0

    .line 148
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/ListOptions;->isOrderedListManualStart()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    check-cast p1, Lcom/vladsch/flexmark/ast/OrderedList;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/OrderedList;->getStartNumber()I

    move-result p1

    if-ne p1, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 150
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/ListOptions;->getItemInterrupt()Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;

    move-result-object p1

    invoke-virtual {p1, v0, v2, p2}, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->canStartSubList(ZZZ)Z

    move-result p1

    return p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    if-ne p0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    .line 590
    :cond_0
    instance-of v0, p1, Lcom/vladsch/flexmark/parser/ListOptions;

    const/4 v1, 0x0

    if-nez v0, :cond_1

    return v1

    .line 592
    :cond_1
    check-cast p1, Lcom/vladsch/flexmark/parser/ListOptions;

    .line 594
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->myParserEmulationProfile:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    iget-object v2, p1, Lcom/vladsch/flexmark/parser/ListOptions;->myParserEmulationProfile:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    if-eq v0, v2, :cond_2

    return v1

    .line 595
    :cond_2
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->autoLoose:Z

    iget-boolean v2, p1, Lcom/vladsch/flexmark/parser/ListOptions;->autoLoose:Z

    if-eq v0, v2, :cond_3

    return v1

    .line 596
    :cond_3
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->autoLooseOneLevelLists:Z

    iget-boolean v2, p1, Lcom/vladsch/flexmark/parser/ListOptions;->autoLooseOneLevelLists:Z

    if-eq v0, v2, :cond_4

    return v1

    .line 597
    :cond_4
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->delimiterMismatchToNewList:Z

    iget-boolean v2, p1, Lcom/vladsch/flexmark/parser/ListOptions;->delimiterMismatchToNewList:Z

    if-eq v0, v2, :cond_5

    return v1

    .line 598
    :cond_5
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->endOnDoubleBlank:Z

    iget-boolean v2, p1, Lcom/vladsch/flexmark/parser/ListOptions;->endOnDoubleBlank:Z

    if-eq v0, v2, :cond_6

    return v1

    .line 599
    :cond_6
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemMarkerSpace:Z

    iget-boolean v2, p1, Lcom/vladsch/flexmark/parser/ListOptions;->itemMarkerSpace:Z

    if-eq v0, v2, :cond_7

    return v1

    .line 600
    :cond_7
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemTypeMismatchToNewList:Z

    iget-boolean v2, p1, Lcom/vladsch/flexmark/parser/ListOptions;->itemTypeMismatchToNewList:Z

    if-eq v0, v2, :cond_8

    return v1

    .line 601
    :cond_8
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemTypeMismatchToSubList:Z

    iget-boolean v2, p1, Lcom/vladsch/flexmark/parser/ListOptions;->itemTypeMismatchToSubList:Z

    if-eq v0, v2, :cond_9

    return v1

    .line 602
    :cond_9
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenPrevHasTrailingBlankLine:Z

    iget-boolean v2, p1, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenPrevHasTrailingBlankLine:Z

    if-eq v0, v2, :cond_a

    return v1

    .line 603
    :cond_a
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenLastItemPrevHasTrailingBlankLine:Z

    iget-boolean v2, p1, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenLastItemPrevHasTrailingBlankLine:Z

    if-eq v0, v2, :cond_b

    return v1

    .line 604
    :cond_b
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenHasNonListChildren:Z

    iget-boolean v2, p1, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenHasNonListChildren:Z

    if-eq v0, v2, :cond_c

    return v1

    .line 605
    :cond_c
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenBlankLineFollowsItemParagraph:Z

    iget-boolean v2, p1, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenBlankLineFollowsItemParagraph:Z

    if-eq v0, v2, :cond_d

    return v1

    .line 606
    :cond_d
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenHasLooseSubItem:Z

    iget-boolean v2, p1, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenHasLooseSubItem:Z

    if-eq v0, v2, :cond_e

    return v1

    .line 607
    :cond_e
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenHasTrailingBlankLine:Z

    iget-boolean v2, p1, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenHasTrailingBlankLine:Z

    if-eq v0, v2, :cond_f

    return v1

    .line 608
    :cond_f
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenContainsBlankLine:Z

    iget-boolean v2, p1, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenContainsBlankLine:Z

    if-eq v0, v2, :cond_10

    return v1

    .line 609
    :cond_10
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->numberedItemMarkerSuffixed:Z

    iget-boolean v2, p1, Lcom/vladsch/flexmark/parser/ListOptions;->numberedItemMarkerSuffixed:Z

    if-eq v0, v2, :cond_11

    return v1

    .line 610
    :cond_11
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->orderedItemDotOnly:Z

    iget-boolean v2, p1, Lcom/vladsch/flexmark/parser/ListOptions;->orderedItemDotOnly:Z

    if-eq v0, v2, :cond_12

    return v1

    .line 611
    :cond_12
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->orderedListManualStart:Z

    iget-boolean v2, p1, Lcom/vladsch/flexmark/parser/ListOptions;->orderedListManualStart:Z

    if-eq v0, v2, :cond_13

    return v1

    .line 612
    :cond_13
    iget v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->codeIndent:I

    iget v2, p1, Lcom/vladsch/flexmark/parser/ListOptions;->codeIndent:I

    if-eq v0, v2, :cond_14

    return v1

    .line 613
    :cond_14
    iget v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemIndent:I

    iget v2, p1, Lcom/vladsch/flexmark/parser/ListOptions;->itemIndent:I

    if-eq v0, v2, :cond_15

    return v1

    .line 614
    :cond_15
    iget v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->newItemCodeIndent:I

    iget v2, p1, Lcom/vladsch/flexmark/parser/ListOptions;->newItemCodeIndent:I

    if-eq v0, v2, :cond_16

    return v1

    .line 615
    :cond_16
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemMarkerSuffixes:[Ljava/lang/String;

    iget-object v2, p1, Lcom/vladsch/flexmark/parser/ListOptions;->itemMarkerSuffixes:[Ljava/lang/String;

    if-eq v0, v2, :cond_17

    return v1

    .line 616
    :cond_17
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemContentAfterSuffix:Z

    iget-boolean v2, p1, Lcom/vladsch/flexmark/parser/ListOptions;->itemContentAfterSuffix:Z

    if-eq v0, v2, :cond_18

    return v1

    .line 617
    :cond_18
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemPrefixChars:Ljava/lang/String;

    iget-object v2, p1, Lcom/vladsch/flexmark/parser/ListOptions;->itemPrefixChars:Ljava/lang/String;

    if-eq v0, v2, :cond_19

    return v1

    .line 618
    :cond_19
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemInterrupt:Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;

    iget-object p1, p1, Lcom/vladsch/flexmark/parser/ListOptions;->itemInterrupt:Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public getCodeIndent()I
    .locals 1

    .line 328
    iget v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->codeIndent:I

    return v0
.end method

.method public getItemIndent()I
    .locals 1

    .line 332
    iget v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemIndent:I

    return v0
.end method

.method public getItemInterrupt()Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;
    .locals 1

    .line 248
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemInterrupt:Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;

    return-object v0
.end method

.method public getItemMarkerSuffixes()[Ljava/lang/String;
    .locals 1

    .line 340
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemMarkerSuffixes:[Ljava/lang/String;

    return-object v0
.end method

.method public getItemPrefixChars()Ljava/lang/String;
    .locals 1

    .line 280
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemPrefixChars:Ljava/lang/String;

    return-object v0
.end method

.method public getMutable()Lcom/vladsch/flexmark/parser/MutableListOptions;
    .locals 1

    .line 176
    new-instance v0, Lcom/vladsch/flexmark/parser/MutableListOptions;

    invoke-direct {v0, p0}, Lcom/vladsch/flexmark/parser/MutableListOptions;-><init>(Lcom/vladsch/flexmark/parser/ListOptions;)V

    return-object v0
.end method

.method public getNewItemCodeIndent()I
    .locals 1

    .line 336
    iget v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->newItemCodeIndent:I

    return v0
.end method

.method public getParserEmulationProfile()Lcom/vladsch/flexmark/parser/ParserEmulationProfile;
    .locals 1

    .line 244
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->myParserEmulationProfile:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .line 623
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->myParserEmulationProfile:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    .line 624
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemInterrupt:Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 625
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->autoLoose:Z

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 626
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->autoLooseOneLevelLists:Z

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 627
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->delimiterMismatchToNewList:Z

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 628
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->endOnDoubleBlank:Z

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 629
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemMarkerSpace:Z

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 630
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemTypeMismatchToNewList:Z

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 631
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemTypeMismatchToSubList:Z

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 632
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenPrevHasTrailingBlankLine:Z

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 633
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenLastItemPrevHasTrailingBlankLine:Z

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 634
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenHasNonListChildren:Z

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 635
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenBlankLineFollowsItemParagraph:Z

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 636
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenHasLooseSubItem:Z

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 637
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenHasTrailingBlankLine:Z

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 638
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenContainsBlankLine:Z

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 639
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->numberedItemMarkerSuffixed:Z

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 640
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->orderedItemDotOnly:Z

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 641
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->orderedListManualStart:Z

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 642
    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemContentAfterSuffix:Z

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 643
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemPrefixChars:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 644
    iget v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->codeIndent:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 645
    iget v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemIndent:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 646
    iget v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->newItemCodeIndent:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 647
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemMarkerSuffixes:[Ljava/lang/String;

    invoke-static {v1}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public isAutoLoose()Z
    .locals 1

    .line 252
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->autoLoose:Z

    return v0
.end method

.method public isAutoLooseOneLevelLists()Z
    .locals 1

    .line 256
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->autoLooseOneLevelLists:Z

    return v0
.end method

.method public isDelimiterMismatchToNewList()Z
    .locals 1

    .line 260
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->delimiterMismatchToNewList:Z

    return v0
.end method

.method public isEndOnDoubleBlank()Z
    .locals 1

    .line 264
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->endOnDoubleBlank:Z

    return v0
.end method

.method public isInTightListItem(Lcom/vladsch/flexmark/ast/Paragraph;)Z
    .locals 4

    .line 126
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Paragraph;->getParent()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v0

    .line 127
    instance-of v1, v0, Lcom/vladsch/flexmark/ast/ListItem;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    return v2

    .line 129
    :cond_0
    check-cast v0, Lcom/vladsch/flexmark/ast/ListItem;

    .line 130
    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/ast/ListItem;->isItemParagraph(Lcom/vladsch/flexmark/ast/Paragraph;)Z

    move-result v1

    if-nez v1, :cond_1

    return v2

    .line 132
    :cond_1
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/ListOptions;->isAutoLoose()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 133
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/ListOptions;->isAutoLooseOneLevelLists()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 134
    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/parser/ListOptions;->isTightListItem(Lcom/vladsch/flexmark/ast/ListItem;)Z

    move-result p1

    return p1

    :cond_2
    if-nez v1, :cond_3

    .line 136
    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/ast/ListItem;->isParagraphInTightListItem(Lcom/vladsch/flexmark/ast/Paragraph;)Z

    move-result p1

    if-nez p1, :cond_4

    :cond_3
    if-eqz v1, :cond_5

    invoke-virtual {v0}, Lcom/vladsch/flexmark/ast/ListItem;->isInTightList()Z

    move-result p1

    if-eqz p1, :cond_5

    :cond_4
    const/4 p1, 0x1

    return p1

    :cond_5
    return v2
.end method

.method public isItemContentAfterSuffix()Z
    .locals 1

    .line 276
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemContentAfterSuffix:Z

    return v0
.end method

.method public isItemMarkerSpace()Z
    .locals 1

    .line 268
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemMarkerSpace:Z

    return v0
.end method

.method public isItemTypeMismatchToNewList()Z
    .locals 1

    .line 272
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemTypeMismatchToNewList:Z

    return v0
.end method

.method public isItemTypeMismatchToSubList()Z
    .locals 1

    .line 284
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemTypeMismatchToSubList:Z

    return v0
.end method

.method public isLooseWhenBlankLineFollowsItemParagraph()Z
    .locals 1

    .line 312
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenBlankLineFollowsItemParagraph:Z

    return v0
.end method

.method public isLooseWhenContainsBlankLine()Z
    .locals 1

    .line 308
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenContainsBlankLine:Z

    return v0
.end method

.method public isLooseWhenHasLooseSubItem()Z
    .locals 1

    .line 300
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenHasLooseSubItem:Z

    return v0
.end method

.method public isLooseWhenHasNonListChildren()Z
    .locals 1

    .line 296
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenHasNonListChildren:Z

    return v0
.end method

.method public isLooseWhenHasTrailingBlankLine()Z
    .locals 1

    .line 304
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenHasTrailingBlankLine:Z

    return v0
.end method

.method public isLooseWhenLastItemPrevHasTrailingBlankLine()Z
    .locals 1

    .line 292
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenLastItemPrevHasTrailingBlankLine:Z

    return v0
.end method

.method public isLooseWhenPrevHasTrailingBlankLine()Z
    .locals 1

    .line 288
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenPrevHasTrailingBlankLine:Z

    return v0
.end method

.method public isNumberedItemMarkerSuffixed()Z
    .locals 1

    .line 324
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->numberedItemMarkerSuffixed:Z

    return v0
.end method

.method public isOrderedItemDotOnly()Z
    .locals 1

    .line 316
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->orderedItemDotOnly:Z

    return v0
.end method

.method public isOrderedListManualStart()Z
    .locals 1

    .line 320
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/ListOptions;->orderedListManualStart:Z

    return v0
.end method

.method public isTightListItem(Lcom/vladsch/flexmark/ast/ListItem;)Z
    .locals 4

    .line 112
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/ListItem;->isLoose()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 116
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/ListOptions;->isAutoLoose()Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_5

    .line 117
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/ListOptions;->isAutoLooseOneLevelLists()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 118
    new-array v0, v2, [Ljava/lang/Class;

    const-class v3, Lcom/vladsch/flexmark/ast/ListItem;

    aput-object v3, v0, v1

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/ast/ListItem;->getAncestorOfType([Ljava/lang/Class;)Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    if-nez v0, :cond_1

    new-array v0, v2, [Ljava/lang/Class;

    const-class v3, Lcom/vladsch/flexmark/ast/ListBlock;

    aput-object v3, v0, v1

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/ast/ListItem;->getChildOfType([Ljava/lang/Class;)Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 119
    :goto_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/ListItem;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v3

    if-eqz v3, :cond_4

    if-nez v0, :cond_2

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/ListItem;->isTight()Z

    move-result v3

    if-nez v3, :cond_4

    :cond_2
    if-eqz v0, :cond_3

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/ListItem;->isInTightList()Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_1

    :cond_3
    return v1

    :cond_4
    :goto_1
    return v2

    .line 121
    :cond_5
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/ListItem;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v3

    if-eqz v3, :cond_8

    if-nez v0, :cond_6

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/ListItem;->isTight()Z

    move-result v3

    if-nez v3, :cond_8

    :cond_6
    if-eqz v0, :cond_7

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/ListItem;->isInTightList()Z

    move-result p1

    if-eqz p1, :cond_7

    goto :goto_2

    :cond_7
    return v1

    :cond_8
    :goto_2
    return v2
.end method

.method public setIn(Lcom/vladsch/flexmark/util/options/MutableDataHolder;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;
    .locals 2

    .line 180
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->PARSER_EMULATION_PROFILE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/ListOptions;->getParserEmulationProfile()Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 181
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/ListOptions;->getItemInterrupt()Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/parser/ListOptions$ItemInterrupt;->setIn(Lcom/vladsch/flexmark/util/options/MutableDataHolder;)V

    .line 183
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_AUTO_LOOSE:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->autoLoose:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 184
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_AUTO_LOOSE_ONE_LEVEL_LISTS:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->autoLooseOneLevelLists:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 185
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_DELIMITER_MISMATCH_TO_NEW_LIST:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->delimiterMismatchToNewList:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 186
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_END_ON_DOUBLE_BLANK:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->endOnDoubleBlank:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 187
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ITEM_MARKER_SPACE:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemMarkerSpace:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 188
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ITEM_TYPE_MISMATCH_TO_NEW_LIST:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemTypeMismatchToNewList:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 189
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ITEM_TYPE_MISMATCH_TO_SUB_LIST:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemTypeMismatchToSubList:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 190
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_LOOSE_WHEN_PREV_HAS_TRAILING_BLANK_LINE:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenPrevHasTrailingBlankLine:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 191
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_LOOSE_WHEN_LAST_ITEM_PREV_HAS_TRAILING_BLANK_LINE:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenLastItemPrevHasTrailingBlankLine:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 192
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_LOOSE_WHEN_HAS_NON_LIST_CHILDREN:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenHasNonListChildren:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 193
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_LOOSE_WHEN_BLANK_LINE_FOLLOWS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenBlankLineFollowsItemParagraph:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 194
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_LOOSE_WHEN_HAS_LOOSE_SUB_ITEM:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenHasLooseSubItem:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 195
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_LOOSE_WHEN_HAS_TRAILING_BLANK_LINE:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenHasTrailingBlankLine:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 196
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_LOOSE_WHEN_CONTAINS_BLANK_LINE:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->looseWhenContainsBlankLine:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 197
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_NUMBERED_ITEM_MARKER_SUFFIXED:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->numberedItemMarkerSuffixed:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 198
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ORDERED_ITEM_DOT_ONLY:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->orderedItemDotOnly:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 199
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ORDERED_LIST_MANUAL_START:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->orderedListManualStart:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 201
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_CODE_INDENT:Lcom/vladsch/flexmark/util/options/DataKey;

    iget v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->codeIndent:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 202
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ITEM_INDENT:Lcom/vladsch/flexmark/util/options/DataKey;

    iget v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemIndent:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 203
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_NEW_ITEM_CODE_INDENT:Lcom/vladsch/flexmark/util/options/DataKey;

    iget v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->newItemCodeIndent:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 204
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ITEM_MARKER_SUFFIXES:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemMarkerSuffixes:[Ljava/lang/String;

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 205
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ITEM_CONTENT_AFTER_SUFFIX:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-boolean v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemContentAfterSuffix:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 206
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ITEM_PREFIX_CHARS:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/ListOptions;->itemPrefixChars:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    return-object p1
.end method

.method public startNewList(Lcom/vladsch/flexmark/ast/ListBlock;Lcom/vladsch/flexmark/ast/ListBlock;)Z
    .locals 3

    .line 154
    instance-of v0, p1, Lcom/vladsch/flexmark/ast/OrderedList;

    .line 155
    instance-of v1, p2, Lcom/vladsch/flexmark/ast/OrderedList;

    if-ne v0, v1, :cond_3

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    .line 159
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/ListOptions;->isDelimiterMismatchToNewList()Z

    move-result v0

    if-eqz v0, :cond_0

    check-cast p1, Lcom/vladsch/flexmark/ast/OrderedList;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/OrderedList;->getDelimiter()C

    move-result p1

    check-cast p2, Lcom/vladsch/flexmark/ast/OrderedList;

    invoke-virtual {p2}, Lcom/vladsch/flexmark/ast/OrderedList;->getDelimiter()C

    move-result p2

    if-eq p1, p2, :cond_0

    return v1

    :cond_0
    return v2

    .line 161
    :cond_1
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/ListOptions;->isDelimiterMismatchToNewList()Z

    move-result v0

    if-eqz v0, :cond_2

    check-cast p1, Lcom/vladsch/flexmark/ast/BulletList;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/BulletList;->getOpeningMarker()C

    move-result p1

    check-cast p2, Lcom/vladsch/flexmark/ast/BulletList;

    invoke-virtual {p2}, Lcom/vladsch/flexmark/ast/BulletList;->getOpeningMarker()C

    move-result p2

    if-eq p1, p2, :cond_2

    return v1

    :cond_2
    return v2

    .line 164
    :cond_3
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/ListOptions;->isItemTypeMismatchToNewList()Z

    move-result p1

    return p1
.end method

.method public startSubList(Lcom/vladsch/flexmark/ast/ListBlock;Lcom/vladsch/flexmark/ast/ListBlock;)Z
    .locals 0

    .line 169
    instance-of p1, p1, Lcom/vladsch/flexmark/ast/OrderedList;

    .line 170
    instance-of p2, p2, Lcom/vladsch/flexmark/ast/OrderedList;

    if-eq p1, p2, :cond_0

    .line 172
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/ListOptions;->isItemTypeMismatchToSubList()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method
