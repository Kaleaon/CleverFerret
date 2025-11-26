.class public abstract Lio/opencensus/metrics/LabelValue;
.super Ljava/lang/Object;
.source "LabelValue.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Ljava/lang/String;)Lio/opencensus/metrics/LabelValue;
    .locals 1
    .param p0    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 45
    new-instance v0, Lio/opencensus/metrics/AutoValue_LabelValue;

    invoke-direct {v0, p0}, Lio/opencensus/metrics/AutoValue_LabelValue;-><init>(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public abstract getValue()Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end method
