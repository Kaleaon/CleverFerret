.class public final Lio/opencensus/metrics/Metrics;
.super Ljava/lang/Object;
.source "Metrics.java"


# static fields
.field private static final logger:Ljava/util/logging/Logger;

.field private static final metricsComponent:Lio/opencensus/metrics/MetricsComponent;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 34
    const-class v0, Lio/opencensus/metrics/Metrics;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lio/opencensus/metrics/Metrics;->logger:Ljava/util/logging/Logger;

    .line 35
    const-class v0, Lio/opencensus/metrics/MetricsComponent;

    .line 36
    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-static {v0}, Lio/opencensus/metrics/Metrics;->loadMetricsComponent(Ljava/lang/ClassLoader;)Lio/opencensus/metrics/MetricsComponent;

    move-result-object v0

    sput-object v0, Lio/opencensus/metrics/Metrics;->metricsComponent:Lio/opencensus/metrics/MetricsComponent;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getExportComponent()Lio/opencensus/metrics/export/ExportComponent;
    .locals 1

    .line 45
    sget-object v0, Lio/opencensus/metrics/Metrics;->metricsComponent:Lio/opencensus/metrics/MetricsComponent;

    invoke-virtual {v0}, Lio/opencensus/metrics/MetricsComponent;->getExportComponent()Lio/opencensus/metrics/export/ExportComponent;

    move-result-object v0

    return-object v0
.end method

.method public static getMetricRegistry()Lio/opencensus/metrics/MetricRegistry;
    .locals 1

    .line 58
    sget-object v0, Lio/opencensus/metrics/Metrics;->metricsComponent:Lio/opencensus/metrics/MetricsComponent;

    invoke-virtual {v0}, Lio/opencensus/metrics/MetricsComponent;->getMetricRegistry()Lio/opencensus/metrics/MetricRegistry;

    move-result-object v0

    return-object v0
.end method

.method static loadMetricsComponent(Ljava/lang/ClassLoader;)Lio/opencensus/metrics/MetricsComponent;
    .locals 5
    .param p0    # Ljava/lang/ClassLoader;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x1

    .line 66
    :try_start_0
    const-string v1, "io.opencensus.impl.metrics.MetricsComponentImpl"

    .line 67
    invoke-static {v1, v0, p0}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lio/opencensus/metrics/MetricsComponent;

    .line 66
    invoke-static {v1, v2}, Lio/opencensus/internal/Provider;->createInstance(Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/opencensus/metrics/MetricsComponent;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    move-exception v1

    .line 71
    sget-object v2, Lio/opencensus/metrics/Metrics;->logger:Ljava/util/logging/Logger;

    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v4, "Couldn\'t load full implementation for MetricsComponent, now trying to load lite implementation."

    invoke-virtual {v2, v3, v4, v1}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 79
    :try_start_1
    const-string v1, "io.opencensus.impllite.metrics.MetricsComponentImplLite"

    .line 80
    invoke-static {v1, v0, p0}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object p0

    const-class v0, Lio/opencensus/metrics/MetricsComponent;

    .line 79
    invoke-static {p0, v0}, Lio/opencensus/internal/Provider;->createInstance(Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lio/opencensus/metrics/MetricsComponent;
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    return-object p0

    :catch_1
    move-exception p0

    .line 86
    sget-object v0, Lio/opencensus/metrics/Metrics;->logger:Ljava/util/logging/Logger;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v2, "Couldn\'t load lite implementation for MetricsComponent, now using default implementation for MetricsComponent."

    invoke-virtual {v0, v1, v2, p0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 92
    invoke-static {}, Lio/opencensus/metrics/MetricsComponent;->newNoopMetricsComponent()Lio/opencensus/metrics/MetricsComponent;

    move-result-object p0

    return-object p0
.end method
