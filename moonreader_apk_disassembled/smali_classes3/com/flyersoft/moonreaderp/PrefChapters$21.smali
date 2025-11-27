.class Lcom/flyersoft/moonreaderp/PrefChapters$21;
.super Ljava/lang/Object;
.source "PrefChapters.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefChapters;->sortAnnotsByPos(Ljava/util/ArrayList;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;",
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

    .line 1981
    iput-boolean p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$21;->val$isPdf:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;)I
    .locals 8

    .line 1984
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$21;->val$isPdf:Z

    const/4 v1, 0x0

    const/4 v2, -0x1

    const/4 v3, 0x1

    if-eqz v0, :cond_4

    .line 1985
    iget-wide v4, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->position:J

    iget-wide v6, p2, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->position:J

    cmp-long v0, v4, v6

    if-nez v0, :cond_2

    .line 1986
    iget v0, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->chapter:I

    iget v4, p2, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->chapter:I

    if-ge v0, v4, :cond_0

    return v2

    :cond_0
    iget p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->chapter:I

    iget p2, p2, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->chapter:I

    if-ne p1, p2, :cond_1

    return v1

    :cond_1
    return v3

    .line 1988
    :cond_2
    iget-wide v0, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->position:J

    iget-wide p1, p2, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->position:J

    cmp-long v4, v0, p1

    if-gez v4, :cond_3

    return v2

    :cond_3
    return v3

    .line 1990
    :cond_4
    iget v0, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->chapter:I

    iget v4, p2, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->chapter:I

    if-ne v0, v4, :cond_9

    .line 1991
    iget v0, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->splitIndex:I

    iget v4, p2, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->splitIndex:I

    if-ne v0, v4, :cond_7

    .line 1992
    iget-wide v4, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->position:J

    iget-wide v6, p2, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->position:J

    cmp-long v0, v4, v6

    if-gez v0, :cond_5

    return v2

    :cond_5
    iget-wide v4, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->position:J

    iget-wide p1, p2, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->position:J

    cmp-long v0, v4, p1

    if-nez v0, :cond_6

    return v1

    :cond_6
    return v3

    .line 1994
    :cond_7
    iget p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->splitIndex:I

    iget p2, p2, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->splitIndex:I

    if-ge p1, p2, :cond_8

    return v2

    :cond_8
    return v3

    .line 1996
    :cond_9
    iget p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->chapter:I

    iget p2, p2, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->chapter:I

    if-ge p1, p2, :cond_a

    return v2

    :cond_a
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

    .line 1981
    check-cast p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    check-cast p2, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/moonreaderp/PrefChapters$21;->compare(Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;)I

    move-result p1

    return p1
.end method
