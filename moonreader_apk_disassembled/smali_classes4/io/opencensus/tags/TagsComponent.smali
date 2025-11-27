.class public abstract Lio/opencensus/tags/TagsComponent;
.super Ljava/lang/Object;
.source "TagsComponent.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract getState()Lio/opencensus/tags/TaggingState;
.end method

.method public abstract getTagPropagationComponent()Lio/opencensus/tags/propagation/TagPropagationComponent;
.end method

.method public abstract getTagger()Lio/opencensus/tags/Tagger;
.end method

.method public abstract setState(Lio/opencensus/tags/TaggingState;)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method
