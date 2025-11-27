.class public final Lio/opencensus/contrib/http/util/HttpViews;
.super Ljava/lang/Object;
.source "HttpViews.java"


# static fields
.field static final HTTP_CLIENT_VIEWS_SET:Lcom/google/common/collect/ImmutableSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableSet<",
            "Lio/opencensus/stats/View;",
            ">;"
        }
    .end annotation
.end field

.field static final HTTP_SERVER_VIEWS_SET:Lcom/google/common/collect/ImmutableSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableSet<",
            "Lio/opencensus/stats/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 35
    sget-object v0, Lio/opencensus/contrib/http/util/HttpViewConstants;->HTTP_SERVER_COMPLETED_COUNT_VIEW:Lio/opencensus/stats/View;

    sget-object v1, Lio/opencensus/contrib/http/util/HttpViewConstants;->HTTP_SERVER_SENT_BYTES_VIEW:Lio/opencensus/stats/View;

    sget-object v2, Lio/opencensus/contrib/http/util/HttpViewConstants;->HTTP_SERVER_RECEIVED_BYTES_VIEW:Lio/opencensus/stats/View;

    sget-object v3, Lio/opencensus/contrib/http/util/HttpViewConstants;->HTTP_SERVER_LATENCY_VIEW:Lio/opencensus/stats/View;

    .line 36
    invoke-static {v0, v1, v2, v3}, Lcom/google/common/collect/ImmutableSet;->of(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    sput-object v0, Lio/opencensus/contrib/http/util/HttpViews;->HTTP_SERVER_VIEWS_SET:Lcom/google/common/collect/ImmutableSet;

    .line 43
    sget-object v0, Lio/opencensus/contrib/http/util/HttpViewConstants;->HTTP_CLIENT_COMPLETED_COUNT_VIEW:Lio/opencensus/stats/View;

    sget-object v1, Lio/opencensus/contrib/http/util/HttpViewConstants;->HTTP_CLIENT_RECEIVED_BYTES_VIEW:Lio/opencensus/stats/View;

    sget-object v2, Lio/opencensus/contrib/http/util/HttpViewConstants;->HTTP_CLIENT_SENT_BYTES_VIEW:Lio/opencensus/stats/View;

    sget-object v3, Lio/opencensus/contrib/http/util/HttpViewConstants;->HTTP_CLIENT_ROUNDTRIP_LATENCY_VIEW:Lio/opencensus/stats/View;

    .line 44
    invoke-static {v0, v1, v2, v3}, Lcom/google/common/collect/ImmutableSet;->of(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    sput-object v0, Lio/opencensus/contrib/http/util/HttpViews;->HTTP_CLIENT_VIEWS_SET:Lcom/google/common/collect/ImmutableSet;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final registerAllClientViews()V
    .locals 1

    .line 58
    invoke-static {}, Lio/opencensus/stats/Stats;->getViewManager()Lio/opencensus/stats/ViewManager;

    move-result-object v0

    invoke-static {v0}, Lio/opencensus/contrib/http/util/HttpViews;->registerAllClientViews(Lio/opencensus/stats/ViewManager;)V

    return-void
.end method

.method static registerAllClientViews(Lio/opencensus/stats/ViewManager;)V
    .locals 2

    .line 63
    sget-object v0, Lio/opencensus/contrib/http/util/HttpViews;->HTTP_CLIENT_VIEWS_SET:Lcom/google/common/collect/ImmutableSet;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableSet;->iterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/opencensus/stats/View;

    .line 64
    invoke-virtual {p0, v1}, Lio/opencensus/stats/ViewManager;->registerView(Lio/opencensus/stats/View;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public static final registerAllServerViews()V
    .locals 1

    .line 76
    invoke-static {}, Lio/opencensus/stats/Stats;->getViewManager()Lio/opencensus/stats/ViewManager;

    move-result-object v0

    invoke-static {v0}, Lio/opencensus/contrib/http/util/HttpViews;->registerAllServerViews(Lio/opencensus/stats/ViewManager;)V

    return-void
.end method

.method static registerAllServerViews(Lio/opencensus/stats/ViewManager;)V
    .locals 2

    .line 81
    sget-object v0, Lio/opencensus/contrib/http/util/HttpViews;->HTTP_SERVER_VIEWS_SET:Lcom/google/common/collect/ImmutableSet;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableSet;->iterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/opencensus/stats/View;

    .line 82
    invoke-virtual {p0, v1}, Lio/opencensus/stats/ViewManager;->registerView(Lio/opencensus/stats/View;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public static final registerAllViews()V
    .locals 1

    .line 95
    invoke-static {}, Lio/opencensus/stats/Stats;->getViewManager()Lio/opencensus/stats/ViewManager;

    move-result-object v0

    invoke-static {v0}, Lio/opencensus/contrib/http/util/HttpViews;->registerAllViews(Lio/opencensus/stats/ViewManager;)V

    return-void
.end method

.method static registerAllViews(Lio/opencensus/stats/ViewManager;)V
    .locals 0

    .line 100
    invoke-static {p0}, Lio/opencensus/contrib/http/util/HttpViews;->registerAllClientViews(Lio/opencensus/stats/ViewManager;)V

    .line 101
    invoke-static {p0}, Lio/opencensus/contrib/http/util/HttpViews;->registerAllServerViews(Lio/opencensus/stats/ViewManager;)V

    return-void
.end method
