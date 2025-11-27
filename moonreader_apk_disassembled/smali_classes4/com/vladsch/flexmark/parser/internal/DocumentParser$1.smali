.class final Lcom/vladsch/flexmark/parser/internal/DocumentParser$1;
.super Ljava/lang/Object;
.source "DocumentParser.java"

# interfaces
.implements Lcom/vladsch/flexmark/parser/InlineParserFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/parser/internal/DocumentParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public inlineParser(Lcom/vladsch/flexmark/util/options/DataHolder;Ljava/util/BitSet;Ljava/util/BitSet;Ljava/util/Map;Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;Ljava/util/List;)Lcom/vladsch/flexmark/parser/InlineParser;
    .locals 7
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

    .line 58
    new-instance v0, Lcom/vladsch/flexmark/parser/internal/CommonmarkInlineParser;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v6}, Lcom/vladsch/flexmark/parser/internal/CommonmarkInlineParser;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;Ljava/util/BitSet;Ljava/util/BitSet;Ljava/util/Map;Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;Ljava/util/List;)V

    return-object v0
.end method
