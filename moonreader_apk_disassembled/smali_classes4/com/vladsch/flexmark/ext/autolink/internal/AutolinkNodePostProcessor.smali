.class public Lcom/vladsch/flexmark/ext/autolink/internal/AutolinkNodePostProcessor;
.super Lcom/vladsch/flexmark/parser/block/NodePostProcessor;
.source "AutolinkNodePostProcessor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/ext/autolink/internal/AutolinkNodePostProcessor$Factory;,
        Lcom/vladsch/flexmark/ext/autolink/internal/AutolinkNodePostProcessor$DummyLinkSpan;
    }
.end annotation


# static fields
.field private static final URI_PREFIX:Ljava/util/regex/Pattern;


# instance fields
.field private final ignoredLinks:Ljava/util/regex/Pattern;

.field private final intellijDummyIdentifier:Z

.field private linkExtractor:Lorg/nibor/autolink/LinkExtractor;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 32
    const-string v0, "\\b([a-z][a-z0-9+.-]*://)(?:\\s|$)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/vladsch/flexmark/ext/autolink/internal/AutolinkNodePostProcessor;->URI_PREFIX:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/ast/Document;)V
    .locals 4

    .line 41
    invoke-direct {p0}, Lcom/vladsch/flexmark/parser/block/NodePostProcessor;-><init>()V

    .line 37
    invoke-static {}, Lorg/nibor/autolink/LinkExtractor;->builder()Lorg/nibor/autolink/LinkExtractor$Builder;

    move-result-object v0

    sget-object v1, Lorg/nibor/autolink/LinkType;->URL:Lorg/nibor/autolink/LinkType;

    sget-object v2, Lorg/nibor/autolink/LinkType;->WWW:Lorg/nibor/autolink/LinkType;

    sget-object v3, Lorg/nibor/autolink/LinkType;->EMAIL:Lorg/nibor/autolink/LinkType;

    .line 38
    invoke-static {v1, v2, v3}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/nibor/autolink/LinkExtractor$Builder;->linkTypes(Ljava/util/Set;)Lorg/nibor/autolink/LinkExtractor$Builder;

    move-result-object v0

    .line 39
    invoke-virtual {v0}, Lorg/nibor/autolink/LinkExtractor$Builder;->build()Lorg/nibor/autolink/LinkExtractor;

    move-result-object v0

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/autolink/internal/AutolinkNodePostProcessor;->linkExtractor:Lorg/nibor/autolink/LinkExtractor;

    .line 42
    sget-object v0, Lcom/vladsch/flexmark/ext/autolink/AutolinkExtension;->IGNORE_LINKS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 43
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/vladsch/flexmark/ext/autolink/internal/AutolinkNodePostProcessor;->ignoredLinks:Ljava/util/regex/Pattern;

    .line 44
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->INTELLIJ_DUMMY_IDENTIFIER:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/vladsch/flexmark/ext/autolink/internal/AutolinkNodePostProcessor;->intellijDummyIdentifier:Z

    return-void
.end method


