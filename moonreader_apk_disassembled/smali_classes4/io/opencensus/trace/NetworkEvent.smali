.class public abstract Lio/opencensus/trace/NetworkEvent;
.super Lio/opencensus/trace/BaseMessageEvent;
.source "NetworkEvent.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/opencensus/trace/NetworkEvent$Builder;,
        Lio/opencensus/trace/NetworkEvent$Type;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 199
    invoke-direct {p0}, Lio/opencensus/trace/BaseMessageEvent;-><init>()V

    return-void
.end method

.method public static builder(Lio/opencensus/trace/NetworkEvent$Type;J)Lio/opencensus/trace/NetworkEvent$Builder;
    .locals 2

    .line 68
    new-instance v0, Lio/opencensus/trace/AutoValue_NetworkEvent$Builder;

    invoke-direct {v0}, Lio/opencensus/trace/AutoValue_NetworkEvent$Builder;-><init>()V

    const-string v1, "type"

    .line 69
    invoke-static {p0, v1}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lio/opencensus/trace/NetworkEvent$Type;

    invoke-virtual {v0, p0}, Lio/opencensus/trace/AutoValue_NetworkEvent$Builder;->setType(Lio/opencensus/trace/NetworkEvent$Type;)Lio/opencensus/trace/NetworkEvent$Builder;

    move-result-object p0

    .line 70
    invoke-virtual {p0, p1, p2}, Lio/opencensus/trace/NetworkEvent$Builder;->setMessageId(J)Lio/opencensus/trace/NetworkEvent$Builder;

    move-result-object p0

    const-wide/16 p1, 0x0

    .line 73
    invoke-virtual {p0, p1, p2}, Lio/opencensus/trace/NetworkEvent$Builder;->setUncompressedMessageSize(J)Lio/opencensus/trace/NetworkEvent$Builder;

    move-result-object p0

    .line 74
    invoke-virtual {p0, p1, p2}, Lio/opencensus/trace/NetworkEvent$Builder;->setCompressedMessageSize(J)Lio/opencensus/trace/NetworkEvent$Builder;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public abstract getCompressedMessageSize()J
.end method

.method public abstract getKernelTimestamp()Lio/opencensus/common/Timestamp;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end method

.method public abstract getMessageId()J
.end method

.method public getMessageSize()J
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 129
    invoke-virtual {p0}, Lio/opencensus/trace/NetworkEvent;->getUncompressedMessageSize()J

    move-result-wide v0

    return-wide v0
.end method

.method public abstract getType()Lio/opencensus/trace/NetworkEvent$Type;
.end method

.method public abstract getUncompressedMessageSize()J
.end method
