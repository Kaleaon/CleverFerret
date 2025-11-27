.class public final Lcom/dropbox/core/v2/files/UploadSessionAppendError;
.super Ljava/lang/Object;
.source "UploadSessionAppendError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/UploadSessionAppendError$Serializer;,
        Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;
    }
.end annotation


# static fields
.field public static final CLOSED:Lcom/dropbox/core/v2/files/UploadSessionAppendError;

.field public static final CONCURRENT_SESSION_INVALID_DATA_SIZE:Lcom/dropbox/core/v2/files/UploadSessionAppendError;

.field public static final CONCURRENT_SESSION_INVALID_OFFSET:Lcom/dropbox/core/v2/files/UploadSessionAppendError;

.field public static final CONTENT_HASH_MISMATCH:Lcom/dropbox/core/v2/files/UploadSessionAppendError;

.field public static final NOT_CLOSED:Lcom/dropbox/core/v2/files/UploadSessionAppendError;

.field public static final NOT_FOUND:Lcom/dropbox/core/v2/files/UploadSessionAppendError;

.field public static final OTHER:Lcom/dropbox/core/v2/files/UploadSessionAppendError;

.field public static final PAYLOAD_TOO_LARGE:Lcom/dropbox/core/v2/files/UploadSessionAppendError;

.field public static final TOO_LARGE:Lcom/dropbox/core/v2/files/UploadSessionAppendError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

.field private incorrectOffsetValue:Lcom/dropbox/core/v2/files/UploadSessionOffsetError;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 93
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionAppendError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;->NOT_FOUND:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->withTag(Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;)Lcom/dropbox/core/v2/files/UploadSessionAppendError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->NOT_FOUND:Lcom/dropbox/core/v2/files/UploadSessionAppendError;

    .line 98
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionAppendError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;->CLOSED:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->withTag(Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;)Lcom/dropbox/core/v2/files/UploadSessionAppendError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->CLOSED:Lcom/dropbox/core/v2/files/UploadSessionAppendError;

    .line 102
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionAppendError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;->NOT_CLOSED:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->withTag(Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;)Lcom/dropbox/core/v2/files/UploadSessionAppendError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->NOT_CLOSED:Lcom/dropbox/core/v2/files/UploadSessionAppendError;

    .line 107
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionAppendError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;->TOO_LARGE:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->withTag(Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;)Lcom/dropbox/core/v2/files/UploadSessionAppendError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->TOO_LARGE:Lcom/dropbox/core/v2/files/UploadSessionAppendError;

    .line 112
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionAppendError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;->CONCURRENT_SESSION_INVALID_OFFSET:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->withTag(Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;)Lcom/dropbox/core/v2/files/UploadSessionAppendError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->CONCURRENT_SESSION_INVALID_OFFSET:Lcom/dropbox/core/v2/files/UploadSessionAppendError;

    .line 117
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionAppendError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;->CONCURRENT_SESSION_INVALID_DATA_SIZE:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->withTag(Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;)Lcom/dropbox/core/v2/files/UploadSessionAppendError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->CONCURRENT_SESSION_INVALID_DATA_SIZE:Lcom/dropbox/core/v2/files/UploadSessionAppendError;

    .line 121
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionAppendError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;->PAYLOAD_TOO_LARGE:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->withTag(Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;)Lcom/dropbox/core/v2/files/UploadSessionAppendError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->PAYLOAD_TOO_LARGE:Lcom/dropbox/core/v2/files/UploadSessionAppendError;

    .line 129
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionAppendError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;->OTHER:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->withTag(Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;)Lcom/dropbox/core/v2/files/UploadSessionAppendError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->OTHER:Lcom/dropbox/core/v2/files/UploadSessionAppendError;

    .line 134
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionAppendError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;->CONTENT_HASH_MISMATCH:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->withTag(Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;)Lcom/dropbox/core/v2/files/UploadSessionAppendError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->CONTENT_HASH_MISMATCH:Lcom/dropbox/core/v2/files/UploadSessionAppendError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 142
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/files/UploadSessionAppendError;)Lcom/dropbox/core/v2/files/UploadSessionOffsetError;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->incorrectOffsetValue:Lcom/dropbox/core/v2/files/UploadSessionOffsetError;

    return-object p0
