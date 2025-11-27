.class public Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer;
.super Ljava/lang/Object;
.source "TaskListNodeRenderer.java"

# interfaces
.implements Lcom/vladsch/flexmark/html/renderer/NodeRenderer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer$Factory;
    }
.end annotation


# static fields
.field public static final TASK_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/html/renderer/AttributablePart;


# instance fields
.field final doneMarker:Ljava/lang/String;

.field private final itemDoneClass:Ljava/lang/String;

.field private final itemNotDoneClass:Ljava/lang/String;

.field private final listOptions:Lcom/vladsch/flexmark/parser/ListOptions;

.field private final looseItemClass:Ljava/lang/String;

.field final notDoneMarker:Ljava/lang/String;

.field final paragraphClass:Ljava/lang/String;

.field private final tightItemClass:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 16
    new-instance v0, Lcom/vladsch/flexmark/html/renderer/AttributablePart;

    const-string v1, "TASK_ITEM_PARAGRAPH"

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/html/renderer/AttributablePart;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer;->TASK_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/html/renderer/AttributablePart;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 1

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    sget-object v0, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListExtension;->ITEM_DONE_MARKER:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer;->doneMarker:Ljava/lang/String;

    .line 29
    sget-object v0, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListExtension;->ITEM_NOT_DONE_MARKER:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer;->notDoneMarker:Ljava/lang/String;

    .line 30
    sget-object v0, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListExtension;->TIGHT_ITEM_CLASS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer;->tightItemClass:Ljava/lang/String;

    .line 31
    sget-object v0, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListExtension;->LOOSE_ITEM_CLASS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer;->looseItemClass:Ljava/lang/String;

    .line 32
    sget-object v0, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListExtension;->ITEM_DONE_CLASS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer;->itemDoneClass:Ljava/lang/String;

    .line 33
    sget-object v0, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListExtension;->ITEM_NOT_DONE_CLASS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer;->itemNotDoneClass:Ljava/lang/String;

    .line 34
    sget-object v0, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListExtension;->PARAGRAPH_CLASS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer;->paragraphClass:Ljava/lang/String;

    .line 35
    invoke-static {p1}, Lcom/vladsch/flexmark/parser/ListOptions;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/parser/ListOptions;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer;->listOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    return-void
.end method


# virtual methods
.method public getNodeRenderingHandlers()Ljava/util/Set;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler<",
            "*>;>;"
        }
    .end annotation

    .line 41
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 42
    new-instance v1, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v2, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;

    new-instance v3, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer$1;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer$1;-><init>(Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method render(Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 8

    .line 55
    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object v0

    iget-boolean v0, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->sourcePositionParagraphLines:Z

    if-nez v0, :cond_1

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    goto :goto_1

    :cond_1
    :goto_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    :goto_1
    move-object v4, v0

    .line 56
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;->isItemDoneMarker()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer;->itemDoneClass:Ljava/lang/String;

    goto :goto_2

    :cond_2
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer;->itemNotDoneClass:Ljava/lang/String;

    .line 57
    :goto_2
    iget-object v1, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer;->listOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v1, p1}, Lcom/vladsch/flexmark/parser/ListOptions;->isTightListItem(Lcom/vladsch/flexmark/ast/ListItem;)Z

    move-result v1

    const-string v7, "li"

    const-string v2, "class"

    if-eqz v1, :cond_5

    .line 58
    iget-object v1, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer;->tightItemClass:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3

    iget-object v1, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer;->tightItemClass:Ljava/lang/String;

    invoke-virtual {p3, v2, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 59
    :cond_3
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_4

    iget-object v1, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer;->tightItemClass:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    invoke-virtual {p3, v2, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 60
    :cond_4
    invoke-interface {v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v0

    invoke-interface {v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v1

    invoke-virtual {p3, v0, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->srcPos(II)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    sget-object v1, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->TIGHT_LIST_ITEM:Lcom/vladsch/flexmark/html/renderer/AttributablePart;

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr(Lcom/vladsch/flexmark/html/renderer/AttributablePart;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->withCondIndent()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/html/HtmlWriter;

    new-instance v1, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer$2;

    invoke-direct {v1, p0, p3, p1, p2}, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer$2;-><init>(Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer;Lcom/vladsch/flexmark/html/HtmlWriter;Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;)V

    invoke-virtual {v0, v7, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tagLine(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void

    .line 68
    :cond_5
    iget-object v1, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer;->looseItemClass:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_6

    iget-object v1, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer;->looseItemClass:Ljava/lang/String;

    invoke-virtual {p3, v2, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 69
    :cond_6
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_7

    iget-object v1, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer;->looseItemClass:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    invoke-virtual {p3, v2, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 70
    :cond_7
    sget-object v0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->LOOSE_LIST_ITEM:Lcom/vladsch/flexmark/html/renderer/AttributablePart;

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr(Lcom/vladsch/flexmark/html/renderer/AttributablePart;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    new-instance v1, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer$3;

    move-object v2, p0

    move-object v5, p1

    move-object v6, p2

    move-object v3, p3

    invoke-direct/range {v1 .. v6}, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer$3;-><init>(Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeRenderer;Lcom/vladsch/flexmark/html/HtmlWriter;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;)V

    invoke-virtual {v0, v7, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tagIndent(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void
.end method
