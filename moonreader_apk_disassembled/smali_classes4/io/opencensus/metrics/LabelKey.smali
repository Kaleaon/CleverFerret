.class public abstract Lio/opencensus/metrics/LabelKey;
.super Ljava/lang/Object;
.source "LabelKey.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Ljava/lang/String;Ljava/lang/String;)Lio/opencensus/metrics/LabelKey;
    .locals 1

    .line 44
    new-instance v0, Lio/opencensus/metrics/AutoValue_LabelKey;

    invoke-direct {v0, p0, p1}, Lio/opencensus/metrics/AutoValue_LabelKey;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public abstract getDescription()Ljava/lang/String;
.end method

.method public abstract getKey()Ljava/lang/String;
.end method
