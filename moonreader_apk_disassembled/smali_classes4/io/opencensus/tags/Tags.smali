.class public final Lio/opencensus/tags/Tags;
.super Ljava/lang/Object;
.source "Tags.java"


# static fields
.field private static final logger:Ljava/util/logging/Logger;

.field private static final tagsComponent:Lio/opencensus/tags/TagsComponent;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 32
    const-class v0, Lio/opencensus/tags/Tags;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lio/opencensus/tags/Tags;->logger:Ljava/util/logging/Logger;

    .line 34
    const-class v0, Lio/opencensus/tags/TagsComponent;

    .line 35
    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-static {v0}, Lio/opencensus/tags/Tags;->loadTagsComponent(Ljava/lang/ClassLoader;)Lio/opencensus/tags/TagsComponent;

    move-result-object v0

    sput-object v0, Lio/opencensus/tags/Tags;->tagsComponent:Lio/opencensus/tags/TagsComponent;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getState()Lio/opencensus/tags/TaggingState;
    .locals 1

    .line 72
    sget-object v0, Lio/opencensus/tags/Tags;->tagsComponent:Lio/opencensus/tags/TagsComponent;

    invoke-virtual {v0}, Lio/opencensus/tags/TagsComponent;->getState()Lio/opencensus/tags/TaggingState;

    move-result-object v0

    return-object v0
.end method

.method public static getTagPropagationComponent()Lio/opencensus/tags/propagation/TagPropagationComponent;
    .locals 1

    .line 56
    sget-object v0, Lio/opencensus/tags/Tags;->tagsComponent:Lio/opencensus/tags/TagsComponent;

    invoke-virtual {v0}, Lio/opencensus/tags/TagsComponent;->getTagPropagationComponent()Lio/opencensus/tags/propagation/TagPropagationComponent;

    move-result-object v0

    return-object v0
.end method

.method public static getTagger()Lio/opencensus/tags/Tagger;
    .locals 1

    .line 46
    sget-object v0, Lio/opencensus/tags/Tags;->tagsComponent:Lio/opencensus/tags/TagsComponent;

    invoke-virtual {v0}, Lio/opencensus/tags/TagsComponent;->getTagger()Lio/opencensus/tags/Tagger;

    move-result-object v0

    return-object v0
.end method

.method static loadTagsComponent(Ljava/lang/ClassLoader;)Lio/opencensus/tags/TagsComponent;
    .locals 5
    .param p0    # Ljava/lang/ClassLoader;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x1

    .line 98
    :try_start_0
    const-string v1, "io.opencensus.impl.tags.TagsComponentImpl"

    .line 99
    invoke-static {v1, v0, p0}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lio/opencensus/tags/TagsComponent;

    .line 98
    invoke-static {v1, v2}, Lio/opencensus/internal/Provider;->createInstance(Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/opencensus/tags/TagsComponent;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    move-exception v1

    .line 103
    sget-object v2, Lio/opencensus/tags/Tags;->logger:Ljava/util/logging/Logger;

    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v4, "Couldn\'t load full implementation for TagsComponent, now trying to load lite implementation."

    invoke-virtual {v2, v3, v4, v1}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 111
    :try_start_1
    const-string v1, "io.opencensus.impllite.tags.TagsComponentImplLite"

    .line 112
    invoke-static {v1, v0, p0}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object p0

    const-class v0, Lio/opencensus/tags/TagsComponent;

    .line 111
    invoke-static {p0, v0}, Lio/opencensus/internal/Provider;->createInstance(Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lio/opencensus/tags/TagsComponent;
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    return-object p0

    :catch_1
    move-exception p0

    .line 118
    sget-object v0, Lio/opencensus/tags/Tags;->logger:Ljava/util/logging/Logger;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v2, "Couldn\'t load lite implementation for TagsComponent, now using default implementation for TagsComponent."

    invoke-virtual {v0, v1, v2, p0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 124
    invoke-static {}, Lio/opencensus/tags/NoopTags;->newNoopTagsComponent()Lio/opencensus/tags/TagsComponent;

    move-result-object p0

    return-object p0
.end method

.method public static setState(Lio/opencensus/tags/TaggingState;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 90
    sget-object v0, Lio/opencensus/tags/Tags;->tagsComponent:Lio/opencensus/tags/TagsComponent;

    invoke-virtual {v0, p0}, Lio/opencensus/tags/TagsComponent;->setState(Lio/opencensus/tags/TaggingState;)V

    return-void
.end method