# virtual methods
.method public isIgnoredLinkPrefix(Ljava/lang/CharSequence;)Z
    .locals 1

    .line 48
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/autolink/internal/AutolinkNodePostProcessor;->ignoredLinks:Ljava/util/regex/Pattern;

    if-eqz v0, :cond_0

    .line 49
    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    .line 50
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->matches()Z

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public process(Lcom/vladsch/flexmark/util/NodeTracker;Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 17

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    const/4 v3, 0x2

    .line 85
    new-array v3, v3, [Ljava/lang/Class;

    const-class v4, Lcom/vladsch/flexmark/util/ast/DoNotDecorate;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-class v4, Lcom/vladsch/flexmark/util/ast/DoNotLinkDecorate;

    const/4 v6, 0x1

    aput-object v4, v3, v6

    invoke-virtual {v2, v3}, Lcom/vladsch/flexmark/util/ast/Node;->getAncestorOfType([Ljava/lang/Class;)Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v3

    if-eqz v3, :cond_0

    goto/16 :goto_10

    .line 87
    :cond_0
    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    .line 92
    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v4

    instance-of v4, v4, Lcom/vladsch/flexmark/util/ast/TypographicText;

    if-eqz v4, :cond_4

    .line 94
    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v4

    invoke-interface {v4, v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isContinuationOf(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 95
    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v4

    .line 96
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 97
    invoke-virtual {v7, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object v8, v2

    .line 99
    :goto_0
    instance-of v9, v4, Lcom/vladsch/flexmark/util/ast/TypographicText;

    if-nez v9, :cond_1

    instance-of v9, v4, Lcom/vladsch/flexmark/ast/Text;

    if-eqz v9, :cond_3

    .line 100
    :cond_1
    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v9

    invoke-interface {v9, v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isContinuationOf(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Z

    move-result v9

    if-eqz v9, :cond_3

    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v9

    const-string v10, " "

    invoke-interface {v9, v10}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->startsWith(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_3

    invoke-interface {v3, v10}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->endsWith(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_1

    .line 101
    :cond_2
    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    .line 102
    invoke-virtual {v7, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 104
    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v8

    move-object/from16 v16, v8

    move-object v8, v4

    move-object/from16 v4, v16

    goto :goto_0

    .line 107
    :cond_3
    :goto_1
    invoke-static {v7}, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->of(Ljava/util/List;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    goto :goto_2

    :cond_4
    move-object v8, v2

    .line 111
    :goto_2
    new-instance v4, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;

    invoke-direct {v4, v3}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 112
    invoke-static {v3, v4}, Lcom/vladsch/flexmark/util/html/Escaping;->unescape(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v7

    .line 114
    iget-boolean v9, v0, Lcom/vladsch/flexmark/ext/autolink/internal/AutolinkNodePostProcessor;->intellijDummyIdentifier:Z

    if-eqz v9, :cond_5

    .line 115
    const-string v9, "\u001f"

    invoke-static {v7, v9, v4}, Lcom/vladsch/flexmark/util/html/Escaping;->removeAll(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/lang/CharSequence;Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v7

    .line 118
    :cond_5
    iget-object v9, v0, Lcom/vladsch/flexmark/ext/autolink/internal/AutolinkNodePostProcessor;->linkExtractor:Lorg/nibor/autolink/LinkExtractor;

    invoke-virtual {v9, v7}, Lorg/nibor/autolink/LinkExtractor;->extractLinks(Ljava/lang/CharSequence;)Ljava/lang/Iterable;

    move-result-object v9

    .line 119
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 121
    invoke-interface {v9}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_3
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_6

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/nibor/autolink/LinkSpan;

    .line 122
    invoke-virtual {v10, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 125
    :cond_6
    sget-object v9, Lcom/vladsch/flexmark/ext/autolink/internal/AutolinkNodePostProcessor;->URI_PREFIX:Ljava/util/regex/Pattern;

    invoke-virtual {v9, v7}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v9

    .line 126
    :goto_4
    invoke-virtual {v9}, Ljava/util/regex/Matcher;->find()Z

    move-result v11

    if-eqz v11, :cond_b

    .line 127
    invoke-virtual {v9, v6}, Ljava/util/regex/Matcher;->start(I)I

    move-result v11

    .line 128
    invoke-virtual {v9, v6}, Ljava/util/regex/Matcher;->end(I)I

    move-result v12

    .line 130
    invoke-virtual {v10}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v13

    if-eqz v13, :cond_7

    .line 131
    new-instance v13, Lcom/vladsch/flexmark/ext/autolink/internal/AutolinkNodePostProcessor$DummyLinkSpan;

    sget-object v14, Lorg/nibor/autolink/LinkType;->URL:Lorg/nibor/autolink/LinkType;

    invoke-direct {v13, v14, v11, v12}, Lcom/vladsch/flexmark/ext/autolink/internal/AutolinkNodePostProcessor$DummyLinkSpan;-><init>(Lorg/nibor/autolink/LinkType;II)V

    invoke-virtual {v10, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_6

    .line 133
    :cond_7
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v13

    const/4 v14, 0x0

    :goto_5
    if-ge v14, v13, :cond_a

    .line 137
    invoke-virtual {v10, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lorg/nibor/autolink/LinkSpan;

    .line 138
    invoke-interface {v15}, Lorg/nibor/autolink/LinkSpan;->getBeginIndex()I

    move-result v6

    if-ge v12, v6, :cond_8

    .line 140
    new-instance v6, Lcom/vladsch/flexmark/ext/autolink/internal/AutolinkNodePostProcessor$DummyLinkSpan;

    sget-object v13, Lorg/nibor/autolink/LinkType;->URL:Lorg/nibor/autolink/LinkType;

    invoke-direct {v6, v13, v11, v12}, Lcom/vladsch/flexmark/ext/autolink/internal/AutolinkNodePostProcessor$DummyLinkSpan;-><init>(Lorg/nibor/autolink/LinkType;II)V

    invoke-virtual {v10, v14, v6}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_6

    .line 143
    :cond_8
    invoke-interface {v15}, Lorg/nibor/autolink/LinkSpan;->getBeginIndex()I

    move-result v6

    if-lt v11, v6, :cond_9

    invoke-interface {v15}, Lorg/nibor/autolink/LinkSpan;->getEndIndex()I

    move-result v6

    if-gt v12, v6, :cond_9

    goto :goto_6

    :cond_9
    add-int/lit8 v14, v14, 0x1

    const/4 v6, 0x1

    goto :goto_5

    .line 151
    :cond_a
    new-instance v6, Lcom/vladsch/flexmark/ext/autolink/internal/AutolinkNodePostProcessor$DummyLinkSpan;

    sget-object v13, Lorg/nibor/autolink/LinkType;->URL:Lorg/nibor/autolink/LinkType;

    invoke-direct {v6, v13, v11, v12}, Lcom/vladsch/flexmark/ext/autolink/internal/AutolinkNodePostProcessor$DummyLinkSpan;-><init>(Lorg/nibor/autolink/LinkType;II)V

    invoke-virtual {v10, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_6
    const/4 v6, 0x1

    goto :goto_4

    .line 157
    :cond_b
    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/ast/Node;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v6

    instance-of v6, v6, Lcom/vladsch/flexmark/ast/TextBase;

    xor-int/lit8 v9, v6, 0x1

    if-eqz v6, :cond_d

    .line 158
    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/ast/Node;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v6

    instance-of v6, v6, Lcom/vladsch/flexmark/ast/TextBase;

    if-nez v6, :cond_c

    goto :goto_7

    :cond_c
    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/ast/Node;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v6

    check-cast v6, Lcom/vladsch/flexmark/ast/TextBase;

    goto :goto_8

    :cond_d
    :goto_7
    const/4 v6, 0x0

    .line 161
    :goto_8
    invoke-virtual {v10}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    const/4 v11, 0x0

    const/4 v12, 0x0

    :goto_9
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_15

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lorg/nibor/autolink/LinkSpan;

    .line 162
    invoke-interface {v13}, Lorg/nibor/autolink/LinkSpan;->getBeginIndex()I

    move-result v14

    invoke-interface {v13}, Lorg/nibor/autolink/LinkSpan;->getEndIndex()I

    move-result v15

    invoke-interface {v7, v14, v15}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v14

    invoke-interface {v14}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trimEnd()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v14

    .line 163
    invoke-virtual {v0, v14}, Lcom/vladsch/flexmark/ext/autolink/internal/AutolinkNodePostProcessor;->isIgnoredLinkPrefix(Ljava/lang/CharSequence;)Z

    move-result v15

    if-eqz v15, :cond_e

    goto :goto_9

    .line 165
    :cond_e
    invoke-interface {v13}, Lorg/nibor/autolink/LinkSpan;->getBeginIndex()I

    move-result v12

    invoke-virtual {v4, v12}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->originalOffset(I)I

    move-result v12

    if-nez v11, :cond_f

    if-eq v2, v8, :cond_f

    .line 170
    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v15

    invoke-interface {v15}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v15

    if-lt v12, v15, :cond_f

    goto/16 :goto_10

    :cond_f
    if-eqz v9, :cond_10

    .line 178
    new-instance v6, Lcom/vladsch/flexmark/ast/TextBase;

    invoke-direct {v6, v3}, Lcom/vladsch/flexmark/ast/TextBase;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 179
    invoke-virtual {v2, v6}, Lcom/vladsch/flexmark/util/ast/Node;->insertBefore(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 180
    invoke-interface {v1, v6}, Lcom/vladsch/flexmark/util/NodeTracker;->nodeAdded(Lcom/vladsch/flexmark/util/ast/Node;)V

    const/4 v9, 0x0

    :cond_10
    if-le v12, v11, :cond_12

    .line 184
    invoke-interface {v3, v11, v12}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v11

    .line 185
    new-instance v12, Lcom/vladsch/flexmark/ast/Text;

    invoke-direct {v12, v11}, Lcom/vladsch/flexmark/ast/Text;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    if-eqz v6, :cond_11

    .line 187
    invoke-virtual {v6, v12}, Lcom/vladsch/flexmark/ast/TextBase;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    goto :goto_a

    .line 189
    :cond_11
    invoke-virtual {v2, v12}, Lcom/vladsch/flexmark/util/ast/Node;->insertBefore(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 191
    :goto_a
    invoke-interface {v1, v12}, Lcom/vladsch/flexmark/util/NodeTracker;->nodeAdded(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 196
    :cond_12
    invoke-interface {v14}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v11

    invoke-interface {v14}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v12

    invoke-interface {v14, v11, v12}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v11

    .line 197
    new-instance v12, Lcom/vladsch/flexmark/ast/Text;

    invoke-direct {v12, v11}, Lcom/vladsch/flexmark/ast/Text;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 200
    invoke-interface {v13}, Lorg/nibor/autolink/LinkSpan;->getType()Lorg/nibor/autolink/LinkType;

    move-result-object v15

    sget-object v5, Lorg/nibor/autolink/LinkType;->EMAIL:Lorg/nibor/autolink/LinkType;

    if-ne v15, v5, :cond_13

    .line 201
    new-instance v5, Lcom/vladsch/flexmark/ast/MailLink;

    invoke-direct {v5}, Lcom/vladsch/flexmark/ast/MailLink;-><init>()V

    .line 202
    move-object v15, v5

    check-cast v15, Lcom/vladsch/flexmark/ast/MailLink;

    invoke-virtual {v5, v11}, Lcom/vladsch/flexmark/ast/MailLink;->setText(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    goto :goto_b

    .line 204
    :cond_13
    new-instance v5, Lcom/vladsch/flexmark/ast/AutoLink;

    invoke-direct {v5}, Lcom/vladsch/flexmark/ast/AutoLink;-><init>()V

    .line 205
    move-object v15, v5

    check-cast v15, Lcom/vladsch/flexmark/ast/AutoLink;

    invoke-virtual {v5, v11}, Lcom/vladsch/flexmark/ast/AutoLink;->setText(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 206
    invoke-virtual {v5, v11}, Lcom/vladsch/flexmark/ast/AutoLink;->setUrlChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 209
    :goto_b
    invoke-virtual {v5}, Lcom/vladsch/flexmark/ast/LinkNode;->setCharsFromContent()V

    .line 210
    invoke-virtual {v5, v12}, Lcom/vladsch/flexmark/ast/LinkNode;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    if-eqz v6, :cond_14

    .line 212
    invoke-virtual {v6, v5}, Lcom/vladsch/flexmark/ast/TextBase;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    goto :goto_c

    .line 214
    :cond_14
    invoke-virtual {v2, v5}, Lcom/vladsch/flexmark/util/ast/Node;->insertBefore(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 216
    :goto_c
    invoke-interface {v1, v5}, Lcom/vladsch/flexmark/util/NodeTracker;->nodeAddedWithChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 218
    invoke-interface {v13}, Lorg/nibor/autolink/LinkSpan;->getBeginIndex()I

    move-result v5

    invoke-interface {v14}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v11

    add-int/2addr v5, v11

    invoke-virtual {v4, v5}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->originalOffset(I)I

    move-result v11

    const/4 v5, 0x0

    const/4 v12, 0x1

    goto/16 :goto_9

    :cond_15
    if-lez v11, :cond_1a

    if-eq v2, v8, :cond_18

    .line 224
    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v4

    .line 225
    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v5

    invoke-interface {v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v5

    :goto_d
    if-eqz v4, :cond_18

    if-lt v5, v11, :cond_16

    const/4 v7, 0x0

    .line 230
    invoke-interface {v3, v7, v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    goto :goto_e

    :cond_16
    const/4 v7, 0x0

    .line 234
    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v9

    invoke-interface {v9}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v9

    add-int/2addr v5, v9

    .line 235
    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v9

    .line 236
    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/ast/Node;->unlink()V

    .line 237
    invoke-interface {v1, v4}, Lcom/vladsch/flexmark/util/NodeTracker;->nodeRemoved(Lcom/vladsch/flexmark/util/ast/Node;)V

    if-ne v4, v8, :cond_17

    goto :goto_e

    :cond_17
    move-object v4, v9

    goto :goto_d

    .line 245
    :cond_18
    :goto_e
    invoke-interface {v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v4

    if-ge v11, v4, :cond_1a

    .line 246
    invoke-interface {v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v4

    invoke-interface {v3, v11, v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    .line 247
    new-instance v4, Lcom/vladsch/flexmark/ast/Text;

    invoke-direct {v4, v3}, Lcom/vladsch/flexmark/ast/Text;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    if-eqz v6, :cond_19

    .line 249
    invoke-virtual {v6, v4}, Lcom/vladsch/flexmark/ast/TextBase;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    goto :goto_f

    .line 251
    :cond_19
    invoke-virtual {v2, v4}, Lcom/vladsch/flexmark/util/ast/Node;->insertBefore(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 253
    :goto_f
    invoke-interface {v1, v4}, Lcom/vladsch/flexmark/util/NodeTracker;->nodeAdded(Lcom/vladsch/flexmark/util/ast/Node;)V

    :cond_1a
    if-eqz v12, :cond_1b

    .line 258
    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/ast/Node;->unlink()V

    .line 259
    invoke-interface/range {p1 .. p2}, Lcom/vladsch/flexmark/util/NodeTracker;->nodeRemoved(Lcom/vladsch/flexmark/util/ast/Node;)V

    :cond_1b
    :goto_10
    return-void
.end method
