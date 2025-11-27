.class public final Lcom/dropbox/core/v2/files/AddTagError;
.super Ljava/lang/Object;
.source "AddTagError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/AddTagError$Serializer;,
        Lcom/dropbox/core/v2/files/AddTagError$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/files/AddTagError;

.field public static final TOO_MANY_TAGS:Lcom/dropbox/core/v2/files/AddTagError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/files/AddTagError$Tag;

.field private pathValue:Lcom/dropbox/core/v2/files/LookupError;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 55
    new-instance v0, Lcom/dropbox/core/v2/files/AddTagError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/AddTagError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/AddTagError$Tag;->OTHER:Lcom/dropbox/core/v2/files/AddTagError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/AddTagError;->withTag(Lcom/dropbox/core/v2/files/AddTagError$Tag;)Lcom/dropbox/core/v2/files/AddTagError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/AddTagError;->OTHER:Lcom/dropbox/core/v2/files/AddTagError;

    .line 59
    new-instance v0, Lcom/dropbox/core/v2/files/AddTagError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/AddTagError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/AddTagError$Tag;->TOO_MANY_TAGS:Lcom/dropbox/core/v2/files/AddTagError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/AddTagError;->withTag(Lcom/dropbox/core/v2/files/AddTagError$Tag;)Lcom/dropbox/core/v2/files/AddTagError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/AddTagError;->TOO_MANY_TAGS:Lcom/dropbox/core/v2/files/AddTagError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/files/AddTagError;)Lcom/dropbox/core/v2/files/LookupError;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/dropbox/core/v2/files/AddTagError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    return-object p0
.end method

.method public static path(Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/AddTagError;
    .locals 2

    if-eqz p0, :cond_0

    .line 139
    new-instance v0, Lcom/dropbox/core/v2/files/AddTagError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/AddTagError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/AddTagError$Tag;->PATH:Lcom/dropbox/core/v2/files/AddTagError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/AddTagError;->withTagAndPath(Lcom/dropbox/core/v2/files/AddTagError$Tag;Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/AddTagError;

    move-result-object p0

    return-object p0

    .line 137
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/files/AddTagError$Tag;)Lcom/dropbox/core/v2/files/AddTagError;
    .locals 1

    .line 76
    new-instance v0, Lcom/dropbox/core/v2/files/AddTagError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/AddTagError;-><init>()V

    .line 77
    iput-object p1, v0, Lcom/dropbox/core/v2/files/AddTagError;->_tag:Lcom/dropbox/core/v2/files/AddTagError$Tag;

    return-object v0
.end method

.method private withTagAndPath(Lcom/dropbox/core/v2/files/AddTagError$Tag;Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/AddTagError;
    .locals 1

    .line 90
    new-instance v0, Lcom/dropbox/core/v2/files/AddTagError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/AddTagError;-><init>()V

    .line 91
    iput-object p1, v0, Lcom/dropbox/core/v2/files/AddTagError;->_tag:Lcom/dropbox/core/v2/files/AddTagError$Tag;

    .line 92
    iput-object p2, v0, Lcom/dropbox/core/v2/files/AddTagError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

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

    .line 197
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/files/AddTagError;

    if-eqz v2, :cond_7

    .line 198
    check-cast p1, Lcom/dropbox/core/v2/files/AddTagError;

    .line 199
    iget-object v2, p0, Lcom/dropbox/core/v2/files/AddTagError;->_tag:Lcom/dropbox/core/v2/files/AddTagError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/AddTagError;->_tag:Lcom/dropbox/core/v2/files/AddTagError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 202
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/files/AddTagError$1;->$SwitchMap$com$dropbox$core$v2$files$AddTagError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/files/AddTagError;->_tag:Lcom/dropbox/core/v2/files/AddTagError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/files/AddTagError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_4

    const/4 p1, 0x2

    if-eq v2, p1, :cond_3

    const/4 p1, 0x3

    if-eq v2, p1, :cond_3

    return v1

    :cond_3
    return v0

    .line 204
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/files/AddTagError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/AddTagError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/LookupError;->equals(Ljava/lang/Object;)Z

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

.method public getPathValue()Lcom/dropbox/core/v2/files/LookupError;
    .locals 3

    .line 151
    iget-object v0, p0, Lcom/dropbox/core/v2/files/AddTagError;->_tag:Lcom/dropbox/core/v2/files/AddTagError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/AddTagError$Tag;->PATH:Lcom/dropbox/core/v2/files/AddTagError$Tag;

    if-ne v0, v1, :cond_0

    .line 154
    iget-object v0, p0, Lcom/dropbox/core/v2/files/AddTagError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    return-object v0

    .line 152
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.PATH, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/AddTagError;->_tag:Lcom/dropbox/core/v2/files/AddTagError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/AddTagError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 181
    iget-object v0, p0, Lcom/dropbox/core/v2/files/AddTagError;->_tag:Lcom/dropbox/core/v2/files/AddTagError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/AddTagError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    .line 185
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v1, v0

    return v1
.end method

.method public isOther()Z
    .locals 2

    .line 165
    iget-object v0, p0, Lcom/dropbox/core/v2/files/AddTagError;->_tag:Lcom/dropbox/core/v2/files/AddTagError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/AddTagError$Tag;->OTHER:Lcom/dropbox/core/v2/files/AddTagError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isPath()Z
    .locals 2

    .line 119
    iget-object v0, p0, Lcom/dropbox/core/v2/files/AddTagError;->_tag:Lcom/dropbox/core/v2/files/AddTagError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/AddTagError$Tag;->PATH:Lcom/dropbox/core/v2/files/AddTagError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTooManyTags()Z
    .locals 2

    .line 176
    iget-object v0, p0, Lcom/dropbox/core/v2/files/AddTagError;->_tag:Lcom/dropbox/core/v2/files/AddTagError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/AddTagError$Tag;->TOO_MANY_TAGS:Lcom/dropbox/core/v2/files/AddTagError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/files/AddTagError$Tag;
    .locals 1

    .line 108
    iget-object v0, p0, Lcom/dropbox/core/v2/files/AddTagError;->_tag:Lcom/dropbox/core/v2/files/AddTagError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 220
    sget-object v0, Lcom/dropbox/core/v2/files/AddTagError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/AddTagError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/AddTagError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 232
    sget-object v0, Lcom/dropbox/core/v2/files/AddTagError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/AddTagError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/AddTagError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
