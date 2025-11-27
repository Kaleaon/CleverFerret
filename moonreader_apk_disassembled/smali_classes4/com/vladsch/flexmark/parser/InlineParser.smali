.class public interface abstract Lcom/vladsch/flexmark/parser/InlineParser;
.super Ljava/lang/Object;
.source "InlineParser.java"


# virtual methods
.method public abstract appendNode(Lcom/vladsch/flexmark/util/ast/Node;)V
.end method

.method public abstract appendSeparateText(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/ast/Text;
.end method

.method public abstract appendText(Lcom/vladsch/flexmark/util/sequence/BasedSequence;II)V
.end method

.method public abstract finalizeDocument(Lcom/vladsch/flexmark/util/ast/Document;)V
.end method

.method public abstract flushTextNode()Z
.end method

.method public abstract getBlock()Lcom/vladsch/flexmark/util/ast/Node;
.end method

.method public abstract getDocument()Lcom/vladsch/flexmark/util/ast/Document;
.end method

.method public abstract getIndex()I
.end method

.method public abstract getInput()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract getLastBracket()Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;
.end method

.method public abstract getLastDelimiter()Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;
.end method

.method public abstract getOptions()Lcom/vladsch/flexmark/parser/InlineParserOptions;
.end method

.method public abstract getParsing()Lcom/vladsch/flexmark/ast/util/Parsing;
.end method

.method public abstract initializeDocument(Lcom/vladsch/flexmark/ast/util/Parsing;Lcom/vladsch/flexmark/util/ast/Document;)V
.end method

.method public abstract match(Ljava/util/regex/Pattern;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract matchWithGroups(Ljava/util/regex/Pattern;)[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract matcher(Ljava/util/regex/Pattern;)Ljava/util/regex/Matcher;
.end method

.method public abstract mergeIfNeeded(Lcom/vladsch/flexmark/ast/Text;Lcom/vladsch/flexmark/ast/Text;)V
.end method

.method public abstract mergeTextNodes(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/ast/Node;)V
.end method

.method public abstract moveNodes(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/ast/Node;)V
.end method

.method public abstract nonIndentSp()Z
.end method

.method public abstract parse(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/ast/Node;)V
.end method

.method public abstract parseAutolink()Z
.end method

.method public abstract parseCustom(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/ast/Node;Ljava/util/BitSet;Ljava/util/Map;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            "Ljava/util/BitSet;",
            "Ljava/util/Map<",
            "Ljava/lang/Character;",
            "Lcom/vladsch/flexmark/parser/block/CharacterNodeFactory;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation
.end method

.method public abstract parseEntity()Z
.end method

.method public abstract parseHtmlInline()Z
.end method

.method public abstract parseLinkDestination()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract parseLinkLabel()I
.end method

.method public abstract parseLinkTitle()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract parseNewline()Z
.end method

.method public abstract peek()C
.end method

.method public abstract peek(I)C
.end method

.method public abstract processDelimiters(Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;)V
.end method

.method public abstract removeDelimiter(Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;)V
.end method

.method public abstract removeDelimiterAndNode(Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;)V
.end method

.method public abstract removeDelimiterKeepNode(Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;)V
.end method

.method public abstract removeDelimitersBetween(Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;)V
.end method

.method public abstract setIndex(I)V
.end method

.method public abstract sp()Z
.end method

.method public abstract spnl()Z
.end method

.method public abstract spnlUrl()Z
.end method

.method public abstract toEOL()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method
