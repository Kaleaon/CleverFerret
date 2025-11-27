.class public final Lcom/dropbox/core/v2/files/RestoreError;
.super Ljava/lang/Object;
.source "RestoreError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/RestoreError$Serializer;,
        Lcom/dropbox/core/v2/files/RestoreError$Tag;
    }
.end annotation


# static fields
.field public static final INVALID_REVISION:Lcom/dropbox/core/v2/files/RestoreError;

.field public static final IN_PROGRESS:Lcom/dropbox/core/v2/files/RestoreError;

.field public static final OTHER:Lcom/dropbox/core/v2/files/RestoreError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/files/RestoreError$Tag;

.field private pathLookupValue:Lcom/dropbox/core/v2/files/LookupError;

.field private pathWriteValue:Lcom/dropbox/core/v2/files/WriteError;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 67
    new-instance v0, Lcom/dropbox/core/v2/files/RestoreError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RestoreError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/RestoreError$Tag;->INVALID_REVISION:Lcom/dropbox/core/v2/files/RestoreError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/RestoreError;->withTag(Lcom/dropbox/core/v2/files/RestoreError$Tag;)Lcom/dropbox/core/v2/files/RestoreError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/RestoreError;->INVALID_REVISION:Lcom/dropbox/core/v2/files/RestoreError;

    .line 71
    new-instance v0, Lcom/dropbox/core/v2/files/RestoreError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RestoreError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/RestoreError$Tag;->IN_PROGRESS:Lcom/dropbox/core/v2/files/RestoreError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/RestoreError;->withTag(Lcom/dropbox/core/v2/files/RestoreError$Tag;)Lcom/dropbox/core/v2/files/RestoreError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/RestoreError;->IN_PROGRESS:Lcom/dropbox/core/v2/files/RestoreError;

    .line 79
    new-instance v0, Lcom/dropbox/core/v2/files/RestoreError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RestoreError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/RestoreError$Tag;->OTHER:Lcom/dropbox/core/v2/files/RestoreError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/RestoreError;->withTag(Lcom/dropbox/core/v2/files/RestoreError$Tag;)Lcom/dropbox/core/v2/files/RestoreError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/RestoreError;->OTHER:Lcom/dropbox/core/v2/files/RestoreError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/files/RestoreError;)Lcom/dropbox/core/v2/files/LookupError;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/files/RestoreError;->pathLookupValue:Lcom/dropbox/core/v2/files/LookupError;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/files/RestoreError;)Lcom/dropbox/core/v2/files/WriteError;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/files/RestoreError;->pathWriteValue:Lcom/dropbox/core/v2/files/WriteError;

    return-object p0
.end method

