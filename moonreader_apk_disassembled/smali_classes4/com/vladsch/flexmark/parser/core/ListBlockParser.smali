.class public Lcom/vladsch/flexmark/parser/core/ListBlockParser;
.super Lcom/vladsch/flexmark/parser/block/AbstractBlockParser;
.source "ListBlockParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;,
        Lcom/vladsch/flexmark/parser/core/ListBlockParser$BlockFactory;,
        Lcom/vladsch/flexmark/parser/core/ListBlockParser$Factory;
    }
.end annotation


# instance fields
.field private final myBlock:Lcom/vladsch/flexmark/ast/ListBlock;

.field private myItemHandledLine:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field private myItemHandledNewItemLine:Z

.field private myItemHandledNewListLine:Z

.field private myItemHandledSkipActiveLine:Z

.field private myLastChild:Lcom/vladsch/flexmark/parser/core/ListItemParser;

.field private final myListData:Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;

.field private final myOptions:Lcom/vladsch/flexmark/parser/ListOptions;


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/parser/ListOptions;Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;Lcom/vladsch/flexmark/parser/core/ListItemParser;)V
    .locals 1

    .line 33
    invoke-direct {p0}, Lcom/vladsch/flexmark/parser/block/AbstractBlockParser;-><init>()V

    const/4 v0, 0x0

    .line 27
    iput-object v0, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myLastChild:Lcom/vladsch/flexmark/parser/core/ListItemParser;

    .line 28
    iput-object v0, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myItemHandledLine:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 34
    iput-object p1, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    .line 35
    iput-object p2, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myListData:Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;

    .line 36
    iget-object p1, p2, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->listBlock:Lcom/vladsch/flexmark/ast/ListBlock;

    iput-object p1, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myBlock:Lcom/vladsch/flexmark/ast/ListBlock;

    const/4 p2, 0x1

    .line 37
    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/ast/ListBlock;->setTight(Z)V

    .line 38
    iput-object p3, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myLastChild:Lcom/vladsch/flexmark/parser/core/ListItemParser;

    const/4 p1, 0x0

    .line 39
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myItemHandledNewListLine:Z

    .line 40
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myItemHandledNewItemLine:Z

    .line 41
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myItemHandledSkipActiveLine:Z

    return-void
.end method

