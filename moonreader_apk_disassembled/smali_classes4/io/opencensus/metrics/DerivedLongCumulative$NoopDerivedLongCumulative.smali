.class final Lio/opencensus/metrics/DerivedLongCumulative$NoopDerivedLongCumulative;
.super Lio/opencensus/metrics/DerivedLongCumulative;
.source "DerivedLongCumulative.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/metrics/DerivedLongCumulative;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NoopDerivedLongCumulative"
.end annotation


# instance fields
.field private final labelKeysSize:I


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lio/opencensus/metrics/LabelKey;",
            ">;)V"
        }
    .end annotation

    .line 123
    invoke-direct {p0}, Lio/opencensus/metrics/DerivedLongCumulative;-><init>()V

    .line 124
    const-string v0, "name"

    invoke-static {p1, v0}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    const-string p1, "description"

    invoke-static {p2, p1}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    const-string p1, "unit"

    invoke-static {p3, p1}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    const-string p1, "labelKeys"

    invoke-static {p4, p1}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    const-string p2, "labelKey"

    invoke-static {p1, p2}, Lio/opencensus/internal/Utils;->checkListElementNotNull(Ljava/util/List;Ljava/lang/Object;)V

    .line 128
    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result p1

    iput p1, p0, Lio/opencensus/metrics/DerivedLongCumulative$NoopDerivedLongCumulative;->labelKeysSize:I

    return-void
.end method

.method static create(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Lio/opencensus/metrics/DerivedLongCumulative$NoopDerivedLongCumulative;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lio/opencensus/metrics/LabelKey;",
            ">;)",
            "Lio/opencensus/metrics/DerivedLongCumulative$NoopDerivedLongCumulative;"
        }
    .end annotation

    .line 118
    new-instance v0, Lio/opencensus/metrics/DerivedLongCumulative$NoopDerivedLongCumulative;

    invoke-direct {v0, p0, p1, p2, p3}, Lio/opencensus/metrics/DerivedLongCumulative$NoopDerivedLongCumulative;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    return-object v0
.end method


# virtual methods
.method public clear()V
    .locals 0

    return-void
.end method

.method public createTimeSeries(Ljava/util/List;Ljava/lang/Object;Lio/opencensus/common/ToLongFunction;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "Lio/opencensus/metrics/LabelValue;",
            ">;TT;",
            "Lio/opencensus/common/ToLongFunction<",
            "TT;>;)V"
        }
    .end annotation

    .line 136
    const-string p2, "labelValues"

    invoke-static {p1, p2}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/List;

    const-string v0, "labelValue"

    invoke-static {p2, v0}, Lio/opencensus/internal/Utils;->checkListElementNotNull(Ljava/util/List;Ljava/lang/Object;)V

    .line 137
    iget p2, p0, Lio/opencensus/metrics/DerivedLongCumulative$NoopDerivedLongCumulative;->labelKeysSize:I

    .line 138
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    if-ne p2, p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    const-string p2, "Label Keys and Label Values don\'t have same size."

    .line 137
    invoke-static {p1, p2}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/Object;)V

    .line 139
    const-string p1, "function"

    invoke-static {p3, p1}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public removeTimeSeries(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lio/opencensus/metrics/LabelValue;",
            ">;)V"
        }
    .end annotation

    .line 144
    const-string v0, "labelValues"

    invoke-static {p1, v0}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
