.class public Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;
.super Lcom/vladsch/flexmark/ast/ListItem;
.source "TaskListItem.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field protected isOrderedItem:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 35
    invoke-direct {p0}, Lcom/vladsch/flexmark/ast/ListItem;-><init>()V

    const/4 v0, 0x0

    .line 16
    iput-boolean v0, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;->isOrderedItem:Z

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/ast/ListItem;)V
    .locals 1

    .line 51
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/ListItem;-><init>(Lcom/vladsch/flexmark/ast/ListItem;)V

    const/4 v0, 0x0

    .line 16
    iput-boolean v0, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;->isOrderedItem:Z

    .line 52
    instance-of p1, p1, Lcom/vladsch/flexmark/ast/OrderedListItem;

    iput-boolean p1, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;->isOrderedItem:Z

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/ast/BlockContent;)V
    .locals 0

    .line 47
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/ListItem;-><init>(Lcom/vladsch/flexmark/util/ast/BlockContent;)V

    const/4 p1, 0x0

    .line 16
    iput-boolean p1, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;->isOrderedItem:Z

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 39
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/ListItem;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    const/4 p1, 0x0

    .line 16
    iput-boolean p1, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;->isOrderedItem:Z

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            ">;)V"
        }
    .end annotation

    .line 43
    invoke-direct {p0, p1, p2}, Lcom/vladsch/flexmark/ast/ListItem;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Ljava/util/List;)V

    const/4 p1, 0x0

    .line 16
    iput-boolean p1, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;->isOrderedItem:Z

    return-void
.end method


# virtual methods
.method public getAstExtra(Ljava/lang/StringBuilder;)V
    .locals 1

    .line 20
    invoke-super {p0, p1}, Lcom/vladsch/flexmark/ast/ListItem;->getAstExtra(Ljava/lang/StringBuilder;)V

    .line 21
    iget-boolean v0, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;->isOrderedItem:Z

    if-eqz v0, :cond_0

    const-string v0, " isOrderedItem"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;->isItemDoneMarker()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, " isDone"

    goto :goto_0

    :cond_1
    const-string v0, " isNotDone"

    :goto_0
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method

.method public isItemDoneMarker()Z
    .locals 2

    .line 61
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;->markerSuffix:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const-string v1, "[ ]"

    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->matches(Ljava/lang/CharSequence;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public isOrderedItem()Z
    .locals 1

    .line 65
    iget-boolean v0, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;->isOrderedItem:Z

    return v0
.end method

.method public isParagraphWrappingDisabled(Lcom/vladsch/flexmark/ast/Paragraph;Lcom/vladsch/flexmark/parser/ListOptions;Lcom/vladsch/flexmark/util/options/DataHolder;)Z
    .locals 0

    .line 30
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p2

    :goto_0
    if-eqz p2, :cond_0

    .line 31
    instance-of p3, p2, Lcom/vladsch/flexmark/ast/Paragraph;

    if-nez p3, :cond_0

    invoke-virtual {p2}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p2

    goto :goto_0

    :cond_0
    if-ne p2, p1, :cond_1

    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public setOpeningMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 0

    .line 57
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1}, Ljava/lang/IllegalStateException;-><init>()V

    throw p1
.end method

.method public setOrderedItem(Z)V
    .locals 0

    .line 69
    iput-boolean p1, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/TaskListItem;->isOrderedItem:Z

    return-void
.end method
