.class public Lcom/vladsch/flexmark/parser/InlineParserOptions;
.super Ljava/lang/Object;
.source "InlineParserOptions.java"


# instance fields
.field public final codeSoftLineBreaks:Z

.field public final hardLineBreakLimit:Z

.field public final inlineDelimiterDirectionalPunctuations:Z

.field public final linksAllowMatchedParentheses:Z

.field public final matchLookaheadFirst:Z

.field public final parseMultiLineImageUrls:Z

.field public final spaceInLinkElements:Z

.field public final spaceInLinkUrls:Z

.field public final wwwAutoLinkElement:Z


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 1

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->MATCH_NESTED_LINK_REFS_FIRST:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/InlineParserOptions;->matchLookaheadFirst:Z

    .line 18
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->PARSE_MULTI_LINE_IMAGE_URLS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/InlineParserOptions;->parseMultiLineImageUrls:Z

    .line 19
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->HARD_LINE_BREAK_LIMIT:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/InlineParserOptions;->hardLineBreakLimit:Z

    .line 20
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->SPACE_IN_LINK_URLS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/InlineParserOptions;->spaceInLinkUrls:Z

    .line 21
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->SPACE_IN_LINK_ELEMENTS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/InlineParserOptions;->spaceInLinkElements:Z

    .line 22
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->WWW_AUTO_LINK_ELEMENT:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/InlineParserOptions;->wwwAutoLinkElement:Z

    .line 23
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->CODE_SOFT_LINE_BREAKS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/InlineParserOptions;->codeSoftLineBreaks:Z

    .line 24
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->INLINE_DELIMITER_DIRECTIONAL_PUNCTUATIONS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/InlineParserOptions;->inlineDelimiterDirectionalPunctuations:Z

    .line 25
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LINKS_ALLOW_MATCHED_PARENTHESES:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/InlineParserOptions;->linksAllowMatchedParentheses:Z

    return-void
.end method
