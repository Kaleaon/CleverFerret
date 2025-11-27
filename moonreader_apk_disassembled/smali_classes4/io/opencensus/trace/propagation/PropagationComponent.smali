.class public abstract Lio/opencensus/trace/propagation/PropagationComponent;
.super Ljava/lang/Object;
.source "PropagationComponent.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/opencensus/trace/propagation/PropagationComponent$NoopPropagationComponent;
    }
.end annotation


# static fields
.field private static final NOOP_PROPAGATION_COMPONENT:Lio/opencensus/trace/propagation/PropagationComponent;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 29
    new-instance v0, Lio/opencensus/trace/propagation/PropagationComponent$NoopPropagationComponent;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lio/opencensus/trace/propagation/PropagationComponent$NoopPropagationComponent;-><init>(Lio/opencensus/trace/propagation/PropagationComponent$1;)V

    sput-object v0, Lio/opencensus/trace/propagation/PropagationComponent;->NOOP_PROPAGATION_COMPONENT:Lio/opencensus/trace/propagation/PropagationComponent;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getNoopPropagationComponent()Lio/opencensus/trace/propagation/PropagationComponent;
    .locals 1

    .line 70
    sget-object v0, Lio/opencensus/trace/propagation/PropagationComponent;->NOOP_PROPAGATION_COMPONENT:Lio/opencensus/trace/propagation/PropagationComponent;

    return-object v0
.end method


# virtual methods
.method public abstract getB3Format()Lio/opencensus/trace/propagation/TextFormat;
.end method

.method public abstract getBinaryFormat()Lio/opencensus/trace/propagation/BinaryFormat;
.end method

.method public abstract getTraceContextFormat()Lio/opencensus/trace/propagation/TextFormat;
.end method
