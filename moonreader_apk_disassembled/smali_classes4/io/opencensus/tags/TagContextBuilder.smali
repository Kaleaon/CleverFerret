.class public abstract Lio/opencensus/tags/TagContextBuilder;
.super Ljava/lang/Object;
.source "TagContextBuilder.java"


# static fields
.field private static final METADATA_NO_PROPAGATION:Lio/opencensus/tags/TagMetadata;

.field private static final METADATA_UNLIMITED_PROPAGATION:Lio/opencensus/tags/TagMetadata;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 29
    sget-object v0, Lio/opencensus/tags/TagMetadata$TagTtl;->NO_PROPAGATION:Lio/opencensus/tags/TagMetadata$TagTtl;

    .line 30
    invoke-static {v0}, Lio/opencensus/tags/TagMetadata;->create(Lio/opencensus/tags/TagMetadata$TagTtl;)Lio/opencensus/tags/TagMetadata;

    move-result-object v0

    sput-object v0, Lio/opencensus/tags/TagContextBuilder;->METADATA_NO_PROPAGATION:Lio/opencensus/tags/TagMetadata;

    .line 31
    sget-object v0, Lio/opencensus/tags/TagMetadata$TagTtl;->UNLIMITED_PROPAGATION:Lio/opencensus/tags/TagMetadata$TagTtl;

    .line 32
    invoke-static {v0}, Lio/opencensus/tags/TagMetadata;->create(Lio/opencensus/tags/TagMetadata$TagTtl;)Lio/opencensus/tags/TagMetadata;

    move-result-object v0

    sput-object v0, Lio/opencensus/tags/TagContextBuilder;->METADATA_UNLIMITED_PROPAGATION:Lio/opencensus/tags/TagMetadata;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract build()Lio/opencensus/tags/TagContext;
.end method

.method public abstract buildScoped()Lio/opencensus/common/Scope;
.end method

.method public abstract put(Lio/opencensus/tags/TagKey;Lio/opencensus/tags/TagValue;)Lio/opencensus/tags/TagContextBuilder;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public put(Lio/opencensus/tags/TagKey;Lio/opencensus/tags/TagValue;Lio/opencensus/tags/TagMetadata;)Lio/opencensus/tags/TagContextBuilder;
    .locals 0

    .line 63
    invoke-virtual {p0, p1, p2}, Lio/opencensus/tags/TagContextBuilder;->put(Lio/opencensus/tags/TagKey;Lio/opencensus/tags/TagValue;)Lio/opencensus/tags/TagContextBuilder;

    move-result-object p1

    return-object p1
.end method

.method public final putLocal(Lio/opencensus/tags/TagKey;Lio/opencensus/tags/TagValue;)Lio/opencensus/tags/TagContextBuilder;
    .locals 1

    .line 79
    sget-object v0, Lio/opencensus/tags/TagContextBuilder;->METADATA_NO_PROPAGATION:Lio/opencensus/tags/TagMetadata;

    invoke-virtual {p0, p1, p2, v0}, Lio/opencensus/tags/TagContextBuilder;->put(Lio/opencensus/tags/TagKey;Lio/opencensus/tags/TagValue;Lio/opencensus/tags/TagMetadata;)Lio/opencensus/tags/TagContextBuilder;

    move-result-object p1

    return-object p1
.end method

.method public final putPropagating(Lio/opencensus/tags/TagKey;Lio/opencensus/tags/TagValue;)Lio/opencensus/tags/TagContextBuilder;
    .locals 1

    .line 98
    sget-object v0, Lio/opencensus/tags/TagContextBuilder;->METADATA_UNLIMITED_PROPAGATION:Lio/opencensus/tags/TagMetadata;

    invoke-virtual {p0, p1, p2, v0}, Lio/opencensus/tags/TagContextBuilder;->put(Lio/opencensus/tags/TagKey;Lio/opencensus/tags/TagValue;Lio/opencensus/tags/TagMetadata;)Lio/opencensus/tags/TagContextBuilder;

    move-result-object p1

    return-object p1
.end method

.method public abstract remove(Lio/opencensus/tags/TagKey;)Lio/opencensus/tags/TagContextBuilder;
.end method
