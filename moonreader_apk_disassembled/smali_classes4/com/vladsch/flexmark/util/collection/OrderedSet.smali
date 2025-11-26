.class public Lcom/vladsch/flexmark/util/collection/OrderedSet;
.super Ljava/lang/Object;
.source "OrderedSet.java"

# interfaces
.implements Ljava/util/Set;
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/util/collection/OrderedSet$IndexedProxy;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Set<",
        "TE;>;",
        "Ljava/lang/Iterable<",
        "TE;>;"
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private myAllowConcurrentModsIndexedProxy:Lcom/vladsch/flexmark/util/collection/iteration/Indexed;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/collection/iteration/Indexed<",
            "TE;>;"
        }
    .end annotation
.end field

.field private final myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/collection/CollectionHost<",
            "TE;>;"
        }
    .end annotation
.end field

.field private myIndexedProxy:Lcom/vladsch/flexmark/util/collection/iteration/Indexed;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/collection/iteration/Indexed<",
            "TE;>;"
        }
    .end annotation
.end field

.field private final myKeyMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "TE;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private myModificationCount:I

.field private myValidIndices:Ljava/util/BitSet;

.field private final myValueList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "TE;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 18
    invoke-direct {p0, v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    const/4 v0, 0x0

    .line 22
    invoke-direct {p0, p1, v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;-><init>(ILcom/vladsch/flexmark/util/collection/CollectionHost;)V

    return-void
.end method

.method public constructor <init>(ILcom/vladsch/flexmark/util/collection/CollectionHost;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/vladsch/flexmark/util/collection/CollectionHost<",
            "TE;>;)V"
        }
    .end annotation

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p1}, Ljava/util/HashMap;-><init>(I)V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myKeyMap:Ljava/util/HashMap;

    .line 31
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValueList:Ljava/util/ArrayList;

    .line 32
    new-instance p1, Ljava/util/BitSet;

    invoke-direct {p1}, Ljava/util/BitSet;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValidIndices:Ljava/util/BitSet;

    .line 33
    iput-object p2, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    const/high16 p1, -0x80000000

    .line 34
    iput p1, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myModificationCount:I

    const/4 p1, 0x0

    .line 35
    iput-object p1, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myIndexedProxy:Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    .line 36
    iput-object p1, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myAllowConcurrentModsIndexedProxy:Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/collection/CollectionHost;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/collection/CollectionHost<",
            "TE;>;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 26
    invoke-direct {p0, v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;-><init>(ILcom/vladsch/flexmark/util/collection/CollectionHost;)V

    return-void
.end method

.method static synthetic access$000(Lcom/vladsch/flexmark/util/collection/OrderedSet;)Ljava/util/ArrayList;
    .locals 0

    .line 8
    iget-object p0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValueList:Ljava/util/ArrayList;

    return-object p0
.end method

.method static synthetic access$100(Lcom/vladsch/flexmark/util/collection/OrderedSet;)I
    .locals 0

    .line 8
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->getIteratorModificationCount()I

    move-result p0

    return p0
.end method

.method private getIteratorModificationCount()I
    .locals 1

    .line 155
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->getIteratorModificationCount()I

    move-result v0

    return v0

    :cond_0
    iget v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myModificationCount:I

    return v0
.end method

.method public static ifNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            ">(TT1;TT1;)TT1;"
        }
    .end annotation

    if-nez p0, :cond_0

    return-object p1

    :cond_0
    return-object p0
.end method


# virtual methods
.method public add(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    const/4 v0, 0x0

    .line 338
    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->add(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public add(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;",
            "Ljava/lang/Object;",
            ")Z"
        }
    .end annotation

    .line 342
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myKeyMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 344
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValueList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 346
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    if-eqz v1, :cond_1

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->skipHostUpdate()Z

    move-result v1

    if-nez v1, :cond_1

    .line 347
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    invoke-interface {v1, v0, p1, p2}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->adding(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 350
    :cond_1
    iget p2, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myModificationCount:I

    const/4 v1, 0x1

    add-int/2addr p2, v1

    iput p2, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myModificationCount:I

    .line 351
    iget-object p2, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myKeyMap:Ljava/util/HashMap;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p2, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 352
    iget-object p2, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValueList:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 353
    iget-object p1, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValidIndices:Ljava/util/BitSet;

    invoke-virtual {p1, v0}, Ljava/util/BitSet;->set(I)V

    return v1
.end method

.method public addAll(Ljava/util/Collection;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "+TE;>;)Z"
        }
    .end annotation

    const/4 v0, 0x1

    .line 414
    new-array v1, v0, [Z

    const/4 v2, 0x0

    aput-boolean v2, v1, v2

    .line 415
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 416
    invoke-virtual {p0, v3}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->add(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    aput-boolean v0, v1, v2

    goto :goto_0

    .line 418
    :cond_1
    aget-boolean p1, v1, v2

    return p1
.end method

.method public addNull()V
    .locals 1

    .line 252
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValueList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->addNulls(I)V

    return-void
.end method

.method public addNulls(I)V
    .locals 2

    .line 258
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->skipHostUpdate()Z

    move-result v0

    if-nez v0, :cond_0

    .line 259
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->addingNulls(I)V

    .line 262
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValueList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 263
    iget v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myModificationCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myModificationCount:I

    .line 267
    :goto_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValueList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-gt v0, p1, :cond_1

    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValueList:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-void
.end method

.method public clear()V
    .locals 1

    .line 481
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->skipHostUpdate()Z

    move-result v0

    if-nez v0, :cond_0

    .line 482
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->clearing()V

    .line 485
    :cond_0
    iget v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myModificationCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myModificationCount:I

    .line 486
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myKeyMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 487
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValueList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 488
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValidIndices:Ljava/util/BitSet;

    invoke-virtual {v0}, Ljava/util/BitSet;->clear()V

    return-void
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 1

    .line 201
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myKeyMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public containsAll(Ljava/util/Collection;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "*>;)Z"
        }
    .end annotation

    .line 404
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 405
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myKeyMap:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public differenceBitSet(Ljava/lang/Iterable;)Ljava/util/BitSet;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+TE;>;)",
            "Ljava/util/BitSet;"
        }
    .end annotation

    .line 51
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->differenceBitSet(Ljava/util/Iterator;)Ljava/util/BitSet;

    move-result-object p1

    return-object p1
.end method

.method public differenceBitSet(Ljava/util/Iterator;)Ljava/util/BitSet;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Iterator<",
            "+TE;>;)",
            "Ljava/util/BitSet;"
        }
    .end annotation

    .line 55
    new-instance v0, Ljava/util/BitSet;

    invoke-direct {v0}, Ljava/util/BitSet;-><init>()V

    const/4 v1, 0x0

    .line 57
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 58
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 60
    invoke-virtual {p0, v2}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->indexOf(Ljava/lang/Object;)I

    move-result v2

    if-eq v2, v1, :cond_0

    .line 62
    invoke-virtual {v0, v2}, Ljava/util/BitSet;->set(I)V

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_5

    .line 494
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_0

    .line 496
    :cond_1
    check-cast p1, Lcom/vladsch/flexmark/util/collection/OrderedSet;

    .line 498
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->size()I

    move-result v2

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->size()I

    move-result v3

    if-eq v2, v3, :cond_2

    return v1

    .line 499
    :cond_2
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;

    move-result-object p1

    .line 500
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;

    move-result-object v2

    :cond_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 501
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 502
    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    return v1

    :cond_4
    return v0

    :cond_5
    :goto_0
    return v1
.end method

.method public getConcurrentModsIndexedProxy()Lcom/vladsch/flexmark/util/collection/iteration/Indexed;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/Indexed<",
            "TE;>;"
        }
    .end annotation

    .line 145
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myAllowConcurrentModsIndexedProxy:Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    if-eqz v0, :cond_0

    return-object v0

    .line 146
    :cond_0
    new-instance v0, Lcom/vladsch/flexmark/util/collection/OrderedSet$IndexedProxy;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lcom/vladsch/flexmark/util/collection/OrderedSet$IndexedProxy;-><init>(Lcom/vladsch/flexmark/util/collection/OrderedSet;Z)V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myAllowConcurrentModsIndexedProxy:Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    return-object v0
.end method

.method public getIndexedProxy()Lcom/vladsch/flexmark/util/collection/iteration/Indexed;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/Indexed<",
            "TE;>;"
        }
    .end annotation

    .line 139
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myIndexedProxy:Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    if-eqz v0, :cond_0

    return-object v0

    .line 140
    :cond_0
    new-instance v0, Lcom/vladsch/flexmark/util/collection/OrderedSet$IndexedProxy;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vladsch/flexmark/util/collection/OrderedSet$IndexedProxy;-><init>(Lcom/vladsch/flexmark/util/collection/OrderedSet;Z)V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myIndexedProxy:Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    return-object v0
.end method

.method public getModificationCount()I
    .locals 1

    .line 151
    iget v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myModificationCount:I

    return v0
.end method

.method public getValidIndices()Ljava/util/BitSet;
    .locals 1

    .line 516
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValidIndices:Ljava/util/BitSet;

    return-object v0
.end method

.method public getValue(I)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TE;"
        }
    .end annotation

    .line 181
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->validateIndex(I)V

    .line 182
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValueList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getValueList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "TE;>;"
        }
    .end annotation

    .line 205
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValueList:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getValueOrNull(I)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TE;"
        }
    .end annotation

    .line 186
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->isValidIndex(I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValueList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public hashCode()I
    .locals 2

    .line 509
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myKeyMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    .line 510
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValueList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 511
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValidIndices:Ljava/util/BitSet;

    invoke-virtual {v1}, Ljava/util/BitSet;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public inHostUpdate()Z
    .locals 1

    .line 163
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->skipHostUpdate()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public indexBitSet(Ljava/lang/Iterable;)Ljava/util/BitSet;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+TE;>;)",
            "Ljava/util/BitSet;"
        }
    .end annotation

    .line 40
    new-instance v0, Ljava/util/BitSet;

    invoke-direct {v0}, Ljava/util/BitSet;-><init>()V

    .line 41
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 42
    invoke-virtual {p0, v1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->indexOf(Ljava/lang/Object;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 44
    invoke-virtual {v0, v1}, Ljava/util/BitSet;->set(I)V

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public indexIterable()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 279
    new-instance v0, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterable;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValidIndices:Ljava/util/BitSet;

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterable;-><init>(Ljava/util/BitSet;)V

    return-object v0
.end method

.method public indexIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 271
    new-instance v0, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterator;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValidIndices:Ljava/util/BitSet;

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterator;-><init>(Ljava/util/BitSet;)V

    return-object v0
.end method

.method public indexOf(Ljava/lang/Object;)I
    .locals 1

    .line 167
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myKeyMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    const/4 v0, -0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->ifNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    return p1
.end method

.method public isEmpty()Z
    .locals 1

    .line 196
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myKeyMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public isSparse()Z
    .locals 3

    .line 248
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValidIndices:Ljava/util/BitSet;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/BitSet;->nextClearBit(I)I

    move-result v0

    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValueList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    return v1
.end method

.method public isValidIndex(I)Z
    .locals 1

    if-ltz p1, :cond_0

    .line 171
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValueList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValidIndices:Ljava/util/BitSet;

    invoke-virtual {v0, p1}, Ljava/util/BitSet;->get(I)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public iterable()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable<",
            "TE;>;"
        }
    .end annotation

    .line 296
    new-instance v0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->getIndexedProxy()Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->indexIterable()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;-><init>(Lcom/vladsch/flexmark/util/collection/iteration/Indexed;Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;)V

    return-object v0
.end method

.method public iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator<",
            "TE;>;"
        }
    .end annotation

    .line 288
    new-instance v0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->getIndexedProxy()Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->indexIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;-><init>(Lcom/vladsch/flexmark/util/collection/iteration/Indexed;Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;)V

    return-object v0
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .locals 1

    .line 8
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;

    move-result-object v0

    return-object v0
