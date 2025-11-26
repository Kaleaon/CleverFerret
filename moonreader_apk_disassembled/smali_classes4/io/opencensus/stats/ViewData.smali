.class public abstract Lio/opencensus/stats/ViewData;
.super Ljava/lang/Object;
.source "ViewData.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/opencensus/stats/ViewData$AggregationWindowData;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lio/opencensus/stats/View;Ljava/util/Map;Lio/opencensus/stats/ViewData$AggregationWindowData;Lio/opencensus/common/Timestamp;Lio/opencensus/common/Timestamp;)Lio/opencensus/stats/ViewData;
    .locals 0

    .line 58
    invoke-static {p0, p1, p2, p3, p4}, Lio/opencensus/stats/ViewData;->createInternal(Lio/opencensus/stats/View;Ljava/util/Map;Lio/opencensus/stats/ViewData$AggregationWindowData;Lio/opencensus/common/Timestamp;Lio/opencensus/common/Timestamp;)Lio/opencensus/stats/ViewData;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(ZLio/opencensus/stats/View$AggregationWindow;Lio/opencensus/stats/ViewData$AggregationWindowData;)V
    .locals 0

    .line 58
    invoke-static {p0, p1, p2}, Lio/opencensus/stats/ViewData;->throwIfWindowMismatch(ZLio/opencensus/stats/View$AggregationWindow;Lio/opencensus/stats/ViewData$AggregationWindowData;)V

    return-void
.end method

.method static synthetic access$200(ZLio/opencensus/stats/Aggregation;Lio/opencensus/stats/AggregationData;)V
    .locals 0

    .line 58
    invoke-static {p0, p1, p2}, Lio/opencensus/stats/ViewData;->throwIfAggregationMismatch(ZLio/opencensus/stats/Aggregation;Lio/opencensus/stats/AggregationData;)V

    return-void
.end method

.method private static checkAggregation(Lio/opencensus/stats/Aggregation;Lio/opencensus/stats/AggregationData;Lio/opencensus/stats/Measure;)V
    .locals 6

    .line 246
    new-instance v1, Lio/opencensus/stats/ViewData$5;

    invoke-direct {v1, p2, p1, p0}, Lio/opencensus/stats/ViewData$5;-><init>(Lio/opencensus/stats/Measure;Lio/opencensus/stats/AggregationData;Lio/opencensus/stats/Aggregation;)V

    new-instance v2, Lio/opencensus/stats/ViewData$6;

    invoke-direct {v2, p1, p0}, Lio/opencensus/stats/ViewData$6;-><init>(Lio/opencensus/stats/AggregationData;Lio/opencensus/stats/Aggregation;)V

    new-instance v3, Lio/opencensus/stats/ViewData$7;

    invoke-direct {v3, p1, p0}, Lio/opencensus/stats/ViewData$7;-><init>(Lio/opencensus/stats/AggregationData;Lio/opencensus/stats/Aggregation;)V

    new-instance v4, Lio/opencensus/stats/ViewData$8;

    invoke-direct {v4, p2, p1, p0}, Lio/opencensus/stats/ViewData$8;-><init>(Lio/opencensus/stats/Measure;Lio/opencensus/stats/AggregationData;Lio/opencensus/stats/Aggregation;)V

    new-instance v5, Lio/opencensus/stats/ViewData$9;

    invoke-direct {v5, p1, p0}, Lio/opencensus/stats/ViewData$9;-><init>(Lio/opencensus/stats/AggregationData;Lio/opencensus/stats/Aggregation;)V

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lio/opencensus/stats/Aggregation;->match(Lio/opencensus/common/Function;Lio/opencensus/common/Function;Lio/opencensus/common/Function;Lio/opencensus/common/Function;Lio/opencensus/common/Function;)Ljava/lang/Object;

    return-void
.end method

