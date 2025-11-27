.class Lcom/flyersoft/tools/A$2;
.super Ljava/lang/Object;
.source "A.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/tools/A;->sortNotes(Ljava/util/ArrayList;)V
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


# instance fields
.field final synthetic val$isPdf:Z


# direct methods
.method constructor <init>(Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 6754
    iput-boolean p1, p0, Lcom/flyersoft/tools/A$2;->val$isPdf:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 7

    .line 6756
    check-cast p1, Lcom/flyersoft/tools/BookDb$NoteInfo;

    .line 6757
    check-cast p2, Lcom/flyersoft/tools/BookDb$NoteInfo;

    .line 6758
    sget-boolean v0, Lcom/flyersoft/tools/A;->bookmarkSortByDate:Z

    const/4 v1, 0x1

    const/4 v2, -0x1

    if-eqz v0, :cond_1

    .line 6759
    iget-wide v3, p1, Lcom/flyersoft/tools/BookDb$NoteInfo;->time:J

    iget-wide p1, p2, Lcom/flyersoft/tools/BookDb$NoteInfo;->time:J

    cmp-long v0, v3, p1

    if-gez v0, :cond_0

    return v1

    :cond_0
    return v2

    .line 6761
    :cond_1
    iget-boolean v0, p0, Lcom/flyersoft/tools/A$2;->val$isPdf:Z

    if-nez v0, :cond_7

    .line 6762
    iget v0, p1, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastChapter:I

    iget v3, p2, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastChapter:I

    if-eq v0, v3, :cond_3

    .line 6763
    iget p1, p1, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastChapter:I

    iget p2, p2, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastChapter:I

    if-le p1, p2, :cond_2

    return v1

    :cond_2
    return v2

    .line 6764
    :cond_3
    iget v0, p1, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastSplitIndex:I

    iget v3, p2, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastSplitIndex:I

    if-eq v0, v3, :cond_5

    .line 6765
    iget p1, p1, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastSplitIndex:I

    iget p2, p2, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastSplitIndex:I

    if-le p1, p2, :cond_4

    return v1

    :cond_4
    return v2

    .line 6767
    :cond_5
    iget-wide v3, p1, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J

    iget-wide p1, p2, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J

    cmp-long v0, v3, p1

    if-lez v0, :cond_6

    return v1

    :cond_6
    return v2

    .line 6769
    :cond_7
    iget-wide v3, p1, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J

    iget-wide v5, p2, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J

    cmp-long v0, v3, v5

    if-nez v0, :cond_9

    .line 6770
    iget p1, p1, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastChapter:I

    iget p2, p2, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastChapter:I

    if-le p1, p2, :cond_8

    return v1

    :cond_8
    return v2

    .line 6771
    :cond_9
    iget-wide v3, p1, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J

    iget-wide p1, p2, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J

    cmp-long v0, v3, p1

    if-lez v0, :cond_a

    return v1

    :cond_a
    return v2
.end method
