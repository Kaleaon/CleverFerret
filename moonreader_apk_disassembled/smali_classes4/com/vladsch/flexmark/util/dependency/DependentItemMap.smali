.class public Lcom/vladsch/flexmark/util/dependency/DependentItemMap;
.super Lcom/vladsch/flexmark/util/collection/OrderedMap;
.source "DependentItemMap.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/vladsch/flexmark/util/collection/OrderedMap<",
        "Ljava/lang/Class;",
        "Lcom/vladsch/flexmark/util/dependency/DependentItem<",
        "TD;>;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/collection/OrderedMap;-><init>()V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0

    .line 11
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedMap;-><init>(I)V

    return-void
.end method

.method public constructor <init>(ILcom/vladsch/flexmark/util/collection/CollectionHost;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/vladsch/flexmark/util/collection/CollectionHost<",
            "Ljava/lang/Class;",
            ">;)V"
        }
    .end annotation

    .line 19
    invoke-direct {p0, p1, p2}, Lcom/vladsch/flexmark/util/collection/OrderedMap;-><init>(ILcom/vladsch/flexmark/util/collection/CollectionHost;)V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/collection/CollectionHost;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/collection/CollectionHost<",
            "Ljava/lang/Class;",
            ">;)V"
        }
    .end annotation

    .line 15
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/collection/OrderedMap;-><init>(Lcom/vladsch/flexmark/util/collection/CollectionHost;)V

    return-void
.end method
