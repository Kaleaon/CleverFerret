.class public abstract Lio/opencensus/tags/TagMetadata;
.super Ljava/lang/Object;
.source "TagMetadata.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/opencensus/tags/TagMetadata$TagTtl;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Lio/opencensus/tags/TagMetadata$TagTtl;)Lio/opencensus/tags/TagMetadata;
    .locals 1

    .line 44
    new-instance v0, Lio/opencensus/tags/AutoValue_TagMetadata;

    invoke-direct {v0, p0}, Lio/opencensus/tags/AutoValue_TagMetadata;-><init>(Lio/opencensus/tags/TagMetadata$TagTtl;)V

    return-object v0
.end method


# virtual methods
.method public abstract getTagTtl()Lio/opencensus/tags/TagMetadata$TagTtl;
.end method
