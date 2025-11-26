.class final Lio/opencensus/tags/NoopTags$NoopTagContext;
.super Lio/opencensus/tags/TagContext;
.source "NoopTags.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/tags/NoopTags;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NoopTagContext"
.end annotation


# static fields
.field static final INSTANCE:Lio/opencensus/tags/TagContext;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 207
    new-instance v0, Lio/opencensus/tags/NoopTags$NoopTagContext;

    invoke-direct {v0}, Lio/opencensus/tags/NoopTags$NoopTagContext;-><init>()V

    sput-object v0, Lio/opencensus/tags/NoopTags$NoopTagContext;->INSTANCE:Lio/opencensus/tags/TagContext;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 205
    invoke-direct {p0}, Lio/opencensus/tags/TagContext;-><init>()V

    return-void
.end method


# virtual methods
.method protected getIterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Lio/opencensus/tags/Tag;",
            ">;"
        }
    .end annotation

    .line 212
    sget-object v0, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method
