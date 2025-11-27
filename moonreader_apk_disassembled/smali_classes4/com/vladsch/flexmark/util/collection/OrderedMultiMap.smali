.class public Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;
.super Ljava/lang/Object;
.source "OrderedMultiMap.java"

# interfaces
.implements Ljava/util/Map;
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Map<",
        "TK;TV;>;",
        "Ljava/lang/Iterable<",
        "Ljava/util/Map$Entry<",
        "TK;TV;>;>;"
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/collection/CollectionHost<",
            "Lcom/vladsch/flexmark/util/Paired<",
            "TK;TV;>;>;"
        }
    .end annotation
.end field

.field private myInKeyUpdate:Z

.field private myInValueUpdate:Z

.field private myIndexedProxy:Lcom/vladsch/flexmark/util/collection/iteration/Indexed;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/collection/iteration/Indexed<",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation
.end field

.field private final myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/collection/OrderedSet<",
            "TK;>;"
        }
    .end annotation
.end field

.field private final myValueSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/collection/OrderedSet<",
            "TV;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 18
    invoke-direct {p0, v0, v1}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;-><init>(ILcom/vladsch/flexmark/util/collection/CollectionHost;)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    const/4 v0, 0x0

    .line 22
    invoke-direct {p0, p1, v0}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;-><init>(ILcom/vladsch/flexmark/util/collection/CollectionHost;)V

    return-void
.end method