.method private static checkWindow(Lio/opencensus/stats/View$AggregationWindow;Lio/opencensus/stats/ViewData$AggregationWindowData;)V
    .locals 2

    .line 208
    new-instance v0, Lio/opencensus/stats/ViewData$3;

    invoke-direct {v0, p1}, Lio/opencensus/stats/ViewData$3;-><init>(Lio/opencensus/stats/ViewData$AggregationWindowData;)V

    new-instance v1, Lio/opencensus/stats/ViewData$4;

    invoke-direct {v1, p1}, Lio/opencensus/stats/ViewData$4;-><init>(Lio/opencensus/stats/ViewData$AggregationWindowData;)V

    .line 225
    invoke-static {}, Lio/opencensus/common/Functions;->throwAssertionError()Lio/opencensus/common/Function;

    move-result-object p1

    .line 208
    invoke-virtual {p0, v0, v1, p1}, Lio/opencensus/stats/View$AggregationWindow;->match(Lio/opencensus/common/Function;Lio/opencensus/common/Function;Lio/opencensus/common/Function;)Ljava/lang/Object;

    return-void
.end method

.method public static create(Lio/opencensus/stats/View;Ljava/util/Map;Lio/opencensus/common/Timestamp;Lio/opencensus/common/Timestamp;)Lio/opencensus/stats/ViewData;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/opencensus/stats/View;",
            "Ljava/util/Map<",
            "+",
            "Ljava/util/List<",
            "Lio/opencensus/tags/TagValue;",
            ">;+",
            "Lio/opencensus/stats/AggregationData;",
            ">;",
            "Lio/opencensus/common/Timestamp;",
            "Lio/opencensus/common/Timestamp;",
            ")",
            "Lio/opencensus/stats/ViewData;"
        }
    .end annotation

    .line 176
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 179
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 180
    invoke-virtual {p0}, Lio/opencensus/stats/View;->getAggregation()Lio/opencensus/stats/Aggregation;

    move-result-object v2

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lio/opencensus/stats/AggregationData;

    invoke-virtual {p0}, Lio/opencensus/stats/View;->getMeasure()Lio/opencensus/stats/Measure;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lio/opencensus/stats/ViewData;->checkAggregation(Lio/opencensus/stats/Aggregation;Lio/opencensus/stats/AggregationData;Lio/opencensus/stats/Measure;)V

    .line 181
    new-instance v2, Ljava/util/ArrayList;

    .line 182
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Collection;

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    .line 183
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    .line 181
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 187
    :cond_0
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    .line 188
    invoke-static {p2, p3}, Lio/opencensus/stats/ViewData$AggregationWindowData$CumulativeData;->create(Lio/opencensus/common/Timestamp;Lio/opencensus/common/Timestamp;)Lio/opencensus/stats/ViewData$AggregationWindowData$CumulativeData;

    move-result-object v0

    .line 185
    invoke-static {p0, p1, v0, p2, p3}, Lio/opencensus/stats/ViewData;->createInternal(Lio/opencensus/stats/View;Ljava/util/Map;Lio/opencensus/stats/ViewData$AggregationWindowData;Lio/opencensus/common/Timestamp;Lio/opencensus/common/Timestamp;)Lio/opencensus/stats/ViewData;

    move-result-object p0

    return-object p0
.end method

