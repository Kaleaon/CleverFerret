.class public Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListItemBlockPreProcessor;
.super Ljava/lang/Object;
.source "TaskListItemBlockPreProcessor.java"

# interfaces
.implements Lcom/vladsch/flexmark/parser/block/BlockPreProcessor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListItemBlockPreProcessor$Factory;
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public preProcess(Lcom/vladsch/flexmark/parser/block/ParserState;Lcom/vladsch/flexmark/util/ast/Block;)V
    .locals 2

    .line 24
    instance-of v0, p2, Lcom/vladsch/flexmark/ast/BulletListItem;

    if-nez v0, :cond_0

    instance-of v0, p2, Lcom/vladsch/flexmark/ast/OrderedListItem;

    if-eqz v0, :cond_1

    .line 27
    :cond_0
    check-cast p2, Lcom/vladsch/flexmark/ast/ListItem;

    .line 29
    invoke-virtual {p2}, Lcom/vladsch/flexmark/ast/ListItem;->getMarkerSuffix()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    .line 31
    const-string v1, "[ ]"

    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->matches(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "[x]"

    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->matches(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "[X]"

    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->matches(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    return-void

    .line 32
    :cond_2
    :goto_0
    new-instance v0, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;

    invoke-direct {v0, p2}, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;-><init>(Lcom/vladsch/flexmark/ast/ListItem;)V

    .line 33
    invoke-virtual {p2}, Lcom/vladsch/flexmark/ast/ListItem;->isOwnTight()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;->setTight(Z)V

    .line 34
    invoke-virtual {p2, v0}, Lcom/vladsch/flexmark/ast/ListItem;->insertBefore(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 35
    invoke-virtual {p2}, Lcom/vladsch/flexmark/ast/ListItem;->unlink()V

    .line 36
    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/parser/block/ParserState;->blockAdded(Lcom/vladsch/flexmark/util/ast/Block;)V

    .line 37
    invoke-interface {p1, p2}, Lcom/vladsch/flexmark/parser/block/ParserState;->blockRemoved(Lcom/vladsch/flexmark/util/ast/Block;)V

    return-void
.end method