.method public constructor <init>(ILcom/vladsch/flexmark/util/collection/CollectionHost;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/vladsch/flexmark/util/collection/CollectionHost<",
            "Lcom/vladsch/flexmark/util/Paired<",
            "TK;TV;>;>;)V"
        }
    .end annotation

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p2, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    const/4 p2, 0x0

    .line 31
    iput-object p2, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myIndexedProxy:Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    .line 32
    new-instance p2, Lcom/vladsch/flexmark/util/collection/OrderedSet;

    new-instance v0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$1;

    invoke-direct {v0, p0}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$1;-><init>(Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;)V

    invoke-direct {p2, p1, v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;-><init>(ILcom/vladsch/flexmark/util/collection/CollectionHost;)V

    iput-object p2, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myValueSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    .line 64
    new-instance p2, Lcom/vladsch/flexmark/util/collection/OrderedSet;

    new-instance v0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$2;

    invoke-direct {v0, p0}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$2;-><init>(Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;)V

    invoke-direct {p2, p1, v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;-><init>(ILcom/vladsch/flexmark/util/collection/CollectionHost;)V

    iput-object p2, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/collection/CollectionHost;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/collection/CollectionHost<",
            "Lcom/vladsch/flexmark/util/Paired<",
            "TK;TV;>;>;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 26
    invoke-direct {p0, v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;-><init>(ILcom/vladsch/flexmark/util/collection/CollectionHost;)V

    return-void
.end method

.method static synthetic access$000(Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;ILjava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->addingValue(ILjava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$100(Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;ILjava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 9
    invoke-direct {p0, p1, p2}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->removingValue(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1000(Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;ILjava/lang/Object;Ljava/lang/Object;)Z
    .locals 0

    .line 9
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->removeEntryIndex(ILjava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$200(Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;I)V
    .locals 0

    .line 9
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->addingNullValue(I)V

    return-void
.end method

.method static synthetic access$300(Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;)Z
    .locals 0

    .line 9
    iget-boolean p0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInKeyUpdate:Z

    return p0
.end method

.method static synthetic access$400(Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;ILjava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->addingKey(ILjava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$500(Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;ILjava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 9
    invoke-direct {p0, p1, p2}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->removingKey(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$600(Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;I)V
    .locals 0

    .line 9
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->addingNullKey(I)V

    return-void
.end method

.method static synthetic access$700(Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;)Z
    .locals 0

    .line 9
    iget-boolean p0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInValueUpdate:Z

    return p0
.end method

.method static synthetic access$800(Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;I)Ljava/util/Map$Entry;
    .locals 0

    .line 9
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->getEntry(I)Ljava/util/Map$Entry;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$900(Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;I)Z
    .locals 0

    .line 9
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->removeEntryIndex(I)Z

    move-result p0

    return p0
.end method

.method private addKeyValue(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)Z"
        }
    .end annotation

    .line 293
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 294
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myValueSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v1, p2}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->indexOf(Ljava/lang/Object;)I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v5, -0x1

    if-ne v0, v5, :cond_3

    if-ne v1, v5, :cond_3

    .line 298
    iput-boolean v4, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInKeyUpdate:Z

    .line 299
    iput-boolean v4, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInValueUpdate:Z

    .line 300
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->skipHostUpdate()Z

    move-result v0

    if-nez v0, :cond_0

    .line 301
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->getValueList()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    new-instance v5, Lcom/vladsch/flexmark/util/Pair;

    invoke-direct {v5, p1, p2}, Lcom/vladsch/flexmark/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1, v5, v2}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->adding(ILjava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    if-nez p1, :cond_1

    .line 304
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->addNull()V

    goto :goto_0

    .line 305
    :cond_1
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0, p1, p2}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->add(Ljava/lang/Object;Ljava/lang/Object;)Z

    :goto_0
    if-nez p1, :cond_2

    .line 307
    iget-object p1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myValueSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->addNull()V

    goto :goto_1

    .line 308
    :cond_2
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myValueSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0, p2, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->add(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 310
    :goto_1
    iput-boolean v3, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInValueUpdate:Z

    .line 311
    iput-boolean v3, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInKeyUpdate:Z

    return v4

    :cond_3
    if-ne v0, v5, :cond_6

    .line 317
    iput-boolean v4, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInKeyUpdate:Z

    .line 318
    iput-boolean v4, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInValueUpdate:Z

    .line 319
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    if-eqz v0, :cond_4

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->skipHostUpdate()Z

    move-result v0

    if-nez v0, :cond_4

    .line 320
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    new-instance v5, Lcom/vladsch/flexmark/util/Pair;

    invoke-direct {v5, p1, p2}, Lcom/vladsch/flexmark/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1, v5, v2}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->adding(ILjava/lang/Object;Ljava/lang/Object;)V

    :cond_4
    if-nez p1, :cond_5

    .line 323
    iget-object p1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {p1, v1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->removeIndex(I)Z

    goto :goto_2

    .line 324
    :cond_5
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0, v1, p1, p2}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->setValueAt(ILjava/lang/Object;Ljava/lang/Object;)Z

    .line 326
    :goto_2
    iput-boolean v3, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInValueUpdate:Z

    .line 327
    iput-boolean v3, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInKeyUpdate:Z

    return v4

    :cond_6
    if-ne v1, v5, :cond_9

    .line 332
    iput-boolean v4, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInKeyUpdate:Z

    .line 333
    iput-boolean v4, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInValueUpdate:Z

    .line 334
    iget-object v5, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    if-eqz v5, :cond_7

    invoke-interface {v5}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->skipHostUpdate()Z

    move-result v5

    if-nez v5, :cond_7

    .line 335
    iget-object v5, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    new-instance v6, Lcom/vladsch/flexmark/util/Pair;

    invoke-direct {v6, p1, p2}, Lcom/vladsch/flexmark/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v5, v0, v6, v2}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->adding(ILjava/lang/Object;Ljava/lang/Object;)V

    :cond_7
    if-nez p1, :cond_8

    .line 338
    iget-object p1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myValueSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {p1, v1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->removeIndex(I)Z

    goto :goto_3

    .line 339
    :cond_8
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myValueSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v1, v0, p2, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->setValueAt(ILjava/lang/Object;Ljava/lang/Object;)Z

    .line 342
    :goto_3
    iput-boolean v3, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInValueUpdate:Z

    return v4

    :cond_9
    if-ne v1, v0, :cond_a

    return v3

    .line 347
    :cond_a
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "keySet["

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "]="

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " and valueSet["

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " are out of sync"

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private addingKey(ILjava/lang/Object;Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITK;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    const/4 v0, 0x1

    .line 141
    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInValueUpdate:Z

    .line 142
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->skipHostUpdate()Z

    move-result v0

    if-nez v0, :cond_0

    .line 143
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    new-instance v1, Lcom/vladsch/flexmark/util/Pair;

    invoke-direct {v1, p2, p3}, Lcom/vladsch/flexmark/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    const/4 p2, 0x0

    invoke-interface {v0, p1, v1, p2}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->adding(ILjava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    if-nez p3, :cond_1

    .line 145
    iget-object p2, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myValueSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {p2, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->addNulls(I)V

    goto :goto_0

    .line 146
    :cond_1
    iget-object p1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myValueSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {p1, p3}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->add(Ljava/lang/Object;)Z

    :goto_0
    const/4 p1, 0x0

    .line 147
    iput-boolean p1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInValueUpdate:Z

    return-void
.end method

.method private addingNullKey(I)V
    .locals 2

    const/4 v0, 0x1

    .line 153
    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInValueUpdate:Z

    .line 154
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->skipHostUpdate()Z

    move-result v0

    if-nez v0, :cond_0

    .line 155
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->addingNulls(I)V

    .line 157
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->valueSet()Lcom/vladsch/flexmark/util/collection/OrderedSet;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->size()I

    move-result v0

    if-gt v0, p1, :cond_1

    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myValueSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    .line 158
    iput-boolean p1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInValueUpdate:Z

    return-void
.end method

.method private addingNullValue(I)V
    .locals 2

    const/4 v0, 0x1

    .line 189
    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInKeyUpdate:Z

    .line 190
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->skipHostUpdate()Z

    move-result v0

    if-nez v0, :cond_0

    .line 191
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->addingNulls(I)V

    .line 193
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->size()I

    move-result v0

    if-gt v0, p1, :cond_1

    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    .line 194
    iput-boolean p1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInKeyUpdate:Z

    return-void
.end method

.method private addingValue(ILjava/lang/Object;Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITV;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    const/4 v0, 0x1

    .line 177
    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInKeyUpdate:Z

    .line 178
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->skipHostUpdate()Z

    move-result v0

    if-nez v0, :cond_0

    .line 179
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    new-instance v1, Lcom/vladsch/flexmark/util/Pair;

    invoke-direct {v1, p3, p2}, Lcom/vladsch/flexmark/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    const/4 p2, 0x0

    invoke-interface {v0, p1, v1, p2}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->adding(ILjava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    if-nez p3, :cond_1

    .line 181
    iget-object p2, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {p2, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->addNulls(I)V

    goto :goto_0

    .line 182
    :cond_1
    iget-object p1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {p1, p3}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->add(Ljava/lang/Object;)Z

    :goto_0
    const/4 p1, 0x0

    .line 183
    iput-boolean p1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInKeyUpdate:Z

    return-void
.end method

.method private getEntry(I)Ljava/util/Map$Entry;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;"
        }
    .end annotation

    .line 130
    new-instance v0, Lcom/vladsch/flexmark/util/collection/MapEntry;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v1, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->getValueOrNull(I)Ljava/lang/Object;

    move-result-object v1

    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myValueSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v2, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->getValueOrNull(I)Ljava/lang/Object;

    move-result-object p1

    invoke-direct {v0, v1, p1}, Lcom/vladsch/flexmark/util/collection/MapEntry;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0
.end method

.method private getKeyValueIntersectionSet()Ljava/util/BitSet;
    .locals 2

    .line 563
    new-instance v0, Ljava/util/BitSet;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/BitSet;-><init>(I)V

    .line 564
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->getValidIndices()Ljava/util/BitSet;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    .line 565
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myValueSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->getValidIndices()Ljava/util/BitSet;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/BitSet;->and(Ljava/util/BitSet;)V

    return-object v0
.end method

.method private getKeyValueUnionSet()Ljava/util/BitSet;
    .locals 2

    .line 556
    new-instance v0, Ljava/util/BitSet;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/BitSet;-><init>(I)V

    .line 557
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->getValidIndices()Ljava/util/BitSet;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    .line 558
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myValueSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->getValidIndices()Ljava/util/BitSet;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    return-object v0
.end method

.method private removeEntryIndex(I)Z
    .locals 2

    .line 364
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->getValueOrNull(I)Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myValueSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v1, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->getValueOrNull(I)Ljava/lang/Object;

    move-result-object v1

    invoke-direct {p0, p1, v0, v1}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->removeEntryIndex(ILjava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method private removeEntryIndex(ILjava/lang/Object;Ljava/lang/Object;)Z
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITK;TV;)Z"
        }
    .end annotation

    .line 368
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0, p2}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 369
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myValueSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v1, p3}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->indexOf(Ljava/lang/Object;)I

    move-result v1

    .line 371
    const-string v2, " are out of sync"

    const-string v3, " and valueSet["

    const-string v4, "]="

    if-ne v0, v1, :cond_4

    const/4 v5, -0x1

    if-eq p1, v5, :cond_1

    if-ne v0, p1, :cond_0

    goto :goto_0

    .line 376
    :cond_0
    new-instance v5, Ljava/lang/IllegalStateException;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "removeEntryIndex "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " does not match keySet["

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v5, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    :cond_1
    :goto_0
    const/4 p1, 0x0

    if-eq v0, v5, :cond_3

    const/4 v1, 0x1

    .line 380
    iput-boolean v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInKeyUpdate:Z

    .line 381
    iput-boolean v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInValueUpdate:Z

    .line 382
    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    if-eqz v2, :cond_2

    invoke-interface {v2}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->skipHostUpdate()Z

    move-result v2

    if-nez v2, :cond_2

    .line 383
    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    new-instance v3, Lcom/vladsch/flexmark/util/Pair;

    invoke-direct {v3, p2, p3}, Lcom/vladsch/flexmark/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v2, v0, v3}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->removing(ILjava/lang/Object;)Ljava/lang/Object;

    .line 385
    :cond_2
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0, p2}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->removeHosted(Ljava/lang/Object;)Ljava/lang/Object;

    .line 386
    iget-object p2, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myValueSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {p2, p3}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->removeHosted(Ljava/lang/Object;)Ljava/lang/Object;

    .line 387
    iput-boolean p1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInValueUpdate:Z

    .line 388
    iput-boolean p1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInKeyUpdate:Z

    return v1

    :cond_3
    return p1

    .line 372
    :cond_4
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "keySet["

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private removingKey(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITK;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    const/4 v0, 0x1

    .line 164
    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInValueUpdate:Z

    .line 165
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->skipHostUpdate()Z

    move-result v0

    if-nez v0, :cond_0

    .line 166
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    new-instance v1, Lcom/vladsch/flexmark/util/Pair;

    const/4 v2, 0x0

    invoke-direct {v1, p2, v2}, Lcom/vladsch/flexmark/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, p1, v1}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->removing(ILjava/lang/Object;)Ljava/lang/Object;

    .line 168
    :cond_0
    iget-object p2, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myValueSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {p2, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->removeIndexHosted(I)Ljava/lang/Object;

    move-result-object p1

    const/4 p2, 0x0

    .line 169
    iput-boolean p2, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInValueUpdate:Z

    return-object p1
.end method

.method private removingValue(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITV;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    const/4 v0, 0x1

    .line 200
    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInKeyUpdate:Z

    .line 201
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->skipHostUpdate()Z

    move-result v0

    if-nez v0, :cond_0

    .line 202
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    new-instance v1, Lcom/vladsch/flexmark/util/Pair;

    const/4 v2, 0x0

    invoke-direct {v1, v2, p2}, Lcom/vladsch/flexmark/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, p1, v1}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->removing(ILjava/lang/Object;)Ljava/lang/Object;

    .line 204
    :cond_0
    iget-object p2, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {p2, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->removeIndexHosted(I)Ljava/lang/Object;

    move-result-object p1

    const/4 p2, 0x0

    .line 205
    iput-boolean p2, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInKeyUpdate:Z

    return-object p1
.end method


# virtual methods
.method public addNullEntry(I)V
    .locals 1

    const/4 v0, 0x1

    .line 251
    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInKeyUpdate:Z

    .line 252
    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInValueUpdate:Z

    .line 254
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->skipHostUpdate()Z

    move-result v0

    if-nez v0, :cond_0

    .line 255
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->addingNulls(I)V

    .line 257
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->addNulls(I)V

    .line 258
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myValueSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->addNulls(I)V

    const/4 p1, 0x0

    .line 260
    iput-boolean p1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInValueUpdate:Z

    .line 261
    iput-boolean p1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInKeyUpdate:Z

    return-void
.end method

.method public clear()V
    .locals 1

    const/4 v0, 0x1

    .line 439
    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInValueUpdate:Z

    .line 440
    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInKeyUpdate:Z

    .line 442
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->skipHostUpdate()Z

    move-result v0

    if-nez v0, :cond_0

    .line 443
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->clearing()V

    .line 445
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->clear()V

    .line 446
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myValueSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->clear()V

    const/4 v0, 0x0

    .line 448
    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInKeyUpdate:Z

    .line 449
    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInValueUpdate:Z

    return-void
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .locals 1

    .line 221
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->contains(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .locals 1

    .line 226
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myValueSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->indexOf(Ljava/lang/Object;)I

    move-result p1

    .line 227
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->isValidIndex(I)Z

    move-result p1

    return p1
.end method

.method public entrySet()Lcom/vladsch/flexmark/util/collection/OrderedSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/OrderedSet<",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 500
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->keyValueEntrySet()Lcom/vladsch/flexmark/util/collection/OrderedSet;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic entrySet()Ljava/util/Set;
    .locals 1

    .line 9
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->entrySet()Lcom/vladsch/flexmark/util/collection/OrderedSet;

    move-result-object v0

    return-object v0
.end method

.method public entrySetIterable()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable<",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 546
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->getKeyValueUnionSet()Ljava/util/BitSet;

    move-result-object v0

    .line 547
    new-instance v1, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->getIndexedProxy()Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    move-result-object v2

    new-instance v3, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterable;

    invoke-direct {v3, v0}, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterable;-><init>(Ljava/util/BitSet;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;-><init>(Lcom/vladsch/flexmark/util/collection/iteration/Indexed;Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;)V

    return-object v1
.end method

.method public entrySetIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator<",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 536
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->getKeyValueUnionSet()Ljava/util/BitSet;

    move-result-object v0

    .line 537
    new-instance v1, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->getIndexedProxy()Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    move-result-object v2

    new-instance v3, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterator;

    invoke-direct {v3, v0}, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterator;-><init>(Ljava/util/BitSet;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;-><init>(Lcom/vladsch/flexmark/util/collection/iteration/Indexed;Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;)V

    return-object v1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_4

    .line 639
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_0

    .line 641
    :cond_1
    check-cast p1, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    .line 643
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->size()I

    move-result v2

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->size()I

    move-result v3

    if-eq v2, v3, :cond_2

    return v1

    .line 644
    :cond_2
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->entrySet()Lcom/vladsch/flexmark/util/collection/OrderedSet;

    move-result-object v2

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->entrySet()Lcom/vladsch/flexmark/util/collection/OrderedSet;

    move-result-object p1

    invoke-virtual {v2, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    return v1

    :cond_3
    return v0

    :cond_4
    :goto_0
    return v1
.end method

.method public forEach(Lcom/vladsch/flexmark/util/collection/Consumer;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/collection/Consumer<",
            "-",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;)V"
        }
    .end annotation

    .line 579
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->entrySetIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;

    move-result-object v0

    .line 580
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 581
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {p1, v1}, Lcom/vladsch/flexmark/util/collection/Consumer;->accept(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .line 232
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->getKeyValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getIndexedProxy()Lcom/vladsch/flexmark/util/collection/iteration/Indexed;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/Indexed<",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 98
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myIndexedProxy:Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    if-eqz v0, :cond_0

    return-object v0

    .line 99
    :cond_0
    new-instance v0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$3;

    invoke-direct {v0, p0}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$3;-><init>(Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myIndexedProxy:Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    return-object v0
.end method

.method public getKey(I)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TK;"
        }
    .end annotation

    .line 489
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->isValidIndex(I)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 490
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->getValueList()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getKeyValue(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .line 236
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->indexOf(Ljava/lang/Object;)I

    move-result p1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 237
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myValueSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->getValue(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getModificationCount()I
    .locals 4

    .line 134
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->getModificationCount()I

    move-result v0

    int-to-long v0, v0

    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myValueSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->getModificationCount()I

    move-result v2

    int-to-long v2, v2

    add-long/2addr v0, v2

    long-to-int v1, v0

    return v1
.end method

.method public getValue(I)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TV;"
        }
    .end annotation

    .line 494
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myValueSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->isValidIndex(I)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 495
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myValueSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->getValue(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getValueKey(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TK;"
        }
    .end annotation

    .line 241
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myValueSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->indexOf(Ljava/lang/Object;)I

    move-result p1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 242
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->getValue(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public hashCode()I
    .locals 2

    .line 650
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    .line 651
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myValueSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .line 216
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 575
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->entrySetIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;

    move-result-object v0

    return-object v0
.end method

.method public keyIterable()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable<",
            "TK;>;"
        }
    .end annotation

    .line 528
    new-instance v0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->getIndexedProxy()Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    move-result-object v1

    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->indexIterable()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;-><init>(Lcom/vladsch/flexmark/util/collection/iteration/Indexed;Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;)V

    return-object v0
.end method

.method public keyIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator<",
            "TK;>;"
        }
    .end annotation

    .line 520
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->keySet()Lcom/vladsch/flexmark/util/collection/OrderedSet;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;

    move-result-object v0

    return-object v0
.end method

.method public keySet()Lcom/vladsch/flexmark/util/collection/OrderedSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/OrderedSet<",
            "TK;>;"
        }
    .end annotation

    .line 454
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    return-object v0
.end method

.method public bridge synthetic keySet()Ljava/util/Set;
    .locals 1

    .line 9
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->keySet()Lcom/vladsch/flexmark/util/collection/OrderedSet;

    move-result-object v0

    return-object v0
.end method

.method public keyValueEntrySet()Lcom/vladsch/flexmark/util/collection/OrderedSet;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/OrderedSet<",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation

    const/4 v0, 0x1

    .line 587
    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInValueUpdate:Z

    .line 588
    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInKeyUpdate:Z

    .line 590
    new-instance v0, Lcom/vladsch/flexmark/util/collection/OrderedSet;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->size()I

    move-result v1

    new-instance v2, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$4;

    invoke-direct {v2, p0}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$4;-><init>(Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;)V

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/collection/OrderedSet;-><init>(ILcom/vladsch/flexmark/util/collection/CollectionHost;)V

    .line 624
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->entrySetIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;

    move-result-object v1

    .line 625
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 626
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 630
    iput-boolean v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInValueUpdate:Z

    .line 631
    iput-boolean v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInKeyUpdate:Z

    return-object v0
.end method

.method public keys()Ljava/util/Collection;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "TK;>;"
        }
    .end annotation

    .line 476
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->isSparse()Z

    move-result v0

    if-nez v0, :cond_0

    .line 477
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    return-object v0

    .line 480
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myValueSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 481
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;

    move-result-object v1

    .line 482
    :goto_0
    invoke-interface {v1}, Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 483
    invoke-interface {v1}, Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .line 247
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->putKeyValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public putAll(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "+TK;+TV;>;)V"
        }
    .end annotation

    .line 422
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->putAllKeyValues(Ljava/util/Map;)V

    return-void
.end method

.method public putAllKeyValues(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "+TK;+TV;>;)V"
        }
    .end annotation

    .line 426
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 427
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v1, v0}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    return-void
.end method

.method public putAllValueKeys(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "+TV;+TK;>;)V"
        }
    .end annotation

    .line 432
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 433
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v1, v0}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->putValueKey(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    return-void
.end method

.method public putEntry(Ljava/util/Map$Entry;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;)Z"
        }
    .end annotation

    .line 265
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->addKeyValue(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public putKeyValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .line 285
    invoke-direct {p0, p1, p2}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->addKeyValue(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    return-object p2

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public putKeyValueEntry(Ljava/util/Map$Entry;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;)Z"
        }
    .end annotation

    .line 269
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->addKeyValue(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public putKeyValuePair(Lcom/vladsch/flexmark/util/Paired;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/Paired<",
            "TK;TV;>;)Z"
        }
    .end annotation

    .line 277
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/Paired;->getFirst()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/Paired;->getSecond()Ljava/lang/Object;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->addKeyValue(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public putValueKey(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;TK;)TK;"
        }
    .end annotation

    .line 289
    invoke-direct {p0, p2, p1}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->addKeyValue(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    return-object p2

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public putValueKeyEntry(Ljava/util/Map$Entry;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry<",
            "TV;TK;>;)Z"
        }
    .end annotation

    .line 273
    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->addKeyValue(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public putValueKeyPair(Lcom/vladsch/flexmark/util/Paired;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/Paired<",
            "TV;TK;>;)Z"
        }
    .end annotation

    .line 281
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/Paired;->getSecond()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/Paired;->getFirst()Ljava/lang/Object;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->addKeyValue(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .line 355
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->removeKey(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public removeEntry(Ljava/util/Map$Entry;)Ljava/util/Map$Entry;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;)",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;"
        }
    .end annotation

    .line 359
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    const/4 v2, -0x1

    invoke-direct {p0, v2, v0, v1}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->removeEntryIndex(ILjava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public removeKey(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    const/4 v0, 0x1

    .line 395
    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInKeyUpdate:Z

    .line 396
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->skipHostUpdate()Z

    move-result v0

    if-nez v0, :cond_1

    .line 397
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->indexOf(Ljava/lang/Object;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    .line 399
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    new-instance v2, Lcom/vladsch/flexmark/util/Pair;

    iget-object v3, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myValueSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v3, v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->isValidIndex(I)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myValueSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v3, v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->getValue(I)Ljava/lang/Object;

    move-result-object v3

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    invoke-direct {v2, p1, v3}, Lcom/vladsch/flexmark/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v1, v0, v2}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->removing(ILjava/lang/Object;)Ljava/lang/Object;

    .line 402
    :cond_1
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->removeHosted(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    const/4 v0, 0x0

    .line 403
    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInKeyUpdate:Z

    return-object p1
.end method

.method public removeValue(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TK;"
        }
    .end annotation

    const/4 v0, 0x1

    .line 408
    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInValueUpdate:Z

    .line 409
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myValueSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 410
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    if-eqz v1, :cond_1

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->skipHostUpdate()Z

    move-result v1

    if-nez v1, :cond_1

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    .line 412
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myHost:Lcom/vladsch/flexmark/util/collection/CollectionHost;

    new-instance v2, Lcom/vladsch/flexmark/util/Pair;

    iget-object v3, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v3, v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->isValidIndex(I)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v3, v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->getValue(I)Ljava/lang/Object;

    move-result-object v3

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    invoke-direct {v2, v3, p1}, Lcom/vladsch/flexmark/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v1, v0, v2}, Lcom/vladsch/flexmark/util/collection/CollectionHost;->removing(ILjava/lang/Object;)Ljava/lang/Object;

    .line 415
    :cond_1
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myValueSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->removeHosted(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    const/4 v0, 0x0

    .line 416
    iput-boolean v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myInValueUpdate:Z

    return-object p1
.end method

.method public reversedEntrySetIterable()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable<",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 551
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->getKeyValueUnionSet()Ljava/util/BitSet;

    move-result-object v0

    .line 552
    new-instance v1, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->getIndexedProxy()Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    move-result-object v2

    new-instance v3, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterable;

    invoke-direct {v3, v0}, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterable;-><init>(Ljava/util/BitSet;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;-><init>(Lcom/vladsch/flexmark/util/collection/iteration/Indexed;Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;)V

    return-object v1
.end method

.method public reversedEntrySetIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator<",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 541
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->getKeyValueUnionSet()Ljava/util/BitSet;

    move-result-object v0

    .line 542
    new-instance v1, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->getIndexedProxy()Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    move-result-object v2

    new-instance v3, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterator;

    const/4 v4, 0x1

    invoke-direct {v3, v0, v4}, Lcom/vladsch/flexmark/util/collection/iteration/BitSetIterator;-><init>(Ljava/util/BitSet;Z)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterator;-><init>(Lcom/vladsch/flexmark/util/collection/iteration/Indexed;Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterator;)V

    return-object v1
.end method

.method public reversedKeyIterable()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable<",
            "TK;>;"
        }
    .end annotation

    .line 532
    new-instance v0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->getIndexedProxy()Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    move-result-object v1

    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->reversedIndexIterable()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;-><init>(Lcom/vladsch/flexmark/util/collection/iteration/Indexed;Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;)V

    return-object v0
.end method

.method public reversedKeyIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator<",
            "TK;>;"
        }
    .end annotation

    .line 524
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->keySet()Lcom/vladsch/flexmark/util/collection/OrderedSet;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->reversedIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;

    move-result-object v0

    return-object v0
.end method

.method public reversedValueIterable()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable<",
            "TV;>;"
        }
    .end annotation

    .line 516
    new-instance v0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myValueSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->getIndexedProxy()Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    move-result-object v1

    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myValueSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->reversedIndexIterable()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;-><init>(Lcom/vladsch/flexmark/util/collection/iteration/Indexed;Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;)V

    return-object v0
.end method

.method public reversedValueIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator<",
            "TV;>;"
        }
    .end annotation

    .line 508
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myValueSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->reversedIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;

    move-result-object v0

    return-object v0
.end method

.method public size()I
    .locals 1

    .line 211
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->size()I

    move-result v0

    return v0
.end method

.method public valueIterable()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable<",
            "TV;>;"
        }
    .end annotation

    .line 512
    new-instance v0, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myValueSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->getIndexedProxy()Lcom/vladsch/flexmark/util/collection/iteration/Indexed;

    move-result-object v1

    iget-object v2, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myValueSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->indexIterable()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/collection/iteration/IndexedIterable;-><init>(Lcom/vladsch/flexmark/util/collection/iteration/Indexed;Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIterable;)V

    return-object v0
.end method

.method public valueIterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator<",
            "TV;>;"
        }
    .end annotation

    .line 504
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myValueSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;

    move-result-object v0

    return-object v0
.end method

.method public valueSet()Lcom/vladsch/flexmark/util/collection/OrderedSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vladsch/flexmark/util/collection/OrderedSet<",
            "TV;>;"
        }
    .end annotation

    .line 472
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myValueSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    return-object v0
.end method

.method public values()Ljava/util/Collection;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "TV;>;"
        }
    .end annotation

    .line 459
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->isSparse()Z

    move-result v0

    if-nez v0, :cond_0

    .line 460
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myValueSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    return-object v0

    .line 463
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myKeySet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 464
    iget-object v1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->myValueSet:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;

    move-result-object v1

    .line 465
    :goto_0
    invoke-interface {v1}, Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 466
    invoke-interface {v1}, Lcom/vladsch/flexmark/util/collection/iteration/ReversibleIndexedIterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method
