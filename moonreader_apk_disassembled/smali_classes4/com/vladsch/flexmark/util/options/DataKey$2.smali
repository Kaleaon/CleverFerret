.class Lcom/vladsch/flexmark/util/options/DataKey$2;
.super Ljava/lang/Object;
.source "DataKey.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/collection/DataValueFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V
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
.field final synthetic this$0:Lcom/vladsch/flexmark/util/options/DataKey;

.field final synthetic val$defaultValue:Ljava/lang/Object;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)V
    .locals 0

    .line 39
    iput-object p1, p0, Lcom/vladsch/flexmark/util/options/DataKey$2;->this$0:Lcom/vladsch/flexmark/util/options/DataKey;

    iput-object p2, p0, Lcom/vladsch/flexmark/util/options/DataKey$2;->val$defaultValue:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public create(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/options/DataHolder;",
            ")TT;"
        }
    .end annotation

    .line 42
    iget-object p1, p0, Lcom/vladsch/flexmark/util/options/DataKey$2;->val$defaultValue:Ljava/lang/Object;

    return-object p1
.end method

.method public bridge synthetic create(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 39
    check-cast p1, Lcom/vladsch/flexmark/util/options/DataHolder;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/options/DataKey$2;->create(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
