.class Lcom/vladsch/flexmark/util/options/DataKey$1;
.super Ljava/lang/Object;
.source "DataKey.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/collection/DataValueFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Lcom/vladsch/flexmark/util/options/DataKey;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/collection/DataValueFactory<",
        "TT;>;"
    }
.end annotation


# instance fields
.field final synthetic val$defaultKey:Lcom/vladsch/flexmark/util/options/DataKey;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/util/options/DataKey;)V
    .locals 0

    .line 28
    iput-object p1, p0, Lcom/vladsch/flexmark/util/options/DataKey$1;->val$defaultKey:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public create(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/options/DataHolder;",
            ")TT;"
        }
    .end annotation

    .line 31
    iget-object v0, p0, Lcom/vladsch/flexmark/util/options/DataKey$1;->val$defaultKey:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic create(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 28
    check-cast p1, Lcom/vladsch/flexmark/util/options/DataHolder;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/options/DataKey$1;->create(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
