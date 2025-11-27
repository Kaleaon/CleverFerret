.class public final Lcom/dropbox/core/v2/files/UploadSessionLookupError;
.super Ljava/lang/Object;
.source "UploadSessionLookupError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/UploadSessionLookupError$Serializer;,
        Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;
    }
.end annotation


# static fields
.field public static final CLOSED:Lcom/dropbox/core/v2/files/UploadSessionLookupError;

.field public static final CONCURRENT_SESSION_INVALID_DATA_SIZE:Lcom/dropbox/core/v2/files/UploadSessionLookupError;

.field public static final CONCURRENT_SESSION_INVALID_OFFSET:Lcom/dropbox/core/v2/files/UploadSessionLookupError;

.field public static final NOT_CLOSED:Lcom/dropbox/core/v2/files/UploadSessionLookupError;

.field public static final NOT_FOUND:Lcom/dropbox/core/v2/files/UploadSessionLookupError;

.field public static final OTHER:Lcom/dropbox/core/v2/files/UploadSessionLookupError;

.field public static final PAYLOAD_TOO_LARGE:Lcom/dropbox/core/v2/files/UploadSessionLookupError;

.field public static final TOO_LARGE:Lcom/dropbox/core/v2/files/UploadSessionLookupError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;

.field private incorrectOffsetValue:Lcom/dropbox/core/v2/files/UploadSessionOffsetError;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 92
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionLookupError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionLookupError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;->NOT_FOUND:Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/UploadSessionLookupError;->withTag(Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;)Lcom/dropbox/core/v2/files/UploadSessionLookupError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/UploadSessionLookupError;->NOT_FOUND:Lcom/dropbox/core/v2/files/UploadSessionLookupError;

    .line 97
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionLookupError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionLookupError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;->CLOSED:Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/UploadSessionLookupError;->withTag(Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;)Lcom/dropbox/core/v2/files/UploadSessionLookupError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/UploadSessionLookupError;->CLOSED:Lcom/dropbox/core/v2/files/UploadSessionLookupError;

    .line 101
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionLookupError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionLookupError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;->NOT_CLOSED:Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/UploadSessionLookupError;->withTag(Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;)Lcom/dropbox/core/v2/files/UploadSessionLookupError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/UploadSessionLookupError;->NOT_CLOSED:Lcom/dropbox/core/v2/files/UploadSessionLookupError;

    .line 106
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionLookupError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionLookupError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;->TOO_LARGE:Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/UploadSessionLookupError;->withTag(Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;)Lcom/dropbox/core/v2/files/UploadSessionLookupError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/UploadSessionLookupError;->TOO_LARGE:Lcom/dropbox/core/v2/files/UploadSessionLookupError;

    .line 111
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionLookupError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionLookupError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;->CONCURRENT_SESSION_INVALID_OFFSET:Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/UploadSessionLookupError;->withTag(Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;)Lcom/dropbox/core/v2/files/UploadSessionLookupError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/UploadSessionLookupError;->CONCURRENT_SESSION_INVALID_OFFSET:Lcom/dropbox/core/v2/files/UploadSessionLookupError;

    .line 116
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionLookupError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionLookupError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;->CONCURRENT_SESSION_INVALID_DATA_SIZE:Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/UploadSessionLookupError;->withTag(Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;)Lcom/dropbox/core/v2/files/UploadSessionLookupError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/UploadSessionLookupError;->CONCURRENT_SESSION_INVALID_DATA_SIZE:Lcom/dropbox/core/v2/files/UploadSessionLookupError;

    .line 120
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionLookupError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionLookupError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;->PAYLOAD_TOO_LARGE:Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/UploadSessionLookupError;->withTag(Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;)Lcom/dropbox/core/v2/files/UploadSessionLookupError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/UploadSessionLookupError;->PAYLOAD_TOO_LARGE:Lcom/dropbox/core/v2/files/UploadSessionLookupError;

    .line 128
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionLookupError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionLookupError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;->OTHER:Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/UploadSessionLookupError;->withTag(Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;)Lcom/dropbox/core/v2/files/UploadSessionLookupError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/UploadSessionLookupError;->OTHER:Lcom/dropbox/core/v2/files/UploadSessionLookupError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 136
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/files/UploadSessionLookupError;)Lcom/dropbox/core/v2/files/UploadSessionOffsetError;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/files/UploadSessionLookupError;->incorrectOffsetValue:Lcom/dropbox/core/v2/files/UploadSessionOffsetError;

    return-object p0
.end method

