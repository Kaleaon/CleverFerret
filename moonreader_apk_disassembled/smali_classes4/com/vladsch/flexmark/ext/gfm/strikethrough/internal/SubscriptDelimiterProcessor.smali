.class public Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/SubscriptDelimiterProcessor;
.super Ljava/lang/Object;
.source "SubscriptDelimiterProcessor.java"

# interfaces
.implements Lcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public canBeCloser(Ljava/lang/String;Ljava/lang/String;ZZZZZZ)Z
    .locals 0

    return p4
.end method

.method public canBeOpener(Ljava/lang/String;Ljava/lang/String;ZZZZZZ)Z
    .locals 0

    return p3
.end method

.method public getClosingCharacter()C
    .locals 1

    const/16 v0, 0x7e

    return v0
.end method

.method public getDelimiterUse(Lcom/vladsch/flexmark/parser/delimiter/DelimiterRun;Lcom/vladsch/flexmark/parser/delimiter/DelimiterRun;)I
    .locals 1

    .line 50
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/delimiter/DelimiterRun;->length()I

    move-result p1

    const/4 v0, 0x1

    if-lt p1, v0, :cond_0

    invoke-interface {p2}, Lcom/vladsch/flexmark/parser/delimiter/DelimiterRun;->length()I

    move-result p1

    if-lt p1, v0, :cond_0

    return v0

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public getMinLength()I
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public getOpeningCharacter()C
    .locals 1

    const/16 v0, 0x7e

    return v0
.end method

.method public process(Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;I)V
    .locals 3

    .line 61
    new-instance v0, Lcom/vladsch/flexmark/ext/gfm/strikethrough/Subscript;

    invoke-virtual {p1, p3}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getTailChars(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    sget-object v2, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual {p2, p3}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getLeadChars(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p3

    invoke-direct {v0, v1, v2, p3}, Lcom/vladsch/flexmark/ext/gfm/strikethrough/Subscript;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 62
    invoke-virtual {p1, v0, p2}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->moveNodesBetweenDelimitersTo(Lcom/vladsch/flexmark/ast/DelimitedNode;Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;)V

    return-void
.end method

.method public skipNonOpenerCloser()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public unmatchedDelimiterNode(Lcom/vladsch/flexmark/parser/InlineParser;Lcom/vladsch/flexmark/parser/delimiter/DelimiterRun;)Lcom/vladsch/flexmark/util/ast/Node;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method
