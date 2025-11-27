.class public final Lcom/dropbox/core/v2/fileproperties/LookupError;
.super Ljava/lang/Object;
.source "LookupError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/fileproperties/LookupError$Serializer;,
        Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;
    }
.end annotation


# static fields
.field public static final NOT_FILE:Lcom/dropbox/core/v2/fileproperties/LookupError;

.field public static final NOT_FOLDER:Lcom/dropbox/core/v2/fileproperties/LookupError;

.field public static final NOT_FOUND:Lcom/dropbox/core/v2/fileproperties/LookupError;

.field public static final OTHER:Lcom/dropbox/core/v2/fileproperties/LookupError;

.field public static final RESTRICTED_CONTENT:Lcom/dropbox/core/v2/fileproperties/LookupError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

.field private malformedPathValue:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 70
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/LookupError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/fileproperties/LookupError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;->NOT_FOUND:Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/fileproperties/LookupError;->withTag(Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;)Lcom/dropbox/core/v2/fileproperties/LookupError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/fileproperties/LookupError;->NOT_FOUND:Lcom/dropbox/core/v2/fileproperties/LookupError;

    .line 75
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/LookupError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/fileproperties/LookupError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;->NOT_FILE:Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/fileproperties/LookupError;->withTag(Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;)Lcom/dropbox/core/v2/fileproperties/LookupError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/fileproperties/LookupError;->NOT_FILE:Lcom/dropbox/core/v2/fileproperties/LookupError;

    .line 80
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/LookupError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/fileproperties/LookupError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;->NOT_FOLDER:Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/fileproperties/LookupError;->withTag(Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;)Lcom/dropbox/core/v2/fileproperties/LookupError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/fileproperties/LookupError;->NOT_FOLDER:Lcom/dropbox/core/v2/fileproperties/LookupError;

    .line 85
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/LookupError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/fileproperties/LookupError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;->RESTRICTED_CONTENT:Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/fileproperties/LookupError;->withTag(Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;)Lcom/dropbox/core/v2/fileproperties/LookupError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/fileproperties/LookupError;->RESTRICTED_CONTENT:Lcom/dropbox/core/v2/fileproperties/LookupError;

    .line 93
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/LookupError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/fileproperties/LookupError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;->OTHER:Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/fileproperties/LookupError;->withTag(Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;)Lcom/dropbox/core/v2/fileproperties/LookupError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/fileproperties/LookupError;->OTHER:Lcom/dropbox/core/v2/fileproperties/LookupError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 101
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/fileproperties/LookupError;)Ljava/lang/String;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/fileproperties/LookupError;->malformedPathValue:Ljava/lang/String;

    return-object p0
.end method

.method public static malformedPath(Ljava/lang/String;)Lcom/dropbox/core/v2/fileproperties/LookupError;
    .locals 2

    if-eqz p0, :cond_0

    .line 176
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/LookupError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/fileproperties/LookupError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;->MALFORMED_PATH:Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/fileproperties/LookupError;->withTagAndMalformedPath(Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/fileproperties/LookupError;

    move-result-object p0

    return-object p0

    .line 174
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;)Lcom/dropbox/core/v2/fileproperties/LookupError;
    .locals 1

    .line 110
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/LookupError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/fileproperties/LookupError;-><init>()V

    .line 111
    iput-object p1, v0, Lcom/dropbox/core/v2/fileproperties/LookupError;->_tag:Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    return-object v0
.end method

.method private withTagAndMalformedPath(Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/fileproperties/LookupError;
    .locals 1

    .line 124
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/LookupError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/fileproperties/LookupError;-><init>()V

    .line 125
    iput-object p1, v0, Lcom/dropbox/core/v2/fileproperties/LookupError;->_tag:Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    .line 126
    iput-object p2, v0, Lcom/dropbox/core/v2/fileproperties/LookupError;->malformedPathValue:Ljava/lang/String;

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

    .line 267
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/fileproperties/LookupError;

    if-eqz v2, :cond_5

    .line 268
    check-cast p1, Lcom/dropbox/core/v2/fileproperties/LookupError;

    .line 269
    iget-object v2, p0, Lcom/dropbox/core/v2/fileproperties/LookupError;->_tag:Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/fileproperties/LookupError;->_tag:Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 272
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/fileproperties/LookupError$1;->$SwitchMap$com$dropbox$core$v2$fileproperties$LookupError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/fileproperties/LookupError;->_tag:Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    return v1

    :pswitch_0
    return v0

    .line 274
    :pswitch_1
    iget-object v2, p0, Lcom/dropbox/core/v2/fileproperties/LookupError;->malformedPathValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/fileproperties/LookupError;->malformedPathValue:Ljava/lang/String;

    if-eq v2, p1, :cond_4

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_0

    :cond_3
    return v1

    :cond_4
    :goto_0
    return v0

    :cond_5
    return v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public getMalformedPathValue()Ljava/lang/String;
    .locals 3

    .line 189
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/LookupError;->_tag:Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;->MALFORMED_PATH:Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    if-ne v0, v1, :cond_0

    .line 192
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/LookupError;->malformedPathValue:Ljava/lang/String;

    return-object v0

    .line 190
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.MALFORMED_PATH, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/fileproperties/LookupError;->_tag:Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 252
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/LookupError;->_tag:Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/fileproperties/LookupError;->malformedPathValue:Ljava/lang/String;

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

.method public isMalformedPath()Z
    .locals 2

    .line 156
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/LookupError;->_tag:Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;->MALFORMED_PATH:Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isNotFile()Z
    .locals 2

    .line 214
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/LookupError;->_tag:Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;->NOT_FILE:Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isNotFolder()Z
    .locals 2

    .line 225
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/LookupError;->_tag:Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;->NOT_FOLDER:Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isNotFound()Z
    .locals 2

    .line 203
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/LookupError;->_tag:Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;->NOT_FOUND:Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 247
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/LookupError;->_tag:Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;->OTHER:Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isRestrictedContent()Z
    .locals 2

    .line 236
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/LookupError;->_tag:Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;->RESTRICTED_CONTENT:Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;
    .locals 1

    .line 145
    iget-object v0, p0, Lcom/dropbox/core/v2/fileproperties/LookupError;->_tag:Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 296
    sget-object v0, Lcom/dropbox/core/v2/fileproperties/LookupError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/fileproperties/LookupError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/fileproperties/LookupError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 308
    sget-object v0, Lcom/dropbox/core/v2/fileproperties/LookupError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/fileproperties/LookupError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/fileproperties/LookupError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