.method public static pathLookup(Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/RestoreError;
    .locals 2

    if-eqz p0, :cond_0

    .line 180
    new-instance v0, Lcom/dropbox/core/v2/files/RestoreError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RestoreError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/RestoreError$Tag;->PATH_LOOKUP:Lcom/dropbox/core/v2/files/RestoreError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/RestoreError;->withTagAndPathLookup(Lcom/dropbox/core/v2/files/RestoreError$Tag;Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/RestoreError;

    move-result-object p0

    return-object p0

    .line 178
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static pathWrite(Lcom/dropbox/core/v2/files/WriteError;)Lcom/dropbox/core/v2/files/RestoreError;
    .locals 2

    if-eqz p0, :cond_0

    .line 228
    new-instance v0, Lcom/dropbox/core/v2/files/RestoreError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RestoreError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/RestoreError$Tag;->PATH_WRITE:Lcom/dropbox/core/v2/files/RestoreError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/RestoreError;->withTagAndPathWrite(Lcom/dropbox/core/v2/files/RestoreError$Tag;Lcom/dropbox/core/v2/files/WriteError;)Lcom/dropbox/core/v2/files/RestoreError;

    move-result-object p0

    return-object p0

    .line 226
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/files/RestoreError$Tag;)Lcom/dropbox/core/v2/files/RestoreError;
    .locals 1

    .line 97
    new-instance v0, Lcom/dropbox/core/v2/files/RestoreError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RestoreError;-><init>()V

    .line 98
    iput-object p1, v0, Lcom/dropbox/core/v2/files/RestoreError;->_tag:Lcom/dropbox/core/v2/files/RestoreError$Tag;

    return-object v0
.end method

.method private withTagAndPathLookup(Lcom/dropbox/core/v2/files/RestoreError$Tag;Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/RestoreError;
    .locals 1

    .line 112
    new-instance v0, Lcom/dropbox/core/v2/files/RestoreError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RestoreError;-><init>()V

    .line 113
    iput-object p1, v0, Lcom/dropbox/core/v2/files/RestoreError;->_tag:Lcom/dropbox/core/v2/files/RestoreError$Tag;

    .line 114
    iput-object p2, v0, Lcom/dropbox/core/v2/files/RestoreError;->pathLookupValue:Lcom/dropbox/core/v2/files/LookupError;

    return-object v0
.end method

.method private withTagAndPathWrite(Lcom/dropbox/core/v2/files/RestoreError$Tag;Lcom/dropbox/core/v2/files/WriteError;)Lcom/dropbox/core/v2/files/RestoreError;
    .locals 1

    .line 128
    new-instance v0, Lcom/dropbox/core/v2/files/RestoreError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/RestoreError;-><init>()V

    .line 129
    iput-object p1, v0, Lcom/dropbox/core/v2/files/RestoreError;->_tag:Lcom/dropbox/core/v2/files/RestoreError$Tag;

    .line 130
    iput-object p2, v0, Lcom/dropbox/core/v2/files/RestoreError;->pathWriteValue:Lcom/dropbox/core/v2/files/WriteError;

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

    .line 299
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/files/RestoreError;

    if-eqz v2, :cond_a

    .line 300
    check-cast p1, Lcom/dropbox/core/v2/files/RestoreError;

    .line 301
    iget-object v2, p0, Lcom/dropbox/core/v2/files/RestoreError;->_tag:Lcom/dropbox/core/v2/files/RestoreError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/RestoreError;->_tag:Lcom/dropbox/core/v2/files/RestoreError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 304
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/files/RestoreError$1;->$SwitchMap$com$dropbox$core$v2$files$RestoreError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/files/RestoreError;->_tag:Lcom/dropbox/core/v2/files/RestoreError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/files/RestoreError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_7

    const/4 v3, 0x2

    if-eq v2, v3, :cond_4

    const/4 p1, 0x3

    if-eq v2, p1, :cond_3

    const/4 p1, 0x4

    if-eq v2, p1, :cond_3

    const/4 p1, 0x5

    if-eq v2, p1, :cond_3

    return v1

    :cond_3
    return v0

    .line 308
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/files/RestoreError;->pathWriteValue:Lcom/dropbox/core/v2/files/WriteError;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/RestoreError;->pathWriteValue:Lcom/dropbox/core/v2/files/WriteError;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/WriteError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_0
    return v0

    .line 306
    :cond_7
    iget-object v2, p0, Lcom/dropbox/core/v2/files/RestoreError;->pathLookupValue:Lcom/dropbox/core/v2/files/LookupError;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/RestoreError;->pathLookupValue:Lcom/dropbox/core/v2/files/LookupError;

    if-eq v2, p1, :cond_9

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/LookupError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_8

    goto :goto_1

    :cond_8
    return v1

    :cond_9
    :goto_1
    return v0

    :cond_a
    return v1
.end method

.method public getPathLookupValue()Lcom/dropbox/core/v2/files/LookupError;
    .locals 3

    .line 194
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RestoreError;->_tag:Lcom/dropbox/core/v2/files/RestoreError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RestoreError$Tag;->PATH_LOOKUP:Lcom/dropbox/core/v2/files/RestoreError$Tag;

    if-ne v0, v1, :cond_0

    .line 197
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RestoreError;->pathLookupValue:Lcom/dropbox/core/v2/files/LookupError;

    return-object v0

    .line 195
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.PATH_LOOKUP, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/RestoreError;->_tag:Lcom/dropbox/core/v2/files/RestoreError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/RestoreError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getPathWriteValue()Lcom/dropbox/core/v2/files/WriteError;
    .locals 3

    .line 242
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RestoreError;->_tag:Lcom/dropbox/core/v2/files/RestoreError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RestoreError$Tag;->PATH_WRITE:Lcom/dropbox/core/v2/files/RestoreError$Tag;

    if-ne v0, v1, :cond_0

    .line 245
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RestoreError;->pathWriteValue:Lcom/dropbox/core/v2/files/WriteError;

    return-object v0

    .line 243
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.PATH_WRITE, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/RestoreError;->_tag:Lcom/dropbox/core/v2/files/RestoreError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/RestoreError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 5

    .line 283
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RestoreError;->_tag:Lcom/dropbox/core/v2/files/RestoreError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/RestoreError;->pathLookupValue:Lcom/dropbox/core/v2/files/LookupError;

    iget-object v2, p0, Lcom/dropbox/core/v2/files/RestoreError;->pathWriteValue:Lcom/dropbox/core/v2/files/WriteError;

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

    return v0
.end method

.method public isInProgress()Z
    .locals 2

    .line 267
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RestoreError;->_tag:Lcom/dropbox/core/v2/files/RestoreError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RestoreError$Tag;->IN_PROGRESS:Lcom/dropbox/core/v2/files/RestoreError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isInvalidRevision()Z
    .locals 2

    .line 256
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RestoreError;->_tag:Lcom/dropbox/core/v2/files/RestoreError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RestoreError$Tag;->INVALID_REVISION:Lcom/dropbox/core/v2/files/RestoreError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 278
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RestoreError;->_tag:Lcom/dropbox/core/v2/files/RestoreError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RestoreError$Tag;->OTHER:Lcom/dropbox/core/v2/files/RestoreError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isPathLookup()Z
    .locals 2

    .line 160
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RestoreError;->_tag:Lcom/dropbox/core/v2/files/RestoreError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RestoreError$Tag;->PATH_LOOKUP:Lcom/dropbox/core/v2/files/RestoreError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isPathWrite()Z
    .locals 2

    .line 208
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RestoreError;->_tag:Lcom/dropbox/core/v2/files/RestoreError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/RestoreError$Tag;->PATH_WRITE:Lcom/dropbox/core/v2/files/RestoreError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/files/RestoreError$Tag;
    .locals 1

    .line 149
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RestoreError;->_tag:Lcom/dropbox/core/v2/files/RestoreError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 326
    sget-object v0, Lcom/dropbox/core/v2/files/RestoreError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/RestoreError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/RestoreError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 338
    sget-object v0, Lcom/dropbox/core/v2/files/RestoreError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/RestoreError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/RestoreError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
