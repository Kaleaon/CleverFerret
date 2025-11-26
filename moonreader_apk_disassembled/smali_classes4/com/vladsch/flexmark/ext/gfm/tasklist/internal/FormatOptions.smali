.class public Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/FormatOptions;
.super Ljava/lang/Object;
.source "FormatOptions.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/options/MutableDataSetter;


# instance fields
.field public final taskListItemCase:Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItemCase;

.field public final taskListItemPlacement:Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItemPlacement;


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 16
    invoke-direct {p0, v0}, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/FormatOptions;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 1

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    sget-object v0, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListExtension;->FORMAT_LIST_ITEM_CASE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItemCase;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/FormatOptions;->taskListItemCase:Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItemCase;

    .line 21
    sget-object v0, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListExtension;->FORMAT_LIST_ITEM_PLACEMENT:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItemPlacement;

    iput-object p1, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/FormatOptions;->taskListItemPlacement:Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItemPlacement;

    return-void
.end method


# virtual methods
.method public setIn(Lcom/vladsch/flexmark/util/options/MutableDataHolder;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;
    .locals 2

    .line 26
    sget-object v0, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListExtension;->FORMAT_LIST_ITEM_CASE:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-object v1, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/FormatOptions;->taskListItemCase:Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItemCase;

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 27
    sget-object v0, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListExtension;->FORMAT_LIST_ITEM_PLACEMENT:Lcom/vladsch/flexmark/util/options/DataKey;

    iget-object v1, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/FormatOptions;->taskListItemPlacement:Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItemPlacement;

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    return-object p1
.end method
