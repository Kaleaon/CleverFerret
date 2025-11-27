.class public Lcom/vladsch/flexmark/util/collection/MinAggregator;
.super Ljava/lang/Object;
.source "MinAggregator.java"

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


# static fields
.field public static final INSTANCE:Lcom/vladsch/flexmark/util/collection/MinAggregator;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 7
    new-instance v0, Lcom/vladsch/flexmark/util/collection/MinAggregator;

    invoke-direct {v0}, Lcom/vladsch/flexmark/util/collection/MinAggregator;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/util/collection/MinAggregator;->INSTANCE:Lcom/vladsch/flexmark/util/collection/MinAggregator;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public apply(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 2

    if-eqz p2, :cond_1

    if-eqz p1, :cond_0

    .line 14
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-gt v0, v1, :cond_0

    goto :goto_0

    :cond_0
    return-object p2

    :cond_1
    :goto_0
    return-object p1
.end method

.method public bridge synthetic apply(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 6
    check-cast p1, Ljava/lang/Integer;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/collection/MinAggregator;->apply(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method
