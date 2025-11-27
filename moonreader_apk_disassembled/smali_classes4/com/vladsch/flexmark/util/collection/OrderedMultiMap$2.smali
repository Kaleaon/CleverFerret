.class Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$2;
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
        "TK;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;)V
    .locals 0

    .line 64
    iput-object p1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$2;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public adding(ILjava/lang/Object;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITK;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .line 67
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$2;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    invoke-static {v0, p1, p2, p3}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->access$400(Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;ILjava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public addingNulls(I)V
    .locals 1

    .line 82
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$2;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    invoke-static {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->access$600(Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;I)V

    return-void
.end method

.method public clearing()V
    .locals 1

    .line 77
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$2;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->clear()V

    return-void
.end method

.method public getIteratorModificationCount()I
    .locals 1

    .line 92
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$2;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->getModificationCount()I

    move-result v0

    return v0
.end method

.method public removing(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITK;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 72
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$2;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    invoke-static {v0, p1, p2}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->access$500(Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public skipHostUpdate()Z
    .locals 1

    .line 87
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap$2;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;

    invoke-static {v0}, Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;->access$700(Lcom/vladsch/flexmark/util/collection/OrderedMultiMap;)Z

    move-result v0

    return v0
.end method
