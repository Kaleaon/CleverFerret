.class public final Lio/opencensus/trace/TraceOptions;
.super Ljava/lang/Object;
.source "TraceOptions.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/opencensus/trace/TraceOptions$Builder;
    }
.end annotation


# static fields
.field private static final BASE16_SIZE:I = 0x2

.field public static final DEFAULT:Lio/opencensus/trace/TraceOptions;

.field private static final DEFAULT_OPTIONS:B = 0x0t

.field private static final IS_SAMPLED:B = 0x1t

.field public static final SIZE:I = 0x1


# instance fields
.field private final options:B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    .line 53
    invoke-static {v0}, Lio/opencensus/trace/TraceOptions;->fromByte(B)Lio/opencensus/trace/TraceOptions;

    move-result-object v0

    sput-object v0, Lio/opencensus/trace/TraceOptions;->DEFAULT:Lio/opencensus/trace/TraceOptions;

    return-void
.end method

.method private constructor <init>(B)V
    .locals 0

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    iput-byte p1, p0, Lio/opencensus/trace/TraceOptions;->options:B

    return-void
.end method

.method public static builder()Lio/opencensus/trace/TraceOptions$Builder;
    .locals 3

    .line 214
    new-instance v0, Lio/opencensus/trace/TraceOptions$Builder;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lio/opencensus/trace/TraceOptions$Builder;-><init>(BLio/opencensus/trace/TraceOptions$1;)V

    return-object v0
.end method

.method public static builder(Lio/opencensus/trace/TraceOptions;)Lio/opencensus/trace/TraceOptions$Builder;
    .locals 2

    .line 225
    new-instance v0, Lio/opencensus/trace/TraceOptions$Builder;

    iget-byte p0, p0, Lio/opencensus/trace/TraceOptions;->options:B

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lio/opencensus/trace/TraceOptions$Builder;-><init>(BLio/opencensus/trace/TraceOptions$1;)V

    return-object v0
.end method

.method public static fromByte(B)Lio/opencensus/trace/TraceOptions;
    .locals 1

    .line 116
    new-instance v0, Lio/opencensus/trace/TraceOptions;

    invoke-direct {v0, p0}, Lio/opencensus/trace/TraceOptions;-><init>(B)V

    return-object v0
.end method

.method public static fromBytes([B)Lio/opencensus/trace/TraceOptions;
    .locals 6
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 81
    const-string v0, "buffer"

    invoke-static {p0, v0}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    array-length v0, p0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 83
    :goto_0
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    array-length v4, p0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v3, v5, v1

    aput-object v4, v5, v2

    .line 82
    const-string v2, "Invalid size: expected %s, got %s"

    invoke-static {v0, v2, v5}, Lio/opencensus/internal/Utils;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 84
    aget-byte p0, p0, v1

    invoke-static {p0}, Lio/opencensus/trace/TraceOptions;->fromByte(B)Lio/opencensus/trace/TraceOptions;

    move-result-object p0

    return-object p0
.end method

.method public static fromBytes([BI)Lio/opencensus/trace/TraceOptions;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 103
    array-length v0, p0

    invoke-static {p1, v0}, Lio/opencensus/internal/Utils;->checkIndex(II)V

    .line 104
    aget-byte p0, p0, p1

    invoke-static {p0}, Lio/opencensus/trace/TraceOptions;->fromByte(B)Lio/opencensus/trace/TraceOptions;

    move-result-object p0

    return-object p0
.end method

.method public static fromLowerBase16(Ljava/lang/CharSequence;I)Lio/opencensus/trace/TraceOptions;
    .locals 1

    .line 132
    new-instance v0, Lio/opencensus/trace/TraceOptions;

    invoke-static {p0, p1}, Lio/opencensus/trace/BigendianEncoding;->byteFromBase16String(Ljava/lang/CharSequence;I)B

    move-result p0

    invoke-direct {v0, p0}, Lio/opencensus/trace/TraceOptions;-><init>(B)V

    return-object v0
.end method

.method private hasOption(I)Z
    .locals 1

    .line 322
    iget-byte v0, p0, Lio/opencensus/trace/TraceOptions;->options:B

    and-int/2addr p1, v0

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method


# virtual methods
.method public copyBytesTo([BI)V
    .locals 1

    .line 177
    array-length v0, p1

    invoke-static {p2, v0}, Lio/opencensus/internal/Utils;->checkIndex(II)V

    .line 178
    iget-byte v0, p0, Lio/opencensus/trace/TraceOptions;->options:B

    aput-byte v0, p1, p2

    return-void
.end method

.method public copyLowerBase16To([CI)V
    .locals 1

    .line 192
    iget-byte v0, p0, Lio/opencensus/trace/TraceOptions;->options:B

    invoke-static {v0, p1, p2}, Lio/opencensus/trace/BigendianEncoding;->byteToBase16String(B[CI)V

    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 245
    :cond_0
    instance-of v1, p1, Lio/opencensus/trace/TraceOptions;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 249
    :cond_1
    check-cast p1, Lio/opencensus/trace/TraceOptions;

    .line 250
    iget-byte v1, p0, Lio/opencensus/trace/TraceOptions;->options:B

    iget-byte p1, p1, Lio/opencensus/trace/TraceOptions;->options:B

    if-ne v1, p1, :cond_2

    return v0

    :cond_2
    return v2
.end method

.method public getByte()B
    .locals 1

    .line 142
    iget-byte v0, p0, Lio/opencensus/trace/TraceOptions;->options:B

    return v0
.end method

.method public getBytes()[B
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 155
    iget-byte v0, p0, Lio/opencensus/trace/TraceOptions;->options:B

    const/4 v1, 0x1

    new-array v1, v1, [B

    const/4 v2, 0x0

    aput-byte v0, v1, v2

    return-object v1
.end method

.method getOptions()B
    .locals 1

    .line 318
    iget-byte v0, p0, Lio/opencensus/trace/TraceOptions;->options:B

    return v0
.end method

.method public hashCode()I
    .locals 3

    .line 255
    iget-byte v0, p0, Lio/opencensus/trace/TraceOptions;->options:B

    const/4 v1, 0x1

    new-array v1, v1, [B

    const/4 v2, 0x0

    aput-byte v0, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->hashCode([B)I

    move-result v0

    return v0
.end method

.method public isSampled()Z
    .locals 1

    const/4 v0, 0x1

    .line 236
    invoke-direct {p0, v0}, Lio/opencensus/trace/TraceOptions;->hasOption(I)Z

    move-result v0

    return v0
.end method

.method public toLowerBase16()Ljava/lang/String;
    .locals 2

    const/4 v0, 0x2

    .line 202
    new-array v0, v0, [C

    const/4 v1, 0x0

    .line 203
    invoke-virtual {p0, v0, v1}, Lio/opencensus/trace/TraceOptions;->copyLowerBase16To([CI)V

    .line 204
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v0}, Ljava/lang/String;-><init>([C)V

    return-object v1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 260
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "TraceOptions{sampled="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lio/opencensus/trace/TraceOptions;->isSampled()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
