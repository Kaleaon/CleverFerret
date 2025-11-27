.class Lio/opencensus/stats/View$1;
.super Ljava/lang/Object;
.source "View.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/stats/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lio/opencensus/tags/TagKey;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lio/opencensus/tags/TagKey;Lio/opencensus/tags/TagKey;)I
    .locals 0

    .line 51
    invoke-virtual {p1}, Lio/opencensus/tags/TagKey;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Lio/opencensus/tags/TagKey;->getName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 48
    check-cast p1, Lio/opencensus/tags/TagKey;

    check-cast p2, Lio/opencensus/tags/TagKey;

    invoke-virtual {p0, p1, p2}, Lio/opencensus/stats/View$1;->compare(Lio/opencensus/tags/TagKey;Lio/opencensus/tags/TagKey;)I

    move-result p1

    return p1
.end method
