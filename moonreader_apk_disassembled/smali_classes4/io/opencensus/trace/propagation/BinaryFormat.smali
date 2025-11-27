.class public abstract Lio/opencensus/trace/propagation/BinaryFormat;
.super Ljava/lang/Object;
.source "BinaryFormat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/opencensus/trace/propagation/BinaryFormat$NoopBinaryFormat;
    }
.end annotation


# static fields
.field static final NOOP_BINARY_FORMAT:Lio/opencensus/trace/propagation/BinaryFormat$NoopBinaryFormat;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 66
    new-instance v0, Lio/opencensus/trace/propagation/BinaryFormat$NoopBinaryFormat;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lio/opencensus/trace/propagation/BinaryFormat$NoopBinaryFormat;-><init>(Lio/opencensus/trace/propagation/BinaryFormat$1;)V

    sput-object v0, Lio/opencensus/trace/propagation/BinaryFormat;->NOOP_BINARY_FORMAT:Lio/opencensus/trace/propagation/BinaryFormat$NoopBinaryFormat;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static getNoopBinaryFormat()Lio/opencensus/trace/propagation/BinaryFormat;
    .locals 1

    .line 138
    sget-object v0, Lio/opencensus/trace/propagation/BinaryFormat;->NOOP_BINARY_FORMAT:Lio/opencensus/trace/propagation/BinaryFormat$NoopBinaryFormat;

    return-object v0
.end method


# virtual methods
.method public fromBinaryValue([B)Lio/opencensus/trace/SpanContext;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 108
    :try_start_0
    invoke-virtual {p0, p1}, Lio/opencensus/trace/propagation/BinaryFormat;->fromByteArray([B)Lio/opencensus/trace/SpanContext;

    move-result-object p1
    :try_end_0
    .catch Lio/opencensus/trace/propagation/SpanContextParseException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 110
    new-instance v0, Ljava/text/ParseException;

    invoke-virtual {p1}, Lio/opencensus/trace/propagation/SpanContextParseException;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method public fromByteArray([B)Lio/opencensus/trace/SpanContext;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lio/opencensus/trace/propagation/SpanContextParseException;
        }
    .end annotation

    .line 126
    :try_start_0
    invoke-virtual {p0, p1}, Lio/opencensus/trace/propagation/BinaryFormat;->fromBinaryValue([B)Lio/opencensus/trace/SpanContext;

    move-result-object p1
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 128
    new-instance v0, Lio/opencensus/trace/propagation/SpanContextParseException;

    const-string v1, "Error while parsing."

    invoke-direct {v0, v1, p1}, Lio/opencensus/trace/propagation/SpanContextParseException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method public toBinaryValue(Lio/opencensus/trace/SpanContext;)[B
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 79
    invoke-virtual {p0, p1}, Lio/opencensus/trace/propagation/BinaryFormat;->toByteArray(Lio/opencensus/trace/SpanContext;)[B

    move-result-object p1

    return-object p1
.end method

.method public toByteArray(Lio/opencensus/trace/SpanContext;)[B
    .locals 0

    .line 92
    invoke-virtual {p0, p1}, Lio/opencensus/trace/propagation/BinaryFormat;->toBinaryValue(Lio/opencensus/trace/SpanContext;)[B

    move-result-object p1

    return-object p1
.end method
