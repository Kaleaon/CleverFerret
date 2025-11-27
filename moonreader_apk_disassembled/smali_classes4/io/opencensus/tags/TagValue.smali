.class public abstract Lio/opencensus/tags/TagValue;
.super Ljava/lang/Object;
.source "TagValue.java"


# static fields
.field public static final MAX_LENGTH:I = 0xff


# direct methods
.method constructor <init>()V
    .locals 0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Ljava/lang/String;)Lio/opencensus/tags/TagValue;
    .locals 3

    .line 58
    invoke-static {p0}, Lio/opencensus/tags/TagValue;->isValid(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p0, v1, v2

    const-string v2, "Invalid TagValue: %s"

    invoke-static {v0, v2, v1}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 59
    new-instance v0, Lio/opencensus/tags/AutoValue_TagValue;

    invoke-direct {v0, p0}, Lio/opencensus/tags/AutoValue_TagValue;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method private static isValid(Ljava/lang/String;)Z
    .locals 2

    .line 77
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_0

    invoke-static {p0}, Lio/opencensus/internal/StringUtils;->isPrintableString(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public abstract asString()Ljava/lang/String;
.end method
