.class public final Lcom/dropbox/core/v2/files/MetadataV2;
.super Ljava/lang/Object;
.source "MetadataV2.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/MetadataV2$Serializer;,
        Lcom/dropbox/core/v2/files/MetadataV2$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/files/MetadataV2;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/files/MetadataV2$Tag;

.field private metadataValue:Lcom/dropbox/core/v2/files/Metadata;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 57
    new-instance v0, Lcom/dropbox/core/v2/files/MetadataV2;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/MetadataV2;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/MetadataV2$Tag;->OTHER:Lcom/dropbox/core/v2/files/MetadataV2$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/MetadataV2;->withTag(Lcom/dropbox/core/v2/files/MetadataV2$Tag;)Lcom/dropbox/core/v2/files/MetadataV2;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/MetadataV2;->OTHER:Lcom/dropbox/core/v2/files/MetadataV2;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/files/MetadataV2;)Lcom/dropbox/core/v2/files/Metadata;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/files/MetadataV2;->metadataValue:Lcom/dropbox/core/v2/files/Metadata;

    return-object p0
.end method

.method public static metadata(Lcom/dropbox/core/v2/files/Metadata;)Lcom/dropbox/core/v2/files/MetadataV2;
    .locals 2

    if-eqz p0, :cond_0

    .line 142
    new-instance v0, Lcom/dropbox/core/v2/files/MetadataV2;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/MetadataV2;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/MetadataV2$Tag;->METADATA:Lcom/dropbox/core/v2/files/MetadataV2$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/MetadataV2;->withTagAndMetadata(Lcom/dropbox/core/v2/files/MetadataV2$Tag;Lcom/dropbox/core/v2/files/Metadata;)Lcom/dropbox/core/v2/files/MetadataV2;

    move-result-object p0

    return-object p0

    .line 140
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/files/MetadataV2$Tag;)Lcom/dropbox/core/v2/files/MetadataV2;
    .locals 1

    .line 75
    new-instance v0, Lcom/dropbox/core/v2/files/MetadataV2;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/MetadataV2;-><init>()V

    .line 76
    iput-object p1, v0, Lcom/dropbox/core/v2/files/MetadataV2;->_tag:Lcom/dropbox/core/v2/files/MetadataV2$Tag;

    return-object v0
.end method

.method private withTagAndMetadata(Lcom/dropbox/core/v2/files/MetadataV2$Tag;Lcom/dropbox/core/v2/files/Metadata;)Lcom/dropbox/core/v2/files/MetadataV2;
    .locals 1

    .line 90
    new-instance v0, Lcom/dropbox/core/v2/files/MetadataV2;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/MetadataV2;-><init>()V

    .line 91
    iput-object p1, v0, Lcom/dropbox/core/v2/files/MetadataV2;->_tag:Lcom/dropbox/core/v2/files/MetadataV2$Tag;

    .line 92
    iput-object p2, v0, Lcom/dropbox/core/v2/files/MetadataV2;->metadataValue:Lcom/dropbox/core/v2/files/Metadata;

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

    .line 188
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/files/MetadataV2;

    if-eqz v2, :cond_7

    .line 189
    check-cast p1, Lcom/dropbox/core/v2/files/MetadataV2;

    .line 190
    iget-object v2, p0, Lcom/dropbox/core/v2/files/MetadataV2;->_tag:Lcom/dropbox/core/v2/files/MetadataV2$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/MetadataV2;->_tag:Lcom/dropbox/core/v2/files/MetadataV2$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 193
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/files/MetadataV2$1;->$SwitchMap$com$dropbox$core$v2$files$MetadataV2$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/files/MetadataV2;->_tag:Lcom/dropbox/core/v2/files/MetadataV2$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/files/MetadataV2$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_4

    const/4 p1, 0x2

    if-eq v2, p1, :cond_3

    return v1

    :cond_3
    return v0

    .line 195
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/files/MetadataV2;->metadataValue:Lcom/dropbox/core/v2/files/Metadata;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/MetadataV2;->metadataValue:Lcom/dropbox/core/v2/files/Metadata;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/Metadata;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_0
    return v0

    :cond_7
    return v1
.end method

.method public getMetadataValue()Lcom/dropbox/core/v2/files/Metadata;
    .locals 3

    .line 154
    iget-object v0, p0, Lcom/dropbox/core/v2/files/MetadataV2;->_tag:Lcom/dropbox/core/v2/files/MetadataV2$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/MetadataV2$Tag;->METADATA:Lcom/dropbox/core/v2/files/MetadataV2$Tag;

    if-ne v0, v1, :cond_0

    .line 157
    iget-object v0, p0, Lcom/dropbox/core/v2/files/MetadataV2;->metadataValue:Lcom/dropbox/core/v2/files/Metadata;

    return-object v0

    .line 155
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.METADATA, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/MetadataV2;->_tag:Lcom/dropbox/core/v2/files/MetadataV2$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/MetadataV2$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 173
    iget-object v0, p0, Lcom/dropbox/core/v2/files/MetadataV2;->_tag:Lcom/dropbox/core/v2/files/MetadataV2$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/MetadataV2;->metadataValue:Lcom/dropbox/core/v2/files/Metadata;

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

    .line 122
    iget-object v0, p0, Lcom/dropbox/core/v2/files/MetadataV2;->_tag:Lcom/dropbox/core/v2/files/MetadataV2$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/MetadataV2$Tag;->METADATA:Lcom/dropbox/core/v2/files/MetadataV2$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 168
    iget-object v0, p0, Lcom/dropbox/core/v2/files/MetadataV2;->_tag:Lcom/dropbox/core/v2/files/MetadataV2$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/MetadataV2$Tag;->OTHER:Lcom/dropbox/core/v2/files/MetadataV2$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/files/MetadataV2$Tag;
    .locals 1

    .line 111
    iget-object v0, p0, Lcom/dropbox/core/v2/files/MetadataV2;->_tag:Lcom/dropbox/core/v2/files/MetadataV2$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 209
    sget-object v0, Lcom/dropbox/core/v2/files/MetadataV2$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/MetadataV2$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/MetadataV2$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 221
    sget-object v0, Lcom/dropbox/core/v2/files/MetadataV2$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/MetadataV2$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/MetadataV2$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
