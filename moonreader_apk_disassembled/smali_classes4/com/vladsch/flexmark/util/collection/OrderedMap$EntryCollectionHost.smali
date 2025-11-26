.class Lcom/vladsch/flexmark/util/collection/OrderedMap$EntryCollectionHost;
.super Ljava/lang/Object;
.source "OrderedMap.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/collection/CollectionHost;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/util/collection/OrderedMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "EntryCollectionHost"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<KK:TK;VV:TV;>",
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/collection/CollectionHost<",
        "Ljava/util/Map$Entry<",
        "TKK;TVV;>;>;"
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/util/collection/OrderedMap;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 408
    const-class v0, Lcom/vladsch/flexmark/util/collection/OrderedMap;

    return-void
.end method

.method private constructor <init>(Lcom/vladsch/flexmark/util/collection/OrderedMap;)V
    .locals 0

    .line 408
    iput-object p1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap$EntryCollectionHost;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vladsch/flexmark/util/collection/OrderedMap;Lcom/vladsch/flexmark/util/collection/OrderedMap$1;)V
    .locals 0

    .line 408
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedMap$EntryCollectionHost;-><init>(Lcom/vladsch/flexmark/util/collection/OrderedMap;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic adding(ILjava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 408
    check-cast p2, Ljava/util/Map$Entry;

    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/util/collection/OrderedMap$EntryCollectionHost;->adding(ILjava/util/Map$Entry;Ljava/lang/Object;)V

    return-void
.end method

.method public adding(ILjava/util/Map$Entry;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Map$Entry<",
            "TKK;TVV;>;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .line 412
    iget-object p1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap$EntryCollectionHost;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMap;

    invoke-static {p1}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->access$200(Lcom/vladsch/flexmark/util/collection/OrderedMap;)Lcom/vladsch/flexmark/util/collection/OrderedSet;

    move-result-object p1

    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p3

    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p1, p3, p2}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->add(Ljava/lang/Object;Ljava/lang/Object;)Z

    return-void
.end method

.method public addingNulls(I)V
    .locals 1

    .line 428
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap$EntryCollectionHost;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMap;

    invoke-static {v0}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->access$200(Lcom/vladsch/flexmark/util/collection/OrderedMap;)Lcom/vladsch/flexmark/util/collection/OrderedSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->addNulls(I)V

    return-void
.end method

.method public clearing()V
    .locals 1

    .line 423
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap$EntryCollectionHost;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMap;

    invoke-static {v0}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->access$200(Lcom/vladsch/flexmark/util/collection/OrderedMap;)Lcom/vladsch/flexmark/util/collection/OrderedSet;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->clear()V

    return-void
.end method

.method public getIteratorModificationCount()I
    .locals 1

    .line 438
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap$EntryCollectionHost;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMap;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->getModificationCount()I

    move-result v0

    return v0
.end method

.method public bridge synthetic removing(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 408
    check-cast p2, Ljava/util/Map$Entry;

    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/collection/OrderedMap$EntryCollectionHost;->removing(ILjava/util/Map$Entry;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public removing(ILjava/util/Map$Entry;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Map$Entry<",
            "TKK;TVV;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 417
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap$EntryCollectionHost;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMap;

    invoke-static {v0}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->access$200(Lcom/vladsch/flexmark/util/collection/OrderedMap;)Lcom/vladsch/flexmark/util/collection/OrderedSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->removeIndex(I)Z

    return-object p2
.end method

.method public skipHostUpdate()Z
    .locals 1

    .line 433
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap$EntryCollectionHost;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMap;

    invoke-static {v0}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->access$000(Lcom/vladsch/flexmark/util/collection/OrderedMap;)Z

    move-result v0

    return v0
.end method
