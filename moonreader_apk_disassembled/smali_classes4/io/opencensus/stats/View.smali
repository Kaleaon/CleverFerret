.class public abstract Lio/opencensus/stats/View;
.super Ljava/lang/Object;
.source "View.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/opencensus/stats/View$AggregationWindow;,
        Lio/opencensus/stats/View$Name;
    }
.end annotation


# static fields
.field static final NAME_MAX_LENGTH:I = 0xff

.field private static final TAG_KEY_COMPARATOR:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Lio/opencensus/tags/TagKey;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 47
    new-instance v0, Lio/opencensus/stats/View$1;

    invoke-direct {v0}, Lio/opencensus/stats/View$1;-><init>()V

    sput-object v0, Lio/opencensus/stats/View;->TAG_KEY_COMPARATOR:Ljava/util/Comparator;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Lio/opencensus/stats/View$Name;Ljava/lang/String;Lio/opencensus/stats/Measure;Lio/opencensus/stats/Aggregation;Ljava/util/List;)Lio/opencensus/stats/View;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/opencensus/stats/View$Name;",
            "Ljava/lang/String;",
            "Lio/opencensus/stats/Measure;",
            "Lio/opencensus/stats/Aggregation;",
            "Ljava/util/List<",
            "Lio/opencensus/tags/TagKey;",
            ">;)",
            "Lio/opencensus/stats/View;"
        }
    .end annotation

    .line 154
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0, p4}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 155
    invoke-virtual {v0}, Ljava/util/HashSet;->size()I

    move-result v0

    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "Columns have duplicate."

    .line 154
    invoke-static {v0, v1}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/Object;)V

    .line 157
    invoke-static {}, Lio/opencensus/stats/View$AggregationWindow$Cumulative;->create()Lio/opencensus/stats/View$AggregationWindow$Cumulative;

    move-result-object v7

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    .line 156
    invoke-static/range {v2 .. v7}, Lio/opencensus/stats/View;->create(Lio/opencensus/stats/View$Name;Ljava/lang/String;Lio/opencensus/stats/Measure;Lio/opencensus/stats/Aggregation;Ljava/util/List;Lio/opencensus/stats/View$AggregationWindow;)Lio/opencensus/stats/View;

    move-result-object p0

    return-object p0
.end method

.method public static create(Lio/opencensus/stats/View$Name;Ljava/lang/String;Lio/opencensus/stats/Measure;Lio/opencensus/stats/Aggregation;Ljava/util/List;Lio/opencensus/stats/View$AggregationWindow;)Lio/opencensus/stats/View;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/opencensus/stats/View$Name;",
            "Ljava/lang/String;",
            "Lio/opencensus/stats/Measure;",
            "Lio/opencensus/stats/Aggregation;",
            "Ljava/util/List<",
            "Lio/opencensus/tags/TagKey;",
            ">;",
            "Lio/opencensus/stats/View$AggregationWindow;",
            ")",
            "Lio/opencensus/stats/View;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 127
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0, p4}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 128
    invoke-virtual {v0}, Ljava/util/HashSet;->size()I

    move-result v0

    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "Columns have duplicate."

    .line 127
    invoke-static {v0, v1}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/Object;)V

    .line 130
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 131
    sget-object p4, Lio/opencensus/stats/View;->TAG_KEY_COMPARATOR:Ljava/util/Comparator;

    invoke-static {v0, p4}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 132
    new-instance v1, Lio/opencensus/stats/AutoValue_View;

    .line 133
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v6

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v7, p5

    invoke-direct/range {v1 .. v7}, Lio/opencensus/stats/AutoValue_View;-><init>(Lio/opencensus/stats/View$Name;Ljava/lang/String;Lio/opencensus/stats/Measure;Lio/opencensus/stats/Aggregation;Ljava/util/List;Lio/opencensus/stats/View$AggregationWindow;)V

    return-object v1
.end method


# virtual methods
.method public abstract getAggregation()Lio/opencensus/stats/Aggregation;
.end method

.method public abstract getColumns()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lio/opencensus/tags/TagKey;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getDescription()Ljava/lang/String;
.end method

.method public abstract getMeasure()Lio/opencensus/stats/Measure;
.end method

.method public abstract getName()Lio/opencensus/stats/View$Name;
.end method

.method public abstract getWindow()Lio/opencensus/stats/View$AggregationWindow;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method
