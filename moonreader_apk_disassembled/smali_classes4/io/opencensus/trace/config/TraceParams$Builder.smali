.class public abstract Lio/opencensus/trace/config/TraceParams$Builder;
.super Ljava/lang/Object;
.source "TraceParams.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/trace/config/TraceParams;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Builder"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 131
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method abstract autoBuild()Lio/opencensus/trace/config/TraceParams;
.end method

.method public build()Lio/opencensus/trace/config/TraceParams;
    .locals 5

    .line 210
    invoke-virtual {p0}, Lio/opencensus/trace/config/TraceParams$Builder;->autoBuild()Lio/opencensus/trace/config/TraceParams;

    move-result-object v0

    .line 211
    invoke-virtual {v0}, Lio/opencensus/trace/config/TraceParams;->getMaxNumberOfAttributes()I

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-lez v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    const-string v4, "maxNumberOfAttributes"

    invoke-static {v1, v4}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/Object;)V

    .line 212
    invoke-virtual {v0}, Lio/opencensus/trace/config/TraceParams;->getMaxNumberOfAnnotations()I

    move-result v1

    if-lez v1, :cond_1

    const/4 v1, 0x1

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    :goto_1
    const-string v4, "maxNumberOfAnnotations"

    invoke-static {v1, v4}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/Object;)V

    .line 214
    invoke-virtual {v0}, Lio/opencensus/trace/config/TraceParams;->getMaxNumberOfMessageEvents()I

    move-result v1

    if-lez v1, :cond_2

    const/4 v1, 0x1

    goto :goto_2

    :cond_2
    const/4 v1, 0x0

    :goto_2
    const-string v4, "maxNumberOfMessageEvents"

    .line 213
    invoke-static {v1, v4}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/Object;)V

    .line 215
    invoke-virtual {v0}, Lio/opencensus/trace/config/TraceParams;->getMaxNumberOfLinks()I

    move-result v1

    if-lez v1, :cond_3

    goto :goto_3

    :cond_3
    const/4 v2, 0x0

    :goto_3
    const-string v1, "maxNumberOfLinks"

    invoke-static {v2, v1}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/Object;)V

    return-object v0
.end method

.method public abstract setMaxNumberOfAnnotations(I)Lio/opencensus/trace/config/TraceParams$Builder;
.end method

.method public abstract setMaxNumberOfAttributes(I)Lio/opencensus/trace/config/TraceParams$Builder;
.end method

.method public abstract setMaxNumberOfLinks(I)Lio/opencensus/trace/config/TraceParams$Builder;
.end method

.method public abstract setMaxNumberOfMessageEvents(I)Lio/opencensus/trace/config/TraceParams$Builder;
.end method

.method public setMaxNumberOfNetworkEvents(I)Lio/opencensus/trace/config/TraceParams$Builder;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 186
    invoke-virtual {p0, p1}, Lio/opencensus/trace/config/TraceParams$Builder;->setMaxNumberOfMessageEvents(I)Lio/opencensus/trace/config/TraceParams$Builder;

    move-result-object p1

    return-object p1
.end method

.method public abstract setSampler(Lio/opencensus/trace/Sampler;)Lio/opencensus/trace/config/TraceParams$Builder;
.end method
