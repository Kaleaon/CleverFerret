.class public Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughSubscriptDelimiterProcessor;
.super Ljava/lang/Object;
.source "StrikethroughSubscriptDelimiterProcessor.java"

# interfaces
.implements Lcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 13
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
    .locals 3

    .line 48
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/delimiter/DelimiterRun;->canClose()Z

    move-result v0

    const/4 v1, 0x3

    if-nez v0, :cond_0

    invoke-interface {p2}, Lcom/vladsch/flexmark/parser/delimiter/DelimiterRun;->canOpen()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/delimiter/DelimiterRun;->length()I

    move-result v0

    invoke-interface {p2}, Lcom/vladsch/flexmark/parser/delimiter/DelimiterRun;->length()I

    move-result v2

    add-int/2addr v0, v2

    rem-int/2addr v0, v1

    if-nez v0, :cond_1

    const/4 p1, 0x0

    return p1

    .line 52
    :cond_1
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/delimiter/DelimiterRun;->length()I

    move-result v0

    if-lt v0, v1, :cond_4

    invoke-interface {p2}, Lcom/vladsch/flexmark/parser/delimiter/DelimiterRun;->length()I

    move-result v0

    if-ge v0, v1, :cond_2

    goto :goto_0

    .line 56
    :cond_2
    invoke-interface {p2}, Lcom/vladsch/flexmark/parser/delimiter/DelimiterRun;->length()I

    move-result p1

    const/4 p2, 0x2

    rem-int/2addr p1, p2

    if-nez p1, :cond_3

    return p2

    :cond_3
    const/4 p1, 0x1

    return p1

    .line 53
    :cond_4
    :goto_0
    invoke-interface {p2}, Lcom/vladsch/flexmark/parser/delimiter/DelimiterRun;->length()I

    move-result v0

    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/delimiter/DelimiterRun;->length()I

    move-result v1

    if-gt v0, v1, :cond_5

    .line 54
    invoke-interface {p2}, Lcom/vladsch/flexmark/parser/delimiter/DelimiterRun;->length()I

    move-result p1

    return p1

    :cond_5
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/delimiter/DelimiterRun;->length()I

    move-result p1

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

    const/4 v0, 0x1

    if-ne p3, v0, :cond_0

    .line 68
    new-instance v0, Lcom/vladsch/flexmark/ext/gfm/strikethrough/Subscript;

    .line 69
    invoke-virtual {p1, p3}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getTailChars(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    sget-object v2, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual {p2, p3}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getLeadChars(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p3

    invoke-direct {v0, v1, v2, p3}, Lcom/vladsch/flexmark/ext/gfm/strikethrough/Subscript;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/vladsch/flexmark/ext/gfm/strikethrough/Strikethrough;

    .line 70
    invoke-virtual {p1, p3}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getTailChars(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    sget-object v2, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual {p2, p3}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getLeadChars(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p3

    invoke-direct {v0, v1, v2, p3}, Lcom/vladsch/flexmark/ext/gfm/strikethrough/Strikethrough;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    :goto_0
    check-cast v0, Lcom/vladsch/flexmark/ast/DelimitedNode;

    .line 72
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
