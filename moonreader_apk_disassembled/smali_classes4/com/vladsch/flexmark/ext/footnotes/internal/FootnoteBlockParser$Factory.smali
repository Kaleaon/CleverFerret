.class public Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser$Factory;
.super Ljava/lang/Object;
.source "FootnoteBlockParser.java"

# interfaces
.implements Lcom/vladsch/flexmark/parser/block/CustomBlockParserFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Factory"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 85
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

    .line 103
    new-instance v0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser$BlockFactory;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser$BlockFactory;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser$1;)V

    return-object v0
.end method

.method public bridge synthetic create(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 85
    check-cast p1, Lcom/vladsch/flexmark/util/options/DataHolder;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteBlockParser$Factory;->create(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/parser/block/BlockParserFactory;

    move-result-object p1

    return-object p1
.end method

.method public getAfterDependents()Ljava/util/Set;
    .locals 1
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

    const/4 v0, 0x0

    return-object v0
.end method

.method public getBeforeDependents()Ljava/util/Set;
    .locals 1
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

    const/4 v0, 0x0

    return-object v0
.end method
