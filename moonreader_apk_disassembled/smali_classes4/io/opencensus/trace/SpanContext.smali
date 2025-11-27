.class public final Lio/opencensus/trace/SpanContext;
.super Ljava/lang/Object;
.source "SpanContext.java"


# static fields
.field public static final INVALID:Lio/opencensus/trace/SpanContext;

.field private static final TRACESTATE_DEFAULT:Lio/opencensus/trace/Tracestate;


# instance fields
.field private final spanId:Lio/opencensus/trace/SpanId;

.field private final traceId:Lio/opencensus/trace/TraceId;

.field private final traceOptions:Lio/opencensus/trace/TraceOptions;

.field private final tracestate:Lio/opencensus/trace/Tracestate;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 33
    invoke-static {}, Lio/opencensus/trace/Tracestate;->builder()Lio/opencensus/trace/Tracestate$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lio/opencensus/trace/Tracestate$Builder;->build()Lio/opencensus/trace/Tracestate;

    move-result-object v0

    sput-object v0, Lio/opencensus/trace/SpanContext;->TRACESTATE_DEFAULT:Lio/opencensus/trace/Tracestate;

    .line 44
    new-instance v1, Lio/opencensus/trace/SpanContext;

    sget-object v2, Lio/opencensus/trace/TraceId;->INVALID:Lio/opencensus/trace/TraceId;

    sget-object v3, Lio/opencensus/trace/SpanId;->INVALID:Lio/opencensus/trace/SpanId;

    sget-object v4, Lio/opencensus/trace/TraceOptions;->DEFAULT:Lio/opencensus/trace/TraceOptions;

    invoke-direct {v1, v2, v3, v4, v0}, Lio/opencensus/trace/SpanContext;-><init>(Lio/opencensus/trace/TraceId;Lio/opencensus/trace/SpanId;Lio/opencensus/trace/TraceOptions;Lio/opencensus/trace/Tracestate;)V

    sput-object v1, Lio/opencensus/trace/SpanContext;->INVALID:Lio/opencensus/trace/SpanContext;

    return-void
.end method

.method private constructor <init>(Lio/opencensus/trace/TraceId;Lio/opencensus/trace/SpanId;Lio/opencensus/trace/TraceOptions;Lio/opencensus/trace/Tracestate;)V
    .locals 0

    .line 159
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 160
    iput-object p1, p0, Lio/opencensus/trace/SpanContext;->traceId:Lio/opencensus/trace/TraceId;

    .line 161
    iput-object p2, p0, Lio/opencensus/trace/SpanContext;->spanId:Lio/opencensus/trace/SpanId;

    .line 162
    iput-object p3, p0, Lio/opencensus/trace/SpanContext;->traceOptions:Lio/opencensus/trace/TraceOptions;

    .line 163
    iput-object p4, p0, Lio/opencensus/trace/SpanContext;->tracestate:Lio/opencensus/trace/Tracestate;

    return-void
.end method

.method public static create(Lio/opencensus/trace/TraceId;Lio/opencensus/trace/SpanId;Lio/opencensus/trace/TraceOptions;)Lio/opencensus/trace/SpanContext;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 58
    sget-object v0, Lio/opencensus/trace/SpanContext;->TRACESTATE_DEFAULT:Lio/opencensus/trace/Tracestate;

    invoke-static {p0, p1, p2, v0}, Lio/opencensus/trace/SpanContext;->create(Lio/opencensus/trace/TraceId;Lio/opencensus/trace/SpanId;Lio/opencensus/trace/TraceOptions;Lio/opencensus/trace/Tracestate;)Lio/opencensus/trace/SpanContext;

    move-result-object p0

    return-object p0
.end method

