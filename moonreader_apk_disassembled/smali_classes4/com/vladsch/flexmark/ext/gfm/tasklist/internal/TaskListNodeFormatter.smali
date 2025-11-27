.class public Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter;
.super Ljava/lang/Object;
.source "TaskListNodeFormatter.java"

# interfaces
.implements Lcom/vladsch/flexmark/formatter/NodeFormatter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter$Factory;
    }
.end annotation


# instance fields
.field private final listOptions:Lcom/vladsch/flexmark/parser/ListOptions;

.field private final myOptions:Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/FormatOptions;


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 1

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    new-instance v0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/FormatOptions;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/FormatOptions;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter;->myOptions:Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/FormatOptions;

    .line 27
    invoke-static {p1}, Lcom/vladsch/flexmark/parser/ListOptions;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/parser/ListOptions;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter;->listOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    return-void
.end method

.method static synthetic access$000(Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter;Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 21
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter;->render(Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$100(Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter;Lcom/vladsch/flexmark/ast/BulletList;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 21
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter;->render(Lcom/vladsch/flexmark/ast/BulletList;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$200(Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter;Lcom/vladsch/flexmark/ast/OrderedList;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 21
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter;->render(Lcom/vladsch/flexmark/ast/OrderedList;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method public static hasIncompleteDescendants(Lcom/vladsch/flexmark/util/ast/Node;)Z
    .locals 2

    .line 104
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p0

    :goto_0
    if-eqz p0, :cond_2

    .line 106
    instance-of v0, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 107
    move-object v0, p0

    check-cast v0, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;->isItemDoneMarker()Z

    move-result v0

    if-nez v0, :cond_0

    return v1

    .line 111
    :cond_0
    instance-of v0, p0, Lcom/vladsch/flexmark/util/ast/Block;

    if-eqz v0, :cond_1

    instance-of v0, p0, Lcom/vladsch/flexmark/ast/Paragraph;

    if-nez v0, :cond_1

    invoke-static {p0}, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter;->hasIncompleteDescendants(Lcom/vladsch/flexmark/util/ast/Node;)Z

    move-result v0

    if-eqz v0, :cond_1

    return v1

    .line 114
    :cond_1
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p0

    goto :goto_0

    :cond_2
    const/4 p0, 0x0

    return p0
.end method

.method private render(Lcom/vladsch/flexmark/ast/BulletList;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 1

    .line 96
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter;->myOptions:Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/FormatOptions;

    invoke-static {p1, p2, p3, v0}, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter;->renderList(Lcom/vladsch/flexmark/ast/ListBlock;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/FormatOptions;)V

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ast/OrderedList;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 1

    .line 100
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter;->myOptions:Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/FormatOptions;

    invoke-static {p1, p2, p3, v0}, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter;->renderList(Lcom/vladsch/flexmark/ast/ListBlock;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/FormatOptions;)V

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 11

    .line 61
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;->getMarkerSuffix()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    .line 62
    sget-object v1, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter$4;->$SwitchMap$com$vladsch$flexmark$ext$gfm$tasklist$TaskListItemCase:[I

    iget-object v2, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter;->myOptions:Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/FormatOptions;

    iget-object v2, v2, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/FormatOptions;->taskListItemCase:Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItemCase;

    invoke-virtual {v2}, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItemCase;->ordinal()I

    move-result v2

    aget v1, v1, v2

    const/4 v2, 0x3

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-eq v1, v4, :cond_2

    if-eq v1, v3, :cond_1

    if-ne v1, v2, :cond_0

    .line 69
    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->toUpperCase()Lcom/vladsch/flexmark/util/sequence/MappedSequence;

    move-result-object v0

    goto :goto_0

    .line 72
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "Missing case for TaskListItemCase "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter;->myOptions:Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/FormatOptions;

    iget-object p3, p3, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/FormatOptions;->taskListItemCase:Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItemCase;

    invoke-virtual {p3}, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItemCase;->name()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 66
    :cond_1
    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->toLowerCase()Lcom/vladsch/flexmark/util/sequence/MappedSequence;

    move-result-object v0

    .line 75
    :cond_2
    :goto_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;->isItemDoneMarker()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 76
    sget-object v1, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter$4;->$SwitchMap$com$vladsch$flexmark$ext$gfm$tasklist$TaskListItemPlacement:[I

    iget-object v5, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter;->myOptions:Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/FormatOptions;

    iget-object v5, v5, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/FormatOptions;->taskListItemPlacement:Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItemPlacement;

    invoke-virtual {v5}, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItemPlacement;->ordinal()I

    move-result v5

    aget v1, v1, v5

    if-eq v1, v4, :cond_5

    if-eq v1, v3, :cond_5

    if-eq v1, v2, :cond_5

    const/4 v0, 0x4

    if-eq v1, v0, :cond_4

    const/4 v0, 0x5

    if-ne v1, v0, :cond_3

    goto :goto_1

    .line 86
    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "Missing case for ListItemPlacement "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter;->myOptions:Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/FormatOptions;

    iget-object p3, p3, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/FormatOptions;->taskListItemPlacement:Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItemPlacement;

    invoke-virtual {p3}, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItemPlacement;->name()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 83
    :cond_4
    :goto_1
    sget-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 91
    :cond_5
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;->isLoose()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_6

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;->hasChildren()Z

    move-result v1

    if-eqz v1, :cond_6

    new-array v1, v4, [Ljava/lang/Class;

    const-class v3, Lcom/vladsch/flexmark/util/ast/BlankLine;

    aput-object v3, v1, v2

    invoke-virtual {p1, v1}, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;->getFirstChildAnyNot([Ljava/lang/Class;)Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v1

    if-eqz v1, :cond_6

    const/4 v10, 0x1

    goto :goto_2

    :cond_6
    const/4 v10, 0x0

    .line 92
    :goto_2
    iget-object v8, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter;->listOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_7

    goto :goto_3

    :cond_7
    new-array v1, v4, [Ljava/lang/CharSequence;

    const-string v3, " "

    aput-object v3, v1, v2

    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->append([Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    :goto_3
    move-object v5, p1

    move-object v6, p2

    move-object v7, p3

    move-object v9, v0

    invoke-static/range {v5 .. v10}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->renderListItem(Lcom/vladsch/flexmark/ast/ListItem;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;Lcom/vladsch/flexmark/parser/ListOptions;Ljava/lang/CharSequence;Z)V

    return-void
.end method

.method public static renderList(Lcom/vladsch/flexmark/ast/ListBlock;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/FormatOptions;)V
    .locals 5

    .line 126
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 128
    iget-object p3, p3, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/FormatOptions;->taskListItemPlacement:Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItemPlacement;

    .line 129
    sget-object v1, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItemPlacement;->AS_IS:Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItemPlacement;

    if-eq p3, v1, :cond_7

    .line 130
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 131
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 132
    sget-object v3, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItemPlacement;->INCOMPLETE_NESTED_FIRST:Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItemPlacement;

    if-eq p3, v3, :cond_1

    sget-object v3, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItemPlacement;->COMPLETE_NESTED_TO_NON_TASK:Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItemPlacement;

    if-ne p3, v3, :cond_0

    goto :goto_0

    :cond_0
    const/4 p3, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p3, 0x1

    .line 134
    :goto_1
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/ListBlock;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v3

    :goto_2
    if-eqz v3, :cond_6

    .line 136
    instance-of v4, v3, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;

    if-eqz v4, :cond_4

    .line 137
    move-object v4, v3

    check-cast v4, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;

    .line 138
    invoke-virtual {v4}, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;->isItemDoneMarker()Z

    move-result v4

    if-eqz v4, :cond_3

    if-eqz p3, :cond_2

    invoke-static {v3}, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter;->hasIncompleteDescendants(Lcom/vladsch/flexmark/util/ast/Node;)Z

    move-result v4

    if-eqz v4, :cond_2

    goto :goto_3

    .line 141
    :cond_2
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 139
    :cond_3
    :goto_3
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    :cond_4
    if-eqz p3, :cond_5

    .line 144
    invoke-static {v3}, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter;->hasIncompleteDescendants(Lcom/vladsch/flexmark/util/ast/Node;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 145
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 147
    :cond_5
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 150
    :goto_4
    invoke-virtual {v3}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v3

    goto :goto_2

    .line 153
    :cond_6
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 154
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto :goto_6

    .line 156
    :cond_7
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/ListBlock;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p3

    :goto_5
    if-eqz p3, :cond_8

    .line 158
    invoke-virtual {v0, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 159
    invoke-virtual {p3}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p3

    goto :goto_5

    .line 163
    :cond_8
    :goto_6
    invoke-static {p0, p1, p2, v0}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->renderList(Lcom/vladsch/flexmark/ast/ListBlock;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method public getNodeClasses()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/Class<",
            "*>;>;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method public getNodeFormattingHandlers()Ljava/util/Set;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/vladsch/flexmark/formatter/NodeFormattingHandler<",
            "*>;>;"
        }
    .end annotation

    .line 33
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x3

    new-array v1, v1, [Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;

    new-instance v4, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter$1;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter$1;-><init>(Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/4 v3, 0x0

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/BulletList;

    new-instance v4, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter$2;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter$2;-><init>(Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/4 v3, 0x1

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/OrderedList;

    new-instance v4, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter$3;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter$3;-><init>(Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/4 v3, 0x2

    aput-object v2, v1, v3

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method
