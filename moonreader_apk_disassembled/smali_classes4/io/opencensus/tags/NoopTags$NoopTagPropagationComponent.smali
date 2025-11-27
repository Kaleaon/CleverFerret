.class final Lio/opencensus/tags/NoopTags$NoopTagPropagationComponent;
.super Lio/opencensus/tags/propagation/TagPropagationComponent;
.source "NoopTags.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/tags/NoopTags;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NoopTagPropagationComponent"
.end annotation


# static fields
.field static final INSTANCE:Lio/opencensus/tags/propagation/TagPropagationComponent;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 219
    new-instance v0, Lio/opencensus/tags/NoopTags$NoopTagPropagationComponent;

    invoke-direct {v0}, Lio/opencensus/tags/NoopTags$NoopTagPropagationComponent;-><init>()V

    sput-object v0, Lio/opencensus/tags/NoopTags$NoopTagPropagationComponent;->INSTANCE:Lio/opencensus/tags/propagation/TagPropagationComponent;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 217
    invoke-direct {p0}, Lio/opencensus/tags/propagation/TagPropagationComponent;-><init>()V

    return-void
.end method


# virtual methods
.method public getBinarySerializer()Lio/opencensus/tags/propagation/TagContextBinarySerializer;
    .locals 1

    .line 223
    invoke-static {}, Lio/opencensus/tags/NoopTags;->getNoopTagContextBinarySerializer()Lio/opencensus/tags/propagation/TagContextBinarySerializer;

    move-result-object v0

    return-object v0
.end method

.method public getCorrelationContextFormat()Lio/opencensus/tags/propagation/TagContextTextFormat;
    .locals 1

    .line 228
    invoke-static {}, Lio/opencensus/tags/NoopTags;->getNoopTagContextTextSerializer()Lio/opencensus/tags/propagation/TagContextTextFormat;

    move-result-object v0

    return-object v0
.end method
