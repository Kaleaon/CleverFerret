.class final Lio/opencensus/tags/NoopTags$NoopTagContextBinarySerializer;
.super Lio/opencensus/tags/propagation/TagContextBinarySerializer;
.source "NoopTags.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/tags/NoopTags;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NoopTagContextBinarySerializer"
.end annotation


# static fields
.field static final EMPTY_BYTE_ARRAY:[B

.field static final INSTANCE:Lio/opencensus/tags/propagation/TagContextBinarySerializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 235
    new-instance v0, Lio/opencensus/tags/NoopTags$NoopTagContextBinarySerializer;

    invoke-direct {v0}, Lio/opencensus/tags/NoopTags$NoopTagContextBinarySerializer;-><init>()V

    sput-object v0, Lio/opencensus/tags/NoopTags$NoopTagContextBinarySerializer;->INSTANCE:Lio/opencensus/tags/propagation/TagContextBinarySerializer;

    const/4 v0, 0x0

    .line 236
    new-array v0, v0, [B

    sput-object v0, Lio/opencensus/tags/NoopTags$NoopTagContextBinarySerializer;->EMPTY_BYTE_ARRAY:[B

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 233
    invoke-direct {p0}, Lio/opencensus/tags/propagation/TagContextBinarySerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public fromByteArray([B)Lio/opencensus/tags/TagContext;
    .locals 1

    .line 246
    const-string v0, "bytes"

    invoke-static {p1, v0}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 247
    invoke-static {}, Lio/opencensus/tags/NoopTags;->getNoopTagContext()Lio/opencensus/tags/TagContext;

    move-result-object p1

    return-object p1
.end method

.method public toByteArray(Lio/opencensus/tags/TagContext;)[B
    .locals 1

    .line 240
    const-string v0, "tags"

    invoke-static {p1, v0}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 241
    sget-object p1, Lio/opencensus/tags/NoopTags$NoopTagContextBinarySerializer;->EMPTY_BYTE_ARRAY:[B

    return-object p1
.end method
