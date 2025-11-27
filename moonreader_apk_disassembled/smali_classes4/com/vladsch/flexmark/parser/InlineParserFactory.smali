.class public interface abstract Lcom/vladsch/flexmark/parser/InlineParserFactory;
.super Ljava/lang/Object;
.source "InlineParserFactory.java"


# virtual methods
.method public abstract inlineParser(Lcom/vladsch/flexmark/util/options/DataHolder;Ljava/util/BitSet;Ljava/util/BitSet;Ljava/util/Map;Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;Ljava/util/List;)Lcom/vladsch/flexmark/parser/InlineParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/options/DataHolder;",
            "Ljava/util/BitSet;",
            "Ljava/util/BitSet;",
            "Ljava/util/Map<",
            "Ljava/lang/Character;",
            "Lcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;",
            ">;",
            "Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/InlineParserExtensionFactory;",
            ">;)",
            "Lcom/vladsch/flexmark/parser/InlineParser;"
        }
    .end annotation
.end method
