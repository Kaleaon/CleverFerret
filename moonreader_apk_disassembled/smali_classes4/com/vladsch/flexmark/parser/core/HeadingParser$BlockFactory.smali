.class Lcom/vladsch/flexmark/parser/core/HeadingParser$BlockFactory;
.super Lcom/vladsch/flexmark/parser/block/AbstractBlockParserFactory;
.source "HeadingParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/parser/core/HeadingParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BlockFactory"
.end annotation


# instance fields
.field private final myParsing:Lcom/vladsch/flexmark/parser/core/HeadingParser$HeadingParsing;

.field private final options:Lcom/vladsch/flexmark/parser/core/HeadingParser$HeadingOptions;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 1

    .line 111
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/block/AbstractBlockParserFactory;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    .line 112
    new-instance v0, Lcom/vladsch/flexmark/parser/core/HeadingParser$HeadingOptions;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/parser/core/HeadingParser$HeadingOptions;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/core/HeadingParser$BlockFactory;->options:Lcom/vladsch/flexmark/parser/core/HeadingParser$HeadingOptions;

    .line 113
    new-instance v0, Lcom/vladsch/flexmark/parser/core/HeadingParser$HeadingParsing;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/parser/core/HeadingParser$HeadingParsing;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/core/HeadingParser$BlockFactory;->myParsing:Lcom/vladsch/flexmark/parser/core/HeadingParser$HeadingParsing;

    return-void
.end method


