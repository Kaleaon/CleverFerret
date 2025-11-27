.class public final Lcom/dropbox/core/v2/files/GetMetadataError;
.super Ljava/lang/Object;
.source "GetMetadataError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/GetMetadataError$Serializer;,
        Lcom/dropbox/core/v2/files/GetMetadataError$Tag;
    }
.end annotation


# instance fields
.field private _tag:Lcom/dropbox/core/v2/files/GetMetadataError$Tag;

.field private pathValue:Lcom/dropbox/core/v2/files/LookupError;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/files/GetMetadataError;)Lcom/dropbox/core/v2/files/LookupError;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/dropbox/core/v2/files/GetMetadataError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    return-object p0
.end method

.method public static path(Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/GetMetadataError;
    .locals 2

    if-eqz p0, :cond_0

    .line 113
    new-instance v0, Lcom/dropbox/core/v2/files/GetMetadataError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/GetMetadataError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/GetMetadataError$Tag;->PATH:Lcom/dropbox/core/v2/files/GetMetadataError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/GetMetadataError;->withTagAndPath(Lcom/dropbox/core/v2/files/GetMetadataError$Tag;Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/GetMetadataError;

    move-result-object p0

    return-object p0

    .line 111
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/files/GetMetadataError$Tag;)Lcom/dropbox/core/v2/files/GetMetadataError;
    .locals 1

    .line 50
    new-instance v0, Lcom/dropbox/core/v2/files/GetMetadataError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/GetMetadataError;-><init>()V

    .line 51
    iput-object p1, v0, Lcom/dropbox/core/v2/files/GetMetadataError;->_tag:Lcom/dropbox/core/v2/files/GetMetadataError$Tag;

    return-object v0
.end method

.method private withTagAndPath(Lcom/dropbox/core/v2/files/GetMetadataError$Tag;Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/GetMetadataError;
    .locals 1

    .line 64
    new-instance v0, Lcom/dropbox/core/v2/files/GetMetadataError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/GetMetadataError;-><init>()V

    .line 65
    iput-object p1, v0, Lcom/dropbox/core/v2/files/GetMetadataError;->_tag:Lcom/dropbox/core/v2/files/GetMetadataError$Tag;

    .line 66
    iput-object p2, v0, Lcom/dropbox/core/v2/files/GetMetadataError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

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

    .line 148
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/files/GetMetadataError;

    if-eqz v2, :cond_6

    .line 149
    check-cast p1, Lcom/dropbox/core/v2/files/GetMetadataError;

    .line 150
    iget-object v2, p0, Lcom/dropbox/core/v2/files/GetMetadataError;->_tag:Lcom/dropbox/core/v2/files/GetMetadataError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/GetMetadataError;->_tag:Lcom/dropbox/core/v2/files/GetMetadataError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 153
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/files/GetMetadataError$1;->$SwitchMap$com$dropbox$core$v2$files$GetMetadataError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/files/GetMetadataError;->_tag:Lcom/dropbox/core/v2/files/GetMetadataError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/files/GetMetadataError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_3

    return v1

    .line 155
    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/files/GetMetadataError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/GetMetadataError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    if-eq v2, p1, :cond_5

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/LookupError;->equals(Ljava/lang/Object;)Z

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

.method public getPathValue()Lcom/dropbox/core/v2/files/LookupError;
    .locals 3

    .line 125
    iget-object v0, p0, Lcom/dropbox/core/v2/files/GetMetadataError;->_tag:Lcom/dropbox/core/v2/files/GetMetadataError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/GetMetadataError$Tag;->PATH:Lcom/dropbox/core/v2/files/GetMetadataError$Tag;

    if-ne v0, v1, :cond_0

    .line 128
    iget-object v0, p0, Lcom/dropbox/core/v2/files/GetMetadataError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    return-object v0

    .line 126
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.PATH, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/GetMetadataError;->_tag:Lcom/dropbox/core/v2/files/GetMetadataError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/GetMetadataError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 133
    iget-object v0, p0, Lcom/dropbox/core/v2/files/GetMetadataError;->_tag:Lcom/dropbox/core/v2/files/GetMetadataError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/GetMetadataError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

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

.method public isPath()Z
    .locals 2

    .line 93
    iget-object v0, p0, Lcom/dropbox/core/v2/files/GetMetadataError;->_tag:Lcom/dropbox/core/v2/files/GetMetadataError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/GetMetadataError$Tag;->PATH:Lcom/dropbox/core/v2/files/GetMetadataError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/files/GetMetadataError$Tag;
    .locals 1

    .line 82
    iget-object v0, p0, Lcom/dropbox/core/v2/files/GetMetadataError;->_tag:Lcom/dropbox/core/v2/files/GetMetadataError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 167
    sget-object v0, Lcom/dropbox/core/v2/files/GetMetadataError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/GetMetadataError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/GetMetadataError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 179
    sget-object v0, Lcom/dropbox/core/v2/files/GetMetadataError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/GetMetadataError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/GetMetadataError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
