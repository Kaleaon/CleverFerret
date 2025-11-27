.class public final Lcom/dropbox/core/v2/files/SearchError;
.super Ljava/lang/Object;
.source "SearchError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/SearchError$Serializer;,
        Lcom/dropbox/core/v2/files/SearchError$Tag;
    }
.end annotation


# static fields
.field public static final INTERNAL_ERROR:Lcom/dropbox/core/v2/files/SearchError;

.field public static final OTHER:Lcom/dropbox/core/v2/files/SearchError;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/files/SearchError$Tag;

.field private invalidArgumentValue:Ljava/lang/String;

.field private pathValue:Lcom/dropbox/core/v2/files/LookupError;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 56
    new-instance v0, Lcom/dropbox/core/v2/files/SearchError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/SearchError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/SearchError$Tag;->INTERNAL_ERROR:Lcom/dropbox/core/v2/files/SearchError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/SearchError;->withTag(Lcom/dropbox/core/v2/files/SearchError$Tag;)Lcom/dropbox/core/v2/files/SearchError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/SearchError;->INTERNAL_ERROR:Lcom/dropbox/core/v2/files/SearchError;

    .line 64
    new-instance v0, Lcom/dropbox/core/v2/files/SearchError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/SearchError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/SearchError$Tag;->OTHER:Lcom/dropbox/core/v2/files/SearchError$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/files/SearchError;->withTag(Lcom/dropbox/core/v2/files/SearchError$Tag;)Lcom/dropbox/core/v2/files/SearchError;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/files/SearchError;->OTHER:Lcom/dropbox/core/v2/files/SearchError;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/files/SearchError;)Lcom/dropbox/core/v2/files/LookupError;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/files/SearchError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/files/SearchError;)Ljava/lang/String;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/files/SearchError;->invalidArgumentValue:Ljava/lang/String;

    return-object p0
.end method

.method public static invalidArgument()Lcom/dropbox/core/v2/files/SearchError;
    .locals 1

    const/4 v0, 0x0

    .line 213
    invoke-static {v0}, Lcom/dropbox/core/v2/files/SearchError;->invalidArgument(Ljava/lang/String;)Lcom/dropbox/core/v2/files/SearchError;

    move-result-object v0

    return-object v0
.end method

