.class public abstract Lio/opencensus/trace/export/SpanData$Links;
.super Ljava/lang/Object;
.source "SpanData.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/trace/export/SpanData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Links"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 475
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Ljava/util/List;I)Lio/opencensus/trace/export/SpanData$Links;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lio/opencensus/trace/Link;",
            ">;I)",
            "Lio/opencensus/trace/export/SpanData$Links;"
        }
    .end annotation

    .line 454
    new-instance v0, Lio/opencensus/trace/export/AutoValue_SpanData_Links;

    new-instance v1, Ljava/util/ArrayList;

    const-string v2, "links"

    .line 455
    invoke-static {p0, v2}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Collection;

    invoke-direct {v1, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    invoke-direct {v0, p0, p1}, Lio/opencensus/trace/export/AutoValue_SpanData_Links;-><init>(Ljava/util/List;I)V

    return-object v0
.end method


# virtual methods
.method public abstract getDroppedLinksCount()I
.end method

.method public abstract getLinks()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lio/opencensus/trace/Link;",
            ">;"
        }
    .end annotation
.end method