# virtual methods
.method public tryStart(Lcom/vladsch/flexmark/parser/block/ParserState;Lcom/vladsch/flexmark/parser/block/MatchedBlockParser;)Lcom/vladsch/flexmark/parser/block/BlockStart;
    .locals 9

    .line 118
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndent()I

    move-result v0

    const/4 v1, 0x4

    if-ge v0, v1, :cond_8

    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/HeadingParser$BlockFactory;->options:Lcom/vladsch/flexmark/parser/core/HeadingParser$HeadingOptions;

    iget-boolean v0, v0, Lcom/vladsch/flexmark/parser/core/HeadingParser$HeadingOptions;->noLeadSpace:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndent()I

    move-result v0

    if-lt v0, v1, :cond_0

    goto/16 :goto_2

    .line 122
    :cond_0
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getActiveBlockParser()Lcom/vladsch/flexmark/parser/block/BlockParser;

    move-result-object v0

    instance-of v0, v0, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;

    if-eqz v0, :cond_1

    .line 123
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockStart;->none()Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    return-object p1

    .line 126
    :cond_1
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/HeadingParser$BlockFactory;->options:Lcom/vladsch/flexmark/parser/core/HeadingParser$HeadingOptions;

    iget-boolean v0, v0, Lcom/vladsch/flexmark/parser/core/HeadingParser$HeadingOptions;->canInterruptItemParagraph:Z

    if-nez v0, :cond_2

    .line 127
    invoke-interface {p2}, Lcom/vladsch/flexmark/parser/block/MatchedBlockParser;->getBlockParser()Lcom/vladsch/flexmark/parser/block/BlockParser;

    move-result-object v0

    .line 128
    invoke-interface {v0}, Lcom/vladsch/flexmark/parser/block/BlockParser;->isParagraphParser()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 129
    invoke-interface {v0}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/ast/Block;->getParent()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v2

    instance-of v2, v2, Lcom/vladsch/flexmark/ast/ListItem;

    if-eqz v2, :cond_2

    invoke-interface {v0}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v2

    invoke-interface {v0}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Block;->getParent()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Block;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    if-ne v2, v0, :cond_2

    .line 132
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockStart;->none()Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    return-object p1

    .line 136
    :cond_2
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    .line 137
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getNextNonSpaceIndex()I

    move-result v2

    .line 138
    invoke-interface {p2}, Lcom/vladsch/flexmark/parser/block/MatchedBlockParser;->getParagraphContent()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    .line 140
    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v4

    invoke-interface {v0, v2, v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v4

    .line 141
    iget-object v5, p0, Lcom/vladsch/flexmark/parser/core/HeadingParser$BlockFactory;->myParsing:Lcom/vladsch/flexmark/parser/core/HeadingParser$HeadingParsing;

    invoke-static {v5}, Lcom/vladsch/flexmark/parser/core/HeadingParser$HeadingParsing;->access$000(Lcom/vladsch/flexmark/parser/core/HeadingParser$HeadingParsing;)Ljava/util/regex/Pattern;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    .line 142
    invoke-virtual {v5}, Ljava/util/regex/Matcher;->find()Z

    move-result v6

    const/4 v7, 0x0

    if-eqz v6, :cond_4

    .line 144
    invoke-virtual {v5, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p2

    add-int/2addr v2, p2

    .line 145
    invoke-virtual {v5}, Ljava/util/regex/Matcher;->start()I

    move-result p2

    .line 146
    invoke-virtual {v5}, Ljava/util/regex/Matcher;->end()I

    move-result v3

    .line 147
    invoke-interface {v4, p2, v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trim()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    .line 148
    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v5

    .line 150
    new-instance v6, Lcom/vladsch/flexmark/util/ast/BlockContent;

    invoke-direct {v6}, Lcom/vladsch/flexmark/util/ast/BlockContent;-><init>()V

    .line 151
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLineWithEOL()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v8

    invoke-interface {v8, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndent()I

    move-result p1

    invoke-virtual {v6, v2, p1}, Lcom/vladsch/flexmark/util/ast/BlockContent;->add(Lcom/vladsch/flexmark/util/sequence/BasedSequence;I)V

    .line 153
    invoke-interface {v4, v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    .line 155
    iget-object v2, p0, Lcom/vladsch/flexmark/parser/core/HeadingParser$BlockFactory;->myParsing:Lcom/vladsch/flexmark/parser/core/HeadingParser$HeadingParsing;

    invoke-static {v2}, Lcom/vladsch/flexmark/parser/core/HeadingParser$HeadingParsing;->access$100(Lcom/vladsch/flexmark/parser/core/HeadingParser$HeadingParsing;)Ljava/util/regex/Pattern;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    .line 156
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->find()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 158
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->start()I

    move-result v3

    .line 159
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->end()I

    move-result v2

    .line 160
    invoke-interface {p1, v3, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trim()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    .line 161
    invoke-interface {p1, v7, v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    goto :goto_0

    :cond_3
    const/4 v2, 0x0

    .line 164
    :goto_0
    new-instance v3, Lcom/vladsch/flexmark/parser/core/HeadingParser;

    invoke-direct {v3, v5}, Lcom/vladsch/flexmark/parser/core/HeadingParser;-><init>(I)V

    .line 165
    iget-object v4, v3, Lcom/vladsch/flexmark/parser/core/HeadingParser;->block:Lcom/vladsch/flexmark/ast/Heading;

    invoke-virtual {v4, p2}, Lcom/vladsch/flexmark/ast/Heading;->setOpeningMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 166
    iget-object p2, v3, Lcom/vladsch/flexmark/parser/core/HeadingParser;->block:Lcom/vladsch/flexmark/ast/Heading;

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trim()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/vladsch/flexmark/ast/Heading;->setText(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 167
    iget-object p1, v3, Lcom/vladsch/flexmark/parser/core/HeadingParser;->block:Lcom/vladsch/flexmark/ast/Heading;

    invoke-virtual {p1, v2}, Lcom/vladsch/flexmark/ast/Heading;->setClosingMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 168
    iget-object p1, v3, Lcom/vladsch/flexmark/parser/core/HeadingParser;->block:Lcom/vladsch/flexmark/ast/Heading;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Heading;->setCharsFromContent()V

    .line 170
    new-array p1, v1, [Lcom/vladsch/flexmark/parser/block/BlockParser;

    aput-object v3, p1, v7

    invoke-static {p1}, Lcom/vladsch/flexmark/parser/block/BlockStart;->of([Lcom/vladsch/flexmark/parser/block/BlockParser;)Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    .line 171
    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/parser/block/BlockStart;->atIndex(I)Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    return-object p1

    .line 173
    :cond_4
    iget-object p1, p0, Lcom/vladsch/flexmark/parser/core/HeadingParser$BlockFactory;->myParsing:Lcom/vladsch/flexmark/parser/core/HeadingParser$HeadingParsing;

    invoke-static {p1}, Lcom/vladsch/flexmark/parser/core/HeadingParser$HeadingParsing;->access$200(Lcom/vladsch/flexmark/parser/core/HeadingParser$HeadingParsing;)Ljava/util/regex/Pattern;

    move-result-object p1

    invoke-virtual {p1, v4}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-eqz v2, :cond_7

    if-eqz v3, :cond_6

    .line 176
    invoke-virtual {p1, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, v7}, Ljava/lang/String;->charAt(I)C

    move-result p1

    const/16 v2, 0x3d

    if-ne p1, v2, :cond_5

    const/4 p1, 0x1

    goto :goto_1

    :cond_5
    const/4 p1, 0x2

    .line 178
    :goto_1
    new-instance v2, Lcom/vladsch/flexmark/util/ast/BlockContent;

    invoke-direct {v2}, Lcom/vladsch/flexmark/util/ast/BlockContent;-><init>()V

    .line 179
    invoke-interface {p2}, Lcom/vladsch/flexmark/parser/block/MatchedBlockParser;->getParagraphLines()Ljava/util/List;

    move-result-object v3

    invoke-interface {p2}, Lcom/vladsch/flexmark/parser/block/MatchedBlockParser;->getParagraphEolLengths()Ljava/util/List;

    move-result-object p2

    invoke-virtual {v2, v3, p2}, Lcom/vladsch/flexmark/util/ast/BlockContent;->addAll(Ljava/util/List;Ljava/util/List;)V

    .line 180
    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/ast/BlockContent;->getContents()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trim()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    .line 181
    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trim()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    .line 183
    new-instance v3, Lcom/vladsch/flexmark/parser/core/HeadingParser;

    invoke-direct {v3, p1}, Lcom/vladsch/flexmark/parser/core/HeadingParser;-><init>(I)V

    .line 184
    iget-object p1, v3, Lcom/vladsch/flexmark/parser/core/HeadingParser;->block:Lcom/vladsch/flexmark/ast/Heading;

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/ast/Heading;->setText(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 185
    iget-object p1, v3, Lcom/vladsch/flexmark/parser/core/HeadingParser;->block:Lcom/vladsch/flexmark/ast/Heading;

    invoke-virtual {p1, v2}, Lcom/vladsch/flexmark/ast/Heading;->setClosingMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 186
    iget-object p1, v3, Lcom/vladsch/flexmark/parser/core/HeadingParser;->block:Lcom/vladsch/flexmark/ast/Heading;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Heading;->setCharsFromContent()V

    .line 188
    new-array p1, v1, [Lcom/vladsch/flexmark/parser/block/BlockParser;

    aput-object v3, p1, v7

    invoke-static {p1}, Lcom/vladsch/flexmark/parser/block/BlockStart;->of([Lcom/vladsch/flexmark/parser/block/BlockParser;)Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    .line 189
    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/parser/block/BlockStart;->atIndex(I)Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    .line 190
    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/block/BlockStart;->replaceActiveBlockParser()Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    return-object p1

    .line 192
    :cond_6
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockStart;->none()Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    return-object p1

    .line 195
    :cond_7
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockStart;->none()Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    return-object p1

    .line 119
    :cond_8
    :goto_2
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockStart;->none()Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    return-object p1
.end method
