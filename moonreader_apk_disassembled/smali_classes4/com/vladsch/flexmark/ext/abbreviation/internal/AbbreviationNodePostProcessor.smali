.class public Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodePostProcessor;
.super Lcom/vladsch/flexmark/parser/block/NodePostProcessor;
.source "AbbreviationNodePostProcessor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodePostProcessor$Factory;
    }
.end annotation


# instance fields
.field private abbreviationMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            ">;"
        }
    .end annotation
.end field

.field private abbreviations:Ljava/util/regex/Pattern;


# direct methods
.method private constructor <init>(Lcom/vladsch/flexmark/util/ast/Document;)V
    .locals 1

    .line 33
    invoke-direct {p0}, Lcom/vladsch/flexmark/parser/block/NodePostProcessor;-><init>()V

    const/4 v0, 0x0

    .line 30
    iput-object v0, p0, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodePostProcessor;->abbreviations:Ljava/util/regex/Pattern;

    .line 31
    iput-object v0, p0, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodePostProcessor;->abbreviationMap:Ljava/util/HashMap;

    .line 34
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodePostProcessor;->computeAbbreviations(Lcom/vladsch/flexmark/util/ast/Document;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodePostProcessor$1;)V
    .locals 0

    .line 25
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodePostProcessor;-><init>(Lcom/vladsch/flexmark/util/ast/Document;)V

    return-void
.end method

