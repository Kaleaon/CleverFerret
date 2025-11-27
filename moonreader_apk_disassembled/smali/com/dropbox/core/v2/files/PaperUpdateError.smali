.class public final Lcom/dropbox/core/v2/files/PaperUpdateError;
.super Ljava/lang/Object;
.source "PaperUpdateError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/PaperUpdateError$Serializer;,
        Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;
    }
.end annotation


# static fields
.field public static final CONTENT_MALFORMED:Lcom/dropbox/core/v2/files/PaperUpdateError;

.field public static final DOC_ARCHIVED:Lcom/dropbox/core/v2/files/PaperUpdateError;

.field public static final DOC_DELETED:Lcom/dropbox/core/v2/files/PaperUpdateError;

.field public static final DOC_LENGTH_EXCEEDED:Lcom/dropbox/core/v2/files/PaperUpdateError;

.field public static final IMAGE_SIZE_EXCEEDED:Lcom/dropbox/core/v2/files/PaperUpdateError;

.field public static final INSUFFICIENT_PERMISSIONS:Lcom/dropbox/core/v2/files/PaperUpdateError;

.field public static final OTHER:Lcom/dropbox/core/v2/files/PaperUpdateError;

.field public static final REVISION_MISMATCH:Lcom/dropbox/core/v2/files/PaperUpdateError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;

.field private pathValue:Lcom/dropbox/core/v2/files/LookupError;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 77
    new-instance v0, Lcom/dropbox/core/v2/files/PaperUpdateError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/PaperUpdateError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;->INSUFFICIENT_PERMISSIONS:Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/PaperUpdateError;->withTag(Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;)Lcom/dropbox/core/v2/files/PaperUpdateError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/PaperUpdateError;->INSUFFICIENT_PERMISSIONS:Lcom/dropbox/core/v2/files/PaperUpdateError;

    .line 81
    new-instance v0, Lcom/dropbox/core/v2/files/PaperUpdateError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/PaperUpdateError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;->CONTENT_MALFORMED:Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/PaperUpdateError;->withTag(Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;)Lcom/dropbox/core/v2/files/PaperUpdateError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/PaperUpdateError;->CONTENT_MALFORMED:Lcom/dropbox/core/v2/files/PaperUpdateError;

    .line 85
    new-instance v0, Lcom/dropbox/core/v2/files/PaperUpdateError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/PaperUpdateError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;->DOC_LENGTH_EXCEEDED:Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/PaperUpdateError;->withTag(Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;)Lcom/dropbox/core/v2/files/PaperUpdateError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/PaperUpdateError;->DOC_LENGTH_EXCEEDED:Lcom/dropbox/core/v2/files/PaperUpdateError;

    .line 90
    new-instance v0, Lcom/dropbox/core/v2/files/PaperUpdateError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/PaperUpdateError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;->IMAGE_SIZE_EXCEEDED:Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/PaperUpdateError;->withTag(Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;)Lcom/dropbox/core/v2/files/PaperUpdateError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/PaperUpdateError;->IMAGE_SIZE_EXCEEDED:Lcom/dropbox/core/v2/files/PaperUpdateError;

    .line 98
    new-instance v0, Lcom/dropbox/core/v2/files/PaperUpdateError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/PaperUpdateError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;->OTHER:Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/PaperUpdateError;->withTag(Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;)Lcom/dropbox/core/v2/files/PaperUpdateError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/PaperUpdateError;->OTHER:Lcom/dropbox/core/v2/files/PaperUpdateError;

    .line 102
    new-instance v0, Lcom/dropbox/core/v2/files/PaperUpdateError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/PaperUpdateError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;->REVISION_MISMATCH:Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/PaperUpdateError;->withTag(Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;)Lcom/dropbox/core/v2/files/PaperUpdateError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/PaperUpdateError;->REVISION_MISMATCH:Lcom/dropbox/core/v2/files/PaperUpdateError;

    .line 106
    new-instance v0, Lcom/dropbox/core/v2/files/PaperUpdateError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/PaperUpdateError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;->DOC_ARCHIVED:Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/PaperUpdateError;->withTag(Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;)Lcom/dropbox/core/v2/files/PaperUpdateError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/PaperUpdateError;->DOC_ARCHIVED:Lcom/dropbox/core/v2/files/PaperUpdateError;

    .line 110
    new-instance v0, Lcom/dropbox/core/v2/files/PaperUpdateError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/PaperUpdateError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;->DOC_DELETED:Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/PaperUpdateError;->withTag(Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;)Lcom/dropbox/core/v2/files/PaperUpdateError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/PaperUpdateError;->DOC_DELETED:Lcom/dropbox/core/v2/files/PaperUpdateError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 118
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/files/PaperUpdateError;)Lcom/dropbox/core/v2/files/LookupError;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/dropbox/core/v2/files/PaperUpdateError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    return-object p0
.end method

