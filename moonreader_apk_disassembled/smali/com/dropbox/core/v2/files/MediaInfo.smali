.class public final Lcom/dropbox/core/v2/files/MediaInfo;
.super Ljava/lang/Object;
.source "MediaInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/MediaInfo$Serializer;,
        Lcom/dropbox/core/v2/files/MediaInfo$Tag;
    }
.end annotation


# static fields
.field public static final PENDING:Lcom/dropbox/core/v2/files/MediaInfo;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/files/MediaInfo$Tag;

.field private metadataValue:Lcom/dropbox/core/v2/files/MediaMetadata;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 47
    new-instance v0, Lcom/dropbox/core/v2/files/MediaInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/MediaInfo;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/MediaInfo$Tag;->PENDING:Lcom/dropbox/core/v2/files/MediaInfo$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/MediaInfo;->withTag(Lcom/dropbox/core/v2/files/MediaInfo$Tag;)Lcom/dropbox/core/v2/files/MediaInfo;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/MediaInfo;->PENDING:Lcom/dropbox/core/v2/files/MediaInfo;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/files/MediaInfo;)Lcom/dropbox/core/v2/files/MediaMetadata;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/dropbox/core/v2/files/MediaInfo;->metadataValue:Lcom/dropbox/core/v2/files/MediaMetadata;

    return-object p0
.end method

.method public static metadata(Lcom/dropbox/core/v2/files/MediaMetadata;)Lcom/dropbox/core/v2/files/MediaInfo;
    .locals 2

    if-eqz p0, :cond_0

    .line 139
    new-instance v0, Lcom/dropbox/core/v2/files/MediaInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/MediaInfo;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/MediaInfo$Tag;->METADATA:Lcom/dropbox/core/v2/files/MediaInfo$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/MediaInfo;->withTagAndMetadata(Lcom/dropbox/core/v2/files/MediaInfo$Tag;Lcom/dropbox/core/v2/files/MediaMetadata;)Lcom/dropbox/core/v2/files/MediaInfo;

    move-result-object p0

    return-object p0

    .line 137
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/files/MediaInfo$Tag;)Lcom/dropbox/core/v2/files/MediaInfo;
    .locals 1

    .line 64
    new-instance v0, Lcom/dropbox/core/v2/files/MediaInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/MediaInfo;-><init>()V

    .line 65
    iput-object p1, v0, Lcom/dropbox/core/v2/files/MediaInfo;->_tag:Lcom/dropbox/core/v2/files/MediaInfo$Tag;

    return-object v0
.end method

.method private withTagAndMetadata(Lcom/dropbox/core/v2/files/MediaInfo$Tag;Lcom/dropbox/core/v2/files/MediaMetadata;)Lcom/dropbox/core/v2/files/MediaInfo;
    .locals 1

    .line 79
    new-instance v0, Lcom/dropbox/core/v2/files/MediaInfo;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/MediaInfo;-><init>()V

    .line 80
    iput-object p1, v0, Lcom/dropbox/core/v2/files/MediaInfo;->_tag:Lcom/dropbox/core/v2/files/MediaInfo$Tag;

    .line 81
    iput-object p2, v0, Lcom/dropbox/core/v2/files/MediaInfo;->metadataValue:Lcom/dropbox/core/v2/files/MediaMetadata;

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

    .line 176
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/files/MediaInfo;

    if-eqz v2, :cond_6

    .line 177
    check-cast p1, Lcom/dropbox/core/v2/files/MediaInfo;

    .line 178
    iget-object v2, p0, Lcom/dropbox/core/v2/files/MediaInfo;->_tag:Lcom/dropbox/core/v2/files/MediaInfo$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/MediaInfo;->_tag:Lcom/dropbox/core/v2/files/MediaInfo$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 181
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/files/MediaInfo$1;->$SwitchMap$com$dropbox$core$v2$files$MediaInfo$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/files/MediaInfo;->_tag:Lcom/dropbox/core/v2/files/MediaInfo$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/files/MediaInfo$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_5

    const/4 v3, 0x2

    if-eq v2, v3, :cond_3

    return v1

    .line 185
    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/files/MediaInfo;->metadataValue:Lcom/dropbox/core/v2/files/MediaMetadata;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/MediaInfo;->metadataValue:Lcom/dropbox/core/v2/files/MediaMetadata;

    if-eq v2, p1, :cond_5

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/MediaMetadata;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    goto :goto_0

    :cond_4
    return v1

    :cond_5
    :goto_0
    return v0

    :cond_6
    return v1
.end method

.method public getMetadataValue()Lcom/dropbox/core/v2/files/MediaMetadata;
    .locals 3

    .line 153
    iget-object v0, p0, Lcom/dropbox/core/v2/files/MediaInfo;->_tag:Lcom/dropbox/core/v2/files/MediaInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/MediaInfo$Tag;->METADATA:Lcom/dropbox/core/v2/files/MediaInfo$Tag;

    if-ne v0, v1, :cond_0

    .line 156
    iget-object v0, p0, Lcom/dropbox/core/v2/files/MediaInfo;->metadataValue:Lcom/dropbox/core/v2/files/MediaMetadata;

    return-object v0

    .line 154
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.METADATA, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/MediaInfo;->_tag:Lcom/dropbox/core/v2/files/MediaInfo$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/MediaInfo$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 161
    iget-object v0, p0, Lcom/dropbox/core/v2/files/MediaInfo;->_tag:Lcom/dropbox/core/v2/files/MediaInfo$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/MediaInfo;->metadataValue:Lcom/dropbox/core/v2/files/MediaMetadata;

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

.method public isMetadata()Z
    .locals 2

    .line 119
    iget-object v0, p0, Lcom/dropbox/core/v2/files/MediaInfo;->_tag:Lcom/dropbox/core/v2/files/MediaInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/MediaInfo$Tag;->METADATA:Lcom/dropbox/core/v2/files/MediaInfo$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isPending()Z
    .locals 2

    .line 108
    iget-object v0, p0, Lcom/dropbox/core/v2/files/MediaInfo;->_tag:Lcom/dropbox/core/v2/files/MediaInfo$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/MediaInfo$Tag;->PENDING:Lcom/dropbox/core/v2/files/MediaInfo$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/files/MediaInfo$Tag;
    .locals 1

    .line 97
    iget-object v0, p0, Lcom/dropbox/core/v2/files/MediaInfo;->_tag:Lcom/dropbox/core/v2/files/MediaInfo$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 197
    sget-object v0, Lcom/dropbox/core/v2/files/MediaInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/MediaInfo$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/MediaInfo$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 209
    sget-object v0, Lcom/dropbox/core/v2/files/MediaInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/MediaInfo$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/MediaInfo$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
