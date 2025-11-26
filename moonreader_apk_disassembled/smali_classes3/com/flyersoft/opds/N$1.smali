.class Lcom/flyersoft/opds/N$1;
.super Ljava/lang/Object;
.source "N.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/opds/N;->sortLibraryList(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 119
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    .line 121
    check-cast p1, Lcom/flyersoft/opds/OpdsSite;

    iget p1, p1, Lcom/flyersoft/opds/OpdsSite;->topId:I

    .line 122
    check-cast p2, Lcom/flyersoft/opds/OpdsSite;

    iget p2, p2, Lcom/flyersoft/opds/OpdsSite;->topId:I

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    if-ne p2, v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    if-eq p1, v0, :cond_2

    if-eq p2, v0, :cond_1

    if-le p1, p2, :cond_1

    goto :goto_0

    :cond_1
    return v0

    :cond_2
    :goto_0
    const/4 p1, 0x1

    return p1
.end method
