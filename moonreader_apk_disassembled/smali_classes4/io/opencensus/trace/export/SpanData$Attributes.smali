.class public abstract Lio/opencensus/trace/export/SpanData$Attributes;
.super Ljava/lang/Object;
.source "SpanData.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/trace/export/SpanData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Attributes"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 434
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Ljava/util/Map;I)Lio/opencensus/trace/export/SpanData$Attributes;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lio/opencensus/trace/AttributeValue;",
            ">;I)",
            "Lio/opencensus/trace/export/SpanData$Attributes;"
        }
    .end annotation

    .line 411
    new-instance v0, Lio/opencensus/trace/export/AutoValue_SpanData_Attributes;

    new-instance v1, Ljava/util/HashMap;

    const-string v2, "attributeMap"

    .line 414
    invoke-static {p0, v2}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    invoke-direct {v1, p0}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 412
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p0

    invoke-direct {v0, p0, p1}, Lio/opencensus/trace/export/AutoValue_SpanData_Attributes;-><init>(Ljava/util/Map;I)V

    return-object v0
.end method


# virtual methods
.method public abstract getAttributeMap()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lio/opencensus/trace/AttributeValue;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getDroppedAttributesCount()I
.end method
