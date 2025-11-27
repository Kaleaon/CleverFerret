.class final Lio/opencensus/trace/AutoValue_MessageEvent$Builder;
.super Lio/opencensus/trace/MessageEvent$Builder;
.source "AutoValue_MessageEvent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/trace/AutoValue_MessageEvent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Builder"
.end annotation


# instance fields
.field private compressedMessageSize:Ljava/lang/Long;

.field private messageId:Ljava/lang/Long;

.field private type:Lio/opencensus/trace/MessageEvent$Type;

.field private uncompressedMessageSize:Ljava/lang/Long;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 89
    invoke-direct {p0}, Lio/opencensus/trace/MessageEvent$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lio/opencensus/trace/MessageEvent;
    .locals 11

    .line 117
    iget-object v0, p0, Lio/opencensus/trace/AutoValue_MessageEvent$Builder;->type:Lio/opencensus/trace/MessageEvent$Type;

    if-nez v0, :cond_0

    .line 118
    const-string v0, " type"

    goto :goto_0

    .line 117
    :cond_0
    const-string v0, ""

    .line 120
    :goto_0
    iget-object v1, p0, Lio/opencensus/trace/AutoValue_MessageEvent$Builder;->messageId:Ljava/lang/Long;

    if-nez v1, :cond_1

    .line 121
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " messageId"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 123
    :cond_1
    iget-object v1, p0, Lio/opencensus/trace/AutoValue_MessageEvent$Builder;->uncompressedMessageSize:Ljava/lang/Long;

    if-nez v1, :cond_2

    .line 124
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " uncompressedMessageSize"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 126
    :cond_2
    iget-object v1, p0, Lio/opencensus/trace/AutoValue_MessageEvent$Builder;->compressedMessageSize:Ljava/lang/Long;

    if-nez v1, :cond_3

    .line 127
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " compressedMessageSize"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 129
    :cond_3
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 132
    new-instance v2, Lio/opencensus/trace/AutoValue_MessageEvent;

    iget-object v3, p0, Lio/opencensus/trace/AutoValue_MessageEvent$Builder;->type:Lio/opencensus/trace/MessageEvent$Type;

    iget-object v0, p0, Lio/opencensus/trace/AutoValue_MessageEvent$Builder;->messageId:Ljava/lang/Long;

    .line 134
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    iget-object v0, p0, Lio/opencensus/trace/AutoValue_MessageEvent$Builder;->uncompressedMessageSize:Ljava/lang/Long;

    .line 135
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    iget-object v0, p0, Lio/opencensus/trace/AutoValue_MessageEvent$Builder;->compressedMessageSize:Ljava/lang/Long;

    .line 136
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    const/4 v10, 0x0

    invoke-direct/range {v2 .. v10}, Lio/opencensus/trace/AutoValue_MessageEvent;-><init>(Lio/opencensus/trace/MessageEvent$Type;JJJLio/opencensus/trace/AutoValue_MessageEvent$1;)V

    return-object v2

    .line 130
    :cond_4
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Missing required properties:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public setCompressedMessageSize(J)Lio/opencensus/trace/MessageEvent$Builder;
    .locals 0

    .line 111
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    iput-object p1, p0, Lio/opencensus/trace/AutoValue_MessageEvent$Builder;->compressedMessageSize:Ljava/lang/Long;

    return-object p0
.end method

.method setMessageId(J)Lio/opencensus/trace/MessageEvent$Builder;
    .locals 0

    .line 101
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    iput-object p1, p0, Lio/opencensus/trace/AutoValue_MessageEvent$Builder;->messageId:Ljava/lang/Long;

    return-object p0
.end method

.method setType(Lio/opencensus/trace/MessageEvent$Type;)Lio/opencensus/trace/MessageEvent$Builder;
    .locals 1

    if-eqz p1, :cond_0

    .line 96
    iput-object p1, p0, Lio/opencensus/trace/AutoValue_MessageEvent$Builder;->type:Lio/opencensus/trace/MessageEvent$Type;

    return-object p0

    .line 94
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "Null type"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setUncompressedMessageSize(J)Lio/opencensus/trace/MessageEvent$Builder;
    .locals 0

    .line 106
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    iput-object p1, p0, Lio/opencensus/trace/AutoValue_MessageEvent$Builder;->uncompressedMessageSize:Ljava/lang/Long;

    return-object p0
.end method
