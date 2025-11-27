.class public abstract Lio/opencensus/trace/export/SpanData$TimedEvent;
.super Ljava/lang/Object;
.source "SpanData.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/trace/export/SpanData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "TimedEvent"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 344
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Lio/opencensus/common/Timestamp;Ljava/lang/Object;)Lio/opencensus/trace/export/SpanData$TimedEvent;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/opencensus/common/Timestamp;",
            "TT;)",
            "Lio/opencensus/trace/export/SpanData$TimedEvent<",
            "TT;>;"
        }
    .end annotation

    .line 324
    new-instance v0, Lio/opencensus/trace/export/AutoValue_SpanData_TimedEvent;

    invoke-direct {v0, p0, p1}, Lio/opencensus/trace/export/AutoValue_SpanData_TimedEvent;-><init>(Lio/opencensus/common/Timestamp;Ljava/lang/Object;)V

    return-object v0
.end method


# virtual methods
.method public abstract getEvent()Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation
.end method

.method public abstract getTimestamp()Lio/opencensus/common/Timestamp;
.end method
