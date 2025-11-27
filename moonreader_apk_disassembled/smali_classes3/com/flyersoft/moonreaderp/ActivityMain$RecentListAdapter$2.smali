.class Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter$2;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->sortListByHours(Ljava/util/ArrayList;)V
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
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 11009
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/flyersoft/tools/BookDb$ReadStatistics;Lcom/flyersoft/tools/BookDb$ReadStatistics;)I
    .locals 8

    .line 11012
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->recentSortBy:I

    const/4 v1, -0x1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v0, v3, :cond_2

    .line 11013
    iget-wide v4, p1, Lcom/flyersoft/tools/BookDb$ReadStatistics;->usedTime:J

    iget-wide v6, p2, Lcom/flyersoft/tools/BookDb$ReadStatistics;->usedTime:J

    cmp-long v0, v4, v6

    if-nez v0, :cond_0

    return v2

    :cond_0
    iget-wide v4, p1, Lcom/flyersoft/tools/BookDb$ReadStatistics;->usedTime:J

    iget-wide p1, p2, Lcom/flyersoft/tools/BookDb$ReadStatistics;->usedTime:J

    cmp-long v0, v4, p1

    if-lez v0, :cond_1

    return v1

    :cond_1
    return v3

    .line 11015
    :cond_2
    iget v0, p1, Lcom/flyersoft/tools/BookDb$ReadStatistics;->speed:F

    iget v4, p2, Lcom/flyersoft/tools/BookDb$ReadStatistics;->speed:F

    cmpl-float v0, v0, v4

    if-nez v0, :cond_3

    return v2

    :cond_3
    iget p1, p1, Lcom/flyersoft/tools/BookDb$ReadStatistics;->speed:F

    iget p2, p2, Lcom/flyersoft/tools/BookDb$ReadStatistics;->speed:F

    cmpl-float p1, p1, p2

    if-lez p1, :cond_4

    return v1

    :cond_4
    return v3
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

    .line 11009
    check-cast p1, Lcom/flyersoft/tools/BookDb$ReadStatistics;

    check-cast p2, Lcom/flyersoft/tools/BookDb$ReadStatistics;

    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain$RecentListAdapter$2;->compare(Lcom/flyersoft/tools/BookDb$ReadStatistics;Lcom/flyersoft/tools/BookDb$ReadStatistics;)I

    move-result p1

    return p1
.end method
