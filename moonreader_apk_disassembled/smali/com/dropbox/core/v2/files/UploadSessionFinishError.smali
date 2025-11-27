.class public final Lcom/dropbox/core/v2/files/UploadSessionFinishError;
.super Ljava/lang/Object;
.source "UploadSessionFinishError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/UploadSessionFinishError$Serializer;,
        Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;
    }
.end annotation


# static fields
.field public static final CONCURRENT_SESSION_DATA_NOT_ALLOWED:Lcom/dropbox/core/v2/files/UploadSessionFinishError;

.field public static final CONCURRENT_SESSION_MISSING_DATA:Lcom/dropbox/core/v2/files/UploadSessionFinishError;

.field public static final CONCURRENT_SESSION_NOT_CLOSED:Lcom/dropbox/core/v2/files/UploadSessionFinishError;

.field public static final CONTENT_HASH_MISMATCH:Lcom/dropbox/core/v2/files/UploadSessionFinishError;

.field public static final OTHER:Lcom/dropbox/core/v2/files/UploadSessionFinishError;

.field public static final PAYLOAD_TOO_LARGE:Lcom/dropbox/core/v2/files/UploadSessionFinishError;

.field public static final TOO_MANY_SHARED_FOLDER_TARGETS:Lcom/dropbox/core/v2/files/UploadSessionFinishError;

.field public static final TOO_MANY_WRITE_OPERATIONS:Lcom/dropbox/core/v2/files/UploadSessionFinishError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

.field private lookupFailedValue:Lcom/dropbox/core/v2/files/UploadSessionLookupError;

.field private pathValue:Lcom/dropbox/core/v2/files/WriteError;

.field private propertiesErrorValue:Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 101
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionFinishError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;->TOO_MANY_SHARED_FOLDER_TARGETS:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->withTag(Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;)Lcom/dropbox/core/v2/files/UploadSessionFinishError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->TOO_MANY_SHARED_FOLDER_TARGETS:Lcom/dropbox/core/v2/files/UploadSessionFinishError;

    .line 106
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionFinishError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;->TOO_MANY_WRITE_OPERATIONS:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->withTag(Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;)Lcom/dropbox/core/v2/files/UploadSessionFinishError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->TOO_MANY_WRITE_OPERATIONS:Lcom/dropbox/core/v2/files/UploadSessionFinishError;

    .line 110
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionFinishError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;->CONCURRENT_SESSION_DATA_NOT_ALLOWED:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->withTag(Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;)Lcom/dropbox/core/v2/files/UploadSessionFinishError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->CONCURRENT_SESSION_DATA_NOT_ALLOWED:Lcom/dropbox/core/v2/files/UploadSessionFinishError;

    .line 114
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionFinishError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;->CONCURRENT_SESSION_NOT_CLOSED:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->withTag(Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;)Lcom/dropbox/core/v2/files/UploadSessionFinishError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->CONCURRENT_SESSION_NOT_CLOSED:Lcom/dropbox/core/v2/files/UploadSessionFinishError;

    .line 118
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionFinishError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;->CONCURRENT_SESSION_MISSING_DATA:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->withTag(Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;)Lcom/dropbox/core/v2/files/UploadSessionFinishError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->CONCURRENT_SESSION_MISSING_DATA:Lcom/dropbox/core/v2/files/UploadSessionFinishError;

    .line 122
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionFinishError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;->PAYLOAD_TOO_LARGE:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->withTag(Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;)Lcom/dropbox/core/v2/files/UploadSessionFinishError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->PAYLOAD_TOO_LARGE:Lcom/dropbox/core/v2/files/UploadSessionFinishError;

    .line 127
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionFinishError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;->CONTENT_HASH_MISMATCH:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->withTag(Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;)Lcom/dropbox/core/v2/files/UploadSessionFinishError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->CONTENT_HASH_MISMATCH:Lcom/dropbox/core/v2/files/UploadSessionFinishError;

    .line 135
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionFinishError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;->OTHER:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->withTag(Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;)Lcom/dropbox/core/v2/files/UploadSessionFinishError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->OTHER:Lcom/dropbox/core/v2/files/UploadSessionFinishError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 145
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/files/UploadSessionFinishError;)Lcom/dropbox/core/v2/files/UploadSessionLookupError;
    .locals 0

    .line 30
    iget-object p0, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->lookupFailedValue:Lcom/dropbox/core/v2/files/UploadSessionLookupError;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/files/UploadSessionFinishError;)Lcom/dropbox/core/v2/files/WriteError;
    .locals 0

    .line 30
    iget-object p0, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->pathValue:Lcom/dropbox/core/v2/files/WriteError;

    return-object p0
