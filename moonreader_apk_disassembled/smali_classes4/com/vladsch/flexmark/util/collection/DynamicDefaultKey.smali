.class public Lcom/vladsch/flexmark/util/collection/DynamicDefaultKey;
.super Lcom/vladsch/flexmark/util/options/DataKey;
.source "DynamicDefaultKey.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/vladsch/flexmark/util/options/DataKey<",
        "TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/vladsch/flexmark/util/collection/DataValueFactory;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/vladsch/flexmark/util/collection/DataValueFactory<",
            "TT;>;)V"
        }
    .end annotation

    .line 13
    invoke-direct {p0, p1, p2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Lcom/vladsch/flexmark/util/collection/DataValueFactory;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/vladsch/flexmark/util/options/DataKey;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "+TT;>;)V"
        }
    .end annotation

    .line 23
    new-instance v0, Lcom/vladsch/flexmark/util/collection/DynamicDefaultKey$1;

    invoke-direct {v0, p2}, Lcom/vladsch/flexmark/util/collection/DynamicDefaultKey$1;-><init>(Lcom/vladsch/flexmark/util/options/DataKey;)V

    invoke-direct {p0, p1, v0}, Lcom/vladsch/flexmark/util/collection/DynamicDefaultKey;-><init>(Ljava/lang/String;Lcom/vladsch/flexmark/util/collection/DataValueFactory;)V

    return-void
.end method


# virtual methods
.method public getDefaultValue(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/options/DataHolder;",
            ")TT;"
        }
    .end annotation

    .line 33
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/collection/DynamicDefaultKey;->getFactory()Lcom/vladsch/flexmark/util/collection/DataValueFactory;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/collection/DataValueFactory;->create(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
