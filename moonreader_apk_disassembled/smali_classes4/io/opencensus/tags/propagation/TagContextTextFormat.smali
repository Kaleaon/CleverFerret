.class public abstract Lio/opencensus/tags/propagation/TagContextTextFormat;
.super Ljava/lang/Object;
.source "TagContextTextFormat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/opencensus/tags/propagation/TagContextTextFormat$Getter;,
        Lio/opencensus/tags/propagation/TagContextTextFormat$Setter;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract extract(Ljava/lang/Object;Lio/opencensus/tags/propagation/TagContextTextFormat$Getter;)Lio/opencensus/tags/TagContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<C:",
            "Ljava/lang/Object;",
            ">(TC;",
            "Lio/opencensus/tags/propagation/TagContextTextFormat$Getter<",
            "TC;>;)",
            "Lio/opencensus/tags/TagContext;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lio/opencensus/tags/propagation/TagContextDeserializationException;
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

.method public abstract inject(Lio/opencensus/tags/TagContext;Ljava/lang/Object;Lio/opencensus/tags/propagation/TagContextTextFormat$Setter;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<C:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/opencensus/tags/TagContext;",
            "TC;",
            "Lio/opencensus/tags/propagation/TagContextTextFormat$Setter<",
            "TC;>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lio/opencensus/tags/propagation/TagContextSerializationException;
        }
    .end annotation
.end method
