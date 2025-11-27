.class public Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteLinkRefProcessor$Factory;
.super Ljava/lang/Object;
.source "FootnoteLinkRefProcessor.java"

# interfaces
.implements Lcom/vladsch/flexmark/parser/LinkRefProcessorFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteLinkRefProcessor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Factory"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public create(Lcom/vladsch/flexmark/util/ast/Document;)Lcom/vladsch/flexmark/parser/LinkRefProcessor;
    .locals 1

    .line 71
    new-instance v0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteLinkRefProcessor;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteLinkRefProcessor;-><init>(Lcom/vladsch/flexmark/util/ast/Document;)V

    return-object v0
.end method

.method public bridge synthetic create(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 68
    check-cast p1, Lcom/vladsch/flexmark/util/ast/Document;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteLinkRefProcessor$Factory;->create(Lcom/vladsch/flexmark/util/ast/Document;)Lcom/vladsch/flexmark/parser/LinkRefProcessor;

    move-result-object p1

    return-object p1
.end method

.method public getBracketNestingLevel(Lcom/vladsch/flexmark/util/options/DataHolder;)I
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public getWantExclamationPrefix(Lcom/vladsch/flexmark/util/options/DataHolder;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method
