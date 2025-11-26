.class public abstract Lio/opencensus/tags/propagation/TagPropagationComponent;
.super Ljava/lang/Object;
.source "TagPropagationComponent.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract getBinarySerializer()Lio/opencensus/tags/propagation/TagContextBinarySerializer;
.end method

.method public abstract getCorrelationContextFormat()Lio/opencensus/tags/propagation/TagContextTextFormat;
.end method
