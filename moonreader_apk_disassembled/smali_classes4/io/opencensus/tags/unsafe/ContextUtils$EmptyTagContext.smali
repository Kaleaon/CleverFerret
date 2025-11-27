.class final Lio/opencensus/tags/unsafe/ContextUtils$EmptyTagContext;
.super Lio/opencensus/tags/TagContext;
.source "ContextUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/tags/unsafe/ContextUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "EmptyTagContext"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 83
    invoke-direct {p0}, Lio/opencensus/tags/TagContext;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lio/opencensus/tags/unsafe/ContextUtils$1;)V
    .locals 0

    .line 83
    invoke-direct {p0}, Lio/opencensus/tags/unsafe/ContextUtils$EmptyTagContext;-><init>()V

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

    .line 87
    sget-object v0, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method