.method public static path(Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/PaperUpdateError;
    .locals 2

    if-eqz p0, :cond_0

    .line 245
    new-instance v0, Lcom/dropbox/core/v2/files/PaperUpdateError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/PaperUpdateError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;->PATH:Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/PaperUpdateError;->withTagAndPath(Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/PaperUpdateError;

    move-result-object p0

    return-object p0

    .line 243
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;)Lcom/dropbox/core/v2/files/PaperUpdateError;
    .locals 1

    .line 127
    new-instance v0, Lcom/dropbox/core/v2/files/PaperUpdateError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/PaperUpdateError;-><init>()V

    .line 128
    iput-object p1, v0, Lcom/dropbox/core/v2/files/PaperUpdateError;->_tag:Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;

    return-object v0
.end method

.method private withTagAndPath(Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/PaperUpdateError;
    .locals 1

    .line 141
    new-instance v0, Lcom/dropbox/core/v2/files/PaperUpdateError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/PaperUpdateError;-><init>()V

    .line 142
    iput-object p1, v0, Lcom/dropbox/core/v2/files/PaperUpdateError;->_tag:Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;

    .line 143
    iput-object p2, v0, Lcom/dropbox/core/v2/files/PaperUpdateError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

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

    .line 314
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/files/PaperUpdateError;

    if-eqz v2, :cond_5

    .line 315
    check-cast p1, Lcom/dropbox/core/v2/files/PaperUpdateError;

    .line 316
    iget-object v2, p0, Lcom/dropbox/core/v2/files/PaperUpdateError;->_tag:Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/PaperUpdateError;->_tag:Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 319
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/files/PaperUpdateError$1;->$SwitchMap$com$dropbox$core$v2$files$PaperUpdateError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/files/PaperUpdateError;->_tag:Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    return v1

    :pswitch_0
    return v0

    .line 331
    :pswitch_1
    iget-object v2, p0, Lcom/dropbox/core/v2/files/PaperUpdateError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/PaperUpdateError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    if-eq v2, p1, :cond_4

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/LookupError;->equals(Ljava/lang/Object;)Z

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
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public getPathValue()Lcom/dropbox/core/v2/files/LookupError;
    .locals 3

    .line 257
    iget-object v0, p0, Lcom/dropbox/core/v2/files/PaperUpdateError;->_tag:Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;->PATH:Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;

    if-ne v0, v1, :cond_0

    .line 260
    iget-object v0, p0, Lcom/dropbox/core/v2/files/PaperUpdateError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    return-object v0

    .line 258
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.PATH, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/PaperUpdateError;->_tag:Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 298
    iget-object v0, p0, Lcom/dropbox/core/v2/files/PaperUpdateError;->_tag:Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/PaperUpdateError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    .line 302
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v1, v0

    return v1
.end method

.method public isContentMalformed()Z
    .locals 2

    .line 181
    iget-object v0, p0, Lcom/dropbox/core/v2/files/PaperUpdateError;->_tag:Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;->CONTENT_MALFORMED:Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isDocArchived()Z
    .locals 2

    .line 282
    iget-object v0, p0, Lcom/dropbox/core/v2/files/PaperUpdateError;->_tag:Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;->DOC_ARCHIVED:Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isDocDeleted()Z
    .locals 2

    .line 293
    iget-object v0, p0, Lcom/dropbox/core/v2/files/PaperUpdateError;->_tag:Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;->DOC_DELETED:Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isDocLengthExceeded()Z
    .locals 2

    .line 192
    iget-object v0, p0, Lcom/dropbox/core/v2/files/PaperUpdateError;->_tag:Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;->DOC_LENGTH_EXCEEDED:Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isImageSizeExceeded()Z
    .locals 2

    .line 203
    iget-object v0, p0, Lcom/dropbox/core/v2/files/PaperUpdateError;->_tag:Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;->IMAGE_SIZE_EXCEEDED:Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isInsufficientPermissions()Z
    .locals 2

    .line 170
    iget-object v0, p0, Lcom/dropbox/core/v2/files/PaperUpdateError;->_tag:Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;->INSUFFICIENT_PERMISSIONS:Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 214
    iget-object v0, p0, Lcom/dropbox/core/v2/files/PaperUpdateError;->_tag:Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;->OTHER:Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isPath()Z
    .locals 2

    .line 225
    iget-object v0, p0, Lcom/dropbox/core/v2/files/PaperUpdateError;->_tag:Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;->PATH:Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isRevisionMismatch()Z
    .locals 2

    .line 271
    iget-object v0, p0, Lcom/dropbox/core/v2/files/PaperUpdateError;->_tag:Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;->REVISION_MISMATCH:Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;
    .locals 1

    .line 159
    iget-object v0, p0, Lcom/dropbox/core/v2/files/PaperUpdateError;->_tag:Lcom/dropbox/core/v2/files/PaperUpdateError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 349
    sget-object v0, Lcom/dropbox/core/v2/files/PaperUpdateError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/PaperUpdateError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/PaperUpdateError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 361
    sget-object v0, Lcom/dropbox/core/v2/files/PaperUpdateError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/PaperUpdateError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/PaperUpdateError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
