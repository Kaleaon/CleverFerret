.class public abstract Lio/opencensus/trace/AttributeValue;
.super Ljava/lang/Object;
.source "AttributeValue.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/opencensus/trace/AttributeValue$AttributeValueDouble;,
        Lio/opencensus/trace/AttributeValue$AttributeValueLong;,
        Lio/opencensus/trace/AttributeValue$AttributeValueBoolean;,
        Lio/opencensus/trace/AttributeValue$AttributeValueString;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static booleanAttributeValue(Z)Lio/opencensus/trace/AttributeValue;
    .locals 0

    .line 52
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-static {p0}, Lio/opencensus/trace/AttributeValue$AttributeValueBoolean;->create(Ljava/lang/Boolean;)Lio/opencensus/trace/AttributeValue;

    move-result-object p0

    return-object p0
.end method

.method public static doubleAttributeValue(D)Lio/opencensus/trace/AttributeValue;
    .locals 0

    .line 74
    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    invoke-static {p0}, Lio/opencensus/trace/AttributeValue$AttributeValueDouble;->create(Ljava/lang/Double;)Lio/opencensus/trace/AttributeValue;

    move-result-object p0

    return-object p0
.end method

.method public static longAttributeValue(J)Lio/opencensus/trace/AttributeValue;
    .locals 0

    .line 63
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    invoke-static {p0}, Lio/opencensus/trace/AttributeValue$AttributeValueLong;->create(Ljava/lang/Long;)Lio/opencensus/trace/AttributeValue;

    move-result-object p0

    return-object p0
.end method

.method public static stringAttributeValue(Ljava/lang/String;)Lio/opencensus/trace/AttributeValue;
    .locals 0

    .line 41
    invoke-static {p0}, Lio/opencensus/trace/AttributeValue$AttributeValueString;->create(Ljava/lang/String;)Lio/opencensus/trace/AttributeValue;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public abstract match(Lio/opencensus/common/Function;Lio/opencensus/common/Function;Lio/opencensus/common/Function;Lio/opencensus/common/Function;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/opencensus/common/Function<",
            "-",
            "Ljava/lang/String;",
            "TT;>;",
            "Lio/opencensus/common/Function<",
            "-",
            "Ljava/lang/Boolean;",
            "TT;>;",
            "Lio/opencensus/common/Function<",
            "-",
            "Ljava/lang/Long;",
            "TT;>;",
            "Lio/opencensus/common/Function<",
            "Ljava/lang/Object;",
            "TT;>;)TT;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract match(Lio/opencensus/common/Function;Lio/opencensus/common/Function;Lio/opencensus/common/Function;Lio/opencensus/common/Function;Lio/opencensus/common/Function;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/opencensus/common/Function<",
            "-",
            "Ljava/lang/String;",
            "TT;>;",
            "Lio/opencensus/common/Function<",
            "-",
            "Ljava/lang/Boolean;",
            "TT;>;",
            "Lio/opencensus/common/Function<",
            "-",
            "Ljava/lang/Long;",
            "TT;>;",
            "Lio/opencensus/common/Function<",
            "-",
            "Ljava/lang/Double;",
            "TT;>;",
            "Lio/opencensus/common/Function<",
            "Ljava/lang/Object;",
            "TT;>;)TT;"
        }
    .end annotation
.end method