.method public static invalidArgument(Ljava/lang/String;)Lcom/dropbox/core/v2/files/SearchError;
    .locals 2

    .line 200
    new-instance v0, Lcom/dropbox/core/v2/files/SearchError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/SearchError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/SearchError$Tag;->INVALID_ARGUMENT:Lcom/dropbox/core/v2/files/SearchError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/SearchError;->withTagAndInvalidArgument(Lcom/dropbox/core/v2/files/SearchError$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/files/SearchError;

    move-result-object p0

    return-object p0
.end method

.method public static path(Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/SearchError;
    .locals 2

    if-eqz p0, :cond_0

    .line 159
    new-instance v0, Lcom/dropbox/core/v2/files/SearchError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/SearchError;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/files/SearchError$Tag;->PATH:Lcom/dropbox/core/v2/files/SearchError$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/files/SearchError;->withTagAndPath(Lcom/dropbox/core/v2/files/SearchError$Tag;Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/SearchError;

    move-result-object p0

    return-object p0

    .line 157
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/files/SearchError$Tag;)Lcom/dropbox/core/v2/files/SearchError;
    .locals 1

    .line 82
    new-instance v0, Lcom/dropbox/core/v2/files/SearchError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/SearchError;-><init>()V

    .line 83
    iput-object p1, v0, Lcom/dropbox/core/v2/files/SearchError;->_tag:Lcom/dropbox/core/v2/files/SearchError$Tag;

    return-object v0
.end method

.method private withTagAndInvalidArgument(Lcom/dropbox/core/v2/files/SearchError$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/files/SearchError;
    .locals 1

    .line 107
    new-instance v0, Lcom/dropbox/core/v2/files/SearchError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/SearchError;-><init>()V

    .line 108
    iput-object p1, v0, Lcom/dropbox/core/v2/files/SearchError;->_tag:Lcom/dropbox/core/v2/files/SearchError$Tag;

    .line 109
    iput-object p2, v0, Lcom/dropbox/core/v2/files/SearchError;->invalidArgumentValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndPath(Lcom/dropbox/core/v2/files/SearchError$Tag;Lcom/dropbox/core/v2/files/LookupError;)Lcom/dropbox/core/v2/files/SearchError;
    .locals 1

    .line 96
    new-instance v0, Lcom/dropbox/core/v2/files/SearchError;

    invoke-direct {v0}, Lcom/dropbox/core/v2/files/SearchError;-><init>()V

    .line 97
    iput-object p1, v0, Lcom/dropbox/core/v2/files/SearchError;->_tag:Lcom/dropbox/core/v2/files/SearchError$Tag;

    .line 98
    iput-object p2, v0, Lcom/dropbox/core/v2/files/SearchError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

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

    .line 272
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/files/SearchError;

    if-eqz v2, :cond_a

    .line 273
    check-cast p1, Lcom/dropbox/core/v2/files/SearchError;

    .line 274
    iget-object v2, p0, Lcom/dropbox/core/v2/files/SearchError;->_tag:Lcom/dropbox/core/v2/files/SearchError$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/SearchError;->_tag:Lcom/dropbox/core/v2/files/SearchError$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 277
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/files/SearchError$1;->$SwitchMap$com$dropbox$core$v2$files$SearchError$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/files/SearchError;->_tag:Lcom/dropbox/core/v2/files/SearchError$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/files/SearchError$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_7

    const/4 v3, 0x2

    if-eq v2, v3, :cond_4

    const/4 p1, 0x3

    if-eq v2, p1, :cond_3

    const/4 p1, 0x4

    if-eq v2, p1, :cond_3

    return v1

    :cond_3
    return v0

    .line 281
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/files/SearchError;->invalidArgumentValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/SearchError;->invalidArgumentValue:Ljava/lang/String;

    if-eq v2, p1, :cond_6

    if-eqz v2, :cond_5

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_0
    return v0

    .line 279
    :cond_7
    iget-object v2, p0, Lcom/dropbox/core/v2/files/SearchError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/SearchError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

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

.method public getInvalidArgumentValue()Ljava/lang/String;
    .locals 3

    .line 226
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SearchError;->_tag:Lcom/dropbox/core/v2/files/SearchError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/SearchError$Tag;->INVALID_ARGUMENT:Lcom/dropbox/core/v2/files/SearchError$Tag;

    if-ne v0, v1, :cond_0

    .line 229
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SearchError;->invalidArgumentValue:Ljava/lang/String;

    return-object v0

    .line 227
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.INVALID_ARGUMENT, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/SearchError;->_tag:Lcom/dropbox/core/v2/files/SearchError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/SearchError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getPathValue()Lcom/dropbox/core/v2/files/LookupError;
    .locals 3

    .line 171
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SearchError;->_tag:Lcom/dropbox/core/v2/files/SearchError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/SearchError$Tag;->PATH:Lcom/dropbox/core/v2/files/SearchError$Tag;

    if-ne v0, v1, :cond_0

    .line 174
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SearchError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    return-object v0

    .line 172
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.PATH, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/files/SearchError;->_tag:Lcom/dropbox/core/v2/files/SearchError$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/files/SearchError$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 5

    .line 256
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SearchError;->_tag:Lcom/dropbox/core/v2/files/SearchError$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/SearchError;->pathValue:Lcom/dropbox/core/v2/files/LookupError;

    iget-object v2, p0, Lcom/dropbox/core/v2/files/SearchError;->invalidArgumentValue:Ljava/lang/String;

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

.method public isInternalError()Z
    .locals 2

    .line 240
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SearchError;->_tag:Lcom/dropbox/core/v2/files/SearchError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/SearchError$Tag;->INTERNAL_ERROR:Lcom/dropbox/core/v2/files/SearchError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isInvalidArgument()Z
    .locals 2

    .line 185
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SearchError;->_tag:Lcom/dropbox/core/v2/files/SearchError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/SearchError$Tag;->INVALID_ARGUMENT:Lcom/dropbox/core/v2/files/SearchError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 251
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SearchError;->_tag:Lcom/dropbox/core/v2/files/SearchError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/SearchError$Tag;->OTHER:Lcom/dropbox/core/v2/files/SearchError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isPath()Z
    .locals 2

    .line 139
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SearchError;->_tag:Lcom/dropbox/core/v2/files/SearchError$Tag;

    sget-object v1, Lcom/dropbox/core/v2/files/SearchError$Tag;->PATH:Lcom/dropbox/core/v2/files/SearchError$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/files/SearchError$Tag;
    .locals 1

    .line 128
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SearchError;->_tag:Lcom/dropbox/core/v2/files/SearchError$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 297
    sget-object v0, Lcom/dropbox/core/v2/files/SearchError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/SearchError$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/SearchError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 309
    sget-object v0, Lcom/dropbox/core/v2/files/SearchError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/SearchError$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/SearchError$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
