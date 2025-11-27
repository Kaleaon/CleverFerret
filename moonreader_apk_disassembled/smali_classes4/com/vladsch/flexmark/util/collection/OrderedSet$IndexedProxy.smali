.class Lcom/vladsch/flexmark/util/collection/OrderedSet$IndexedProxy;
.super Ljava/lang/Object;
.source "OrderedSet.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/collection/iteration/Indexed;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/util/collection/OrderedSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "IndexedProxy"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/collection/iteration/Indexed<",
        "TE;>;"
    }
.end annotation


# instance fields
.field private final myAllowConcurrentMods:Z

.field final synthetic this$0:Lcom/vladsch/flexmark/util/collection/OrderedSet;


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/collection/OrderedSet;Z)V
    .locals 0

    .line 108
    iput-object p1, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet$IndexedProxy;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 109
    iput-boolean p2, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet$IndexedProxy;->myAllowConcurrentMods:Z

    return-void
.end method


# virtual methods
.method public get(I)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TE;"
        }
    .end annotation

    .line 114
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet$IndexedProxy;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->getValue(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public modificationCount()I
    .locals 1

    .line 134
    iget-boolean v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet$IndexedProxy;->myAllowConcurrentMods:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet$IndexedProxy;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-static {v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->access$100(Lcom/vladsch/flexmark/util/collection/OrderedSet;)I

    move-result v0

    return v0
.end method

.method public removeAt(I)V
    .locals 1

    .line 124
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet$IndexedProxy;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->removeIndexHosted(I)Ljava/lang/Object;

    return-void
.end method

.method public set(ILjava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITE;)V"
        }
    .end annotation

    .line 119
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet$IndexedProxy;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, p2, v1}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->setValueAt(ILjava/lang/Object;Ljava/lang/Object;)Z

    return-void
.end method

.method public size()I
    .locals 1

    .line 129
    iget-object v0, p0, Lcom/vladsch/flexmark/util/collection/OrderedSet$IndexedProxy;->this$0:Lcom/vladsch/flexmark/util/collection/OrderedSet;

    invoke-static {v0}, Lcom/vladsch/flexmark/util/collection/OrderedSet;->access$000(Lcom/vladsch/flexmark/util/collection/OrderedSet;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method
