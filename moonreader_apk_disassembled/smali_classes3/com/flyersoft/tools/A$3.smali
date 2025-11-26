.class Lcom/flyersoft/tools/A$3;
.super Ljava/lang/Object;
.source "A.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/tools/A;->sortBookmarks(Ljava/util/ArrayList;)V
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

    .line 6782
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 5

    .line 6784
    check-cast p1, Lcom/flyersoft/tools/A$Bookmark;

    .line 6785
    check-cast p2, Lcom/flyersoft/tools/A$Bookmark;

    .line 6787
    sget-boolean v0, Lcom/flyersoft/tools/A;->bookmarkSortByDate:Z

    const/4 v1, 0x1

    const/4 v2, -0x1

    if-eqz v0, :cond_1

    .line 6788
    iget-wide v3, p1, Lcom/flyersoft/tools/A$Bookmark;->time:J

    iget-wide p1, p2, Lcom/flyersoft/tools/A$Bookmark;->time:J

    cmp-long v0, v3, p1

    if-gez v0, :cond_0

    return v1

    :cond_0
    return v2

    .line 6791
    :cond_1
    iget v0, p1, Lcom/flyersoft/tools/A$Bookmark;->chapter:I

    iget v3, p2, Lcom/flyersoft/tools/A$Bookmark;->chapter:I

    if-eq v0, v3, :cond_3

    .line 6792
    iget p1, p1, Lcom/flyersoft/tools/A$Bookmark;->chapter:I

    iget p2, p2, Lcom/flyersoft/tools/A$Bookmark;->chapter:I

    if-le p1, p2, :cond_2

    return v1

    :cond_2
    return v2

    .line 6793
    :cond_3
    iget v0, p1, Lcom/flyersoft/tools/A$Bookmark;->splitIndex:I

    iget v3, p2, Lcom/flyersoft/tools/A$Bookmark;->splitIndex:I

    if-eq v0, v3, :cond_5

    .line 6794
    iget p1, p1, Lcom/flyersoft/tools/A$Bookmark;->splitIndex:I

    iget p2, p2, Lcom/flyersoft/tools/A$Bookmark;->splitIndex:I

    if-le p1, p2, :cond_4

    return v1

    :cond_4
    return v2

    .line 6796
    :cond_5
    iget-wide v3, p1, Lcom/flyersoft/tools/A$Bookmark;->position:J

    iget-wide p1, p2, Lcom/flyersoft/tools/A$Bookmark;->position:J

    cmp-long v0, v3, p1

    if-lez v0, :cond_6

    return v1

    :cond_6
    return v2
.end method
