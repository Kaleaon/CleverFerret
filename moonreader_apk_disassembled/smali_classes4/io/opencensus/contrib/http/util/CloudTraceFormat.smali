.class final Lio/opencensus/contrib/http/util/CloudTraceFormat;
.super Lio/opencensus/trace/propagation/TextFormat;
.source "CloudTraceFormat.java"


# static fields
.field static final CLOUD_TRACE_IS_SAMPLED:I = 0x1

.field static final FIELDS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field static final HEADER_NAME:Ljava/lang/String; = "X-Cloud-Trace-Context"

.field static final MIN_HEADER_SIZE:I = 0x22

.field static final NOT_SAMPLED:Ljava/lang/String; = "0"

.field static final OPTIONS_NOT_SAMPLED:Lio/opencensus/trace/TraceOptions;

.field static final OPTIONS_SAMPLED:Lio/opencensus/trace/TraceOptions;

.field static final SAMPLED:Ljava/lang/String; = "1"

.field static final SPAN_ID_DELIMITER:C = '/'

.field static final SPAN_ID_START_POS:I = 0x21

.field private static final TRACESTATE_DEFAULT:Lio/opencensus/trace/Tracestate;

.field static final TRACE_ID_SIZE:I = 0x20

.field static final TRACE_OPTION_DELIMITER:Ljava/lang/String; = ";o="

.field static final TRACE_OPTION_DELIMITER_SIZE:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 68
    const-string v0, "X-Cloud-Trace-Context"

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lio/opencensus/contrib/http/util/CloudTraceFormat;->FIELDS:Ljava/util/List;

    .line 73
    invoke-static {}, Lio/opencensus/trace/TraceOptions;->builder()Lio/opencensus/trace/TraceOptions$Builder;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lio/opencensus/trace/TraceOptions$Builder;->setIsSampled(Z)Lio/opencensus/trace/TraceOptions$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lio/opencensus/trace/TraceOptions$Builder;->build()Lio/opencensus/trace/TraceOptions;

    move-result-object v0

    sput-object v0, Lio/opencensus/contrib/http/util/CloudTraceFormat;->OPTIONS_SAMPLED:Lio/opencensus/trace/TraceOptions;

    .line 74
    sget-object v0, Lio/opencensus/trace/TraceOptions;->DEFAULT:Lio/opencensus/trace/TraceOptions;

    sput-object v0, Lio/opencensus/contrib/http/util/CloudTraceFormat;->OPTIONS_NOT_SAMPLED:Lio/opencensus/trace/TraceOptions;

    const/4 v0, 0x3

    .line 76
    sput v0, Lio/opencensus/contrib/http/util/CloudTraceFormat;->TRACE_OPTION_DELIMITER_SIZE:I

    .line 81
    invoke-static {}, Lio/opencensus/trace/Tracestate;->builder()Lio/opencensus/trace/Tracestate$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lio/opencensus/trace/Tracestate$Builder;->build()Lio/opencensus/trace/Tracestate;

    move-result-object v0

    sput-object v0, Lio/opencensus/contrib/http/util/CloudTraceFormat;->TRACESTATE_DEFAULT:Lio/opencensus/trace/Tracestate;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 66
    invoke-direct {p0}, Lio/opencensus/trace/propagation/TextFormat;-><init>()V

    return-void
.end method

