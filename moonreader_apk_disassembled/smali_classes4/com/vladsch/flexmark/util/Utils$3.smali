.class final Lcom/vladsch/flexmark/util/Utils$3;
.super Ljava/lang/Object;
.source "Utils.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/Function;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/util/Utils;->removeIf(Ljava/util/Map;Lcom/vladsch/flexmark/util/BiFunction;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/Function<",
        "Ljava/util/Map$Entry<",
        "TK;TV;>;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$removeFilter:Lcom/vladsch/flexmark/util/BiFunction;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/util/BiFunction;)V
    .locals 0

    .line 679
    iput-object p1, p0, Lcom/vladsch/flexmark/util/Utils$3;->val$removeFilter:Lcom/vladsch/flexmark/util/BiFunction;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public apply(Ljava/util/Map$Entry;)Ljava/lang/Boolean;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;)",
            "Ljava/lang/Boolean;"
        }
    .end annotation

    .line 682
    iget-object v0, p0, Lcom/vladsch/flexmark/util/Utils$3;->val$removeFilter:Lcom/vladsch/flexmark/util/BiFunction;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p1

    invoke-interface {v0, v1, p1}, Lcom/vladsch/flexmark/util/BiFunction;->apply(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    return-object p1
.end method

.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 679
    check-cast p1, Ljava/util/Map$Entry;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/Utils$3;->apply(Ljava/util/Map$Entry;)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method
