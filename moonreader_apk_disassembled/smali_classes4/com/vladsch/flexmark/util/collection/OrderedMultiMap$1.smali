.class Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$1;
.super Ljava/lang/Object;
.source "OrderedMultiMap.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/collection/CollectionHost;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;-><init>(ILcom/vladsch/flexmark/util/collection/CollectionHost;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/collection/CollectionHost<",
        "TV;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;)V
    .locals 0

    .line 32
    iput-object p1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$1;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public adding(ILjava/lang/Object;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITV;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .line 35
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$1;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    invoke-static {v0, p1, p2, p3}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->access$000(Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;ILjava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public addingNulls(I)V
    .locals 1

    .line 50
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$1;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    invoke-static {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->access$200(Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;I)V

    return-void
.end method

.method public clearing()V
    .locals 1

    .line 45
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$1;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->clear()V

    return-void
.end method

.method public getIteratorModificationCount()I
    .locals 1

    .line 60
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$1;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->getModificationCount()I

    move-result v0

    return v0
.end method

.method public removing(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITV;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 40
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$1;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    invoke-static {v0, p1, p2}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->access$100(Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public skipHostUpdate()Z
    .locals 1

    .line 55
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$1;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    invoke-static {v0}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->access$300(Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;)Z

    move-result v0

    return v0
.end method