.method public static incorrectOffset(Lcom/dropbox/core/v2/files/UploadSessionOffsetError;)Lcom/dropbox/core/v2/files/UploadSessionLookupError;
    .locals 2

    if-eqz p0, :cond_0

    .line 229
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionLookupError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionLookupError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;->INCORRECT_OFFSET:Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/UploadSessionLookupError;->withTagAndIncorrectOffset(Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;Lcom/dropbox/core/v2/files/UploadSessionOffsetError;)Lcom/dropbox/core/v2/files/UploadSessionLookupError;

    move-result-object p0

    return-object p0

    .line 227
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;)Lcom/dropbox/core/v2/files/UploadSessionLookupError;
    .locals 1

    .line 145
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionLookupError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionLookupError;-><init>()V

    .line 146
    iput-object p1, v0, Lcom/dropbox/core/v2/files/UploadSessionLookupError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;

    return-object v0
.end method

.method private withTagAndIncorrectOffset(Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;Lcom/dropbox/core/v2/files/UploadSessionOffsetError;)Lcom/dropbox/core/v2/files/UploadSessionLookupError;
    .locals 1

    .line 163
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionLookupError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionLookupError;-><init>()V

    .line 164
    iput-object p1, v0, Lcom/dropbox/core/v2/files/UploadSessionLookupError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;

    .line 165
    iput-object p2, v0, Lcom/dropbox/core/v2/files/UploadSessionLookupError;->incorrectOffsetValue:Lcom/dropbox/core/v2/files/UploadSessionOffsetError;

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 347
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/files/UploadSessionLookupError;

    if-eqz v2, :cond_5

    .line 348
    check-cast p1, Lcom/dropbox/core/v2/files/UploadSessionLookupError;

    .line 349
    iget-object v2, p0, Lcom/dropbox/core/v2/files/UploadSessionLookupError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/UploadSessionLookupError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 352
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/files/UploadSessionLookupError$1;->$SwitchMap$com$dropbox$core$v2$files$UploadSessionLookupError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/files/UploadSessionLookupError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    return v1

    :pswitch_0
    return v0

    .line 356
    :pswitch_1
    iget-object v2, p0, Lcom/dropbox/core/v2/files/UploadSessionLookupError;->incorrectOffsetValue:Lcom/dropbox/core/v2/files/UploadSessionOffsetError;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/UploadSessionLookupError;->incorrectOffsetValue:Lcom/dropbox/core/v2/files/UploadSessionOffsetError;

    if-eq v2, p1, :cond_4

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/UploadSessionOffsetError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_0

    :cond_3
    return v1

    :cond_4
    :goto_0
    :pswitch_2
    return v0

    :cond_5
    return v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public getIncorrectOffsetValue()Lcom/dropbox/core/v2/files/UploadSessionOffsetError;
    .locals 3

    .line 247
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionLookupError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;->INCORRECT_OFFSET:Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;

    if-ne v0, v1, :cond_0

    .line 250
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionLookupError;->incorrectOffsetValue:Lcom/dropbox/core/v2/files/UploadSessionOffsetError;

    return-object v0

    .line 248
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.INCORRECT_OFFSET, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/UploadSessionLookupError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 332
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionLookupError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/UploadSessionLookupError;->incorrectOffsetValue:Lcom/dropbox/core/v2/files/UploadSessionOffsetError;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public isClosed()Z
    .locals 2

    .line 261
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionLookupError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;->CLOSED:Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isConcurrentSessionInvalidDataSize()Z
    .locals 2

    .line 305
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionLookupError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;->CONCURRENT_SESSION_INVALID_DATA_SIZE:Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isConcurrentSessionInvalidOffset()Z
    .locals 2

    .line 294
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionLookupError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;->CONCURRENT_SESSION_INVALID_OFFSET:Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isIncorrectOffset()Z
    .locals 2

    .line 206
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionLookupError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;->INCORRECT_OFFSET:Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isNotClosed()Z
    .locals 2

    .line 272
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionLookupError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;->NOT_CLOSED:Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isNotFound()Z
    .locals 2

    .line 195
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionLookupError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;->NOT_FOUND:Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 327
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionLookupError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;->OTHER:Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isPayloadTooLarge()Z
    .locals 2

    .line 316
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionLookupError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;->PAYLOAD_TOO_LARGE:Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTooLarge()Z
    .locals 2

    .line 283
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionLookupError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;->TOO_LARGE:Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;
    .locals 1

    .line 184
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionLookupError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionLookupError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 382
    sget-object v0, Lcom/dropbox/core/v2/files/UploadSessionLookupError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/UploadSessionLookupError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/UploadSessionLookupError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 394
    sget-object v0, Lcom/dropbox/core/v2/files/UploadSessionLookupError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/UploadSessionLookupError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/UploadSessionLookupError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
