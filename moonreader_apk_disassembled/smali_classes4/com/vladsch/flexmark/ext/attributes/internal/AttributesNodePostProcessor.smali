.class public Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodePostProcessor;
.super Lcom/vladsch/flexmark/parser/block/NodePostProcessor;
.source "AttributesNodePostProcessor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodePostProcessor$Factory;
    }
.end annotation


# instance fields
.field private final myOptions:Lcom/vladsch/flexmark/ext/attributes/internal/AttributesOptions;

.field private final nodeAttributeRepository:Lcom/vladsch/flexmark/ext/attributes/internal/NodeAttributeRepository;


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/ast/Document;)V
    .locals 1

    .line 22
    invoke-direct {p0}, Lcom/vladsch/flexmark/parser/block/NodePostProcessor;-><init>()V

    .line 23
    sget-object v0, Lcom/vladsch/flexmark/ext/attributes/AttributesExtension;->NODE_ATTRIBUTES:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/ext/attributes/internal/NodeAttributeRepository;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodePostProcessor;->nodeAttributeRepository:Lcom/vladsch/flexmark/ext/attributes/internal/NodeAttributeRepository;

    .line 24
    new-instance v0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesOptions;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesOptions;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodePostProcessor;->myOptions:Lcom/vladsch/flexmark/ext/attributes/internal/AttributesOptions;

    return-void
.end method

.method static matchDelimitedSpans(Lcom/vladsch/flexmark/util/NodeTracker;Lcom/vladsch/flexmark/ext/attributes/AttributesNode;Lcom/vladsch/flexmark/util/ast/Node;)Lcom/vladsch/flexmark/util/ast/Node;
    .locals 5

    .line 162
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->getPrevious()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    .line 164
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    :goto_0
    if-eqz v0, :cond_5

    .line 167
    instance-of v2, v0, Lcom/vladsch/flexmark/ext/attributes/AttributesDelimiter;

    if-eqz v2, :cond_3

    .line 168
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 170
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vladsch/flexmark/util/ast/Node;

    .line 171
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v3

    if-eq v2, v3, :cond_0

    .line 173
    new-instance v4, Lcom/vladsch/flexmark/ast/TextBase;

    invoke-direct {v4}, Lcom/vladsch/flexmark/ast/TextBase;-><init>()V

    .line 175
    invoke-static {p0, v3, v2, v4}, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodePostProcessor;->textBaseWrap(Lcom/vladsch/flexmark/util/NodeTracker;Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/ast/TextBase;)V

    goto :goto_1

    :cond_0
    move-object p2, v0

    goto :goto_1

    .line 182
    :cond_1
    new-instance p2, Lcom/vladsch/flexmark/ast/TextBase;

    invoke-direct {p2}, Lcom/vladsch/flexmark/ast/TextBase;-><init>()V

    .line 183
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v2

    if-eq v2, p1, :cond_2

    .line 186
    invoke-static {p0, v2, p1, p2}, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodePostProcessor;->textBaseWrap(Lcom/vladsch/flexmark/util/NodeTracker;Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/ast/TextBase;)V

    goto :goto_2

    :cond_2
    move-object p2, v0

    goto :goto_2

    .line 193
    :cond_3
    instance-of v2, v0, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;

    if-eqz v2, :cond_4

    .line 194
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 199
    :cond_4
    :goto_1
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getPrevious()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    goto :goto_0

    .line 202
    :cond_5
    :goto_2
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_7

    const/4 p0, 0x0

    .line 204
    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/vladsch/flexmark/util/ast/Node;

    .line 205
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p2

    if-eqz p2, :cond_6

    if-eq p2, p1, :cond_6

    return-object p2

    :cond_6
    return-object p0

    :cond_7
    return-object p2
.end method

