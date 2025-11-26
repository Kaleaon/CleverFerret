.class public final Lcom/dropbox/core/v2/files/DeleteError;
.super Ljava/lang/Object;
.source "DeleteError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/DeleteError$Serializer;,
        Lcom/dropbox/core/v2/files/DeleteError$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/files/DeleteError;

.field public static final TOO_MANY_FILES:Lcom/dropbox/core/v2/files/DeleteError;

.field public static final TOO_MANY_WRITE_OPERATIONS:Lcom/dropbox/core/v2/files/DeleteError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/files/DeleteError$Tag;

.field private pathLookupValue:Lcom/dropbox/core/v2/files/LookupError;

.field private pathWriteValue:Lcom/dropbox/core/v2/files/WriteError;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 63
    new-instance v0, Lcom/dropbox/core/v2/files/DeleteError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/DeleteError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/DeleteError$Tag;->TOO_MANY_WRITE_OPERATIONS:Lcom/dropbox/core/v2/files/DeleteError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/DeleteError;->withTag(Lcom/dropbox/core/v2/files/DeleteError$Tag;)Lcom/dropbox/core/v2/files/DeleteError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/DeleteError;->TOO_MANY_WRITE_OPERATIONS:Lcom/dropbox/core/v2/files/DeleteError;

    .line 67
    new-instance v0, Lcom/dropbox/core/v2/files/DeleteError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/DeleteError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/DeleteError$Tag;->TOO_MANY_FILES:Lcom/dropbox/core/v2/files/DeleteError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/DeleteError;->withTag(Lcom/dropbox/core/v2/files/DeleteError$Tag;)Lcom/dropbox/core/v2/files/DeleteError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/DeleteError;->TOO_MANY_FILES:Lcom/dropbox/core/v2/files/DeleteError;

    .line 75
    new-instance v0, Lcom/dropbox/core/v2/files/DeleteError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/DeleteError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/DeleteError$Tag;->OTHER:Lcom/dropbox/core/v2/files/DeleteError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/DeleteError;->withTag(Lcom/dropbox/core/v2/files/DeleteError$Tag;)Lcom/dropbox/core/v2/files/DeleteError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/DeleteError;->OTHER:Lcom/dropbox/core/v2/files/DeleteError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/files/DeleteError;)Lcom/dropbox/core/v2/files/LookupError;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/files/DeleteError;->pathLookupValue:Lcom/dropbox/core/v2/files/LookupError;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/files/DeleteError;)Lcom/dropbox/core/v2/files/WriteError;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/files/DeleteError;->pathWriteValue:Lcom/dropbox/core/v2/files/WriteError;

    return-object p0
.end method

