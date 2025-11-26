.class Lcom/flyersoft/views/BookCalendar/IndexedLinkedHashMap;
.super Ljava/util/LinkedHashMap;
.source "IndexedLinkedHashMap.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/LinkedHashMap<",
        "TK;TV;>;"
    }
.end annotation


# instance fields
.field private index:I

.field private final indexToKey:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "TK;>;"
        }
    .end annotation
.end field

.field private final keyToIndex:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "TK;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    .line 11
    invoke-direct {p0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 12
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/views/BookCalendar/IndexedLinkedHashMap;->indexToKey:Ljava/util/Map;

    .line 13
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/views/BookCalendar/IndexedLinkedHashMap;->keyToIndex:Ljava/util/Map;

    const/4 v0, 0x0

    .line 14
    iput v0, p0, Lcom/flyersoft/views/BookCalendar/IndexedLinkedHashMap;->index:I

    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .line 24
    invoke-super {p0}, Ljava/util/LinkedHashMap;->clear()V

    const/4 v0, 0x0

    .line 25
    iput v0, p0, Lcom/flyersoft/views/BookCalendar/IndexedLinkedHashMap;->index:I

    .line 26
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/IndexedLinkedHashMap;->indexToKey:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 27
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/IndexedLinkedHashMap;->keyToIndex:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    return-void
.end method

.method getIndexOfKey(Ljava/lang/Object;)Ljava/lang/Integer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)",
            "Ljava/lang/Integer;"
        }
    .end annotation

    .line 39
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/IndexedLinkedHashMap;->keyToIndex:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    return-object p1
.end method

.method getValueAtIndex(I)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TV;"
        }
    .end annotation

    .line 35
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/IndexedLinkedHashMap;->indexToKey:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/flyersoft/views/BookCalendar/IndexedLinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .line 17
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/IndexedLinkedHashMap;->indexToKey:Ljava/util/Map;

    iget v1, p0, Lcom/flyersoft/views/BookCalendar/IndexedLinkedHashMap;->index:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/IndexedLinkedHashMap;->keyToIndex:Ljava/util/Map;

    iget v1, p0, Lcom/flyersoft/views/BookCalendar/IndexedLinkedHashMap;->index:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    iget v0, p0, Lcom/flyersoft/views/BookCalendar/IndexedLinkedHashMap;->index:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/flyersoft/views/BookCalendar/IndexedLinkedHashMap;->index:I

    .line 20
    invoke-super {p0, p1, p2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .line 31
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string v0, "IndexedLinkedHashMap is put/clear only"

    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
