.class final Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor$1;
.super Ljava/lang/Object;
.source "TableParagraphPreProcessor.java"

# interfaces
.implements Lcom/vladsch/flexmark/parser/block/CharacterNodeFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public create()Lcom/vladsch/flexmark/util/ast/Node;
    .locals 1

    .line 58
    new-instance v0, Lcom/vladsch/flexmark/ext/tables/internal/TableColumnSeparator;

    invoke-direct {v0}, Lcom/vladsch/flexmark/ext/tables/internal/TableColumnSeparator;-><init>()V

    return-object v0
.end method

.method public bridge synthetic create()Ljava/lang/Object;
    .locals 1

    .line 38
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor$1;->create()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    return-object v0
.end method

.method public skipNext(C)Z
    .locals 1

    const/16 v0, 0x20

    if-eq p1, v0, :cond_1

    const/16 v0, 0x9

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method public skipPrev(C)Z
    .locals 1

    const/16 v0, 0x20

    if-eq p1, v0, :cond_1

    const/16 v0, 0x9

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method public wantSkippedWhitespace()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
