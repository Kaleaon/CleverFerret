.class public Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser$Factory;
.super Ljava/lang/Object;
.source "FencedCodeBlockParser.java"

# interfaces
.implements Lcom/vladsch/flexmark/parser/block/CustomBlockParserFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Factory"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 134
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public affectsGlobalScope()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public create(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/parser/block/BlockParserFactory;
    .locals 2

    .line 168
    new-instance v0, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser$BlockFactory;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser$BlockFactory;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser$1;)V

    return-object v0
.end method

.method public bridge synthetic create(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 134
    check-cast p1, Lcom/vladsch/flexmark/util/options/DataHolder;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/core/FencedCodeBlockParser$Factory;->create(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/parser/block/BlockParserFactory;

    move-result-object p1

    return-object p1
.end method

.method public getAfterDependents()Ljava/util/Set;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/Class<",
            "+",
            "Lcom/vladsch/flexmark/parser/block/CustomBlockParserFactory;",
            ">;>;"
        }
    .end annotation

    .line 137
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Class;

    const-class v2, Lcom/vladsch/flexmark/parser/core/BlockQuoteParser$Factory;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-class v2, Lcom/vladsch/flexmark/parser/core/HeadingParser$Factory;

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public getBeforeDependents()Ljava/util/Set;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/Class<",
            "+",
            "Lcom/vladsch/flexmark/parser/block/CustomBlockParserFactory;",
            ">;>;"
        }
    .end annotation

    .line 150
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Class;

    const-class v2, Lcom/vladsch/flexmark/parser/core/HtmlBlockParser$Factory;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-class v2, Lcom/vladsch/flexmark/parser/core/ThematicBreakParser$Factory;

    const/4 v3, 0x1

    aput-object v2, v1, v3

    const-class v2, Lcom/vladsch/flexmark/parser/core/ListBlockParser$Factory;

    const/4 v3, 0x2

    aput-object v2, v1, v3

    const-class v2, Lcom/vladsch/flexmark/parser/core/IndentedCodeBlockParser$Factory;

    const/4 v3, 0x3

    aput-object v2, v1, v3

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method