.method public static create(Lio/opencensus/stats/View;Ljava/util/Map;Lio/opencensus/stats/ViewData$AggregationWindowData;)Lio/opencensus/stats/ViewData;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/opencensus/stats/View;",
            "Ljava/util/Map<",
            "+",
            "Ljava/util/List<",
            "Lio/opencensus/tags/TagValue;",
            ">;+",
            "Lio/opencensus/stats/AggregationData;",
            ">;",
            "Lio/opencensus/stats/ViewData$AggregationWindowData;",
            ")",
            "Lio/opencensus/stats/ViewData;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 125
    invoke-virtual {p0}, Lio/opencensus/stats/View;->getWindow()Lio/opencensus/stats/View$AggregationWindow;

    move-result-object v0

    invoke-static {v0, p2}, Lio/opencensus/stats/ViewData;->checkWindow(Lio/opencensus/stats/View$AggregationWindow;Lio/opencensus/stats/ViewData$AggregationWindowData;)V

    .line 126
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 129
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 130
    invoke-virtual {p0}, Lio/opencensus/stats/View;->getAggregation()Lio/opencensus/stats/Aggregation;

    move-result-object v2

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lio/opencensus/stats/AggregationData;

    invoke-virtual {p0}, Lio/opencensus/stats/View;->getMeasure()Lio/opencensus/stats/Measure;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lio/opencensus/stats/ViewData;->checkAggregation(Lio/opencensus/stats/Aggregation;Lio/opencensus/stats/AggregationData;Lio/opencensus/stats/Measure;)V

    .line 131
    new-instance v2, Ljava/util/ArrayList;

    .line 132
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Collection;

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    .line 133
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    .line 131
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 135
    :cond_0
    new-instance p1, Lio/opencensus/stats/ViewData$1;

    invoke-direct {p1, p0, v0}, Lio/opencensus/stats/ViewData$1;-><init>(Lio/opencensus/stats/View;Ljava/util/Map;)V

    new-instance v1, Lio/opencensus/stats/ViewData$2;

    invoke-direct {v1, p0, v0}, Lio/opencensus/stats/ViewData$2;-><init>(Lio/opencensus/stats/View;Ljava/util/Map;)V

    .line 156
    invoke-static {}, Lio/opencensus/common/Functions;->throwAssertionError()Lio/opencensus/common/Function;

    move-result-object p0

    .line 135
    invoke-virtual {p2, p1, v1, p0}, Lio/opencensus/stats/ViewData$AggregationWindowData;->match(Lio/opencensus/common/Function;Lio/opencensus/common/Function;Lio/opencensus/common/Function;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lio/opencensus/stats/ViewData;

    return-object p0
.end method

.method private static createErrorMessageForAggregation(Lio/opencensus/stats/Aggregation;Lio/opencensus/stats/AggregationData;)Ljava/lang/String;
    .locals 2

    .line 341
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Aggregation and AggregationData types mismatch. Aggregation: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 343
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " AggregationData: "

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 345
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static createErrorMessageForWindow(Lio/opencensus/stats/View$AggregationWindow;Lio/opencensus/stats/ViewData$AggregationWindowData;)Ljava/lang/String;
    .locals 2

    .line 237
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "AggregationWindow and AggregationWindowData types mismatch. AggregationWindow: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 239
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " AggregationWindowData: "

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 241
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static createInternal(Lio/opencensus/stats/View;Ljava/util/Map;Lio/opencensus/stats/ViewData$AggregationWindowData;Lio/opencensus/common/Timestamp;Lio/opencensus/common/Timestamp;)Lio/opencensus/stats/ViewData;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/opencensus/stats/View;",
            "Ljava/util/Map<",
            "Ljava/util/List<",
            "Lio/opencensus/tags/TagValue;",
            ">;",
            "Lio/opencensus/stats/AggregationData;",
            ">;",
            "Lio/opencensus/stats/ViewData$AggregationWindowData;",
            "Lio/opencensus/common/Timestamp;",
            "Lio/opencensus/common/Timestamp;",
            ")",
            "Lio/opencensus/stats/ViewData;"
        }
    .end annotation

    .line 203
    new-instance v0, Lio/opencensus/stats/AutoValue_ViewData;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lio/opencensus/stats/AutoValue_ViewData;-><init>(Lio/opencensus/stats/View;Ljava/util/Map;Lio/opencensus/stats/ViewData$AggregationWindowData;Lio/opencensus/common/Timestamp;Lio/opencensus/common/Timestamp;)V

    return-object v0
.end method

.method private static throwIfAggregationMismatch(ZLio/opencensus/stats/Aggregation;Lio/opencensus/stats/AggregationData;)V
    .locals 0

    if-eqz p0, :cond_0

    return-void

    .line 334
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 335
    invoke-static {p1, p2}, Lio/opencensus/stats/ViewData;->createErrorMessageForAggregation(Lio/opencensus/stats/Aggregation;Lio/opencensus/stats/AggregationData;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static throwIfWindowMismatch(ZLio/opencensus/stats/View$AggregationWindow;Lio/opencensus/stats/ViewData$AggregationWindowData;)V
    .locals 0

    if-eqz p0, :cond_0

    return-void

    .line 231
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1, p2}, Lio/opencensus/stats/ViewData;->createErrorMessageForWindow(Lio/opencensus/stats/View$AggregationWindow;Lio/opencensus/stats/ViewData$AggregationWindowData;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public abstract getAggregationMap()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/util/List<",
            "Lio/opencensus/tags/TagValue;",
            ">;",
            "Lio/opencensus/stats/AggregationData;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getEnd()Lio/opencensus/common/Timestamp;
.end method

.method public abstract getStart()Lio/opencensus/common/Timestamp;
.end method

.method public abstract getView()Lio/opencensus/stats/View;
.end method

.method public abstract getWindowData()Lio/opencensus/stats/ViewData$AggregationWindowData;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method
