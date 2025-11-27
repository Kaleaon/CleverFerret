.class Lcom/vladsch/flexmark/util/collection/OrderedMap$3;
.super Ljava/lang/Object;
.source "OrderedMap.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/collection/iteration/Indexed;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/util/collection/OrderedMap;->getIndexedValueProxy()Lcom/vladsch/flexmark/util/collection/iteration/Indexed;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/collection/iteration/Indexed<",
        "TV;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/util/collection/OrderedMap;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/util/collection/OrderedMap;)V
    .locals 0

    .line 102
    iput-object p1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap$3;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public get(I)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TV;"
        }
    .end annotation

    .line 105
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap$3;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMap;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->getValue(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public modificationCount()I
    .locals 1

    .line 125
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap$3;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMap;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->getModificationCount()I

    move-result v0

    return v0
.end method

.method public removeAt(I)V
    .locals 1

    .line 115
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap$3;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMap;

    invoke-static {v0}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->access$200(Lcom/vladsch/flexmark/util/collection/OrderedMap;)Lcom/vladsch/flexmark/util/collection/OrderedSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->removeIndexHosted(I)Ljava/lang/Object;

    return-void
.end method

.method public set(ILjava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITV;)V"
        }
    .end annotation

    .line 110
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1
.end method

.method public size()I
    .locals 1

    .line 120
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap$3;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMap;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->size()I

    move-result v0

    return v0
.end method