.end method

.method static synthetic access$200(Lcom/dropbox/core/v2/files/UploadSessionFinishError;)Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError;
    .locals 0

    .line 30
    iget-object p0, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->propertiesErrorValue:Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError;

    return-object p0
.end method

.method public static lookupFailed(Lcom/dropbox/core/v2/files/UploadSessionLookupError;)Lcom/dropbox/core/v2/files/UploadSessionFinishError;
    .locals 2

    if-eqz p0, :cond_0

    .line 255
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionFinishError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;->LOOKUP_FAILED:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->withTagAndLookupFailed(Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;Lcom/dropbox/core/v2/files/UploadSessionLookupError;)Lcom/dropbox/core/v2/files/UploadSessionFinishError;

    move-result-object p0

    return-object p0

    .line 253
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static path(Lcom/dropbox/core/v2/files/WriteError;)Lcom/dropbox/core/v2/files/UploadSessionFinishError;
    .locals 2

    if-eqz p0, :cond_0

    .line 306
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionFinishError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;->PATH:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->withTagAndPath(Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;Lcom/dropbox/core/v2/files/WriteError;)Lcom/dropbox/core/v2/files/UploadSessionFinishError;

    move-result-object p0

    return-object p0

    .line 304
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static propertiesError(Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError;)Lcom/dropbox/core/v2/files/UploadSessionFinishError;
    .locals 2

    if-eqz p0, :cond_0

    .line 357
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionFinishError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;->PROPERTIES_ERROR:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->withTagAndPropertiesError(Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError;)Lcom/dropbox/core/v2/files/UploadSessionFinishError;

    move-result-object p0

    return-object p0

    .line 355
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;)Lcom/dropbox/core/v2/files/UploadSessionFinishError;
    .locals 1

    .line 154
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionFinishError;-><init>()V

    .line 155
    iput-object p1, v0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    return-object v0
.end method

.method private withTagAndLookupFailed(Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;Lcom/dropbox/core/v2/files/UploadSessionLookupError;)Lcom/dropbox/core/v2/files/UploadSessionFinishError;
    .locals 1

    .line 169
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionFinishError;-><init>()V

    .line 170
    iput-object p1, v0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    .line 171
    iput-object p2, v0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->lookupFailedValue:Lcom/dropbox/core/v2/files/UploadSessionLookupError;

    return-object v0
.end method

.method private withTagAndPath(Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;Lcom/dropbox/core/v2/files/WriteError;)Lcom/dropbox/core/v2/files/UploadSessionFinishError;
    .locals 1

    .line 186
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionFinishError;-><init>()V

    .line 187
    iput-object p1, v0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    .line 188
    iput-object p2, v0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->pathValue:Lcom/dropbox/core/v2/files/WriteError;

    return-object v0
.end method

