.class Lcom/vladsch/flexmark/util/collection/OrderedMap$1;
.super Ljava/lang/Object;
.source "OrderedMap.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/collection/CollectionHost;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/util/collection/OrderedMap;-><init>(ILcom/vladsch/flexmark/util/collection/CollectionHost;)V
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
.field final synthetic this$0:Lcom/vladsch/flexmark/util/collection/OrderedMap;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/util/collection/OrderedMap;)V
    .locals 0

    .line 34
    iput-object p1, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap$1;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMap;

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

    .line 37
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap$1;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMap;

    invoke-virtual {v0, p1, p2, p3}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->adding(ILjava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public addingNulls(I)V
    .locals 1

    .line 53
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap$1;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMap;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->addingNull(I)V

    return-void
.end method

.method public clearing()V
    .locals 1

    .line 47
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap$1;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMap;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->clearing()V

    return-void
.end method

.method public getIteratorModificationCount()I
    .locals 1

    .line 63
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap$1;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMap;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->getModificationCount()I

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

    .line 42
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap$1;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMap;

    invoke-virtual {v0, p1, p2}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->removing(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public skipHostUpdate()Z
    .locals 1

    .line 58
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedMap$1;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedMap;

    invoke-static {v0}, Lcom/vladsch/flexmark/util/collection/OrderedMap;->access$000(Lcom/vladsch/flexmark/util/collection/OrderedMap;)Z

    move-result v0

    return v0
.end method
