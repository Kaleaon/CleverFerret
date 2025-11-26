.class public Lcom/vladsch/flexmark/parser/internal/CommonmarkInlineParser;
.super Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;
.source "CommonmarkInlineParser.java"


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;Ljava/util/BitSet;Ljava/util/BitSet;Ljava/util/Map;Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;Ljava/util/List;)V
    .locals 0
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
            ">;)V"
        }
    .end annotation

    .line 16
    invoke-direct/range {p0 .. p6}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;Ljava/util/BitSet;Ljava/util/BitSet;Ljava/util/Map;Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method public initializeDocument(Lcom/vladsch/flexmark/ast/util/Parsing;Lcom/vladsch/flexmark/util/ast/Document;)V
    .locals 0

    .line 21
    invoke-super {p0, p1, p2}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->initializeDocument(Lcom/vladsch/flexmark/ast/util/Parsing;Lcom/vladsch/flexmark/util/ast/Document;)V

    return-void
.end method
