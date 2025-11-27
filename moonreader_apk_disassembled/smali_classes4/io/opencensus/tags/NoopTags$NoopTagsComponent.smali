.class final Lio/opencensus/tags/NoopTags$NoopTagsComponent;
.super Lio/opencensus/tags/TagsComponent;
.source "NoopTags.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/tags/NoopTags;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NoopTagsComponent"
.end annotation


# instance fields
.field private volatile isRead:Z


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 100
    invoke-direct {p0}, Lio/opencensus/tags/TagsComponent;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lio/opencensus/tags/NoopTags$1;)V
    .locals 0

    .line 100
    invoke-direct {p0}, Lio/opencensus/tags/NoopTags$NoopTagsComponent;-><init>()V

    return-void
.end method


# virtual methods
.method public getState()Lio/opencensus/tags/TaggingState;
    .locals 1

    const/4 v0, 0x1

    .line 116
    iput-boolean v0, p0, Lio/opencensus/tags/NoopTags$NoopTagsComponent;->isRead:Z

    .line 117
    sget-object v0, Lio/opencensus/tags/TaggingState;->DISABLED:Lio/opencensus/tags/TaggingState;

    return-object v0
.end method

.method public getTagPropagationComponent()Lio/opencensus/tags/propagation/TagPropagationComponent;
    .locals 1

    .line 111
    invoke-static {}, Lio/opencensus/tags/NoopTags;->getNoopTagPropagationComponent()Lio/opencensus/tags/propagation/TagPropagationComponent;

    move-result-object v0

    return-object v0
.end method

.method public getTagger()Lio/opencensus/tags/Tagger;
    .locals 1

    .line 106
    invoke-static {}, Lio/opencensus/tags/NoopTags;->getNoopTagger()Lio/opencensus/tags/Tagger;

    move-result-object v0

    return-object v0
.end method

.method public setState(Lio/opencensus/tags/TaggingState;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 123
    const-string v0, "state"

    invoke-static {p1, v0}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    iget-boolean p1, p0, Lio/opencensus/tags/NoopTags$NoopTagsComponent;->isRead:Z

    xor-int/lit8 p1, p1, 0x1

    const-string v0, "State was already read, cannot set state."

    invoke-static {p1, v0}, Lio/opencensus/internal/Utils;->checkState(ZLjava/lang/Object;)V

    return-void
.end method