.method public static pathLookup(Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/DeleteError;
    .locals 2

    if-eqz p0, :cond_0

    .line 174
    new-instance v0, Lcom/dropbox/core/v2/files/DeleteError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/DeleteError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/DeleteError$Tag;->PATH_LOOKUP:Lcom/dropbox/core/v2/files/DeleteError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/DeleteError;->withTagAndPathLookup(Lcom/dropbox/core/v2/files/DeleteError$Tag;Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/DeleteError;

    move-result-object p0

    return-object p0

    .line 172
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static pathWrite(Lcom/dropbox/core/v2/files/WriteError;)Lcom/dropbox/core/v2/files/DeleteError;
    .locals 2

    if-eqz p0, :cond_0

    .line 220
    new-instance v0, Lcom/dropbox/core/v2/files/DeleteError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/DeleteError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/DeleteError$Tag;->PATH_WRITE:Lcom/dropbox/core/v2/files/DeleteError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/DeleteError;->withTagAndPathWrite(Lcom/dropbox/core/v2/files/DeleteError$Tag;Lcom/dropbox/core/v2/files/WriteError;)Lcom/dropbox/core/v2/files/DeleteError;

    move-result-object p0

    return-object p0

    .line 218
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/files/DeleteError$Tag;)Lcom/dropbox/core/v2/files/DeleteError;
    .locals 1

    .line 93
    new-instance v0, Lcom/dropbox/core/v2/files/DeleteError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/DeleteError;-><init>()V

    .line 94
    iput-object p1, v0, Lcom/dropbox/core/v2/files/DeleteError;->_tag:Lcom/dropbox/core/v2/files/DeleteError$Tag;

    return-object v0
.end method

.method private withTagAndPathLookup(Lcom/dropbox/core/v2/files/DeleteError$Tag;Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/DeleteError;
    .locals 1

    .line 107
    new-instance v0, Lcom/dropbox/core/v2/files/DeleteError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/DeleteError;-><init>()V

    .line 108
    iput-object p1, v0, Lcom/dropbox/core/v2/files/DeleteError;->_tag:Lcom/dropbox/core/v2/files/DeleteError$Tag;

    .line 109
    iput-object p2, v0, Lcom/dropbox/core/v2/files/DeleteError;->pathLookupValue:Lcom/dropbox/core/v2/files/LookupError;

    return-object v0
.end method

.method private withTagAndPathWrite(Lcom/dropbox/core/v2/files/DeleteError$Tag;Lcom/dropbox/core/v2/files/WriteError;)Lcom/dropbox/core/v2/files/DeleteError;
    .locals 1

    .line 122
    new-instance v0, Lcom/dropbox/core/v2/files/DeleteError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/DeleteError;-><init>()V

    .line 123
    iput-object p1, v0, Lcom/dropbox/core/v2/files/DeleteError;->_tag:Lcom/dropbox/core/v2/files/DeleteError$Tag;

    .line 124
    iput-object p2, v0, Lcom/dropbox/core/v2/files/DeleteError;->pathWriteValue:Lcom/dropbox/core/v2/files/WriteError;

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

    .line 289
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/files/DeleteError;

    if-eqz v2, :cond_a

    .line 290
    check-cast p1, Lcom/dropbox/core/v2/files/DeleteError;

    .line 291
    iget-object v2, p0, Lcom/dropbox/core/v2/files/DeleteError;->_tag:Lcom/dropbox/core/v2/files/DeleteError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/DeleteError;->_tag:Lcom/dropbox/core/v2/files/DeleteError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 294
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/files/DeleteError$1;->$SwitchMap$com$dropbox$core$v2$files$DeleteError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/files/DeleteError;->_tag:Lcom/dropbox/core/v2/files/DeleteError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/files/DeleteError$Tag;->ordinal()I

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

    .line 298
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/files/DeleteError;->pathWriteValue:Lcom/dropbox/core/v2/files/WriteError;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/DeleteError;->pathWriteValue:Lcom/dropbox/core/v2/files/WriteError;

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

    .line 296
    :cond_7
    iget-object v2, p0, Lcom/dropbox/core/v2/files/DeleteError;->pathLookupValue:Lcom/dropbox/core/v2/files/LookupError;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/DeleteError;->pathLookupValue:Lcom/dropbox/core/v2/files/LookupError;

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

    .line 186
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DeleteError;->_tag:Lcom/dropbox/core/v2/files/DeleteError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/DeleteError$Tag;->PATH_LOOKUP:Lcom/dropbox/core/v2/files/DeleteError$Tag;

    if-ne v0, v1, :cond_0

    .line 189
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DeleteError;->pathLookupValue:Lcom/dropbox/core/v2/files/LookupError;

    return-object v0

    .line 187
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.PATH_LOOKUP, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/DeleteError;->_tag:Lcom/dropbox/core/v2/files/DeleteError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/DeleteError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getPathWriteValue()Lcom/dropbox/core/v2/files/WriteError;
    .locals 3

    .line 232
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DeleteError;->_tag:Lcom/dropbox/core/v2/files/DeleteError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/DeleteError$Tag;->PATH_WRITE:Lcom/dropbox/core/v2/files/DeleteError$Tag;

    if-ne v0, v1, :cond_0

    .line 235
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DeleteError;->pathWriteValue:Lcom/dropbox/core/v2/files/WriteError;

    return-object v0

    .line 233
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.PATH_WRITE, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/DeleteError;->_tag:Lcom/dropbox/core/v2/files/DeleteError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/DeleteError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 5

    .line 273
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DeleteError;->_tag:Lcom/dropbox/core/v2/files/DeleteError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/DeleteError;->pathLookupValue:Lcom/dropbox/core/v2/files/LookupError;

    iget-object v2, p0, Lcom/dropbox/core/v2/files/DeleteError;->pathWriteValue:Lcom/dropbox/core/v2/files/WriteError;

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

.method public isOther()Z
    .locals 2

    .line 268
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DeleteError;->_tag:Lcom/dropbox/core/v2/files/DeleteError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/DeleteError$Tag;->OTHER:Lcom/dropbox/core/v2/files/DeleteError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isPathLookup()Z
    .locals 2

    .line 154
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DeleteError;->_tag:Lcom/dropbox/core/v2/files/DeleteError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/DeleteError$Tag;->PATH_LOOKUP:Lcom/dropbox/core/v2/files/DeleteError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isPathWrite()Z
    .locals 2

    .line 200
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DeleteError;->_tag:Lcom/dropbox/core/v2/files/DeleteError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/DeleteError$Tag;->PATH_WRITE:Lcom/dropbox/core/v2/files/DeleteError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTooManyFiles()Z
    .locals 2

    .line 257
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DeleteError;->_tag:Lcom/dropbox/core/v2/files/DeleteError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/DeleteError$Tag;->TOO_MANY_FILES:Lcom/dropbox/core/v2/files/DeleteError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTooManyWriteOperations()Z
    .locals 2

    .line 246
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DeleteError;->_tag:Lcom/dropbox/core/v2/files/DeleteError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/DeleteError$Tag;->TOO_MANY_WRITE_OPERATIONS:Lcom/dropbox/core/v2/files/DeleteError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/files/DeleteError$Tag;
    .locals 1

    .line 143
    iget-object v0, p0, Lcom/dropbox/core/v2/files/DeleteError;->_tag:Lcom/dropbox/core/v2/files/DeleteError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 316
    sget-object v0, Lcom/dropbox/core/v2/files/DeleteError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/DeleteError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/DeleteError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 328
    sget-object v0, Lcom/dropbox/core/v2/files/DeleteError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/DeleteError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/DeleteError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
