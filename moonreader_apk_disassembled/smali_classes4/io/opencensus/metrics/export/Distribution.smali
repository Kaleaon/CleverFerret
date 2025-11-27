.class public abstract Lio/opencensus/metrics/export/Distribution;
.super Ljava/lang/Object;
.source "Distribution.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/opencensus/metrics/export/Distribution$Bucket;,
        Lio/opencensus/metrics/export/Distribution$BucketOptions;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(JDDLio/opencensus/metrics/export/Distribution$BucketOptions;Ljava/util/List;)Lio/opencensus/metrics/export/Distribution;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JDD",
            "Lio/opencensus/metrics/export/Distribution$BucketOptions;",
            "Ljava/util/List<",
            "Lio/opencensus/metrics/export/Distribution$Bucket;",
            ">;)",
            "Lio/opencensus/metrics/export/Distribution;"
        }
    .end annotation

    const-wide/16 v0, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    cmp-long v4, p0, v0

    if-ltz v4, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 60
    :goto_0
    const-string v1, "count should be non-negative."

    invoke-static {v0, v1}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/Object;)V

    const-wide/16 v0, 0x0

    cmpl-double v5, p4, v0

    if-ltz v5, :cond_1

    const/4 v6, 0x1

    goto :goto_1

    :cond_1
    const/4 v6, 0x0

    .line 61
    :goto_1
    const-string v7, "sum of squared deviations should be non-negative."

    invoke-static {v6, v7}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/Object;)V

    if-nez v4, :cond_4

    cmpl-double v4, p2, v0

    if-nez v4, :cond_2

    const/4 v0, 0x1

    goto :goto_2

    :cond_2
    const/4 v0, 0x0

    .line 64
    :goto_2
    const-string v1, "sum should be 0 if count is 0."

    invoke-static {v0, v1}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/Object;)V

    if-nez v5, :cond_3

    goto :goto_3

    :cond_3
    const/4 v2, 0x0

    .line 65
    :goto_3
    const-string v0, "sum of squared deviations should be 0 if count is 0."

    invoke-static {v2, v0}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/Object;)V

    .line 68
    :cond_4
    const-string v0, "bucketOptions"

    move-object/from16 v8, p6

    invoke-static {v8, v0}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    new-instance v0, Ljava/util/ArrayList;

    const-string v1, "buckets"

    move-object/from16 v2, p7

    .line 70
    invoke-static {v2, v1}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Collection;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v9

    .line 71
    const-string v0, "bucket"

    invoke-static {v9, v0}, Lio/opencensus/internal/Utils;->checkListElementNotNull(Ljava/util/List;Ljava/lang/Object;)V

    .line 72
    new-instance v1, Lio/opencensus/metrics/export/AutoValue_Distribution;

    move-wide v2, p0

    move-wide v4, p2

    move-wide v6, p4

    invoke-direct/range {v1 .. v9}, Lio/opencensus/metrics/export/AutoValue_Distribution;-><init>(JDDLio/opencensus/metrics/export/Distribution$BucketOptions;Ljava/util/List;)V

    return-object v1
.end method


# virtual methods
.method public abstract getBucketOptions()Lio/opencensus/metrics/export/Distribution$BucketOptions;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end method

.method public abstract getBuckets()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lio/opencensus/metrics/export/Distribution$Bucket;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getCount()J
.end method

.method public abstract getSum()D
.end method

.method public abstract getSumOfSquaredDeviations()D
.end method