.end method

.method public static incorrectOffset(Lcom/dropbox/core/v2/files/UploadSessionOffsetError;)Lcom/dropbox/core/v2/files/UploadSessionAppendError;
    .locals 2

    if-eqz p0, :cond_0

    .line 232
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionAppendError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;->INCORRECT_OFFSET:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->withTagAndIncorrectOffset(Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;Lcom/dropbox/core/v2/files/UploadSessionOffsetError;)Lcom/dropbox/core/v2/files/UploadSessionAppendError;

    move-result-object p0

    return-object p0

    .line 230
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;)Lcom/dropbox/core/v2/files/UploadSessionAppendError;
    .locals 1

    .line 151
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionAppendError;-><init>()V

    .line 152
    iput-object p1, v0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    return-object v0
.end method

.method private withTagAndIncorrectOffset(Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;Lcom/dropbox/core/v2/files/UploadSessionOffsetError;)Lcom/dropbox/core/v2/files/UploadSessionAppendError;
    .locals 1

    .line 169
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionAppendError;-><init>()V

    .line 170
    iput-object p1, v0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    .line 171
    iput-object p2, v0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->incorrectOffsetValue:Lcom/dropbox/core/v2/files/UploadSessionOffsetError;

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

    .line 362
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/files/UploadSessionAppendError;

    if-eqz v2, :cond_5

    .line 363
    check-cast p1, Lcom/dropbox/core/v2/files/UploadSessionAppendError;

    .line 364
    iget-object v2, p0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 367
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/files/UploadSessionAppendError$1;->$SwitchMap$com$dropbox$core$v2$files$UploadSessionAppendError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    return v1

    :pswitch_0
    return v0

    .line 371
    :pswitch_1
    iget-object v2, p0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->incorrectOffsetValue:Lcom/dropbox/core/v2/files/UploadSessionOffsetError;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->incorrectOffsetValue:Lcom/dropbox/core/v2/files/UploadSessionOffsetError;

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
        :pswitch_0
    .end packed-switch
.end method

.method public getIncorrectOffsetValue()Lcom/dropbox/core/v2/files/UploadSessionOffsetError;
    .locals 3

    .line 250
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;->INCORRECT_OFFSET:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    if-ne v0, v1, :cond_0

    .line 253
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->incorrectOffsetValue:Lcom/dropbox/core/v2/files/UploadSessionOffsetError;

    return-object v0

    .line 251
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.INCORRECT_OFFSET, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 346
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->incorrectOffsetValue:Lcom/dropbox/core/v2/files/UploadSessionOffsetError;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    .line 350
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v1, v0

    return v1
.end method

.method public isClosed()Z
    .locals 2

    .line 264
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;->CLOSED:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isConcurrentSessionInvalidDataSize()Z
    .locals 2

    .line 308
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;->CONCURRENT_SESSION_INVALID_DATA_SIZE:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isConcurrentSessionInvalidOffset()Z
    .locals 2

    .line 297
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;->CONCURRENT_SESSION_INVALID_OFFSET:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isContentHashMismatch()Z
    .locals 2

    .line 341
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;->CONTENT_HASH_MISMATCH:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isIncorrectOffset()Z
    .locals 2

    .line 209
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;->INCORRECT_OFFSET:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isNotClosed()Z
    .locals 2

    .line 275
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;->NOT_CLOSED:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isNotFound()Z
    .locals 2

    .line 198
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;->NOT_FOUND:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 330
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;->OTHER:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isPayloadTooLarge()Z
    .locals 2

    .line 319
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;->PAYLOAD_TOO_LARGE:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTooLarge()Z
    .locals 2

    .line 286
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;->TOO_LARGE:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;
    .locals 1

    .line 187
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionAppendError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 399
    sget-object v0, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 411
    sget-object v0, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/UploadSessionAppendError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/UploadSessionAppendError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
