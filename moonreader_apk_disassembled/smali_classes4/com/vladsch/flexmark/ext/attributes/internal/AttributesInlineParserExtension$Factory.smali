.class public Lcom/vladsch/flexmark/ext/attributes/internal/AttributesInlineParserExtension$Factory;
.super Ljava/lang/Object;
.source "AttributesInlineParserExtension.java"

# interfaces
.implements Lcom/vladsch/flexmark/parser/InlineParserExtensionFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/ext/attributes/internal/AttributesInlineParserExtension;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Factory"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public affectsGlobalScope()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public create(Lcom/vladsch/flexmark/parser/InlineParser;)Lcom/vladsch/flexmark/parser/InlineParserExtension;
    .locals 1

    .line 111
    new-instance v0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesInlineParserExtension;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesInlineParserExtension;-><init>(Lcom/vladsch/flexmark/parser/InlineParser;)V

    return-object v0
.end method

.method public bridge synthetic create(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 93
    check-cast p1, Lcom/vladsch/flexmark/parser/InlineParser;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesInlineParserExtension$Factory;->create(Lcom/vladsch/flexmark/parser/InlineParser;)Lcom/vladsch/flexmark/parser/InlineParserExtension;

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
            "Lcom/vladsch/flexmark/parser/InlineParserExtensionFactory;",
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
            "Lcom/vladsch/flexmark/parser/InlineParserExtensionFactory;",
            ">;>;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method public getCharacters()Ljava/lang/CharSequence;
    .locals 1

    .line 101
    const-string v0, "{"

    return-object v0
.end method