.method private withTagAndPropertiesError(Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError;)Lcom/dropbox/core/v2/files/UploadSessionFinishError;
    .locals 1

    .line 202
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/UploadSessionFinishError;-><init>()V

    .line 203
    iput-object p1, v0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    .line 204
    iput-object p2, v0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->propertiesErrorValue:Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError;

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

    .line 486
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/files/UploadSessionFinishError;

    if-eqz v2, :cond_9

    .line 487
    check-cast p1, Lcom/dropbox/core/v2/files/UploadSessionFinishError;

    .line 488
    iget-object v2, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 491
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/files/UploadSessionFinishError$1;->$SwitchMap$com$dropbox$core$v2$files$UploadSessionFinishError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    return v1

    :pswitch_0
    return v0

    .line 497
    :pswitch_1
    iget-object v2, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->propertiesErrorValue:Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->propertiesErrorValue:Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError;

    if-eq v2, p1, :cond_4

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_0

    :cond_3
    return v1

    :cond_4
    :goto_0
    return v0

    .line 495
    :pswitch_2
    iget-object v2, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->pathValue:Lcom/dropbox/core/v2/files/WriteError;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->pathValue:Lcom/dropbox/core/v2/files/WriteError;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/WriteError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_1

    :cond_5
    return v1

    :cond_6
    :goto_1
    return v0

    .line 493
    :pswitch_3
    iget-object v2, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->lookupFailedValue:Lcom/dropbox/core/v2/files/UploadSessionLookupError;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->lookupFailedValue:Lcom/dropbox/core/v2/files/UploadSessionLookupError;

    if-eq v2, p1, :cond_8

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/UploadSessionLookupError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    goto :goto_2

    :cond_7
    return v1

    :cond_8
    :goto_2
    return v0

    :cond_9
    return v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
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

.method public getLookupFailedValue()Lcom/dropbox/core/v2/files/UploadSessionLookupError;
    .locals 3

    .line 270
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;->LOOKUP_FAILED:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    if-ne v0, v1, :cond_0

    .line 273
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->lookupFailedValue:Lcom/dropbox/core/v2/files/UploadSessionLookupError;

    return-object v0

    .line 271
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.LOOKUP_FAILED, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getPathValue()Lcom/dropbox/core/v2/files/WriteError;
    .locals 3

    .line 322
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;->PATH:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    if-ne v0, v1, :cond_0

    .line 325
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->pathValue:Lcom/dropbox/core/v2/files/WriteError;

    return-object v0

    .line 323
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.PATH, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getPropertiesErrorValue()Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError;
    .locals 3

    .line 373
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;->PROPERTIES_ERROR:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    if-ne v0, v1, :cond_0

    .line 376
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->propertiesErrorValue:Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError;

    return-object v0

    .line 374
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.PROPERTIES_ERROR, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 6

    .line 469
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->lookupFailedValue:Lcom/dropbox/core/v2/files/UploadSessionLookupError;

    iget-object v2, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->pathValue:Lcom/dropbox/core/v2/files/WriteError;

    iget-object v3, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->propertiesErrorValue:Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError;

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    const/4 v0, 0x1

    aput-object v1, v4, v0

    const/4 v0, 0x2

    aput-object v2, v4, v0

    const/4 v0, 0x3

    aput-object v3, v4, v0

    invoke-static {v4}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public isConcurrentSessionDataNotAllowed()Z
    .locals 2

    .line 409
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;->CONCURRENT_SESSION_DATA_NOT_ALLOWED:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isConcurrentSessionMissingData()Z
    .locals 2

    .line 431
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;->CONCURRENT_SESSION_MISSING_DATA:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isConcurrentSessionNotClosed()Z
    .locals 2

    .line 420
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;->CONCURRENT_SESSION_NOT_CLOSED:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isContentHashMismatch()Z
    .locals 2

    .line 453
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;->CONTENT_HASH_MISMATCH:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isLookupFailed()Z
    .locals 2

    .line 234
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;->LOOKUP_FAILED:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 464
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;->OTHER:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isPath()Z
    .locals 2

    .line 284
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;->PATH:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isPayloadTooLarge()Z
    .locals 2

    .line 442
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;->PAYLOAD_TOO_LARGE:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isPropertiesError()Z
    .locals 2

    .line 336
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;->PROPERTIES_ERROR:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTooManySharedFolderTargets()Z
    .locals 2

    .line 387
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;->TOO_MANY_SHARED_FOLDER_TARGETS:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTooManyWriteOperations()Z
    .locals 2

    .line 398
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;->TOO_MANY_WRITE_OPERATIONS:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;
    .locals 1

    .line 223
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionFinishError;->_tag:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 525
    sget-object v0, Lcom/dropbox/core/v2/files/UploadSessionFinishError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/UploadSessionFinishError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 537
    sget-object v0, Lcom/dropbox/core/v2/files/UploadSessionFinishError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/UploadSessionFinishError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/UploadSessionFinishError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
