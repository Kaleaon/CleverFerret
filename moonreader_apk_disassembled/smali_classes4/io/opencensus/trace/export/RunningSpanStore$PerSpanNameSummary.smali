.class public abstract Lio/opencensus/trace/export/RunningSpanStore$PerSpanNameSummary;
.super Ljava/lang/Object;
.source "RunningSpanStore.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/trace/export/RunningSpanStore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "PerSpanNameSummary"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 114
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(I)Lio/opencensus/trace/export/RunningSpanStore$PerSpanNameSummary;
    .locals 2

    if-ltz p0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 125
    :goto_0
    const-string v1, "Negative numRunningSpans."

    invoke-static {v0, v1}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/Object;)V

    .line 126
    new-instance v0, Lio/opencensus/trace/export/AutoValue_RunningSpanStore_PerSpanNameSummary;

    invoke-direct {v0, p0}, Lio/opencensus/trace/export/AutoValue_RunningSpanStore_PerSpanNameSummary;-><init>(I)V

    return-object v0
.end method


# virtual methods
.method public abstract getNumRunningSpans()I
.end method
