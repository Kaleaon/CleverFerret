.class public Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteLinkRefProcessor;
.super Ljava/lang/Object;
.source "FootnoteLinkRefProcessor.java"

# interfaces
.implements Lcom/vladsch/flexmark/parser/LinkRefProcessor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteLinkRefProcessor$Factory;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field static final BRACKET_NESTING_LEVEL:I = 0x0

.field static final WANT_EXCLAMATION_PREFIX:Z = false


# instance fields
.field private final footnoteRepository:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/ast/Document;)V
    .locals 1

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    sget-object v0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteExtension;->FOOTNOTES:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/util/ast/Document;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;

    iput-object p1, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteLinkRefProcessor;->footnoteRepository:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;

    return-void
.end method


# virtual methods
.method public adjustInlineText(Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/util/ast/Node;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 0

    .line 55
    check-cast p2, Lcom/vladsch/flexmark/ext/footnotes/Footnote;

    invoke-virtual {p2}, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1
.end method

.method public allowDelimiters(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/util/ast/Node;)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method

.method public createNode(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/ast/Node;
    .locals 5

    const/4 v0, -0x1

    const/4 v1, 0x2

    .line 40
    invoke-interface {p1, v1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->midSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trim()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    .line 41
    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v2

    if-lez v2, :cond_0

    iget-object v2, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteLinkRefProcessor;->footnoteRepository:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 43
    :goto_0
    new-instance v3, Lcom/vladsch/flexmark/ext/footnotes/Footnote;

    const/4 v4, 0x0

    invoke-interface {p1, v4, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    const/4 v4, 0x1

    invoke-interface {p1, v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->endSequence(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-direct {v3, v1, v0, p1}, Lcom/vladsch/flexmark/ext/footnotes/Footnote;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 44
    invoke-virtual {v3, v2}, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->setFootnoteBlock(Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;)V

    if-eqz v2, :cond_1

    .line 47
    iget-object p1, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteLinkRefProcessor;->footnoteRepository:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;

    invoke-virtual {p1, v2, v3}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;->addFootnoteReference(Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;Lcom/vladsch/flexmark/ext/footnotes/Footnote;)V

    :cond_1
    return-object v3
.end method

.method public getBracketNestingLevel()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getWantExclamationPrefix()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isMatch(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Z
    .locals 4

    .line 35
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v0

    const/4 v1, 0x3

    const/4 v2, 0x0

    if-lt v0, v1, :cond_0

    invoke-interface {p1, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v0

    const/16 v1, 0x5b

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v1

    const/16 v3, 0x5e

    if-ne v1, v3, :cond_0

    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->endCharAt(I)C

    move-result p1

    const/16 v1, 0x5d

    if-ne p1, v1, :cond_0

    return v0

    :cond_0
    return v2
.end method

.method public updateNodeElements(Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 0

    return-void
.end method