.method static synthetic access$000(Lcom/vladsch/flexmark/parser/core/ListBlockParser;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 0

    .line 23
    iget-object p0, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myItemHandledLine:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object p0
.end method

.method static synthetic access$002(Lcom/vladsch/flexmark/parser/core/ListBlockParser;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 0

    .line 23
    iput-object p1, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myItemHandledLine:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object p1
.end method

.method static synthetic access$100(Lcom/vladsch/flexmark/parser/core/ListBlockParser;)Z
    .locals 0

    .line 23
    iget-boolean p0, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myItemHandledNewListLine:Z

    return p0
.end method

.method static synthetic access$200(Lcom/vladsch/flexmark/parser/core/ListBlockParser;)Z
    .locals 0

    .line 23
    iget-boolean p0, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myItemHandledNewItemLine:Z

    return p0
.end method

.method static synthetic access$302(Lcom/vladsch/flexmark/parser/core/ListBlockParser;Lcom/vladsch/flexmark/parser/core/ListItemParser;)Lcom/vladsch/flexmark/parser/core/ListItemParser;
    .locals 0

    .line 23
    iput-object p1, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myLastChild:Lcom/vladsch/flexmark/parser/core/ListItemParser;

    return-object p1
.end method

.method static synthetic access$400(Lcom/vladsch/flexmark/parser/core/ListBlockParser;)Z
    .locals 0

    .line 23
    iget-boolean p0, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myItemHandledSkipActiveLine:Z

    return p0
.end method

.method private static createListBlock(Ljava/util/regex/Matcher;)Lcom/vladsch/flexmark/ast/ListBlock;
    .locals 3

    const/4 v0, 0x1

    .line 385
    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 387
    new-instance p0, Lcom/vladsch/flexmark/ast/BulletList;

    invoke-direct {p0}, Lcom/vladsch/flexmark/ast/BulletList;-><init>()V

    .line 388
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/ast/BulletList;->setOpeningMarker(C)V

    return-object p0

    :cond_0
    const/4 v0, 0x2

    .line 391
    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x3

    .line 392
    invoke-virtual {p0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p0

    .line 393
    new-instance v2, Lcom/vladsch/flexmark/ast/OrderedList;

    invoke-direct {v2}, Lcom/vladsch/flexmark/ast/OrderedList;-><init>()V

    .line 394
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {v2, v0}, Lcom/vladsch/flexmark/ast/OrderedList;->setStartNumber(I)V

    .line 395
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result p0

    invoke-virtual {v2, p0}, Lcom/vladsch/flexmark/ast/OrderedList;->setDelimiter(C)V

    return-object v2
.end method

.method private finalizeListTight(Lcom/vladsch/flexmark/parser/block/ParserState;)V
    .locals 13

    .line 159
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->getBlock()Lcom/vladsch/flexmark/ast/ListBlock;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/ast/ListBlock;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_0
    if-eqz v0, :cond_18

    .line 178
    instance-of v6, v0, Lcom/vladsch/flexmark/ast/ListItem;

    if-eqz v6, :cond_b

    .line 179
    move-object v7, v0

    check-cast v7, Lcom/vladsch/flexmark/ast/ListItem;

    invoke-virtual {v7}, Lcom/vladsch/flexmark/ast/ListItem;->isHadBlankAfterItemParagraph()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 181
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v8

    if-nez v8, :cond_0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v8

    if-eqz v8, :cond_1

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v8

    invoke-virtual {v8}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v8

    if-nez v8, :cond_0

    goto :goto_1

    :cond_0
    const/4 v8, 0x1

    goto :goto_2

    :cond_1
    :goto_1
    const/4 v8, 0x0

    .line 188
    :goto_2
    invoke-virtual {v7}, Lcom/vladsch/flexmark/ast/ListItem;->isContainsBlankLine()Z

    move-result v9

    .line 192
    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/parser/block/ParserState;->endsWithBlankLine(Lcom/vladsch/flexmark/util/ast/Node;)Z

    move-result v10

    if-eqz v10, :cond_2

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v10

    if-eqz v10, :cond_2

    const/4 v10, 0x1

    goto :goto_3

    :cond_2
    const/4 v10, 0x0

    .line 196
    :goto_3
    invoke-static {v7}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->hasNonItemChildren(Lcom/vladsch/flexmark/ast/ListItem;)Z

    move-result v11

    if-eqz v10, :cond_3

    .line 201
    iget-object v12, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    .line 202
    invoke-virtual {v12}, Lcom/vladsch/flexmark/parser/ListOptions;->isLooseWhenHasTrailingBlankLine()Z

    move-result v12

    if-nez v12, :cond_9

    :cond_3
    if-eqz v8, :cond_4

    iget-object v8, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    .line 203
    invoke-virtual {v8}, Lcom/vladsch/flexmark/parser/ListOptions;->isLooseWhenBlankLineFollowsItemParagraph()Z

    move-result v8

    if-nez v8, :cond_9

    :cond_4
    if-eqz v9, :cond_5

    iget-object v8, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    .line 204
    invoke-virtual {v8}, Lcom/vladsch/flexmark/parser/ListOptions;->isLooseWhenContainsBlankLine()Z

    move-result v8

    if-nez v8, :cond_9

    :cond_5
    if-eqz v11, :cond_6

    iget-object v8, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    .line 205
    invoke-virtual {v8}, Lcom/vladsch/flexmark/parser/ListOptions;->isLooseWhenHasNonListChildren()Z

    move-result v8

    if-nez v8, :cond_9

    :cond_6
    if-eqz v10, :cond_7

    .line 206
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getPrevious()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v8

    if-eqz v8, :cond_8

    :cond_7
    if-eqz v5, :cond_a

    :cond_8
    iget-object v8, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    .line 207
    invoke-virtual {v8}, Lcom/vladsch/flexmark/parser/ListOptions;->isLooseWhenPrevHasTrailingBlankLine()Z

    move-result v8

    if-nez v8, :cond_9

    iget-object v8, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v8}, Lcom/vladsch/flexmark/parser/ListOptions;->isLooseWhenLastItemPrevHasTrailingBlankLine()Z

    move-result v8

    if-eqz v8, :cond_a

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v8

    if-nez v8, :cond_a

    :cond_9
    const/4 v8, 0x1

    goto :goto_4

    :cond_a
    const/4 v8, 0x0

    :goto_4
    if-eqz v8, :cond_c

    .line 211
    invoke-virtual {v7, v1}, Lcom/vladsch/flexmark/ast/ListItem;->setLoose(Z)V

    const/4 v3, 0x0

    goto :goto_5

    :cond_b
    const/4 v8, 0x0

    const/4 v10, 0x0

    .line 218
    :cond_c
    :goto_5
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v7

    :goto_6
    if-eqz v7, :cond_16

    .line 220
    invoke-interface {p1, v7}, Lcom/vladsch/flexmark/parser/block/ParserState;->endsWithBlankLine(Lcom/vladsch/flexmark/util/ast/Node;)Z

    move-result v9

    if-eqz v9, :cond_10

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v9

    if-nez v9, :cond_d

    invoke-virtual {v7}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v9

    if-eqz v9, :cond_10

    .line 222
    :cond_d
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getLastChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v9

    if-ne v7, v9, :cond_e

    const/4 v10, 0x1

    :cond_e
    if-nez v8, :cond_10

    .line 225
    iget-object v9, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v9}, Lcom/vladsch/flexmark/parser/ListOptions;->isLooseWhenHasTrailingBlankLine()Z

    move-result v9

    if-eqz v9, :cond_f

    const/4 v3, 0x0

    :cond_f
    if-eqz v10, :cond_10

    .line 229
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getPrevious()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v9

    if-nez v9, :cond_10

    iget-object v9, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v9}, Lcom/vladsch/flexmark/parser/ListOptions;->isLooseWhenPrevHasTrailingBlankLine()Z

    move-result v9

    if-eqz v9, :cond_10

    .line 232
    move-object v3, v0

    check-cast v3, Lcom/vladsch/flexmark/ast/ListItem;

    invoke-virtual {v3, v1}, Lcom/vladsch/flexmark/ast/ListItem;->setLoose(Z)V

    const/4 v3, 0x0

    const/4 v8, 0x1

    .line 237
    :cond_10
    instance-of v9, v7, Lcom/vladsch/flexmark/ast/ListBlock;

    if-eqz v9, :cond_13

    if-nez v8, :cond_12

    .line 239
    iget-object v4, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v4}, Lcom/vladsch/flexmark/parser/ListOptions;->isLooseWhenHasLooseSubItem()Z

    move-result v4

    if-eqz v4, :cond_12

    if-eqz v9, :cond_12

    .line 241
    invoke-virtual {v7}, Lcom/vladsch/flexmark/util/ast/Node;->getChildIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    move-result-object v4

    .line 242
    :cond_11
    invoke-interface {v4}, Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_12

    .line 243
    invoke-interface {v4}, Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/vladsch/flexmark/ast/ListItem;

    .line 244
    invoke-virtual {v9}, Lcom/vladsch/flexmark/ast/ListItem;->isTight()Z

    move-result v9

    if-nez v9, :cond_11

    .line 247
    move-object v3, v0

    check-cast v3, Lcom/vladsch/flexmark/ast/ListItem;

    invoke-virtual {v3, v1}, Lcom/vladsch/flexmark/ast/ListItem;->setLoose(Z)V

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v8, 0x1

    goto :goto_7

    :cond_12
    const/4 v4, 0x1

    .line 255
    :cond_13
    :goto_7
    iget-object v9, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v9}, Lcom/vladsch/flexmark/parser/ListOptions;->isLooseWhenHasLooseSubItem()Z

    move-result v9

    if-eqz v9, :cond_14

    if-eqz v8, :cond_15

    if-nez v4, :cond_16

    .line 256
    iget-object v9, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v9}, Lcom/vladsch/flexmark/parser/ListOptions;->isAutoLooseOneLevelLists()Z

    move-result v9

    if-nez v9, :cond_15

    goto :goto_8

    :cond_14
    if-nez v3, :cond_15

    if-nez v4, :cond_16

    .line 258
    iget-object v9, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v9}, Lcom/vladsch/flexmark/parser/ListOptions;->isAutoLooseOneLevelLists()Z

    move-result v9

    if-nez v9, :cond_15

    goto :goto_8

    .line 260
    :cond_15
    invoke-virtual {v7}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v7

    goto/16 :goto_6

    :cond_16
    :goto_8
    if-eqz v6, :cond_17

    move v5, v10

    .line 272
    :cond_17
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    goto/16 :goto_0

    .line 275
    :cond_18
    iget-object p1, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/ListOptions;->isAutoLoose()Z

    move-result p1

    if-eqz p1, :cond_19

    iget-object p1, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/ListOptions;->isAutoLooseOneLevelLists()Z

    move-result p1

    if-eqz p1, :cond_19

    if-nez v4, :cond_1a

    .line 276
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->getBlock()Lcom/vladsch/flexmark/ast/ListBlock;

    move-result-object p1

    new-array v0, v1, [Ljava/lang/Class;

    const-class v1, Lcom/vladsch/flexmark/ast/ListBlock;

    aput-object v1, v0, v2

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/ast/ListBlock;->getAncestorOfType([Ljava/lang/Class;)Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p1

    if-nez p1, :cond_1a

    if-nez v3, :cond_1a

    .line 277
    invoke-direct {p0, v2}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setTight(Z)V

    return-void

    .line 280
    :cond_19
    iget-object p1, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/ListOptions;->isAutoLoose()Z

    move-result p1

    if-eqz p1, :cond_1a

    if-nez v3, :cond_1a

    .line 281
    invoke-direct {p0, v2}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->setTight(Z)V

    :cond_1a
    return-void
.end method

.method private static hasNonItemChildren(Lcom/vladsch/flexmark/ast/ListItem;)Z
    .locals 3

    .line 146
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/ListItem;->hasChildren()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 148
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/ListItem;->getChildren()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;

    move-result-object p0

    invoke-interface {p0}, Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    move-result-object p0

    const/4 v0, 0x0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vladsch/flexmark/util/ast/Node;

    .line 149
    instance-of v2, v2, Lcom/vladsch/flexmark/ast/ListBlock;

    if-eqz v2, :cond_1

    goto :goto_0

    :cond_1
    add-int/lit8 v0, v0, 0x1

    const/4 v2, 0x2

    if-lt v0, v2, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_2
    return v1
.end method

.method static parseListMarker(Lcom/vladsch/flexmark/parser/ListOptions;ILcom/vladsch/flexmark/parser/block/ParserState;)Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;
    .locals 23

    move/from16 v0, p1

    .line 291
    invoke-interface/range {p2 .. p2}, Lcom/vladsch/flexmark/parser/block/ParserState;->getParsing()Lcom/vladsch/flexmark/ast/util/Parsing;

    move-result-object v1

    .line 292
    invoke-interface/range {p2 .. p2}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    .line 293
    invoke-interface/range {p2 .. p2}, Lcom/vladsch/flexmark/parser/block/ParserState;->getNextNonSpaceIndex()I

    move-result v6

    .line 294
    invoke-interface/range {p2 .. p2}, Lcom/vladsch/flexmark/parser/block/ParserState;->getColumn()I

    move-result v3

    invoke-interface/range {p2 .. p2}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndent()I

    move-result v4

    add-int v7, v3, v4

    .line 295
    invoke-interface/range {p2 .. p2}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndent()I

    move-result v8

    .line 297
    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v3

    invoke-interface {v2, v6, v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    .line 298
    iget-object v1, v1, Lcom/vladsch/flexmark/ast/util/Parsing;->LIST_ITEM_MARKER:Ljava/util/regex/Pattern;

    invoke-virtual {v1, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 299
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v4

    if-nez v4, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 303
    :cond_0
    invoke-static {v1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->createListBlock(Ljava/util/regex/Matcher;)Lcom/vladsch/flexmark/ast/ListBlock;

    move-result-object v4

    .line 305
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->end()I

    move-result v5

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->start()I

    move-result v9

    sub-int/2addr v5, v9

    .line 306
    const-string v9, "+-*"

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    xor-int/lit8 v11, v9, 0x1

    add-int v10, v6, v5

    add-int/2addr v5, v7

    move v13, v10

    const/4 v14, 0x0

    .line 318
    :goto_0
    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v15

    const/16 v12, 0x9

    const/16 v17, 0x1

    if-ge v10, v15, :cond_3

    .line 319
    invoke-interface {v2, v10}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v15

    if-ne v15, v12, :cond_1

    add-int v12, v5, v14

    .line 321
    invoke-static {v12}, Lcom/vladsch/flexmark/ast/util/Parsing;->columnsToNextTabStop(I)I

    move-result v12

    add-int/2addr v14, v12

    :goto_1
    add-int/lit8 v13, v13, 0x1

    goto :goto_2

    :cond_1
    const/16 v12, 0x20

    if-ne v15, v12, :cond_2

    add-int/lit8 v14, v14, 0x1

    goto :goto_1

    :goto_2
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    :cond_2
    const/4 v10, 0x1

    goto :goto_3

    :cond_3
    const/4 v10, 0x0

    .line 332
    :goto_3
    sget-object v12, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    if-eqz v10, :cond_10

    if-le v14, v0, :cond_4

    goto/16 :goto_d

    :cond_4
    if-nez v9, :cond_7

    .line 338
    invoke-virtual/range {p0 .. p0}, Lcom/vladsch/flexmark/parser/ListOptions;->isNumberedItemMarkerSuffixed()Z

    move-result v9

    if-eqz v9, :cond_5

    goto :goto_4

    :cond_5
    move-object/from16 v19, v1

    :cond_6
    move-object/from16 v22, v4

    goto/16 :goto_c

    .line 340
    :cond_7
    :goto_4
    invoke-virtual/range {p0 .. p0}, Lcom/vladsch/flexmark/parser/ListOptions;->getItemMarkerSuffixes()[Ljava/lang/String;

    move-result-object v9

    .line 341
    array-length v15, v9

    move-object/from16 v19, v1

    const/4 v1, 0x0

    :goto_5
    if-ge v1, v15, :cond_6

    move/from16 v20, v1

    aget-object v1, v9, v20

    .line 342
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v21

    if-lez v21, :cond_f

    .line 343
    invoke-interface {v2, v1, v13}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->matchChars(Ljava/lang/CharSequence;I)Z

    move-result v1

    if-eqz v1, :cond_f

    .line 344
    invoke-virtual/range {p0 .. p0}, Lcom/vladsch/flexmark/parser/ListOptions;->isItemMarkerSpace()Z

    move-result v1

    if-eqz v1, :cond_8

    add-int v1, v13, v21

    .line 345
    invoke-interface {v2, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->midCharAt(I)C

    move-result v1

    move-object/from16 v22, v4

    const/16 v4, 0x20

    if-eq v1, v4, :cond_9

    const/16 v4, 0x9

    if-eq v1, v4, :cond_9

    goto :goto_b

    :cond_8
    move-object/from16 v22, v4

    :cond_9
    add-int v1, v13, v21

    .line 352
    invoke-interface {v2, v13, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v12

    add-int v4, v14, v21

    add-int v5, v5, v21

    move v9, v4

    .line 360
    :goto_6
    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v10

    if-ge v1, v10, :cond_c

    .line 361
    invoke-interface {v2, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v10

    const/16 v13, 0x9

    if-ne v10, v13, :cond_a

    add-int v10, v5, v9

    .line 363
    invoke-static {v10}, Lcom/vladsch/flexmark/ast/util/Parsing;->columnsToNextTabStop(I)I

    move-result v10

    add-int/2addr v9, v10

    const/16 v15, 0x20

    goto :goto_7

    :cond_a
    const/16 v15, 0x20

    if-ne v10, v15, :cond_b

    add-int/lit8 v9, v9, 0x1

    :goto_7
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    :cond_b
    const/4 v1, 0x1

    goto :goto_8

    :cond_c
    const/4 v1, 0x0

    :goto_8
    if-eqz v1, :cond_e

    sub-int v2, v9, v4

    if-le v2, v0, :cond_d

    goto :goto_9

    :cond_d
    move v10, v1

    goto :goto_a

    :cond_e
    :goto_9
    add-int/lit8 v4, v4, 0x1

    move v10, v1

    move v9, v4

    :goto_a
    move v13, v14

    goto :goto_e

    :cond_f
    move-object/from16 v22, v4

    :goto_b
    const/16 v16, 0x20

    const/16 v18, 0x9

    add-int/lit8 v1, v20, 0x1

    move-object/from16 v4, v22

    goto :goto_5

    :goto_c
    move v9, v14

    move v13, v9

    goto :goto_e

    :cond_10
    :goto_d
    move-object/from16 v19, v1

    move-object/from16 v22, v4

    const/4 v9, 0x1

    const/4 v13, 0x1

    .line 381
    :goto_e
    new-instance v0, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;

    xor-int/lit8 v5, v10, 0x1

    invoke-virtual/range {v19 .. v19}, Ljava/util/regex/Matcher;->start()I

    move-result v1

    invoke-virtual/range {v19 .. v19}, Ljava/util/regex/Matcher;->end()I

    move-result v2

    invoke-interface {v3, v1, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v10

    move-object v3, v0

    move-object/from16 v4, v22

    invoke-direct/range {v3 .. v13}, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;-><init>(Lcom/vladsch/flexmark/ast/ListBlock;ZIIIILcom/vladsch/flexmark/util/sequence/BasedSequence;ZLcom/vladsch/flexmark/util/sequence/BasedSequence;I)V

    return-object v3
.end method

.method private setTight(Z)V
    .locals 1

    .line 117
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myBlock:Lcom/vladsch/flexmark/ast/ListBlock;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/ast/ListBlock;->setTight(Z)V

    return-void
.end method


# virtual methods
.method public breakOutOnDoubleBlankLine()Z
    .locals 1

    .line 142
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/ListOptions;->isEndOnDoubleBlank()Z

    move-result v0

    return v0
.end method

.method public canContain(Lcom/vladsch/flexmark/parser/block/ParserState;Lcom/vladsch/flexmark/parser/block/BlockParser;Lcom/vladsch/flexmark/util/ast/Block;)Z
    .locals 0

    .line 107
    instance-of p1, p3, Lcom/vladsch/flexmark/ast/ListItem;

    return p1
.end method

.method public closeBlock(Lcom/vladsch/flexmark/parser/block/ParserState;)V
    .locals 4

    .line 122
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->finalizeListTight(Lcom/vladsch/flexmark/parser/block/ParserState;)V

    .line 124
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getProperties()Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object p1

    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->BLANK_LINES_IN_AST:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 126
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->getBlock()Lcom/vladsch/flexmark/ast/ListBlock;

    move-result-object p1

    const/4 v0, 0x1

    .line 128
    new-array v1, v0, [Ljava/lang/Class;

    const-class v2, Lcom/vladsch/flexmark/util/ast/BlankLine;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-virtual {p1, v1}, Lcom/vladsch/flexmark/ast/ListBlock;->getFirstChildAnyNot([Ljava/lang/Class;)Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p1

    .line 130
    :goto_0
    instance-of v1, p1, Lcom/vladsch/flexmark/ast/ListItem;

    if-eqz v1, :cond_0

    .line 132
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->moveTrailingBlankLines()V

    .line 133
    new-array v1, v0, [Ljava/lang/Class;

    const-class v2, Lcom/vladsch/flexmark/util/ast/BlankLine;

    aput-object v2, v1, v3

    invoke-virtual {p1, v1}, Lcom/vladsch/flexmark/util/ast/Node;->getNextAnyNot([Ljava/lang/Class;)Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p1

    goto :goto_0

    .line 137
    :cond_0
    iget-object p1, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myBlock:Lcom/vladsch/flexmark/ast/ListBlock;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/ListBlock;->setCharsFromContentOnly()V

    return-void
.end method

.method public getBlock()Lcom/vladsch/flexmark/ast/ListBlock;
    .locals 1

    .line 112
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myBlock:Lcom/vladsch/flexmark/ast/ListBlock;

    return-object v0
.end method

.method public bridge synthetic getBlock()Lcom/vladsch/flexmark/util/ast/Block;
    .locals 1

    .line 23
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->getBlock()Lcom/vladsch/flexmark/ast/ListBlock;

    move-result-object v0

    return-object v0
.end method

.method getContentIndent()I
    .locals 2

    .line 93
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myListData:Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;

    iget v0, v0, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->markerIndent:I

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myListData:Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;

    iget-object v1, v1, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->listMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myListData:Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;

    iget v1, v1, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->contentOffset:I

    add-int/2addr v0, v1

    return v0
.end method

.method getItemHandledLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 45
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myItemHandledLine:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getLastChild()Lcom/vladsch/flexmark/parser/core/ListItemParser;
    .locals 1

    .line 77
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myLastChild:Lcom/vladsch/flexmark/parser/core/ListItemParser;

    return-object v0
.end method

.method getLastContentIndent()I
    .locals 1

    .line 97
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myLastChild:Lcom/vladsch/flexmark/parser/core/ListItemParser;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/core/ListItemParser;->getContentIndent()I

    move-result v0

    return v0
.end method

.method public getListData()Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;
    .locals 1

    .line 89
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myListData:Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;

    return-object v0
.end method

.method public getOptions()Lcom/vladsch/flexmark/parser/ListOptions;
    .locals 1

    .line 85
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    return-object v0
.end method

.method public isContainer()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method setItemHandledLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 49
    iput-object p1, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myItemHandledLine:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 p1, 0x0

    .line 50
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myItemHandledNewListLine:Z

    .line 51
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myItemHandledNewItemLine:Z

    .line 52
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myItemHandledSkipActiveLine:Z

    return-void
.end method

.method setItemHandledLineSkipActive(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 70
    iput-object p1, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myItemHandledLine:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 p1, 0x0

    .line 71
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myItemHandledNewListLine:Z

    .line 72
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myItemHandledNewItemLine:Z

    const/4 p1, 0x1

    .line 73
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myItemHandledSkipActiveLine:Z

    return-void
.end method

.method setItemHandledNewItemLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 1

    .line 63
    iput-object p1, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myItemHandledLine:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 p1, 0x0

    .line 64
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myItemHandledNewListLine:Z

    const/4 v0, 0x1

    .line 65
    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myItemHandledNewItemLine:Z

    .line 66
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myItemHandledSkipActiveLine:Z

    return-void
.end method

.method setItemHandledNewListLine(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 56
    iput-object p1, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myItemHandledLine:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 p1, 0x1

    .line 57
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myItemHandledNewListLine:Z

    const/4 p1, 0x0

    .line 58
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myItemHandledNewItemLine:Z

    .line 59
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myItemHandledSkipActiveLine:Z

    return-void
.end method

.method public setLastChild(Lcom/vladsch/flexmark/parser/core/ListItemParser;)V
    .locals 0

    .line 81
    iput-object p1, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->myLastChild:Lcom/vladsch/flexmark/parser/core/ListItemParser;

    return-void
.end method

.method public tryContinue(Lcom/vladsch/flexmark/parser/block/ParserState;)Lcom/vladsch/flexmark/parser/block/BlockContinue;
    .locals 0

    .line 404
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndex()I

    move-result p1

    invoke-static {p1}, Lcom/vladsch/flexmark/parser/block/BlockContinue;->atIndex(I)Lcom/vladsch/flexmark/parser/block/BlockContinue;

    move-result-object p1

    return-object p1
.end method
