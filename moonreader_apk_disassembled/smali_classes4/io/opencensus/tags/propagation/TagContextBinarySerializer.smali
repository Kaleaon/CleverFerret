.class public abstract Lio/opencensus/tags/propagation/TagContextBinarySerializer;
.super Ljava/lang/Object;
.source "TagContextBinarySerializer.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract fromByteArray([B)Lio/opencensus/tags/TagContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lio/opencensus/tags/propagation/TagContextDeserializationException;
        }
    .end annotation
.end method

.method public abstract toByteArray(Lio/opencensus/tags/TagContext;)[B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lio/opencensus/tags/propagation/TagContextSerializationException;
        }
    .end annotation
.end method
