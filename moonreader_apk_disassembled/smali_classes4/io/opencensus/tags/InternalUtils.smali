.class public final Lio/opencensus/tags/InternalUtils;
.super Ljava/lang/Object;
.source "InternalUtils.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getTags(Lio/opencensus/tags/TagContext;)Ljava/util/Iterator;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/opencensus/tags/TagContext;",
            ")",
            "Ljava/util/Iterator<",
            "Lio/opencensus/tags/Tag;",
            ">;"
        }
    .end annotation

    .line 36
    invoke-virtual {p0}, Lio/opencensus/tags/TagContext;->getIterator()Ljava/util/Iterator;

    move-result-object p0

    return-object p0
.end method