.method static textBaseWrap(Lcom/vladsch/flexmark/util/NodeTracker;Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/ast/TextBase;)V
    .locals 1

    :goto_0
    if-eq p1, p2, :cond_0

    .line 216
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    .line 217
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->unlink()V

    .line 218
    invoke-interface {p0, p1}, Lcom/vladsch/flexmark/util/NodeTracker;->nodeRemoved(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 219
    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/ast/TextBase;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    move-object p1, v0

    goto :goto_0

    .line 222
    :cond_0
    invoke-virtual {p3}, Lcom/vladsch/flexmark/ast/TextBase;->setCharsFromContent()V

    .line 223
    invoke-virtual {p2, p3}, Lcom/vladsch/flexmark/util/ast/Node;->insertBefore(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 224
    invoke-interface {p0, p3}, Lcom/vladsch/flexmark/util/NodeTracker;->nodeAddedWithDescendants(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method


# virtual methods
.method public getAttributeOwner(Lcom/vladsch/flexmark/util/NodeTracker;Lcom/vladsch/flexmark/ext/attributes/AttributesNode;)Lcom/vladsch/flexmark/util/ast/Node;
    .locals 8

    const/4 v0, 0x2

    .line 28
    new-array v1, v0, [Ljava/lang/Class;

    const-class v2, Lcom/vladsch/flexmark/util/ast/BlankLine;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-class v2, Lcom/vladsch/flexmark/util/ast/DoNotAttributeDecorate;

    const/4 v4, 0x1

    aput-object v2, v1, v4

    invoke-virtual {p2, v1}, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->getPreviousAnyNot([Ljava/lang/Class;)Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v1

    .line 29
    invoke-virtual {p2}, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    .line 31
    invoke-virtual {p2}, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v2

    if-nez v1, :cond_3

    .line 54
    instance-of p1, v2, Lcom/vladsch/flexmark/ast/Paragraph;

    if-eqz p1, :cond_8

    .line 55
    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/ast/Node;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p1

    instance-of p1, p1, Lcom/vladsch/flexmark/ast/ParagraphItemContainer;

    if-eqz p1, :cond_1

    .line 56
    new-array p1, v4, [Ljava/lang/Class;

    const-class v1, Lcom/vladsch/flexmark/util/ast/BlankLine;

    aput-object v1, p1, v3

    invoke-virtual {v2, p1}, Lcom/vladsch/flexmark/util/ast/Node;->getPreviousAnyNot([Ljava/lang/Class;)Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p1

    if-nez p1, :cond_0

    .line 59
    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/ast/Node;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p1

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p1

    return-object p1

    .line 61
    :cond_0
    new-array v0, v0, [Ljava/lang/Class;

    const-class v1, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;

    aput-object v1, v0, v3

    const-class v1, Lcom/vladsch/flexmark/util/ast/BlankLine;

    aput-object v1, v0, v4

    invoke-virtual {p2, v0}, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->getNextAnyNot([Ljava/lang/Class;)Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p2

    if-nez p2, :cond_8

    return-object p1

    .line 70
    :cond_1
    new-array p1, v0, [Ljava/lang/Class;

    const-class v0, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;

    aput-object v0, p1, v3

    const-class v0, Lcom/vladsch/flexmark/util/ast/BlankLine;

    aput-object v0, p1, v4

    invoke-virtual {p2, p1}, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->getNextAnyNot([Ljava/lang/Class;)Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p1

    if-nez p1, :cond_8

    .line 71
    new-array p1, v4, [Ljava/lang/Class;

    const-class p2, Lcom/vladsch/flexmark/util/ast/BlankLine;

    aput-object p2, p1, v3

    invoke-virtual {v2, p1}, Lcom/vladsch/flexmark/util/ast/Node;->getPreviousAnyNot([Ljava/lang/Class;)Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p1

    if-nez p1, :cond_2

    .line 74
    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/ast/Node;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p1

    :cond_2
    return-object p1

    .line 89
    :cond_3
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodePostProcessor;->myOptions:Lcom/vladsch/flexmark/ext/attributes/internal/AttributesOptions;

    iget-boolean v0, v0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesOptions;->assignTextAttributes:Z

    if-nez v0, :cond_4

    instance-of v0, v1, Lcom/vladsch/flexmark/ast/Text;

    if-nez v0, :cond_5

    instance-of v0, v1, Lcom/vladsch/flexmark/ast/TextBase;

    if-nez v0, :cond_5

    :cond_4
    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v0

    invoke-virtual {p2}, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->getStartOffset()I

    move-result v5

    if-ge v0, v5, :cond_9

    .line 93
    :cond_5
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodePostProcessor;->myOptions:Lcom/vladsch/flexmark/ext/attributes/internal/AttributesOptions;

    iget-boolean v0, v0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesOptions;->useEmptyImplicitAsSpanDelimiter:Z

    if-eqz v0, :cond_6

    .line 95
    invoke-static {p1, p2, v1}, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodePostProcessor;->matchDelimitedSpans(Lcom/vladsch/flexmark/util/NodeTracker;Lcom/vladsch/flexmark/ext/attributes/AttributesNode;Lcom/vladsch/flexmark/util/ast/Node;)Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v1

    .line 98
    :cond_6
    instance-of p1, v1, Lcom/vladsch/flexmark/ast/TextBase;

    if-eqz p1, :cond_7

    return-object v1

    .line 101
    :cond_7
    instance-of p1, v2, Lcom/vladsch/flexmark/ast/Paragraph;

    if-eqz p1, :cond_8

    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/ast/Node;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p1

    instance-of p1, p1, Lcom/vladsch/flexmark/ast/ParagraphItemContainer;

    if-eqz p1, :cond_8

    .line 102
    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/ast/Node;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p1

    return-object p1

    :cond_8
    return-object v2

    .line 108
    :cond_9
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodePostProcessor;->myOptions:Lcom/vladsch/flexmark/ext/attributes/internal/AttributesOptions;

    iget-boolean v0, v0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesOptions;->wrapNonAttributeText:Z

    const/4 v2, 0x0

    if-eqz v0, :cond_d

    .line 110
    invoke-virtual {p2}, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->getPrevious()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    move-object v5, v2

    :goto_0
    if-eqz v0, :cond_c

    .line 114
    instance-of v6, v0, Lcom/vladsch/flexmark/ast/Text;

    if-nez v6, :cond_a

    instance-of v6, v0, Lcom/vladsch/flexmark/util/ast/DoNotAttributeDecorate;

    if-eqz v6, :cond_c

    .line 115
    :cond_a
    instance-of v5, v0, Lcom/vladsch/flexmark/util/ast/DoNotAttributeDecorate;

    if-eqz v5, :cond_b

    const/4 v3, 0x1

    .line 119
    :cond_b
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getPrevious()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v5

    move-object v7, v5

    move-object v5, v0

    move-object v0, v7

    goto :goto_0

    :cond_c
    if-eqz v3, :cond_d

    .line 124
    new-instance v1, Lcom/vladsch/flexmark/ast/TextBase;

    invoke-direct {v1}, Lcom/vladsch/flexmark/ast/TextBase;-><init>()V

    .line 125
    invoke-static {p1, v5, p2, v1}, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodePostProcessor;->textBaseWrap(Lcom/vladsch/flexmark/util/NodeTracker;Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/ast/TextBase;)V

    .line 130
    :cond_d
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodePostProcessor;->myOptions:Lcom/vladsch/flexmark/ext/attributes/internal/AttributesOptions;

    iget-boolean v0, v0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesOptions;->useEmptyImplicitAsSpanDelimiter:Z

    if-eqz v0, :cond_e

    .line 132
    invoke-static {p1, p2, v1}, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodePostProcessor;->matchDelimitedSpans(Lcom/vladsch/flexmark/util/NodeTracker;Lcom/vladsch/flexmark/ext/attributes/AttributesNode;Lcom/vladsch/flexmark/util/ast/Node;)Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v1

    .line 135
    :cond_e
    instance-of p2, v1, Lcom/vladsch/flexmark/ast/Text;

    if-eqz p2, :cond_f

    .line 137
    new-instance p2, Lcom/vladsch/flexmark/ast/TextBase;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-direct {p2, v0}, Lcom/vladsch/flexmark/ast/TextBase;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 138
    invoke-virtual {v1, p2}, Lcom/vladsch/flexmark/util/ast/Node;->insertBefore(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 139
    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/ast/Node;->unlink()V

    .line 140
    invoke-interface {p1, v1}, Lcom/vladsch/flexmark/util/NodeTracker;->nodeRemoved(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 142
    invoke-virtual {p2, v1}, Lcom/vladsch/flexmark/ast/TextBase;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 143
    invoke-interface {p1, p2}, Lcom/vladsch/flexmark/util/NodeTracker;->nodeAddedWithChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-object p2

    .line 145
    :cond_f
    instance-of p2, v1, Lcom/vladsch/flexmark/ext/attributes/AttributesDelimiter;

    if-eqz p2, :cond_10

    return-object v2

    .line 149
    :cond_10
    instance-of p2, v1, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;

    if-eqz p2, :cond_11

    .line 151
    check-cast v1, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;

    invoke-virtual {p0, p1, v1}, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodePostProcessor;->getAttributeOwner(Lcom/vladsch/flexmark/util/NodeTracker;Lcom/vladsch/flexmark/ext/attributes/AttributesNode;)Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p1

    return-object p1

    :cond_11
    return-object v1
.end method

.method public process(Lcom/vladsch/flexmark/util/NodeTracker;Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 3

    .line 229
    instance-of v0, p2, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;

    if-eqz v0, :cond_5

    .line 230
    check-cast p2, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;

    .line 233
    invoke-virtual {p2}, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->getPrevious()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    .line 234
    invoke-virtual {p2}, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v1

    if-nez v0, :cond_1

    if-eqz v1, :cond_1

    .line 240
    instance-of v2, v1, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;

    if-nez v2, :cond_1

    .line 241
    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isBlank()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 244
    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v2

    .line 245
    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/ast/Node;->unlink()V

    .line 246
    invoke-interface {p1, v1}, Lcom/vladsch/flexmark/util/NodeTracker;->nodeRemoved(Lcom/vladsch/flexmark/util/ast/Node;)V

    move-object v1, v2

    goto :goto_0

    .line 248
    :cond_0
    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trimStart()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vladsch/flexmark/util/ast/Node;->setChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    :cond_1
    :goto_0
    if-nez v1, :cond_3

    if-eqz v0, :cond_3

    .line 255
    instance-of v1, v0, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;

    if-nez v1, :cond_3

    .line 256
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isBlank()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 259
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getPrevious()Lcom/vladsch/flexmark/util/ast/Node;

    .line 260
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->unlink()V

    .line 261
    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/util/NodeTracker;->nodeRemoved(Lcom/vladsch/flexmark/util/ast/Node;)V

    goto :goto_1

    .line 263
    :cond_2
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trimEnd()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/util/ast/Node;->setChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 268
    :cond_3
    :goto_1
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodePostProcessor;->getAttributeOwner(Lcom/vladsch/flexmark/util/NodeTracker;Lcom/vladsch/flexmark/ext/attributes/AttributesNode;)Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p1

    if-eqz p1, :cond_5

    .line 270
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodePostProcessor;->nodeAttributeRepository:Lcom/vladsch/flexmark/ext/attributes/internal/NodeAttributeRepository;

    invoke-virtual {v0, p1, p2}, Lcom/vladsch/flexmark/ext/attributes/internal/NodeAttributeRepository;->put(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/ext/attributes/AttributesNode;)Ljava/util/ArrayList;

    .line 273
    instance-of v0, p1, Lcom/vladsch/flexmark/ast/AnchorRefTarget;

    if-eqz v0, :cond_5

    .line 274
    invoke-virtual {p2}, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;->getReversedChildren()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;

    move-result-object p2

    invoke-interface {p2}, Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    move-result-object p2

    :cond_4
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/ast/Node;

    .line 275
    instance-of v1, v0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;

    if-eqz v1, :cond_4

    .line 276
    check-cast v0, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->isId()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 277
    check-cast p1, Lcom/vladsch/flexmark/ast/AnchorRefTarget;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/ext/attributes/AttributeNode;->getValue()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, p2}, Lcom/vladsch/flexmark/ast/AnchorRefTarget;->setAnchorRefId(Ljava/lang/String;)V

    :cond_5
    return-void
.end method
