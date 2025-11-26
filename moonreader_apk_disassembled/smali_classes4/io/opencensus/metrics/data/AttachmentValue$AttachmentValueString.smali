.class public abstract Lio/opencensus/metrics/data/AttachmentValue$AttachmentValueString;
.super Lio/opencensus/metrics/data/AttachmentValue;
.source "AttachmentValue.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/metrics/data/AttachmentValue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "AttachmentValueString"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 53
    invoke-direct {p0}, Lio/opencensus/metrics/data/AttachmentValue;-><init>()V

    return-void
.end method

.method public static create(Ljava/lang/String;)Lio/opencensus/metrics/data/AttachmentValue$AttachmentValueString;
    .locals 1

    .line 63
    new-instance v0, Lio/opencensus/metrics/data/AutoValue_AttachmentValue_AttachmentValueString;

    invoke-direct {v0, p0}, Lio/opencensus/metrics/data/AutoValue_AttachmentValue_AttachmentValueString;-><init>(Ljava/lang/String;)V

    return-object v0
.end method
