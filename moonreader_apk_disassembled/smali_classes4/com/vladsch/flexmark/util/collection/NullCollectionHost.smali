.class public Lcom/vladsch/flexmark/util/collection/NullCollectionHost;
.super Ljava/lang/Object;
.source "NullCollectionHost.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/collection/CollectionHost;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/collection/CollectionHost<",
        "TK;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public adding(ILjava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITK;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    return-void
.end method

.method public addingNulls(I)V
    .locals 0

    return-void
.end method

.method public clearing()V
    .locals 0

    return-void
.end method

.method public getIteratorModificationCount()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public removing(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/Object;",
            ")TK;"
        }
    .end annotation

    const/4 p1, 0x0

    return-object p1
.end method

.method public skipHostUpdate()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
