.class public abstract Lio/opencensus/metrics/export/Distribution$Bucket;
.super Ljava/lang/Object;
.source "Distribution.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/metrics/export/Distribution;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Bucket"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 237
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(J)Lio/opencensus/metrics/export/Distribution$Bucket;
    .locals 3

    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-ltz v2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 247
    :goto_0
    const-string v1, "bucket count should be non-negative."

    invoke-static {v0, v1}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/Object;)V

    .line 248
    new-instance v0, Lio/opencensus/metrics/export/AutoValue_Distribution_Bucket;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lio/opencensus/metrics/export/AutoValue_Distribution_Bucket;-><init>(JLio/opencensus/metrics/data/Exemplar;)V

    return-object v0
.end method

.method public static create(JLio/opencensus/metrics/data/Exemplar;)Lio/opencensus/metrics/export/Distribution$Bucket;
    .locals 3

    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-ltz v2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 260
    :goto_0
    const-string v1, "bucket count should be non-negative."

    invoke-static {v0, v1}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/Object;)V

    .line 261
    const-string v0, "exemplar"

    invoke-static {p2, v0}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 262
    new-instance v0, Lio/opencensus/metrics/export/AutoValue_Distribution_Bucket;

    invoke-direct {v0, p0, p1, p2}, Lio/opencensus/metrics/export/AutoValue_Distribution_Bucket;-><init>(JLio/opencensus/metrics/data/Exemplar;)V

    return-object v0
.end method


# virtual methods
.method public abstract getCount()J
.end method

.method public abstract getExemplar()Lio/opencensus/metrics/data/Exemplar;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end method
