.class public Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteOptions;
.super Ljava/lang/Object;
.source "FootnoteOptions.java"


# instance fields
.field final contentIndent:I

.field final footnoteBackLinkRefClass:Ljava/lang/String;

.field final footnoteBackRefString:Ljava/lang/String;

.field final footnoteLinkRefClass:Ljava/lang/String;

.field final footnoteRefPrefix:Ljava/lang/String;

.field final footnoteRefSuffix:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    sget-object v0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteExtension;->FOOTNOTE_REF_PREFIX:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteOptions;->footnoteRefPrefix:Ljava/lang/String;

    .line 17
    sget-object v0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteExtension;->FOOTNOTE_REF_SUFFIX:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteOptions;->footnoteRefSuffix:Ljava/lang/String;

    .line 18
    sget-object v0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteExtension;->FOOTNOTE_BACK_REF_STRING:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteOptions;->footnoteBackRefString:Ljava/lang/String;

    .line 19
    sget-object v0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteExtension;->FOOTNOTE_LINK_REF_CLASS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteOptions;->footnoteLinkRefClass:Ljava/lang/String;

    .line 20
    sget-object v0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteExtension;->FOOTNOTE_BACK_LINK_REF_CLASS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteOptions;->footnoteBackLinkRefClass:Ljava/lang/String;

    .line 21
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LISTS_ITEM_INDENT:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteOptions;->contentIndent:I

    return-void
.end method
