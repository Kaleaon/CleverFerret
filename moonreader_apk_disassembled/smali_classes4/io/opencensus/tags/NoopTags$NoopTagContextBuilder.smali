.class final Lio/opencensus/tags/NoopTags$NoopTagContextBuilder;
.super Lio/opencensus/tags/TagContextBuilder;
.source "NoopTags.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/tags/NoopTags;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NoopTagContextBuilder"
.end annotation


# static fields
.field static final INSTANCE:Lio/opencensus/tags/TagContextBuilder;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 169
    new-instance v0, Lio/opencensus/tags/NoopTags$NoopTagContextBuilder;

    invoke-direct {v0}, Lio/opencensus/tags/NoopTags$NoopTagContextBuilder;-><init>()V

    sput-object v0, Lio/opencensus/tags/NoopTags$NoopTagContextBuilder;->INSTANCE:Lio/opencensus/tags/TagContextBuilder;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 167
    invoke-direct {p0}, Lio/opencensus/tags/TagContextBuilder;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lio/opencensus/tags/TagContext;
    .locals 1

    .line 195
    invoke-static {}, Lio/opencensus/tags/NoopTags;->getNoopTagContext()Lio/opencensus/tags/TagContext;

    move-result-object v0

    return-object v0
.end method

.method public buildScoped()Lio/opencensus/common/Scope;
    .locals 1

    .line 200
    invoke-static {}, Lio/opencensus/internal/NoopScope;->getInstance()Lio/opencensus/common/Scope;

    move-result-object v0

    return-object v0
.end method

.method public put(Lio/opencensus/tags/TagKey;Lio/opencensus/tags/TagValue;)Lio/opencensus/tags/TagContextBuilder;
    .locals 1

    .line 174
    const-string v0, "key"

    invoke-static {p1, v0}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    const-string p1, "value"

    invoke-static {p2, p1}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public put(Lio/opencensus/tags/TagKey;Lio/opencensus/tags/TagValue;Lio/opencensus/tags/TagMetadata;)Lio/opencensus/tags/TagContextBuilder;
    .locals 1

    .line 181
    const-string v0, "key"

    invoke-static {p1, v0}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    const-string p1, "value"

    invoke-static {p2, p1}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 183
    const-string p1, "tagMetadata"

    invoke-static {p3, p1}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public remove(Lio/opencensus/tags/TagKey;)Lio/opencensus/tags/TagContextBuilder;
    .locals 1

    .line 189
    const-string v0, "key"

    invoke-static {p1, v0}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method
