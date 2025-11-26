.class final Lio/opencensus/trace/export/RunningSpanStore$NoopRunningSpanStore;
.super Lio/opencensus/trace/export/RunningSpanStore;
.source "RunningSpanStore.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/trace/export/RunningSpanStore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NoopRunningSpanStore"
.end annotation


# static fields
.field private static final EMPTY_SUMMARY:Lio/opencensus/trace/export/RunningSpanStore$Summary;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 188
    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    invoke-static {v0}, Lio/opencensus/trace/export/RunningSpanStore$Summary;->create(Ljava/util/Map;)Lio/opencensus/trace/export/RunningSpanStore$Summary;

    move-result-object v0

    sput-object v0, Lio/opencensus/trace/export/RunningSpanStore$NoopRunningSpanStore;->EMPTY_SUMMARY:Lio/opencensus/trace/export/RunningSpanStore$Summary;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 185
    invoke-direct {p0}, Lio/opencensus/trace/export/RunningSpanStore;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lio/opencensus/trace/export/RunningSpanStore$1;)V
    .locals 0

    .line 185
    invoke-direct {p0}, Lio/opencensus/trace/export/RunningSpanStore$NoopRunningSpanStore;-><init>()V

    return-void
.end method


# virtual methods
.method public getRunningSpans(Lio/opencensus/trace/export/RunningSpanStore$Filter;)Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/opencensus/trace/export/RunningSpanStore$Filter;",
            ")",
            "Ljava/util/Collection<",
            "Lio/opencensus/trace/export/SpanData;",
            ">;"
        }
    .end annotation

    .line 197
    const-string v0, "filter"

    invoke-static {p1, v0}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 198
    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object p1
.end method

.method public getSummary()Lio/opencensus/trace/export/RunningSpanStore$Summary;
    .locals 1

    .line 192
    sget-object v0, Lio/opencensus/trace/export/RunningSpanStore$NoopRunningSpanStore;->EMPTY_SUMMARY:Lio/opencensus/trace/export/RunningSpanStore$Summary;

    return-object v0
.end method
