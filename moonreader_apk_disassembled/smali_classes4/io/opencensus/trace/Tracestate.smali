.class public abstract Lio/opencensus/trace/Tracestate;
.super Ljava/lang/Object;
.source "Tracestate.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/opencensus/trace/Tracestate$Entry;,
        Lio/opencensus/trace/Tracestate$Builder;
    }
.end annotation


# static fields
.field private static final KEY_MAX_SIZE:I = 0x100

.field private static final MAX_KEY_VALUE_PAIRS:I = 0x20

.field private static final VALUE_MAX_SIZE:I = 0x100


# direct methods
.method constructor <init>()V
    .locals 0

    .line 272
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$200(Ljava/util/List;)Lio/opencensus/trace/Tracestate;
    .locals 0

    .line 45
    invoke-static {p0}, Lio/opencensus/trace/Tracestate;->create(Ljava/util/List;)Lio/opencensus/trace/Tracestate;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$300(Ljava/lang/String;)Z
    .locals 0

    .line 45
    invoke-static {p0}, Lio/opencensus/trace/Tracestate;->validateKey(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$400(Ljava/lang/String;)Z
    .locals 0

    .line 45
    invoke-static {p0}, Lio/opencensus/trace/Tracestate;->validateValue(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static builder()Lio/opencensus/trace/Tracestate$Builder;
    .locals 3

    .line 84
    new-instance v0, Lio/opencensus/trace/Tracestate$Builder;

    invoke-static {}, Lio/opencensus/trace/Tracestate$Builder;->access$000()Lio/opencensus/trace/Tracestate;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lio/opencensus/trace/Tracestate$Builder;-><init>(Lio/opencensus/trace/Tracestate;Lio/opencensus/trace/Tracestate$1;)V

    return-object v0
.end method

.method private static create(Ljava/util/List;)Lio/opencensus/trace/Tracestate;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lio/opencensus/trace/Tracestate$Entry;",
            ">;)",
            "Lio/opencensus/trace/Tracestate;"
        }
    .end annotation

    .line 268
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    const/16 v1, 0x20

    if-gt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "Invalid size"

    invoke-static {v0, v1}, Lio/opencensus/internal/Utils;->checkState(ZLjava/lang/Object;)V

    .line 269
    new-instance v0, Lio/opencensus/trace/AutoValue_Tracestate;

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    invoke-direct {v0, p0}, Lio/opencensus/trace/AutoValue_Tracestate;-><init>(Ljava/util/List;)V

    return-object v0
.end method

.method private static validateKey(Ljava/lang/String;)Z
    .locals 7

    .line 232
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x100

    const/4 v2, 0x0

    if-gt v0, v1, :cond_5

    .line 233
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_5

    .line 234
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x61

    if-lt v0, v1, :cond_5

    .line 235
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v3, 0x7a

    if-le v0, v3, :cond_0

    goto :goto_1

    :cond_0
    const/4 v0, 0x1

    const/4 v4, 0x1

    .line 238
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v4, v5, :cond_4

    .line 239
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-lt v5, v1, :cond_1

    if-le v5, v3, :cond_3

    :cond_1
    const/16 v6, 0x30

    if-lt v5, v6, :cond_2

    const/16 v6, 0x39

    if-le v5, v6, :cond_3

    :cond_2
    const/16 v6, 0x5f

    if-eq v5, v6, :cond_3

    const/16 v6, 0x2d

    if-eq v5, v6, :cond_3

    const/16 v6, 0x2a

    if-eq v5, v6, :cond_3

    const/16 v6, 0x2f

    if-eq v5, v6, :cond_3

    return v2

    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_4
    return v0

    :cond_5
    :goto_1
    return v2
.end method

.method private static validateValue(Ljava/lang/String;)Z
    .locals 6

    .line 255
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x100

    const/4 v2, 0x0

    if-gt v0, v1, :cond_4

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v3, 0x20

    if-ne v0, v3, :cond_0

    goto :goto_2

    :cond_0
    const/4 v0, 0x0

    .line 258
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v0, v4, :cond_3

    .line 259
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x2c

    if-eq v4, v5, :cond_2

    const/16 v5, 0x3d

    if-eq v4, v5, :cond_2

    if-lt v4, v3, :cond_2

    const/16 v5, 0x7e

    if-le v4, v5, :cond_1

    goto :goto_1

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    return v2

    :cond_3
    return v1

    :cond_4
    :goto_2
    return v2
.end method


# virtual methods
.method public get(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 61
    invoke-virtual {p0}, Lio/opencensus/trace/Tracestate;->getEntries()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/opencensus/trace/Tracestate$Entry;

    .line 62
    invoke-virtual {v1}, Lio/opencensus/trace/Tracestate$Entry;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 63
    invoke-virtual {v1}, Lio/opencensus/trace/Tracestate$Entry;->getValue()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public abstract getEntries()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lio/opencensus/trace/Tracestate$Entry;",
            ">;"
        }
    .end annotation
.end method

.method public toBuilder()Lio/opencensus/trace/Tracestate$Builder;
    .locals 2

    .line 94
    new-instance v0, Lio/opencensus/trace/Tracestate$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lio/opencensus/trace/Tracestate$Builder;-><init>(Lio/opencensus/trace/Tracestate;Lio/opencensus/trace/Tracestate$1;)V

    return-object v0
.end method
