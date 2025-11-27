.class public abstract Lio/opencensus/trace/Annotation;
.super Ljava/lang/Object;
.source "Annotation.java"


# static fields
.field private static final EMPTY_ATTRIBUTES:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lio/opencensus/trace/AttributeValue;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 35
    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lio/opencensus/trace/Annotation;->EMPTY_ATTRIBUTES:Ljava/util/Map;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static fromDescription(Ljava/lang/String;)Lio/opencensus/trace/Annotation;
    .locals 2

    .line 46
    new-instance v0, Lio/opencensus/trace/AutoValue_Annotation;

    sget-object v1, Lio/opencensus/trace/Annotation;->EMPTY_ATTRIBUTES:Ljava/util/Map;

    invoke-direct {v0, p0, v1}, Lio/opencensus/trace/AutoValue_Annotation;-><init>(Ljava/lang/String;Ljava/util/Map;)V

    return-object v0
.end method

.method public static fromDescriptionAndAttributes(Ljava/lang/String;Ljava/util/Map;)Lio/opencensus/trace/Annotation;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lio/opencensus/trace/AttributeValue;",
            ">;)",
            "Lio/opencensus/trace/Annotation;"
        }
    .end annotation

    .line 60
    new-instance v0, Lio/opencensus/trace/AutoValue_Annotation;

    new-instance v1, Ljava/util/HashMap;

    const-string v2, "attributes"

    .line 63
    invoke-static {p1, v2}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map;

    invoke-direct {v1, p1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 62
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    invoke-direct {v0, p0, p1}, Lio/opencensus/trace/AutoValue_Annotation;-><init>(Ljava/lang/String;Ljava/util/Map;)V

    return-object v0
.end method


# virtual methods
.method public abstract getAttributes()Ljava/util/Map;
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

.method public abstract getDescription()Ljava/lang/String;
.end method
