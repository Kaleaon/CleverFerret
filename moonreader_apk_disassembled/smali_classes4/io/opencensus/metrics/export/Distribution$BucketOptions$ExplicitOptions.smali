.class public abstract Lio/opencensus/metrics/export/Distribution$BucketOptions$ExplicitOptions;
.super Lio/opencensus/metrics/export/Distribution$BucketOptions;
.source "Distribution.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/metrics/export/Distribution$BucketOptions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "ExplicitOptions"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 181
    invoke-direct {p0, v0}, Lio/opencensus/metrics/export/Distribution$BucketOptions;-><init>(Lio/opencensus/metrics/export/Distribution$1;)V

    return-void
.end method

.method static synthetic access$000(Ljava/util/List;)Lio/opencensus/metrics/export/Distribution$BucketOptions$ExplicitOptions;
    .locals 0

    .line 179
    invoke-static {p0}, Lio/opencensus/metrics/export/Distribution$BucketOptions$ExplicitOptions;->create(Ljava/util/List;)Lio/opencensus/metrics/export/Distribution$BucketOptions$ExplicitOptions;

    move-result-object p0

    return-object p0
.end method

.method private static checkBucketBoundsAreSorted(Ljava/util/List;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;)V"
        }
    .end annotation

    .line 207
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_2

    const/4 v0, 0x0

    .line 208
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    const-string v3, "bucketBoundary"

    invoke-static {v2, v3}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Double;

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmpl-double v2, v4, v6

    if-lez v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 209
    :goto_0
    const-string v6, "bucket boundary should be > 0"

    invoke-static {v2, v6}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/Object;)V

    const/4 v2, 0x1

    .line 210
    :goto_1
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v6

    if-ge v2, v6, :cond_2

    .line 211
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6, v3}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Double;

    invoke-virtual {v6}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    cmpg-double v8, v4, v6

    if-gez v8, :cond_1

    const/4 v4, 0x1

    goto :goto_2

    :cond_1
    const/4 v4, 0x0

    .line 212
    :goto_2
    const-string v5, "bucket boundaries not sorted."

    invoke-static {v4, v5}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/Object;)V

    add-int/lit8 v2, v2, 0x1

    move-wide v4, v6

    goto :goto_1

    :cond_2
    return-void
.end method

.method private static create(Ljava/util/List;)Lio/opencensus/metrics/export/Distribution$BucketOptions$ExplicitOptions;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;)",
            "Lio/opencensus/metrics/export/Distribution$BucketOptions$ExplicitOptions;"
        }
    .end annotation

    .line 199
    const-string v0, "bucketBoundaries"

    invoke-static {p0, v0}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 200
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 201
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    .line 202
    invoke-static {p0}, Lio/opencensus/metrics/export/Distribution$BucketOptions$ExplicitOptions;->checkBucketBoundsAreSorted(Ljava/util/List;)V

    .line 203
    new-instance v0, Lio/opencensus/metrics/export/AutoValue_Distribution_BucketOptions_ExplicitOptions;

    invoke-direct {v0, p0}, Lio/opencensus/metrics/export/AutoValue_Distribution_BucketOptions_ExplicitOptions;-><init>(Ljava/util/List;)V

    return-object v0
.end method


# virtual methods
.method public abstract getBucketBoundaries()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation
.end method

.method public final match(Lio/opencensus/common/Function;Lio/opencensus/common/Function;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/opencensus/common/Function<",
            "-",
            "Lio/opencensus/metrics/export/Distribution$BucketOptions$ExplicitOptions;",
            "TT;>;",
            "Lio/opencensus/common/Function<",
            "-",
            "Lio/opencensus/metrics/export/Distribution$BucketOptions;",
            "TT;>;)TT;"
        }
    .end annotation

    .line 187
    invoke-interface {p1, p0}, Lio/opencensus/common/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
