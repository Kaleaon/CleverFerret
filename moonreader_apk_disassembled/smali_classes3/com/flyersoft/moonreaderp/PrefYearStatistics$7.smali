.class Lcom/flyersoft/moonreaderp/PrefYearStatistics$7;
.super Ljava/lang/Object;
.source "PrefYearStatistics.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefYearStatistics;->listBooks()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/flyersoft/tools/BookDb$ReadStatistics;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefYearStatistics;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 545
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$7;->this$0:Lcom/flyersoft/moonreaderp/PrefYearStatistics;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/flyersoft/tools/BookDb$ReadStatistics;Lcom/flyersoft/tools/BookDb$ReadStatistics;)I
    .locals 3

    .line 548
    iget-wide v0, p1, Lcom/flyersoft/tools/BookDb$ReadStatistics;->usedTimeInDays:J

    .line 549
    iget-wide p1, p2, Lcom/flyersoft/tools/BookDb$ReadStatistics;->usedTimeInDays:J

    cmp-long v2, v0, p1

    if-nez v2, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    if-lez v2, :cond_1

    const/4 p1, -0x1

    return p1

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 545
    check-cast p1, Lcom/flyersoft/tools/BookDb$ReadStatistics;

    check-cast p2, Lcom/flyersoft/tools/BookDb$ReadStatistics;

    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/moonreaderp/PrefYearStatistics$7;->compare(Lcom/flyersoft/tools/BookDb$ReadStatistics;Lcom/flyersoft/tools/BookDb$ReadStatistics;)I

    move-result p1

    return p1
.end method
