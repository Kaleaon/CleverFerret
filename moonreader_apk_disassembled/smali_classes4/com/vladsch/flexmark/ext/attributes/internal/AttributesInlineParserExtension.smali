.class public Lcom/vladsch/flexmark/ext/attributes/internal/AttributesInlineParserExtension;
.super Ljava/lang/Object;
.source "AttributesInlineParserExtension.java"

# interfaces
.implements Lcom/vladsch/flexmark/parser/InlineParserExtension;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/ext/attributes/internal/AttributesInlineParserExtension$Factory;
    }
.end annotation


# instance fields
.field private final parsing:Lcom/vladsch/flexmark/ext/attributes/internal/AttributeParsing;


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/parser/InlineParser;)V
    .locals 1

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    new-instance v0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributeParsing;

    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/InlineParser;->getParsing()Lcom/vladsch/flexmark/ast/util/Parsing;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/ext/attributes/internal/AttributeParsing;-><init>(Lcom/vladsch/flexmark/ast/util/Parsing;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesInlineParserExtension;->parsing:Lcom/vladsch/flexmark/ext/attributes/internal/AttributeParsing;

    return-void
.end method


# virtual methods
.method public finalizeBlock(Lcom/vladsch/flexmark/parser/InlineParser;)V
    .locals 0

    return-void
.end method

.method public finalizeDocument(Lcom/vladsch/flexmark/parser/InlineParser;)V
    .locals 0

    return-void
.end method

.method public parse(Lcom/vladsch/flexmark/parser/InlineParser;)Z
    .locals 14

    const/4 v0, 0x1

    .line 32
    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/parser/InlineParser;->peek(I)C

    move-result v1

    const/16 v2, 0x7b

    const/4 v3, 0x0

    if-eq v1, v2, :cond_10

    .line 33
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/InlineParser;->getIndex()I

    move-result v1

    .line 34
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/InlineParser;->getInput()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    .line 35
    iget-object v4, p0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesInlineParserExtension;->parsing:Lcom/vladsch/flexmark/ext/attributes/internal/AttributeParsing;

    iget-object v4, v4, Lcom/vladsch/flexmark/ext/attributes/internal/AttributeParsing;->ATTRIBUTES_TAG:Ljava/util/regex/Pattern;

    invoke-interface {p1, v4}, Lcom/vladsch/flexmark/parser/InlineParser;->matcher(Ljava/util/regex/Pattern;)Ljava/util/regex/Matcher;

    move-result-object v4

    if-eqz v4, :cond_10

    .line 37
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->start()I

    move-result v5

    invoke-virtual {v4}, Ljava/util/regex/Matcher;->end()I

    move-result v6

    invoke-interface {v2, v5, v6}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v5

    .line 41
    invoke-virtual {v4, v0}, Ljava/util/regex/Matcher;->start(I)I

    move-result v6

    invoke-virtual {v4, v0}, Ljava/util/regex/Matcher;->end(I)I

    move-result v4

    invoke-interface {v2, v6, v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    .line 42
    const-string v4, "#"

    invoke-virtual {v2, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    const-string v4, "."

    invoke-virtual {v2, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    goto :goto_0

    :cond_0
    new-instance v4, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;

    .line 43
    invoke-interface {v5, v3, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v6

    invoke-interface {v5, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->endSequence(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v5

    invoke-direct {v4, v6, v2, v5}, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    goto :goto_1

    .line 42
    :cond_1
    :goto_0
    new-instance v4, Lcom/vladsch/flexmark/ext/attributes/AttributesDelimiter;

    invoke-interface {v5, v3, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v6

    invoke-interface {v5, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->endSequence(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v5

    invoke-direct {v4, v6, v2, v5}, Lcom/vladsch/flexmark/ext/attributes/AttributesDelimiter;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 45
    :goto_1
    invoke-virtual {v4}, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->setCharsFromContent()V

    .line 47
    const-string v5, " \t"

    invoke-interface {v2, v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->countLeading(Ljava/lang/CharSequence;)I

    move-result v5

    if-lez v5, :cond_2

    .line 50
    invoke-interface {p1, v2, v3, v5}, Lcom/vladsch/flexmark/parser/InlineParser;->appendText(Lcom/vladsch/flexmark/util/sequence/BasedSequence;II)V

    .line 51
    invoke-interface {v2, v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    .line 54
    :cond_2
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/InlineParser;->flushTextNode()Z

    .line 55
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/InlineParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v5

    invoke-virtual {v5, v4}, Lcom/vladsch/flexmark/util/ast/Node;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 57
    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trim()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    .line 58
    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_f

    instance-of v5, v4, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;

    if-eqz v5, :cond_f

    .line 61
    iget-object p1, p0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesInlineParserExtension;->parsing:Lcom/vladsch/flexmark/ext/attributes/internal/AttributeParsing;

    iget-object p1, p1, Lcom/vladsch/flexmark/ext/attributes/internal/AttributeParsing;->ATTRIBUTE:Ljava/util/regex/Pattern;

    invoke-virtual {p1, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    .line 62
    :goto_2
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_e

    .line 63
    invoke-virtual {p1, v0}, Ljava/util/regex/Matcher;->start(I)I

    move-result v1

    invoke-virtual {p1, v0}, Ljava/util/regex/Matcher;->end(I)I

    move-result v5

    invoke-interface {v2, v1, v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v7

    .line 64
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->groupCount()I

    move-result v1

    const/4 v5, -0x1

    const/4 v6, 0x2

    if-eq v1, v0, :cond_4

    invoke-virtual {p1, v6}, Ljava/util/regex/Matcher;->start(I)I

    move-result v1

    if-ne v1, v5, :cond_3

    goto :goto_3

    :cond_3
    invoke-virtual {p1, v0}, Ljava/util/regex/Matcher;->end(I)I

    move-result v1

    invoke-virtual {p1, v6}, Ljava/util/regex/Matcher;->start(I)I

    move-result v8

    invoke-interface {v2, v1, v8}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trim()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    goto :goto_4

    :cond_4
    :goto_3
    sget-object v1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    :goto_4
    move-object v8, v1

    .line 65
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->groupCount()I

    move-result v1

    if-eq v1, v0, :cond_6

    invoke-virtual {p1, v6}, Ljava/util/regex/Matcher;->start(I)I

    move-result v1

    if-ne v1, v5, :cond_5

    goto :goto_5

    :cond_5
    invoke-virtual {p1, v6}, Ljava/util/regex/Matcher;->start(I)I

    move-result v1

    invoke-virtual {p1, v6}, Ljava/util/regex/Matcher;->end(I)I

    move-result v9

    invoke-interface {v2, v1, v9}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    goto :goto_6

    :cond_6
    :goto_5
    sget-object v1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 66
    :goto_6
    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v9

    if-lt v9, v6, :cond_9

    invoke-interface {v1, v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v6

    const/16 v9, 0x22

    if-ne v6, v9, :cond_7

    invoke-interface {v1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->endCharAt(I)C

    move-result v6

    if-eq v6, v9, :cond_8

    :cond_7
    invoke-interface {v1, v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v6

    const/16 v9, 0x27

    if-ne v6, v9, :cond_9

    invoke-interface {v1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->endCharAt(I)C

    move-result v6

    if-ne v6, v9, :cond_9

    :cond_8
    const/4 v6, 0x1

    goto :goto_7

    :cond_9
    const/4 v6, 0x0

    :goto_7
    if-nez v6, :cond_a

    .line 67
    sget-object v9, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    goto :goto_8

    :cond_a
    invoke-interface {v1, v3, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v9

    :goto_8
    if-nez v6, :cond_b

    .line 68
    sget-object v10, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    goto :goto_9

    :cond_b
    invoke-interface {v1, v0, v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->endSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v10

    :goto_9
    move-object v11, v10

    if-eqz v6, :cond_c

    .line 71
    invoke-interface {v1, v0, v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->midSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    :cond_c
    move-object v10, v1

    .line 75
    invoke-interface {v8}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNull()Z

    move-result v1

    if-eqz v1, :cond_d

    invoke-interface {v8}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNull()Z

    move-result v1

    if-eqz v1, :cond_d

    invoke-interface {v10}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNull()Z

    move-result v1

    if-eqz v1, :cond_d

    invoke-static {v7}, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->isImplicitName(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_d

    move-object v10, v8

    .line 76
    new-instance v8, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;

    move-object v13, v11

    move-object v11, v9

    invoke-interface {v7, v3, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v9

    invoke-interface {v7, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v12

    invoke-direct/range {v8 .. v13}, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    goto :goto_a

    :cond_d
    move-object v1, v10

    move-object v13, v11

    move-object v10, v8

    move-object v11, v9

    .line 78
    new-instance v6, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;

    move-object v8, v10

    move-object v9, v11

    move-object v11, v13

    move-object v10, v1

    invoke-direct/range {v6 .. v11}, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    move-object v8, v6

    .line 80
    :goto_a
    invoke-virtual {v4, v8}, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    goto/16 :goto_2

    :cond_e
    return v0

    .line 87
    :cond_f
    invoke-interface {p1, v1}, Lcom/vladsch/flexmark/parser/InlineParser;->setIndex(I)V

    :cond_10
    return v3
.end method
