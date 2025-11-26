.class public abstract Lio/opencensus/trace/export/RunningSpanStore$Filter;
.super Ljava/lang/Object;
.source "RunningSpanStore.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/trace/export/RunningSpanStore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Filter"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 148
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Ljava/lang/String;I)Lio/opencensus/trace/export/RunningSpanStore$Filter;
    .locals 2

    if-ltz p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 164
    :goto_0
    const-string v1, "Negative maxSpansToReturn."

    invoke-static {v0, v1}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/Object;)V

    .line 165
    new-instance v0, Lio/opencensus/trace/export/AutoValue_RunningSpanStore_Filter;

    invoke-direct {v0, p0, p1}, Lio/opencensus/trace/export/AutoValue_RunningSpanStore_Filter;-><init>(Ljava/lang/String;I)V

    return-object v0
.end method


# virtual methods
.method public abstract getMaxSpansToReturn()I
.end method

.method public abstract getSpanName()Ljava/lang/String;
.end method
