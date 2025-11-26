.class public abstract Lio/opencensus/trace/export/SampledSpanStore$Summary;
.super Ljava/lang/Object;
.source "SampledSpanStore.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/trace/export/SampledSpanStore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Summary"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 151
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Ljava/util/Map;)Lio/opencensus/trace/export/SampledSpanStore$Summary;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lio/opencensus/trace/export/SampledSpanStore$PerSpanNameSummary;",
            ">;)",
            "Lio/opencensus/trace/export/SampledSpanStore$Summary;"
        }
    .end annotation

    .line 162
    new-instance v0, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_Summary;

    new-instance v1, Ljava/util/HashMap;

    const-string v2, "perSpanNameSummary"

    .line 165
    invoke-static {p0, v2}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    invoke-direct {v1, p0}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 163
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p0

    invoke-direct {v0, p0}, Lio/opencensus/trace/export/AutoValue_SampledSpanStore_Summary;-><init>(Ljava/util/Map;)V

    return-object v0
.end method


# virtual methods
.method public abstract getPerSpanNameSummary()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lio/opencensus/trace/export/SampledSpanStore$PerSpanNameSummary;",
            ">;"
        }
    .end annotation
.end method