.end method

.method public keyDifferenceBitSet(Ljava/lang/Iterable;)Ljava/util/BitSet;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Ljava/util/Map$Entry<",
            "+TE;*>;>;)",
            "Ljava/util/BitSet;"
        }
    .end annotation

    .line 70
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->keyDifferenceBitSet(Ljava/util/Iterator;)Ljava/util/BitSet;

    move-result-object p1

    return-object p1
.end method

.method public keyDifferenceBitSet(Ljava/util/Iterator;)Ljava/util/BitSet;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Iterator<",
            "+",
            "Ljava/util/Map$Entry<",
            "+TE;*>;>;)",
            "Ljava/util/BitSet;"
        }
    .end annotation

    .line 74
    new-instance v0, Ljava/util/BitSet;

    invoke-direct {v0}, Ljava/util/BitSet;-><init>()V

    const/4 v1, 0x0

    .line 76
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 77
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 78
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->indexOf(Ljava/lang/Object;)I

    move-result v2

    if-eq v2, v1, :cond_0

    .line 80
    invoke-virtual {v0, v2}, Ljava/util/BitSet;->set(I)V

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 0

    .line 393
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->removeHosted(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public removeAll(Ljava/util/Collection;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "*>;)Z"
        }
    .end annotation

    .line 471
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v0, 0x0

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 472
    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myKeyMap:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 473
    invoke-virtual {p0, v1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->remove(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    return v0
.end method

.method public removeHosted(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 397
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myKeyMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 399
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->removeIndexHosted(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public removeIndex(I)Z
    .locals 0

    .line 358
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->removeIndexHosted(I)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public removeIndexHosted(I)Ljava/lang/Object;
    .locals 3

    .line 362
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->validateIndex(I)V

    .line 364
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValueList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 366
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    if-eqz v1, :cond_0

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->skipHostUpdate()Z

    move-result v1

    if-nez v1, :cond_0

    .line 367
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    invoke-interface {v1, p1, v0}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->removing(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v0

    .line 372
    :goto_0
    iget v2, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myModificationCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myModificationCount:I

    .line 373
    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myKeyMap:Ljava/util/HashMap;

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 375
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myKeyMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    if-nez v0, :cond_2

    .line 376
    iget-object p1, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    if-eqz p1, :cond_1

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->skipHostUpdate()Z

    move-result p1

    if-nez p1, :cond_1

    .line 377
    iget-object p1, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->clearing()V

    .line 379
    :cond_1
    iget-object p1, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValueList:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 380
    iget-object p1, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValidIndices:Ljava/util/BitSet;

    invoke-virtual {p1}, Ljava/util/BitSet;->clear()V

    return-object v1

    .line 382
    :cond_2
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValueList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-ne p1, v0, :cond_3

    .line 383
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValueList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 385
    :cond_3
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValidIndices:Ljava/util/BitSet;

    invoke-virtual {v0, p1}, Ljava/util/BitSet;->clear(I)V

    return-object v1
.end method

.method public retainAll(Ljava/util/Collection;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "*>;)Z"
        }
    .end annotation

    .line 423
    new-instance v0, Ljava/util/BitSet;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValueList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/BitSet;-><init>(I)V

    .line 424
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValueList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/util/BitSet;->set(II)V

    .line 425
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValidIndices:Ljava/util/BitSet;

    invoke-virtual {v0, v1}, Ljava/util/BitSet;->and(Ljava/util/BitSet;)V

    .line 427
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v3, -0x1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 428
    invoke-virtual {p0, v1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->indexOf(Ljava/lang/Object;)I

    move-result v1

    if-eq v1, v3, :cond_0

    .line 430
    invoke-virtual {v0, v1}, Ljava/util/BitSet;->clear(I)V

    goto :goto_0

    .line 455
    :cond_1
    iget-object p1, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValueList:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-nez p1, :cond_2

    return v2

    :cond_2
    :goto_1
    add-int/lit8 v1, p1, -0x1

    if-lez p1, :cond_4

    .line 459
    invoke-virtual {v0, v1}, Ljava/util/BitSet;->previousSetBit(I)I

    move-result p1

    if-ne p1, v3, :cond_3

    goto :goto_2

    .line 461
    :cond_3
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValueList:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->remove(Ljava/lang/Object;)Z

    const/4 v2, 0x1

    goto :goto_1

    :cond_4
    :goto_2
    return v2
.end method

.method public reversedIndexIterable()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 283
    new-instance v0, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterable;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValidIndices:Ljava/util/BitSet;

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterable;-><init>(Ljava/util/BitSet;Z)V

    return-object v0
.end method

.method public reversedIndexIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 275
    new-instance v0, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterator;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValidIndices:Ljava/util/BitSet;

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterator;-><init>(Ljava/util/BitSet;Z)V

    return-object v0
.end method

.method public reversedIterable()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable<",
            "TE;>;"
        }
    .end annotation

    .line 300
    new-instance v0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->getIndexedProxy()Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->reversedIndexIterable()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;-><init>(Lcom/vladsch/flexmark/util/collection/iteration/Indexed;Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;)V

    return-object v0
.end method

.method public reversedIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator<",
            "TE;>;"
        }
    .end annotation

    .line 292
    new-instance v0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->getIndexedProxy()Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->reversedIndexIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;-><init>(Lcom/vladsch/flexmark/util/collection/iteration/Indexed;Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;)V

    return-object v0
.end method

.method public setValueAt(ILjava/lang/Object;Ljava/lang/Object;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITE;",
            "Ljava/lang/Object;",
            ")Z"
        }
    .end annotation

    .line 217
    invoke-virtual {p0, p2}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->indexOf(Ljava/lang/Object;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    if-ne p1, v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 220
    :cond_0
    new-instance p3, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Trying to add existing element "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p2, "["

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, "] at index "

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p3, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p3

    .line 225
    :cond_1
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValueList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_3

    .line 226
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValidIndices:Ljava/util/BitSet;

    invoke-virtual {v0, p1}, Ljava/util/BitSet;->get(I)Z

    move-result v0

    if-nez v0, :cond_2

    goto :goto_0

    .line 228
    :cond_2
    new-instance p3, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Trying to add new element "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p2, " at index "

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, ", already occupied by "

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValueList:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p3, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p3

    .line 232
    :cond_3
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValueList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-le p1, v0, :cond_4

    add-int/lit8 v0, p1, -0x1

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->addNulls(I)V

    .line 236
    :cond_4
    :goto_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    if-eqz v0, :cond_5

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->skipHostUpdate()Z

    move-result v0

    if-nez v0, :cond_5

    .line 237
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    invoke-interface {v0, p1, p2, p3}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->adding(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 240
    :cond_5
    iget-object p3, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myKeyMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p3, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 241
    iget-object p3, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValueList:Ljava/util/ArrayList;

    invoke-virtual {p3, p1, p2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 242
    iget-object p2, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValidIndices:Ljava/util/BitSet;

    invoke-virtual {p2, p1}, Ljava/util/BitSet;->set(I)V

    const/4 p1, 0x1

    return p1
.end method

.method public size()I
    .locals 1

    .line 191
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myKeyMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    return v0
.end method

.method public toArray()[Ljava/lang/Object;
    .locals 4

    .line 305
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myKeyMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, -0x1

    const/4 v2, -0x1

    :goto_0
    add-int/lit8 v1, v1, 0x1

    .line 308
    iget-object v3, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValueList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v1, v3, :cond_1

    .line 309
    iget-object v3, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValidIndices:Ljava/util/BitSet;

    invoke-virtual {v3, v1}, Ljava/util/BitSet;->get(I)Z

    move-result v3

    if-nez v3, :cond_0

    goto :goto_0

    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 310
    iget-object v3, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValueList:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v0, v2

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)[TT;"
        }
    .end annotation

    .line 319
    array-length v0, p1

    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myKeyMap:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 320
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, [Ljava/lang/Object;

    if-ne v0, v1, :cond_0

    iget-object p1, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myKeyMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Ljava/util/HashMap;->size()I

    move-result p1

    new-array p1, p1, [Ljava/lang/Object;

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object p1

    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myKeyMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    invoke-static {p1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/Object;

    check-cast p1, [Ljava/lang/Object;

    :cond_1
    :goto_0
    const/4 v0, -0x1

    const/4 v1, -0x1

    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 325
    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValueList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_3

    .line 326
    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValidIndices:Ljava/util/BitSet;

    invoke-virtual {v2, v0}, Ljava/util/BitSet;->get(I)Z

    move-result v2

    if-nez v2, :cond_2

    goto :goto_1

    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 327
    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValueList:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    aput-object v2, p1, v1

    goto :goto_1

    .line 330
    :cond_3
    array-length v0, p1

    add-int/lit8 v1, v1, 0x1

    if-le v0, v1, :cond_4

    const/4 v0, 0x0

    .line 331
    aput-object v0, p1, v1

    .line 333
    :cond_4
    check-cast p1, [Ljava/lang/Object;

    return-object p1
.end method

.method public validateIndex(I)V
    .locals 3

    .line 175
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->isValidIndex(I)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 176
    :cond_0
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Index "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " is not valid, size="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValueList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " validIndices["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "]="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValidIndices:Ljava/util/BitSet;

    invoke-virtual {v2, p1}, Ljava/util/BitSet;->get(I)Z

    move-result p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public valueDifferenceBitSet(Ljava/lang/Iterable;)Ljava/util/BitSet;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Ljava/util/Map$Entry<",
            "*+TE;>;>;)",
            "Ljava/util/BitSet;"
        }
    .end annotation

    .line 88
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->valueDifferenceBitSet(Ljava/util/Iterator;)Ljava/util/BitSet;

    move-result-object p1

    return-object p1
.end method

.method public valueDifferenceBitSet(Ljava/util/Iterator;)Ljava/util/BitSet;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Iterator<",
            "+",
            "Ljava/util/Map$Entry<",
            "*+TE;>;>;)",
            "Ljava/util/BitSet;"
        }
    .end annotation

    .line 92
    new-instance v0, Ljava/util/BitSet;

    invoke-direct {v0}, Ljava/util/BitSet;-><init>()V

    const/4 v1, 0x0

    .line 94
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 95
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 96
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->indexOf(Ljava/lang/Object;)I

    move-result v2

    if-eq v2, v1, :cond_0

    .line 98
    invoke-virtual {v0, v2}, Ljava/util/BitSet;->set(I)V

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public values()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "TE;>;"
        }
    .end annotation

    .line 209
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->isSparse()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet;->myValueList:Ljava/util/ArrayList;

    return-object v0

    .line 210
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 211
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->iterable()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;

    move-result-object v1

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method
