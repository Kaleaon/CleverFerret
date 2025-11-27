.class public final Lio/opencensus/contrib/http/util/HttpTraceUtil;
.super Ljava/lang/Object;
.source "HttpTraceUtil.java"


# static fields
.field private static final STATUS_100:Lio/opencensus/trace/Status;

.field private static final STATUS_101:Lio/opencensus/trace/Status;

.field private static final STATUS_402:Lio/opencensus/trace/Status;

.field private static final STATUS_405:Lio/opencensus/trace/Status;

.field private static final STATUS_406:Lio/opencensus/trace/Status;

.field private static final STATUS_407:Lio/opencensus/trace/Status;

.field private static final STATUS_408:Lio/opencensus/trace/Status;

.field private static final STATUS_409:Lio/opencensus/trace/Status;

.field private static final STATUS_410:Lio/opencensus/trace/Status;

.field private static final STATUS_411:Lio/opencensus/trace/Status;

.field private static final STATUS_412:Lio/opencensus/trace/Status;

.field private static final STATUS_413:Lio/opencensus/trace/Status;

.field private static final STATUS_414:Lio/opencensus/trace/Status;

.field private static final STATUS_415:Lio/opencensus/trace/Status;

.field private static final STATUS_416:Lio/opencensus/trace/Status;

.field private static final STATUS_417:Lio/opencensus/trace/Status;

.field private static final STATUS_500:Lio/opencensus/trace/Status;

.field private static final STATUS_502:Lio/opencensus/trace/Status;

