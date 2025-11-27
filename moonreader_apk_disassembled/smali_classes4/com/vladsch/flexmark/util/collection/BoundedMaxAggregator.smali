.class public Lcom/vladsch/flexmark/util/collection/BoundedMaxAggregator;
.super Ljava/lang/Object;
.source "BoundedMaxAggregator.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/BiFunction;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/BiFunction<",
        "Ljava/lang/Integer;",
        "Ljava/lang/Integer;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field public final maxBound:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    iput p1, p0, Lcom/vladsch/flexmark/util/collection/BoundedMaxAggregator;->maxBound:I

    return-void
.end method


# virtual methods
.method public apply(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 2

    if-eqz p2, :cond_0

    .line 14
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget v1, p0, Lcom/vladsch/flexmark/util/collection/BoundedMaxAggregator;->maxBound:I

    if-ge v0, v1, :cond_0

    sget-object v0, Lcom/vladsch/flexmark/util/collection/MaxAggregator;->INSTANCE:Lcom/vladsch/flexmark/util/collection/MaxAggregator;

    invoke-virtual {v0, p1, p2}, Lcom/vladsch/flexmark/util/collection/MaxAggregator;->apply(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object p1

    :cond_0
    return-object p1
.end method

.method public bridge synthetic apply(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 5
    check-cast p1, Ljava/lang/Integer;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/collection/BoundedMaxAggregator;->apply(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method
