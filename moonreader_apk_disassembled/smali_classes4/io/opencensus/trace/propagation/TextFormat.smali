.class public abstract Lio/opencensus/trace/propagation/TextFormat;
.super Ljava/lang/Object;
.source "TextFormat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/opencensus/trace/propagation/TextFormat$NoopTextFormat;,
        Lio/opencensus/trace/propagation/TextFormat$Getter;,
        Lio/opencensus/trace/propagation/TextFormat$Setter;
    }
.end annotation


# static fields
.field private static final NOOP_TEXT_FORMAT:Lio/opencensus/trace/propagation/TextFormat$NoopTextFormat;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 84
    new-instance v0, Lio/opencensus/trace/propagation/TextFormat$NoopTextFormat;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lio/opencensus/trace/propagation/TextFormat$NoopTextFormat;-><init>(Lio/opencensus/trace/propagation/TextFormat$1;)V

    sput-object v0, Lio/opencensus/trace/propagation/TextFormat;->NOOP_TEXT_FORMAT:Lio/opencensus/trace/propagation/TextFormat$NoopTextFormat;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static getNoopTextFormat()Lio/opencensus/trace/propagation/TextFormat;
    .locals 1

    .line 177
    sget-object v0, Lio/opencensus/trace/propagation/TextFormat;->NOOP_TEXT_FORMAT:Lio/opencensus/trace/propagation/TextFormat$NoopTextFormat;

    return-object v0
.end method


# virtual methods
.method public abstract extract(Ljava/lang/Object;Lio/opencensus/trace/propagation/TextFormat$Getter;)Lio/opencensus/trace/SpanContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<C:",
            "Ljava/lang/Object;",
            ">(TC;",
            "Lio/opencensus/trace/propagation/TextFormat$Getter<",
            "TC;>;)",
            "Lio/opencensus/trace/SpanContext;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lio/opencensus/trace/propagation/SpanContextParseException;
        }
    .end annotation
.end method

.method public abstract fields()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract inject(Lio/opencensus/trace/SpanContext;Ljava/lang/Object;Lio/opencensus/trace/propagation/TextFormat$Setter;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<C:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/opencensus/trace/SpanContext;",
            "TC;",
            "Lio/opencensus/trace/propagation/TextFormat$Setter<",
            "TC;>;)V"
        }
    .end annotation
.end method