.field private static final STATUS_505:Lio/opencensus/trace/Status;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 30
    sget-object v0, Lio/opencensus/trace/Status;->UNKNOWN:Lio/opencensus/trace/Status;

    const-string v1, "Continue"

    invoke-virtual {v0, v1}, Lio/opencensus/trace/Status;->withDescription(Ljava/lang/String;)Lio/opencensus/trace/Status;

    move-result-object v0

    sput-object v0, Lio/opencensus/contrib/http/util/HttpTraceUtil;->STATUS_100:Lio/opencensus/trace/Status;

    .line 31
    sget-object v0, Lio/opencensus/trace/Status;->UNKNOWN:Lio/opencensus/trace/Status;

    const-string v1, "Switching Protocols"

    invoke-virtual {v0, v1}, Lio/opencensus/trace/Status;->withDescription(Ljava/lang/String;)Lio/opencensus/trace/Status;

    move-result-object v0

    sput-object v0, Lio/opencensus/contrib/http/util/HttpTraceUtil;->STATUS_101:Lio/opencensus/trace/Status;

    .line 32
    sget-object v0, Lio/opencensus/trace/Status;->UNKNOWN:Lio/opencensus/trace/Status;

    const-string v1, "Payment Required"

    invoke-virtual {v0, v1}, Lio/opencensus/trace/Status;->withDescription(Ljava/lang/String;)Lio/opencensus/trace/Status;

    move-result-object v0

    sput-object v0, Lio/opencensus/contrib/http/util/HttpTraceUtil;->STATUS_402:Lio/opencensus/trace/Status;

    .line 33
    sget-object v0, Lio/opencensus/trace/Status;->UNKNOWN:Lio/opencensus/trace/Status;

    const-string v1, "Method Not Allowed"

    invoke-virtual {v0, v1}, Lio/opencensus/trace/Status;->withDescription(Ljava/lang/String;)Lio/opencensus/trace/Status;

    move-result-object v0

    sput-object v0, Lio/opencensus/contrib/http/util/HttpTraceUtil;->STATUS_405:Lio/opencensus/trace/Status;

    .line 34
    sget-object v0, Lio/opencensus/trace/Status;->UNKNOWN:Lio/opencensus/trace/Status;

    const-string v1, "Not Acceptable"

    invoke-virtual {v0, v1}, Lio/opencensus/trace/Status;->withDescription(Ljava/lang/String;)Lio/opencensus/trace/Status;

    move-result-object v0

    sput-object v0, Lio/opencensus/contrib/http/util/HttpTraceUtil;->STATUS_406:Lio/opencensus/trace/Status;

    .line 35
    sget-object v0, Lio/opencensus/trace/Status;->UNKNOWN:Lio/opencensus/trace/Status;

    const-string v1, "Proxy Authentication Required"

    .line 36
    invoke-virtual {v0, v1}, Lio/opencensus/trace/Status;->withDescription(Ljava/lang/String;)Lio/opencensus/trace/Status;

    move-result-object v0

    sput-object v0, Lio/opencensus/contrib/http/util/HttpTraceUtil;->STATUS_407:Lio/opencensus/trace/Status;

    .line 37
    sget-object v0, Lio/opencensus/trace/Status;->UNKNOWN:Lio/opencensus/trace/Status;

    const-string v1, "Request Time-out"

    invoke-virtual {v0, v1}, Lio/opencensus/trace/Status;->withDescription(Ljava/lang/String;)Lio/opencensus/trace/Status;

    move-result-object v0

    sput-object v0, Lio/opencensus/contrib/http/util/HttpTraceUtil;->STATUS_408:Lio/opencensus/trace/Status;

    .line 38
    sget-object v0, Lio/opencensus/trace/Status;->UNKNOWN:Lio/opencensus/trace/Status;

    const-string v1, "Conflict"

    invoke-virtual {v0, v1}, Lio/opencensus/trace/Status;->withDescription(Ljava/lang/String;)Lio/opencensus/trace/Status;

    move-result-object v0

    sput-object v0, Lio/opencensus/contrib/http/util/HttpTraceUtil;->STATUS_409:Lio/opencensus/trace/Status;

    .line 39
    sget-object v0, Lio/opencensus/trace/Status;->UNKNOWN:Lio/opencensus/trace/Status;

    const-string v1, "Gone"

    invoke-virtual {v0, v1}, Lio/opencensus/trace/Status;->withDescription(Ljava/lang/String;)Lio/opencensus/trace/Status;

    move-result-object v0

    sput-object v0, Lio/opencensus/contrib/http/util/HttpTraceUtil;->STATUS_410:Lio/opencensus/trace/Status;

    .line 40
    sget-object v0, Lio/opencensus/trace/Status;->UNKNOWN:Lio/opencensus/trace/Status;

    const-string v1, "Length Required"

    invoke-virtual {v0, v1}, Lio/opencensus/trace/Status;->withDescription(Ljava/lang/String;)Lio/opencensus/trace/Status;

    move-result-object v0

    sput-object v0, Lio/opencensus/contrib/http/util/HttpTraceUtil;->STATUS_411:Lio/opencensus/trace/Status;

    .line 41
    sget-object v0, Lio/opencensus/trace/Status;->UNKNOWN:Lio/opencensus/trace/Status;

    const-string v1, "Precondition Failed"

    invoke-virtual {v0, v1}, Lio/opencensus/trace/Status;->withDescription(Ljava/lang/String;)Lio/opencensus/trace/Status;

    move-result-object v0

    sput-object v0, Lio/opencensus/contrib/http/util/HttpTraceUtil;->STATUS_412:Lio/opencensus/trace/Status;

    .line 42
    sget-object v0, Lio/opencensus/trace/Status;->UNKNOWN:Lio/opencensus/trace/Status;

    const-string v1, "Request Entity Too Large"

    .line 43
    invoke-virtual {v0, v1}, Lio/opencensus/trace/Status;->withDescription(Ljava/lang/String;)Lio/opencensus/trace/Status;

    move-result-object v0

    sput-object v0, Lio/opencensus/contrib/http/util/HttpTraceUtil;->STATUS_413:Lio/opencensus/trace/Status;

    .line 44
    sget-object v0, Lio/opencensus/trace/Status;->UNKNOWN:Lio/opencensus/trace/Status;

    const-string v1, "Request-URI Too Large"

    invoke-virtual {v0, v1}, Lio/opencensus/trace/Status;->withDescription(Ljava/lang/String;)Lio/opencensus/trace/Status;

    move-result-object v0

    sput-object v0, Lio/opencensus/contrib/http/util/HttpTraceUtil;->STATUS_414:Lio/opencensus/trace/Status;

    .line 45
    sget-object v0, Lio/opencensus/trace/Status;->UNKNOWN:Lio/opencensus/trace/Status;

    const-string v1, "Unsupported Media Type"

    invoke-virtual {v0, v1}, Lio/opencensus/trace/Status;->withDescription(Ljava/lang/String;)Lio/opencensus/trace/Status;

    move-result-object v0

    sput-object v0, Lio/opencensus/contrib/http/util/HttpTraceUtil;->STATUS_415:Lio/opencensus/trace/Status;

    .line 46
    sget-object v0, Lio/opencensus/trace/Status;->UNKNOWN:Lio/opencensus/trace/Status;

    const-string v1, "Requested range not satisfiable"

    .line 47
    invoke-virtual {v0, v1}, Lio/opencensus/trace/Status;->withDescription(Ljava/lang/String;)Lio/opencensus/trace/Status;

    move-result-object v0

    sput-object v0, Lio/opencensus/contrib/http/util/HttpTraceUtil;->STATUS_416:Lio/opencensus/trace/Status;

    .line 48
    sget-object v0, Lio/opencensus/trace/Status;->UNKNOWN:Lio/opencensus/trace/Status;

    const-string v1, "Expectation Failed"

    invoke-virtual {v0, v1}, Lio/opencensus/trace/Status;->withDescription(Ljava/lang/String;)Lio/opencensus/trace/Status;

    move-result-object v0

    sput-object v0, Lio/opencensus/contrib/http/util/HttpTraceUtil;->STATUS_417:Lio/opencensus/trace/Status;

    .line 49
    sget-object v0, Lio/opencensus/trace/Status;->UNKNOWN:Lio/opencensus/trace/Status;

    const-string v1, "Internal Server Error"

    invoke-virtual {v0, v1}, Lio/opencensus/trace/Status;->withDescription(Ljava/lang/String;)Lio/opencensus/trace/Status;

    move-result-object v0

    sput-object v0, Lio/opencensus/contrib/http/util/HttpTraceUtil;->STATUS_500:Lio/opencensus/trace/Status;

    .line 50
    sget-object v0, Lio/opencensus/trace/Status;->UNKNOWN:Lio/opencensus/trace/Status;

    const-string v1, "Bad Gateway"

    invoke-virtual {v0, v1}, Lio/opencensus/trace/Status;->withDescription(Ljava/lang/String;)Lio/opencensus/trace/Status;

    move-result-object v0

    sput-object v0, Lio/opencensus/contrib/http/util/HttpTraceUtil;->STATUS_502:Lio/opencensus/trace/Status;

    .line 51
    sget-object v0, Lio/opencensus/trace/Status;->UNKNOWN:Lio/opencensus/trace/Status;

    const-string v1, "HTTP Version not supported"

    .line 52
    invoke-virtual {v0, v1}, Lio/opencensus/trace/Status;->withDescription(Ljava/lang/String;)Lio/opencensus/trace/Status;

    move-result-object v0

    sput-object v0, Lio/opencensus/contrib/http/util/HttpTraceUtil;->STATUS_505:Lio/opencensus/trace/Status;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final parseResponseStatus(ILjava/lang/Throwable;)Lio/opencensus/trace/Status;
    .locals 1
    .param p1    # Ljava/lang/Throwable;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    if-eqz p1, :cond_0

    .line 75
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    .line 77
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :cond_1
    :goto_0
    if-nez p0, :cond_2

    .line 83
    sget-object p0, Lio/opencensus/trace/Status;->UNKNOWN:Lio/opencensus/trace/Status;

    invoke-virtual {p0, v0}, Lio/opencensus/trace/Status;->withDescription(Ljava/lang/String;)Lio/opencensus/trace/Status;

    move-result-object p0

    return-object p0

    :cond_2
    const/16 p1, 0xc8

    if-lt p0, p1, :cond_3

    const/16 p1, 0x190

    if-ge p0, p1, :cond_3

    .line 86
    sget-object p0, Lio/opencensus/trace/Status;->OK:Lio/opencensus/trace/Status;

    return-object p0

    :cond_3
    const/16 p1, 0x64

    if-eq p0, p1, :cond_6

    const/16 p1, 0x65

    if-eq p0, p1, :cond_5

    const/16 p1, 0x1ad

    if-eq p0, p1, :cond_4

    packed-switch p0, :pswitch_data_0

    packed-switch p0, :pswitch_data_1

    .line 145
    sget-object p0, Lio/opencensus/trace/Status;->UNKNOWN:Lio/opencensus/trace/Status;

    invoke-virtual {p0, v0}, Lio/opencensus/trace/Status;->withDescription(Ljava/lang/String;)Lio/opencensus/trace/Status;

    move-result-object p0

    return-object p0

    .line 143
    :pswitch_0
    sget-object p0, Lio/opencensus/contrib/http/util/HttpTraceUtil;->STATUS_505:Lio/opencensus/trace/Status;

    return-object p0

    .line 141
    :pswitch_1
    sget-object p0, Lio/opencensus/trace/Status;->DEADLINE_EXCEEDED:Lio/opencensus/trace/Status;

    invoke-virtual {p0, v0}, Lio/opencensus/trace/Status;->withDescription(Ljava/lang/String;)Lio/opencensus/trace/Status;

    move-result-object p0

    return-object p0

    .line 139
    :pswitch_2
    sget-object p0, Lio/opencensus/trace/Status;->UNAVAILABLE:Lio/opencensus/trace/Status;

    invoke-virtual {p0, v0}, Lio/opencensus/trace/Status;->withDescription(Ljava/lang/String;)Lio/opencensus/trace/Status;

    move-result-object p0

    return-object p0

    .line 137
    :pswitch_3
    sget-object p0, Lio/opencensus/contrib/http/util/HttpTraceUtil;->STATUS_502:Lio/opencensus/trace/Status;

    return-object p0

    .line 135
    :pswitch_4
    sget-object p0, Lio/opencensus/trace/Status;->UNIMPLEMENTED:Lio/opencensus/trace/Status;

    invoke-virtual {p0, v0}, Lio/opencensus/trace/Status;->withDescription(Ljava/lang/String;)Lio/opencensus/trace/Status;

    move-result-object p0

    return-object p0

    .line 133
    :pswitch_5
    sget-object p0, Lio/opencensus/contrib/http/util/HttpTraceUtil;->STATUS_500:Lio/opencensus/trace/Status;

    return-object p0

    .line 129
    :pswitch_6
    sget-object p0, Lio/opencensus/contrib/http/util/HttpTraceUtil;->STATUS_417:Lio/opencensus/trace/Status;

    return-object p0

    .line 127
    :pswitch_7
    sget-object p0, Lio/opencensus/contrib/http/util/HttpTraceUtil;->STATUS_416:Lio/opencensus/trace/Status;

    return-object p0

    .line 125
    :pswitch_8
    sget-object p0, Lio/opencensus/contrib/http/util/HttpTraceUtil;->STATUS_415:Lio/opencensus/trace/Status;

    return-object p0

    .line 123
    :pswitch_9
    sget-object p0, Lio/opencensus/contrib/http/util/HttpTraceUtil;->STATUS_414:Lio/opencensus/trace/Status;

    return-object p0

    .line 121
    :pswitch_a
    sget-object p0, Lio/opencensus/contrib/http/util/HttpTraceUtil;->STATUS_413:Lio/opencensus/trace/Status;

    return-object p0

    .line 119
    :pswitch_b
    sget-object p0, Lio/opencensus/contrib/http/util/HttpTraceUtil;->STATUS_412:Lio/opencensus/trace/Status;

    return-object p0

    .line 117
    :pswitch_c
    sget-object p0, Lio/opencensus/contrib/http/util/HttpTraceUtil;->STATUS_411:Lio/opencensus/trace/Status;

    return-object p0

    .line 115
    :pswitch_d
    sget-object p0, Lio/opencensus/contrib/http/util/HttpTraceUtil;->STATUS_410:Lio/opencensus/trace/Status;

    return-object p0

    .line 113
    :pswitch_e
    sget-object p0, Lio/opencensus/contrib/http/util/HttpTraceUtil;->STATUS_409:Lio/opencensus/trace/Status;

    return-object p0

    .line 111
    :pswitch_f
    sget-object p0, Lio/opencensus/contrib/http/util/HttpTraceUtil;->STATUS_408:Lio/opencensus/trace/Status;

    return-object p0

    .line 109
    :pswitch_10
    sget-object p0, Lio/opencensus/contrib/http/util/HttpTraceUtil;->STATUS_407:Lio/opencensus/trace/Status;

    return-object p0

    .line 107
    :pswitch_11
    sget-object p0, Lio/opencensus/contrib/http/util/HttpTraceUtil;->STATUS_406:Lio/opencensus/trace/Status;

    return-object p0

    .line 105
    :pswitch_12
    sget-object p0, Lio/opencensus/contrib/http/util/HttpTraceUtil;->STATUS_405:Lio/opencensus/trace/Status;

    return-object p0

    .line 103
    :pswitch_13
    sget-object p0, Lio/opencensus/trace/Status;->NOT_FOUND:Lio/opencensus/trace/Status;

    invoke-virtual {p0, v0}, Lio/opencensus/trace/Status;->withDescription(Ljava/lang/String;)Lio/opencensus/trace/Status;

    move-result-object p0

    return-object p0

    .line 101
    :pswitch_14
    sget-object p0, Lio/opencensus/trace/Status;->PERMISSION_DENIED:Lio/opencensus/trace/Status;

    invoke-virtual {p0, v0}, Lio/opencensus/trace/Status;->withDescription(Ljava/lang/String;)Lio/opencensus/trace/Status;

    move-result-object p0

    return-object p0

    .line 99
    :pswitch_15
    sget-object p0, Lio/opencensus/contrib/http/util/HttpTraceUtil;->STATUS_402:Lio/opencensus/trace/Status;

    return-object p0

    .line 97
    :pswitch_16
    sget-object p0, Lio/opencensus/trace/Status;->UNAUTHENTICATED:Lio/opencensus/trace/Status;

    invoke-virtual {p0, v0}, Lio/opencensus/trace/Status;->withDescription(Ljava/lang/String;)Lio/opencensus/trace/Status;

    move-result-object p0

    return-object p0

    .line 95
    :pswitch_17
    sget-object p0, Lio/opencensus/trace/Status;->INVALID_ARGUMENT:Lio/opencensus/trace/Status;

    invoke-virtual {p0, v0}, Lio/opencensus/trace/Status;->withDescription(Ljava/lang/String;)Lio/opencensus/trace/Status;

    move-result-object p0

    return-object p0

    .line 131
    :cond_4
    sget-object p0, Lio/opencensus/trace/Status;->RESOURCE_EXHAUSTED:Lio/opencensus/trace/Status;

    invoke-virtual {p0, v0}, Lio/opencensus/trace/Status;->withDescription(Ljava/lang/String;)Lio/opencensus/trace/Status;

    move-result-object p0

    return-object p0

    .line 93
    :cond_5
    sget-object p0, Lio/opencensus/contrib/http/util/HttpTraceUtil;->STATUS_101:Lio/opencensus/trace/Status;

    return-object p0

    .line 91
    :cond_6
    sget-object p0, Lio/opencensus/contrib/http/util/HttpTraceUtil;->STATUS_100:Lio/opencensus/trace/Status;

    return-object p0

    :pswitch_data_0
    .packed-switch 0x190
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1f4
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
