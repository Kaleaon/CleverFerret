.class public final Lcom/dropbox/core/v2/files/AlphaGetMetadataError;
.super Ljava/lang/Object;
.source "AlphaGetMetadataError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Serializer;,
        Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Tag;
    }
.end annotation


# instance fields
.field private _tag:Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Tag;

.field private pathValue:Lcom/dropbox/core/v2/files/LookupError;

.field private propertiesErrorValue:Lcom/dropbox/core/v2/fileproperties/LookUpPropertiesError;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/files/AlphaGetMetadataError;)Lcom/dropbox/core/v2/files/LookupError;
    .locals 0

    .line 26
    iget-object p0, p0, Lcom/dropbox/core/v2/files/AlphaGetMetadataError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/files/AlphaGetMetadataError;)Lcom/dropbox/core/v2/fileproperties/LookUpPropertiesError;
    .locals 0

    .line 26
    iget-object p0, p0, Lcom/dropbox/core/v2/files/AlphaGetMetadataError;->propertiesErrorValue:Lcom/dropbox/core/v2/fileproperties/LookUpPropertiesError;

    return-object p0
.end method

.method public static path(Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/AlphaGetMetadataError;
    .locals 2

    if-eqz p0, :cond_0

    .line 131
    new-instance v0, Lcom/dropbox/core/v2/files/AlphaGetMetadataError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/AlphaGetMetadataError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Tag;->PATH:Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/AlphaGetMetadataError;->withTagAndPath(Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Tag;Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/AlphaGetMetadataError;

    move-result-object p0

    return-object p0

    .line 129
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static propertiesError(Lcom/dropbox/core/v2/fileproperties/LookUpPropertiesError;)Lcom/dropbox/core/v2/files/AlphaGetMetadataError;
    .locals 2

    if-eqz p0, :cond_0

    .line 177
    new-instance v0, Lcom/dropbox/core/v2/files/AlphaGetMetadataError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/AlphaGetMetadataError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Tag;->PROPERTIES_ERROR:Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/AlphaGetMetadataError;->withTagAndPropertiesError(Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Tag;Lcom/dropbox/core/v2/fileproperties/LookUpPropertiesError;)Lcom/dropbox/core/v2/files/AlphaGetMetadataError;

    move-result-object p0

    return-object p0

    .line 175
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Tag;)Lcom/dropbox/core/v2/files/AlphaGetMetadataError;
    .locals 1

    .line 53
    new-instance v0, Lcom/dropbox/core/v2/files/AlphaGetMetadataError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/AlphaGetMetadataError;-><init>()V

    .line 54
    iput-object p1, v0, Lcom/dropbox/core/v2/files/AlphaGetMetadataError;->_tag:Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Tag;

    return-object v0
.end method

.method private withTagAndPath(Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Tag;Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/AlphaGetMetadataError;
    .locals 1

    .line 67
    new-instance v0, Lcom/dropbox/core/v2/files/AlphaGetMetadataError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/AlphaGetMetadataError;-><init>()V

    .line 68
    iput-object p1, v0, Lcom/dropbox/core/v2/files/AlphaGetMetadataError;->_tag:Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Tag;

    .line 69
    iput-object p2, v0, Lcom/dropbox/core/v2/files/AlphaGetMetadataError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    return-object v0
.end method

.method private withTagAndPropertiesError(Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Tag;Lcom/dropbox/core/v2/fileproperties/LookUpPropertiesError;)Lcom/dropbox/core/v2/files/AlphaGetMetadataError;
    .locals 1

    .line 82
    new-instance v0, Lcom/dropbox/core/v2/files/AlphaGetMetadataError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/AlphaGetMetadataError;-><init>()V

    .line 83
    iput-object p1, v0, Lcom/dropbox/core/v2/files/AlphaGetMetadataError;->_tag:Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Tag;

    .line 84
    iput-object p2, v0, Lcom/dropbox/core/v2/files/AlphaGetMetadataError;->propertiesErrorValue:Lcom/dropbox/core/v2/fileproperties/LookUpPropertiesError;

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

    .line 215
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/files/AlphaGetMetadataError;

    if-eqz v2, :cond_9

    .line 216
    check-cast p1, Lcom/dropbox/core/v2/files/AlphaGetMetadataError;

    .line 217
    iget-object v2, p0, Lcom/dropbox/core/v2/files/AlphaGetMetadataError;->_tag:Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/AlphaGetMetadataError;->_tag:Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 220
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/files/AlphaGetMetadataError$1;->$SwitchMap$com$dropbox$core$v2$files$AlphaGetMetadataError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/files/AlphaGetMetadataError;->_tag:Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_6

    const/4 v3, 0x2

    if-eq v2, v3, :cond_3

    return v1

    .line 224
    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/files/AlphaGetMetadataError;->propertiesErrorValue:Lcom/dropbox/core/v2/fileproperties/LookUpPropertiesError;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/AlphaGetMetadataError;->propertiesErrorValue:Lcom/dropbox/core/v2/fileproperties/LookUpPropertiesError;

    if-eq v2, p1, :cond_5

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/fileproperties/LookUpPropertiesError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    goto :goto_0

    :cond_4
    return v1

    :cond_5
    :goto_0
    return v0

    .line 222
    :cond_6
    iget-object v2, p0, Lcom/dropbox/core/v2/files/AlphaGetMetadataError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/AlphaGetMetadataError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    if-eq v2, p1, :cond_8

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/LookupError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    goto :goto_1

    :cond_7
    return v1

    :cond_8
    :goto_1
    return v0

    :cond_9
    return v1
.end method

.method public getPathValue()Lcom/dropbox/core/v2/files/LookupError;
    .locals 3

    .line 143
    iget-object v0, p0, Lcom/dropbox/core/v2/files/AlphaGetMetadataError;->_tag:Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Tag;->PATH:Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Tag;

    if-ne v0, v1, :cond_0

    .line 146
    iget-object v0, p0, Lcom/dropbox/core/v2/files/AlphaGetMetadataError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    return-object v0

    .line 144
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.PATH, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/AlphaGetMetadataError;->_tag:Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getPropertiesErrorValue()Lcom/dropbox/core/v2/fileproperties/LookUpPropertiesError;
    .locals 3

    .line 190
    iget-object v0, p0, Lcom/dropbox/core/v2/files/AlphaGetMetadataError;->_tag:Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Tag;->PROPERTIES_ERROR:Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Tag;

    if-ne v0, v1, :cond_0

    .line 193
    iget-object v0, p0, Lcom/dropbox/core/v2/files/AlphaGetMetadataError;->propertiesErrorValue:Lcom/dropbox/core/v2/fileproperties/LookUpPropertiesError;

    return-object v0

    .line 191
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.PROPERTIES_ERROR, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/AlphaGetMetadataError;->_tag:Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 5

    .line 198
    iget-object v0, p0, Lcom/dropbox/core/v2/files/AlphaGetMetadataError;->_tag:Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/AlphaGetMetadataError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    iget-object v2, p0, Lcom/dropbox/core/v2/files/AlphaGetMetadataError;->propertiesErrorValue:Lcom/dropbox/core/v2/fileproperties/LookUpPropertiesError;

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v0, 0x1

    aput-object v1, v3, v0

    const/4 v0, 0x2

    aput-object v2, v3, v0

    invoke-static {v3}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    .line 203
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v1, v0

    return v1
.end method

.method public isPath()Z
    .locals 2

    .line 111
    iget-object v0, p0, Lcom/dropbox/core/v2/files/AlphaGetMetadataError;->_tag:Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Tag;->PATH:Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isPropertiesError()Z
    .locals 2

    .line 157
    iget-object v0, p0, Lcom/dropbox/core/v2/files/AlphaGetMetadataError;->_tag:Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Tag;->PROPERTIES_ERROR:Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Tag;
    .locals 1

    .line 100
    iget-object v0, p0, Lcom/dropbox/core/v2/files/AlphaGetMetadataError;->_tag:Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 236
    sget-object v0, Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 248
    sget-object v0, Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/AlphaGetMetadataError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
