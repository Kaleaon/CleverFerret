.class public abstract Lio/opencensus/tags/Tagger;
.super Ljava/lang/Object;
.source "Tagger.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract currentBuilder()Lio/opencensus/tags/TagContextBuilder;
.end method

.method public abstract empty()Lio/opencensus/tags/TagContext;
.end method

.method public abstract emptyBuilder()Lio/opencensus/tags/TagContextBuilder;
.end method

.method public abstract getCurrentTagContext()Lio/opencensus/tags/TagContext;
.end method

.method public abstract toBuilder(Lio/opencensus/tags/TagContext;)Lio/opencensus/tags/TagContextBuilder;
.end method

.method public abstract withTagContext(Lio/opencensus/tags/TagContext;)Lio/opencensus/common/Scope;
.end method
