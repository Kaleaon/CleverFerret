.class final Lio/opencensus/tags/NoopTags;
.super Ljava/lang/Object;
.source "NoopTags.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/opencensus/tags/NoopTags$NoopTagContextTextFormat;,
        Lio/opencensus/tags/NoopTags$NoopTagContextBinarySerializer;,
        Lio/opencensus/tags/NoopTags$NoopTagPropagationComponent;,
        Lio/opencensus/tags/NoopTags$NoopTagContext;,
        Lio/opencensus/tags/NoopTags$NoopTagContextBuilder;,
        Lio/opencensus/tags/NoopTags$NoopTagger;,
        Lio/opencensus/tags/NoopTags$NoopTagsComponent;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static getNoopTagContext()Lio/opencensus/tags/TagContext;
    .locals 1

    .line 75
    sget-object v0, Lio/opencensus/tags/NoopTags$NoopTagContext;->INSTANCE:Lio/opencensus/tags/TagContext;

    return-object v0
.end method

.method static getNoopTagContextBinarySerializer()Lio/opencensus/tags/propagation/TagContextBinarySerializer;
    .locals 1

    .line 88
    sget-object v0, Lio/opencensus/tags/NoopTags$NoopTagContextBinarySerializer;->INSTANCE:Lio/opencensus/tags/propagation/TagContextBinarySerializer;

    return-object v0
.end method

.method static getNoopTagContextBuilder()Lio/opencensus/tags/TagContextBuilder;
    .locals 1

    .line 66
    sget-object v0, Lio/opencensus/tags/NoopTags$NoopTagContextBuilder;->INSTANCE:Lio/opencensus/tags/TagContextBuilder;

    return-object v0
.end method

.method static getNoopTagContextTextSerializer()Lio/opencensus/tags/propagation/TagContextTextFormat;
    .locals 1

    .line 96
    sget-object v0, Lio/opencensus/tags/NoopTags$NoopTagContextTextFormat;->INSTANCE:Lio/opencensus/tags/NoopTags$NoopTagContextTextFormat;

    return-object v0
.end method

.method static getNoopTagPropagationComponent()Lio/opencensus/tags/propagation/TagPropagationComponent;
    .locals 1

    .line 80
    sget-object v0, Lio/opencensus/tags/NoopTags$NoopTagPropagationComponent;->INSTANCE:Lio/opencensus/tags/propagation/TagPropagationComponent;

    return-object v0
.end method

.method static getNoopTagger()Lio/opencensus/tags/Tagger;
    .locals 1

    .line 57
    sget-object v0, Lio/opencensus/tags/NoopTags$NoopTagger;->INSTANCE:Lio/opencensus/tags/Tagger;

    return-object v0
.end method

.method static newNoopTagsComponent()Lio/opencensus/tags/TagsComponent;
    .locals 2

    .line 48
    new-instance v0, Lio/opencensus/tags/NoopTags$NoopTagsComponent;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lio/opencensus/tags/NoopTags$NoopTagsComponent;-><init>(Lio/opencensus/tags/NoopTags$1;)V

    return-object v0
.end method