.method private computeAbbreviations(Lcom/vladsch/flexmark/util/ast/Document;)V
    .locals 5

    .line 38
    sget-object v0, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationExtension;->ABBREVIATIONS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/util/ast/Document;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationRepository;

    .line 40
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationRepository;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4

    .line 41
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodePostProcessor;->abbreviationMap:Ljava/util/HashMap;

    .line 42
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 45
    new-instance v1, Ljava/util/ArrayList;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationRepository;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 46
    new-instance v2, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodePostProcessor$1;

    invoke-direct {v2, p0}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodePostProcessor$1;-><init>(Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodePostProcessor;)V

    invoke-static {v1, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 53
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 54
    invoke-virtual {p1, v2}, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationRepository;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;

    .line 56
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    .line 57
    invoke-virtual {v3}, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationBlock;->getAbbreviation()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    .line 58
    invoke-interface {v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    .line 59
    iget-object v4, p0, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodePostProcessor;->abbreviationMap:Ljava/util/HashMap;

    invoke-virtual {v4, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-lez v3, :cond_1

    const-string v3, "|"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    const/4 v3, 0x0

    .line 63
    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isLetterOrDigit(C)Z

    move-result v3

    const-string v4, "\\b"

    if-eqz v3, :cond_2

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    :cond_2
    const-string v3, "\\Q"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\\E"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isLetterOrDigit(C)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 70
    :cond_3
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result p1

    if-lez p1, :cond_4

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodePostProcessor;->abbreviations:Ljava/util/regex/Pattern;

    :cond_4
    return-void
.end method


# virtual methods
.method public process(Lcom/vladsch/flexmark/util/NodeTracker;Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 12

    .line 76
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodePostProcessor;->abbreviations:Ljava/util/regex/Pattern;

    if-nez v0, :cond_0

    goto/16 :goto_2

    .line 78
    :cond_0
    invoke-virtual {p2}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    .line 79
    new-instance v1, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;

    invoke-direct {v1, v0}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 80
    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/Escaping;->unescape(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    .line 82
    iget-object v3, p0, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodePostProcessor;->abbreviations:Ljava/util/regex/Pattern;

    invoke-virtual {v3, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    .line 84
    invoke-virtual {p2}, Lcom/vladsch/flexmark/util/ast/Node;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v4

    instance-of v4, v4, Lcom/vladsch/flexmark/ast/TextBase;

    xor-int/lit8 v5, v4, 0x1

    if-nez v4, :cond_1

    const/4 v4, 0x0

    goto :goto_0

    .line 85
    :cond_1
    invoke-virtual {p2}, Lcom/vladsch/flexmark/util/ast/Node;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v4

    check-cast v4, Lcom/vladsch/flexmark/ast/TextBase;

    :goto_0
    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 87
    :cond_2
    :goto_1
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->find()Z

    move-result v8

    if-eqz v8, :cond_5

    .line 89
    iget-object v8, p0, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodePostProcessor;->abbreviationMap:Ljava/util/HashMap;

    invoke-virtual {v3, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 90
    iget-object v8, p0, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationNodePostProcessor;->abbreviationMap:Ljava/util/HashMap;

    invoke-virtual {v3, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 92
    invoke-virtual {v3, v6}, Ljava/util/regex/Matcher;->start(I)I

    move-result v9

    invoke-virtual {v3, v6}, Ljava/util/regex/Matcher;->end(I)I

    move-result v10

    invoke-interface {v2, v9, v10}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 93
    invoke-virtual {v3, v6}, Ljava/util/regex/Matcher;->start(I)I

    move-result v9

    invoke-virtual {v1, v9}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->originalOffset(I)I

    move-result v9

    .line 94
    invoke-virtual {v3, v6}, Ljava/util/regex/Matcher;->end(I)I

    move-result v10

    invoke-virtual {v1, v10}, Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;->originalOffset(I)I

    move-result v10

    if-eqz v5, :cond_3

    .line 98
    new-instance v4, Lcom/vladsch/flexmark/ast/TextBase;

    invoke-direct {v4, v0}, Lcom/vladsch/flexmark/ast/TextBase;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 99
    invoke-virtual {p2, v4}, Lcom/vladsch/flexmark/util/ast/Node;->insertBefore(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 100
    invoke-interface {p1, v4}, Lcom/vladsch/flexmark/util/NodeTracker;->nodeAdded(Lcom/vladsch/flexmark/util/ast/Node;)V

    const/4 v5, 0x0

    :cond_3
    if-eq v9, v7, :cond_4

    .line 104
    invoke-interface {v0, v7, v9}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v7

    .line 105
    new-instance v11, Lcom/vladsch/flexmark/ast/Text;

    invoke-direct {v11, v7}, Lcom/vladsch/flexmark/ast/Text;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 106
    invoke-virtual {v4, v11}, Lcom/vladsch/flexmark/ast/TextBase;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 107
    invoke-interface {p1, v11}, Lcom/vladsch/flexmark/util/NodeTracker;->nodeAdded(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 110
    :cond_4
    invoke-interface {v0, v9, v10}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v7

    .line 111
    new-instance v9, Lcom/vladsch/flexmark/ext/abbreviation/Abbreviation;

    invoke-direct {v9, v7, v8}, Lcom/vladsch/flexmark/ext/abbreviation/Abbreviation;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 112
    invoke-virtual {v4, v9}, Lcom/vladsch/flexmark/ast/TextBase;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 116
    invoke-interface {p1, v9}, Lcom/vladsch/flexmark/util/NodeTracker;->nodeAdded(Lcom/vladsch/flexmark/util/ast/Node;)V

    move v7, v10

    goto :goto_1

    :cond_5
    if-lez v7, :cond_7

    .line 123
    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v1

    if-eq v7, v1, :cond_6

    .line 124
    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v1

    invoke-interface {v0, v7, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    .line 125
    new-instance v1, Lcom/vladsch/flexmark/ast/Text;

    invoke-direct {v1, v0}, Lcom/vladsch/flexmark/ast/Text;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 126
    invoke-virtual {v4, v1}, Lcom/vladsch/flexmark/ast/TextBase;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 127
    invoke-interface {p1, v1}, Lcom/vladsch/flexmark/util/NodeTracker;->nodeAdded(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 130
    :cond_6
    invoke-virtual {p2}, Lcom/vladsch/flexmark/util/ast/Node;->unlink()V

    .line 131
    invoke-interface {p1, p2}, Lcom/vladsch/flexmark/util/NodeTracker;->nodeRemoved(Lcom/vladsch/flexmark/util/ast/Node;)V

    :cond_7
    :goto_2
    return-void
.end method