.method public static create(Lio/opencensus/trace/TraceId;Lio/opencensus/trace/SpanId;Lio/opencensus/trace/TraceOptions;Lio/opencensus/trace/Tracestate;)Lio/opencensus/trace/SpanContext;
    .locals 1

    .line 73
    new-instance v0, Lio/opencensus/trace/SpanContext;

    invoke-direct {v0, p0, p1, p2, p3}, Lio/opencensus/trace/SpanContext;-><init>(Lio/opencensus/trace/TraceId;Lio/opencensus/trace/SpanId;Lio/opencensus/trace/TraceOptions;Lio/opencensus/trace/Tracestate;)V

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 132
    :cond_0
    instance-of v1, p1, Lio/opencensus/trace/SpanContext;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 136
    :cond_1
    check-cast p1, Lio/opencensus/trace/SpanContext;

    .line 137
    iget-object v1, p0, Lio/opencensus/trace/SpanContext;->traceId:Lio/opencensus/trace/TraceId;

    iget-object v3, p1, Lio/opencensus/trace/SpanContext;->traceId:Lio/opencensus/trace/TraceId;

    invoke-virtual {v1, v3}, Lio/opencensus/trace/TraceId;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lio/opencensus/trace/SpanContext;->spanId:Lio/opencensus/trace/SpanId;

    iget-object v3, p1, Lio/opencensus/trace/SpanContext;->spanId:Lio/opencensus/trace/SpanId;

    .line 138
    invoke-virtual {v1, v3}, Lio/opencensus/trace/SpanId;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lio/opencensus/trace/SpanContext;->traceOptions:Lio/opencensus/trace/TraceOptions;

    iget-object p1, p1, Lio/opencensus/trace/SpanContext;->traceOptions:Lio/opencensus/trace/TraceOptions;

    .line 139
    invoke-virtual {v1, p1}, Lio/opencensus/trace/TraceOptions;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    return v0

    :cond_2
    return v2
.end method

.method public getSpanId()Lio/opencensus/trace/SpanId;
    .locals 1

    .line 93
    iget-object v0, p0, Lio/opencensus/trace/SpanContext;->spanId:Lio/opencensus/trace/SpanId;

    return-object v0
.end method

.method public getTraceId()Lio/opencensus/trace/TraceId;
    .locals 1

    .line 83
    iget-object v0, p0, Lio/opencensus/trace/SpanContext;->traceId:Lio/opencensus/trace/TraceId;

    return-object v0
.end method

.method public getTraceOptions()Lio/opencensus/trace/TraceOptions;
    .locals 1

    .line 103
    iget-object v0, p0, Lio/opencensus/trace/SpanContext;->traceOptions:Lio/opencensus/trace/TraceOptions;

    return-object v0
.end method

.method public getTracestate()Lio/opencensus/trace/Tracestate;
    .locals 1

    .line 113
    iget-object v0, p0, Lio/opencensus/trace/SpanContext;->tracestate:Lio/opencensus/trace/Tracestate;

    return-object v0
.end method

.method public hashCode()I
    .locals 5

    .line 144
    iget-object v0, p0, Lio/opencensus/trace/SpanContext;->traceId:Lio/opencensus/trace/TraceId;

    iget-object v1, p0, Lio/opencensus/trace/SpanContext;->spanId:Lio/opencensus/trace/SpanId;

    iget-object v2, p0, Lio/opencensus/trace/SpanContext;->traceOptions:Lio/opencensus/trace/TraceOptions;

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v0, 0x1

    aput-object v1, v3, v0

    const/4 v0, 0x2

    aput-object v2, v3, v0

    invoke-static {v3}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public isValid()Z
    .locals 1

    .line 123
    iget-object v0, p0, Lio/opencensus/trace/SpanContext;->traceId:Lio/opencensus/trace/TraceId;

    invoke-virtual {v0}, Lio/opencensus/trace/TraceId;->isValid()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/opencensus/trace/SpanContext;->spanId:Lio/opencensus/trace/SpanId;

    invoke-virtual {v0}, Lio/opencensus/trace/SpanId;->isValid()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 149
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "SpanContext{traceId="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lio/opencensus/trace/SpanContext;->traceId:Lio/opencensus/trace/TraceId;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", spanId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/opencensus/trace/SpanContext;->spanId:Lio/opencensus/trace/SpanId;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", traceOptions="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/opencensus/trace/SpanContext;->traceOptions:Lio/opencensus/trace/TraceOptions;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