.method private static longToSpanId(J)Lio/opencensus/trace/SpanId;
    .locals 1

    const/16 v0, 0x8

    .line 138
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 139
    invoke-virtual {v0, p0, p1}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 140
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object p0

    invoke-static {p0}, Lio/opencensus/trace/SpanId;->fromBytes([B)Lio/opencensus/trace/SpanId;

    move-result-object p0

    return-object p0
.end method

.method private static spanIdToLong(Lio/opencensus/trace/SpanId;)J
    .locals 2

    const/16 v0, 0x8

    .line 145
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 146
    invoke-virtual {p0}, Lio/opencensus/trace/SpanId;->getBytes()[B

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    const/4 p0, 0x0

    .line 147
    invoke-virtual {v0, p0}, Ljava/nio/ByteBuffer;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method


# virtual methods
.method public extract(Ljava/lang/Object;Lio/opencensus/trace/propagation/TextFormat$Getter;)Lio/opencensus/trace/SpanContext;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<C:",
            "Ljava/lang/Object;",
            ">(TC;",
            "Lio/opencensus/trace/propagation/TextFormat$Getter<",
            "TC;>;)",
            "Lio/opencensus/trace/SpanContext;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lio/opencensus/trace/propagation/SpanContextParseException;
        }
    .end annotation

    .line 108
    const-string v0, "carrier"

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    const-string v0, "getter"

    invoke-static {p2, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    :try_start_0
    const-string v0, "X-Cloud-Trace-Context"

    invoke-virtual {p2, p1, v0}, Lio/opencensus/trace/propagation/TextFormat$Getter;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_3

    .line 112
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    const/16 v0, 0x22

    if-lt p2, v0, :cond_3

    const/16 p2, 0x20

    .line 115
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x2f

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "Invalid TRACE_ID size"

    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 117
    invoke-virtual {p1, v3, p2}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Lio/opencensus/trace/TraceId;->fromLowerBase16(Ljava/lang/CharSequence;)Lio/opencensus/trace/TraceId;

    move-result-object v0

    .line 118
    const-string v1, ";o="

    invoke-virtual {p1, v1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result p2

    if-gez p2, :cond_1

    .line 121
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    goto :goto_1

    :cond_1
    move v1, p2

    :goto_1
    const/16 v3, 0x21

    .line 120
    invoke-virtual {p1, v3, v1}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v1

    .line 122
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    const/16 v3, 0xa

    invoke-static {v1, v3}, Lcom/google/common/primitives/UnsignedLongs;->parseUnsignedLong(Ljava/lang/String;I)J

    move-result-wide v4

    invoke-static {v4, v5}, Lio/opencensus/contrib/http/util/CloudTraceFormat;->longToSpanId(J)Lio/opencensus/trace/SpanId;

    move-result-object v1

    .line 123
    sget-object v4, Lio/opencensus/contrib/http/util/CloudTraceFormat;->OPTIONS_NOT_SAMPLED:Lio/opencensus/trace/TraceOptions;

    if-lez p2, :cond_2

    .line 125
    sget v5, Lio/opencensus/contrib/http/util/CloudTraceFormat;->TRACE_OPTION_DELIMITER_SIZE:I

    add-int/2addr p2, v5

    invoke-virtual {p1, p2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 126
    invoke-static {p1, v3}, Lcom/google/common/primitives/UnsignedInts;->parseUnsignedInt(Ljava/lang/String;I)I

    move-result p1

    and-int/2addr p1, v2

    if-eqz p1, :cond_2

    .line 127
    sget-object v4, Lio/opencensus/contrib/http/util/CloudTraceFormat;->OPTIONS_SAMPLED:Lio/opencensus/trace/TraceOptions;

    .line 130
    :cond_2
    sget-object p1, Lio/opencensus/contrib/http/util/CloudTraceFormat;->TRACESTATE_DEFAULT:Lio/opencensus/trace/Tracestate;

    invoke-static {v0, v1, v4, p1}, Lio/opencensus/trace/SpanContext;->create(Lio/opencensus/trace/TraceId;Lio/opencensus/trace/SpanId;Lio/opencensus/trace/TraceOptions;Lio/opencensus/trace/Tracestate;)Lio/opencensus/trace/SpanContext;

    move-result-object p1

    return-object p1

    .line 113
    :cond_3
    new-instance p1, Lio/opencensus/trace/propagation/SpanContextParseException;

    const-string p2, "Missing or too short header: X-Cloud-Trace-Context"

    invoke-direct {p1, p2}, Lio/opencensus/trace/propagation/SpanContextParseException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    .line 132
    new-instance p2, Lio/opencensus/trace/propagation/SpanContextParseException;

    const-string v0, "Invalid input"

    invoke-direct {p2, v0, p1}, Lio/opencensus/trace/propagation/SpanContextParseException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2
.end method

.method public fields()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 85
    sget-object v0, Lio/opencensus/contrib/http/util/CloudTraceFormat;->FIELDS:Ljava/util/List;

    return-object v0
.end method

.method public inject(Lio/opencensus/trace/SpanContext;Ljava/lang/Object;Lio/opencensus/trace/propagation/TextFormat$Setter;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<C:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/opencensus/trace/SpanContext;",
            "TC;",
            "Lio/opencensus/trace/propagation/TextFormat$Setter<",
            "TC;>;)V"
        }
    .end annotation

    .line 91
    const-string v0, "spanContext"

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    const-string v0, "setter"

    invoke-static {p3, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    const-string v0, "carrier"

    invoke-static {p2, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 96
    invoke-virtual {p1}, Lio/opencensus/trace/SpanContext;->getTraceId()Lio/opencensus/trace/TraceId;

    move-result-object v1

    invoke-virtual {v1}, Lio/opencensus/trace/TraceId;->toLowerBase16()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x2f

    .line 97
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 98
    invoke-virtual {p1}, Lio/opencensus/trace/SpanContext;->getSpanId()Lio/opencensus/trace/SpanId;

    move-result-object v1

    invoke-static {v1}, Lio/opencensus/contrib/http/util/CloudTraceFormat;->spanIdToLong(Lio/opencensus/trace/SpanId;)J

    move-result-wide v1

    invoke-static {v1, v2}, Lcom/google/common/primitives/UnsignedLongs;->toString(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ";o="

    .line 99
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    invoke-virtual {p1}, Lio/opencensus/trace/SpanContext;->getTraceOptions()Lio/opencensus/trace/TraceOptions;

    move-result-object p1

    invoke-virtual {p1}, Lio/opencensus/trace/TraceOptions;->isSampled()Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "1"

    goto :goto_0

    :cond_0
    const-string p1, "0"

    :goto_0
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    const-string p1, "X-Cloud-Trace-Context"

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, p2, p1, v0}, Lio/opencensus/trace/propagation/TextFormat$Setter;->put(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
